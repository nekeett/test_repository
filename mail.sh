#!/bin/bash
mailto="nekeett@gmail.com"
base_path="/home/nikita/test_repository"
script_result_text=$($base_path/script.sh)
script_result=$?
File1=$(cat /home/nikita/test_repository/script.sh | grep "File1=" | awk -F "=" '{print $2}')
File2=$(cat /home/nikita/test_repository/script.sh | grep "File2=" | awk -F "=" '{print $2}')
theme="Your files has been changed"
if [ "$script_result" == "1" ]
then
body="$File1 has been changed. Check it."
fi

if [ "$script_result" == "2" ]
then
body="$File2 has been changed. Check it."
fi
echo "$body" | mail -s "$theme" $mailto
