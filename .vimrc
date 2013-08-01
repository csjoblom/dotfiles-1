set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-scripts/CSApprox'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/django.vim'
Bundle 'vim-scripts/csv.vim'
Bundle 'vim-scripts/scratch.vim'
Bundle 'vim-scripts/indenthtml.vim'
Bundle 'vim-scripts/XML-Folding'
Bundle 'vim-scripts/DetectIndent'
Bundle 'Raimondi/delimitMate'
Bundle 'gregsexton/MatchTag'
Bundle 'sjl/gundo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rking/ag.vim'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'jimenezrick/vimerl'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'jmcantrell/vim-virtualenv'
"Bundle 'ivanov/vim-ipython'
Bundle 'klen/python-mode'
Bundle 'pangloss/vim-javascript'
Bundle 'marijnh/tern_for_vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'bling/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'
Bundle 'coaxmetal/humblevundlebundle'

" both YouCompleteMe and vimproc.vim need to be compiled manually after installation

filetype plugin indent on

" functions
function! EnsureExists(path)
    if !isdirectory(expand(a:path))
      call mkdir(expand(a:path))
    endif
endfunction

function! StripTrailingWhitespaces()
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

call EnsureExists('~/.vim/.cache')

" strip trailing whitespace on save
"autocmd BufWritePre * :call StripTrailingWhitespaces()

" general settings
syntax on
set encoding=utf-8
set hidden
set autoread
set mouse=a
set mousehide
set noerrorbells
set visualbell
set guioptions-=T
set guioptions-=r
set guioptions-=L
set timeoutlen=500
set ttimeoutlen=50
set scrolloff=1
set backupdir=~/.vim/.cache,~/.tmp,/var/tmp,/tmp
set directory=~/.vim/.cache/,~/.tmp,/var/tmp,/tmp

" folding
set foldmethod=syntax
set foldlevel=99

" wildmenu stuff
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.so,*.swp,*.scssc,*.pyc

" text
set wrap
set textwidth=99
set smartindent
set expandtab
set shiftwidth=4 ts=4 softtabstop=4
set shiftround

" searching
set hlsearch
set incsearch
set smartcase

" appearance
set number
set laststatus=2
set guifont=meslo\ lg\ s\ for\ powerline:h12
colorscheme Tomorrow-Night-Eighties-Custom

" completion
set completeopt=longest,menuone

" key mappings
let mapleader = ","
nnoremap ' `
nnoremap ` '
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>kw :Kwbd<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>

" airline
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 0
let g:airline_enable_ctrlp = 1
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_branch = ' '
let g:airline_readonly_symbol = ' '
let g:airline_linecolumn_prefix = ' '

" detect indent
" not sure if this plugin works or not
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4

" unite
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#set_profile('files', 'ignorecase', 1)
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
let g:unite_source_grep_recursive_opt=''
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>
nnoremap <leader>b :Unite buffer<CR>
nnoremap <C-u>f :Unite file_mru buffer<CR>
nnoremap <C-u>g :Unite grep:.<CR>

" virtualenv
let g:virtualenv_directory='~/.virtualenvs/'
let g:virtualenv_auto_activate = 1

" python mode settings
let g:pymode_options = 0 " disable the global options because we want textwrap
let g:pymode_lint = 0 " let syntastic do linting
let g:pymode_virtualenv = 0 " use separate virtualenv
let g:pymode_breakpoint = 0 " no this is annoying
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_indent = 1
let g:pymode_run = 0
let g:pymode_rope = 1
let g:pymode_rope_enable_autoimport = 0
let g:pymode_rope_autoimport_generate = 0
let g:pymode_rope_vim_completion = 0 "use jedi

" syntastic settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript', 'python'],
                           \ 'passive_filetypes': ['html'] }
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E123,E124,E126,E128,E231,E261,E401,E501'

" zencoding
let g:use_zen_complete_tag = 1

" NERDTree
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeBookmarksFile='~/.vim/.cache/NERDTreeBookmarks'
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>\ :NERDTreeFind<CR>

" gitugtter
let g:gitgutter_escape_grep = 1

"CSApprox stuff
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" html indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "auto"
let g:html_indent_style1 = "auto"

" filetype stuff
au BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

" ycm settings
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_filetype_blacklist = {
            \ 'html' : 1,
            \ 'htmldjango' : 1,
            \ 'markdown' : 1,
            \ 'text': 1,
            \ 'vim' : 1,
            \ 'note' : 1,
            \ 'unite': 1,
            \}
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_key_invoke_completion = '<C-Space>'

" autosave
" set autowriteall
" au FocusLost * silent! wa
