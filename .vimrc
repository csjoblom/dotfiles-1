set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" general/filetype agnostic
Bundle 'vim-scripts/CSApprox'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/scratch.vim'
Bundle 'vim-scripts/DetectIndent'
Bundle 'Raimondi/delimitMate'
Bundle 'mbbill/undotree'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rking/ag.vim'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'coaxmetal/humblevundlebundle'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/unite.vim'
" Bundle 'Shougo/neocomplete.vim'
Bundle 'bling/vim-airline'
Bundle 'mhinz/vim-signify'
Bundle 'scrooloose/syntastic'
Bundle 'embear/vim-localvimrc'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'ervandew/supertab'

" python
Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'klen/python-mode'
Bundle 'ivanov/vim-ipython'

" go
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'

" javascript
Bundle 'pangloss/vim-javascript'
Bundle 'marijnh/tern_for_vim'

" other
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'mattn/emmet-vim'
Bundle 'gregsexton/MatchTag'
Bundle 'vim-scripts/indenthtml.vim'
Bundle 'vim-scripts/csv.vim'

" note: both YouCompleteMe and vimproc.vim need to be compiled manually after installation


filetype plugin indent on

" functions
function! EnsureExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path))
    endif
endfunction

function! RelativeNumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

function! StripTrailingWhitespace()
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

" strip trailing whitespace on save
autocmd FileType python,javascript autocmd BufWritePre * :call StripTrailingWhitespace()

call EnsureExists("$HOME/.vim/.cache")

" general settings
syntax on
set encoding=utf-8
set hidden
set autoread
set mouse=a
set mousehide
set noerrorbells
set visualbell
set guioptions=gmc
set timeoutlen=500
set ttimeoutlen=50
set scrolloff=2
set backupdir=~/.vim/.cache,~/.tmp,/var/tmp,/tmp
set directory=~/.vim/.cache/,~/.tmp,/var/tmp,/tmp
set tags+=.tags

" folding
set foldmethod=syntax
set foldlevel=99

" wildmenu stuff
set wildmenu
set wildmode=list:longest:full,full
set wildignore+=*.so,*.swp,*.scssc,*.pyc

" text
set wrap
set smartindent
set expandtab
set shiftwidth=4 ts=4 softtabstop=4
set shiftround
"set textwidth=99

" searching
set hlsearch
set incsearch
set smartcase

" appearance
set noshowmode
set number
set relativenumber
set laststatus=2
set guifont=meslo\ lg\ s\ for\ powerline:h12
set t_Co=256
set background=dark
let g:base16_variant = "eighties"
colorscheme base-16-custom

" completion
set completeopt=longest,menuone

" key mappings
let mapleader = ","
let g:C_Ctrl_j = 'off' "disable global mapping for a linefeed
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>T :TagbarToggle<CR>
nnoremap <leader>t :TagbarOpenAutoClose<CR>
nnoremap <leader>W :Kwbd<CR>
nnoremap <silent> <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>r :call RelativeNumberToggle()<CR>
nnoremap <C-Y> 3<C-Y>
nnoremap <C-E> 3<C-E>
nnoremap gs :Scratch<CR>
map <silent> <leader>k <plug>DashSearch
map <silent> <leader>K <plug>DashGlobalSearch

" navigation
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

" airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_branch = ' '
let g:airline_readonly_symbol = ' '
let g:airline_linecolumn_prefix = ' '
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

" detect indent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
autocmd BufNewFile,BufRead * :DetectIndent

" unite
let g:unite_data_directory="~/.vim/.cache/unite"
let g:unite_source_rec_max_cache_files=5000
let g:unite_source_file_mru_limit = 200
let g:unite_source_history_yank_enable = 1
let g:unite_prompt='» '
let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
let g:unite_source_grep_recursive_opt=''
let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
call unite#set_profile('files', 'smartcase', 1)
call unite#set_profile('files', 'ignorecase', 1)
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom_source('file_rec,file_rec/async', 'filters',
            \ ['converter_relative_word', 'matcher_default',
            \  'sorter_default', 'converter_relative_abbr'])
call unite#custom_source('file_rec,file_rec/async', 'sorters', ['sorter_rank', 'sorter_word'])

nnoremap <leader>b :Unite buffer<CR>
nnoremap <C-p> :Unite -start-insert file_rec/async<CR>
nnoremap <C-j>p :Unite -start-insert file_rec/async<CR>
nnoremap <C-j>y :Unite history/yank<CR>
nnoremap <C-j>b :Unite buffer<CR>
nnoremap <C-j>f :Unite file file/new<CR>
nnoremap <C-j>F :UniteWithBufferDir file file/new<CR>
nnoremap <C-j>r :Unite file_mru<CR>
nnoremap <C-j>j :Unite jump<CR>
nnoremap <C-j>g :Unite grep:.<CR>
nnoremap <C-j>u :Unite ultisnips<CR>

au FileType unite call s:unite_buffer_settings()
function! s:unite_buffer_settings()
    setl norelativenumber
    nmap <buffer> <C-r> <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r> <Plug>(unite_narrowing_input_history)
    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r unite#do_action('replace')
    else
        nnoremap <silent><buffer><expr> r unite#do_action('rename')
    endif
endfunction

" virtualenv
let g:virtualenv_directory="~/.virtualenvs/"
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '%n'

" signify
let g:signify_sign_overwrite = 0

"emmet
let g:user_emmet_leader_key = '<C-k>'

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabLongestEnhanced = 1
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabLongestHighlight = 1
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>", "&completefunc:<c-x><c-u>"]


" python mode settings
" disable most of it (replaced with other plugins)
let g:pymode_options = 0
let g:pymode_lint = 0
let g:pymode_virtualenv = 0
let g:pymode_breakpoint = 0
let g:pymode_utils_whitespaces = 0
let g:pymode_run = 0
let g:pymode_folding = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_indent = 1
let g:pymode_rope = 0

" syntastic settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['javascript', 'python'],
            \ 'passive_filetypes': ['html', 'scss', 'sass'] }
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E123,E124,E126,E128,E231,E261,E401,E501'

" NERDTree
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeBookmarksFile="~/.vim/.cache/NERDTreeBookmarks"
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>\ :NERDTreeFind<CR>

" CSApprox
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

" html indentation
let g:html_indent_inctags = "html,body,head,tbody,li"
let g:html_indent_script1 = "auto"
let g:html_indent_style1 = "auto"

" jedi
let g:jedi#show_call_signatures = "0"
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_select_first = 1
au FileType python setl completeopt-=preview

" utlisnips
" it needs a binding even thogbuh I don't use those, so just something that
" wont be used
let g:UltiSnipsExpandTrigger="<C-Tab>"
let g:UltiSnipsListSnippets="<C-D-Tab>" " this doesn't work but it won't complain
let g:UltiSnipsJumpForwardTriger="<C-Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-S-Tab" " same

" css folding
au BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

" tagbar
let g:tagbar_foldlevel = 0
let g:tagbar_autoshowtag = 1

" neocomplete
" let g:neocomplete#enable_at_startup = 0
" let g:neocomplete#enable_smart_case = 1
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" vimshell
let g:vimshell_enable_smart_case = 1
nnoremap gt :VimShellCurrentDir<CR>
nnoremap gT :VimShellBufferDir<CR>
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
au FileType vimshell call s:vimshell_settings()
function! s:vimshell_settings()
    call vimshell#altercmd#define('g', 'git')
    setl norelativenumber
    setl nonumber
    setl omnifunc=vimshell#complete#omnifunc
endfunction

" Conque
let g:ConqueTerm_Color = 1
let g:ConqueTerm_ToggleKey = '<F8>'

" autosave
" set autowriteall
" au FocusLost * silent! wa
