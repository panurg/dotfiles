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
        " set lines=65
        " set columns=150
        " winpos 350 80
        " fixing problem with arrow symbols
        " set linespace=1
    endif
else
   if !has('win32') && !has('win64')
      " set t_Co=256
   endif
endif

" mouse
if has('mouse')
    set mouse=a
    set mousemodel=extend
    set mousehide
endif

" vundle - plugin manager
filetype off
set rtp+=~/.vim/bundle/vundle/
if has('win32') || has('win64')
    " workaround for MERA proxy
    let g:vundle_default_git_proto='https'
endif

call vundle#rc()

Plugin 'gmarik/vundle'
" Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'
" Plugin 'Lokaltog/powerline'
Plugin 'scrooloose/nerdtree'
" Plugin 'eclim', {'pinned': 1}
if has('win32') || has('win64')
    Plugin 'Valloric/YouCompleteMe', {'name': 'YouCompleteMe_win', 'pinned': 1}
else
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
" Plugin 'bling/vim-bufferline'
Plugin 'szw/vim-ctrlspace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tommcdo/vim-exchange'

filetype plugin indent on

" eclim
" map <silent> <Leader>pt :ProjectTreeToggle<CR>
" map <silent> <Leader>pT :ProjectsTree<CR>
" let g:EclimProjectTreeExpandPathOnOpen=1
" YCM support
" let g:EclimCompletionMethod='omnifunc'

" colors
colorscheme gruvbox
syntax on
set background=dark
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection=0

" Powerline
set laststatus=2
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode

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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Invisible symbols
set list
" set listchars=tab:\>\-,trail:·
" set listchars=tab:\▸\·,trail:·,eol:¬
" set listchars=tab:⁞\ ,trail:·
" set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
" set listchars=tab:▸\ ,eol:¬ # TextMate
" set listchars=tab:»\ ,trail:·,eol:¶,extends:>,precedes:<,nbsp:_
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

" session options
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,winpos,resize

" nice command-line completions
set wildmenu
set wildmode=list,longest,full
set wcm=<Tab>

" text margins and wrapping
set wrap
set linebreak
" set showbreak=->\ 
set showbreak=↪\ 
set textwidth=80
set colorcolumn=+1

" highlight current line
set cursorline

" tabs settings
set showtabline=2

" reread file if it have been changed somwhere else
set autoread

" ask to overwrite file
set confirm

" backspace settings
set backspace=indent,eol,start

" autocompletion settings
set pumheight=10
set completeopt=menu,menuone,longest,preview
set previewheight=5

" buffer settings
" switching between buffers
set switchbuf=useopen " wtf???
" don't save files during switching between buffers
set hidden


" Useful mappings
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

" backups
" don't use them
set nobackup
set noswapfile

" maximize history
set history=1000

" spell checking
set spelllang=en_us,ru_ru
set spell
set spellsuggest=best,10

" ignore object files
" set wildignore+=*.obj,*.exe,*.tlog,*.mak,*.pyc,*.res,*.lng,*.bi,*.lib,*.resc,*.r45,*.vcxproj,*.sbr

" NERDTree
map <silent> <Leader>nt :NERDTreeToggle<CR>

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
if has('gui_running')
    let g:airline_powerline_fonts=1
else
    " let g:airline_theme='monochrome'
endif
" let g:airline#extensions#branch#enabled=1
" let g:airline#extensions#branch#empty_message=''
let g:airline#extensions#branch#displayed_head_limit=15
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#fnamemod=':t' "show just the file name
" let g:airline#extensions#tabline#tab_nr_type=1 " tab number
" let g:airline#extensions#tabline#buffer_idx_mode=1
" let g:airline#extensions#tabline#formatter='unique_tail_improved'
" let g:airline#extensions#tagbar#flags='fs'
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9

" Tagbar
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=-1
let g:tagbar_iconchars=['▸', '▾']
highlight TagbarVisibilityPrivate ctermfg=167 guifg=#fb4934
highlight TagbarVisibilityProtected ctermfg=175 guifg=#d3869b
highlight TagbarVisibilityPublic ctermfg=108 guifg=#8ec07c
nmap <silent><leader>tt :TagbarOpenAutoClose<CR>

" ctrlspace
" let g:ctrlspace_ignored_files='\v\.(exe|obj|mak|r45|res|s45|ewp|eww|ewd|resc|lng|xcl|xls)$'
" let g:ctrlspace_ignored_files='\v^(.*hs)@!'
let g:ctrlspace_ignored_files='\v^(.*\.(hs|cpp|c|h|py|sh|html|js|json)$)@!'


" diff options
set diffopt=filler,vertical

" YouCompleteMe and UltiSnips integration
" function! g:UltiSnips_Complete()
"    call UltiSnips#ExpandSnippet()
"    if g:ulti_expand_res == 0
"       if pumvisible()
"          return "\<C-n>"
"       else
"          call UltiSnips#JumpForwards()
"          if g:ulti_jump_forwards_res == 0
"             return "\<TAB>"
"          endif
"       endif
"    endif
"    return ""
" endfunction

" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

