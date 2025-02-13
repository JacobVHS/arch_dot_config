#
# ~/.zshrc
#

# Key bindings for Ctrl + Left and Ctrl + Right
bindkey '^[[1;5C' forward-word  # Ctrl + Right
bindkey '^[[1;5D' backward-word # Ctrl + Left

# Infinite history settings
HISTFILE=~/.zsh_history       # Location of the history file
HISTSIZE=1000000000           # Unlimited in-memory history size
SAVEHIST=1000000000           # Unlimited on-disk history size
setopt append_history         # Append history to file (don't overwrite)
setopt inc_append_history     # Write to history immediately
setopt share_history          # Share history across multiple sessions

# Source aliases from .shell_aliases
if [ -f ~/.shell_aliases ]; then
  source ~/.shell_aliases
fi

# Shell prompt
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Path
export PATH=$HOME/.local/bin:$PATH

