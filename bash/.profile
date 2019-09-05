# pretty colors
export CLICOLOR=1

# Replace vim with nvim.
alias vim="nvim"
alias vimdiff="nvim -d"

# Add MacVim launcher script
export PATH=$PATH:/Applications/MacVim.app/Contents/bin

# Make vim/MacVim use the neovim config file.
export VIMINIT='let $MYVIMRC="~/.config/nvim/init.vim" | source $MYVIMRC'

# Use neovim as the default editor for many apps.
export EDITOR="nvim"

# Add MacPorts paths.
MACPORTS=/opt/local
export PATH=$MACPORTS/bin:$MACPORTS/sbin:$PATH
export MANPATH=$MACPORTS/share/man:$MANPATH

# Add user-level (pip-3.7 install --user ...) binaries
export PATH=$PATH:${HOME}/Library/Python/3.7/bin

# bash command history ignores dupes and lines starting with space
export HISTCONTROL=ignoreboth:erasedups

# minimal prompt
export PS1='\$ '

# pwd in terminal window title
export PROMPT_COMMAND='echo -en "\033]0; "$(dirs +0)" \a"'

# iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

