# install plugin 
```sh
# code --list-extensions |xargs -I '{}' echo 'code --install-extension {}'
code --install-extension aaron-bond.better-comments
code --install-extension Cameron.rerun-last-command
code --install-extension in4margaret.compareit
code --install-extension matklad.rust-analyzer
code --install-extension ms-python.python
code --install-extension ms-vscode.Go
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
set config_dir=D:\self\s-config\vscode
rm C:\Users\developer\AppData\Roaming\Code\User\settings.json
rm C:\Users\developer\AppData\Roaming\Code\User\keybindings.json
rm -rf C:\Users\developer\AppData\Roaming\Code\User\snippets
mklink "C:\Users\developer\AppData\Roaming\Code\User\settings.json" "%config_dir%\settings.json"
mklink "C:\Users\developer\AppData\Roaming\Code\User\keybindings.json" "%config_dir%\keybindings.json"
mklink /D  "C:\Users\developer\AppData\Roaming\Code\User\snippets" "%config_dir%\snippets"
```
# sync gist id
6f3b19d8ff668e6198cf5fa206fef71b