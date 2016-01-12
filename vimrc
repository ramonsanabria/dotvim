"Thanks Chris Toomey for the vimrc structure
"
""Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim "set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Vimrc is split accross multiple files, so loop over and source each
function! s:SourceConfigFilesIn(directory)
    let directory_splat = '~/.vim/' . a:directory . '/*'
    for config_file in split(glob(directory_splat), '\n')
    	if filereadable(config_file)
    	    execute 'source' config_file
    	endif
    endfor
endfunction
" change the mapleader from \ to ,
let mapleader=","

call s:SourceConfigFilesIn('rcplugins')

filetype plugin indent on
syntax on

call s:SourceConfigFilesIn('rcfiles')

au BufRead,BufNewFile *.cpp 	UltiSnipsAddFiletypes cpp.utils_cpp.opencv
au BufRead,BufNewFile *.h 	UltiSnipsAddFiletypes cpp.utils_cpp.opencv
