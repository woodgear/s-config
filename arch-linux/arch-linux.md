# install aura
```sh
git clone https://aur.archlinux.org/aura-bin.git
cd aura-bin
makepkg
sudo pacman -U aura-bin-2.3.0-1-x86_64.pkg.tar.xz
```
# install 
```sh
sudo  pacman -S git zsh wget emacs docker
sudo aura -A yed
sudo pacman -S aria2
sudo pacman -S pip3
sudo pacman -S time
sudo pacman -S graphviz

```
# docker
sudo pacman -S docker
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker ${USER}
// logout
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://yxjrbm4q.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
cat /etc/docker/daemon.json
docker run hello-world

# golang
```
url -sSL https://git.io/g-install | sh -s -- zsh
gvm install latest 
```

# caps2esc
```
sudo aura -A interception-caps2esc 
echo '- JOB: "intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]'| sudo tee /etc/udevmon.yaml

echo '[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/udevmon.service

sudo systemctl enable --now udevmon
sudo systemctl status  udevmon
```

# zsh/oh-my-zsh
```
pacman -S zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
rm ~/.zshrc
ln -s ~/ns/share/init/ubuntu-20/zshrc ~/.zshrc

mkdir ~/.zsh
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh > ~/.zsh/antigen.zsh
source ~/.zshrc
```

# node
```
# nvm 
mkdir ～/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.zshrc
nvm install --lts
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

# rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
sudo apt install libssl-dev
cargo install ripgrep
cargo install fd-find
cargo install cargo-edit

# tpm
```
cargo install --git https://github.com/woodgear/tpm.git
tpm install  https://github.com/woodgear/t.git
```
# init config
```
sudo systemctl enable lightdm
sudo systemctl enable docker.service
```

# link
```bash
# S_CONFIG_DIR=/home/oaa/lab/s-config
rm  ~/.zshrc
rm  ~/.vimrc
rm -rf ~/.config/nvim
rm  ~/.ideavimrc
rm  ~/.emacs.d/init.el

ln -s $S_CONFIG_DIR/arch-linux/zshrc ~/.zshrc
ln -s $S_CONFIG_DIR/vim/vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s $S_CONFIG_DIR/vim/vimrc ~/.config/nvim/init.vim
ln -s $S_CONFIG_DIR/vim/.ideavimrc ~/.ideavimrc
mkdir -p ~/.emacs.d
ln -s $S_CONFIG_DIR/emacs/init.el ~/.emacs.d/init.el
```