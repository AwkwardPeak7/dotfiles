## ~/.profile

# source bashrc if running bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# add local bin directory and all subdirectories to path
export PATH=$(find "$HOME/.local/bin/" -type d | tr '\n' ':')$PATH

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"

# development
export MAKEFLAGS="-j5"

# XDG Base Directory structure
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# clean up home folder (inspired by Luke Smith)
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export LESSHISTFILE="-"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export HISTFILE="$XDG_DATA_HOME/bash/history"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export XINITRC="$XDG_CONFIG_HOME/xinitrc"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"

# qt5 appearance
export QT_QPA_PLATFORMTHEME="qt5ct"

# prevent font corruption in gtk apps with intel
export COGL_ATLAS_DEFAULT_BLIT_MODE="framebuffer"

# default wine options
export WINEARCH="win32"
export WINEPREFIX="$HOME/.local/wine/default/"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"

# prevent firejail from creating output
export FIREJAIL_QUIET="yes"

# start X server if on tty1 and X server not already running
[ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg &&\
startx "$XDG_CONFIG_HOME/xinitrc"

# make caps lock escape in tty (configure sudo to not ask password for this)
sudo loadkeys "$XDG_CONFIG_HOME/keys.map"
