" Real programmers don't use TABs but spaces; set for python files
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set fileformat=unix

set textwidth=79   " width of document (used by gd)
"set formatoptions+=t   " do automatically wrap text when typing

noremap <leader>r <Esc>:w<cr>:!clear; python %<cr>
