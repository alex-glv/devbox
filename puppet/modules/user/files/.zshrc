alias drmi='docker rmi -f $(docker images -qa)'
alias drm='docker rm -f $(docker ps -qa)'

function chpwd; {
    DIRECTORY="$PWD"
    while true; do
        if [ -f './.env.rc' ]; then
            source './.env.rc'
            break
        fi
        if [ -f './env' ]; then
            source './env'
            break
        fi
        [ $PWD = '/' ] && break
        cd -q ..
    done
    cd -q "$DIRECTORY"
}

source /home/vagrant/.gvm/scripts/gvm
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
export PATH=$PATH:/home/vagrant/bin
