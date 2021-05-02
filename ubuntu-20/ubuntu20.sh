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








sudo apt update
sudo apt install curl -y 
sudo apt install gcc  g++ make perl -y 
sudo apt install git -y 
sudo apt install hashalot -y   # for sha256 etc
sudo apt install gdebi-core -y   # install deb
sudo apt install openjdk-11-jdk -y  
sudo apt install autojump -y
sudo apt install cmake -y 
sudo apt install graphviz -y 
sudo apt install xclip -y 
sudo apt install xsel -y 
sudo apt install aria2 -y 
sudo apt install nfs-common -y 
sudo apt install net-tools -y 
sudo apt install baobab -y  
sudo apt install openssh-server -y 
sudo systemctl enable ssh 
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y 
sudo apt update 
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y 
sudo add-apt-repository ppa:mc3man/mpv-tests -y 
sudo apt-get update 
sudo apt install mpv -y 

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

# bpftool
sudo apt install linux-tools-common -y  
sudo apt-get install bpfcc-tools linux-headers-$(uname -r) -y 
sudo apt-get install bpftrace -y 

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
sudo systemctl status  udevmon --no-block
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
# copyq
sudo add-apt-repository ppa:hluk/copyq -y
sudo apt update
sudo apt install copyq -y

# Indicator Stickynotes 便签
sudo add-apt-repository ppa:umang/indicator-stickynotes
sudo apt-get update 
sudo apt-get install indicator-stickynotes -y
# indicator-sysmonitor
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor -y

# zsh

mkdir -p ~/.zsh 

sudo apt install zsh -y 
sudo apt install autojump -y 

git clone https://gitclone.com/github.com/zsh-users/antigen ~/antigen
zsh

# increase max_map_count
echo 'vm.max_map_count=262144' sudo tee /etc/sysctl.conf

sudo curl  --socks5 127.0.0.1:20170  -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose

# espanso
sudo snap install espanso --classic
espanso start


# activitywatch
wget -e use_proxy=on -e http_proxy=http://127.0.0.1:20172 -e https_proxy=http://127.0.0.1:20172   https://github.com/ActivityWatch/activitywatch/releases/download/v0.9.2/activitywatch-v0.9.2-linux-x86_64.zip
unzip activitywatch-v0.9.2-linux-x86_64.zip -d ~/sm/app
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
cd ${HOME}/sm/pv/s-config
export S_CONFIG_DIR=$(pwd)

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
### nvim
sudo apt-get install python3-neovim -y
mkdir -p ${HOME}/.config/nvim
ln -s $S_CONFIG_DIR/vim/vimrc ${HOME}/.config/nvim/init.vim

### emacs
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update -y
sudo apt install emacs27 -y
ln -s ./emacs/init.el ${HOME}/.emacs.d/init.el


### conky
sudo apt-get install conky
ln -s $S_CONFIG_DIR/conky/conky.conf /etc/conky/conky.conf

ln -s $S_CONFIG_DIR/espanso ${HOME}/.config 
## polar

## wavebox mail client

wget -e use_proxy=on -e http_proxy=http://127.0.0.1:20172 -e https_proxy=http://127.0.0.1:20172   https://download.wavebox.app/latest/stable/linux/deb -O ./wavebox.deb 
sudo dpkg -i ./wavebox.deb
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
rm ./utools_1.3.5_amd64.deb
# todo 
# helm
# kubevela
# slack/discord/tg
# system indicator


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
" > ~/.local/share/applications/Postman.desktop
# ocr
sudo add-apt-repository ppa:daniel.p/dpscreenocr
sudo apt-get update
sudo apt install dpscreenocr
sudo apt install tesseract-ocr-eng 