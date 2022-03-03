" nvim config
set relativenumber
set number
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set tabstop=4
set concealcursor="nc"
set conceallevel=2
let g:coc_global_extensions = [
\   'coc-vimtex',
\   'coc-spell-checker',
\   'coc-clangd'
\   ]

" VimTex specific config
filetype plugin indent on
syntax enable

"Using SumatraPDF
if has('win32')
    let g:vimtex_view_general_viewer = 'sumatraPDF'
    let g:vimtex_view_general_options
        \ = '-reuse-instance -forward-search @tex @line @pdf'
endif

"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')

"plugins here, coc for example
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'

call plug#end()
