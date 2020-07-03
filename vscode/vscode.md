# install
## linux
### ubuntu
```bash
# snap 版本code 有时输入法无法切换 遂弃
wget -O code.deb https://az764295.vo.msecnd.net/stable/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/code_1.46.1-1592428892_amd64.deb
sudo apt install ./code.deb
```

### arch

## windows
```ps1
choco install vscode -y
```
# install plugin 
```sh
# code --list-extensions |xargs -I '{}' echo 'code --install-extension {}'
code --install-extension aaron-bond.better-comments
code --install-extension Cameron.rerun-last-command
code --install-extension in4margaret.compareit
code --install-extension matklad.rust-analyzer
code --install-extension ms-python.python
code --install-extension golang.go
code --install-extension redguardtoo.matchit
code --install-extension vscodevim.vim
```


# init
## linux
```bash
ln -s ~/.config/Code\ -\ OSS  ~/.config/Code
rm -rf  ~/.config/Code/User/settings.json 
rm -rf ~/.config/Code/User/snippets 
rm -rf  ~/.config/Code/User/keybindings.json 
export VSCODE_CONFIG_DIR=/home/oaa/sm/pv/s-config/vscode
ln -s $VSCODE_CONFIG_DIR/settings.json ~/.config/Code/User/settings.json 
ln -s $VSCODE_CONFIG_DIR/snippets ~/.config/Code/User/snippets
ln -s $VSCODE_CONFIG_DIR/keybindings.json ~/.config/Code/User/keybindings.json 
```
# windows
```ps
set config_dir=E:\sm\pv\s-config\vscode
set user_name=oaa
rm C:\Users\%user_name%\AppData\Roaming\Code\User\settings.json
rm C:\Users\%user_name%\AppData\Roaming\Code\User\keybindings.json
rm -rf C:\Users\%user_name%\AppData\Roaming\Code\User\snippets
mklink "C:\Users\%user_name%\AppData\Roaming\Code\User\settings.json" "%config_dir%\settings.json"
mklink "C:\Users\%user_name%\AppData\Roaming\Code\User\keybindings.json" "%config_dir%\keybindings.json"
mklink /D  "C:\Users\%user_name%\AppData\Roaming\Code\User\snippets" "%config_dir%\snippets"
```
