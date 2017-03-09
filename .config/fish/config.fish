fish_hybrid_key_bindings
fish_vi_cursor

set -g editor vi
set -g FZF_TMUX 1

# Base16 Shell
if status --is-interactive
    source $HOME/.config/base16-shell/profile_helper.fish
end
# to set: base16-ocean

# nodenv
status --is-interactive; and source (nodenv init -|psub)

#direnv
eval (direnv hook fish)

alias vi=nvim
alias dc=docker-compose
alias dm=docker-machine
