# zsh shell config @hoangolo
export ZSH="~/.oh-my-zsh"

plugins=(colored-man-pages tmuxinator web-search command-not-found emacs osx)
# color the username and stuff
autoload -Uz compinit && compinit
autoload -U colors && colors

# deprecated due to the amazing starship prompt
#PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[yellow]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$fg[blue]%}$%b "

export EDITOR="emacsclient -n -a emacs"
# Tab completion
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

alias ee='emacsclient -n'
alias weather='curl wttr.in'
alias svim='sudo nvim'
alias lx='exa'
alias mux='tmuxinator'

export PATH="/usr/local/bin:$HOME/.node/bin:$HOME/.cargo/bin:$PATH:$HOME/scripts:$HOME/.emacs.d/bin"
export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
export PATH="${PATH}:${HOME}/.local/bin/"

source "$HOME/.cargo/env"

source ~/.oh-my-zsh/oh-my-zsh.sh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

launchctl setenv PATH $PATH
eval "$(starship init zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f "/Users/supremesnickers/.ghcup/env" ] && source "/Users/supremesnickers/.ghcup/env" # ghcup-env
