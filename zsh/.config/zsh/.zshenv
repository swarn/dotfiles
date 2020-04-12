# Use neovim as the default editor for many apps.
export EDITOR="nvim"

# Make vim/MacVim use the neovim config file.
export VIMINIT='let $MYVIMRC="~/.config/nvim/init.vim" | source $MYVIMRC'

# Tell various programs to use the XDG directories.
export LESSHISTFILE=$XDG_DATA_HOME/less/lesshistfile
export CONAN_USER_HOME=$XDG_DATA_HOME/conan
