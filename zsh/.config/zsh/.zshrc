# Ensure directories show up in PATH only once.
typeset -U path
typeset -U manpath

# Add MacPorts paths.
MACPORTS=/opt/local
path=($MACPORTS/bin $MACPORTS/sbin $path)
manpath=($MACPORTS/share/man $manpath)

# Add Python user bin directories to path. This is for anything installed with
# e.g. "pip install --user". Note: When Python is upgraded,  e.g. from 3.7 to
# 3.8, packages may need to be re-installed or Python versions managed.
python3 -m site &> /dev/null && path=($path `python3 -m site --user-base`/bin)
python2 -m site &> /dev/null && path=($path `python2 -m site --user-base`/bin)

# Use neovim as the default editor for many apps.
export EDITOR="nvim"

# Replace command-line vim with nvim.
alias vim="nvim"
alias vimdiff="nvim -d"

# Add MacVim launcher script to the path.
path=($path /Applications/MacVim.app/Contents/bin)

# Make vim/MacVim use the neovim config file.
export VIMINIT='let $MYVIMRC="~/.config/nvim/init.vim" | source $MYVIMRC'

# History command configuration
HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=50000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore consecutive duplicates
setopt hist_ignore_space    # ignore commands that start with space
setopt append_history       # add commands to HISTFILE when exiting

# Enable pretty colors.
export CLICOLOR=1

# Define a few color aliases.
autoload -U colors && colors

# zsh runs the precmd function before printing each prompt.
function precmd() {
    # Set the iterm2 window title with the current directory.
    echo -en "\033];$(print -P %~)\007"
}

# Explictly set vi-mode. This is redundant; having "vi*" as EDITOR implicitly
# sets this.
bindkey -v

# Whenever starting a new command, or when the mode changes, change the prompt.
function zle-line-init zle-keymap-select {
    if [[ ${KEYMAP} = vicmd ]]; then
        PROMPT="%{$fg[red]%}>%{$reset_color%} "
    else
        PROMPT="%# "
    fi
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Make vi mode transitions faster.
export KEYTIMEOUT=1

# Make backspace work like vim in insert mode.
bindkey "^?" backward-delete-char

# Enable smarter tab completions.
autoload -U compinit && compinit

# Quiet!
setopt no_list_beep

# Directory-changing sugar
setopt auto_cd                  # "dir" -> "cd dir"
setopt auto_pushd               # "cd dir" -> "pushd dir"
