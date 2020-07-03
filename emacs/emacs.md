# doom emacs
```bash
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
rm -rf ~/.doom.d
S_CONFIG_DIR=/home/oaa/sm/pv/s-config
ln -s $S_CONFIG_DIR/emacs/doom.d  ~/.doom.d
~/.emacs.d/bin/doom sync
```