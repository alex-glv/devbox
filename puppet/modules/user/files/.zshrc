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
