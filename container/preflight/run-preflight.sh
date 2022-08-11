#!/bin/bash
clear

echo "Welcome to the BB-P1C Preflight Check. Press any key to continue"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
break ;
else
echo "waiting for the keypress"
fi
done

docker run \
  -v ~/.aws:/aws_creds \
  -v $PWD/report:/app/report \
  -v $PWD/config:/app/config \
  caskeychr/preflight