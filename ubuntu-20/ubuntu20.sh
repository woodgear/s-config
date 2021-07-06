#!/bin/bash                                                                     
set -e # exit when error
set -x # echo on
# make sure apt proxy
echo 'Acquire {
  HTTP::proxy "http://127.0.0.1:20172";
  HTTPS::proxy "http://127.0.0.1:20172";
}' |sudo tee  /etc/apt/apt.conf.d/proxy.conf
export http_proxy=http://127.0.0.1:20172
export https_proxy=http://127.0.0.1:20172
ME=$(who|head -n 1 | awk '{print $1}')
HOME=/home/${ME}
cd ${HOME}/sm/pv/s-config
export S_CONFIG_DIR=$(pwd)
  






sudo apt update
sudo apt install curl -y 
sudo apt install tree -y 
sudo apt install gcc  g++ make perl -y 
sudo apt install git -y 
sudo apt install hashalot -y   # for sha256 etc
sudo apt install gdebi-core -y   # install deb
sudo apt install openjdk-11-jdk -y  
sudo apt install autojump -y
sudo apt install cmake -y 
sudo apt install graphviz -y 
sudo apt install graphviz -y 
sudo apt install apache2-utils -y
sudo apt install xclip -y 
sudo apt install xsel -y 
sudo apt install aria2 -y 
sudo apt install nfs-common -y 
sudo apt install ncat -y 
sudo apt install wmctrl -y 
sudo apt install net-tools -y 
sudo apt install baobab -y  
sudo apt install openssh-server -y 
sudo apt install android-tools-adb -y 

sudo systemctl enable ssh 
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y 
sudo apt update 
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y 
sudo add-apt-repository ppa:mc3man/mpv-tests -y 
sudo apt-get update 
sudo apt install mpv -y 
sudo apt-get install fzf -y
sudo apt install thefuck -y 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 
sudo apt-add-repository https://cli.github.com/packages -y 
sudo apt update 

sudo add-apt-repository ppa:peek-developers/stable -y 
sudo apt update 
sudo apt install peek -y

sudo apt install jq -y 

# conky
sudo apt install conky -y 

# bpf
sudo apt install sysstat -y  
sudo apt-get install guake -y

# bpftool
sudo apt install linux-tools-common -y  
sudo apt-get install bpfcc-tools linux-headers-$(uname -r) -y 
sudo apt-get install bpftrace -y 
# install wrk
cd ~/sm/lab
git clone https://github.com/wg/wrk.git
make

# gh
sudo apt install gh -y 
gh alias set cpr 'pr create -f'
gh alias set --shell see "gh pr list |cat|tail |awk '{print \$1}' | xargs -I {} sh -c 'echo {} gh pr diff {}'"
gh alias set --shell  mg 'gh pr review $1 -a  gh pr merge $1 -d -r'

# caps2esc

sudo apt install libyaml-cpp-dev  -y 
sudo apt install libevdev-dev  -y  
sudo apt install libudev-dev  -y  
sudo apt install build-essential libboost-system-dev libboost-thread-dev libboost-program-options-dev libboost-test-dev -y 
rm -rf caps2esc
mkdir caps2esc
cd caps2esc
git clone https://gitlab.com/interception/linux/plugins/caps2esc.git
cd caps2esc 
mkdir build
cd build
cmake ..
make
sudo make install

echo '- JOB: "intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]'| sudo tee /etc/udevmon.yaml

echo '[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/local/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/udevmon.service

cd ../../

git clone https://gitlab.com/interception/linux/tools.git
cd tools
mkdir build
cd build
cmake ..
make
sudo make install

sudo systemctl enable --now udevmon
# sudo systemctl status  udevmon --no-block
cd ../../../
rm -rf caps2esc/


# docker-compose
wget -e use_proxy=on -e http_proxy=http://127.0.0.1:20172 -e https_proxy=http://127.0.0.1:20172  https://github.com/docker/compose/releases/download/1.29.1/docker-compose-Linux-x86_64
sudo mv ./docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
sudo chmod a+x  /usr/local/bin/docker-compose

# go
sudo rm -rf ~/.gvm
curl --socks5 127.0.0.1:20170 -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer  >./gvm.sh
# echo "sudo rm -rf ~/.gvm &&  bash ./gvm.sh" |bash
chmod a+x ./gvm.sh
./gvm.sh
export GVM_ROOT=~/.gvm
. $GVM_ROOT/scripts/gvm-default

sudo apt install bison -y
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.5 --binary
gvm use go1.5 --default
latest_go=$(gvm listall|grep go |tail -n 1|tr -d '\n')
gvm install $latest_go --binary
gvm use $latest_go --default
sudo chmod a+rwx -R ~/.gvm 
sudo chmod -R a+rwx ~/.cache 

# rust
curl  --socks5 127.0.0.1:20170  https://sh.rustup.rs >./rust-installer.sh
chmod a+x ./rust-installer.sh
./rust-installer.sh --default-host x86_64-unknown-linux-gnu  --default-toolchain nightly --profile default -v -y
rm -rf ./rust-installer.sh

source $HOME/.cargo/env
rustup update

sudo apt install libssl-dev
cargo install ripgrep
cargo install fd-find
cargo install cargo-edit
cargo install starship
# rust-analyzer
rustup component add rust-src
sudo curl --socks5 127.0.0.1:20170 -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o /usr/local/bin/rust-analyzer
sudo chmod a+x  /usr/local/bin/rust-analyzer
# node
sudo apt install npm -y
sudo npm install -g n
sudo n latest
sudo npm install -g typescript
sudo npm install -g npm-check-updates
sudo npm install cnpm -g --registry=https://r.npm.taobao.org

# python
sudo apt install python3-pip -y
# qemu kvm 
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y

# zeal
 sudo apt install zeal -y

# increase file watch limit
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf  sudo sysctl -p

# tmux
sudo apt  install tmux -y
ln -s $S_CONFIG_DIR/ubuntu-20/tmux.conf $HOME/.tmux.conf
# copyq
sudo add-apt-repository ppa:hluk/copyq -y
sudo apt update
sudo apt install copyq -y

# Indicator Stickynotes 便签
sudo add-apt-repository ppa:umang/indicator-stickynotes -y
sudo apt-get update 
sudo apt-get install indicator-stickynotes -y

# indicator-sysmonitor
mkdir ${HOME}/scripts
echo 'wall_status=""
wall_status=$(curl -m 3 -I  --socks5 127.0.0.1:20170  -s  -o /dev/null -w "%{time_total}  code:%{http_code}" www.google.com)
ret=$?
if [ $ret -ne 0 ]; then
        echo "been fuck"
else
        echo $wall_status |awk "{print \$1}"
fi' > ${HOME}/sm/scripts/wall.sh
chmod a+x ${HOME}/scripts/wall.sh

sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor -y
ln -s ${HOME}/sm/pv/s-config/ubuntu-20/indicator-sysmonitor.json ${HOME}/.indicator-sysmonitor.json
# zsh

mkdir -p ${HOME}/.zsh 

sudo apt install zsh -y 
sudo apt install autojump -y 

git clone https://gitclone.com/github.com/zsh-users/antigen ${HOME}/antigen
# increase max_map_count
echo 'vm.max_map_count=262144' sudo tee /etc/sysctl.conf

sudo curl  --socks5 127.0.0.1:20170  -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose

# espanso
sudo apt update
sudo apt install libxtst6 libxdo3 xclip libnotify-bin
curl -L https://github.com/federico-terzi/espanso/releases/latest/download/espanso-linux.tar.gz | tar -xz -C /tmp/
espanso start
rm -rf ~/.config/espanso
ln -s $S_CONFIG_DIR/espanso ${HOME}/.config

# activitywatch
wget -e use_proxy=on -e http_proxy=http://127.0.0.1:20172 -e https_proxy=http://127.0.0.1:20172   https://github.com/ActivityWatch/activitywatch/releases/download/v0.9.2/activitywatch-v0.9.2-linux-x86_64.zip
unzip activitywatch-v0.9.2-linux-x86_64.zip -d ~/sm/app
rm ${HOME}/.config/autostart/activitywatch.desktop
echo "[Desktop Entry]
Comment=Track everything on your computer.
GenericName=Log what you do on your computer.
Name=ActivityWatch
Exec=${HOME}/sm/app/activitywatch/aw-qt
Hidden=false
StartupNotify=true
Terminal=false
Type=Application
X-GNOME-Autostart-enabled=true
Version=1.0
Icon=activitywatch
Categories=Utility;"  | tee  ${HOME}/.config/autostart/activitywatch.desktop
rm  activitywatch-v0.9.2-linux-x86_64.zip

# 
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -


# fiddle
wget https://downloads.getfiddler.com/linux/fiddler-everywhere-1.6.1.AppImage
# common docker images
docker pull mongo
docker pull redis
docker pull mysql
docker pull nginx

docker pull swaggerapi/swagger-editor:latest

```
# docker run --name swagger-editor -d --restart=always -p 10000:8080 swaggerapi/swagger-editor:latest 
```
# thefuck
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

## kubectl todo
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

# reset go env(sometimes we run this script like sed '1,200d xx|bash')
## init go software
echo -- $ME --
export GVM_ROOT=${HOME}/.gvm
. $GVM_ROOT/scripts/gvm-default

latest_go=$(gvm listall|grep go |tail -n 1|tr -d '\n')

gvm install $latest_go --binary
gvm use $latest_go --default
GO111MODULE="on" go get -v sigs.k8s.io/kind@v0.9.0
HTTPS_PROXY="" HTTP_PROXY="" ALL_PROXY="" kind create cluster --name k-1.16.5 --image kindest/node:v1.16.15@sha256:c10a63a5bda231c0a379bf91aebf8ad3c79146daca59db816fb963f731852a99
HTTPS_PROXY="" HTTP_PROXY="" ALL_PROXY="" kind create cluster --name k-1.20.2 --image kindest/node:v1.20.2@sha256:8f7ea6e7642c0da54f04a7ee10431549c0257315b3a634f6ef2fecaaedb19bab
sudo chmod a+rx ${HOME}/.kube/config

## XMind
#wget https://apprepo.de/appimage/download/xmind -o ~/app/Xmind.AppImage
#chmod +x ~/app/Xmind.Appimage
# ail-cli integrate  ~/app/Xmind.AppImage
## telagram
#wget  https://apprepo.de/appimage/download/telegram -o ~/app/Telegram.AppImage
#chmod +x ~/app/Telegram.AppImage
#ail-cli integrate  ~/app/Telegram.AppImage
## config


ln -s $S_CONFIG_DIR/ubuntu-20/zshrc ~/.zshrc
### vscode 
wget  -e use_proxy=on -e http_proxy=http://127.0.0.1:20172 -e https_proxy=http://127.0.0.1:20172   -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders


sudo -u ${ME} mkdir -p ${HOME}/.config/Code
chmod a+x ./vscode/vscode.sh
sudo -u ${ME} ./vscode/vscode.sh
## init scriptbox
### nvim
sudo apt-get install python3-neovim -y

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ${HOME}/.config/nvim
ln -s $S_CONFIG_DIR/vim/vimrc ${HOME}/.config/nvim/init.vim

### emacs
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update -y
sudo apt install emacs27 -y
sudo -u mkdir -p ~/.emacs.d
sudo -u ln -s $S_CONFIG_DIR/emacs/init.el ${HOME}/.emacs.d/init.el

### conky
sudo apt-get install conky
rm /etc/conky/conky.conf
ln -s $S_CONFIG_DIR/conky/conky.conf /etc/conky/conky.conf

## polar

## wavebox mail client

wget -e use_proxy=on -e http_proxy=http://127.0.0.1:20172 -e https_proxy=http://127.0.0.1:20172   https://download.wavebox.app/latest/stable/linux/deb -O ./wavebox.deb 
sudo dpkg -i ./wavebox.deb
mkdir -p ~/.config/autostart
echo '[Desktop Entry]
Type=Application
Exec=/opt/wavebox.io/wavebox/wavebox-launcher &
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=wavebox
Name=wavebox
Comment[en_US]=
Comment='  | tee  ${HOME}/.config/autostart/wavebox.desktop
rm ./wavebox.deb

wget https://res.u-tools.cn/currentversion/utools_1.3.5_amd64.deb
sudo dpkg -i ./utools_1.3.5_amd64.deb

echo '[Desktop Entry]
Type=Application
Exec=setsid /usr/bin/utools
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=utools
Name=utools
Comment[en_US]=
Comment='  | tee  ~/.config/autostart/utools.desktop
rm ./utools_1.3.5_amd64.deb



wget https://www.jianguoyun.com/static/exe/installer/ubuntu/nautilus_nutstore_amd64.deb

sudo apt-get install libglib2.0-dev libgtk2.0-dev libnautilus-extension-dev gvfs-bin python-gi gir1.2-appindicator3-0.1 -y
wget https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz
tar zxf nutstore_linux_src_installer.tar.gz
cd nutstore_linux_src_installer 
./configure 
make
nautilus -q
sudo make install
echo No|./runtime_bootstrap
cd ../
rm -rf ./nutstore_linux_src_installer nutstore_linux_src_installer.tar.gz
rm nautilus_nutstore_amd64.deb
# todo 
# helm
# kubevela
# slack/discord/tg
# system indicator



## 坚果云
wget https://www.jianguoyun.com/static/exe/installer/ubuntu/nautilus_nutstore_amd64.deb

sudo apt-get install libglib2.0-dev libgtk2.0-dev libnautilus-extension-dev gvfs-bin python-gi gir1.2-appindicator3-0.1 -y
wget https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz
tar zxf nutstore_linux_src_installer.tar.gz
cd nutstore_linux_src_installer 
./configure 
make
nautilus -q
sudo make install
echo No|./runtime_bootstrap
cd ../
rm -rf ./nutstore_linux_src_installer nutstore_linux_src_installer.tar.gz
rm nautilus_nutstore_amd64.deb


curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm




## init my project
cd ${HOME}/sm/project
ln -s $(pwd)/awesome-shell-actions ${HOME}/.zsh/awesome-shell-actions


## virtualbox

## helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh # TODO break point


## gnome shell extension
# 减少topbar的间距  https://extensions.gnome.org/extension/1287/unite/
<<<<<<< HEAD
# 透明topbar https://extensions.gnome.org/extension/3518/transparent-shell/


# guake config
ln -s $S_CONFIG_DIR/ubuntu-20/guake.conf ${HOME}/.guake.conf
guake  --restore-preferences=~/.guake.conf 
echo "
[Desktop Entry]
Name=guake
Comment=guake
TryExec=guake
Exec=guake
Icon=guake
Type=Application
Categories=GNOME;GTK;System;Utility;TerminalEmulator;
StartupNotify=true
X-Desktop-File-Install-Version=0.22
X-GNOME-Autostart-enabled=true
Hidden=false
NoDisplay=false
" > ~/.config/autostart/guake.desktop


# postman
snap install postman 
echo "
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=/opt/Postman/app/Postman %U
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
" > ${HOME}/.local/share/applications/Postman.desktop
# ocr
sudo add-apt-repository ppa:daniel.p/dpscreenocr
sudo apt-get update
sudo apt install dpscreenocr
sudo apt install tesseract-ocr-eng 


# sublimetext3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt-get install sublime-text

# crystal
curl -fsSL https://crystal-lang.org/install.sh | sudo bash

# init xdotool-ext
cd ${HOME}/sm/project
git clone https://github.com/woodgear/xdotool-ext.git
sudo ./scripts/install.sh
cd -

# jetbrain tools
wget https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-1.20.8352.tar.gz ./
extract jetbrains-toolbox-1.20.8352.tar.gz
mv ./jetbrains-toolbox-1.20.8352/jetbrains-toolbox ~/sm/app
rm -rf ./jetbrains-toolbox-1.20.8352*
ln -s $S_CONFIG_DIR/idea/.ideavimrc ~/.ideavimrc 




# jmeter
cd ~/sm/app
wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-5.4.1.zip
unzip  apache-jmeter-5.4.1.zip
rm -rf ./apache-jmeter-5.4.1.zip
