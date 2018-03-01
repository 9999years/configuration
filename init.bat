@echo off
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
vim +PluginInstall +qall!
