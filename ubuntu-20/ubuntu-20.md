# fuck the wall
## docker
```bash
sudo apt install docker.io &&\
sudo systemctl enable --now docker &&\
sudo usermod -aG docker $USER &&\
docker --version &&\
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
# install via script
```
./ubuntu20.sh
```
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