## ~/.zshrc

# History
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/shell/history"
HISTSIZE=1000000
SAVEHIST="$HISTSIZE"

# Shell options
setopt autocd ## auto cd into dir without 'cd'
setopt append_history ## append history to histfile
setopt histignorespace ## ignore spaced histroy
setopt completeinword
setopt interactivecomments ## treat # as comment on interactive shell
setopt histignorealldups
unsetopt beep ## don't beep

bindkey -e ## emacs style keybindings
bindkey '^[OH' beginning-of-line ## ^A beginning of line
bindkey '^[OF' end-of-line ## ^E end of line
bindkey "\e[1;5D" backward-word ## ^<- one word back
bindkey "\e[1;5C" forward-word ## $-> one word forward
bindkey "^r" history-incremental-search-backward ## ^r histroy search
bindkey "^?" backward-delete-char ## ^? delete character backwords
bindkey "\e[3~" delete-char ## del delete character

# Completion
zstyle :compinstall filename '/home/mubashir/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' ## match case insensitively
zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select ## menu selection based completion
zstyle ':completion:*' list-colors '' ## completion color
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" ## completion color same as ls

autoload -U colors && colors
autoload -Uz compinit
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump" ## move .zcompdump
_comp_options+=(globdots) ## include dot files in completion

# Prompt Customization
PROMPT='%F{cyan}%n%f@%F{green}%m%f %F{blue}%B%~%b%f %# '
RPROMPT='[%F{yellow}%?%f]'

# Plugins sourced
# extra/pkgfile
source /usr/share/doc/pkgfile/command-not-found.zsh

# aur/zsh-fast-syntax-highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# community/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# community/grc
source /etc/grc.zsh

# aur/zsh-vi-mode
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# source aliasrc for aliases
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# source funtionrc for functions
source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/functionrc"
