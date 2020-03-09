
alias ls="ls -laGF"
alias vi="vim"

export EDITOR=/usr/bin/vim
export TERM=xterm-256color
export LANG=ja_JP.UTF-8

unsetopt auto_menu

HISTFILE=~/.zsh_history

HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history

autoload -U compinit
compinit

stty -ixon

bindkey -e
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

source /usr/local/share/zsh/site-functions/_aws

autoload -Uz colors
colors

#setopt PROMPT_SUBST

#autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats ':%b'
#zstyle ':vcs_info:*' actionformats ':%b(%a)'
PROMPT="%{$fg[green]%}[%*] %{$fg[white]%}%m %# %k%f"
RPROMPT="%{$fg[yellow]%}[%~]%k%f"
#RPROMPT="%{$fg[yellow]%}[%~%{$fg[red]%}${vcs_info_msg_0_}%{$fg[yellow]%}]%k%f"
