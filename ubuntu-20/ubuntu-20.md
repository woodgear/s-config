# 输入法
## fictx
```bash
sudo apt-get install fcitx fcitx-googlepinyin fcitx-config-gtk im-config -y
# 手动搜索 lauange support 应该会提示下载语言,下载完成后,将keyboard method system 设成 fcitx
# 重启一下
fcitx-config-gtk3
# 假设常用英文输入法 那么应该将英文输入法放到第一个
# 取消ctrl+shift+f 中文简繁转换
```
# git
```
git remote set-url origin git@github.com:woodgear/s-config.git

ssh-keygen -t rsa -b 4096 -C "q1875486458@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
# copy to github/settings/sshkey
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

# bycompare Beyond Compare 4
rm bcompare-4.3.7.25118_amd64.deb
wget https://www.scootersoftware.com/bcompare-4.3.7.25118_amd64.deb
sudo apt update
sudo apt install gdebi-core -y 
sudo gdebi bcompare-4.3.7.25118_amd64.deb 
rm bcompare-4.3.7.25118_amd64.deb


# increase file watch limit
```bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

# Indicator Stickynotes 便签
sudo add-apt-repository ppa:umang/indicator-stickynotes -y &&
sudo apt-get update &&
sudo apt-get install indicator-stickynotes -y
# indicator-sysmonitor
```bash
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor -y
cpu: {cpu} mem: {mem} net: {net} temp: {cputemp}
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
ln -s $S_CONFIG_DIR/emacs/init.el ~/.emacs.d/init.el
```
# increase max_map_count
sudo echo 'vm.max_map_count=262144' >>/etc/sysctl.conf

# espanso
```bash
export VSCODE_CONFIG_DIR=$(pwd) # 默认当前路径是s-config
ln -s $VSCODE_CONFIG_DIR/espanso ~/.config 
```
# activitywatch
```
wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.9.2/activitywatch-v0.9.2-linux-x86_64.zip
```
## init ssh
ssh-copy-id root@45.32.114.140 