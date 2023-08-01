autoload -U colors && colors

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

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

autoload -Uz compinit
zstyle ':completion:*' menu select completer _expand _complete _ignored _correct _approximate
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

zle_highlight+=(paste:none)

source ~/.config/aliasrc
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
