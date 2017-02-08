" VIMRC by Alexander Abrosimov

" don't care about vi compatible
set nocompatible

" locale
if has('win32') || has('win64')
    language US
else
    language en_US.UTF-8
endif
if has('multi_byte')
    set encoding=UTF-8
    set fileencodings=utf-8,cp1251,koi8-r,latin1
endif
set fileformats=unix,dos,mac

" GUI options
if has('gui_running')
    set guioptions=aAP
    if has('win32') || has('win64')
        set guifont=Pragmata_Pro:h10,Consolas:h10
        " maximize window in Windows
        autocmd GUIEnter * simalt ~x
        " fixing problem with arrow symbols
        set linespace=0
    else
        set guifont=PragmataPro\ Mono\ 12,Consolas\ 10
    endif
else
   if !has('win32') && !has('win64')
      set t_Co=256
   endif
endif

" mouse
if has('mouse')
    set mouse=a
    set mousemodel=extend
    set mousehide
endif

call plug#begin()

Plug 'tomtom/tcomment_vim'
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'szw/vim-ctrlspace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tommcdo/vim-exchange'

call plug#end()

" colors
set background=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection=0
let g:gruvbox_italicize_strings=1
colorscheme gruvbox

" search options
set ignorecase
set smartcase
set incsearch
set hlsearch

" substitute options
set gdefault

" current cursor position in lower right corner
set ruler

" lines numbers
set relativenumber
set number
set numberwidth=1

" scroll offset
set scrolloff=0
set scrolljump=-25

" tabs
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

" Invisible symbols
set list
set listchars=tab:\¦\ ,trail:·,extends:→,precedes:←,nbsp:×

" Separators and character to fill
set fillchars+=vert:│

" command in bottom right portion of the screen
set showcmd

" indent options
set autoindent
set smartindent

" code folding
set foldenable
set foldmethod=syntax
set foldcolumn=2
set foldlevelstart=99

" nice command-line completions
set wildmenu
set wildmode=list,longest,full
set wcm=<Tab>

" text margins and wrapping
set wrap
set linebreak
set showbreak=↪\ 
set textwidth=80
set colorcolumn=+1

" highlight current line
set cursorline

" always show tabs line
set showtabline=2

" reread file if it have been changed somewhere else
set autoread

" ask to overwrite file
set confirm

" backspace settings
set backspace=indent,eol,start

" autocompletion settings
set pumheight=10
set completeopt=menu,menuone,longest,preview
set previewheight=5

" when switching between buffers, jump to the first open window that contains
" specified buffer considering all tabs
set switchbuf=usetab
" don't save files during switching between buffers
set hidden


" Mappings
" fix for annoying typo
command! W :w
command! Bd :bd

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" remove trailing spaces
noremap <silent><Leader><Space> :%s/\ \+$//c<CR>

" open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" open file in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" don't make any backups, use git instead
set nobackup
set nowritebackup

" keep all buffers in memory
set noswapfile

" maximize history
set history=1000

" spell checking
set spelllang=en_us,ru_ru
set spell
set spellsuggest=best,10

" use xmllint for pretty formating
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" jump to the last known cursor position
" don't do it when the position is invalid or when inside an event handler
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif


" clipboard
set clipboard=unnamed,autoselect,autoselectplus
if has('unnamedplus')
    set clipboard+=unnamedplus
endif

" YouCompleteMe
let g:ycm_add_preview_to_completeopt=1
" let g:ycm_autoclose_preview_window_after_insertion=1
map <silent> <Leader>yg :YcmCompleter GoTo<CR>

" Airline
" Always show airline
set laststatus=2
" Don't display current mode
set noshowmode
" Use fancy powerline symbols
let g:airline_powerline_fonts=1
" Disable use of %(%) grouping items in the statusline, fixes bleeding color
" artifact for whitespace section, sometimes causes problem if GVim window is
" resized
let airline#extensions#default#section_use_groupitems = 0
" Truncate long branch names to a fixed length
let g:airline#extensions#branch#displayed_head_limit=15
" Truncate all path sections but the last one, e.g. foo/bar/baz => f/b/baz
let g:airline#extensions#branch#format = 2
" Display tabs and buffers for CtrlSpace
let g:airline#extensions#tabline#enabled = 1
" Uniquify buffers names with similar filename, suppressing common parts of
" paths
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Do not show parent directories for unique filename
let g:airline#extensions#tabline#fnamemod=':t'
" Quickly select tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" ctrlspace
" let g:ctrlspace_ignored_files='\v\.(exe|obj|mak|r45|res|s45|ewp|eww|ewd|resc|lng|xcl|xls)$'
" let g:ctrlspace_ignored_files='\v^(.*hs)@!'
let g:ctrlspace_ignored_files='\v^(.*\.(hs|cpp|c|h|py|sh|html|js|json)$)@!'
" Integration with airline
" TODO: check if it is necessary!!!
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

" diff options
set diffopt=filler,vertical,iwhite
