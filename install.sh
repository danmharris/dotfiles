#!/usr/bin/env bash

if [[ ! -e /etc/apt/sources.list.d/kgilmer-ubuntu-speed-ricer-focal.list ]]
then
    sudo add-apt-repository ppa:kgilmer/speed-ricer
fi

sudo apt install i3-gaps \
                 i3lock \
                 xss-lock \
                 dmenu \
                 playerctl \
                 feh \
                 compton \
                 polybar \
                 breeze-cursor-theme \
                 lxappearance \
                 kitty \
                 neovim \
                 zsh \

install -dm 0755 ~/.config/nvim/
install -m 0644 nvim/init.vim ~/.config/nvim/

install -m 0644 tmux/.tmux.conf ~/
install -m 0644 zsh/.zshrc ~/

install -dm 0755 ~/.config/polybar
install -m 0644 polybar/config ~/.config/polybar/
install -m 0755 polybar/launch.sh ~/.config/polybar/

install -dm 0755 ~/.config/i3
install -m 0644 i3/config ~/.config/i3/

install -dm 0755 ~/.config/kitty
install -m 0644 kitty/kitty.conf ~/.config/kitty/

[[ $SHELL == $(which zsh) ]] || chsh -s $(which zsh)
