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
alias ftmux='cd ~/ && ./flatbook-tmux'
alias mtmux='cd ~/ && ./mahalo-tmux'
alias stmux='tmux source-file ~/.tmux.conf'

# Fixing weirdness with tmux path on macos
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# Sonder aliases
alias sonder_admin="open http://admin.sonder.localhost:3000"
alias sonder_giql="open http://graph.sonder.localhost:3000/i/3579070"

# Sonder Mahalo aliases
alias test_screen="gcp 5fc7ea00f8204c2fa936e726206fb66cf22348f4"


# Raspberry Pi Projects
alias pi-ssh="ssh pi@192.168.1.180"

# Clasp stuff
alias clasp="yarn clasp"

# Open fzf result in vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vzf='vim $(fzf)'
# Some FZF terminal shortcuts
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,storybook}/*" 2> /dev/null'
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
nvm use default # use default alias

# RVM

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
export HOMEBREW_GITHUB_API_TOKEN=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


# Add PIP to path
export PATH="$PATH:~/Library/Python/2.7/bin"

# Add android simulator scripts
deviceid () {
	echo $(adb devices | tail -n2 | head -n1 | awk '{print $1}')
}

rnad () {
	did=`deviceid`
	cd android
	./gradlew clean assembleDebug
	cd ..
	adb install -r ./android/app/build/outputs/apk/debug/app-debug.apk
	adb reverse tcp:8081 tcp:8081
	adb shell am start -n com.sonder.mahalo.debug/com.sonder.mahalo.MainActivity
}


# Sonder specific exports
export NPM_TOKEN=NpmToken.ae8c681c-f1b4-36c8-a26d-0d4a84b1aea5
export PATH="/usr/local/opt/openssl@1.0.2t/bin:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
eval "$(rbenv init -)"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
eval "$(rbenv init -)"

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_SDK_ROOT=/Users/charleslee/Library/Android/sdk
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Rabbitmq
export PATH=$PATH:/usr/local/sbin
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
