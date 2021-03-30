## ~/.profile

# source bashrc if running bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# add local bin directory and all subdirectories to path
PATH=$(find "$HOME/.local/bin" -type d | tr '\n' ':')$PATH:"$HOME/.local/share/npm/bin"
export PATH

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# development
export MAKEFLAGS="-j5"

# XDG Base Directory structure
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# clean up home folder
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export LESSHISTFILE="-"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc" # this pythonrc changes location of history file
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wgetrc" # this wgetrc changes location of history file
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export RANDFILE="$XDG_CACHE_HOME/rnd"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"

# Qt5 theme
export QT_QPA_PLATFORMTHEME="qt5ct"

# disable gtk overlay scrollbars
export GTK_OVERLAY_SCROLLING=0

# default wine options
export WINEARCH="win32"
export WINEPREFIX="$HOME/.local/wine/default/"
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
export WINEDEBUG=-all # this is here because it supposedly increase the speed as wine don't need to print log to stdout (which is not required when running from launcher...) so unset it when installing a program for better troubleshooting.

# tcl/tk theme
export TCLLIBPATH="$XDG_DATA_HOME/tk-themes"

# xinput2 for firefox and thunderbird
export MOZ_USE_XINPUT2=1

# LS_COLORS
eval "$(dircolors)"

# Man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# start X server if on tty1 and X server not already running
# [ "$(tty)" = "/dev/tty1" ] && ! ps -e | grep -qw Xorg &&\
# startx

# # start wayland if on tty1 and no DISPLAY env set
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	# current desktop
	export XDG_CURRENT_DESKTOP=sway

	# Wayland backend for QT5+
	export QT_QPA_PLATFORM=wayland
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

	# Wayland backend for Firefox and Thunderbird
	export MOZ_ENABLE_WAYLAND=1

	# Wayland backend for GTK3+
	export GTK_BACKEND=wayland

	# Sway window manager
	sway
fi
