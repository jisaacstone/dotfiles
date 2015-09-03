call pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on
let g:syntastic_javascript_jslint_args = "browser: true, unparam: false, todo: false"
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
set background=dark
" solarized options 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

set autoindent
set pastetoggle=<F2>
set title
set hls
let g:xml_syntax_folding=1
" erlang
au BufRead,BufNewFile escalus.config set filetype=erlang
au BufRead,BufNewFile rebar.config set filetype=erlang
au BufRead,BufNewFile rebar.*.config set filetype=erlang
au BufRead,BufNewFile *.xrl set filetype=erlang
au BufRead,BufNewFile *.yrl set filetype=erlang

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
