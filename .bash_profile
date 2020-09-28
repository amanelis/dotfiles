[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
PATH=/usr/local/bin:/usr/local/sbin:/Users/alexmanelis/.rvm/gems/ruby-1.9.3-p327-falcon/bin:/Users/alexmanelis/.rvm/gems/ruby-1.9.3-p327-falcon@global/bin:/Users/alexmanelis/.rvm/rubies/ruby-1.9.3-p327-falcon/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/amanelis/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/heroku/bin:/usr/local/opt/go/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/amanelis/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/alexmanelis/.rvm/bin
PATH=/usr/local/opt/ruby193/bin:/usr/local/bin:/usr/local/sbin:/Users/alexmanelis/.rvm/gems/ruby-1.9.3-p327-falcon/bin:/Users/alexmanelis/.rvm/gems/ruby-1.9.3-p327-falcon@global/bin:/Users/alexmanelis/.rvm/rubies/ruby-1.9.3-p327-falcon/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/amanelis/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/heroku/bin:/usr/local/opt/go/libexec/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/amanelis/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/alexmanelis/.rvm/bin

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if which java > /dev/null; then export JAVA_HOME=$(/usr/libexec/java_home); fi
