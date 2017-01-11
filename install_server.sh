rm -rf ~/.viminstall
mkdir ~/.viminstall
cd ~/.viminstall
git clone https://github.com/vim/vim.git
cd vim
mkdir vimrun
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=//home/ajzhang/anaconda2/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=//home/ajzhang/anaconda2/envs/py35/lib/python3.5/config-3.5m \
            --enable-perlinterp=no \
            --enable-luainterp=yes \
            --enable-gui=gtk2	\
	    --enable-cscope \
	   --prefix=$HOME/.viminstall/vim/vimrun
make install

echo 'alias vim="~/.viminstall/vim/src/vim"' >>$HOME/.bashrc
echo 'export TERM=xterm-256color' >>$HOME/.bashrc

source $HOME/.bashrc


cd ~/.vim/YouCompleteMe
git submodule update --init --recursive

rm ~/.vimrc

ln -s ~/.vim/vimrc ~/.vimrc

rm -rf ~/.vim/bundle
rm -rf ~/.vim/.backup
rm -rf ~/.vim/.swap

mkdir ~/.vim/bundle
mkdir ~/.vim/.backup
mkdir ~/.vim/.swap

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#install bundle plugins
vim +BundleInstall +qall

#compile and install you complete me
cd ~/.vim/bundle/YouCompleteMe/
./install.sh --clang-completer

#git
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false
