" Specify a directory for plugins:
" - Avoid using standard Vim directory names like 'plugin'.
" - Call :PlugInstall to install plugins.
call plug#begin('~/.local/share/nvim/plugged')

" Plugin issues? Try :CheckHealth

" IDE-ish
Plug 'tpope/vim-surround'                  " edit surrounding {} [] '' <tag></tag>
Plug 'tpope/vim-unimpaired'                " pairs of mapping like ]os & [os
Plug 'tpope/vim-vinegar'                   " open NERDTree with -
Plug 'tpope/vim-repeat'                    " better support for .
Plug 'tpope/vim-abolish'                   " search for, substitute, abbreviate variants of a word
Plug 'tpope/vim-commentary'                " comment out code
Plug 'tpope/vim-sensible'                  " sensible defaults for Vim
Plug 'mhinz/vim-startify'                  " welcome screen for Vim
Plug 'scrooloose/nerdtree'                 " file/directory explorer
Plug 'editorconfig/editorconfig-vim'       " honor EditorConfig files
Plug 'vasconcelloslf/vim-interestingwords' " highlight words
Plug 'machakann/vim-highlightedyank'       " highlight yanked text
Plug 'nathanaelkane/vim-indent-guides'     " make indents easier to see
" Plug 'christoomey/vim-tmux-navigator'      " seamless nav between tmux panes and vim splits
Plug 'moll/vim-bbye'                       " delete buffers without messing up your layout
" Plug 'RRethy/vim-hexokinase'               " hex color swatches like #ff77bb
Plug 'airblade/vim-rooter'                 " intelligently change :pwd when opening a file (Startify does it too, but only if you open via Startify)
Plug 'kshenoy/vim-signature'               " show marks by the number column
Plug 'nvim-lualine/lualine.nvim'           " status line
Plug 'bluz71/vim-moonfly-statusline'       " status line theme & config

" Asynchronous linting
Plug 'w0rp/ale', {
   \ 'do': 'npm install -g prettier tslint typescript eslint @typescript-eslint/parser neovim' }

" Formatting
Plug 'prettier/vim-prettier', {
   \ 'do': 'npm install',
   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'rking/ag.vim' " The Silver Searcher

" Motions
Plug 'easymotion/vim-easymotion'           " easy cursor movements

" Syntax highlighting
Plug 'eapache/rainbow_parentheses.vim'     " syntax matching for parens
Plug 'thiagoalessio/rainbow_levels.vim'    " text colors by indentation level
Plug 'dominikduda/vim_current_word'        " highlight word under the cursor (all occurrences)
Plug 'gregsexton/MatchTag', { 'for': ['html', 'css', 'javascript.jsx'] } " MatchParen for HTML tags
Plug 'robert-claypool/SQLUtilities'        " SQL formatting
Plug 'vito-c/jq.vim', { 'for': ['jq'] }    " https://stedolan.github.io/jq/

Plug 'lifepillar/pgsql.vim'                " PL/pgSQL and PostGIS syntax highlighting
let g:sql_type_default = 'pgsql'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" Git
" Plug 'tpope/vim-fugitive'                  " wrapper functions for Git
Plug 'mhinz/vim-signify'                   " visual display of diffs

" Golang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Color schemes
Plug 'Pocco81/Catppuccino.nvim'
Plug 'bluz71/vim-nightfly-guicolors'

let g:rainbow_levels = [
    \{'ctermfg': 84,  'guifg': '#50fa7b'},
    \{'ctermfg': 117, 'guifg': '#8be9fd'},
    \{'ctermfg': 61,  'guifg': '#6272a4'},
    \{'ctermfg': 212, 'guifg': '#ff79c6'},
    \{'ctermfg': 203, 'guifg': '#ffb86c'},
    \{'ctermfg': 228, 'guifg': '#f1fa8c'},
    \{'ctermfg': 15,  'guifg': '#f8f8f2'},
    \{'ctermfg': 231, 'guifg': '#525563'}]

call plug#end()

if &compatible " if not already set
    " Use Vim defaults (easier, more user friendly than vi defaults).
    " This must be first because it changes other options as a side effect.
    set nocompatible
endif

" See http://usevim.com/2012/10/19/vim101-set-hidden/
" Vim keeps us safe from quitting altogether while having unwritten buffers,
" so there's no chance of accidentally losing data.
" Reminders:
"   1. Edit multiple buffers using :bufdo
"   2. Use :wa to write all
set hidden

" Remove ALL autocommands to prevent them from being loaded twice.
if has('autocmd')
    autocmd!
endif

if has('syntax')
    syntax on " of course
endif

" Set Vim-specific sequences for RGB 24-bit colors.
" This works in xterm when $TERM is 'xterm-256color'
" and in termite when $TERM is 'xterm-termite'
" and in tmux when $TERM is 'screen-256color'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set t_Co=256                   " tell Vim that the terminal supports 256 colors
set t_ut=                      " Disable Background Color Erase for Tmux + Vim. http://superuser.com/a/562423
set vb                         " visual beep, make co-workers happier
set cursorline                 " highlight current line
set cursorcolumn               " highlight the current column
set showmatch                  " briefly jump to the matching brace when you insert one
set incsearch                  " search as characters are typed
set ignorecase                 " ignore case when searching
set smartcase                  " ignore case if search pattern is all lowercase
set hlsearch                   " highlight matches
set nowrap                     " wrapping is ugly, off by default
set linebreak                  " but if you switch to wrapping, try not to wrap in the middle of words
set ruler                      " show line number, row/column, or whatever is defined by rulerformat
set title                      " show xterm title, does nothing in GVim
set backspace=indent,eol,start " allow the backspace key to erase previously entered text, autoindent, and newlines
set autoindent                 " autocopy the indentation from the previous line
set nrformats=hex              " because I literally never deal with octal, incrementing 06 (CTRL-A) should result in 07
set foldcolumn=1               " add some left margin
set encoding=utf8              " the Vim default is Latin-1, yikes! see http://unix.stackexchange.com/a/23414
set history=500                " keep a longer history, 20 is the default
set scrolloff=5                " start scrolling a few lines before the border (more context around the cursor)
set sidescrolloff=3            " don't scroll any closer to the left or right
set laststatus=2               " always show the status line
set cmdheight=2                " more space for displaying messages
set noshowmode                 "hide mode (e.g. '-- INSERT --') in command line
set autoread                   " auto reload files changed outside of Vim
set synmaxcol=1000             " limit syntax highlighing
set breakindent                " make long lines wrap with indentation
set lazyredraw                 " don't redraw screen in the middle of a macro, makes them faster


" Enable live substitution (Neovim only)
set inccommand=split

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Open new split panes to the right and bottom, which feels more natural.
set splitbelow
set splitright

set showcmd " shows the current command hence the leader key for as long as it is active

" Time out on mapping after 1 second, time out on key codes after 100ms.
" See ':help timeoutlen' and tpope/sensible-vim
set timeout timeoutlen=1000 ttimeoutlen=100

let mapleader="," " backslash is the default, comma is easier
let g:mapleader=","

" Keep <Leader> and <LocalLeader> different to reduce chance of mappings from
" global plugins to clash with mappings for filetype plugins.
" Use \\ because we must escape the backslash.
let maplocalleader="\\"

" Terminal emulation
:tnoremap <esc> <c-\><c-n>

" Disable help
vnoremap K <nop>
nnoremap K <nop>

" JavaScript & TypeScript formatting require https://github.com/prettier/prettier
vnoremap <localleader>=j'<,'>Prettier<cr>
nnoremap <localleader>=j <nop>
vnoremap <localleader>=t :'<,'>Prettier<cr>
nnoremap <localleader>=t <nop>

nnoremap <localleader>ev :vsplit $MYVIMRC<cr>| " mnemonic = 'e'dit my 'v'imrc file
nnoremap <localleader>rl :RainbowLevelsToggle<cr>| " mnemonic = 'r'ainbow 'l'evels

if !has('clipboard')
    echom "The +clipboard feature was not found."
endif

" Make Y move like D and C.
" By default Y copies the whole line.
noremap Y y$

" Easier yank into CLIPBOARD:
vnoremap <localleader>yy "+y
vnoremap <localleader>YY "+Y
nnoremap <localleader>yy <nop>| " <nop> because it's useless to 'y' with nothing selected
nnoremap <localleader>YY "+Y

if has('X11')
    " Easier yank into PRIMARY:
    vnoremap <localleader>y* "*y
    vnoremap <localleader>Y* "*Y
    nnoremap <localleader>y* <nop>| " <nop> because it's useless to 'y' with nothing selected
    nnoremap <localleader>Y* "*Y
endif

" Easier paste into CLIPBOARD:
nnoremap <localleader>pp "+p
nnoremap <localleader>PP "+P
vnoremap <localleader>pp "+p
vnoremap <localleader>PP "+P

set number " use NumberToggle() for standard line numbers... see below.
if &diff
    set relativenumber! " no relative numbers when diffing
    set number
endif
set diffopt+=vertical " vertical splits for the files to diff

function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
    set number
  else
    set relativenumber " for seeing jump distances 12j or 13j, 8k or 9k
    set number!
  endif
endfunc
nnoremap <localleader>nt :call NumberToggle()<cr>

" Windows navigation
nnoremap <a-h> <c-w>h|  " jump cursor, window to the LEFT
nnoremap <a-j> <c-w>j|  " jump cursor, window to the BELOW
nnoremap <a-k> <c-w>k|  " jump cursor, window to the ABOVE
nnoremap <a-l> <c-w>l|  " jump cursor, window to the RIGHT

" Remove all trailing whitespace.
" http://vi.stackexchange.com/a/2285/4919
" Mnemonic for the sequence is 'd'elete 'w'hite 's'pace.
nnoremap <localleader>dws :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar><cr>
" And EditorConfig's trim_trailing_whitespace may do this automatically on :w

" Cycle and then show a list of the buffers.
" The current buffer will be marked with a '#'.
nnoremap <a-n> :bnext<cr>:redraw<cr>:ls<cr>
nnoremap <a-p> :bprevious<cr>:redraw<cr>:ls<cr>

" nnoremap <c-k> :tabnext<cr>
" nnoremap <c-j> :tabprevious<cr>
"
" FZF searches
nnoremap <c-p> :FZF<cr>
inoremap <c-p> <esc>:FZF<cr>i

nnoremap <a-\> :NERDTreeToggle<cr>
inoremap <a-\> <esc>:NERDTreeToggle<cr>

" While NerdTree plugin is installed, vim-vinegar triggers it by default.
" If for some reason that's not working, uncomment the next line:
" let NERDTreeHijackNetrw=1
" See http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
" And https://www.reddit.com/r/vim/comments/22ztqp/why_does_nerdtree_exist_whats_wrong_with_netrw/

set spelllang=en_us
set spellsuggest=best,10 " show only the top 10
nnoremap <localleader>ss :setlocal spell!<bar>:echo "Use vim-unimapired [os and ]os instead."<cr>
if has('autocmd')
    " turn on by default for files < 20K
    autocmd Filetype * if getfsize(@%) < 20480 | set spell | endif
endif

" To see carriage returns as ^M, reopen the DOS-formatted file as Unix:
" :e ++fileformat=unix
" Vim hides carriage returns when the format is Unix and I don't think
" there's any way around that except to change the format to DOS.
set list listchars=tab:»-,trail:·,extends:→,eol:$
nnoremap <localleader>st :set list!<cr>| " mnemonic is 's'pecial 't'oggle

" These line wrap settings look better if number or relativenumber are on.
set cpoptions+=n     " start line wrapping in the line-number area.
set showbreak=-->\ | " keep a space between \ and |

" Autofix these typos.
iabbrev teh the
iabbrev Teh The

if has('mac')
    " To setup Python for plugins that need it...
    " $ brew install python
    " $ brew install python3
    " $ pip2 install neovim --upgrade
    " $ pip3 install neovim --upgrade
    let g:python_host_prog='/usr/local/bin/python'
    let g:python3_host_prog='/usr/local/bin/python3'
endif

" Appearance
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set background=dark " this only tells Vim what the terminal's background color looks like

let g:nightflyCursorColor = 1

" colorscheme catppuccino
colorscheme nightfly

lua <<EOF
require('lualine').setup({options = {theme = 'nightfly'}})
EOF

" Whitespace and color column highlighting are wrapped in a functions because
" we need to call them when the colorscheme is changed
" (which happens a lot, see mode_yo below).
function! WhoaWhitespace(color)
    exe 'highlight ExtraWhitespace ctermbg='.a:color.' guibg='.a:color
    match ExtraWhitespace /\s\+$/ " credit to http://stackoverflow.com/a/4617156/23566
endfunction

function! WhoaTypos(fg,bg)
    " So this is a weird one...
    " I tend to typo an A on the end of lines because I so frequently
    " get into INSERT mode trying to use the A key mapping (append at EOL).
    " If I'm already in INSERT mode, then the A key stroke is a typo.
    exe 'highlight MyTypos ctermfg='.a:fg.' ctermbg='.a:bg.' guifg='.a:fg.' guibg='.a:bg
    syntax match MyTypos /A$/ containedin=ALL
    " The A at the end of this line should be highlighted... A
    syntax match MyTypos /:w$/ containedin=ALL
    " The :w at the end of this line should be highlighted... :w
endfunction

function! WhoaColorColumn(bg)
    if exists('+colorcolumn')
        " Short lines are more readable, so...
        " add a vertical line-length column at 80 characters.
        " https://www.python.org/dev/peps/pep-0008/#maximum-line-length
        set colorcolumn=80
        exe 'highlight ColorColumn guibg='.a:bg
    endif
endfunction

function! WhoaLineNumbersColor(fg)
    exe 'highlight LineNr guifg='.a:fg
endfunction

function! PostThemeSettings()
    " Here we run stuff that must be applied after the theme has changed.
    call WhoaWhitespace('red')
    call WhoaTypos('black','yellow')
endfunction
call PostThemeSettings()
call WhoaColorColumn('#00376C')

" Let's make it obvious if I'm in insert mode.
if version >= 700
   augroup mode_yo
       " Clear the autocmds of the current group to prevent them from piling
       " up each time we reload this config.
       autocmd!

       " autocmd InsertEnter * call PostThemeSettings()
       autocmd InsertEnter * call WhoaLineNumbersColor('#880E4F')
       " autocmd InsertLeave * call PostThemeSettings()
       autocmd InsertLeave * call WhoaLineNumbersColor('#444444')
   augroup END
endif

" It's an annoyance to manually equalize Vim splits changed by some type
" of resize event, for example zooming in and out a tmux pane.
" This takes care of the split equalization automatically:
autocmd VimResized * wincmd =

" Command line completion, try it with ':color <Tab>'.
set wildmenu
" Complete till the longest common string and start wildmenu, subsequent tabs cycle the menu options.
set wildmode=longest:full,full
" Ignore various binary/compiled/transient files.
set wildignore=*.o,*.obj,*~,*.py[cod],*.swp
set wildignore+=*.exe,*.msi,*.dll,*.pdb
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.pdf,*.zip,*.7z
set wildignore+=*.mxd,*.msd " Esri ArcGIS stuff
set wildignore+=.git\*,.hg\*,.svn\*

" Automatically save and load views/folds...
" Using groups keeps our autocommands from being defined twice (which can happen when .vimrc is sourced)
augroup manage_views
    " Clear the autocmds of the current group to prevent them from piling
    " up each time we reload this config.
    autocmd!

    " Allow :mkview to save folds, cursor position, etc., but no 'options'
    " because remembering options tends to cause problems.
    set viewoptions-=options
    " autocmd BufWritePost *
    " \   if expand('%') != '' && &buftype !~ 'nofile'
    " \|      mkview
    " \|  endif
    " autocmd BufRead *
    " \   if expand('%') != '' && &buftype !~ 'nofile'
    " \|      silent loadview
    " \|  endif
augroup END

" Set backup/swap/undo/view files to the proper folders.
if has('win16') || has('win32')
    " Note that Vim ignores the // trick for backups, but
    " I'm leaving it in incase that ever changes.
    " See https://stackoverflow.com/questions/6698316/restore-vim-backups
    set backupdir=~/git/nvim/nvim-backups//
    set directory=~/git/nvim/nvim-swaps//
    if exists('+undofile')
        set undodir=~/git/nvim/nvim-undos//
    endif
    set viewdir=~/git/nvim/nvim-views//
else
    set backupdir=~/.config/nvim/nvim-backups//
    set directory=~/.config/nvim/nvim-swaps//
    if exists('+undofile')
        set undodir=~/.config/nvim/nvim-undos//
    endif
    set viewdir=~/.config/nvim/nvim-views//
endif

set mouse=a

let g:neoformat_only_msg_on_error = 1

" inoremap <expr><tab>  pumvisible() ? "<c-n>" : "<tab>"
" " Automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" ~ is the default extension, use .bak instead.
set backupext=.bak
exe 'set wildignore+=*' . &backupext
set backup

if exists('+undofile')
    set undolevels=500   " muchos levels of undo
    set undoreload=10000 " max lines to save for undo on a buffer reload
    set undofile
endif

set modeline    " allow files to specify vim options
set modelines=3 " check the top 3 lines

" A file type plugin (ftplugin) is a script that is run automatically
" when Vim detects the type of file when as file is created or opened.
" The type can be detected from the file name extension or from the file contents.
filetype plugin indent on " turn on filetype detection and allow loading of language specific indentation files
augroup my_filetypes
    " Clear the autocmds of the current group to prevent them from piling
    " up each time we reload this config.
    autocmd!

    autocmd BufNewFile,BufRead config set filetype=config
    autocmd BufNewFile,BufRead nginx*.conf set filetype=nginx
    autocmd BufNewFile,BufRead *.server set filetype=javascript
    autocmd BufNewFile,BufRead *.js.* set filetype=javascript
    autocmd BufNewFile,BufRead *.json.* set filetype=javascript
    autocmd BufNewFile,BufRead *.config set filetype=javascript
    autocmd BufNewFile,BufRead *.{jshintrc,eshintrc,jscsrc} set filetype=javascript
    autocmd BufNewFile,BufRead db.config set filetype=xml
    autocmd BufNewFile,BufRead Web.config set filetype=xml
    " Vim detects md files as modula2, except for README.md. Fix that.
    autocmd BufNewFile,BufReadPost *.{md,markdown} set filetype=markdown
augroup END

" Expand tabs to spaces by default.
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
" now override with filetype based indentions
augroup filetype_overrides
    " Clear the autocmds of the current group to prevent them from piling
    " up each time we reload this config.
    autocmd!

    " Two is the Node.js standard, https://github.com/nodejs/node/blob/master/.eslintrc#L46
    " Tabs are the jQuery standard, FYI. Node wins here.
    autocmd FileType javascript setlocal softtabstop=2|setlocal shiftwidth=2|setlocal expandtab
    autocmd FileType html       setlocal softtabstop=2|setlocal shiftwidth=2|setlocal expandtab
    autocmd FileType css        setlocal softtabstop=2|setlocal shiftwidth=2|setlocal expandtab
    " The unofficial Ruby style guide: http://www.caliban.org/ruby/rubyguide.shtml#indentation
    autocmd FileType ruby       setlocal softtabstop=2|setlocal shiftwidth=2|setlocal expandtab
    " PEP-8 tells us to use spaces, https://python.org/dev/peps/pep-0008/
    autocmd FileType python     setlocal softtabstop=4|setlocal shiftwidth=4|setlocal expandtab|setlocal tabstop=4
augroup END

" We default to LF line endings for new files.
" http://vim.wikia.com/wiki/Change_end-of-line_format_for_dos-mac-unix
" 1. This will not change the format of existing files, use dos2unix for that.
" 2. You can override line endings to be CR or CRLF on a per-project basis by
" adding an EditorConfig with 'cr' or 'crlf' as the end_of_line.
" EditorConfig settings will take priority as long as the plugin is working.
set fileformat=unix
set fileformats=unix,dos

" Specify additional HTML tags to auto indent.
let g:html_indent_inctags='html,body,head,tbody'
" Indent after <script> and <style> tags too.
let g:html_indent_script1='inc'
let g:html_indent_style1='inc'

" Disable arrow keys for navigation, use `hjkl` and love it.
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
noremap  <up>    <nop>
noremap  <down>  <nop>
noremap  <left>  <nop>
noremap  <right> <nop>

" Dance faster!
nnoremap <a-j> jjjjj
nnoremap <a-k> kkkkk

" Better line jumping with wrapped lines.
" See https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Typo hitting F1 will open "help" when you probably just wanted to get out of insert mode, fix that.
inoremap <f1> <esc>

if v:version >= 704 && has('patch235')
    " ; gets stuck on a t command, but this was fixed in 7.3.235
    " Make sure we allow the fix (don't use compatibility mode for ;)
    " http://stackoverflow.com/a/15669344
    set cpo-=;
endif

" In insert mode, pressing Ctrl-u deletes text you've typed in t
" current line, and Ctrl-w deletes the word before the cursor.
" You can't undo these deletions! Fix that.
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Make <space> in normal mode add a space.
nnoremap <space> i<space><esc>l

" Have dedicated tab switchers.
inoremap <f7> gT
inoremap <f8> gt
noremap  <f7> gT
noremap  <f8> gt

" Never engage Ex mode (make Q harmless).
" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

" <Esc> is so so far away, use this `jj` home row sequence instead.
" Note that comments cannot go after the inoremap (insert no recursion map) sequence
" else they become part of it, thus these comments are above the command itself.
inoremap jj <esc>

" nopaste is the default but we set it here explicitly as a reminder that
" setting the 'paste' option will disable other options like inoremap, see :help 'paste'
set nopaste

" Enable quick switching of "paste mode".
set pastetoggle=<f2>

" https://github.com/Netherdrake/Dotfiles, <localleader>h[1-6]
function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID. Hopefully nothing else is using it.
    let mid = 86750 + a:n
    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'
    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    " Move back to our original location.
    normal! `z
endfunction

nnoremap <localleader>h0 :call clearmatches()<cr>:noh<cr>
nnoremap <silent> <localleader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <localleader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <localleader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <localleader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <localleader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <localleader>h6 :call HiInterestingWord(6)<cr>
nnoremap <silent> <localleader>h7 :call HiInterestingWord(7)<cr>

highlight def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
highlight def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
highlight def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
highlight def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
highlight def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
highlight def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
highlight def InterestingWord7 guifg=#000000 ctermfg=16 guibg=#444444 ctermbg=238

" Potential lag fix, https://redd.it/1p0e46
let g:matchparen_insert_timeout=5

" https://github.com/vito-c/jq.vim#confugrations
let jq_quote_highlight=1

" Author: Tim Dahlin
" Description: Opens all quickfix files into whatever is the active split.
function! QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
" You might want to use :cdo if it's in your build
" https://github.com/vim/vim/commit/aa23b379421aa214e6543b06c974594a25799b09
command! Coa call QuickFixOpenAll()

function! HighlightPosition(blinktime)
    highlight RedOnRed ctermfg=red ctermbg=red guifg=red guibg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    echo matchlen
    let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
                \ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
                \ . '\|'
                \ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
                \ . '\|'
                \ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
    let ring = matchadd('RedOnRed', ring_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" We wrap the N n mappings in a function to call it on VimEnter.
" Something is overwriting them if we don't.
function! Nn()
    " Keep search matches in the middle of the window:
    " zz scrolls the cursor to center
    " zv opens just enough folds to make that line not folded
    " nnoremap n nzzzv
    " nnoremap N Nzzzv

    " This rewires n and N to do some fancy highlighting.
    " h/t https://github.com/greg0ire/more-instantly-better-vim
    nnoremap <silent> n nzzzv:call HighlightPosition(0.2)<cr>
    nnoremap <silent> N Nzzzv:call HighlightPosition(0.2)<cr>
endfunction

augroup nn_setup
    " Clear the autocmds of the current group to prevent them from piling
    " up each time we reload this config.
    autocmd!
    autocmd VimEnter * call Nn()
augroup END

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

function! SetPluginOptions()

    if exists('g:loaded_hexokinase')
      echom "Configuring vim-hexokinase..."
      let g:Hexokinase_virtualText = ' ██'
    endif

    if exists('g:EasyMotion_loaded')
        echom "Configuring EasyMotion..."
        map <leader> <plug>(easymotion-prefix)
    endif

    if exists('g:loaded_sqlutilities')
        echom "Configuring SQL Utilities..."
        " add mappings for SQLUtilities.vim, mnemonic explanation:
        " s   - sql
        " f   - format
        " cl  - column list
        " cd  - column definition
        " cdt - column datatype
        " cp  - create procedure
        vmap <localleader>sf   <plug>SQLU_Formatter<cr>
        nmap <localleader>scl  <plug>SQLU_CreateColumnList<cr>
        nmap <localleader>scd  <plug>SQLU_GetColumnDef<cr>
        nmap <localleader>scdt <plug>SQLU_GetColumnDataType<cr>
        nmap <localleader>scp  <plug>SQLU_CreateProcedure<cr>
    endif

    " if executable('ag')
    "     " * (super star) searches the CURRENT buffer for the word under your cursor
    "     " bind \* to search ALL OPEN AND SAVED buffers. This will not find changes
    "     " in modified buffers, since Ag can only find what is on disk.
    "     nnoremap <localleader>* :AgBuffer <c-r><c-w><cr>
    "     " Use ag over grep, we extract the column as well as the file and line number.
    "     set grepprg=ag\ --nogroup\ --nocolor\ --column
    "     if exists('g:loaded_ctrlp')
    "         echom "Configuring CtrlP for Ag..."
    "         " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    "         let g:ctrlp_user_command='ag %s --files-with-matches --nocolor -g ""'
    "         " ag is fast enough that CtrlP doesn't need to cache
    "         let g:ctrlp_use_caching=0
    "     endif
    " endif

    if exists('g:loaded_syntastic_plugin')
        echom "Configuring Syntastic..."
        " These are recommended by the Syntastic README
        let g:syntastic_always_populate_loc_list=1
        let g:syntastic_loc_list_height=5
        let g:syntastic_auto_loc_list=1
        let g:syntastic_check_on_open=1
        let g:syntastic_check_on_wq=0
        " Passive for scss because Jekyll front matter is not stripped off
        " by Syntastic before sending it to Sass. Maybe I'll fix this with
        " a custom SyntasticMake preprocess function... someday.
        let g:syntastic_mode_map={
            \ "mode": "active",
            \ "active_filetypes": [],
            \ "passive_filetypes": ["scss"] }

        nnoremap <localleader>s? :SyntasticInfo<cr>
        nnoremap <localleader>sc :SyntasticCheck<cr>
    endif

    if exists('g:loaded_gundo')
        echom "Configuring Gundo..."
        let g:gundo_width=65
        let g:gundo_preview_height=15
        nnoremap <localleader>uu :GundoToggle<cr>
        if !has('python')
            echom "Warning: Gundo requires Vim to be compiled with Python 2.4+"
        endif
    endif

    if exists('g:loaded_indent_guides')
        echom "Configuring Indent Guides..."
        " For plugin nathanaelkane/vim-indent-guides
        let g:indent_guides_start_level=2
        let g:indent_guides_guide_size=1
        nnoremap <localleader>ig :IndentGuidesToggle<cr>
    endif

    if exists('g:loaded_startify')
        echom "Configuring Startify..."
        let g:startify_change_to_vcs_root=1
        let g:startify_custom_header = [
            \ '                       _',
            \ '      ___      __  __ /\_\    ___ ___',
            \ '   /'' __`\   /\ \/\ \\/\ \ /'' __` __`\',
            \ '   \/\ \/\ \  \ \ \_/ |\ \ \/\ \/\ \/\ \',
            \ '    \ \_\ \_\  \ \___/  \ \_\ \_\ \_\ \_\',
            \ '     \/_/\/_/   \/__/    \/_/\/_/\/_/\/_/',
            \ ]
        " Startify menu is "home"
        nnoremap <localleader>hm :Startify<cr>
    endif

    if exists('g:loaded_rainbow_parentheses')
        echom "Configuring Rainbow Parentheses..."
        autocmd FileType json,javascript,css,html RainbowParenthesesActivate
        autocmd Syntax javascript RainbowParenthesesLoadRound
        autocmd Syntax json,javascript RainbowParenthesesLoadSquare
        autocmd Syntax json,javascript,css RainbowParenthesesLoadBraces
        autocmd Syntax html RainbowParenthesesLoadChevrons
    endif

    if !has("python3")
        echom "Warning: Python 3 not found."
    endif

    if exists('g:loaded_ale_dont_use_this_in_other_plugins_please')
        " By default, ALE will run all available tools for all supported
        " languages. Configure g:ale_linters if you want to override it.
        echom "Configuring ALE..."
        let g:ale_completion_enabled=1
        let g:ale_open_list=1
        let g:ale_list_window_size = 4
        let g:ale_sign_error='✖'
        let g:ale_sign_warning='∘'
        let g:ale_loclist_msg_format='[%linter% %code%] %s [%severity%]'

        " You can configure tslint to pick up a Prettier.js configuration
        " by installing tslint-plugin-prettier and tslint-config-prettier
        " into your project, then follow their documentation (tl;dr: install
        " both packages and add both to the `extends` clause of tslint.json,
        " then add `"prettier": true` to the rules clause).
        let g:ale_fixers = {
                    \   'javascript': ['prettier'],
                    \   'typescript': ['eslint'],
                    \   'css': ['prettier'],
                    \}

        " Instruct ALE to respect local Prettier configs
        let g:ale_javascript_prettier_use_local_config = 1

        " nmap <silent> <c-[> <Plug>(ale_previous_wrap)
        " nmap <silent> <c-]> <Plug>(ale_next_wrap)
    endif

    if exists('g:vimpager_plugin_loaded')
        " A binary is required, https://github.com/rkitover/vimpager#install
        if !empty((globpath(&rtp, '/usr/share/vimpager')))
            echom "Configuring Vim PAGER..."
            set rtp^=/usr/share/vimpager
            " Disable less compatibility mode, use regular Vim motions
            let g:less={}
            let g:less.enabled=0
        endif
    endif

    if exists('g:loaded_EditorConfig')
        echom "Configuring editorconfig-vim..."
        let g:EditorConfig_exclude_patterns = ['fugitive://.*']
    endif

    if exists("g:loaded_highlightedyank")
        echom "Configuring highlighted yank..."
        let g:highlightedyank_highlight_duration = 600
    endif

    if exists("g:loaded_bbye")
        echom "Configuring bbye..."
        vnoremap <localleader>bd :Bdelete<cr>
        nnoremap <localleader>bd :Bdelete<cr>
    endif

    if exists("g:loaded_signify")
        echom "Configuring vim-signify..."
        " Signify only for Git
        let g:signify_vcs_list = ['git']
    endif

    if exists("g:fzf_preview_default_fzf_options")
        " Add recommended mappings.
        " https://github.com/yuki-ycino/fzf-preview.vim
        nmap <Leader>f [fzf-p]
        xmap <Leader>f [fzf-p]

        nnoremap <silent> [fzf-p]p     :<C-u>FzfPreviewFromResources project_mru git<CR>
        nnoremap <silent> [fzf-p]gs    :<C-u>FzfPreviewGitStatus<CR>
        nnoremap <silent> [fzf-p]ga    :<C-u>FzfPreviewGitActions<CR>
        nnoremap <silent> [fzf-p]b     :<C-u>FzfPreviewBuffers<CR>
        nnoremap <silent> [fzf-p]B     :<C-u>FzfPreviewAllBuffers<CR>
        nnoremap <silent> [fzf-p]o     :<C-u>FzfPreviewFromResources buffer project_mru<CR>
        nnoremap <silent> [fzf-p]<C-o> :<C-u>FzfPreviewJumps<CR>
        nnoremap <silent> [fzf-p]g;    :<C-u>FzfPreviewChanges<CR>
        nnoremap <silent> [fzf-p]/     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
        nnoremap <silent> [fzf-p]*     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
        nnoremap          [fzf-p]gr    :<C-u>FzfPreviewProjectGrep<Space>
        xnoremap          [fzf-p]gr    "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
        nnoremap <silent> [fzf-p]t     :<C-u>FzfPreviewBufferTags<CR>
        nnoremap <silent> [fzf-p]q     :<C-u>FzfPreviewQuickFix<CR>
        nnoremap <silent> [fzf-p]l     :<C-u>FzfPreviewLocationList<CR>

        nmap <Leader>f [fzf-p]
        xmap <Leader>f [fzf-p]
    endif

    if exists("g:loaded_prettier")
        echom "Configuring vim-prettier..."
        " max line length that prettier will wrap on
        " Prettier default: 80
        let g:prettier#config#print_width = 80
        " number of spaces per indentation level
        " Prettier default: 2
        let g:prettier#config#tab_width = 2
        " use tabs over spaces
        " Prettier default: false
        let g:prettier#config#use_tabs = 'false'
        " print semicolons
        " Prettier default: true
        let g:prettier#config#semi = 'true'
        " single quotes over double quotes
        " Prettier default: false
        let g:prettier#config#single_quote = 'false'
        " print spaces between brackets
        " Prettier default: true
        let g:prettier#config#bracket_spacing = 'true'
        " put > on the last line instead of new line
        " Prettier default: false
        let g:prettier#config#jsx_bracket_same_line = 'false'
        " avoid|always
        " Prettier default: avoid
        let g:prettier#config#arrow_parens = 'avoid'
        " none|es5|all
        " Prettier default: none
        let g:prettier#config#trailing_comma = 'none'
        " flow|babylon|typescript|css|less|scss|json|graphql|markdown
        " Prettier default: babylon
        let g:prettier#config#parser = 'babylon'
        " cli-override|file-override|prefer-file
        let g:prettier#config#config_precedence = 'prefer-file'
        " always|never|preserve
        let g:prettier#config#prose_wrap = 'preserve'
    endif

    echom "Ready."
endfunction

augroup plugin_setup
    " Clear the autocmds of the current group to prevent them from piling
    " up each time we reload this config.
    autocmd!

    " Let man pages appear in the active window and split
    if has('autocmd')
        autocmd VimEnter * echom "Use :Man a_program to open the man page for a_program, e.g. :Man mkdir"
    endif
    runtime! ftplugin/man.vim

    " This must be set when vim-hexokinase is loaded...
    let g:Hexokinase_ftAutoload = ['vim', 'html', 'xml', 'svg', 'css', 'less', 'scss', 'markdown', 'javascript', 'typescript', 'json', 'vue', 'yaml']

    " This must be set when indent_guides is loaded...
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#103559 ctermbg=black
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#00284F ctermbg=darkgrey

    " This must be set when neocomplete is loaded...
    let g:neocomplete#enable_at_startup=1

    " And this must be set before VimEnter...
    let g:hardtime_default_on=1

    let g:UltiSnipsExpandTrigger="<c-a>"
    let g:UltiSnipsJumpBackwardTrigger="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-d>"

    " Lint only on save or :ALELint
    " UltiSnips will otherwise be interrupted by ALE.
    let g:ale_lint_on_text_changed='never'
    let g:ale_lint_on_save=1
    nnoremap <leader>l :ALELint<cr>

    " NOTICE: Tern must be npm installed into bundle/tern_for_vim and
    " Node must be globally available.
    " See https://github.com/ternjs/tern_for_vim
    "
    " By default, the Tern server will shut itself down after five minutes
    " of inactivity. Use --persistent to disable auto-shutdown.
    let g:tern#arguments=["--persistent"]
    let g:tern_request_timeout=1
    let g:tern_show_signature_in_pum=0

    " Allow word highlights to span all windows
    " let g:vim_current_word#highlight_only_in_focused_window=0
    highlight CurrentWordTwins guibg=#005f5f ctermbg=23
    highlight CurrentWord guibg=#005f5f gui=underline ctermbg=23 cterm=underline

    " Plugins are loaded *after* Vim has finished processing this config
    " so we test for their existence and do stuff on VimEnter.
    autocmd VimEnter * call SetPluginOptions()
augroup END

" Open the selection in Chromium so it can be copied as rich text.
function! GetRichText() range
    execute a:firstline . "," . a:lastline . 'TOhtml'
    w
    if has('win16') || has('win32')
        silent !start chrome --force-device-scale-factor=1.8 %:p
    else
        silent !chromium --force-device-scale-factor=1.8 %:p
    endif
    sleep 2
    silent !rm %:p
    q!
endfunction

vnoremap <localleader>rt :call GetRichText()<cr>

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Keep this last.
set secure
