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
## reload fcitx config
fcitx-remote -r
```

# git
```
git remote set-url origin git@github.com:woodgear/s-config.git

ssh-keygen -t rsa  -N '' -b 4096 -C "q1875486458@gmail.com"  -f ~/.ssh/id_rsa <<<y 2>&1 >/dev/null
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
# copy to github/settings/sshkey
```
# system monitor indicator
```
W:{wall} C:{cpu}:{amd_cputemp} M: {mem}{meminfo}
amd_cputemp: sensors |grep Tctl|awk '{print $2}'
meminfo: free -mh|sed '1d'|awk '{print $2"/"$3 " "}'|tr -d '\n'
wall : (curl -m 2 -I  --socks5 127.0.0.1:20170  -s  -o /dev/null -w "%{time_total}  code:%{http_code}" www.google.com || echo "error")|xargs -i{} bash -c 'if [[ "{}" == *"code:200"* ]]; then echo "{}" | awk "{print \$1}";else echo "been fuck";fi'

```
# bycompare Beyond Compare 5
rm bcompare-4.3.7.25118_amd64.deb
wget https://www.scootersoftware.com/bcompare-4.3.7.25118_amd64.deb
sudo apt update
sudo apt install gdebi-core -y 
sudo gdebi bcompare-4.3.7.25118_amd64.deb 
rm bcompare-4.3.7.25118_amd64.deb

## init ssh
ssh-copy-id root@45.32.114.140 
## gnome shell
```bash
sudo apt install gnome-shell-extensions -y # needrelogin 
```
* utools
* wavebox login
* login tabnine
* config system monitor
* catlog
* virtualbox window config
* config for work
* vim install package
* emacs install package
* config auto start utools wavebox
* switch default terminal
* ssh proxy
* guake terminal

## after init ns
ln -s ~/sm/ns/share/scripts ~/sm/scripts

## keychron k1 
### fx 无法使用
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1814481