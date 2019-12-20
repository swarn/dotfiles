# Ensure directories show up in PATH only once.
typeset -U path
typeset -U manpath

# Add MacPorts paths.
MACPORTS=/opt/local
path=($MACPORTS/bin $MACPORTS/sbin $path)
manpath=($MACPORTS/share/man $manpath)

# Add Python user bin directories to path. This is for anything installed with
# e.g. "pip install --user".
python3 -m site &> /dev/null && path=($path `python3 -m site --user-base`/bin)
python2 -m site &> /dev/null && path=($path `python2 -m site --user-base`/bin)

# Use neovim as the default editor for many apps.
export EDITOR="nvim"

# Make vim/MacVim use the neovim config file.
export VIMINIT='let $MYVIMRC="~/.config/nvim/init.vim" | source $MYVIMRC'

# Tell various programs to use the XDG directories.
export LESSHISTFILE=$XDG_DATA_HOME/less/lesshistfile
export CONAN_USER_HOME=$XDG_DATA_HOME/conan
