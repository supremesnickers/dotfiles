# zsh shell config @hoangolo
export ZSH="/Users/supremesnickers/.oh-my-zsh"

# plugins=(colorize zsh-256color zsh-autosuggestions)
# color the username and stuff
autoload -Uz compinit && compinit
autoload -U colors && colors

#PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[yellow]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$fg[blue]%}$%b "
# PS1="%B%{$fg[red]%}%~ %{$fg[yellow]%}YEET %b "
# bindkey -v
# source $ZSH/oh-my-zsh.sh

# export LC_ALL="en_US.UTF-8"
# export LANG="en_US.UTF-8"
export EDITOR=nvim
# Tab completion
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.


alias weather='curl wttr.in'
alias svim='sudo nvim'
alias lx='exa'
alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'

# color for man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

#figlet -f smslant hello there | lolcat -t -F 0.2
#fortune | cowsay -W 80 -s -f eyes || fortune | cowsay -W 80 -s
export PATH=/usr/lib/ccache/bin/:$PATH:$HOME/scripts:$HOME/.emacs.d/bin
export EDITOR="emacsclient"
export VISUAL="emacsclient"
export PATH="$HOME/.node/bin:$HOME/.cargo/bin:$PATH:$HOME/cs/golang/bin"
export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
export GOPATH="$HOME/cs/golang"
export PATH="${PATH}:${HOME}/.local/bin/"

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# syntax highlighting, should be last
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
