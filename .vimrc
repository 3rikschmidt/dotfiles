set nocompatible

set bs=2

set background=dark
syntax on
filetype on


set lsp=0 " space it out a little more (easier to rd)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set cmdheight=1 " the command bar is 2 high
set number " turn on line numbers


set showmatch " show matching brackets
set mat=5 " how many tenths of a second to blink matching brackets for
set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}
set laststatus=2 " always show the status line

set ai " autoindent
set si " smartindent
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set nowrap " do not wrap lines

nnoremap <silent> <F8> :TlistToggle<CR>

" if has("statusline")
"  set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
" endif
