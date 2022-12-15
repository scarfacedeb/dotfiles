let g:polyglot_disabled = ['elm']

" ============================================================================
"  PLUGINS {{{
" ============================================================================

call plug#begin()

" MIGRATED
Plug 'tpope/vim-surround'                 " To easily change surrounding chars
Plug 'tpope/vim-repeat'                   " Utility plugin to improve .
Plug 'tpope/vim-abolish'                  " Better find-and-replace, camelCase to snake case (crs)
Plug 'tpope/vim-commentary'               " To comment
Plug 'tpope/vim-endwise'                  " To add `end` blocks in ruby automatically
Plug 'rstacruz/vim-closer'                " To add brackets on Enter
Plug 'maxbrunsfeld/vim-yankstack'         " Yank ring (<Leader>p to cycle through yank history)

Plug 'folke/which-key.nvim'

Plug 'tweekmonster/startuptime.vim'

" DISABLED
Plug 'tpope/vim-fugitive'                               " Git integration
Plug 'tpope/vim-rhubarb'                                " GitHub integration, enabled GBrowse
Plug 'tpope/vim-unimpaired'               " [q, ]q, [Q, ]Q and etc keybindings
Plug 'junegunn/vim-easy-align'            " Easy align (ga)

" NOT MIGRATED

Plug 'duggiefresh/vim-easydir'            " Create file and subdirectory at the same time (e.g. :new)
Plug 'vim-scripts/sudo.vim'               " Use sudo with single file :e sudo:/etc/passwd
Plug 'tpope/vim-eunuch'                   " UNIX shell helpers (mkdir, mv, cp)

Plug 't9md/vim-quickhl'                   " Highlight word (<Leader>h)
Plug 'wellle/context.vim'                 " Show context of long function

" Interface
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'itchyny/lightline.vim'              " Lighweight status bar

Plug 'kshenoy/vim-signature'              " Visual helpers to see marks in gutter
Plug 'airblade/vim-gitgutter'             " Git gutter

Plug 'Valloric/ListToggle'                " Toggle location list - to toggle error pane by <Leader>e

                                          " Terminal stuff
Plug 'christoomey/vim-tmux-navigator'     " Integrate tmux and vim
Plug 'vim-scripts/AnsiEsc.vim'            " Emulate ANSI terminal support

" Plug 'majutsushi/tagbar'                " Open ctags in panel for current file
" Plug 'xolox/vim-easytags'               " Generate ctags automatically

Plug 'w0rp/ale'          " Live linting

Plug 'ervandew/supertab' " Better autocomplete
                         " Plug 'Shougo/denite.nvim'
                         " Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'laher/fuzzymenu.vim' " Fzm

" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-tmux'
" Plug 'ncm2/ncm2-path'

" Plug 'autozimu/LanguageClient-neovim', {
" \ 'branch': 'next',
" \ 'do': 'bash install.sh',
" \ }

" Buffer
" Plug 'jeetsukumaran/vim-buffergator' " Better navigation for buffers
Plug 'moll/vim-bbye'                 " :Bdelete to delete buffer
Plug  'vim-scripts/BufOnly.vim'      " :BufOnly <F9> Close all buffers
Plug 'm00qek/nvim-contabs'           " Tab-scoped env

" FZF to fuzzy search files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF'] }  " better ag.vim
" Plug 'Shougo/unite.vim', { 'on': ['Unite'] }
" Plug 'rking/ag.vim'                 " the_silver_searcher fuzzy search
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'SirVer/ultisnips'                                 " snippets engine

                                                        " Language support
Plug 'sheerun/vim-polyglot'                             " Language plugins loaded on demand
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " Better javascript support
Plug 'ap/vim-css-color'                                 " Color highlighter
" Plug 'elmcast/elm-vim', { 'for':         'elm' }        " Better Elm support

Plug 'lucidstack/hex.vim', { 'for': 'elixir' }                   " Hex helper (HexAppendRelease, HexPackageInfo)
Plug 'tpope/vim-rails', { 'for': 'ruby' }                        " For rails
" Plug 'csscomb/vim-csscomb', { 'for': ['scss', 'css', 'sass'] } " Sort css rules
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }            " Better scss support
" Plug 'mxw/vim-jsx', { 'for': 'jsx' }                           " JSX syntax hightligh

" Look and Feel
" Plug 'chriskempson/base16-vim' 
" Plug 'flazz/vim-colorschemes'
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'

" " Text objects
Plug 'kana/vim-textobj-user'                                           " Dependency to create custom text objects
Plug 'michaeljsmith/vim-indent-object'                                 " Add indent object (e.g. vii)
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }               " Add ruby block object
Plug 'andyl/vim-textobj-elixir', { 'for': 'elixir' }                   " Add elixir text object (e)
Plug 'thinca/vim-textobj-function-javascript', { 'for': 'javascript' } " Text objects for js
Plug 'jeetsukumaran/vim-indentwise' " Navigate by indents, [-, [+, ]-, ]+, [=, ]=


" QUARANTINE
"
" Plug 'terryma/vim-expand-region'      " Expand visual selection
" Plug 'tommcdo/vim-exchange'           " Exchange works (cxiw -> cxiw)
" Plug 'AndrewRadev/splitjoin.vim'      " To convert between single line and multi line
" Plug 'PeterRincker/vim-argumentative' " To reoder arguments (<, >,)
" Plug 'triglav/vim-visual-increment'   " Increment numbers in a column (<C-a>/<C-x>)
" Plug 'gioele/vim-autoswap'            " Deal with swap files automatically
" Plug 'AndrewRadev/linediff.vim'       " Diff visual selection LineDiff (:Linediff)
" Plug 'wellle/visual-split.vim'        " :VSResize and :VSSplit to create new split from selection
" Plug 'embear/vim-foldsearch'          " :Fp, :Fi/Fd, :Fw - fold search
" Plug 'easymotion/vim-easymotion'      " EasyMotion to navigate around file
" Plug 'andymass/vim-matchup'           " Hightlight %
Plug 'nathanaelkane/vim-indent-guides'  " Indent guides
" Plug 'junegunn/vim-peekaboo'          " Open registers in a window when double quote
" Plug 'tpope/vim-dadbod', { 'on': ['DB'] }
" Plug 'junegunn/gv.vim', { 'on': ['GV', 'GV1'] }  " Git browser (:GV, :GV!)
" Plug 'sjl/splice.vim',  { 'on': ['SpliceInit'] }                 " Better vimdiff
" Plug 'ryanoasis/vim-devicons' " add icons to NerdTree, ctrl-p
" Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }             " Elixir introspection
" Plug 'brooth/far.vim', { 'on': ['Far', 'Fardo'] } " Find and replace in window
" Plug 'AndrewRadev/undoquit.vim'      " Undo close buffer - DOESNT WORK
" Plug 'rbong/vim-buffest'             " Edit registers, quicklist in a buffer (c@a c,q c,l)
" Plug 'ton/vim-bufsurf'               " :BufSurfForward, BufSurfBack - MRU list of buffers
" Plug 'pechorin/any-jump.vim' " <Leader>j

Plug 'mbbill/undotree'

Plug 'emilsoman/spec-outline.vim'       " :SpecOutlineToggle


call plug#end()

"
" }}}
" ============================================================================
" SETTINGS {{{
" ============================================================================

" LOOK AND FEEL
syntax on

" colorscheme one
colorscheme gruvbox
" set background=light
set termguicolors " 24-bit colors
" let g:one_allow_italics = 1

" FOR DARK SCHEME
"
" Increase contrast
" :call one#highlight('CursorLine', '', '181a1f', 'none')
" :call one#highlight('VertSplit', '61afef', '181a1f', 'none')

" Status line colorscheme
" Powerline has insert mode full status line highlight
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [['mode', 'paste'], ['absolutepath', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok'], ['pwd']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK',
\   'pwd': 'LightlinePwd'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ⚠', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ⊗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call lightline#update()

" Display current working directory in status bar
function! LightlinePwd() abort
  return fnamemodify(getcwd(), ':t')
endfunction


" autocmd BufEnter  *  call ncm2#enable_for_buffer()
" " IMPORTANTE: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect


filetype indent on

let mapleader = " "
set shell=/bin/sh

set history=50
set showcmd       " display incomplete commands
set autowrite     " Automatically :write before running commands
set cursorline    " highlight current line
set lazyredraw    " redraw only when we need to.
set showmatch     " highlight matching [{()}]
set hidden        " enable modified buffers
set gdefault      " the /g flag on :s substitutions by default
" set clipboard^=unnamed " copy/yank/delete into system clipboard by default

set incsearch     " do incremental searching
set inccommand=nosplit " show search and replace in real-time

" ignore case with no capitals
set smartcase
set ignorecase

" persistent undo
set undofile

" Softtabs, 2 spaces
set tabstop=2         " number of visual spaces per TAB
set softtabstop=2     " number of spaces in tab when editing
set shiftwidth=2      " number of spaces to ident with << >>
set shiftround        " take into account existing spaces with << >>
set expandtab         " turn TAB into spaces
set hlsearch            " no highlight matches

" Enable special comments to change vim configs in specific files
set modelines=1

" Make it obvious where 80 characters is
" set textwidth=90
set colorcolumn=80
set scrolljump=20  " lines to scroll when cursor leaves screen
set scrolloff=1   " minimum lines to keep above and below cursor

" Keep center row fixed when scrolling
nnoremap <leader>sc :set scrolloff=9999<CR>
nnoremap <leader>Sc :set scrolloff=10<CR>

" Mark characters that oveflow colorcolumn
" highlight ColorOverColumn ctermbg=magenta
" call matchadd('ColorOverColumn', '\%81v', 100)

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Folding
set foldenable          " enable folding
set foldlevelstart=15   " open most folds by default
set foldnestmax=10      " 2 nested fold max
set foldmethod=indent   " fold based on indent level
" set foldmethod=syntax
" let xml_syntax_folding=1

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:~

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" Use Ag over Grep
set grepprg=rg\ --nogroup\ --nocolor

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" " nathanaelkane/vim-indent-guides
" let g:indent_guides_auto_colors = 0
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 0
" let g:indent_guides_start_level = 2

" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#282828 ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#181818 ctermbg=4

" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=282828 ctermbg=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=181818 ctermbg=19

" " NR - narrow mode
" let g:nrrw_rgn_vert = 0
" let g:nrrw_rgn_wdth = 30
" let g:nrrw_topbot_leftright = 'botright'

" " Default peekaboo window
" let g:peekaboo_window = 'vertical botright 50new'
" let g:peekaboo_delay = 250

" Alias %% to current file dir
cabbr <expr> %% expand('%:p:h')
" Alias %$ to current filename
cabbr <expr> %$ expand('%:t')

" Match-up modules
let g:matchup_matchparen_enabled = 1
let g:matchup_motion_enabled = 0
let g:matchup_text_obj_enabled = 0
let g:matchup_matchparen_deferred = 1
nmap <silent> <F2> <plug>(matchup-hi-surround)

" Enable tmux support for autoswap
" let g:autoswap_detect_tmux = 1

" let g:tmux_navigator_disable_when_zoomed = 1

" Send recompile to bottom iex pane
" nnoremap <Leader>er :silent ! tmux send-keys -t bottom recompile Enter <CR><CR>

" :SpecOutlineToggle position
let g:spec_outline_orientation = 'bottom'

" }}}
" ============================================================================
" NUMBERS {{{
" ============================================================================

" Numbers
set number
set relativenumber
set numberwidth=5

" Use absolute numbers in insert mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Use absolute numbers when focus is lost
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber

" Toggle numbers
nnoremap <Leader>tn :call NumberToggle()<CR>



" }}}
" ============================================================================
" Session {{{
" ============================================================================

" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers
" Don't persist options and mappings because it can corrupt sessions.
set sessionoptions-=options

" Save sessions in .config
let g:session_directory = '~/.config/nvim/sessions'

" Open last opened session by default
" let g:session_default_to_last = 1 

" Don't save colorscheme 
let g:session_persist_colors = 0

" Sessions autosave
" let g:session_autosave = 'yes'
" let g:session_autosave_periodic = 10

" " Startify config
" let g:startify_session_dir = '~/.config/nvim/sessions'
" let g:startify_session_autoload = 1
" let g:startify_session_persistence = 1
" let g:startify_session_delete_buffers = 1
" let g:startify_change_to_vcs_root = 1
" let g:startify_use_env = 1
" let g:startify_relative_path = 1
" let g:startify_enable_unsafe = 1 " Speed up start

" Custom backup setup
set backup
set backupdir=~/.cache/nvim/backup/
set directory=~/.cache/nvim/swp/
set undodir=~/.cache/nvim/undo/
set backupskip=/tmp/*,/private/tmp/*
set writebackup


" nnoremap <leader><C-P>o :OpenSession 
" nnoremap <leader><C-P>s :SaveSession 
" nnoremap <leader><C-P>d :DeleteSession<CR>
" nnoremap <leader><C-P>c :CloseSession<CR>

" let g:scratch_persistence_file = "~/.config/nvim/scratch"
"
" }}}
" ============================================================================
" LANGUAGE SUPPORT {{{
" ============================================================================

" Enable elm-format
let g:elm_format_autosave = 0
nmap <silent> <F7> :ElmFormat<CR>

" Disable curly braces for gS (splitjoin)
let g:splitjoin_ruby_curly_braces = 0

" Split arguments onto new line (splitjoin)
let g:splitjoin_ruby_hanging_args = 0

" Preserve block syntax (do/end, {})
let g:splitjoin_ruby_do_block_split = 0

" Convert ruby hashes
nmap <silent> crb :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" Convert ruby variable assignment into let() block for rspec
nmap crvl ysiwba:<Esc>Ilet<Esc>f=dwys${

" Convert ruby string into symbol
nmap crss ds'i:<Esc>

" Convert ruby symbol into string
nmap crSs ysw'

" Convert ruby symbol intro string in hash
nmap crSh ysw'f:cw =><Esc>

" Convert ruby :symbol into symbol: "" for hashes
nmap crsh xea: ""<Esc>

" Convert ruby hash, aka symbolize_keys
nmap crh ds"ea:<Esc>f=dW

" Octave comments
autocmd FileType matlab setlocal commentstring=%\ %s

" Emulate tag highlight
autocmd FileType xml call quickhl#cword#enable()

" Open doc in Dash = gK
" let g:investigate_use_dash=1
" nnoremap <leader>d :call investigate#Investigate('n')<CR>
" vnoremap <leader>d :call investigate#Investigate('v')<CR>

" Format JSON
noremap <leader>=j :%!python -m json.tool<CR>

" ALE - linting

let g:ale_linters = {
\ 'haml': [],
\ 'ruby': ['ruby', 'rubocop'],
\ 'elixir': ['credo', 'dialyxir']
\}
" \ 'elixir': ['elixir-ls', 'credo', 'dialyxir']

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'ruby': ['remove_trailing_lines', 'rubocop'],
\ 'elixir': ['remove_trailing_lines', 'trim_whitespace', 'mix_format']
\}

let g:ale_sign_column_always = 1 " Keep gutter open
let g:ale_sign_error = '⊗'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0 " Don't run when opening file (huge speed up)
let g:ale_lint_on_insert_leave = 1 " Don't run until insert mode leave
let g:ale_lint_delay = 800

" ALE completion
" let g:ale_completion_enabled = 1
let g:ale_elixir_elixir_ls_release = '/Users/scarfacedeb/src/elixir-ls/rel'
" set completeopt=menu,menuone,preview,noselect,noinsert

nmap <C-[><C-]> :ALEHover<CR>

" Bind F12 to fixing problems with ALE
nmap <F12> <Plug>(ale_fix)

" nmap <silent> <leader>dd <Plug>(coc-definition)
" nmap <silent> <leader>dr <Plug>(coc-references)
" nmap <silent> <leader>dj <Plug>(coc-implementation)

" let g:rspec_runner = 'os_x_iterm2'
" let g:rspec_command = 'term bin/rspec'
" map <Leader>rt :call RunCurrentSpecFile()<CR>

" Alchemist
"
let g:alchemist#elixir_erlang_src = "/Users/scarfacedeb/.alchemist"
" Split vertical/horizontal + Jump to definition
nmap <C-[><C-v> <C-w>v<C-]>
nmap <C-[><C-s> <C-w>s<C-]>

" NEOMAKE
""
"let g:neoformat_elixir_exfmt = {
"  \ 'exe': 'mix',
"  \ 'args': ['exfmt', '--stdin'],
"  \ 'stdin': 1
"  \ }

"let g:neoformat_enabled_elixir = ['exfmt']

" Open error pane automatically
" let g:neomake_open_list = 2
"
" Run Neomake on save
" autocmd! BufWritePost engines/* Neomake


" " Gutter styles
" let g:neomake_warning_sign = {
"   \ 'text': 'W',
"   \ 'texthl': 'WarningMsg',
" \ }

" let g:neomake_error_sign = {
"   \ 'text': 'E',
"   \ 'texthl': 'ErrorMsg',
" \ }

" " Debug neomake
" " let g:neomake_verbose = 3

" " Enable credo for elixir
" let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" Run syntax checkers for file
" nnoremap <F12> :Neomake<CR>

" Open pane with errors
" nnoremap <Leader>e :lopen<CR>
let g:lt_location_list_toggle_map = '<leader>e'
let g:lt_quickfix_list_toggle_map = '<leader>l'

" Go to error #
nnoremap <Leader>ge :ll 

" Go to next/prev error
nnoremap <silent> [e :lprev<CR>
nnoremap <silent> ]e :lnext<CR>

" }}}
" ============================================================================
" AUTOCMD {{{
" ============================================================================

" Strip whitespace at the end of the lines
au BufWritePre *.py,*.js,*.rb,*.css,*.scss,*.slim,*.haml,*.elm,*.ex,*.exs :call Preserve("%s/\\s\\+$//e")

" Enable text wrap for git messages
au FileType gitcommit set tw=72

" Highlight on Yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

" }}}
" ============================================================================
" FUNCTIONS {{{
" ============================================================================


" Utility function for strip whitespace at the end of the line
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction 

" Toggle relative/absolute numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

command! -nargs=0 ReplaceSpacesWithUnderscoreInQuotes %s/"[^"]*"/\=substitute(submatch(0), ' ', '_', 'g')/g

function! RegisterClear()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfunc

command! -nargs=0 RegisterClear call RegisterClear()

function! YankRubocopLinter()
  redir => s:lastmsg
  " redir @*
  1messages
  redir END
  let s:linter=substitute(get(split(s:lastmsg, ":"), 0, ""), "\n", "", "g")
  let s:disable="# rubocop:disable " . s:linter
  call setreg('', s:disable, "l")
endfunction

command! -nargs=0 YankRubocopLinter call YankRubocopLinter()

" Yank rubocop linter from the last ALE message
nnoremap <Leader>rd :YankRubocopLinter<CR>

" Write file without change modification date
function! WriteNoMod()
    let mtime = system("gstat -c %y ".shellescape(expand('%:p')))
    write!
    call system("gtouch --date='".mtime."' ".shellescape(expand('%:p')))
endfunction

command! -nargs=0 WriteNoMod call WriteNoMod()

" Alias :E to :e to fix annoying issues when I keep pressing Shift
command! -nargs=* -bar -bang -count=0 -complete=dir E e <args>

"
" }}}
" ============================================================================
" KEY BINDINGS {{{
" ============================================================================

" Move visually
nnoremap j gj
nnoremap k gk

" Exit insert mode quicker
inoremap jj <ESC>

" Break the line
nnoremap K i<CR><Esc>

" New line below
nnoremap <Leader>o o<Esc>
" New line above
nnoremap <Leader>O O<Esc>

" Enable WhichKey floating window helper
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=500

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" Go to make
nnoremap <Leader>m '

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Highlight word
nmap <Leader>h <Plug>(quickhl-manual-this)<CR>
xmap <Leader>h <Plug>(quickhl-manual-this)<CR>
nmap <Leader>H <Plug>(quickhl-manual-reset)<CR>
xmap <Leader>H <Plug>(quickhl-manual-reset)<CR>
nmap <Leader><C-H> <Plug>(quickhl-cword-toggle)


" Move visual blocks
" vnoremap <UP>    <Plug>SchleppUp
" vnoremap <DOWN>  <Plug>SchleppDown
" vnoremap <LEFT>  <Plug>SchleppLeft
" vnoremap <RIGHT> <Plug>SchleppRight

" Match pairs more easily
" nnoremap <tab> %
" vnoremap <tab> %

" " move to bevinning/end of line
" noremap ≤ ^
" noremap ≥ $

" REGISTERS
"
" Make Y behave like other capitals
map Y y$
" Yank the whole file
nnoremap <Leader>ya ggVGy

" Yank from internal copy register into external register
nnoremap <Leader>yy :let @*=@0<CR>

" External copy-paste
noremap <C-y> "*y
noremap <C-p> "*p

" Yank history
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" highlight last inserted text
nnoremap gV `[v`]


" SEARCH 
"
" Search and replace
noremap <leader>sr :%s/
noremap <leader>SR :%s/\v
" Better search
nnoremap <leader>Sr :%Subvert/
" Replace word under cursor
nnoremap <Leader>Sw :%s/\<<C-r><C-w>\>/

" Search word under cursor
nnoremap <Leader>/w /<C-r><C-w>

" Search in files (with .gitignore)
nnoremap <leader>A :Rg 
" Search in files (max 1 match per file)
nnoremap <leader>a :RgOnce 

" Search in all files
nnoremap <leader>sA :Rg! 
" Search in all files (max 1 match per file)
nnoremap <leader>sa :RgOnce! 

" Search word under cursor
nnoremap <leader>sW :Rg <C-r><C-w>
" Search word under cursor
nnoremap <leader>sw :RgOnce <C-r><C-w>

" Search word under cursor
" nnoremap <leader><C-a> :Rg <C-R><C-W><CR>

" " Mega Rg
" let g:any_jump_disable_default_keybindings = 1
" nnoremap <leader>j :AnyJump<CR>

" Toggle search highlight
noremap <F4> :set hlsearch! hlsearch?<CR>

" BUFFERS
"
" Easily switch between recent buffers
map <Leader><Leader> :b!#<CR>

" Navigate list of buffers
nnoremap gb :bp<CR>
nnoremap gn :bn<CR>
" nnoremap gb :BufSurfBack<CR>
" nnoremap gn :BufSurfForward<CR>

" Close the current buffer and move to the previous one
nmap <silent> <leader>bd :Bdelete<CR>

" Close all buffers
nmap <silent> <F9> :tabnew<CR>:tabonly<CR>:BufOnly<CR>

" Move tabs to left/right
noremap <C-t>J  :tabmove -1<CR>
noremap <C-t>K  :tabmove +1<CR>

" FILES

" Shortcuts
nmap <leader>fd :Unlink<CR>gb
nnoremap <leader>fr :Rename 
nnoremap <leader>fm :Move  
nnoremap <silent> <leader>fo :!open %<CR>

" Copy file path (from project root) to system clipboard
nnoremap <silent> <leader>fcp :let @+ = expand("%")<CR>
" Copy FULL path to system clipboard
nnoremap <silent> <leader>fcP :let @+ = expand("%:p")<CR>

" Writes all open files
nnoremap <leader>fwa :W<CR>  

" Write without time modification
nnoremap <leader>fwm :WriteNoMod<CR>

" WINDOWS AND TABS
"
" Quicker window movement (tmux)
" See: https://github.com/neovim/neovim/issues/2048
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-^> <C-o><C-^>

" Close/[E]nd preview windows
nnoremap <C-w>e <C-w>z
nnoremap <C-w><C-E> <C-w>z

" Tmux-inspired tab hotkeys
map <C-T>n :tabnext<CR>
map <C-T>p :tabprev<CR>
map <C-T>c :tabnew<CR>
map <C-T>d :tabclose<CR>
map <C-T>d :tabclose<CR>
map <C-T>1 1gt
map <C-T>2 2gt
map <C-T>3 3gt
map <C-T>4 4gt
map <C-T>5 5gt
map <C-T>6 6gt
map <C-T>7 7gt
map <C-T>8 8gt
map <C-w>! <C-w>T
map <C-w>z <C-w>o

nmap <C-Right> :tabnext<CR>
nmap <C-Left> :tabprev<CR>

" Faster splits
map <C-W><C-S> :new<CR>
map <C-W><C-V> :vnew<CR>

" Open NerdTree
map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>

" Default sort
map <Leader>ns :let NERDTreeSortOrder=['\/$', '*', '\.swp$',  '\.bak$', '\~$']<CR>:NERDTree<CR>

" Sort by timestamp desc
map <Leader>nS :let NERDTreeSortOrder=['\/$','*','[[-timestamp]]']<CR>:NERDTree<CR>

" MISC
"
" Stop stupid window
map q: :q

" Repeat last macro
nnoremap Q @@

" Run current line 
nnoremap <leader>el :exe getline('.')<CR>

" Edit in current directory
nmap <leader>ed :e %%<SPACE><BACKSPACE>/

" Map bc to run CSScomb. bc stands for beautify css
" autocmd FileType css noremap <buffer> <leader>cc :CSScomb<CR>:w<CR>
" autocmd FileType scss noremap <buffer> <leader>cc :CSScomb<CR>:w<CR>


" Context. Disable by default. Use ContextPeek.
let g:context_enabled = 0
let g:context_add_mappings = 0
" let g:context_add_autocmds = 0

map <leader>cx :ContextUpdate<CR>:ContextPeek<CR>

" Activate manually
" autocmd VimEnter * ContextActivate


" VIM MANAGEMENT
"
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <Leader>vi :PlugInstall<CR>
nnoremap <Leader>vc :PlugClean<CR>
nnoremap <Leader>vu :PlugUpdate<CR>

" Show help and hotkeys
nnoremap <leader>vh :Helptags<CR>
nnoremap <leader>vm :Maps<CR>

" }}}
" ============================================================================
" GIT {{{
" ============================================================================

" Git blame
nnoremap <Leader>gb :Git blame<CR>

" Git browse current line
nnoremap <Leader>gB V:GBrowse!<CR>

" [H]istory of commits for current file
nnoremap <Leader>gh :BCommits<CR>

" List all commits
nnoremap <silent> <Leader>gc :Commits<CR>

" Open Fork
nnoremap <Leader>gg :!fork open<CR>

" Open file [H]istory in Fork
nnoremap <Leader>gH :!fork log -- %<CR>

" Git [A]dd/[U]nstage hunks
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk

" Move between [G]it hunks
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk

" [V]iew diff of hunk changes 
nmap <Leader>gv <Plug>GitGutterPreviewHunk

" find git [m]erge [c]onflicts
nmap <silent> <leader>gmc <ESC>/\v^[<=>]{7}( .*\|$)<CR>


" }}}
" ============================================================================
" Elixir {{{
" ============================================================================

" Elixir Map Atoms – transform map with string keys to atoms
nnoremap <Leader>ema vi{:s/\v"(\w+)" +\=\> +/\1: /<CR>
vnoremap <Leader>ema :s/\v"(\w+)" +\=\> +/\1: /<CR>

" Elixir Map Strings - transform map with atom keys to strings
vnoremap <Leader>ems vi{:s/\v(\w+):\s+/"\1" => /<CR>
vnoremap <Leader>ems :s/\v(\w+):\s+/"\1" => /<CR>

" }}}
" ============================================================================
" XML {{{
" ============================================================================

nmap <Leader>xf ggvG$:!xmllint --format -<CR>
nmap <Leader>xF ggvG$:!xmllint --format -<CR>:WriteNoMod<CR>

" }}}
" ============================================================================
" FZF {{{
" ============================================================================

" Search from the top
let g:SuperTabDefaultCompletionType = '<C-N>'

" Height of last commands pane
set cmdheight=1

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" - down / up / left / right
" - window (nvim only)
" let g:fzf_layout = { 'up': '~40%' }

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 1 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  let win = nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&relativenumber', 0)
endfunction

" Custom Files to combine Files and GFiles commands
"
" It always executes Files outside of git repo.
"
" Inside git repos, it first executes GFiles with <C-O> toggle to switch to Files.
function! s:fzf_files_custom()
  if(system('git rev-parse --is-inside-work-tree') =~ 'true')
    call <sid>fzf_next(0)
  else
    execute 'Files'
  endif
endfunction

function! s:fzf_next(idx)
  let commands = ['GFiles', 'Files']
  execute commands[a:idx]
  let next = (a:idx + 1) % len(commands)
  let previous = (a:idx - 1) % len(commands)
  execute 'tnoremap <buffer> <silent> <c-o> <c-\><c-n>:close<cr>:sleep 100m<cr>:call <sid>fzf_next('.previous.')<cr>'
endfunction

" Custom FZF commands to add previews
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)


" with_preview doesn't support buffers
" command! -bar -bang -nargs=? -complete=buffer Buffers  
"   \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

" Wrap fzf#vim#grep to support options: 
"   <bang> to disable gitignore.
"   max_count to set max matches by file (0 to disable).
function! Rg(query, max_count, bang)
  let common='rg --column --line-number --no-heading --color=always --smart-case '
  let cmd=common.(a:max_count ? '--max-count='.a:max_count.' ' : '').(a:bang ? '-uu ' : '').shellescape(a:query)

  call fzf#vim#grep(cmd, 1, fzf#vim#with_preview('right:50%', '?'), 0)
endfunction

command! -bang -nargs=* Rg call Rg(<q-args>, 0, <bang>0)
command! -bang -nargs=* RgOnce call Rg(<q-args>, 1, <bang>0)

command! FilesCustom call <sid>fzf_files_custom()

" Smart list files
nnoremap <silent> <Leader>o :FilesCustom<CR>

" List all files
nnoremap <silent> <Leader>O :Files<CR>
" List changed files from git status
nnoremap <silent> <Leader><C-o> :GFiles?<CR> 

" List files in current directory
nnoremap <Leader>\ :Files <C-r>=expand('%:p:h')<CR><CR>

" Misc lists
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>L :Lines<CR>
nnoremap <silent> <Leader>W :Windows<CR>
nnoremap <silent> <Leader><Tab> :Commands<CR>

nnoremap <silent> <Leader>: :History:<CR>

" FZF autocomplete
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Hide status bar when open
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" Help menu based on FZF
nmap <Leader>m <Plug>Fzm


" }}}
" ============================================================================
" Deoplete {{{
" ============================================================================

" Load deoplete on startup
" let g:deoplete#enable_at_startup = 1

" " deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" }}}
" ============================================================================
" Tagbar {{{
" ============================================================================
" nnoremap <C-t><C-t> :TagbarToggle<CR>

" let g:easytags_async = 1 " async easytag generation
" let g:tagbar_autofocus = 1 " focus on tagbar window when opened
" }}}

" ============================================================================
" TODO {{{
" ============================================================================

" " Apply macro to all visually selected lines, skipping not-matching
" xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" function! ExecuteMacroOverVisualRange()
"   echo "@".getcmdline()
"   execute ":'<,'>normal @".nr2char(getchar())
" endfunction
"

" vim:foldmethod=marker:foldlevel=0


" }}}
" ============================================================================
" EASY MOTION {{{
" ============================================================================

" let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" let g:EasyMotion_do_mapping = 0  " Disable default mappings
" let g:EasyMotion_smartcase = 1   " v matches v and V, but V matches only V

" " remap prefix to a single Leader
" map <Leader> <Plug>(easymotion-prefix)

" " Basic search
" " Two-chars
" " map  <Leader>f <Plug>(easymotion-bd-f)
" " nmap <Leader>f <Plug>(easymotion-overwin-f)

" nmap s <Plug>(easymotion-overwin-f2)

" " Move to line
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" " Move to word
" " map  <Leader>w <Plug>(easymotion-bd-w)

" " EasyMotion-based search
" map  <Leader>/ <Plug>(easymotion-sn)
" omap <Leader>/ <Plug>(easymotion-tn)

" " Cursor movements
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" " map <Leader>l <Plug>(easymotion-lineforward)
" " map <Leader>h <Plug>(easymotion-linebackward)





