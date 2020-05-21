# init
## linux
```bash
ln -s ~/.config/Code\ -\ OSS  ~/.config/Code
rm -rf  ~/.config/Code/User/settings.json 
rm -rf ~/.config/Code/User/snippets 
rm -rf  ~/.config/Code/User/keybindings.json 

ln -s ~/ns/share/init/vscode/settings.json ~/.config/Code/User/settings.json 
ln -s ~/ns/share/init/vscode/snippets ~/.config/Code/User/snippets
ln -s ~/ns/share/init/vscode/keybindings.json ~/.config/Code/User/keybindings.json 
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