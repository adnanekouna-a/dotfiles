"Basic Settings
syntax on
set nocompatible
set softtabstop=4 tabstop=4								"Makes the tab equivalent to 4 spaces
set shiftwidth=4
filetype indent on
set smartindent											"Enables indentation in code blocks
set number												"Enables the line numbers						
set nobackup											
set noswapfile
set wildmenu
set undofile
set undodir=~/.vim/undodir
set incsearch											"Highlights search results before finishing the search
set scrolloff=8											"Starts scrolling down 8 lines before the last line diplayed
set laststatus=2										"Important for lightline
set noshowmode											"Important for lightline - Hides the modes
set splitright											"Shows the new file in the right of the screen"
set splitbelow											"Shows the new file below the current one"
set foldmethod=indent									"Enable code folding
set foldlevel=99

"Split Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Enable folding with the spacebar
nnoremap <space> za

"Python config
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'connorholyday/vim-snazzy'							"Color Scheme
Plug 'itchyny/lightline.vim'							"Lightline
Plug 'davidhalter/jedi-vim'								"Auto-Complete
Plug 'ap/vim-css-color'									"CSS colors display
Plug 'vim-syntastic/syntastic'							"Syntax highlighting
Plug 'nvie/vim-flake8'									"PEP8 checking
Plug 'preservim/nerdtree'								"File tree
Plug 'kien/ctrlp.vim'									"Super search
Plug 'tpope/vim-fugitive'								"Git integration
Plug 'Yggdroot/indentLine'								"Indentation lines
Plug 'tpope/vim-commentary'								"Easy commenting
Plug 'jbgutierrez/vim-better-comments'					"Better comments
Plug 'vim-python/python-syntax'							"Python Syntax Highlighting
call plug#end()

"Color scheme
colorscheme snazzy

"Plugins Config
let g:lightline = {}
let g:lightline.colorscheme = 'snazzy'
let g:indentLine_setColors = 0
let g:python_highlight_all = 1
let g:python_highlight_space_errors	= 0
let g:python_slow_sync = 0
