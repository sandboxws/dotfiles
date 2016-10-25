" ======================================================================================================================
" => VimPlug
" ======================================================================================================================
" Download and use vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/plug/vim-plug/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir -p ~/.vim/autoload && cd ~/.vim/autoload && ln -s ../plug/vim-plug/plug.vim .
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" Themes ---------------------------------------------------------------------------------------------------------------
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'farfanoide/vim-facebook'
Plug 'chriskempson/base16-vim'
Plug 'Slava/vim-colors-tomorrow'
Plug 'joshdick/onedark.vim'
Plug 'raphamorim/lucario'

" Shougo ---------------------------------------------------------------------------------------------------------------
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

" File browsing --------------------------------------------------------------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Snippets -------------------------------------------------------------------------------------------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" PHP ------------------------------------------------------------------------------------------------------------------
Plug 'joonty/vdebug'
Plug 'beanworks/vim-phpfmt'
Plug 'phpvim/phpcd.vim', { 'for': 'php' , 'do': 'composer update' }
Plug 'arnaud-lb/vim-php-namespace'
" Plug 'shawncplus/phpcomplete.vim'

" Java -----------------------------------------------------------------------------------------------------------------
Plug 'artur-shaik/vim-javacomplete2'

" Syntax
Plug 'kchmck/vim-coffee-script'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-markdown'

" Elixir ---------------------------------------------------------------------------------------------------------------
Plug 'slashmili/alchemist.vim'
Plug 'larrylv/ycm-elixir'

" Ruby -----------------------------------------------------------------------------------------------------------------
Plug 'tpope/vim-rails'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

" Git ------------------------------------------------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'

" Testing --------------------------------------------------------------------------------------------------------------
Plug 'janko-m/vim-test'

" Utils ----------------------------------------------------------------------------------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-startify'
Plug 'jacob-ogre/vim-syncr'
Plug 'terryma/vim-smooth-scroll'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'gorodinskiy/vim-coloresque'
Plug 'mbbill/undotree'

" Text Objects ---------------------------------------------------------------------------------------------------------
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'godlygeek/tabular'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'skwp/vim-html-escape', { 'on': ['HtmlEscape', 'HtmlUnEscape'] }
Plug 'mileszs/ack.vim'
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'

" Misc -----------------------------------------------------------------------------------------------------------------
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'

" Status line
Plug 'bling/vim-airline'

call plug#end()

" ======================================================================================================================
" => Leader
" ======================================================================================================================

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Fast saving
nmap <leader>w :w!<cr>

" jk is escape
inoremap jk <esc>

" ======================================================================================================================
" => Mappings
" ======================================================================================================================

imap <C-Space> <C-X><C-O>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Opens fzf files search
map <C-p> :Files<CR>

" Clears search highkights
nnoremap <C-/> :set hlsearch!<CR>

" Undotree
" nnoremap <D-u> :UndotreeToggle<CR>

" ======================================================================================================================
" => General Settings
" ======================================================================================================================

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

let s:mac = has('mac')

" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

filetype plugin indent on

let g:indentLine_char='│'

" ======================================================================================================================
" => VIM user interface
" ======================================================================================================================

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Line/Column marker
:set colorcolumn=120

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" For regular expressions turn magic on
set magic

" Show relative numbers
" set relativenumber number
set number

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight current line
set cursorline

" Enable folding
set foldenable

" Open most folds by default
set foldlevelstart=10

" 10 nested fold max
set foldnestmax=10

" Fold based on indent level
set foldmethod=indent

" Disable vim-better-whitespace
let g:better_whitespace_enabled = 0

" ======================================================================================================================
" => Colors and Fonts
" ======================================================================================================================

if (has("termguicolors"))
  set termguicolors
endif

" Enable syntax highlighting
syntax on
syntax enable

set background=dark

colorscheme lucario

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" ======================================================================================================================
" => Files, backups and undo
" ======================================================================================================================

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" ======================================================================================================================
" => Text, tab and indent related
" ======================================================================================================================

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" vim-move <C-k> and <C-j>
" let g:move_key_modifier = 'C'

" ======================================================================================================================
" => Abbreviations
" ======================================================================================================================
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" ======================================================================================================================
" => Visual mode related
" ======================================================================================================================

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" ======================================================================================================================
" => Spell checking
" ======================================================================================================================

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" ======================================================================================================================
" => Movements
" ======================================================================================================================

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" ======================================================================================================================
" => Session Settings
" ======================================================================================================================

" Remember cursor position between vim sessions
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
            " center buffer around cursor when opening files
autocmd BufRead * normal zz

" ======================================================================================================================
" => Omnifunction Settings
" ======================================================================================================================

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete


" ======================================================================================================================
" => Theme Settings
" ======================================================================================================================

" set fillchars+=vert:│

" ======================================================================================================================
" => PHPFMT Settings
" ======================================================================================================================
" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
let g:phpfmt_standard = 'PSR2'

" Disable autoformatting on save
let g:phpfmt_autosave = 0

" ======================================================================================================================
" => GitGutter Symbols
" ======================================================================================================================
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '='

" ======================================================================================================================
" => Snippets Settings
" ======================================================================================================================

"let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:deoplete#omni_patterns = {}
"let g:deoplete#auto_completion_start_length = 1
"let g:deoplete#sources = {}
"let g:deoplete#sources._ = []
"let g:neopairs#enable = 1
"let g:deoplete#file#enable_buffer_path = 1

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets/'
" let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'

" imap <C-j>     <Plug>(neosnippet_expand_or_jump)
" smap <C-j>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-j>     <Plug>(neosnippet_expand_target)
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

set completeopt=longest,menuone
let g:phpcomplete_relax_static_constraint = 1

function! s:expand_html_tab()
  " try to expand any neosnippets
  " disable this if you don't use the neosnippets plugin
   "if neosnippet#expandable_or_jumpable()
   "  return "\<Plug>(neosnippet_expand_or_jump)"
   "endif

  " try to determine if we're within quotes or tags.
  " if so, assume we're in an emmet fill area.
  let line = getline('.')
  if col('.') < len(line)
    let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')

    if len(line) >= 2
      return "\<Plug>(emmet-move-next)"
    endif
  endif

  " go to next item in a popup menu.
  if pumvisible()
    return "\<C-n>"
  endif

  " expand anything emmet thinks is expandable.
  " I'm not sure control ever reaches below this block.
  if emmet#isExpandable()
    return "\<Plug>(emmet-expand-abbr)"
  endif

  " return a regular tab character
  return "\<tab>"
endfunction

autocmd FileType html,html.handlebars,css,scss,coffee imap <buffer><expr><tab> <sid>expand_html_tab()

" ======================================================================================================================
" => Tagbar Settings
" ======================================================================================================================
let g:tagbar_compact = 1

" ======================================================================================================================
" => YouCompleteMe Settings
" ======================================================================================================================
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_auto_trigger = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
"let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 0

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

let g:ycm_warning_symbol = '?'
let g:ycm_error_symbol = '!'

let g:ycm_semantic_triggers =  {
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
    \             're!\[.*\]\s'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::'],
    \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
    \   'ruby' : ['.', '::'],
    \   'lua' : ['.', ':'],
    \   'erlang' : [':'],
    \ }

" nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" ======================================================================================================================
" => Airline Settings
" ======================================================================================================================

" Set theme
let g:airline_theme = 'oceanicnext'

" Show airline with single file
set laststatus=2

" Use powerline font
let g:airline_powerline_fonts = 1

" Enable tabline
let g:airline#extensions#tabline#enabled = 1

" ======================================================================================================================
" => Custom Functions
" ======================================================================================================================

" Write file, even if the folders don’t exist
function! HardcoreWrite()
  execute '! mkdir -p %:h'
  execute 'write'
endfunction

command! -register HardcoreWrite silent! call HardcoreWrite() | redraw!

" Toggle between soft wrap and no wrap
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    set nowrap
    set nolinebreak
    set list
    set textwidth=0
    set virtualedit=all
    set colorcolumn=
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    set wrap
    set linebreak
    set nolist
    set textwidth=0
    set virtualedit=
    set colorcolumn=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" ======================================================================================================================
" => Autocommands
" ======================================================================================================================

" Strip whitespace when saving a file
autocmd BufWritePre * StripWhitespace

" Git commit messages syntax
autocmd BufRead,BufNewFile COMMIT_EDITMSG setfiletype git

" Makefile
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Misc file types
autocmd BufNewFile,BufRead *.mkd,*.md,*.markdown set ft=markdown
autocmd BufNewFile,BufRead *.ru set ft=ruby
autocmd BufNewFile,BufRead *.rss set filetype=xml
autocmd BufNewFile,BufRead *.json set filetype=json
autocmd BufNewFile,BufRead *.command set filetype=sh syntax=sh
autocmd BufNewFile,BufRead *.hbs set filetype=html syntax=handlebars
autocmd BufNewFile,BufRead *.handlebars set filetype=html syntax=handlebars
autocmd BufNewFile,BufRead *.hb set filetype=html syntax=handlebars
autocmd BufNewFile,BufRead .xing set filetype=yaml syntax=yaml
autocmd BufNewFile,BufRead *.pcss set filetype=css syntax=scss
autocmd BufNewFile,BufRead *.postcss set filetype=css syntax=scss
autocmd BufNewFile,BufRead *.coffee set filetype=coffee syntax=coffee
autocmd BufNewFile,BufRead *.gspec set filetype=gspec syntax=gspec
autocmd BufNewFile,BufRead *.scala set ft=scala
autocmd BufNewFile,BufRead *.scala.html set syntax=play2-html

" ======================================================================================================================
" => FZF Settings
" ======================================================================================================================

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.fzf-history'

let g:phpfmt_command = 'php /Users/ahussaini/Development/github/php/php_fmt/fmt.phar'

" ======================================================================================================================
" => Devicons
" ======================================================================================================================

" let g:vimfiler_as_default_explorer = 1

" Adding the column to vimfiler
" let g:webdevicons_enable_vimfiler = 1

" The amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:WebDevIconsOS = 'Darwin'

" Adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" Adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" Adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" Whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" ======================================================================================================================
" => NERDTree
" ======================================================================================================================

" <Leader>tab: Toggles NERDTree
" nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>
map <C-b> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ======================================================================================================================
" => Vim-Test
" ======================================================================================================================
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ======================================================================================================================
" => Startify
" ======================================================================================================================

" plugins: vim-startify {{{2
nnoremap <leader>st  :Startify<cr>

let g:startify_list_order = [
      \ ['   MRU'],           'files' ,
      \ ['   MRU '.getcwd()], 'dir',
      \ ['   Sessions'],      'sessions',
      \ ['   Bookmarks'],     'bookmarks',
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ 'bundle/.*/doc',
      \ '/data/repo/neovim/runtime/doc',
      \ '/Users/mhi/local/vim/share/vim/vim74/doc',
      \ ]

let g:startify_bookmarks              = [ {'c': '~/.vim/vimrc'} ]
let g:startify_change_to_dir          = 0
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence    = 1

function! s:center_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

"let g:startify_custom_header = s:center_header(split(system('tips | '. (s:mac ? 'cowthink' : 'cowsay -f apt')), '\n'))
let g:startify_custom_header =
  \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

" ======================================================================================================================
" => PHP Namespaces
" ======================================================================================================================

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" ======================================================================================================================
" => The Silver Searcher
" ======================================================================================================================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" ======================================================================================================================
" => Undotree
" ======================================================================================================================
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" ======================================================================================================================
" => PIV
" ======================================================================================================================
" let g:DisableAutoPHPFolding = 1
