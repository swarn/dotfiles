# Explictly set vi-mode. This is redundant; having "*vi*" as EDITOR implicitly
# sets this.
bindkey -v

# Make vi mode transitions faster.
export KEYTIMEOUT=1

# Make backspace work like vim in insert mode.
bindkey "^?" backward-delete-char

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

# Define colors for zsh to use in tab completion.
LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46"
LS_COLORS="$LS_COLORS:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Chevron with a little color for a prompt.
PROMPT="%{$fg[green]%}❯%{$reset_color%} "

# Set the session title to the CWD, with ~ truncation.
function showCwdInTitle() { echo -en "\033];$(print -P %~)\007" }
chpwd_functions+=(showCwdInTitle)
showCwdInTitle

# Print a blank line before each new command.
function echoBlank() { echo }
precmd_functions+=(echoBlank)

# Whenever starting a new command, or when the vi mode changes, update the
# cursor symbol based on the mode.
function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        vicmd) print -n '\033[2 q';;    # block cursor
        *)     print -n '\033[6 q';;    # beam cursor
    esac
}
zle -N zle-line-init
zle -N zle-keymap-select

# Enable smarter tab completions.
autoload -U compinit && compinit

# Quiet!
setopt no_beep

# Directory-changing sugar
setopt auto_cd                  # "dir" -> "cd dir"
setopt auto_pushd               # "cd dir" -> "pushd dir"

# Enable fzf completions. Must come after vi-mode to properly rewrite some
# key combinations.
if [ -f /opt/local/share/zsh/site-functions/fzf ]; then
    source /opt/local/share/zsh/site-functions/fzf
fi

alias nvim="/Users/seth/.local/bin/nvim"
