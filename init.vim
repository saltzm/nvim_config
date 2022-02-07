let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/rhysd/vim-clang-format'
" Plug 'https://github.com/ycm-core/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --clang-completer' }
if v:version >= 800
    Plug 'https://github.com/dense-analysis/ale.git', { 'tag': 'v2.6.0' }
endif

Plug 'https://github.com/jlanzarotta/bufexplorer'
" Plug 'https://github.com/lyuts/vim-rtags'

Plug 'https://github.com/saltzm/nvim_config'
Plug 'https://github.com/scrooloose/nerdtree'

Plug 'https://github.com/junegunn/fzf', { 'tag': '0.20.0', 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'https://github.com/junegunn/fzf.vim'

Plug 'https://github.com/tpope/vim-fugitive', { 'tag': 'v3.2' }
Plug 'https://github.com/majutsushi/tagbar'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'jackguo380/vim-lsp-cxx-highlight'
" Provides extra ccls features like call hierarchy
Plug 'm-pilia/vim-ccls'
Plug 'ziglang/zig.vim'

call plug#end()

set number
set encoding=utf-8
