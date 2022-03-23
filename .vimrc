"	            _                            _     
"	           | |                          ( )    
"	  __ _   __| | _ __    __ _  _ __    ___|/ ___ 
"	 / _` | / _` || '_ \  / _` || '_ \  / _ \ / __|
"	| (_| || (_| || | | || (_| || | | ||  __/ \__ \
"	 \__,_| \__,_||_| |_| \__,_||_| |_| \___| |___/
"	     _         _     __  _  _            
"	    | |       | |   / _|(_)| |           
"	  __| |  ___  | |_ | |_  _ | |  ___  ___ 
"	 / _` | / _ \ | __||  _|| || | / _ \/ __|
"	| (_| || (_) || |_ | |  | || ||  __/\__ \
"	 \__,_| \___/  \__||_|  |_||_| \___||___/
"
"  Last Updated : 23/03/2022


""" SETTINGS
"" Vim Settings
syntax on
set nocompatible
set softtabstop=4 tabstop=4	"Makes the tab equivalent to 4 spaces
set shiftwidth=4
filetype indent on
filetype plugin on
set smartindent	"Enables indentation in code blocks
set number	"Enables the line numbers						
set nobackup											
set noswapfile
set wildmenu
set undofile
set undodir=~/.vim/undodir
set incsearch	"Highlights search results before finishing the search
set scrolloff=8	"Starts scrolling down 8 lines before the last line diplayed
set laststatus=2	"Important for lightline
set noshowmode	"Important for lightline - Hides the modes
set splitright	"Shows the new file in the right of the screen"
set splitbelow	"Shows the new file below the current one"
set updatetime=100
set termwinsize=7x0	"Sets the size of the terminal to 7 rows.
set nofoldenable

"" Language-specific Settings
" Python
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
let g:indentLine_setColors = 0
let g:python_highlight_all = 1
let g:python_highlight_space_errors	= 0
let g:python_slow_sync = 0


""" PLUGINS
call plug#begin('~/.vim/plugged')
"" Interface plugins
Plug 'dracula/vim', { 'as': 'dracula' }	"Color Scheme #Dracula
Plug 'mhinz/vim-startify'	"Startpage
Plug 'itchyny/lightline.vim'	"Lightline
Plug 'preservim/nerdtree'	"File tree	
Plug 'Yggdroot/indentLine'	"Indentations lines
Plug 'sheerun/vim-polyglot'	"Syntax Highlighting for more than 100 languages.

"" Utilities
Plug 'vim-syntastic/syntastic'	"Syntax Checking 
Plug 'dbeniamine/cheat.sh-vim'	"cheat.sh Integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	"fzf Integration
Plug 'airblade/vim-gitgutter'	"Git status (line by line)
Plug 'tpope/vim-fugitive'	"Git integration
Plug 'KKPMW/vim-sendtowindow'	"Sends text to another window
Plug 'tpope/vim-commentary'	"Commenting shortcuts
Plug 'tpope/vim-surround'	"Change surrounding characters
Plug 'vimwiki/vimwiki'  "Personal Wiki

"" Language-specific plugins
" Python
Plug 'davidhalter/jedi-vim'	"Auto-Complete
Plug 'fisadev/vim-isort'	"Python imports sorting
" HTML & CSS & JavaScript
Plug 'ap/vim-css-color'	"CSS colors display
Plug 'mattn/emmet-vim'	"Emmet in Vim
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'vim-scripts/HTML-AutoCloseTag'  "Auto-close HTML Tags

"" Needs to be always loaded last
Plug 'ryanoasis/vim-devicons'	"Icons for filetypes and folders in NERDTree
call plug#end()


""" KEYBINDINGS
"" Vim Keybindings
"Split Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Windows Resizing
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
"Change Split
map <Leader>th <C-w>t<C-w>H			
map <Leader>tk <C-w>t<C-w>K			
"Terminal
nnoremap <leader>tr :ter<CR>

"" Language-specific Keybindings
"Python Keybindings
autocmd Filetype python nnoremap <buffer> <F9> :w<CR>:ter python3 "%"<CR>

"" Plugins Keybindings
"NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

""" PLUGINS CONFIG
"" Colorscheme
let g:dracula_colorterm = 0
let g:dracula_italic = 0
colorscheme dracula

"" Startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]	"Basic Layout
let g:webdevicons_enable_startify = 1	"Enable webdevicons in Startify 

"" Lightline
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

"" NERDtree
autocmd StdinReadPre * let s:std_in=1	"runs NERDTree only if a file is specified
autocmd VimEnter * if argc() > 0 | NERDTree | wincmd p | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif	"Closes NERDTree if it's the only window open 		

"" indentLine
let g:indentLine_setColors = 0	"IndentLines respect the colorscheme

"" syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=/home/adnanekouna-a/.pylintrc'
let g:syntastic_javascript_checkers=['eslint']

"" vim-markdown
let g:vim_markdown_no_extensions_in_markdown = 1	"No need for .md extension in links [vim-command]

"" emmet-vim
let g:user_emmet_install_global = 0			
autocmd FileType html,css EmmetInstall			"Works only with CSS and HTML

"" jedi-vim
let g:jedi#documentation_command = "k"
