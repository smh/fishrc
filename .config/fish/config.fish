fish_hybrid_key_bindings
fish_vi_cursor

set -g EDITOR nvim
set -g FZF_TMUX 1

# nodenv
status --is-interactive; and source (nodenv init -|psub)

#direnv
eval (direnv hook fish)

alias vi=nvim
alias dc=docker-compose
alias dm=docker-machine
