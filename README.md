# dotfiles

this is my configuration files for software development
Optimized for web development on Arch Linux
Managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Configurations in this pack

* *neovim - the text editor*
* *lunarvim - complete config for neovim*
* *zsh - the Z shell*
* *git - code version control*
* *tmux - one terminal infinite possibilities*
* *asdf - language tool version manager*


## Install

Use the script to setup all configuration


To install the configuration, clone the repo and run the install script:

```
git clone https://github.com/marcelinosandroni/dotfiles\
&& ./dotfiles/install
```

## Programs

The programs are not installed with the script, only the configuration, you need to install it, use the package manager in your distribution to install each of them

example on **arch linux**

```
pacman -Syu neovim zsh tmux git asdf-vm
or
yay -S neovim zsh tmux git asdf-vm
```

example on **ubuntu**

```
sudo apt install neovim zsh tmux git asdf-vm
```

Most of that programs and configs are focused on linux environment, so that do
not work for windows, only using wsl, see [here to install Arch Linux as WSL](https://github.com/yuk7/ArchWSL) on
windows


## Features

That is a list of features for each program I'm using right now

### Neovim

See all the plugins in [plugins config](/nvim/lua/plugins/init.lua)

* Language Server with auto install
* Auto completion from LSP, Snips, Copilot and Common / Recent
* Snips for all languages and frameworks
* Custom themes
* Copilot integration
* Fast find find, browse and search
* Git integration
* Integrated terminal with fast toogle
* Easy navigation

### ZSH

* Theme and layout with power10k
* Auto suggestions and auto complete
* Custom alias and functions

### TMUX

Control sessions and working spaces in terminal

### ASDF

* Manage all language and tools needed with version control

*See all commands with* `asdf --help | less`

Node

```shellscript
# add the nodejs plugin
asdf plugin add nodejs

#install latest long term service version
asdf install nodejs lts
```

Python

```shellscript
# add the python plugin
asdf plugin add python

#install latest version
asdf install python latest
```

Setting different versions

```
asdf global nodejs lts
asdf local nodejs 16
```
