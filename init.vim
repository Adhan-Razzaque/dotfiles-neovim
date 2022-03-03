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

" Windows Config
if has('win32')
    " SumatraPDF
    let g:vimtex_view_general_viewer = 'sumatraPDF'
    let g:vimtex_view_general_options
        \ = '-reuse-instance -forward-search @tex @line @pdf'
endif

" Mac Config
if has('macunix')
    " Skim
    let g:vimtex_compiler_progname='nvr'
    let g:vimtex_view_method='skim'
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

"plugins here, coc for example
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex'

call plug#end()
