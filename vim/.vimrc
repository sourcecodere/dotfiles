"
" General behaviour
"
set nocompatible            " must be on top
set mouse=                  " disable mouse
set showcmd                 " display vim commands at the bottom
set number relativenumber
set encoding=utf-8

" Always use english language in vim application
language messages en_US.UTF-8

if has("win32")
  " Requires the font `Hack` from https://sourcefoundry.org/hack/
  set guifont=Hack:h12

  " Remove toolbar and menubar
  set guioptions-=T
  set guioptions-=m

  " Make backspace behave normally
  set backspace=2

  if has("directx")
    set renderoptions=type:directx
  endif

  " Use powershell instead of cmd as the shell
  set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
  set shellcmdflag=-ExecutionPolicy\ Unrestricted\ -NoProfile\ -Command
endif

" Searching
set hlsearch    " highlight all matches
set incsearch   " search as you type
set ignorecase  " ignore case in search patterns
set smartcase   " ...unless the pattern has capital letters


"
" Statusline
"
set laststatus=2  " more visible status bar
set wildmenu      " better tab completion in status bar

" Display git branch in lightline status line
let g:lightline = {
    \   'active': {
    \     'left': [
    \       [ 'mode', 'paste' ],
    \       [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \     ]
    \   },
    \   'component_function': {
    \     'gitbranch': 'FugitiveHead'
    \   },
    \ }


"
" Formatting and display
"
filetype plugin indent on
syntax on
set background=light

" These are needed for true color support in terminals other than xterm when
" using `termguicolors`. A notable example is tmux terminals.
" See `:help xterm-true-color` for more information.
function FixColors()
  if &term ==# "screen-256color"
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endfunction

call FixColors()

" Ensure FixColors() are ran again if a plugin messes with the terminal. This
" is the case with vim-gnupg, which is why you get no colors in tmux terminals
" without this workaround when editing gpg files.
autocmd TermChanged * call FixColors()

if &term =~ "-256color" || has("gui_running")
  set termguicolors
  colorscheme solarized8
  let g:lightline.colorscheme = 'solarized'
endif

" Text width
set textwidth=79
set nowrap         " do not wrap long lines when displayed
set colorcolumn=+1 " display indicator line at textwidth + 1

" Defaults for tabs and indentation
set expandtab      " use spaces for tabs by default
set shiftwidth=4
set tabstop=4
set softtabstop=-1

" Make tabs, trailing and non-breaking spaces, and line continuations visible
set list
set listchars=tab:▸\ ,extends:»,precedes:«,trail:·,nbsp:·

" Disable folding for markdown plugin
let g:vim_markdown_folding_disabled = 1

" Prefer ASCII-armored files for gnupg plugin
let g:GPGPreferArmor=1


"
" Filetype defaults
"
autocmd FileType yaml setlocal ts=2 sw=2 expandtab


"
" Keybindings
"
" Note that everything after the remap command is interpreted as part of the
" insert, so do not put vim comments on the right side of these.
"
" Default leader char is backslash '\'

" Toggle paste mode
set pastetoggle=<Leader>p

" Clear search highlights
nnoremap <Leader><Space> :nohl<CR>

" Toggle wrap
nnoremap <Leader>w :set wrap!<CR>

" Open netrw in a vertical split
nnoremap <leader>e :Explore<CR>

" Save file with sudo using the eunuch plugin
cnoremap w!! :SudoWrite<CR>
