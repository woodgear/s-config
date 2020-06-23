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
sudo apt install neovim -y
snap install emacs --classic
sudo apt install gdebi-core -y  && # install deb
sudo apt install gnome-tweak-tool -y &&
sudo apt install openjdk-11-jdk -y  &&
sudo apt install autojump
sudo apt  install cmake -y
sudo apt-get install graphviz -y

sudo apt install aria2 -y
sudo apt install net-tools

sudo apt install cmake -y
sudo snap install code
sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo apt-get install chromium-browser -y


sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt update
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y
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

# nutstore
```bash
wget https://www.jianguoyun.com/static/exe/installer/ubuntu/nautilus_nutstore_amd64.deb

sudo apt-get install libglib2.0-dev libgtk2.0-dev libnautilus-extension-dev gvfs-bin python-gi gir1.2-appindicator3-0.1 -y
wget https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz
tar zxf nutstore_linux_src_installer.tar.gz
cd nutstore_linux_src_installer && ./configure && make
nautilus -q
sudo make install
./runtime_bootstrap
rm -rf nutstore_linux_src_installer nutstore_linux_src_installer.tar.gz
```

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
# go
```
wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.14.4.linux-amd64.tar.gz
rm go1.14.4.linux-amd64.tar.gz
```

# link
```bash
# S_CONFIG_DIR=/home/oaa/sm/pv/s-config
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
mkdir -p ~/.emacs.d
ln -s $S_CONFIG_DIR/emacs/init.el ~/.emacs.d/init.el
```

# zsh
```bash
mkdir ~/.zsh
sudo apt install zsh -y
sudo apt install autojump -y
curl -L git.io/antigen > ~/.zsh/antigen.zsh

zsh

## autojump 

chsh -s $(which zsh) # make it as default shell need to relogin to take effect

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

# rust 
sudo apt install libssl-dev
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env


# some rust util
cargo install ripgrep
cargo install fd-find


# opvpn
sudo apt install  network-manager-openvpn-gnome
setting->network->vpn click add  import from file filling user name and passwd  click add
# node
```
# nvm 
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.zshrc
nvm install --lts
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

# deepin-termial
```
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/deepin-terminal 50

# Select your terminal
sudo update-alternatives --config x-terminal-emulator
```
# tmux
https://github.com/greymd/tmux-xpanes

# 输入法

```bash
sudo apt-get install fcitx fcitx-googlepinyin im-config -y
# 假设常用英文输入法 那么应该将英文输入法放到第一个
# 安装完成后要重启下fcitx

fcitx
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
sudo apt-get install indicator-sysmonitor
cpu: {cpu} mem: {mem} temp: {cputemp}
```

