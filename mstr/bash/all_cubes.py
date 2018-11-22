#!/usr/bin/env python
# Script created by Kamil Pietrzak on 07/02/2018
import datetime

now = datetime.datetime.now()


with open('/var/opt/MicroStrategy/Command_Manager_Scripts/all_cubes.log') as file_object:
    with open('/var/opt/MicroStrategy/Command_Manager_Scripts/cubes.txt', 'w') as target_object:
        target_object.write("Please find list of all MicroStrategy Cubes.")
        target_object.write("\nScript was run on: " + str(now.strftime("%Y-%m-%d %H:%M" + " UTC."))+ "\n")
        target_object.write('\n' + '----------------------------------------------------------------------' + '\n')
        for line in file_object:
            if 'Name' in line:
                target_object.write(line)
            elif 'Last Updated Time' in line:
                target_object.write(line)
            elif 'Hit Count' in line:
                target_object.write(line)
            elif 'Cache File Size' in line:
                target_object.write(line)
                target_object.write('----------------------------------------------------------------------' + '\n')
