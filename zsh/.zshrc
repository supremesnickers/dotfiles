########## zsh shell config @hoangolo #########

# oh my zsh
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
[ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/alias.zsh

# export LC_CTYPE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

export ZSH="$HOME/.oh-my-zsh"

plugins=(brew nix-zsh-completions git poetry colored-man-pages tmuxinator web-search command-not-found osx)

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

[ go ] && GOPATH=$(go env GOPATH)

export PATH="$HOME/.deno/bin:/usr/local/bin:$HOME/.node/bin:$HOME/.cargo/bin:$PATH:$HOME/scripts:$HOME/.emacs.d/bin:$HOME/.composer/vendor/bin:$GOPATH/bin:/usr/local/opt/openjdk/bin:${HOME}/.local/bin/:$HOME/.poetry/bin"
export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"

# all rust builds end up in one central folder for easy cleanup
export CARGO_TARGET_DIR="$HOME/cs/rust_builds"

source "$HOME/.cargo/env"

# macOS specific
if [ $(uname) = "Darwin" ]; then
    launchctl setenv PATH $PATH
    [ -f "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"
fi

eval "$(starship init zsh)"
# eval "$(direnv hook zsh)"

# [ bw ] && eval "$(bw completion --shell zsh); compdef _bw bw;"

# with zoxide installed from homebrew
eval "$(zoxide init zsh)"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
