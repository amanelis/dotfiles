ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Other really good ones: xiong-chiamiov, half-life, fino-time
#ZSH_THEME="fino-time"
#ZSH_THEME="bira"
#ZSH_THEME="xiong-chiamiov"
#ZSH_THEME="half-life"
ZSH_THEME="gnzh"

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
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/amanelis/.rvm/bin
export EDITOR='vim'

# RVM
rvm_project_rvmrc=1
rvm_trust_rvmrcs_flag=1

# Aliases
alias c='cd ../ && clear && ls -l'
alias cgo='cd /Users/alexmanelis/go/src/github.com && clear && ls -l'
alias l='clear && ls -l'
alias ll='clear && ls -la'
alias p='pwd'
alias ror='cd ~/Development/ && clear && ls -l'
alias cy='cd ~/Development/Cybric/fabric && ls -l'
alias vme='vim +PluginInstall +qall'
alias show_hidden='defaults write com.apple.finder AppleShowAllFiles 1 && killall Finder'
alias hide_hidden='defaults write com.apple.finder AppleShowAllFiles 0 && killall Finder'
kill_processes() {
  ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
}
find_processes() {
  ps -ef | grep $1 | grep -v grep | awk '{print $2" "$8}'
}
kill_webserver() {
  lsof -i $1 | grep -v PID | awk '{print $2}' | xargs kill -9
}
docker-ip() {
  boot2docker ip 2> /dev/null
}
alias kp=kill_processes
alias fp=find_processes
alias kw=kill_webserver

dsrev () { cap dev_staging rev -s dev=$1 }
dslog () { cap dev_staging log -s dev=$1 }
dsdeploy () { cap dev_staging deploy -s dev=$1 }
dsimportdb () { cap dev_staging deploy:staging:import_db -s dev=$1 }

alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias gcc='/usr/bin/gcc -W'
alias pgrun="postgres -D /usr/local/var/postgres"
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias rstart="/usr/local/bin/redis-server /usr/local/etc/redis.conf"
alias database_stop="launchctl remove homebrew.mxcl.mysql && launchctl remove homebrew.mxcl.postgresql"
alias esearch="elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
alias speaks="sudo kill `ps -ax | grep 'coreaudiod' | grep 'sbin' |awk '{print $1}'`"
alias cdshadow="cd $CSHADOW"
alias mate='open -a TextMate'
alias subl2='open -a "Sublime Text 2"'
alias subl3='open -a "Sublime Text"'
alias runmsf='cd /usr/local/share/metasploit-framework && msfconsole'

alias iso="cd /Users/alexmanelis/Development/Ruby/isofun"
alias macmystart="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias macmystop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias macpgstart="postgres -D /usr/local/var/postgres"
alias ftp_start='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
alias ftp_stop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'

alias gb='git branch'
alias gd='git diff'
alias gf='git fetch'
alias gr='git ls-files --deleted -z | xargs -0 git rm'
alias gs='git status'
alias glz="git log --no-merges --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll="git log --pretty=oneline --decorate --graph"
alias glll="git lg -p"
alias gllll="git log --graph --oneline --decorate --all"
alias gstats="git shortlog -sne"
alias glstats="git log --author=\"Alex Manelis\" --pretty=tformat: --numstat | sort"
alias gac='git add -A . && git commit -m'
alias gphm='git push heroku master'
alias gpom='git push origin master'
alias gpos='git push origin staging'
alias gpod='git push origin develop'
alias gpot='git push origin test'
alias gmom='git merge origin/master'
alias grom='git rebase origin/master'
alias develop='git checkout develop'
alias testing='git checkout testing'
alias staging='git checkout staging'
alias master='git checkout master'

### Export final path and RVM
export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/config/database.yml
export VAULT_ADDR='http://127.0.0.1:8200'
export PYENV_ROOT=/usr/local/var/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

# PYENV
eval "$(pyenv init -)"

### PATH
export PATH="$PATH:/usr/local/sbin"

# GOPATH neccessary for golang to even work
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export PATH="$PATH:$HOME/.rvm/bin"
