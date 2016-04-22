" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.
set encoding=utf-8

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

"runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=5                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
" Changed to powerline on 3/12/12 so not using at the moment
"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ L:%l/%L[%p%%]\ C:%v\ %)%P

" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" set list mode to show invisible chars
set list
" Added 1/3/13
set showbreak=↪
set splitbelow
set splitright

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800
" Resize splits when the window is resized
au VimResized * :wincmd =
" }}}
" Only shown when not in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars=trail:⌴
    au InsertLeave * :set listchars=tab:▸\ ,eol:¬
augroup END

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Toggle line numbers
nnoremap <silent><leader>n :setlocal number!<cr>
":au FocusLost * :set number
":au FocusGained * :set relativenumber
" change from relative to absolute depending on which mode we're in
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd FocusLost * :set number
" fix this up a bit
autocmd FocusGained * :set relativenumber
autocmd BufNewFile * :set relativenumber
autocmd BufReadPost * :set relativenumber
autocmd FilterReadPost * :set relativenumber
autocmd FileReadPost * :set relativenumber

" NumberToggle toggles between relative and absolute line numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
nnoremap <silent><leader>rn :call NumberToggle()<cr>

" Toggle paste
map <silent><leader>p :set invpaste<cr>
"set pastetoggle=<F6>

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview


" Or use vividchalk
"colorscheme topfunky-light
" colorscheme vividchalk
syntax enable
set background=dark
"colorscheme solarized

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" nnoremap <silent> <Leader>t :CommandT<CR>
" nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" use ctrl-l to clear the hlsearch and redram screen
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" close nerdtree if it's there's no more files being edited
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" increase buffers for fuzzy finder in order to avoid the exception
" TooManyEntries exception (in root dir)
" let g:fuzzy_ceiling = 500000

" NERD Tree {{{ Added 1/3/13

"noremap  <F2> :NERDTreeToggle<cr>
"inoremap <F2> <esc>:NERDTreeToggle<cr>
"
"augroup ps_nerdtree
"    au!
"
"    au Filetype nerdtree setlocal nolist
"    " au Filetype nerdtree nnoremap <buffer> K :q<cr>
"augroup END
"
"let NERDTreeHighlightCursorline = 1
"let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', '.*.pid', '.*\.o$', 'db.db', 'tags.bak', '.*.swp']
"
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"let NERDChristmasTree = 1
"let NERDTreeChDirMode = 2
"let NERDTreeMapJumpFirstChild = 'gK'
"
"" vim-slime to send from tmux panes/windows to others
"let g:slime_target = "tmux"

" added indent stuff 2/4/13
set autoindent                              "Retain indentation on next line
set smartindent                             "Turn on autoindenting of blocks

inoremap # X<C-H>#|                         "And no magic outdent for comments
nnoremap <silent> >> :call ShiftLine()<CR>| "And no shift magic on comments

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction

" when switching buffers using :sb also use tabs
set switchbuf=useopen,usetab

" open help in a separate tab
"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help' && g:help_in_tabs
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

let g:help_in_tabs = 1

" Rainbow parens for Lisp variants
" added 3/8/13 (Happy Birthday)
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"
"nnoremap <F3> :GundoToggle<CR>

" Added 3/12/13
" configure Powerline, enable fancy symbols
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode' " this displays but looks weird
"python import sys; sys.path.append("/usr/local/lib/python2.7/site-packages/")

"set rtp+=/Users/bassem/bin/powerline/powerline/bindings/vim
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)"

"set lazyredraw
" Enable powerline fonts for airline
"let g:airline_powerline_fonts = 1
"let g:airline_modified_detection = 1
"let g:airline_enable_branch = 1
"let g:airline_enable_syntastic = 0
"let g:airline_theme = 'solarized'
"
""let g:Powerline_theme="solarized"  " fix me XXX
"let g:Powerline_colorscheme = &background == 'light' ? 'solarized' : 'solarized256'

" Added 5/5/13 (Cinco de Mayo) to enable paredit for clojure files
"au BufNewFile,BufRead *.clj call PareditInitBuffer()
"let g:paredit_smartjump = 1
"let g:paredit_electric_return = 1

" Added 6/16/13 from destroy all software screencast
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
