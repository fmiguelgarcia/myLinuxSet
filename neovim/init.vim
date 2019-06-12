call plug#begin('~/.local/share/nvim/plugged')

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
Plug 'valloric/youcompleteme'

" IDE 
Plug 'majutsushi/tagbar'    " TagBar
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'  " Syntastic checking

" Git
Plug 'tpope/vim-fugitive'

" Languages support
Plug 'leafgarland/typescript-vim'   " Typescript syntax 

" Other
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'cespare/vim-toml'
" Plug 'fholgado/minibufexpl.vim'
" Plug 'ap/vim-buftabline'

" Languages
Plug 'rust-lang/rust.vim'   " Rust
Plug 'racer-rust/vim-racer' " Rust autocompleter
Plug 'ekalinin/Dockerfile.vim'  "Dockerfile Syntax

call plug#end()

syntax on

filetype plugin indent on

set mouse=a
set hlsearch
set incsearch
set ruler
set number
set showcmd
set ignorecase
set smartcase
" set listchars=eol:$,tab:»·,space:·
set listchars=eol:$,tab:»·
set list

set ts=4
set sw=4
set expandtab
" set spell
set textwidth=100
set colorcolumn=+1
set bg=dark

" AutoCmd
" 1. Delete trailling whitespace.
autocmd BufWritePre *.rs %s/\s\+$//e
autocmd FileType c,cpp autocmd BufWritePre <buffer> %s/\s\+$//e

" Plugin settings
" --------------------
set termguicolors " Activa true colors en la terminal
colorscheme onedark  " Activa tema onedark

" ## Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ## YCM
" let g:ycm_rust_src_path = '/home/miguel/.rustup/toolchains/nightly-2018-10-26-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
nnoremap \gt :YcmCompleter GoTo<CR>
nnoremap \gd :YcmCompleter GetDoc<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_always_populate_location_list = 1

" ## RUST
let g:rustfmt_autosave = 0
let g:rustfmt_command = '/home/miguel/.rustup/toolchains/nightly-2019-03-22-x86_64-unknown-linux-gnu/bin/rustfmt'
" set makeprg=cargo\ test\ --no-run 
autocmd FileType rust setlocal makeprg=cargo\ test\ --no-run
" Autoformat is NOT working with +nightly version so let's do it manually.
" autocmd BufWritePre *.rs :%! /home/miguel/.rustup/toolchains/nightly-2019-03-22-x86_64-unknown-linux-gnu/bin/rustfmt --emit stdout 

" ## NERDTree
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
map <F2> :NERDTreeToggle<CR>
map <F11> :YcmCompleter GoTo<CR>

" ## Airline
let g:airline#extensions#tabline#enabled = 0  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)

" ## Deoplete
" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 0 

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

" ## FZF
" Ejecutar comandos con alt-enter :Commands
let g:fzf_commands_expect = 'alt-enter'
" Guardar historial de búsquedas
let g:fzf_history_dir = '~/.local/share/fzf-history'
map \f :Files<CR>
map \b :Buffers<CR>

" Empezar a buscar presionando Ctrl + p
nnoremap <C-p> :Files<CR>P

" ## FS Swithc
nmap <F4> :FSHere<CR>
nmap <S-F4> :FSLeft<CR>

" ## TagBar
nmap <F3> : TagbarToggle<CR>
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
\}

" Atomatic toggling between line modes
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
