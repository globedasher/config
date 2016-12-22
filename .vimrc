" Sample .vimrc file by Martin Brochhaus
" Additions by Richard Morley


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

"Tell vim to remember certian things when we exit
"this is especially used here to recall the last position in a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" '10   : marks will be remembered for up to 10 previously edited files
" "100  : will save up to 100 lines for each register
" :20   : up to 20 lines of command-line history will be remembered
" %     : saves and restores the buffer list
" n...  : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Set the status line to indicate information...
" path to file in the buffer
" modified flag
" readonly flag
" help flag
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

set backspace=2

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``h`` and ``l`` which I use for navigating between tabs.
let mapleader = " "

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"unmap the arrow keys so only hjkl can be used for cursor movement
noremap <Up>   <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map  k gk
map  j gj
noremap  0 g0
noremap  $ g$

inoremap <Up>   <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>h <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

" open NERDTree
map <Leader>n <esc>:NERDTree<CR>

" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
""autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
""au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
set t_Co=256
set background=dark
colorscheme mushroom


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on

au BufNewFile,BufRead *.ejs set filetype=html

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set wrap  " automatically wrap on load
set linebreak "linebreak upon wrap
set breakindent "indent the brokenline
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


"" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


"" Useful settings
set history=700
set undolevels=700


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable unneeded backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" run powerline
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display a tabline, even if there is only one tab
"set noshowmode "show/hide the default mode text (e.g -- INSERT -- below the statusline)

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['jshint']

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*

" RM- USING YouCompleteMe INSEAD OF OTHER AUTO COMPLETION


" Using delimitMate
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


"" Adding my custom html snippet macro to the .vimrc!
let @h='i<!doctype htmlo<html>o<head>o<title></title>o</head>o<body></body>o€kbo</html>'

