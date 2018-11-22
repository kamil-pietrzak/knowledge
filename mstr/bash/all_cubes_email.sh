#!/bin/sh
# This script was created by Kamil Pietrzak on 07/31/2018

# Executing MicroStrategy Command Manager script listing information about all published cubes and storing it as a all_cubes.log.
/var/opt/MicroStrategy/bin/mstrcmdmgr -connlessMSTR -f "/var/opt/MicroStrategy/Command_Manager_Scripts/all_cubes.scp" -o "/var/opt/MicroStrategy/Command_Manager_Scripts/all_cubes.log"

#Scripts wait 3 minutes so all_cubes.log file will be created.
sleep 180

# Executing python script parsing all_cubes.py and storing it as cubes.txt
/var/opt/MicroStrategy/Command_Manager_Scripts/all_cubes.py

# Setting LOG variable for email delivery.
LOG=/var/opt/MicroStrategy/Command_Manager_Scripts/cubes.txt
L=/var/opt/MicroStrategy/Command_Manager_Scripts/all_cubes.log

# If LOG file exist,  email is sent.
if [ -s $LOG ]; then
    mail -s "Daily MicroStrategy Intelligence Cube update." xxx@gmail.com< $LOG
    rm -r $LOG
    rm -r $L
fi
