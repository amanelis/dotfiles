ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"
#ZSH_THEME="xiong-chiamiov"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# https://github.com/zsh-users/zsh-syntax-highlighting
plugins=(bundler docker encode64 git kubectl)

# Path. This should be the standard and work perfectly
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/amanelis/.rvm/bin
export EDITOR='vim'

# RVM
rvm_project_rvmrc=1
rvm_trust_rvmrcs_flag=1

# Aliases
alias c='cd ../ && clear && ls -l'
alias gt='richgo test ./...'
alias cgo='cd /Users/alexmanelis/go/src/github.com && clear && ls -l'
alias l='clear && ls -l'
alias ll='clear && ls -la'
alias p='pwd'
alias ror='cd ~/Development/ && clear && ls -l'
alias cy='cd ~/Development/Cybric/ && ls -l'
alias 55='cd ~/Development/55Foundry/ && ls -l'
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

local_network_scan() {
  arp -a | grep -vE "(incomplete)"
}
alias lns=local_network_scan

hash_hmac_func() {
	digest="$1"
  data="$2"
  key="$3"
  shift 3
  echo -n "$data" | openssl dgst "-$digest" -hmac "$key" "$@"
}
alias hash_hmac=hash_hmac_func

change_gcp_project() {
  gcloud config set project "$1"
}
alias gcps=change_gcp_project
alias gcpl="ls -lA1 ~/.gcp | grep '.json'"

alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias locip="ipconfig getifaddr en0"

alias kcc="/Users/alexmanelis/Tmp/confluent-3.2.2/bin/kafka-console-consumer"
alias kcp="/Users/alexmanelis/Tmp/confluent-3.2.2/bin/kafka-console-producer"
alias pcb="cd /Users/alexmanelis/Development/Cybric/python-cybric-bundle && atom ."

alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias gcc='/usr/bin/gcc -W'
alias pgrun="postgres -D /usr/local/var/postgres"
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias rstart="/usr/local/bin/redis-server /usr/local/etc/redis.conf"
alias mvim='open -a MacVim'
alias subl2='open -a "Sublime Text 2"'
alias subl3='open -a "Sublime Text"'
alias runmsf='cd /usr/local/share/metasploit-framework && ./msfconsole'
alias macmystart="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias macmystop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias macpgstart="postgres -D /usr/local/var/postgres"
alias mongoclear="rm -rf /usr/local/var/mongodb/*"
alias mongostart="mongod --config /usr/local/etc/mongod.conf"
alias ftp_start='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
alias ftp_stop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'

alias docker_gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc && docker rmi -f spotify/docker-gc'

alias mi='/usr/bin/make install'
alias ml='/usr/bin/make launch'
alias mt='/usr/bin/make test'
alias mtt='/usr/bin/make test_local'

alias gb='git branch'
alias gd='git diff'
alias gf='git fetch'
alias gs='git status'
alias grr='git ls-files --deleted -z | xargs -0 git rm'
alias glz="git log --no-merges --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gla="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gll="git log --pretty=oneline --decorate --graph"
alias glll="git lg -p"
alias gllll="git log --graph --oneline --decorate --all"
alias gstats="git shortlog -sne"
alias glstats="git log --author=\"Alex Manelis\" --pretty=tformat: --numstat | sort"
alias gac='git add -A . && git commit -m'
alias gsm='git submodule foreach git fetch origin --tags && git pull && git submodule update --init --recursive'
alias gphm='git push heroku master'
alias gpom='git push origin master'
alias gpos='git push origin staging'
alias gpod='git push origin develop'
alias gpot='git push origin test'
alias gmom='git merge origin/master'
alias gmod='git merge origin/develop'
alias grom='git rebase origin/master'
alias grod='git rebase origin/develop'
alias develop='git checkout develop'
alias testing='git checkout testing'
alias staging='git checkout staging'
alias master='git checkout master'
alias tf='/usr/local/bin/terraform'

alias cpu='sysctl -n machdep.cpu.brand_string'

### Export final path and RVM
export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/config/database.yml

### PATH
export PATH="$PATH:/usr/local/sbin"

# GOPATH neccessary for golang to even work
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

export GROOVY_HOME=/usr/local/opt/groovy/libexec
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128M"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Source OH MY ZSH
source $ZSH/oh-my-zsh.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Source AWS credentials
#source ~/.aws/environments

# Source GCP credentials
#source ~/.gcp/environments
export KUBECONFIG=/Users/alexmanelis/.kube/config

alias kct="kubectl config get-contexts"
alias kgp="kubectl get pods --all-namespaces"
alias kgpp="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name,SPACE:.metadata.namespace --all-namespaces"
alias kgs="kubectl get services --all-namespaces"
alias kgn="kubectl get nodes --all-namespaces"
alias kgv="kubectl get pvc --all-namespaces"
alias k8t="kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')"
alias k8p="kubectl proxy"
alias k8w="open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
alias dmock="cd /Users/alexmanelis/go/src/github.com/55foundry/dmock && clear && ls -l"

export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
export PATH="/usr/local/Cellar/mysql@5.5/5.5.61/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=$PATH:$HOME/.linkerd2/bin
export PATH="$PATH:/Users/alexmanelis/istio-1.0.6/bin"
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

# Prompt for K8S support
PROMPT='$(kube_ps1)'$PROMPT
