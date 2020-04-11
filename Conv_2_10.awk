#!/usr/bin/gawk -f
# Conv_2_10.awk
# $GAWK -M -f Conv_2_10.awk

# http://okgnz.web.fc2.com/xscripts/xscripts02.htm
# ２進16進変換(AWK)

{
	result = 0;
	for (i = 1; i < NF + 1; i++){
		result = result * 2 + $i;
	}
	printf("%d\n", result);
}

