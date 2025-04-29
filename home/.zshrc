autoload -U colors && colors

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

#git integration
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST

#vim mode integration
vim_ins_mode="%F{12}[%F{47}INS%F{12}]%{$reset_color%}"
vim_cmd_mode="%F{12}[%F{196}CMD%F{12}]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
} 

PROMPT='${vim_mode}%F{12}[%F{27}%n%F{12}][%F{47}%~%F{12}]%F{12}${vcs_info_msg_0_}%F{12}$%F{white} '
RPROMPT='%F{12}[%F{red}%?%F{12}][%F{red}%*%F{12}]'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select completer _expand _ignored _correct _approximate


autoload -Uz compinit && compinit

_comp_options+=(globdots)

zmodload -i zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey -e

zle_highlight+=(paste:none)

source ~/.config/aliasrc
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
bindkey -v
bindkey '^R' history-incremental-search-backward
