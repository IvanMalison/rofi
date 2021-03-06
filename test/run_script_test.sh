#!/usr/bin/env bash

SP=$(readlink -f "$0")
DIR=$(dirname "$SP")
echo "$DIR/test_script.sh"
# wait till it is up, run rofi with error message
sleep 1;
rofi -modi "custom:$DIR/test_script.sh" -show custom & 
RPID=$!

# send enter.
sleep 5;
xdotool key 'Down' 
sleep 0.4
xdotool key Return

#  Get result, kill xvfb
wait ${RPID}
RETV=$?
OUTPUT=$(cat output.txt | tr '\n' ' ')
echo ${OUTPUT}
if [ "${OUTPUT}" != 'noot ' ]
then
    exit 1
fi
exit ${RETV}
