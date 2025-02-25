#initialize brew autocompletions
autoload -Uz compinit
compinit

#initialize starship
eval "$(starship init zsh)"

#initialize tmuxifier
export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

#alias for parallel make
alias makep="make -j14"

#enable colors for ls
alias ls="ls -G"

#enable lowercase insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#set editor for fpp
export FPP_EDITOR='nvim'
