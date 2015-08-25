# dotvim
My vim configuration

## Installation
#### Install vim
```
sudo apt-get install vim-gtk
```
#### Clone repo
```
git clone https://github.com/ramonsanabria/dotvim.git ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/.backup
mkdir ~/.vim/.swap
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim   
ln -s ~/.vim/vimrc ~/.vimrc
```
#### Install all plugins
Open vim and type:
```
:BundleInstall
```
#### Install Conque GDB
```
vim ~/.vim/bundle/Conque-GDB/plugin/conque_gdb.vim
Open conque_gdb.vmb with Vim and run the following commands:
    :so %
    :q
    
```
#### Install Clang
```
sudo apt-get Clang-format
```
#### Compile YCM
```
cd ~/.vim/bundle/YouCompleteMe/
./install.sh --clang-completer
```
#### Install dependencies
Taglist dependency:
```
sudo apt-get install ctags
```
#### Use vimdiff as git mergetool
```
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false
```
#### Install font
```
cd ~/.vim/fonts/
gnome-open Literation\ Mono\ Powerline.ttf
```
Press the install button and close the windows. 
#### Configure Terminator
```
cp ~/.vim/terminator_config/config ~/.config/terminator/
```
