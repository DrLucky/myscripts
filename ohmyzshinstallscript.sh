#!/bin/bash

##install zsh and zsh-completions
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wait $!
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
wait $!
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wait $!
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="gnzh"/' ~/.zshrc
wait $!
sed -i 's/plugins=(git)/plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
wait $!
echo "set -o vi" >> ~/.zshrc
wait $!
echo "export EDITOR=/usr/bin/vim" >> ~/.zshrc
wait $!
zshPath=$(which zsh)
chsh -s $zshPath $USER
