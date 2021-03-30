" leader key
let mapleader=","

" vim plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'lilydjwg/colorizer'		" hex color highlighting
" Plug 'kovetskiy/sxhkd-vim' 		" sxhkdrc syntax highlighting
Plug 'tpope/vim-commentary'		" make commenting easier
" Plug 'dracula/vim', { 'as': 'dracula' } " dracula color scheme
Plug 'morhetz/gruvbox' 			" gruvbox colorscheme
" Plug 'SirVer/ultisnips' 		" vim snippets to make coding and stuff faster
" Plug 'honza/vim-snippets' 		" provides actual snippets for 'ultisnips'
" Plug 'vifm/vifm.vim' 			" vifm integration in vim, also provides vifmrc syntax highlighting
" Plug 'klen/python-mode' 		" make vim a python ide
Plug 'neoclide/coc.nvim', {'for':['python'], 'branch': 'release'}
" Plug 'airblade/vim-gitgutter'
call plug#end()

set number relativenumber 		" line numbers
set clipboard+=unnamedplus		" use system clipboard
set mouse=a				" enable mouse
syntax on				" enable syntax highighting
set ignorecase				" case insensitive search
set smartcase				" respect case if search contains upper case
set termguicolors			" enable 256 colors mode
set wildmode=longest,list,full		" tabcompletion...
set splitbelow splitright		" split windows down and right... keep the original where it was
set nobackup
set nowritebackup
set noswapfile
set scrolloff=999			" keep cursor on the middle of screen
set backspace=indent,eol,start		" make backspace greate again
" set linebreak
" set cursorline
colorscheme gruvbox			" default colorscheme
hi Normal guibg=NONE ctermbg=NONE	" disable colorscheme background to use terminal's

" vim colorizer
" let g:colorizer_startup = 0

" vifm config
" let g:vifm_exec_args = "-c only"
" vifm splits
map <leader>s :SplitVifm<CR>
map <leader>v :VsplitVifm<CR>

" split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l
map <A-Tab> <C-w><C-w>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" substitute easily
nnoremap S :%s//g<Left><Left>

" Redo with U
nnoremap U <C-r>

" really delete text instead of copying it into the register
" noremap d "_d
" noremap dd "_dd

" save and close quickly without having to correct error
command! Q :q
command! W :w
command! WQ :wq
command! Wq :wq

" remove highlighting of search term
map <Leader><Space> :let @/=''<CR>

" resize splits when vim resizes
autocmd VimResized * wincmd =

" remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" load xresources automatically
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" load sxhkd automatically
" autocmd BufWritePost *sxhkdrc !pkill -USR1 -x sxhkd

" load imwheelrc automatically
" autocmd BufWritePost *imwheelrc !imwheel -k

" restart bspwm on config edit
" autocmd BufWritePost *bspwmrc,*autostart,*external_rules !bspc wm -r

" restart panel on config edit
" autocmd BufWritePost *panel,*panel_bar,*panel_colors !pkill -USR2 panel

" autocmd BufWritePost *dunstrc !pkill dunst ; dunst &

" source init.vim
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" (vim-commentry) set " to comment string for vifmrc
autocmd FileType vifm setlocal commentstring=\"\ %s
autocmd FileType xdefaults setlocal commentstring=\!\ %s

" add shebang depending on extension
autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\"|$
autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env sh\<nl>\"|$

" Set scripts to be executable from the shell
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif

"" snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" return to last edit position
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
