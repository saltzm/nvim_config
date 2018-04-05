
let g:nvimgdb_key_frameup = '<c-u>'
let g:nvimgdb_key_framedown = '<c-d>'

syntax on
filetype plugin indent on
set mouse=a

" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude={*.sql,*.py,*.pl,*.html}

au BufNewFile,BufReadPre *.py.dna :let b:ribosome_syntax = "python"
au BufNewFile,BufReadPre *.js.dna :let b:ribosome_syntax = "javascript"
au BufNewFile,BufReadPre *.rb.dna :let b:ribosome_syntax = "ruby"
au BufNewFile,BufRead *.dna setf ribosome

autocmd! BufWritePost,BufEnter * Neomake

autocmd FileType r setlocal shiftwidth=2 tabstop=2 tw=79 formatoptions+=t 
autocmd FileType *.tt setlocal shiftwidth=2 tabstop=2 tw=79 formatoptions+=t syntax=r

set statusline+=%#warningmsg#
set statusline+=%*

"let g:neomake_cpp_enabled_makers=['gcc']
"let g:neomake_cpp_gcc_maker = {
"            \ 'exe' : 'g++',
"            \ 'args': ['-I/path/to/include/dir']
"            \ }

let g:neomake_cpp_enabled_makers=['tidy']
let g:neomake_cpp_remote_maker = {
            \ 'exe' : 'rsyncm'
            \ }
let g:neomake_cpp_clang_maker = {
            \ 'exe' : 'clang-check',
            \ 'args': [@%, '-extra-arg', '-fno-modules', '-p', '/Users/matthewsaltz/code/mongo/']
            \ }
let g:neomake_cpp_linter_maker = {
            \ 'exe' : 'python',
            \ 'args': ['buildscripts/lint.py']
            \ }

" full options
" \ 'args': ['-p', '.', '-checks=-*,clang-analyzer-*,-clang-analyzer-cplusplus*,bugprone-*,cert-*,cppcoreguidelines-*,misc-*,modernize-*,performance-*,portability-*,readability-']
let g:neomake_cpp_tidy_maker = {
            \ 'exe' : 'clang-tidy',
            \ 'args': ['-p', '.', '-checks=-*,clang-analyzer-*,-clang-analyzer-cplusplus*,bugprone-*,cert-*,cppcoreguidelines-*,misc-*,modernize-*,performance-*,portability-*,readability-']
            \ }

let g:neomake_javascript_eslint_maker = {
            \ 'exe' : 'python',
            \ 'args': ['buildscripts/eslint.py', 'lint']
            \ }

" YCM
" Note: ctrl-O to go back to where you jumped, ctrl-I to jump forward :h jumplist
"let g:ycm_goto_buffer_command = 'vertical-split'
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jj :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jf :YcmCompleter FixIt<CR>


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_files=0

nmap <F8> :TagbarToggle<CR>

"""" clang format
"let g:clang_format_path='./build'
let g:clang_format#command='/Users/matthewsaltz/code/mongo/build/clang-format-3.8.0'
let g:clang_format#detect_style_file = 1
"let g:clang_format#auto_format_on_insert_leave = 1
"let g:clang_format#auto_format = 1

"""" rtags
let g:rtagsAutoLaunchRdm=1

""""""""""""" My cscope/vim key mappings
"
" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
"
" Below are three sets of the maps: one set that just jumps to your
" search result, one that splits the existing vim window horizontally and
" diplays your search result in the new window, and one that does the same
" thing, but does a vertical split instead (vim 6 only).
"
" I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
" unlikely that you need their default mappings (CTRL-\'s default use is
" as part of CTRL-\ CTRL-N typemap, which basically just does the same
" thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
" If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
" of these maps to use other keys.  One likely candidate is 'CTRL-_'
" (which also maps to CTRL-/, which is easier to type).  By default it is
" used to switch between Hebrew and English keyboard mode.
"
" All of the maps involving the <cfile> macro use '^<cfile>$': this is so
" that searches over '#include <time.h>" return only references to
" 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
" files that contain 'time.h' as part of their name).


" To do the first type of search, hit 'CTRL-\', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.  
"

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.
"
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


" Hitting CTRL-space *twice* before the search type does a vertical 
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

cs add $PWD/cscope.out

"colorscheme ir_black
colorscheme monokai
"let g:molokai_original = 1
"let g:rehash256 = 1
set background=light

