#!/bin/bash
## linuxgsm-docker base image entrypoint script
## execute linuxgsm or arbitrary server commands at will
## by passing command


## Because of a limitation in LGSM script it must be run from the directory
## It is installed in.
##
## If one wants to use a volume for the data directory, which is the home directory
## then we must keep a backup copy of the script on local drive
if [ ! -e ~/linuxgsm ]; then
    echo "Initializing Linuxgsm User Script in New Volume"
    cp /linuxgsm.sh ./linuxgsm
fi

# with no command, just spawn a running container suitable for exec's
if [ $# = 1 ]; then
    export GAME_NAME=$@
fi

./linuxgsm $GAME_NAME
$@ auto-install
$@ start
while true; do sleep 1000; done


exit 0
