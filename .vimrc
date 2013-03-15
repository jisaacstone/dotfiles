call pathogen#infect()
syntax on
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

cmap w!! w !sudo tee % >/dev/null

imap <Tab> <C-P>

" Browsable 
au BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
au BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))
