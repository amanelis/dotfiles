# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Other really good ones: xiong-chiamiov, half-life, fino-time
ZSH_THEME="fino-time"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# https://github.com/zsh-users/zsh-syntax-highlighting
plugins=(bundler encode64 git zsh-syntax-highlighting)

# Source OH MY ZSH
source $ZSH/oh-my-zsh.sh

# Path. This should be the standard and work perfectly
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/amanelis/.rvm/bin:$PATH
export EDITOR='vim'

# RVM
rvm_project_rvmrc=1
rvm_trust_rvmrcs_flag=1

# Aliases
alias c='cd ../ && clear && ls -l'
alias l='clear && ls -l'
alias ll='clear && ls -la'
alias p='pwd'
alias ror='cd ~/Development/ && clear && ls -l'
alias tc='cd ~/Development/trueandco-web && ls -l'
alias vme='vim +PluginInstall +qall'
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles 1 && killall Finder'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles 0 && killall Finder'

alias gcc='/usr/bin/gcc -W'
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias esearch="elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
alias speaks="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"

alias tm="tmux"
alias tmv="tmux split-window -h"
alias tmh="tmux split-window"

alias tail_development="/usr/local/bin/lnav log/development.log"
alias tail_test="/usr/local/bin/lnav log/test.log"

alias gb='git branch'
alias gd='git diff'
alias gf='git fetch'
alias gr='git ls-files --deleted -z | xargs -0 git rm'
alias gs='git status'
alias glz="git log --no-merges --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll="git log --pretty=oneline --decorate --graph"
alias glll="git lg -p"
alias gstats="git shortlog -sne"
alias glstats="git log --author=\"Alex Manelis\" --pretty=tformat: --numstat | sort"
alias gac='git add . && git commit -m'
alias gphm='git push heroku master'
alias gpom='git push origin master'
alias gpos='git push origin staging'
alias gpod='git push origin develop'
alias gpot='git push origin test'
alias develop='git checkout develop'
alias testing='git checkout testing'
alias staging='git checkout staging'
alias master='git checkout master'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source ~/.joyent-config

### Export final path and RVM
PATH=$PATH:$HOME/.rvm/bin
