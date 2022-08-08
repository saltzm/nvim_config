# nvim_config
```bash
curl -fLo ~/.config/nvim/init.vim --create-dirs \
    https://raw.githubusercontent.com/saltzm/nvim_config/master/init.vim

curl -fLo ~/.config/nvim/colors/monokai.vim --create-dirs \
    https://raw.githubusercontent.com/saltzm/nvim_config/master/colors/monokai.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

For vim:
```
curl -fLo ~/.vimrc --create-dirs \
    https://raw.githubusercontent.com/saltzm/nvim_config/master/init.vim

curl -fLo ~/.vim/colors/monokai.vim --create-dirs \
    https://raw.githubusercontent.com/saltzm/nvim_config/master/colors/monokai.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Note that it'll complain at you if you don't have cscope installed.

Then when you open neovim do

```
:PlugInstall
```
