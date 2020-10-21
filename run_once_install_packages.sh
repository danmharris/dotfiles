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
