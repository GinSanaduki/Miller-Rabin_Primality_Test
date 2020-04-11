#!/bin/sh
# RandInt.sh
# sh RandInt.sh NofD Subject
# sh RandInt.sh 4 13

# Adjust to be a multiple of 4.
Param1=$1
Param2=$2
Param2=$(($Param2 - 1))
Remainder=$(($Param1 % 4))
Param1=$(($Param1 + $Remainder))
Split4=$(($Param1 / 4))

while :
do
	PRNC=`od -A n -t u4 /dev/urandom | \
	head -n $Split4 | \
	awk 'for(i = 1; i <= NF; i++){printf("%s ", $i % 2);}' | \
	# Cut out the number of lines of the parameter value.
	head -n $1 | \
	# http://okgnz.web.fc2.com/xscripts/xscripts02.htm
	# ２進16進変換(AWK)
	/usr/bin/gawk -M '{result = 0; for (i = 1; i < NF + 1; i++){result = result * 2 + $i;} printf("%d\n", result);}'`
	echo $PRNC" "$Param2 | /usr/bin/gawk -M '{if($1 > 0 && $1 <= $2){exit;} else {exit 1;}}' && break;
done

echo $PRNC
exit 0

