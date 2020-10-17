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

USER_LOCAL=~/.local
path=($USER_LOCAL/bin $path)
manpath=($USER_LOCAL/share/man $manpath)

# Add Python user bin directories to path. This is for anything installed with
# e.g. "pip install --user".
python3 -m site &> /dev/null && path=($path `python3 -m site --user-base`/bin)
python2 -m site &> /dev/null && path=($path `python2 -m site --user-base`/bin)

