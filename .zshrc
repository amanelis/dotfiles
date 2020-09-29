ZSH=$HOME/.oh-my-zsh

#~/Tmp/neofetch/neofetch --source $(ruby -e "puts Dir['/Users/alexmanelis/Pictures/mannolo/*'].sample") --backend iterm2 --image_size 385px

zsh_internet_signal(){
  local color
  local symbol="\uf7ba"
  if ifconfig en0 | grep inactive &> /dev/null; then
  color="%F{red}"
  else
  color="%F{blue}"
  fi
  echo -n "%{$color%}$symbol "
}

zsh_wifi_signal(){
    local signal=$(nmcli device wifi | grep yes | awk '{print $8}')
    local color='%F{yellow}'
    [[ $signal -gt 75 ]] && color='%F{green}'
    [[ $signal -lt 50 ]] && color='%F{red}'
    echo -n "%{$color%}\uf230  $signal%{%f%}"
}

prompt_zsh_battery_level() {
  local percentage1=`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`
  local percentage=`echo "${percentage1//\%}"`
  local color='%F{red}'
  local symbol="\uf00d"
  pmset -g ps | grep "discharging" > /dev/null
  if [ $? -eq 0 ]; then
    local charging="false";
  else
    local charging="true";
  fi
  if [ $percentage -le 20 ]
  then symbol='\uf579' ; color='%F{red}' ;
    #10%
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]
  then symbol="\uf57a" ; color='%F{red}' ;
    #20%
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]
  then symbol="\uf57b" ; color='%F{yellow}' ;
    #35%
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]
  then symbol="\uf57c" ; color='%F{yellow}' ;
    #45%
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]
  then symbol="\uf57d" ; color='%F{blue}' ;
    #55%
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]
  then symbol="\uf57e" ; color='%F{blue}' ;
    #65%
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]
  then symbol="\uf57f" ; color='%F{blue}' ;
    #75%
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]
  then symbol="\uf580" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 89 ] && [ $percentage -le 99 ]
  then symbol="\uf581" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 98 ]
  then symbol="\uf578" ; color='%F{green}' ;
    #100%
  fi
  if [ $charging = "true" ];
  then color='%F{green}'; if [ $percentage -gt 98 ]; then symbol='\uf584'; fi
  fi
  echo -n "%{$color%}$symbol" ;
}

if [[ "${TERM_PROGRAM}" == "iTerm.app" ]]; then
  # Set name of the theme to load.
  # Look in ~/.oh-my-zsh/themes/
  # Optionally, if you set this to "random", it'll load a random theme each
  # time that oh-my-zsh is loaded.
  # https://github.com/Powerlevel9k/powerlevel9k/wiki/show-off-your-config

  ZSH_THEME="powerlevel9k/powerlevel9k"
  POWERLEVEL9K_MODE="nerdfont-complete"

  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

  # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=" ▶ "
  # POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

  POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL="\ue0b2"
  POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL="\ue0b0"

  #POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  #POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{white}╭─'
  POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{white}╰%f '

  POWERLEVEL9K_CUSTOM_OS_ICON='echo   $(hostname)'
  POWERLEVEL9K_CUSTOM_OS_ICON_BACKGROUND=steelblue1
  POWERLEVEL9K_CUSTOM_OS_ICON_FOREGROUND=black

  POWERLEVEL9K_OS_ICON_BACKGROUND=red
  POWERLEVEL9K_OS_ICON_FOREGROUND=white
  POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
  POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=249 # white

  POWERLEVEL9K_DIR_HOME_FOREGROUND=249
  POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=249
  POWERLEVEL9K_DIR_ETC_FOREGROUND=249
  POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=249
  POWERLEVEL9K_DIR_HOME_BACKGROUND=024 #deepskyblue4a
  POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=024 #deepskyblue4a
  POWERLEVEL9K_DIR_ETC_BACKGROUND=024 #deepskyblue4a
  POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=024 #deepskyblue4a

  POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

  POWERLEVEL9K_STATUS_VERBOSE=true
  POWERLEVEL9K_STATUS_CROSS=true
  POWERLEVEL9K_STATUS_OK_BACKGROUND=017
  POWERLEVEL9K_STATUS_ERROR_BACKGROUND=017

  POWERLEVEL9K_VCS_CLEAN_FOREGROUND=017 # navyblue
  POWERLEVEL9K_VCS_CLEAN_BACKGROUND=040 # green3a
  POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=017 # navyblue
  POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=220 # gold1
  POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=236 #grey19
  POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=160 #red3a
  POWERLEVEL9K_SHOW_CHANGESET=true

  POWERLEVEL9K_CUSTOM_BATTERY_STATUS="prompt_zsh_battery_level"
  POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"

  # POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon custom_internet_signal custom_battery_status_joined ssh root_indicator dir vcs todo go_version kubecontext)
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_os_icon custom_internet_signal custom_battery_status_joined ssh root_indicator dir vcs go_version kubecontext)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time ram)
else
  ZSH_THEME="bira"

  KUBE_PS1_SEPARATOR=''
  KUBE_PS1_SYMBOL_ENABLE=false

  KUBE_PS1_PREFIX=[
  KUBE_PS1_SUFFIX=]
fi

#echo "JUST DO IT" | toilet --gay --font future

###########################################################
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
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# https://github.com/zsh-users/zsh-syntax-highlighting
plugins=(
	bundler
	docker
	encode64
	git
	kubectl
  osx
)

# Path. This should be the standard and work perfectly
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/amanelis/.rvm/bin
export EDITOR='vim'
export TERM=xterm-256color

# RVM
rvm_project_rvmrc=1
rvm_trust_rvmrcs_flag=1

# Aliases
alias p='pwd'
alias c='cd ../ && clear && ls -l'
alias cdgo='cd /Users/alexmanelis/go/src/github.com && clear && ls -l'
alias l='clear && ls -l'
alias ll='clear && ls -la'
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

alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias locip="ipconfig getifaddr en0"

alias bat='bat --style=plain --theme=ansi-dark'
alias cat='bat --style=plain --pager=never'
alias less='bat'

alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias gcc='/usr/bin/gcc -W'
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
alias gac='git add -A . && git commit -S -m'
alias gsm='git submodule foreach git fetch origin --tags && git pull && git submodule update --init --recursive'
alias gpom='git push origin master'
alias gpos='git push origin stage'
alias gpod='git push origin dev'
alias grom='git rebase origin/master'
alias gros='git rebase origin/stage'
alias grod='git rebase origin/dev'
alias cpu='sysctl -n machdep.cpu.brand_string'
alias s='spotify'
alias sn='spotify next'
alias sp='spotify play'
alias ss='spotify stop'

## 55Foundry / Charge
alias csu="open https://meet.google.com/utd-nvpd-whh\?authuser=1"
alias ccl="open https://calendar.google.com/calendar/b/1/r\?tab=wc"
alias 55='cd ~/Development/55Foundry/ && ls -l'
alias cha='cd ~/Development/55Foundry/55Charge/charge && clear && lc'

# Tezos alias
alias tezos-client_pc="/Users/alexmanelis/Development/hsm/tezos/tezos-client --addr tezos-rpc.nodes.polychainlabs.com --port 443 --tls"
alias tezos-client_tz="/Users/alexmanelis/Development/hsm/tezos/tezos-client --addr rpcalpha.tzbeta.net --port 443 --tls"

### Export final path and RVM
export MSF_DATABASE_CONFIG=/usr/local/share/metasploit-framework/config/database.yml

### PATH
export PATH="$PATH:/usr/local/sbin"

# GOPATH neccessary for golang to even work
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export GROOVY_HOME=/usr/local/opt/groovy/libexec
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128M"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Source OH MY ZSH
source $ZSH/oh-my-zsh.sh

# Source AWS credentials
source ~/.aws/environments

# Source GCP credentials
source ~/.gcp/environments

# AWS -------------------------------------------------------
#
# PAYCERTIFY
#
# Authenticate to dev, stage or prod environments
# -----------------------------------------------
pc-dev() {
  echo "Authenticating to [dev]..."
  eval "$(pass paycertify-dev)"
}

pc-test() {
  echo "Authenticating to [test]..."
  eval "$(pass paycertify-test)"
}

pc-stage() {
  echo "Authenticating to [stage]..."
  eval "$(pass paycertify-stage)"
}

pc-prod() {
  echo "Authenticating to [prod]..."
  eval "$(pass paycertify-prod)"
}

pc-ssa() {
  echo "Authenticating to [shared-services]..."
  eval "$(pass paycertify-ssa)"
}

pc-sec() {
  echo "Authenticating to [security]..."
  eval "$(pass paycertify-security-mfa)"
}

pc-ecr-login() {
  echo "Authenticating to [docker-ecr]..."
  eval $(aws ecr get-login --region "us-west-2" --no-include-email --registry-ids "173954218090")
}

pc-accounts() {
  echo "paycertify - \e[1m\e[32mdev\e[0m       840746852291"
  echo "paycertify - \e[1m\e[32mstage\e[0m     208321055488"
  echo "paycertify - \e[1m\e[32mtest\e[0m      336934636274"
  echo "paycertify - \e[1m\e[32mprod\e[0m      592158444005"
  echo "paycertify - \e[1m\e[96mssa\e[0m       173954218090"
  echo "paycertify - \e[1m\e[31msec\e[0m       212389576057"
}


# AWS -------------------------------------------------------
#
# CHARGE
#
# Authenticate to dev, stage or prod environments
# -----------------------------------------------
ch-dev() {
  echo "Authenticating to [dev]..."
  eval "$(pass charge-dev)"
}

ch-test() {
  echo "Authenticating to [test]..."
  eval "$(pass charge-test)"
}

ch-stage() {
  echo "Authenticating to [stage]..."
  eval "$(pass charge-stage)"
}

ch-prod() {
  echo "Authenticating to [prod]..."
  eval "$(pass charge-prod)"
}

ch-ssa() {
  echo "Authenticating to [shared-services]..."
  eval "$(pass charge-ssa)"
}

ch-sec() {
  echo "Authenticating to [security]..."
  eval "$(pass charge-security-mfa)"
}

ch-ecr-login() {
  echo "Authenticating to [docker-ecr]..."
  eval $(aws ecr get-login --region "eu-central-1" --no-include-email --registry-ids "886567298058")
}

ch-accounts() {
  echo "charge - dev       777212039479"
  echo "charge - stage     648561367723"
  echo "charge - test      657121371987"
  echo "charge - prod      268417472676"
  echo "charge - ssa       886567298058"
  echo "charge - sec       157402593452"
}

# Update the Kubectl for each environment K8S
# ----------------------------------------------
devK() {
  aws eks --region us-west-2 update-kubeconfig --name eks-dev
}

testK() {
  aws eks --region us-west-2 update-kubeconfig --name eks-test
}

stageK() {
  aws eks --region us-west-2 update-kubeconfig --name eks-stage
}

prodK() {
  aws eks --region us-west-2 update-kubeconfig --name eks-prod
}

export KUBECONFIG=/Users/alexmanelis/.kube/config
alias ta="terragrunt apply"
alias tp="terragrunt plan"
alias td="terragrunt destroy"
alias kct="kubectl config get-contexts"
alias kgp="kubectl get pods --all-namespaces"
alias kgpp="kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name,SPACE:.metadata.namespace --all-namespaces"
alias kgs="kubectl get services --all-namespaces"
alias kgn="kubectl get nodes --all-namespaces"
alias kgv="kubectl get pvc --all-namespaces"
alias k8i="kubectl config view | grep -A10 'name: $(kubectl config current-context)' | awk '$1==access-token:{print $2}'"
alias k8t="kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')"
alias k8p="kubectl proxy"
alias k8w="open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"
alias kclear="kubectl config unset current-context"

kr1() {
  ~/k8s.resources
}

kr2() {
  kubectl get nodes --no-headers | awk '{print $1}' | xargs -I {} sh -c 'echo {}; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo'
}

ktok() {
  kubectl config view | grep -A10 "name: $(kubectl config current-context)" | awk '$1=="access-token:"{print $2}'
}

# MySQL
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
export PATH="/usr/local/Cellar/mysql@5.5/5.5.61/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# Colorcat ls iTerm colors
source ~/.fonts/*.sh
alias lc='colorls -lA --sd --gs'

# NVM
export NVM_DIR="/Users/alexmanelis/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Pyenv
export PYENV_ROOT="/Users/alexmanelis/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH:/Users/alexmanelis/.pyenv/shims"
eval "$(pyenv init -)"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
