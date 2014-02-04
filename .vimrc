set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let s:use_ycm = 1

" {{{ Bundles
" general/filetype agnostic
Bundle 'gmarik/vundle'

Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/scratch.vim'
Bundle 'vim-scripts/DetectIndent'
Bundle 'vim-scripts/utl.vim'
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
Bundle 'tpope/vim-speeddating'
Bundle 'coaxmetal/humblevundlebundle'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/unite.vim'
Bundle 'bling/vim-airline'
Bundle 'mhinz/vim-signify'
Bundle 'scrooloose/syntastic'
Bundle 'embear/vim-localvimrc'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/calendar-vim'
Bundle 'SirVer/ultisnips'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
" Bundle 'xolox/vim-easytags'
Bundle 'jceb/vim-orgmode'
Bundle 'vim-voom/VOoM'

" python
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'coaxmetal/python-syntax'
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
" Bundle 'vim-scripts/csv.vim'

" YCM/completion
if s:use_ycm
    Bundle 'Valloric/YouCompleteMe'
else
    Bundle 'ervandew/supertab'
endif
Bundle 'davidhalter/jedi-vim'

" note: both YouCompleteMe and vimproc.vim need to be compiled manually after installation
" }}}

filetype plugin indent on

" {{{ functions
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

function! ToggleColorColumn()
    if (&colorcolumn == '+1')
        set colorcolumn=0
    else
        set colorcolumn=+1
    endif
endfunc

" strip trailing whitespace on save
autocmd FileType python,javascript autocmd BufWritePre * :call StripTrailingWhitespace()

call EnsureExists("$HOME/.vim/.cache")
" }}}

" {{{ general settings
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
set cursorline

" {{{ folding
set foldmethod=syntax
set foldlevel=99
" }}}

" {{{ wildmenu stuff
set wildmenu
set wildmode=list:longest:full,full
set wildignore+=*.so,*.swp,*.scssc,*.pyc
" }}}

" {{{ text
set wrap
set smartindent
set expandtab
set shiftwidth=4 ts=4 softtabstop=4
set shiftround
set textwidth=120
" }}}

" {{{ searching
set hlsearch
set incsearch
set smartcase
" }}}

" {{{ appearance
set noshowmode
set number
set relativenumber
set laststatus=2
set guifont=meslo\ lg\ s\ for\ powerline:h12
set t_Co=256
set background=dark
let g:base16_variant = "eighties"
let g:base16colorspace = "256"
colorscheme base-16-custom
" }}}

" completion
set completeopt=longest,menuone
" }}}

" {{{ key mappings
let mapleader = ","
let maplocalleader = "\\"
let g:C_Ctrl_j = 'off' "disable global mapping for a linefeed
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>T :TagbarToggle<CR>
nnoremap <leader>t :TagbarOpenAutoClose<CR>
nnoremap <leader>W :Kwbd<CR>
nnoremap <silent> <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader>R :call RelativeNumberToggle()<CR>
nnoremap <silent> <leader>cc :call ToggleColorColumn()<CR>
nnoremap gs :Scratch<CR>
map <silent> <leader>k <plug>DashSearch
map <silent> <leader>K <plug>DashGlobalSearch
" }}}

" {{{ navigation
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
" }}}

" {{{ sessions
let g:session_autosave = 'no'
" }}}

" {{{ orgmode
let g:org_todo_keywords = [['TODO(t)', '|', 'WIP(w)', '|', 'DONE(d)']]
autocmd FileType org nnoremap \| :VoomToggle org<CR>
" }}}

" {{{ airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
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
" }}}

" {{{ easytags
" let g:easytags_dynamic_files = 1
" let g:easytags_auto_highlight = 0
" let g:easytags_updatetime_warn = 0
" }}}

" {{{ detect indent
" this doesn't really work as well as I wish it did, but it does something
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
autocmd BufNewFile,BufRead * :DetectIndent
" }}}

" {{{ unite
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

" Fuzzyfinder (until I get around to writing a buffertag source for unite)
nnoremap <c-j>t :FufBufferTag<CR>
" }}}

" {{{ virtualenv
let g:virtualenv_directory="~/.virtualenvs/"
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '%n'
" }}}

" {{{ signify
let g:signify_sign_overwrite = 0
let g:signify_update_on_focusgained = 1
let g:signify_diffoptions = {'git': '--ignore-space-at-eol --ignore-blank-lines'}
nnoremap <silent> <leader>S :SignifyToggle<CR>
" }}}

" {{{ emmet
let g:user_emmet_leader_key = '<C-k>'
" }}}

" {{{ YCM/Supertab
if s:use_ycm
    " ycm settings
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_use_ultisnips_completer = 0
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_min_num_of_chars_for_completion = 2
    let g:ycm_filetype_blacklist = {
                \ 'html' : 0,
                \ 'htmldjango' : 0,
                \ 'markdown' : 1,
                \ 'text': 1,
                \ 'note' : 1,
                \ 'unite': 1,
                \ 'vimshell': 1,
                \ 'conque': 1,
                \ 'org': 1,
                \}
    let g:ycm_key_detailed_diagnostics = ''
    let g:ycm_key_invoke_completion = '<C-Space>'

    let g:jedi#completions_enabled = 0
else
    " supertab
    let g:SuperTabDefaultCompletionType = 'context'
    let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
    let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
    let g:SuperTabContextDiscoverDiscovery =
        \ ['&completefunc:<c-x><c-u>', '&omnifunc:<c-x><c-o>']
    let g:SuperTabLongestEnhanced = 1
    let g:SuperTabClosePreviewOnPopupClose = 0
    let g:SuperTabLongestHighlight = 1

    let g:jedi#popup_select_first = 0
    let g:jedi#popup_on_dot = 0
endif
" }}}

" {{{ jedi
let g:jedi#show_call_signatures = "0"
let g:jedi#use_tabs_not_buffers = 0
au FileType python setl completeopt-=preview
" }}}

" {{{ python-syntax
let python_highlight_all = 1
let python_version_2 = 1 "default to py2 highlighting
" }}}

" {{{ syntastic settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='⚠'
let g:syntastic_style_error_symbol='⚠'
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['javascript', 'python'],
            \ 'passive_filetypes': ['html', 'scss', 'sass'] }
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E123,E124,E126,E128,E201,E202,E203,E231,E261,E262,E401,E501'
" }}}

" {{{ NERDTree
let NERDTreeBookmarksFile="~/.vim/.cache/NERDTreeBookmarks"
let NERDTreeIgnore = ['\.pyc$']
nnoremap \| :NERDTreeToggle<CR>
nnoremap <leader>\| :NERDTreeFind<CR>
" }}}

" {{{ html indentation
let g:html_indent_inctags = "html,body,head,tbody,li"
" }}}

" {{{ utlisnips
" it needs a binding even thogbuh I don't use those, so just something that
" wont be used
let g:UltiSnipsExpandTrigger="<C-Tab>"
let g:UltiSnipsListSnippets="<C-D-Tab>" " this doesn't work but it won't complain
let g:UltiSnipsJumpForwardTriger="<C-Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-S-Tab" " same
" }}}

" {{{ css folding
au BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
" }}}

" {{{ tagbar
let g:tagbar_foldlevel = 0
let g:tagbar_autoshowtag = 1
" }}}

" {{{ completion
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}

" {{{ vimshell
let g:vimshell_enable_smart_case = 1
nnoremap <leader>s :VimShellCurrentDir<CR>
nnoremap <leader>ss :VimShellBufferDir<CR>
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
au FileType vimshell call s:vimshell_settings()
function! s:vimshell_settings()
    call vimshell#altercmd#define('g', 'git')
    setl norelativenumber
    setl nonumber
    setl omnifunc=vimshell#complete#omnifunc
endfunction
" }}}

" {{{ Conque
" let g:ConqueTerm_Color = 1
" let g:ConqueTerm_ToggleKey = '<F8>'

" autosave
" set autowriteall
" au FocusLost * silent! wa
" }}}

" vim: set ts=4 sw=4 expandtab fdm=marker foldlevel=0:
