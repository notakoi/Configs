[[ $- != *i* ]] && return

export PS1="\[\033[38;5;27m\][\[$(tput sgr0)\]\[\033[38;5;39m\]\T\[$(tput sgr0)\]\[\033[38;5;27m\]][\[$(tput sgr0)\]\[\033[38;5;39m\]\u\[$(tput sgr0)\]\[\033[38;5;27m\]@\[$(tput sgr0)\]\[\033[38;5;39m\]\h\[$(tput sgr0)\]\[\033[38;5;27m\]][\[$(tput sgr0)\]\[\033[38;5;160m\]\$?\[$(tput sgr0)\]\[\033[38;5;26m\]]\[$(tput sgr0)\]\[\033[38;5;27m\][\[$(tput sgr0)\]\[\033[38;5;41m\]\w\[$(tput sgr0)\]\[\033[38;5;27m\]]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
#export PS1="\[\033[38;5;22m\][\[$(tput sgr0)\]\[\033[38;5;10m\]\T\[$(tput sgr0)\]\[\033[38;5;22m\]][\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;22m\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;22m\]][\[$(tput sgr0)\]\[\033[38;5;1m\]\$?\[$(tput sgr0)\]\[\033[38;5;22m\]]\[$(tput sgr0)\]\[\033[38;5;22m\][\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput sgr0)\]\[\033[38;5;22m\]]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
export LANG="en_US.UTF-8"
export LC_COLLATE="C"
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
bind 'set completion-ignore-case on'
complete -cf doas
shopt -s autocd
