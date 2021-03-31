"No compatibility to traditional vi
set nocompatible

"vim-plug
call plug#begin('~/.config/nvim/plugged')

"Plugin list ------------------------------------------------------------------
Plug 'junegunn/seoul256.vim'

Plug 'plasticboy/vim-markdown'
Plug 'othree/html5.vim'
Plug 'lepture/vim-jinja'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bling/vim-airline'
Plug 'vim-scripts/The-NERD-Tree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

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

set mouse=an

let g:committia_open_only_vim_starting=0

"Theme settings
let g:seoul256_background = 235
colo seoul256
set background=dark
set nopaste

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

"Keep 80,120 columns.
set colorcolumn=80,120
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
autocmd WinEnter * match OverLength /\%81v.\+/
hi! ColorColumn ctermbg=bg

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

hi DiffAdd cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
hi DiffText cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

"Move tab next-previous
nnoremap <C-S-Left> :tabprevious<CR>
nnoremap <C-S-Right> :tabnext<CR>
nnoremap <F4> :bel sp 50 \| resize 10 \| terminal<CR>

"NerdTree
let g:NERDTreeWinPos = "left"
map <F3> :NERDTreeToggle<cr>
autocmd VimEnter * NERDTree | wincmd p

function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction

augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

"Remove tilde
hi! EndOfBuffer ctermfg=bg ctermbg=bg guifg=bg guibg=bg

"Split line style
hi! VertSplit ctermfg=bg ctermbg=240 guifg=bg guibg=bg

"Use OS clipboard
set clipboard=unnamed

"Keyword settings
set iskeyword=@,48-57,192-255

