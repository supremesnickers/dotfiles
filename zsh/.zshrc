source ~/dotfiles/zsh/functions

# zsh shell config @hoangolo
export ZSH="/Users/supremesnickers/.oh-my-zsh"

plugins=(poetry colored-man-pages tmuxinator web-search command-not-found osx)
# color the username and stuff
autoload -Uz compinit && compinit
autoload -U colors && colors

# deprecated due to the amazing starship prompt
#PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[blue]%}@%{$fg[yellow]%}%M %{$fg[blue]%}%~%{$fg[red]%}]%{$fg[blue]%}$%b "

export EDITOR="nvim"

# Tab completion
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

alias ee='emacsclient -n'
alias weather='curl wttr.in'
alias svim='sudo nvim'
alias ls='exa'
alias ll='exa -lh'
alias mux='tmuxinator'
alias lg='lazygit'

GOPATH=$(go env GOPATH)

export PATH="$HOME/.deno/bin:/usr/local/bin:$HOME/.node/bin:$HOME/.cargo/bin:$PATH:$HOME/scripts:$HOME/.emacs.d/bin:$HOME/.composer/vendor/bin:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/openjdk/bin"
export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
export PATH="${PATH}:${HOME}/.local/bin/"

export CARGO_TARGET_DIR="$HOME/cs/rust_builds"

source "$HOME/.cargo/env"

source /Users/supremesnickers/.oh-my-zsh/oh-my-zsh.sh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

launchctl setenv PATH $PATH
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f "/Users/supremesnickers/.ghcup/env" ] && source "/Users/supremesnickers/.ghcup/env" # ghcup-env

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/supremesnickers/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/supremesnickers/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/supremesnickers/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/supremesnickers/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.poetry/bin:$PATH"
