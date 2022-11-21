# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="theunraveler"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo pip python history-substring-search)
# This needs to be after plugins
source $ZSH/oh-my-zsh.sh
# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for all sessions
export EDITOR='vim'

# Fasd init
eval "$(fasd --init auto)"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"
#
# ls aliases

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function mkcd {  #make dir and cd into it
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# Other aliases
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ~='cd ~'
alias c='clear'
alias copy='xclip -selection clipboard'
alias be='bundle exec'
alias bers='nocorrect bundle exec rspec'

# Config shortcuts
alias zshrc='vim ~/.zshrc'
alias szshrc='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'
alias stmux='tmux source-file ~/.tmux.conf'
# Git
alias undo-commit='git reset HEAD~1 --soft'
alias gb='git branch --sort=-committerdate'

# Plugin help
alias zplug='google-chrome https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins'
alias fasdhelp='google-chrome https://github.com/clvv/fasd'

# Fasd aliases
alias v='f -e vim' # quick opening files with vim


# Fixing weirdness with tmux path on macos
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi
# Open fzf result in vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vzf='vim $(fzf)'
# Some FZF terminal shortcuts
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git
,node_modules,storybook}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Search history of current terminal string
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PATH="$HOME/.bin:$PATH"
# TODO widget this?
bindkey -s '^P' 'vim $(fzf)^M'

# 10ms for key sequences
KEYTIMEOUT=1

# Iterm2 Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# Syntax Highlighting
source /Users/charles.lee/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#compdef clyde
_clyde() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _CLYDE_COMPLETE=complete-zsh  clyde)
}
if [[ "$(basename -- ${(%):-%x})" != "_clyde" ]]; then
  compdef _clyde clyde
fi

# Brew for m1 mac
export PATH=/opt/homebrew/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Discord Clyde bootstrap setup
source /Users/charles.lee/.nix-profile/etc/profile.d/nix.sh
source "$HOME/.cargo/env"
