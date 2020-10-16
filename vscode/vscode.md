# install
## linux
### ubuntu
```bash
# snap 版本code 有时输入法无法切换 遂弃
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

```
## windows
```ps1
choco install vscode -y
```
# install plugin 
```sh
# code --list-extensions |xargs -I '{}' echo 'code --install-extension {}'

code --install-extension streetsidesoftware.code-spell-checker
code --install-extension aaron-bond.better-comments
code --install-extension Cameron.rerun-last-command
code --install-extension in4margaret.compareit
code --install-extension matklad.rust-analyzer
code --install-extension ms-python.python
code --install-extension golang.go
code --install-extension redguardtoo.matchit
code --install-extension vscodevim.vim
code --install-extension yatki.vscode-surround 
code --install-extension bhughes339.replacerules
code --install-extension michelemelluso.gitignore
code --install-extension ms-vscode.cpptools
code --install-extension richie5um2.vscode-statusbar-json-path
code --install-extension bhughes339.replacerules
code --install-extension TabNine.tabnine-vscode
code --install-extension albymor.increment-selection
code --install-extension Gruntfuggly.todo-tree
```

# init
## linux
```bash
ln -s ~/.config/Code\ -\ OSS  ~/.config/Code # 保证oss版本和mircosoft版本配置文件位置兼容
rm -rf  ~/.config/Code/User/*   # 删除旧有全部数据

export VSCODE_CONFIG_DIR=$(pwd)/vscode # 默认当前路径是s-config
ln -s $VSCODE_CONFIG_DIR/settings.json ~/.config/Code/User/settings.json 
ln -s $VSCODE_CONFIG_DIR/snippets ~/.config/Code/User/snippets
ln -s $VSCODE_CONFIG_DIR/keybindings.json ~/.config/Code/User/keybindings.json 
# View -> Command Palette -> reload window
```
# windows
```bat
set config_dir=%cd%\vscode
set user_name=%USERNAME%
rm C:\Users\%user_name%\AppData\Roaming\Code\User\settings.json
rm C:\Users\%user_name%\AppData\Roaming\Code\User\keybindings.json
rm -rf C:\Users\%user_name%\AppData\Roaming\Code\User\snippets
mklink "C:\Users\%user_name%\AppData\Roaming\Code\User\settings.json" "%config_dir%\settings.json"
mklink "C:\Users\%user_name%\AppData\Roaming\Code\User\keybindings.json" "%config_dir%\keybindings.json"
mklink /D  "C:\Users\%user_name%\AppData\Roaming\Code\User\snippets" "%config_dir%\snippets"
```
