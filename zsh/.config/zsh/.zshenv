# Use neovim as the default editor for many apps.
export EDITOR="nvim"

# Different initialization for different vims.
export VIMINIT='if !has("nvim") | let $MYVIMRC="~/.config/nvim/vimrc" | else | let $MYVIMRC="~/.config/nvim/init.vim" | endif | source $MYVIMRC'

# Where I keep text notes
export NOTES=~/Documents/notes

# Tell various programs to use the XDG directories.
export LESSHISTFILE=$XDG_DATA_HOME/less/lesshistfile
export CONAN_USER_HOME=$XDG_DATA_HOME/conan
export DOCKER_CONFIG=$$XDG_CONFIG_HOME/docker
export JUPYTER_CONFIG_DIR=$$XDG_CONFIG_HOME/jupyter
