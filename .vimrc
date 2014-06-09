call pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set pastetoggle=<F2>
set title
set hls
hi Search cterm=NONE ctermfg=red ctermbg=0
" Reselect visual block after indent/outdent 
vnoremap < <gv
vnoremap > >gv
" I can type :help on my own, thanks.
noremap <F1> <Esc>
" 'quote' a word
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
" double "quote" a word
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
" remove quotes from a word
nnoremap wq :silent! normal mpeld bhd `ph<CR>
" forgot to sudo?
cmap w!! w !sudo tee % >/dev/null
" tab completion
imap <Tab> <C-P>
" Color the 80th column
if exists('+colorcolumn')
  set colorcolumn=80
endif
" display encoding in status line
if has("statusline")
     set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
 endif

" Browsable (upack as zip)
au BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
au BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))
