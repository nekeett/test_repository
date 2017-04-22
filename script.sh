#!/bin/bash
source="/home/nikita/test_repository"
if [ ! -d "$source" ]
then
echo "Source directory '$source' does not exists"
exit 15
fi
sumsFile="/home/nikita/sums.txt"
File1=$(cat $sumsFile | grep file1 | awk -F "=" '{print $2}')
File2=$(cat $sumsFile | grep file2 | awk -F "=" '{print $2}')
File1OrigSum=$(cat $sumsFile | grep $File1 | awk -F "=" '{print $3}')
File2OrigSum=$(cat $sumsFile | grep $File2 | awk -F "=" '{print $3}')
File2Sum=$(md5sum $File2 | awk '{print $1}')
File1Sum=$(md5sum $File1 | awk '{print $1}')
if [ ! "$File2OrigSum" == "$File2Sum" ]
then
exit 2
fi

if [ ! "$File1OrigSum" == "$File1Sum" ]
then
exit 1
fi
