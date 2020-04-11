#!/usr/bin/gawk -f
# Conv_2_10.awk
# $GAWK -M -f Conv_2_10.awk

# http://okgnz.web.fc2.com/xscripts/xscripts02.htm
# ÇQêi16êiïœä∑(AWK)

{
	result = 0;
	for (i = 1; i < NF + 1; i++){
		result = result * 2 + $i;
	}
	# printf("%s => %d \n",$0,result);
	printf("%d\n", result);
}

