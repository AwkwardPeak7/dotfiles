## ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases to make my life easier
alias ls='exa --color=auto --group-directories-first' ## list unhidden files
alias ll='ls -lh' ## list unhidden files in list form
alias la='ls -a' ## list all files
alias lla='ls -lah' ## list all files in list form
alias grep='grep -i --color=auto' ## search case-insensitively
alias mv='mv -i' ## verbose output + confirmation
alias rm='rm -I --one-file-system' ## verbose output + confirmation
alias sudo='sudo ' ## to make aliases work with sudo
alias cp='cp -i' ## verbose output + confirmation
alias df='df -h' ## output in megabytes
alias diff='diff --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/.local/dotfiles.git/ --work-tree=$HOME' ## command to manage my dotfiles
alias myip='curl -w "\n" ifconfig.me'
alias yt='youtube-dl --add-metadata -i --write-auto-sub --sub-lang en --embed-subs --merge-output-format mp4'
alias ytp='yt --proxy="socks5://localhost:9050"' ## download using TOR proxy
alias yta='youtube-dl --add-metadata -i -x -f bestaudio/best'
alias qrscan='zbarimg -q --raw'
alias buku='buku --suggest'
alias cat='bat -pp'
alias ip='ip -c'
alias ports='sudo netstat -lepunt'

# Customize default shell behaviour
shopt -s autocd ## To do 'cd directory' without typing 'cd directory' and only typing 'directory'
shopt -s cdspell ## To atomatically correct directory path if minor error exists
shopt -s no_empty_cmd_completion ## To not search completion in $PATH when attempted with empty line
shopt -s histappend ## To append history to 'HISTFILE' rather than overwriting it
shopt -s checkwinsize
bind 'set completion-ignore-case on' ## ignore case for completion

HISTCONTROL=ignoreboth ## don't put duplicate lines or lines starting with space in the history
HISTSIZE=-1 ## unlimited history
HISTFILESIZE=-1 ## unlimited history
HISTFILE="$HOME/.local/share/bash/history"

# immideately write history
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# My prompt customization
PS1='\[\033[01;36m\]\u\[\033[01;37m\]@\[\033[01;32m\]\h:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Print exit code on error
EC() {
	echo -e '\e[1;33m'exit code: $?'\e[m'
}
trap EC ERR

# command not found provided by pkgfile package
source /usr/share/doc/pkgfile/command-not-found.bash
