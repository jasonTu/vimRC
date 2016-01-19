"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: Garry Qian <garry.qian@gamil.com>
"

" Setup language {{{ ==========================================================

language en_US.UTF-8            " Solve some plugins incompatibilities

" }}}

" NEOBUNDLE {{{ ===============================================================

set nocompatible                " No to the total compatibility with the ancient                                                                                                                                                       vi

" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/                                                                                                                                                      neobundle.vim
    let iCanHazNeoBundle=0
endif


" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'
" }}}

" BUNDLES (plugins administrated by NeoBundle) {{{

" Shougo's way {{{

" Vimproc to asynchronously run commands (NeoBundle)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" File explorer (needed where ranger is not available)
NeoBundleLazy 'Shougo/vimfiler', {'autoload' : { 'commands' : ['VimFiler']}}

" }}}

" Colorschemes {{{

" Dark themes
" Improved terminal version of molokai, almost identical to the GUI one
NeoBundle 'joedicastro/vim-molokai256'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'

" }}}

" DCVS {{{
"
" Admin Git
NeoBundle 'tpope/vim-fugitive'
" Show git repository changes in the current file
NeoBundle 'airblade/vim-gitgutter'
" Browse GitHub events in Vim
NeoBundle 'joedicastro/vim-github-dashboard'

" }}}

" Markdown {{{

" Markdown Syntax
NeoBundleLazy 'joedicastro/vim-markdown'
" Makes a Markdown Extra preview into the browser
NeoBundleLazy 'joedicastro/vim-markdown-extra-preview'

" }}}

" Linux tools {{{

" A diff tool for directories
NeoBundleLazy 'joedicastro/DirDiff.vim', { 'autoload': { 'commands' : 'DirDiff'}                                                                                                                                                      }
" Hexadecimal editor
NeoBundle 'Shougo/vinarise.vim'

" }}}

" Python {{{

" Autocompletion
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'davidhalter/jedi-vim'
" A Python plugin
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
" Admin virtualenvs
NeoBundle 'jmcantrell/vim-virtualenv'
" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}
" Show reports from coverage.py
NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python'                                                                                                                                                      ]}}
" Sort imports
NeoBundle 'fisadev/vim-isort', {'autoload': {'filetypes': ['python']}}
" }}}

" Javascript {{{
NeoBundle 'pangloss/vim-javascript.git', {'autoload': {'filetypes': ['javascript                                                                                                                                                      ']}}
" }}}

" Code Snippets {{{

" Powerful and advanced Snippets tool
NeoBundle 'SirVer/ultisnips'

" }}}

" Syntax {{{

NeoBundleLazy 'vim-scripts/JSON.vim', {'autoload': {'filetypes': ['json']}}
NeoBundleLazy 'vim-scripts/po.vim--gray', {'autoload': {'filetypes': ['po']}}
NeoBundleLazy 'joedicastro/vim-pentadactyl', {
            \ 'autoload': {'filetypes': ['pentadactyl']}}
NeoBundle 'scrooloose/syntastic'

" }}}

" Open external links {{{

" Open a url into the browser or another files with an external app
NeoBundle 'vim-scripts/utl.vim'

" }}}

" Text edition {{{

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'delimitMate.vim'
" Smart and fast date changer
NeoBundle 'tpope/vim-speeddating'
" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'
" extend repetitions by the 'dot' key
NeoBundle 'tpope/vim-repeat'
" toggle comments
NeoBundle 'tpope/vim-commentary'
" smart digraphs insertion
NeoBundle 'Rykka/easydigraph.vim'
" browse the vim undo tree
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
" to insert lorem ipsum blocks
NeoBundleLazy 'vim-scripts/loremipsum', { 'autoload' :
            \ { 'commands' : 'Loremipsum'}}
" reveals all the character info, Unicode included
NeoBundle 'tpope/vim-characterize'
" transpose lines and text blocks
NeoBundleLazy 'salsifis/vim-transpose', { 'autoload' :
            \ { 'commands' : 'Transpose'}}
" marks admin
NeoBundle 'kshenoy/vim-signature'
" text-objects
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-underscore' " a_, i_
NeoBundle 'kana/vim-textobj-user'
" multiple cursors
NeoBundle 'terryma/vim-multiple-cursors'

" }}}

" HTML/CSS {{{

" A smart and powerful Color Management tool. Needs to be loaded to be able
" to use the mappings
NeoBundleLazy 'Rykka/colorv.vim', {'autoload' : {
            \ 'commands' : [
                             \ 'ColorV', 'ColorVView', 'ColorVPreview',
                             \ 'ColorVPicker', 'ColorVEdit', 'ColorVEditAll',
                             \ 'ColorVInsert', 'ColorVList', 'ColorVName',
                             \ 'ColorVScheme', 'ColorVSchemeFav',
                             \ 'ColorVSchemeNew', 'ColorVTurn2'],
            \ }}

NeoBundleLazy 'othree/html5.vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css']}}

NeoBundleLazy 'mattn/emmet-vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css', 'xml', 'xls', 'markdown']}                                                                                                                                                      }

NeoBundle 'kchmck/vim-coffee-script',{'autoload' : {
            \ 'commands' : [
                             \ 'CoffeeCompile', 'CoffeeLint', 'CoffeeMake',
                             \ 'CoffeeRun', 'CoffeeWatch'],
            \ 'filetypes' : ['coffee']
            \ }}

" }}}

" GUI {{{

" A better looking status line
NeoBundle 'bling/vim-airline'
" Zooms a window
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}
" easily window resizing
NeoBundle 'jimsei/winresizer'

" }}}

" Tmux {{{

" Easily interacts with Tmux from Vim
NeoBundle 'benmills/vimux'
" Tmux config file syntax
NeoBundleLazy 'vimez/vim-tmux', { 'autoload' : { 'filetypes' : 'conf'}}

" }}}

" API Web {{{

NeoBundle 'mattn/webapi-vim'

" }}}

call neobundle#end()
" END BUNDLES }}}

" Auto install the plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}

filetype plugin indent on      " Indent and plugins by filetype

" END NEOBUNDLE }}}

" VIM Setup {{{ ===============================================================

" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" }}}

" Basic options {{{

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is showed anyway
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=block           " to edit where there is no actual character
set number                      " Set line number
"set visualbell                 " turn on the visual bell
cabbr <expr> %% expand('%:.:h') " Expand directory of current edit file

" }}}

" Tags {{{

" For ctags
if filereadable("./ctags")
    set tags+=./ctags
else
    set tags=tags
endif

" For cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " Add any database in current directory
    if filereadable("./cscope.out")
        cs add ./cscope.out
    " Add database set from environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    else
        cs add /home/garry/cscope.out
    endif
    set csverb
endif

" }}}

" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" }}}

" History and permanent undo levels {{{

set history=1000
set undofile
set undoreload=1000

" }}}

" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

" set formatoptions=qrn1ct
set textwidth=80
set colorcolumn=81

function! ToggleWrap()
    let s:nowrap_cc_bg = [22, '#005f00']
    redir => s:curr_cc_hi
    silent hi ColorColumn
    redir END
    let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
    let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
    if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
        let g:curr_cc_ctermbg = s:curr_cc_ctermbg
    endif
    if s:curr_cc_guibg != s:nowrap_cc_bg[1]
        let g:curr_cc_guibg = s:curr_cc_guibg
    endif
    if &textwidth == 80
        set textwidth=0
        exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
                    \' guibg='.s:nowrap_cc_bg[1]
    elseif &textwidth == 0
        set textwidth=80
        exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
                    \' guibg='.g:curr_cc_guibg
    endif
endfunction

nmap <silent><Leader>ew :call ToggleWrap()<CR>

" }}}

" Ok, a vim for men, get off the cursor keys {{{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" }}}

" Colorscheme {{{

set term=xterm-256color

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

syntax enable                  " enable the syntax highlight
"set background=dark           " set a dark background
set t_Co=256                   " 256 colors for the terminal
if has('gui_running')
    colorscheme molokai
else
    "colorscheme molokai256
    colorscheme elflord
    "set background=dark
    "colorscheme solarized
endif

" }}}

" Font {{{

set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 11

" }}}

" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" }}}

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Fast window & buffer close and kill {{{

nnoremap <Leader>k <C-w>c
nnoremap <silent><Leader>K :bd<CR>

" }}}

" Toggle line numbers {{{

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" }}}

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" }}}

" Folding {{{

set foldmethod=marker

" Toggle folding

nnoremap \ za
vnoremap \ za

" }}}

" Cut/Paste {{{

" to/from the clipboard
map <Leader>y "*y
map <Leader>p "*p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" }}}

" Autoload configuration when this file changes ($MYVIMRC) {{{

autocmd! BufWritePost vimrc source %

" }}}

" Spelling {{{

" turn on the spell checking and set the Spanish language
nmap <Leader>ss :setlocal spell spelllang=es<CR>
" turn on the spell checking and set the English language
nmap <Leader>se :setlocal spell spelllang=en<CR>
" turn off the spell checking
nmap <Leader>so :setlocal nospell <CR>
" jump to the next bad spell word
nmap <Leader>sn ]s
" suggest words
nmap <Leader>sp z=
" jump to the next bad spell word and suggests a correct one
nmap <Leader>sc ]sz=
" add word to the dictionary
nmap <Leader>sa zg
" }}}

" Save as root {{{

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" }}}

" Quick saving {{{

nmap <silent> <Leader>w :update<CR>

" }}}

" Delete trailing whitespaces {{{

nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}

" Use Ranger as a file explorer {{{

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map <Leader>x :call RangerChooser()<CR>
" }}}

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" }}}

" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
map <Leader>es g<C-G>

" }}}

" Count lines of code {{{

function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

"}}}

" Toggle the search results highlighting {{{

map <silent><Leader>eq :set invhlsearch<CR>

" }}}

" Move between Vim and Tmux windows {{{

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &                                                                                                                                                      "
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}                                                                                                                                                      '"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<CR>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<CR>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<CR>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<CR>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" }}}

" Quick exiting without save {{{

nnoremap <Leader>`` :qa!<CR>

" }}}

" Execution permissions by default to shebang (#!) files {{{

augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END

" }}}

" Load matchit by default {{{

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }}}

" Make the Y behavior similar to D & C {{{

nnoremap Y y$

" }}}

" END VIM SETUP }}}

" PLUGINS Setup {{{ ===========================================================

" Airline {{{

set noshowmode

let g:airline_theme='molokai'
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

" CoffeeScript {{{

map <Leader>rw :CoffeeWatch vert<CR>

" }}}

" ColorV {{{

let g:colorv_cache_file=$HOME.'/.vim/tmp/vim_colorv_cache'
let g:colorv_cache_fav=$HOME.'/.vim/tmp/vim_colorv_cache_fav'

" }}}

" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
augroup END

" }}}

" delimitmate {{{

let delimitMate_expand_space = 1

" }}}

" easydigraph {{{

let g:EasyDigraph_nmap = '<Leader>dd'

" }}}

" Fugitive {{{

nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>
" }}}

" Gitv {{{

nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1

autocmd FileType git set nofoldenable

" }}}

" GitHub dashboard {{{

nnoremap <Leader>gD :exe 'GHD! '.input("Username: ")<CR>
nnoremap <Leader>gA :exe 'GHA! '.input("Username or repository: ")<CR>

function! GHDashboard (...)
  if &filetype == 'github-dashboard'
    " first variable is the statusline builder
    let builder = a:1

    call builder.add_section('airline_a', 'GitHub ')
    call builder.add_section('airline_b',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 1, ""), ":"), 0, "")} ')
    call builder.add_section('airline_c',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 2, ""), "]"), 0, "")} ')

    " tell the core to use the contents of the builder
    return 1
  endif
endfunction

autocmd FileType github-dashboard call airline#add_statusline_func('GHDashboard'                                                                                                                                                      )

" }}}

" Gundo {{{ ------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>

let g:gundo_preview_bottom = 1

" }}}

" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" }}}

" Neocomplete {{{

let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = $HOME.'/.vim/tmp/neocomplete'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python='\h\w*\|[^. \t]\.\w*'

" }}}

" Jedi {{{

" Disable completion feature use neocomplete instead
let g:jedi#completions_enabled = 0

" }}}

" Po.vim {{{ -----------------------------------------------------------------

let g:po_translator = "joe di castro <joe@joedicastro.com>"

" }}}

" PythonMode {{{ -------------------------------------------------------------

nmap <silent><Leader>n :PymodeLint<CR>

let g:pymode_breakpoint_bind = '<Leader>B'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_ignore = ''
let g:pymode_virtualenv = 1
let g:pymode_rope = 0

" }}}

" Javascript {{{
let g:javascript_enable_domhtmlcss = 1
" }}}

" Syntastic {{{

nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" }}}

" Utl {{{

map <Leader>j :Utl <CR><Bar>:redraw!<CR>

let g:utl_cfg_hdl_scm_http_system = "silent !firefox %u &"
let g:utl_cfg_hdl_mt_application_pdf = 'silent :!zathura %p &'
let g:utl_cfg_hdl_mt_image_jpeg = 'silent :!sxiv %p &'
let g:utl_cfg_hdl_mt_image_gif = 'silent :!sxiv %p &'
let g:utl_cfg_hdl_mt_image_png = 'silent :!sxiv %p &'

" }}}

" VimFiler {{{

nnoremap <silent><Leader>X :VimFiler<CR>

let g:vimfiler_as_default_explorer = 1

let g:vimfiler_tree_leaf_icon = '├'
let g:vimfiler_tree_opened_icon = '┐'
let g:vimfiler_tree_closed_icon = '─'
let g:vimfiler_file_icon = '┄'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'

let g:vimfiler_force_overwrite_statusline = 0

let g:vimfiler_time_format = '%d-%m-%Y %H:%M:%S'
let g:vimfiler_data_directory = $HOME.'/.vim/tmp/vimfiler'

" }}}

" Vim-markdown-extra-preview {{{

" map <LocalLeader>mp :Me<CR>
" map <LocalLeader>mr :Mer<CR>

" let g:VMEPextensions = ['extra', 'codehilite']
" let g:VMEPhtmlreader= '/usr/bin/chromium'

" }}}

" vimux {{{

let g:VimuxUseNearestPane = 1

map <Leader>rr :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python2 '.b                                                                                                                                                      ufname("%"))<CR>
map <Leader>r3 :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python3 '.b                                                                                                                                                      ufname("%"))<CR>
map <Leader>rt :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time python                                                                                                                                                      2 '.bufname("%"))<CR>
map <Leader>rp :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time pypy '                                                                                                                                                      .bufname("%"))<CR>

map <Leader>rc :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>rs :VimuxInterruptRunner<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>rq :VimuxCloseRunner<CR>

" }}}

" Vinarise {{{

map <F6> :Vinarise<CR>

let g:vinarise_enable_auto_detect = 1

au FileType vinarise let g:airline_section_warning = ''

" }}}

" Virtualenv {{{

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

" }}}

" winresizer {{{

let g:winresizer_start_key = '<C-C><C-W>'
" cancelar pulsando ESC
" let g:winresizer_finish_with_escape = 1
let g:winresizer_keycode_finish = 27

" }}}

" zoomwintab {{{

map <Leader>z :ZoomWinTabToggle<CR>

" }}}

" END PLUGINS SETUP }}}

" FILETYPES  {{{ ==============================================================

" DJANGO HTML (Templates) {{{

au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html

" }}}

" JSON {{{ -------------------------------------------------------------------

autocmd BufNewFile,BufRead *.json set ft=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" JAVASCRIPT {{{ ---------------------------------------------------------------                                                                                                                                                      ----

au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

" }}}

" LUA {{{

au BufRead,BufNewFile rc.lua setlocal foldmethod=marker

" }}}

" PYTHON {{{

au FileType python setlocal foldlevel=1000
" Disable docstring popup during completion
au FileType python setlocal completeopt-=preview

" }}}

" MARKDOWN {{{

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd FileType markdown NeoBundleSource vim-markdown
autocmd FileType markdown NeoBundleSource vim-markdown-extra-preview

" }}}

" RUBY {{{

au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

" }}}


" END FILETYPES }}}

" Other Customizations {{{ ====================================================

let s:vimcustomfile = $HOME.'/.vim/custom.vim'

if filereadable(s:vimcustomfile)
    exec 'source '.s:vimcustomfile
endif

" }}}

" vim:foldmethod=marker
