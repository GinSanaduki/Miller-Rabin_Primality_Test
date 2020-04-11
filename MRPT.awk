#!/usr/bin/gawk -f
# MRPT.awk

# Usage.
# /usr/bin/gawk -M -f MRPT.awk -v Subject=$Subject -v k=$k

# Return Value is 0 : Subject is prime number.
# Return Value is 1 : Subject is not prime number.
# Return Value is 99 : Invalid Argument.

# Example.
# /usr/bin/gawk -M -f MRPT.awk -v Subject=13 -v k=50
# /usr/bin/gawk -M -f MRPT.awk -v Subject=13 -v k=100

# Reference.
# https://pashango-p.hatenadiary.org/entry/20090704/1246692091
# Pythonを使って高速素数判定をしてみる - Pashango’s Blog

BEGIN{
	Subject = Subject + 0;
	sub(/^\-/,"",Subject);
	k = k + 0;
	if(k == 0){
		exit 99;
	}
	
	if(Subject == 2){
		exit;
	}
	if(Subject < 2 || and(Subject, 1) == 0){
		exit 1;
	}
	
	Odds = rshift(Subject - 1, 1);
	while(and(Odds, 1) == 0){
		Odds = rshift(Odds, 1);
	}
	
	# https://b.ueda.tech/?post=05691
	# gawkで2進数にしたときの桁数を求めたいんだがどうしたものか | 上田ブログ
	# ---------------------------------------------------------------------------------
	# 次のようにlog($1)/log(2)して、この値を切り上げればよいのですが、
	# awkには切り上げの関数がありません。
	# 要は小数点のピリオドがあったら切り捨てて1足せと。
	# ---------------------------------------------------------------------------------
	Log2 = log(Subject) / log(2);
	match(Log2, /\./);
	if(RSTART == 0){
		NofD = Log2;
	} else {
		NofD = int(Log2);
		NofD++;
	}
	
	# Get a pseudo-random number between 1 and q-1.
	cmd = "yes \"sh RandInt.sh "NofD" "Subject"\" | head -n "k" | xargs -P 0 -I {} sh -c {} | sort -k 1n,1 | uniq";
	RandmizeArraysCnt = 1;
	while(cmd | getline esc){
		RandmizeArrays[RandmizeArraysCnt] = esc;
		RandmizeArraysCnt++;
	}
	close(cmd);
	
	for(i in RandmizeArrays){
		a = RandmizeArrays[i];
		t = d;
		y = (a ** t) % q;
		while(t != q - 1 && y != 1 && y != q - 1){
			y = (y ** 2) % q;
			t = lshift(t,1);
		}
		if(y != q - 1 && and(t,1) == 0){
			exit 1;
		}
	}
}

