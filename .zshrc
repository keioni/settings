
export UNAME=`uname`

# OS base
if [ $UNAME = "Darwin" ]; then
    alias ls="ls -laGF"
    export LANG=ja_JP.UTF-8
else
    alias ls="ls -laF --color=auto"
    export LANG=C
fi

# vim alias
if [ -x "/usr/bin/vim" ]; then
    alias vi="vim"
    export EDITOR=/usr/bin/vim
else
    export EDITOR=/bin/vi
fi

# docker alias
if [ -x "/usr/local/bin/docker" ]; then
    alias dps='docker ps -a'
fi

alias grep="grep --color=always"

export TERM="xterm-256color"

unsetopt auto_menu

HISTFILE=~/.zsh_history

HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt append_history
setopt hist_ignore_all_dups

if [ -e ~/.config/zsh ]; then
    FPATH=~/.config/zsh:$FPATH
fi

autoload -U compinit
compinit

stty -ixon

bindkey -e
bindkey '^B' backward-word
bindkey '^F' forward-word
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward


# AWS CLI completion
if [ -f "/usr/local/share/zsh/site-functions/_aws" ]; then
    source /usr/local/share/zsh/site-functions/_aws
elif [ -f "/usr/share/zsh/site-functions/aws_zsh_completer.sh" ]; then
    source /usr/share/zsh/site-functions/aws_zsh_completer.sh
fi

# use starthip if exist instrad of built-in prompt.
if type "starship" > /dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    PROMPT="%F{green}[%*]%f %F{white}%m%f %# "
    RPROMPT="%F{yellow}[%~]%f"
fi

