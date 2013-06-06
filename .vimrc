set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/CSApprox'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'vim-scripts/django.vim'
Bundle 'vim-scripts/csv.vim'
Bundle 'vim-scripts/scratch.vim'
Bundle 'vim-scripts/indenthtml.vim'
Bundle 'vim-scripts/XML-Folding'
Bundle 'vim-scripts/DetectIndent'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'flazz/vim-colorschemes'
Bundle 'jimenezrick/vimerl'
Bundle 'airblade/vim-gitgutter'
Bundle 'marijnh/tern_for_vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'sjl/gundo.vim'
Bundle 'ivanov/vim-ipython'
Bundle 'klen/python-mode'
Bundle 'pangloss/vim-javascript'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'gregsexton/MatchTag'
Bundle 'coaxmetal/humblevundlebundle'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

filetype plugin indent on

" activate powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" general settings
syntax on
set encoding=utf-8
set hidden
set smartcase
set mouse=a
set noerrorbells
set visualbell
set guioptions-=T
set guioptions-=r
set guioptions-=L

" folding
set foldmethod=syntax
set foldlevel=99

" wildmenu stuff
set wildmenu
set wildmode=longest:full,full
set wildignorecase

" text
set wrap
set textwidth=80

" search hightlighting
set hlsearch
set incsearch
set smartindent
set expandtab
set shiftwidth=4 ts=8 softtabstop=4
set shiftround

" appearance
set number
set laststatus=2
set guifont=meslo\ lg\ s\ for\ powerline:h12
let g:molokai_original = 1 " this makes molokai mo betta
colorscheme molokai_modified

" completion
set completeopt=longest,menuone
set complete+=t

" key mappings
let mapleader = ","
nnoremap ' `
nnoremap ` '
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>b :FufBuffer<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <space> :nohls<CR>
nmap <leader><C-q> <plug>Kwbd

"detect indent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

" ctrl p
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(pyc|scssc)$',
    \ }

" virtualenv
let g:virtualenv_directory='~/.virtualenvs/'
let g:virtualenv_auto_activate=1

" python mode settings
let g:pymode_options = 0 " disable the global options because we want textwrap
let g:pymode_lint = 0 " let syntastic do linting
let g:pymode_virtualenv = 0
let g:pymode_breakpoint = 0
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_highlight_string_format = 1
let g:pymode_syntax_highlight_builtin_objs = 1
let g:pymode_indent = 1
let g:pymode_run = 1

" syntastic settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript', 'python'],
                           \ 'passive_filetypes': ['html'] }
let g:syntastic_python_checkers=['pyflakes','flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E128,E231,E261,E401'

" zencoding
let g:use_zen_complete_tag = 1

" NERDTree
let NERDTreeIgnore = ['\.pyc$']

" gitugtter
let g:gitgutter_escape_grep = 1

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

"CSApprox stuff
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" html indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" filetype stuff
au BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
au FileType python setlocal formatoptions-=t commentstring=#%s

" strip trailing whitespace on save
function! <SID>StripTrailingWhitespaces()
    "preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    "do the business:
    %s/\s\+$//e
    "restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" autosave
" set autowriteall
" au FocusLost * silent! wa
