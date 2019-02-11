function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
  endif
endfunction

call plug#begin()
"Plug 'sakhnik/nvim-gdb'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'lyuts/vim-rtags'
Plug 'neomake/neomake'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'saltzm/nvim_config'
"Plug 'wincent/command-t', {
"    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
"    \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'universal-ctags/ctags'
Plug 'majutsushi/tagbar'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/lh-style'
Plug 'LucHermitte/lh-tags'
Plug 'LucHermitte/lh-dev'
Plug 'LucHermitte/lh-brackets'
Plug 'LucHermitte/searchInRuntime'
Plug 'LucHermitte/mu-template'
Plug 'tomtom/stakeholders_vim'
Plug 'LucHermitte/alternate-lite'
Plug 'LucHermitte/lh-cpp'
call plug#end()
