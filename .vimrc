".vimrc
"Author: Vince Manapat
"Source: https://github.com/vmanapat/vimrc
"
"NB: I generally keep my .vimrc in its own folder in my dropbox so I 
"    can use git/dropbox. I do this by putting the following in ~/.vimrc
"         
"         set runtimepath=~/Dropbox/vimrc/.vim
"         source ~/Dropbox/vimrc/.vimrc
"
" Pathogen Stuff ------------------- 

set nocp
let mapleader = ","
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set nocompatible " makes sure vim defaults are used. Unecessary when .vimrc exists but whateva.
set modelines=0  " no modelines will be parsed: arcane security vulnerability closed.
set autoindent   " Copies indent from current line when starting a new line.
set showmode     " Always shows the current editing mode.
set showcmd      " Shows the partial command in the last line of the screen.
set hidden       " When on a buffer becomes hidden when it is abandoned (easier to edit multiple files)
"set visualbell  " Uses visual warning instead of a beep. Annoying but uncommend if you want it. 
set cursorline   " Highlights the screenline of the cursor. Helps you find elusive cursor. 
set ttyfast      " Indicates fast terminal connection. More characters sent to screen. 
set ruler        " Shows the line and column number of the cursor position.
set backspace=indent,eol,start   " Influences the working of <bs>, <del>, CTRL-w and CTRL-U in 
                                 " insert mode.Indent allows backspacing over an indent. eol 
                                 " allows backspacing over line breaks (join lines), and start 
                                 " allows backspacing over the start of insert. 
set nonumber     " Hides line number
set relativenumber  " Shows the line number realtive to the line with the cursor. 
set laststatus=2 "Influences when the last window will have a status line (0:never, 2: always)
set history=1000 "A history of commands and previous search patterns.
set undofile     "Makes vim save undo history to file. Dir specified by undodir
set undoreload=10000 " Save the whole buffer for undo when reloading it
set list         "Works with listchars -- useful for seeing the difference between tabs and spaces
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮  "Strings to use in "list" mode. eol (end of line), 
                                                  "tab, trail(ing spaces), extends (char to 
                                                  "show in the last column when wrap is off), 
                                                  "precedes (charto show in the first column, 
                                                  "when 'wrap' is off.
set shell=/bin/bash  " Name of shell to use for ! and :! commands
set lazyredraw       " Screen will not be redrawn while executing commands. 

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=79 " Default textwidth from pep8. Should be 72 for comments.

" Searching
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

" If thy arrow keys offend thee, nnoremap them.
nnoremap<up> <nop>
nnoremap<down> <nop>
nnoremap<left> <nop>
nnoremap<right> <nop>
inoremap<up> <nop>
inoremap<down> <nop>
inoremap<left> <nop>
inoremap<right> <nop>

" Folds
set foldlevelstart=0
nnoremap<c-cr> zvzt
nnoremap <Space> za
vnoremap <Space> za " Space toggles folds
set showmatch " Matching delimiters maybe?

syntax on
set colorcolumn=+1   "OVER THE LINE!  highlight column after 'textwidth' 

" Ack

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Settings for Pymode https://github.com/klen/python-mode

" Show Documentation
let g:pymode_doc = 1 " Load show documentation plugin
let g:pymode_doc_key = 'K' " Key for show python documentation

" Run python code
let g:pymode_run = 1
let g:pymode_run_key = 'R'

" Code Checking
let g:pymode_lint = 1 " Load pylint code plugin
let g:pymode_lint_checker = "pyflakes,pep8,mccabe" " Switch code-checkers
" let g:pymode_lint_ignore = "E501" " Skip errors and warnings
let g:pymode_lint_select = "" " Select errors and warnings E.g. "E4,W"
let g:pymode_lint_onfly = 0 " Run linter on the fly

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"
let g:pymode_lint_write = 1 " Check code every save
let g:pymode_lint_cwindow = 1 " Auto open cwindow if errors are found
let g:pymode_lint_message = 1 " Show error message if cursor placed at the error line
let g:pymode_lint_jump = 0 " Auto jump on first error
let g:pymode_lint_hold = 0 " when quickfix is open " Hold cursor in current window
let g:pymode_lint_signs = 1 " Place error signs
let g:pymode_lint_minheight = 3 " Minimal height of pylint error window
let g:pymode_lint_maxheight = 6 " Maximal height of pylint error window

" Rope Refactoring

let g:pymode_rope = 1 " Load rope plugin
let g:pymode_rope_auto_project = 1 " Auto create and open ropeproject
let g:pymode_rope_enable_autoimport = 1 " Enable autoimport
let g:pymode_rope_autoimport_generate = 1 " Auto generate global cache
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_global_prefix = "<C-x>p"
let g:pymode_rope_local_prefix = "<C-c>r"
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = 0
let g:pymode_rope_always_show_complete_menu = 0

let g:pymode_folding = 1 " Automatic Folding
let g:pymode_motion = 1 " Enable python objects and motion

" Virtualenv support Default values:
let g:pymode_virtualenv = 1 " Auto fix vim python paths if virtualenv enabled

" Other stuff Default values:

let g:pymode_breakpoint = 1 " Load breakpoints plugin
let g:pymode_breakpoint_key = '<leader>b' " Key for set/unset breakpoint
let g:pymode_utils_whitespaces = 1 " Autoremove unused whitespaces
let g:pymode_options_indent = 1 " Set default pymode python indent options
let g:pymode_options_other = 1 " Set default pymode python other options

" Syntax highlight Default values:

let g:pymode_syntax = 1 " Enable pymode's custom syntax highlighting
let g:pymode_syntax_all = 1 " Enable all python highlightings
let g:pymode_syntax_print_as_function = 0 " Highlight "print" as function
let g:pymode_syntax_indent_errors = g:pymode_syntax_all " Highlight indentation errors
let g:pymode_syntax_space_errors = g:pymode_syntax_all " Highlight trailing spaces
let g:pymode_syntax_string_formatting = g:pymode_syntax_all " Highlight string formatting
let g:pymode_syntax_string_format = g:pymode_syntax_all " Highlight str.format syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all " Highlight string.Template syntax
let g:pymode_syntax_doctests = g:pymode_syntax_all " Highlight doc-tests
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all " Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all " Highlight builtin functions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all " Highlight exceptions
let g:pymode_syntax_slow_sync = 0 " For fast machines

