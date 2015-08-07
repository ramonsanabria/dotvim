"Vundle
set nocompatible 
filetype off                  
set rtp+=~/.vim/bundle/Vundle.vim "set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"General settings
:inoremap jk <esc>
let mapleader=","  			       " change the mapleader from \ to ,
set relativenumber                             " set relative numbers
set number                                     " Line numbers
set autoindent                                 " always set autoindenting on
set copyindent                                 " copy the previous indentation on autoindenting
set scrolloff=5                                " Scroll before end of file
set shiftwidth=4                               " 4 spaces when shifting
set spell spelllang=en_us                      " set English spell check
set spellfile=~/.vim/spell/techspeak.utf-8.add " set the list path of added words of the spell checking
set directory=~/.vim/.swap                     " put all swap files in this directory
set ignorecase                                 " search case insensitive
set smartcase                                  " use case if any caps used
set incsearch                                  " incremental search
set hlsearch                                   " highlight search
"set completeopt-=preview                       " disable preview windows
set history=600                                " increase history size
set showcmd                                    " show commands
set title                                      " update title



set previewheight=1

		
"toogle between full-screen and split screen"
nnoremap <leader>x :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0 
function! QuickfixToggle() 
    if g:quickfix_is_open 
	execute "normal \<c-w>=" 
    	let g:quickfix_is_open = 0 
    else
	execute "normal \<c-w>_\<c-w>\|"
	let g:quickfix_is_open = 1 
    endif 
endfunction

"Jump with long lines
nnoremap j gj
nnoremap k gk

"Fold functions (general setting)
set foldenable
set foldmethod=syntax
:map za zA
nnoremap <Space> zA

"Turn syntax highlighting on (general setting)
set t_Co=256 "Color register number og bits"
syntax on "Syntax for type of language'
colorscheme distinguished

"Pathogen
Plugin 'tpope/vim-pathogen'
filetype off              " Pathogen needs to run before plugin indent on
call pathogen#infect()
call pathogen#helptags()  " generate helptags for everything in 'runtimepath'
filetype plugin indent on

"DoxygenToolkit
Plugin 'mrtazz/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName = "Albert Pumarola"

"CtrlP
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map           = '<c-p>'
let g:ctrlp_cmd           = 'CtrlP'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command  = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

"Cpp enchanced highlights
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1

"NERDTree
Plugin 'scrooloose/nerdtree'
map  <C-t>     :tabnew<CR>
map  <S-L>     :tabnext<CR>
map  <S-H>     :tabprevious<CR>
map <leader>n  :NERDTreeToggle<CR> 
let NERDTreeMapOpenSplit='x' "horizontal split
let NERDTreeMapOpenVSplit='v' "vertical split

"UltiSnips
Plugin 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories  = ["snippets_ultiSnips"]
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
au BufRead,BufNewFile *.cpp 	UltiSnipsAddFiletypes cpp.utils_cpp

"Airline
Plugin 'bling/vim-airline'
set guifont=Liberation\ Mono\ for\ Powerline\ 12
let g:airline_theme                        = 'powerlineish'
let g:airline#extensions#branch#enabled    = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts              = 1
let g:airline_enable_tagbar = 1

"YCM
let g:ycm_confirm_extra_conf  = 0
let g:ycm_show_diagnostics_ui = 1

"Syntastic
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open             = 1
let g:syntastic_check_on_wq               = 0
let g:syntastic_always_populate_loc_list  = 1
let g:syntastic_enable_signs              = 1
let g:syntastic_error_symbol              = "X"
let g:syntastic_style_error_symbol        = ">"
let g:syntastic_warning_symbol            = "1"
let g:syntastic_sytle_warning_symbol      = ">"
let g:syntastic_cpp_check_header          = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_mode_map                  = {"mode": "active"}

"a.vim
Plugin 'vim-scripts/a.vim'

"Nerdcommenter
Plugin 'scrooloose/nerdcommenter'

"SuperTab
Plugin 'ervandew/supertab'

"Tabular
Plugin 'godlygeek/tabular'

"Vim sensible
Plugin 'tpope/vim-sensible'

"YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

"Fugitive
Plugin 'tpope/vim-fugitive'

"Tagbar
Plugin 'majutsushi/tagbar'
let g:tagbar_compact        = 1
let g:tagbar_map_jump       = 'o'
let g:tagbar_map_togglefold = '<Space>'
map <leader>m :TagbarToggle<CR>

"vim-easymotion
Plugin 'Lokaltog/vim-easymotion'
map <leader>f <Plug>(easymotion-w)

"vim multiple cursor
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-m>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"Clang from Google, it formats de code C++"
Plugin 'rhysd/vim-clang-format'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
	    \ "BreakBeforeBraces" : "Linux"}
let g:clang_format#command = "clang-format-3.6"
autocmd FileType c,cpp,objc nnoremap <F2> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <F2> :ClangFormat<CR>
"nmap <F2> :ClangFormatAutoToggle<CR>

"TaskList
Plugin 'vim-scripts/TaskList.vim'
map <leader>t <Plug>TaskList     

"Enter and stay at the same line"
map <S-K> a<CR>jkk$

"Show marks
Plugin 'vim-scripts/ShowMarks'
let showmarks_include = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

"Autocomplete search 
Plugin 'vim-scripts/SearchComplete'

"Emmet-> autocomplete and other things for html and css"
Plugin 'mattn/emmet-vim'

"Html color syntax-hihlight"
au BufReadPost *.ezt set syntax=html

"Include path
set path=.,include/,../include/

"Tags
set tags+=~/.vim/tags/tags_opencv "include opencv tags
set tags+=~/.vim/tags/tags_pcl_1_8 "include pcl-1.8 tags
if isdirectory("/opt/ros/indigo")
    set tags+=~/.vim/tags/tags_ros_indigo "include ros indigo tags
endif

"redraws the screen and removes any search highlighting.
nnoremap <silent> <F7> :nohl<CR><F7> 

"No need for arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"Compile and execute"
map <Leader>c :w<CR>:make -C build/<CR>

"For training"
inoremap <ESC> <NOP>

"Map for fols the functions"
noremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf



"Deactivate spell check when files open
autocmd BufNew,BufNewFile,BufRead * set nospell
