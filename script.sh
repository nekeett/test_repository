#!/bin/bash
restorePsqlFile="/home/nikita/restore_psql.sh"
backupAndRotationPsqlFile="/home/nikita/backup_and_rotation_psql.sh"
restorePsqlOrigSum=$(cat /home/nikita/sums.txt | grep $restorePsqlFile | awk -F "=" '{print $2}')
backupAndRotationPsqlOrigSum=$(cat /home/nikita/sums.txt | grep $backupAndRotationPsqlFile | awk -F "=" '{print $2}')
backupAndRotationPsqlSum=$(md5sum $backupAndRotationPsqlFile | awk '{print $1}')
restorePsqlSum=$(md5sum $restorePsqlFile | awk '{print $1}')
if [ "$backupAndRotationPsqlOrigSum" == "$backupAndRotationPsqlSum" ]
then
echo "file $backupAndRotationPsqlFile is original"
else
echo "file $backupAndRotationPsqlFile has been changed"
fi
if [ "$restorePsqlOrigSum" == "$restorePsqlSum" ]
then
echo "file $restorePsqlFile is original"
else
echo "file $restorePsqlFile has been changed"
fi
