#!/usr/bin/gawk -f
# Zero_One.awk
# awk -f Zero_One.awk

{
	for(i = 1; i <= NF; i++){
		printf("%s ", $i % 2);
	}
}

