#!/usr/bin/bash

#general rc files
cp .latexmkrc ..
cp .bashrc ..
cp .tmux.conf ..
cp  vim/.vimrc ..
cp -r vim/* ../.vim/
cp .clang-format ..

#general package installations
sudo apt install curl cmake g++-14 libpython3-dev libpcre3-dev clang-format
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 100
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 100

#VIM
curl -fLo /home/vysotskiial/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -Ec ":PlugInstall | :qa"
cd ~/.vim/plugged/You*
./install.py --clangd-completer

#LaTeX
sudo apt install texlive-bibtex-extra texlive-lang-cyrillic texlive-latex-extra latexmk biber texlive-luatex fonts-cmu

exit
cd
git clone https://github.com/stefanhepp/pplatex
cd pplatex
cd build
cmake ..
make
sudo cp src/pplatex /usr/bin
cd && rm -rf pplatex
