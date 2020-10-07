# update source list
sudo cp ./tuna.ubuntu-20.source.list /etc/apt/sources.list
# apt install sth
```bash
sudo apt update
# sudo apt upgrade
sudo apt install curl -y &&
sudo apt install gcc  g++ make perl -y &&
sudo apt install git -y &&
sudo apt install hashalot -y &&  # for sha256 etc
# sudo apt install vim -y default is vim8 now
sudo apt install neovim -y &&
sudo install emacs --classic
sudo apt install gdebi-core -y  && # install deb
sudo apt install gnome-tweak-tool -y &&
sudo apt install openjdk-11-jdk -y  &&
sudo apt install autojump &&
sudo apt  install cmake -y &&
sudo apt-get install graphviz -y &&
sudo apt install xclip -y &&
sudo apt install xsel -y &&
sudo apt install aria2 -y &&
sudo apt install net-tools -y &&

sudo apt install cmake -y &&
sudo apt install openssh-server -y &&
sudo systemctl enable ssh &&
sudo apt-get install chromium-browser -y &&
sudo snap install discord --classic &&

sudo apt-add-repository ppa:remmina-ppa-team/remmina-next &&
sudo apt update &&
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y 
```
# 输入法
```bash
sudo apt-get install fcitx fcitx-googlepinyin im-config -y
# 手动搜索 lauange support 应该会提示下载语言,下载完成后,将keyboard method system 设成 fcitx
# logout 一下
fcitx-config-gtk3
# 假设常用英文输入法 那么应该将英文输入法放到第一个
# 取消ctrl+shift+f 中文简繁转换
```
# git
```
git config --global core.editor "vim" 
git clone https://github.com/woodgear/s-config
git config --global user.email "q1875486458@gmail.com"
git config --global user.name "wucong"
git remote set-url origin git@github.com:woodgear/s-config.git

ssh-keygen -t rsa -b 4096 -C "q1875486458@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa
# copy to github/settings/sshkey
```

# s-config
git remote set-url origin git@github.com:woodgear/s-config.git
# vscode
参照vscode/vscode.md

# caps2esc
```bash
sudo apt install libyaml-cpp-dev  -y
sudo apt install libevdev-dev  -y
sudo apt install libudev-dev  -y
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
```

# nutstore 坚果云
```bash
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
```

#  docker
```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo systemctl status docker

sudo usermod -aG docker ${USER}
su - ${USER}
id -nG
sudo usermod -aG docker ${USER}
docker run hello-world
```
# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# go
```
sudo apt install golang-go -v
```
# rust 
```bash
curl https://sh.rustup.rs >./rust-installer.sh
chmod a+x ./rust-installer.sh
./rust-installer.sh --default-host x86_64-unknown-linux-gnu  --default-toolchain nightly --profile default -v -y

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
```
# node
```
sudo apt install npm
npm install -g n
n latest
npm install -g typescript
npm install -g npm-check-updates
sudo npm install cnpm -g --registry=https://r.npm.taobao.org
```

# qemu kvm 
```bash
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
```
# wireshark

# bycompare Beyond Compare 4
wget https://www.scootersoftware.com/bcompare-4.3.3.24545_amd64.deb
sudo apt-get update
sudo apt-get install gdebi-core
sudo gdebi bcompare-4.3.3.24545_amd64.deb
rm bcompare-4.3.3.24545_amd64.deb

# zeal
 sudo apt-get install zeal -y
# 美化
sudo install  gnome-tweak-tool -y
sudo apt-get install flat-remix -y



# tmux
```bash
sudo apt  install tmux 
https://github.com/greymd/tmux-xpanes
ln -s $(pwd)/tmux.conf ~/.tmux.conf 
```
# copyq
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
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
```bash
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor -y
cpu: {cpu} mem: {mem} temp: {cputemp}
```

# link
```bash
export S_CONFIG_DIR=$(pwd)
rm  ~/.zshrc
rm  ~/.vimrc
rm -rf ~/.config/nvim
rm  ~/.ideavimrc
rm  ~/.emacs.d/init.el

ln -s $S_CONFIG_DIR/ubuntu-20/zshrc ~/.zshrc
ln -s $S_CONFIG_DIR/vim/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s $S_CONFIG_DIR/vim/vimrc ~/.config/nvim/init.vim
ln -s $S_CONFIG_DIR/vim/.ideavimrc ~/.ideavimrc
```
# zsh
```bash
mkdir -p ~/.zsh &&
sudo apt install zsh -y &&
sudo apt install autojump -y &&

git clone https://gitclone.com/github.com/zsh-users/antigen ~/antigen
zsh

## autojump 

chsh -s $(which zsh) # make it as default shell need to relogin to take effect
```

# increase max_map_count
sudo echo 'vm.max_map_count=262144' >>/etc/sysctl.conf


# espanso
```bash
sudo snap install espanso --classic
espanso start

export VSCODE_CONFIG_DIR=$(pwd) # 默认当前路径是s-config
ln -s $VSCODE_CONFIG_DIR/espanso ~/.config 
```