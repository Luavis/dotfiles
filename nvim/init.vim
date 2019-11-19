"No compatibility to traditional vi
set nocompatible

"vim-plug
call plug#begin('~/.config/nvim/plugged')

"Plugin list ------------------------------------------------------------------

Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/Mustang2'
Plug 'vim-scripts/Railscasts-Theme-GUIand256color'
Plug 'vim-scripts/darktango.vim'
Plug 'junegunn/seoul256.vim'
Plug 'vim-scripts/xoria256.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'chriskempson/tomorrow-theme'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'cstrahan/vim-capnp'
Plug 'neovimhaskell/haskell-vim'
Plug 'pbrisbin/vim-syntax-shakespeare'

Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'davidhalter/jedi-vim'
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'vim-scripts/The-NERD-Tree'
Plug 'Valloric/YouCompleteMe'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

"End plugin list --------------------------------------------------------------
call plug#end()

"Syntax highlighting.
syntax on
set number

"Not create swapfile
set nowrapscan
set noswapfile

"Softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent nosmartindent

"set tab characters apart
set listchars=tab:↹\

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

set backspace=2

"Detect modeline hints.
set modeline

"Disable bell
set visualbell t_vb=

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"More tabs
set tabpagemax=25

filetype plugin on

set bg=dark
let g:solarized_termcolors=256
colorscheme solarized


let g:committia_open_only_vim_starting=0

set gfn=D2Coding:h13
map <F3> :NERDTreeToggle<cr>

"Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.scss setfiletype scss
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less


"highlight whitespace trailling and remove it when save
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au FileType c,cpp,java,php,javascript,html,css,objective-c
    \ au BufWritePre <buffer> :%s/\s\+$//e

"These languages have their own tab/indent settings.
au FileType cpp    setl ts=2 sw=2 sts=2
au FileType ruby   setl ts=2 sw=2 sts=2
au FileType yaml   setl ts=2 sw=2 sts=2
au FileType html   setl ts=2 sw=2 sts=2
au FileType jinja  setl ts=2 sw=2 sts=2
au FileType lua    setl ts=2 sw=2 sts=2
au FileType haml   setl ts=2 sw=2 sts=2
au FileType sass   setl ts=2 sw=2 sts=2
au FileType scss   setl ts=2 sw=2 sts=2
au FileType make   setl ts=4 sw=4 sts=4 noet
au FileType gitcommit setl spell

"Syntastic-related configurations.
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Markdown-related configurations.
augroup mkd
  autocmd BufRead *.markdown set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkdn     set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkd      set formatoptions=tcroqn2 comments=n:> spell
augroup END

"English spelling checker.
setlocal spelllang=en_us

"Keep 80 columns.
set colorcolumn=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd WinEnter * match OverLength /\%81v.\+/

"I dislike folding.
set nofoldenable

"I dislike visual bell as well.
set novisualbell

let g:deoplete#enable_at_start = 1

"gVim-specific configurations (including MacVim).
if has("gui_running")
  set bg=dark
  set guioptions=egmrLt
  set linespace=1
endif

"MacVim-specific configurations.
if has("gui_macvim") || has("gui_vimr")
  set imd
  set guifont=Source_Code_Pro_Light:h16.00
endif

"GVim under GNOME
if has("gui_gnome")
  set guifont="Ubuntu Mono 11"
endif

"GVim under Windows
if has("gui_win32")
  set guifont=Consolas:h11:cANSI
endif

"vim-airline
let g:airline_powerline_fonts = 1

"Mundo -- Undo tree visualization
set undofile
set undodir=~/.config/nvim/undo
nnoremap <F5> :MundoToggle<CR>
let g:mundo_right=1

"Use Vimfiler as default explorer like netrw
let g:vimfiler_as_default_explorer = 1

hi DiffAdd cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffText cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

set background=dark
colorscheme tomorrow
set nopaste

"Move tab next-previous
nnoremap <C-S-Left> :tabprevious<CR>
nnoremap <C-S-Right> :tabnext<CR>
nnoremap <F4> :bel sp 50 \| resize 10 \| terminal<CR>

"nnoremap <C-S-T>    :tabe<CR>
"nnoremap <C-W>      :q<CR>

