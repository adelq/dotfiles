# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

# Useful timestamp format
HISTTIMEFORMAT='%F %T '

# Save history with every command
export PROMPT_COMMAND='history -a'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export EDITOR=vim

# Install global NPM packages locally
NPM_PACKAGES="${HOME}/.npmglobal"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Go paths
export GOPATH="$HOME/go"
# Ruby paths
export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/ruby/2.6.0/bin:$PATH"
# Path magics
export PATH="$HOME/bin:$GOPATH/bin:$HOME/.local/bin:/opt/genymotion:/opt/nim/bin:~/.nimble/bin:$PATH"


# Usage command for examples in man pages
eg(){
  MAN_KEEP_FORMATTING=1 man "$@" 2>/dev/null \
    | sed --quiet --expression='/^E\(\x08.\)X\(\x08.\)\?A\(\x08.\)\?M\(\x08.\)\?P\(\x08.\)\?L\(\x08.\)\?E/{:a;p;n;/^[^ ]/q;ba}' \
    | ${MANPAGER:-${PAGER:-pager -s}}
}

binstall(){
    bin="$1"
    binname=$(basename "$bin")
    binpath=$(realpath "$bin")
    chmod u+x "$bin"
    ln -s "$binpath" "$HOME/bin/${binname}"
}

# youtube-dl wrappers for downloading audio from youtube
ytdl_playlist(){
    yt-dlp --ignore-errors --no-overwrites --continue --format 'bestaudio[ext=webm]' --add-metadata -o "%(playlist_index)s - %(title)s.opus" "$1"
}

ytdl_audio(){
    yt-dlp --format 'bestaudio[ext=webm]' --add-metadata -o '%(title)s.opus' "$1"
}

# Include environment variables
if [ -f ~/.envvars ]; then
    . "$HOME/.envvars"
fi

# Ansible configuration
export ANSIBLE_NOCOWS=1
