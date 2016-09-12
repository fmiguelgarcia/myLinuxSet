execute pathogen#infect()
syntax on
filetype plugin indent on

set mouse=a
set ts=3
set sw=3
set hlsearch
set incsearch
set ruler
set showcmd
set smartcase
set list

let g:molokai_original = 1
colo molokai

nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>


" Power line
set laststatus=2
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
