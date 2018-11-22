#!/bin/bash
#Display infomation about the sytem.
echo

time=$(date "+%H:%M:%S, %Y-%m-%d.")
user=$(whoami)
redblink="\033[31;5m"
c="\033[0m"
used=$(df -h | awk 'FNR==2 {print $5}' | sed 's/%//')
avail=$((100-$used))
#echo $used
#echo $avail 

echo Script executed on: $time
echo -e '\tUser: ' $redblink$user$c
printf "\tAvailable space: $avail\n"

