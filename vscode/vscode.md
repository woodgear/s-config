# init
## linux
```bash
ln -s ~/.config/Code\ -\ OSS  ~/.config/Code
rm -rf  ~/.config/Code/User/settings.json 
rm -rf ~/.config/Code/User/snippets 
rm -rf  ~/.config/Code/User/keybindings.json 
export VSCODE_CONFIG_DIR=$(pwd)/vscode
ln -s $VSCODE_CONFIG_DIR/settings.json ~/.config/Code/User/settings.json 
ln -s $VSCODE_CONFIG_DIR/snippets ~/.config/Code/User/snippets
ln -s $VSCODE_CONFIG_DIR/keybindings.json ~/.config/Code/User/keybindings.json 
```
# windows
```ps
rm C:\Users\developer\AppData\Roaming\Code\User\settings.json
rm C:\Users\developer\AppData\Roaming\Code\User\keybindings.json
rm C:\Users\developer\AppData\Roaming\Code\User\snippets
mklink "C:\Users\developer\AppData\Roaming\Code\User\settings.json" "C:\Users\developer\work\lab\s-config\vscode\settings.json"
mklink "C:\Users\developer\AppData\Roaming\Code\User\keybindings.json" "C:\Users\developer\work\lab\s-config\vscode\keybindings.json"
mklink /D  "C:\Users\developer\AppData\Roaming\Code\User\snippets" "C:\Users\developer\work\lab\s-config\vscode\snippets"
```
# sync gist id
6f3b19d8ff668e6198cf5fa206fef71b