# `$ adelq/dotfiles`

These are my personal dotfiles, or configuration files, for various tools and
utilities I have installed.

## Components

So far, I've included the following components:

* Bash
* Git
* Screen
* Tmux
* Vim
* Spacemacs
* Citrix
* mpv

## Install

Currently, I opt to use GNU stow to install my dotfiles. Simply clone this
directory to your home directory, and `stow` the files you wish to symlink and
install. You can also clone it into your projects directory
(`~/Projects/dotfiles`) and symlink it to `~/dotfiles`

For example, to install the bash and spacemacs configurations:

```sh
cd ~
git clone https://github.com/adelq/dotfiles.git
cd dotfiles
stow bash
stow spacemacs
```

## TODO

- [X] Add initial barebones configuration and README
- [ ] Add more components from scattered dotfiles
- [ ] Add bash-based install for systems without `stow`
- [ ] Add documentation for each component
