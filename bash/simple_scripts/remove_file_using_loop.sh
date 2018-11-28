# how to move/remove files using for loop.

for i in $(ls); do rm -rf ${i}; done
for i in $(find -mtime +30); do echo ${i}; done
for i in $(find -mtime +30); do mv ${i} /home/media/microstrategy/public/logs_02022018/old_SHARED_folder/; done

cd /var/opt/MicroStrategy/IntelligenceServer/Inbox/mstr_cpes_prod_server_def/
for i in $(find -mtime +30 | grep strm) ; do mv -v ${i} /home/media/microstrategy/public/bckp_05292018/node2/df; done

for i in $(find -size +1G); do echo ${i}; done

for i in $(find -mtime +60); do mv ${i} /home/media/microstrategy/public/logs_02022018/old_SHARED_folder/; done
