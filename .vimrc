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
"  Last Updated : 25/12/2021


"""SETTINGS
""Vim Settings
syntax on
set nocompatible
set softtabstop=4 tabstop=4								"Makes the tab equivalent to 4 spaces
set shiftwidth=4
filetype indent on
set smartindent											"Enables indentation in code blocks
set number												"Enables the line numbers						
set nobackup											
set nowritebackup
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
set updatetime=100
set termwinsize=7x0										"Sets the size of the terminal to 7 rows.
set nofoldenable
""Settings necessary for COC
set hidden
set cmdheight=2
set shortmess+=c


"""LANGUAGES-CONFIG
""Python config
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


"""PLUGINS
call plug#begin('~/.vim/plugged')
""Interface
Plug 'dracula/vim', { 'as': 'dracula' }					"Color Scheme #Dracula
Plug 'mhinz/vim-startify'								"Startpage
Plug 'itchyny/lightline.vim'							"Lightline
Plug 'preservim/nerdtree'								"File tree							
Plug 'jbgutierrez/vim-better-comments'					"Better comments
Plug 'Yggdroot/indentLine'								"Indentation Lines
Plug 'ap/vim-css-color'									"CSS colors display

""Utilities
Plug 'neoclide/coc.nvim'								"Auto-Complete engine
Plug 'KKPMW/vim-sendtowindow'							"Sends text to another window
Plug 'airblade/vim-gitgutter'							"Git status (line by line)
Plug 'tpope/vim-fugitive'								"Git integration
Plug 'dbeniamine/cheat.sh-vim'							"cheat.sh Integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }		"fzf Integration
Plug 'tpope/vim-commentary'								"Commenting shortcuts
Plug 'tpope/vim-surround'								"Change surrounding characters
Plug 'vim-syntastic/syntastic'							"Syntax Checking 

##Language-Specific
Plug 'vim-python/python-syntax'							"Python syntax highlighting
Plug 'fisadev/vim-isort'								"Python imports sorting
Plug 'MaxMEllon/vim-jsx-pretty'							"JS code highlighting
Plug 'dense-analysis/ale'								"JS Prettier and Linting
Plug 'elzr/vim-json'									"JSON syntax highlighting
Plug 'plasticboy/vim-markdown'							"Markdown syntax highlighting
Plug 'mattn/emmet-vim'									"Emmet in Vim

"Needs to be always loaded last
Plug 'ryanoasis/vim-devicons'							"Icons for filetypes and folders in NERDTree
call plug#end()


"""KEYBINDINGS
""Vim Keybindings
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

""Language-specific Keybindings
"Python Keybindings
autocmd Filetype python nnoremap <buffer> <F9> :w<CR>:ter python3 "%"<CR>

""Plugins Keybindings
""COC
"Use TAB to trigger the auto-complete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-@> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"GoTo keybindings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"Use K to get documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

""NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"""PLUGINS-CONFIG
""Color Scheme
let g:dracula_colorterm = 0
let g:dracula_italic = 0
colorscheme dracula

""Startify 
"Basic Layout
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

""webdevicons 
let g:webdevicons_enable_startify = 1

""Lightline
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

""NERDtree
"runs NERDTree only if a file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() > 0 | NERDTree | wincmd p | endif
"Closes NERDTree if it's the only window open
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif		

""COC
"Necessary functions for keybindings
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

""ALE
let b:ale_fixers = ['prettier', 'eslint']

""vim-markdown
let g:vim_markdown_no_extensions_in_markdown = 1		"No need for .md extension in links [vim-command]

""emmet-vim
let g:user_emmet_install_global = 0			
autocmd FileType html,css EmmetInstall			"Works only with CSS and HTML

""syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=/home/adnanekouna-a/.pylintrc'
