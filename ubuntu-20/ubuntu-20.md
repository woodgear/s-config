# fuck the wall
## docker
```bash
sudo apt install docker.io &&\
sudo systemctl enable --now docker

# fix permission issue
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

id -Gn |grep docker
docker --version
docker run hello-world 

docker run -d \
 --restart=always \
 --privileged \
 --network=host \
 --name v2raya \
 -v /etc/resolv.conf:/etc/resolv.conf \
 -v /etc/v2raya:/etc/v2raya \
 mzz2017/v2raya
```
* login to firefox
* login in to lastpass in firefix
* find the aireplane,login
* copy link
* open localhost:2017
* setting proxy http/https 20172 socks5 20170
* relaunch terminal env |grep proxy to make sure the proxy setting is work
# install via script
```
cd ~/sm/pv/s-config/
sudo chmod a+x ./ubuntu-20/ubuntu20.sh
sudo ./ubuntu20.sh
```
# 坚果云
```
wget https://www.jianguoyun.com/static/exe/installer/ubuntu/nautilus_nutstore_amd64.deb

sudo apt-get install libglib2.0-dev libgtk2.0-dev libnautilus-extension-dev gvfs-bin python-gi gir1.2-appindicator3-0.1 -y
wget https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz
tar zxf nutstore_linux_src_installer.tar.gz
cd nutstore_linux_src_installer  ./configure  make
nautilus -q
sudo make install
./runtime_bootstrap
cd ../
rm -rf ./nutstore_linux_src_installer nutstore_linux_src_installer.tar.gz
rm -r 'Nutstore Files'
rm nautilus_nutstore_amd64.deb
```
# install some software manuly

```bash
sudo apt install wireshark -y
```
```bash
# 输入法
sudo apt-get install fcitx fcitx-googlepinyin fcitx-config-gtk im-config -y
# 手动搜索 lauange support 应该会提示下载语言,下载完成后,将keyboard method system 设成 fcitx
# 重启一下
fcitx-config-gtk3
# 假设常用英文输入法 那么应该将英文输入法放到第一个

rm ~/.config/fcitx/config
ln -s ~/sm/pv/s-config/fcitx/config ~/.config/fcitx/config 
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

# bycompare Beyond Compare 4
rm bcompare-4.3.7.25118_amd64.deb
wget https://www.scootersoftware.com/bcompare-4.3.7.25118_amd64.deb
sudo apt update
sudo apt install gdebi-core -y 
sudo gdebi bcompare-4.3.7.25118_amd64.deb 
rm bcompare-4.3.7.25118_amd64.deb

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


* config system monitor
* catlog
* utools