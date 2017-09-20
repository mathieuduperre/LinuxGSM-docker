#!/bin/bash

if [ ! -e ~/linuxgsm ]; then
    echo "Initializing Linuxgsm User Script in New Volume"
    cp /linuxgsm.sh ./linuxgsm
fi

# if an attribute is added (name of the game), overwrite env variable GAME_NAME
if [ $# = 1 ]; then
    export GAME_NAME=$@
    echo "Game to be installed:"
    echo $GAME_NAME
fi

./linuxgsm $GAME_NAME
$GAME_NAME auto-install
$GAME_NAME start
while true; do sleep 1000; done

exit 0
