#!/bin/bash
sum1="ae095c686fbb21404628a3efa8221b99"
file="restore_psql.sh"
sum2=$(md5sum $file | awk '{print $1}')
if [ "$sum1" == "$sum2" ]
then
echo "Everything is OK."
else
echo "$file already changes"
fi
