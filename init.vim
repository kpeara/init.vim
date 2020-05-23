call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'crusoexia/vim-monokai'
Plug 'preservim/nerdcommenter'
Plug 'jelera/vim-javascript-syntax'
Plug 'morhetz/gruvbox'
Plug 'vimlab/split-term.vim'
call plug#end()

if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
    syntax on
    filetype plugin indent on

    " enable mouse
    set mouse=a

    "let g:livepreview_previewer = 'open -a Preview'

    "colorscheme efficient
    "let g:airline_theme='lucius'

    colorscheme gruvbox
    "colorscheme monokai
    "let g:airline_theme='lucius'
    set termguicolors

    "set transparency=30
    " setting dark theme for gruvbox in vim terminal
     set background=dark    " setting dark mode

     " change background
     highlight Normal ctermbg=NONE guibg=NONE

     " change line number
     highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
    "let g:java_highlight_functions = 1
    "let g:airline_powerline_fonts = 1

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

    " java map
    autocmd FileType java map sout<Tab> iSystem.out.println("");<Esc>F"i

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
    vmap ++ <plug>NERDCommenterToggle
    nmap ++ <plug>NERDCommenterToggle

    " open integrated terminal the right way (Vim8 style)
    cabbrev ter Term
    cabbrev term Term
    cabbrev termi Term
    cabbrev termin Term
    cabbrev termina Term
    cabbrev terminal Term

    " match braces, quotes
    inoremap { {}<Esc>i
    inoremap ( ()<Esc>i
    inoremap " ""<Esc>i
    inoremap ' ''<Esc>i

    " COC Stuff

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

endif

