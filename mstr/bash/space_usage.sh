#!/bin/sh

DISK_UTILIZATION_THRESHOLD=80
LOG=/var/log/MicroStrategy/disk_usage.log
# Befor running a script LOG file should be deleted (if necessary).
if [ -s $LOG ]; then
rm -r $LOG
fi
# Script checks if space usage exceeds the treshold, if yes log file is created.
df -Pkh | awk '{if(NR>1) print $5 " "$4, $6, $7 }' | while read OUTPUT;
do
USAGE=$(echo $OUTPUT | awk '{ print $1}' | cut -d'%' -f1 )
USAGE_PERCENT=$(echo $OUTPUT | awk '{ print $1}')
DIRECTORY=$(echo $OUTPUT | awk '{print $3, $4}' )
AVAILABLE_SPACE=$(echo $OUTPUT | awk '{print $2}' )
    if [ $USAGE -ge $DISK_UTILIZATION_THRESHOLD ]; then
        echo "Folder '$DIRECTORY' on $(hostname) is running out of space. $USAGE_PERCENT is used already. Remaining space: $AVAILABLE_SPACE " >> $LOG
    fi
done

# If space usage exceeds the threshold (LOG file exist,), email is sent.
if [ -s $LOG ]; then
    echo " " >> $LOG
    #echo "This script was created by Kamil Pietrzak (kamil_pietrzak@apple.com)." >> $LOG
    mail -s "Folder on $(hostname) is running out of space." kamil_pietrzak@apple.com, nithyaa_narayanan@apple.com, sranganathan2@apple.com, kpeera@apple.com, ajith_shetty@apple.com < $LOG
fi
