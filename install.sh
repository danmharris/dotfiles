#!/usr/bin/env bash

# TODO: Install zsh, oh-my-zsh, base16-shell

install -dm 0755 ~/.config/nvim/
install -m 0644 nvim/init.vim ~/.config/nvim/
install -m 0644 .tmux.conf ~/
install -m 0644 .zshrc ~/
