# update source list
sudo cp ./ali.source.list /etc/apt/sources.list
# apt install sth
```bash
sudo apt update
# sudo apt upgrade
sudo apt install curl -y &&
sudo apt install gcc  g++ make perl -y &&
sudo apt install git -y &&
sudo apt install hashalot -y &&
# sudo apt install vim -y default is vim8 now
sudo apt install neovim -y
snap install emacs --classic
sudo apt install gdebi-core -y  && # install deb
sudo apt install gnome-tweak-tool -y &&
sudo apt install openjdk-11-jdk -y  &&
sudo apt install autojump
sudo apt  install cmake -y


# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


sudo apt install cmake

```
# wireshark

# bycompare Beyond Compare 4
wget https://www.scootersoftware.com/bcompare-4.3.3.24545_amd64.deb
sudo apt-get update
sudo apt-get install gdebi-core
sudo gdebi bcompare-4.3.3.24545_amd64.deb

# zeal
 sudo apt-get install zeal -y
# 美化
sudo install  gnome-tweak-tool -y
sudo nstall chrome-gnome-shell -y
sudo apt-get install flat-remix -y
# escape 
sudo apt install xcape -y
edit and copy startup.desktop to ~/.config/autostart
# rust 
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
sudo apt install libssl-dev


# some rust util
cargo install ripgrep
cargo install fd-find


# opvpn
sudo apt install  network-manager-openvpn-gnome
setting->network->vpn click add  import from file filling user name and passwd  click add
# node
```
# nvm 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.zshrc
nvm install --lts
npm install -g cnpm --registry=https://registry.npm.taobao.org
```
# zsh
```bash
sudo apt install zsh -y
sudo apt install autojump -y
mkdir ~/.zsh
curl -L git.io/antigen > ~/.zsh/antigen.zsh

ln "$(fd -a zshrc)" -s ~/.zshrc 

source ~/.zshrc
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
## autojump 

chsh -s $(which zsh) # make it as default shell need to relogin to take effect

```
# deepin-termial
```
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/deepin-terminal 50

# Select your terminal
sudo update-alternatives --config x-terminal-emulator
```
# tmux
https://github.com/greymd/tmux-xpanes
# vscode
```
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
```
# 输入法
```bash
sudo apt-get install fcitx fcitx-googlepinyin im-config
# 假设常用英文输入法 那么应该将英文输入法放到第一个
# 安装完成后要重启下fcitx

fcitx
```
# docker 
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
## fix permission denied
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
id -nG # for test output should contains docker
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io # docker 国内加速器
sudo systemctl restart docker.serice

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
# ssh-server
```bash
sudo apt install openssh-server
sudo systemctl enable ssh
```
# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# init 
```bash
ln -s ~/data/Nutstore\ Files/ ~/ns
ln -s ~/ns/share/init/ubuntu-20/xmodmap.sh ~/xmodmap.sh
ln -s ~/ns/share/init/ubuntu-20/zshrc ~/.zshrc
ln -s ~/ns/share/init/vim/vimrc ~/.vimrc
mkdir ~/.config/nvim
ln -s ~/ns/share/init/vim/vimrc ~/.config/nvim/init.vim
ln -s ~/ns/share/init/vim/.ideavimrc ~/.ideavimrc
ln -s ~/ns/share/init/emacs/init.el ~/.emacs.d/init.el
ln -s ~/ns/share/init/emacs/.doom.d ~/.doom.d
```
