# Zsh Configuration
# Basic configurations for productivity and user experience

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# General options
setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# Prompt configuration
autoload -U colors && colors
PROMPT='%{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$ '

# Completion system
autoload -U compinit
compinit

# Aliases for productivity
alias ll='ls -la'
alias la='ls -la'
alias l='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# Directory colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Load local configurations if they exist
if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi