#!/bin/bash
set -e
set -x
code --install-extension  streetsidesoftware.code-spell-checker
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
code --install-extension lindraupe.aw-watcher-vscode
code --install-extension rid9.datetime
code --install-extension christian-kohler.path-intellisense
code --install-extension sleistner.vscode-fileutils
code --install-extension kentos.move-selection-to-new-file
code --install-extension codeinchinese.englishchinesedictionary
code --install-extension reduckted.vscode-gitweblinks
code --install-extension cubicle6.scriptbox

rm -rf  ~/.config/Code\ -\ OSS 
ln -s ~/.config/Code\ -\ OSS  ~/.config/Code # 保证oss版本和mircosoft版本配置文件位置兼容
rm -rf  ~/.config/Code/User/*   # 删除旧有全部数据

export VSCODE_CONFIG_DIR=$(pwd)/vscode # 默认当前路径是s-config
ln -s $VSCODE_CONFIG_DIR/settings.json ~/.config/Code/User/settings.json 
ln -s $VSCODE_CONFIG_DIR/snippets ~/.config/Code/User/snippets
ln -s $VSCODE_CONFIG_DIR/keybindings.json ~/.config/Code/User/keybindings.json 

