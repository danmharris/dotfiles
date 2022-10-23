# dotfiles

This repository holds config files to applications that I use.

## Current setup

* OS: Ubuntu 20.04
* Window Manager: i3-gaps
* Status bar: polybar
* Compositor: compton
* Shell: zsh with oh-my-zsh
* Terminal: kitty
* Editor: neovim

## Installation

An ansible playbook is provided to install all the necessary dependencies for
the config:

```sh
sudo apt install ansible
curl -Lo setup.yml https://github.com/danmharris/dotfiles/raw/main/setup.yml
ansible-playbook -K setup.yml
```

Dotfiles are managed using [chezmoi](https://www.chezmoi.io/). This is so the
config can be used on different machines where value may vary slightly.

```sh
# Clone repository
$ chezmoi init git@github.com:danmharris/dotfiles.git
```

```sh
# Pull in changes and update
$ chezmoi update && chezmoi apply
```

Please note that most files are still catered towards my systems so may not
work on others.
