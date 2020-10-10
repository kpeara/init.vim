call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'crusoexia/vim-monokai'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'preservim/nerdcommenter'
Plug 'jelera/vim-javascript-syntax'
Plug 'lervag/vimtex'
call plug#end()

syntax on
filetype plugin indent on

" enable mouse
set mouse=a

colorscheme solarized8
"colorscheme dracula
"colorscheme gruvbox
"let g:airline_theme='ayu_dark' " general powerline theme
let g:airline_powerline_fonts = 1
set termguicolors

" use vim keys in nvim terminal
tnoremap <Esc> <C-\><C-n>

"setting theme color for gruvbox && paperColor
set background=light " setting dark mode
"set background=dark

" make background transparent (use terminal background)
"highlight Normal ctermbg=NONE guibg=NONE

" change line number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"let g:java_highlight_functions = 1

"detect LaTeX properly initially
autocmd BufRead,BufNewFile *.tex set filetype=tex

"remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

set autoindent

set number

set incsearch

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set guifont=Menlo\ Regular:h18

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" copying to system clipboard
vnoremap <C-c> "+y

" commenting with cmd /
imap ~cmd/ <Esc><plug>NERDCommenterToggle
nmap ~cmd/ <plug>NERDCommenterToggle
vmap ~cmd/ <plug>NERDCommenterToggle

" save with cmd s
imap ~cmd+s <Esc>:w<Enter>
nmap ~cmd+s <Esc>:w<Enter>
vmap ~cmd+s <Esc>:w<Enter>

" open integrated terminal in split
cabbrev te split<Enter><C-l>:terminal<Esc>iclear
cabbrev ter split<Enter><C-l>:terminal<Esc>iclear
cabbrev term split<Enter><C-l>:terminal<Esc>iclear
cabbrev termi split<Enter><C-l>:terminal<Esc>iclear
cabbrev termin split<Enter><C-l>:terminal<Esc>iclear
cabbrev termina split<Enter><C-l>:terminal<Esc>iclear
cabbrev terminal split<Enter><C-l>:terminal<Esc>iclear
cabbrev vterm vs<Enter><C-l>:terminal<Esc>iclear
cabbrev Vterm vs<Enter><C-l>:terminal<Esc>iclear
cabbrev VTerm vs<Enter><C-l>:terminal<Esc>iclear

" match braces, quotes
"autocmd FileType java,c,python,javascript inoremap { {}<Esc>i
"autocmd FileType java,c,python,javascript inoremap ( ()<Esc>i
"autocmd FileType java,c,python,javascript inoremap [ []<Esc>i
"autocmd FileType java,c,python,javascript inoremap " ""<Esc>i
"autocmd FileType java,c,python,javascript inoremap ' ''<Esc>i

autocmd FileType java,c,javascript inoremap {<Enter> {<Enter>}<Esc>O

" for empty string/params
"autocmd FileType java,c,python,javascript inoremap () ()
"autocmd FileType java,c,python,javascript inoremap [] []
"autocmd FileType java,c,python,javascript inoremap "" ""
"autocmd FileType java,c,python,javascript inoremap '' ''

" java map
autocmd FileType java inoremap sout<Enter> System.out.println();<Esc>F)i
autocmd FileType java inoremap main<Enter> public static void main(String[] args) {<Enter>}<Esc>O


" remap window navigation
"map <C-k> <C-w>k
"map <C-j> <C-w>j
"map <C-h> <C-w>h
"map <C-l> <C-w>l

" FZF Stuff
set rtp+=/usr/local/opt/fzf

" COC Stuff

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
