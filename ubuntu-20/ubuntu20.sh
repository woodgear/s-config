# update source list
if [ ! -f "/usr/local/bin/retry" ]; then
    sudo sh -c "curl https://raw.githubusercontent.com/kadwanev/retry/master/retry -o /usr/local/bin/retry && chmod +x /usr/local/bin/retry"
fi


sudo apt update
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo apt install snapd
sudo apt install curl -y &&
sudo apt install gcc  g++ make perl -y &&
sudo apt install git -y &&
sudo apt install hashalot -y &&  # for sha256 etc
sudo apt install neovim -y &&
sudo snap install emacs --classic &&
sudo apt install gdebi-core -y  && # install deb
sudo apt install gnome-tweak-tool -y &&
sudo apt install openjdk-11-jdk -y  &&
sudo apt install autojump &&
sudo apt  install cmake -y &&
sudo apt-get install graphviz -y &&
sudo apt install xclip -y &&
sudo apt install xsel -y &&
sudo apt install aria2 -y &&
sudo apt install nfs-common -y &&
sudo apt install net-tools -y &&
sudo apt install baobab -y && 
sudo apt install cmake -y &&
sudo apt install openssh-server -y &&
sudo systemctl enable ssh &&
sudo apt-get install chromium-browser -y &&
sudo snap install discord --classic &&
sudo snap install slack --classic &&
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y &&
sudo apt update &&
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y 

sudo add-apt-repository ppa:mc3man/mpv-tests -y &&
sudo apt-get update &&
sudo apt install mpv -y &&

sudo apt install thefuck -y &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 &&
sudo apt-add-repository https://cli.github.com/packages -y &&
sudo apt update &&
sudo apt install gh -y &&
sudo apt install okular -y &&

sudo add-apt-repository ppa:peek-developers/stable -y &&
sudo apt update &&
sudo apt install jq -y &&

# flatapk
flatpak install flathub com.uploadedlobster.peek -y
# bpf
sudo apt install sysstat -y && 

# bpftool
sudo apt install linux-tools-common -y && 
sudo apt-get install bpfcc-tools linux-headers-$(uname -r) -y &&
sudo apt-get install bpftrace -y &&

# AppImageLauncher
sudo add-apt-repository ppa:appimagelauncher-team/stable -y &&
sudo apt update &&
sudo apt install appimagelauncher -y &&
# gh
gh alias set cpr 'pr create -f'
gh alias set --shell see "gh pr list |cat|tail |awk '{print \$1}' | xargs -I {} sh -c 'echo {} &&gh pr diff {}'"
gh alias set --shell  mg 'gh pr review $1 -a && gh pr merge $1 -d -r'

# caps2esc

sudo apt install libyaml-cpp-dev  -y &&
sudo apt install libevdev-dev  -y && 
sudo apt install libudev-dev  -y && 

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
sudo systemctl status  udevmon
cd ../../../
rm -rf caps2esc/

# nutstore 坚果云
wget https://www.jianguoyun.com/static/exe/installer/ubuntu/nautilus_nutstore_amd64.deb

sudo apt-get install libglib2.0-dev libgtk2.0-dev libnautilus-extension-dev gvfs-bin python-gi gir1.2-appindicator3-0.1 -y
wget https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz
tar zxf nutstore_linux_src_installer.tar.gz
cd nutstore_linux_src_installer && ./configure && make
nautilus -q
sudo make install
./runtime_bootstrap
cd ../
rm -rf ./nutstore_linux_src_installer nutstore_linux_src_installer.tar.gz
rm -r 'Nutstore Files'
rm nautilus_nutstore_amd64.deb

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# go
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.5 --binary
gvm use go1.5 --default

# rust
curl https://sh.rustup.rs >./rust-installer.sh
chmod a+x ./rust-installer.sh
./rust-installer.sh --default-host x86_64-unknown-linux-gnu  --default-toolchain nightly --profile default -v -y
rm -rf ./rust-installer.sh
rustup update

source $HOME/.cargo/env
sudo apt install libssl-dev
cargo install ripgrep
cargo install fd-find
cargo install cargo-edit
cargo install starship
# rust-analyzer
rustup component add rust-src
sudo curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux -o /usr/local/bin/rust-analyzer
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
# wireshark
sudo apt install wireshark -y

# zeal
 sudo apt-get install zeal -y
# 美化
sudo install  gnome-tweak-tool -y
sudo apt-get install flat-remix -y

# increase file watch limit
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# tmux
sudo apt  install tmux -y
# copyq
sudo add-apt-repository ppa:hluk/copyq -y
sudo apt update
sudo apt install copyq -y
# xmid-zen
wget https://www.xmind.cn/xmind/downloads/XMind-ZEN-for-Linux-64bit.deb
sudo dpkg -i ./XMind-ZEN-for-Linux-64bit.deb
sudo gdebi ./XMind-ZEN-for-Linux-64bit.deb
rm ./XMind-ZEN-for-Linux-64bit.deb

# Indicator Stickynotes 便签
sudo add-apt-repository ppa:umang/indicator-stickynotes
sudo apt-get update 
sudo apt-get install indicator-stickynotes
# indicator-sysmonitor
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor -y

# zsh

mkdir -p ~/.zsh &&

sudo apt install zsh -y &&
sudo apt install autojump -y &&

git clone https://gitclone.com/github.com/zsh-users/antigen ~/antigen
zsh

# increase max_map_count
sudo echo 'vm.max_map_count=262144' >>/etc/sysctl.conf
# docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose

# espanso
sudo snap install espanso --classic
espanso start

# activitywatch
wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.9.2/activitywatch-v0.9.2-linux-x86_64.zip
# mongo
docker pull mongno
sudo snap install robo3t-snap
# thefuck
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck
# docker-images
## mongo
docker pull mongno
sudo snap install robo3t-sna
## swagger
docker run --name swagger-editor -d --restart=always -p 10000:8080 swaggerapi/swagger-editor:latest
## baiduyun
docker run -d --name baidupcs -p 5299:5299 -v /home/oaa/Downloads/bd:/downloads  oldiy/baidupcs:latest
## wechat
curl -sL https://raw.githubusercontent.com/huan/docker-wechat/master/dochat.sh | bash
function runDoChat() {

docker run \
  --name DoChat \
  --rm \
  -i \
  \
  -v "$HOME/DoChat/WeChat Files/":'/home/user/WeChat Files/' \
  -v "$HOME/DoChat/Applcation Data":'/home/user/.wine/drive_c/users/user/Application Data/' \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  \
  -e DISPLAY \
  \
  -e XMODIFIERS=@im=fcitx \
  -e GTK_IM_MODULE=fcitx \
  -e QT_IM_MODULE=fcitx \
  -e GID="$(id -g)" \
  -e UID="$(id -u)" \
  \
  --ipc=host \
  --privileged \
  \
  zixia/wechat


}
# k8s kind
GO111MODULE="on" go get sigs.k8s.io/kind@v0.9.0

## kubectl
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client


## git
git config --global core.editor "vim" 
git config --global user.email "q1875486458@gmail.com"
git config --global user.name "wucong"


## XMind
wget https://apprepo.de/appimage/download/xmind -o ~/app/Xmind.AppImage
chmod +x ~/app/Xmind.Appimage
ail-cli integrate  ~/app/Xmind.AppImage
## telagram
wget  https://apprepo.de/appimage/download/telegram -o ~/app/Telegram.AppImage
chmod +x ~/app/Telegram.AppImage
ail-cli integrate  ~/app/Telegram.AppImage