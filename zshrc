# shell shortcuts
alias ls='ls --color=auto'
alias ll='ls -ltr'
alias c='clear'
alias l='ls -1'
alias atomic='cd ~/atomic/'
alias g='git'
alias jacob='git branch jacob && git checkout jacob'
alias ato='atomic'
alias ll='ls -ltr'
alias l='ls -1'
alias gp='git push'
alias gc='git commit -m'
alias jacob='git branch jacob && git checkout jacob'
alias cat='bat'
alias ccat='/bin/cat'
alias c='clear'
alias devops='source ~/.devops/bin/activate'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(starship init zsh)"

export PATH=$HOME/.local/bin:$PATH
