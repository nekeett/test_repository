#!/bin/bash
mailto="nekeett@gmail.com"
scriptFile="/home/nikita/test_repository/script.sh"
script_result=$?
File1=$(cat $scriptFile | grep "File1=" | awk -F "=" '{print $2}')
File2=$(cat $scriptFile | grep "File2=" | awk -F "=" '{print $2}')
theme="Your files has been changed"
if [ "$script_result" == "0" ]
then
exit 0
fi
if [ "$script_result" == "1" ]
then
body="$File1 has been changed. Check it."
fi

if [ "$script_result" == "2" ]
then
body="$File2 has been changed. Check it."
fi

if [ "$script_result" == "15" ]
then
body="Source directory does not exists. Fix it."
fi

echo "$body" | mail -s "$theme" $mailto
