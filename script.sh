#!/bin/bash
File1="/home/nikita/restore_psql.sh"
File2="/home/nikita/backup_and_rotation_psql.sh"
File1OrigSum=$(cat /home/nikita/sums.txt | grep $File1 | awk -F "=" '{print $2}')
File2OrigSum=$(cat /home/nikita/sums.txt | grep $File2 | awk -F "=" '{print $2}')
File2Sum=$(md5sum $File2 | awk '{print $1}')
File1Sum=$(md5sum $File1 | awk '{print $1}')
if [ "$File2OrigSum" == "$File2Sum" ]
then
echo "file $File2 is original"
else
exit 2
fi
if [ "$File1OrigSum" == "$File1Sum" ]
then
else
exit 1
fi
