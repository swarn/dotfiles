# I'm not sure why, but Apple puts code in /etc/zprofile that messes up your
# PATH. This occurs after your user .zshenv configuration, which is where I
# _think_this sort of path manipulation should go. The Apple /etc/zprofile
# advises that PATH manipulation should occur here, instead.

# Ensure directories show up in PATH only once.
typeset -U path
typeset -U manpath

# Add MacPorts paths.
MACPORTS=/opt/local
path=($MACPORTS/bin $MACPORTS/sbin $path)
manpath=($MACPORTS/share/man $manpath)

# User executables. For compiled executables, I generally install to
# ./local/stow and link. Pipx also links from ~/.local/bin to its venvs.
USER_LOCAL=~/.local
path=($USER_LOCAL/bin $path)
manpath=($USER_LOCAL/share/man $manpath)

# Set up paths for LuaRocks
if hash luarocks 2>/dev/null; then
    eval $(luarocks path --bin)
fi
