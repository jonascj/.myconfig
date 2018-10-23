"""""""" 
" Misc "
""""""""
syntax enable
set background=dark
colorscheme solarized
let maplocalleader = ","
let mapleader = "-" " default is \
inoremap ii <Esc>

" UTF-8
if has("multi_byte")
  set encoding=utf-8
  set fileencoding=utf-8 
  "set bomb
endif


" Spell checking
autocmd FileType latex,tex setlocal spell spelllang=en_gb

" Bells off because they go off changing colors with --remote-send
set vb t_vb=

" Indentation plugins on
filetype plugin indent on

" Line numbers
set number

" Case insensitive search, maybe other things gets case insens as well, dunno
set ignorecase

" \t is displayed as a number of spaces
" hopefully 6 will make it easy to spot tabs
" since they will misalign with 4 spaces
set tabstop=4


" Spaces to use for each level of auto-indent
set shiftwidth=4


" Expand tabs to spaces (when pressing <tab>-key)
set expandtab

" Hilight column 80
set colorcolumn=80

 
" Textwidth for v+gt wrapping 
" Wrap and insert linebreak
" 2017-10-12: who will ever want this?
" set textwidth=80

" Wrap but do not insert linebreaks
autocmd FileType latex,tex set wrap linebreak nolist textwidth=0 wrapmargin=0

""""""""""""""""""
" Buffers / tabs "
""""""""""""""""""
"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Theme for vim-airline
let g:airline_theme='solarized'

" Open new empty buffer
nnoremap <leader>t :enew<CR>

" Next buffer
nnoremap <leader>j :bnext<CR>

" Prev buffer
nnoremap <leader>k :bprevious<CR>

" Close current, move to previous
nnoremap <leader>bq :bdelete<CR>

" List buffers and status
nnoremap <leader>bl :ls<CR>


"""""""""""
" Plugins "
"""""""""""

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')


" Shorthand notation; fetches https://github.com/user/repo
" Plug 'user/repo'

Plug 'lervag/vimtex'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elmanuelito/vim-matlab-behave'  
" Initialize plugin system
call plug#end()


""""""""""
" Matlab "
""""""""""
let g:matlab_behave_window_name = 'termite-matlab'
let g:matlab_behave_paste_cmd = 'ctrl+shift+v'

"""""""""
" LaTeX "
"""""""""

" VimTex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
"let g:vimtex_latexmk_build_dir = 'build'


" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ 're!\\hyperref\[[^]]*',
    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\(include(only)?|input){[^}]*',
    \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
    \ ]
