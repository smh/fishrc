fish_hybrid_key_bindings
fish_vi_cursor

set -g EDITOR nvim
set -g FZF_TMUX 1

# Base16 Shell
#if status --is-interactive
#    source $HOME/.config/base16-shell/profile_helper.fish
#end
# to set: base16-ocean

# nodenv
status --is-interactive; and source (nodenv init -|psub)

#direnv
eval (direnv hook fish)

alias vi=nvim
alias dc=docker-compose
alias dm=docker-machine

######################################################################
#### TODO: move to theme or plugin, or contribute to base16-shell ####

set SCRIPT_DIR (realpath (dirname (status -f)))
set SCRIPT_DIR ~/.config/base16-shell

# load currently active theme...
if test -e ~/.base16_theme
  eval sh (realpath ~/.base16_theme)
end

function _base16
  set script $argv[1]
  set theme $argv[2]
  eval sh $script
  ln -sf $script ~/.base16_theme
  echo -e "if !exists('g:colors_name') || g:colors_name != 'base16-$theme'\n  colorscheme base16-$theme\nendif" > ~/.vimrc_background
end

# set aliases, like base16_*...
for script in $SCRIPT_DIR/scripts/*.sh
  set theme (string match --regex "scripts/base16-(.*).sh" $script)[2]
  alias ( basename $SCRIPT .sh ) "_base16 $script $theme"
end for
