#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source aliases from .shell_aliases
if [ -f ~/.shell_aliases ]; then
  source ~/.shell_aliases
fi

eval "$(starship init bash)"
