# Path to your oh-my-zsh installation.
export ZSH="/Users/charleslee/.oh-my-zsh"

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
plugins=(git sudo pip python history-substring-search zsh-syntax-highlighting zsh-autosuggestions)

# This needs to be after plugins
source $ZSH/oh-my-zsh.sh
# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for all sessions
export EDITOR='vim'

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
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

function cl()
{
     builtin cd "$*" && ls -a
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
# Git 
alias undo-commit='git reset HEAD~1 --soft'
alias gb='git branch --sort=-committerdate'

# Plugin help
alias zplug='google-chrome https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins'
alias fasdhelp='google-chrome https://github.com/clvv/fasd'

# Backbone Server Commands
alias backbone-webpack='cd ~/code/backbone && ./bin/webpack-dev-server'
alias backbone-rails='cd ~/code/backbone && bundle exec rails s'

# Panorama alias
alias panorama-snapshot='heroku pg:backups:capture --app panorama-prod'
alias panorama-download='heroku pg:backups:download --app panoraam-prod'

# Tmux

# Tmux Sessions
alias btmux='cd ~/ && ./backbone-tmux'
alias ptmux='cd ~/ && ./panorama-tmux'
alias stmux='tmux source-file ~/.tmux.conf'

# Fixing weirdness with tmux path on macos
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# Raspberry Pi Projects
alias pi-ssh="ssh pi@192.168.1.180"

# Clasp stuff
alias clasp="yarn clasp"

# Open fzf result in vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vzf='vim $(fzf)'
# Some FZF terminal shortcuts
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Search history of current terminal string
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Added by Flatbook/Laptop script
export PATH="$HOME/.bin:$PATH"
# Recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
source /usr/local/opt/asdf/asdf.sh


# TODO widget this?
bindkey -s '^P' 'vim $(fzf)^M'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm

# YVM
export YVM_DIR=/Users/charleslee/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# Run fasd autocomplete
eval "$(fasd --init auto)"#

# 10ms for key sequences
KEYTIMEOUT=1

# Iterm2 Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(rbenv init -)"
export HOMEBREW_GITHUB_API_TOKEN=5671106c3278cbf268e9ae6e587ccf8b7b65c6d4
