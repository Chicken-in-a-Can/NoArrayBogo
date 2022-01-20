#!/bin/bash
rm -rf tempfile
mkdir tempfile
cd tempfile
read -p "Input length of list you want sorted: " len
echo " 0 " > n.txt
c=1
g=0
bad=1
while (( $bad == 1 ))
do
	mkdir "$c"
	for (( s=1; s<=$len; s++ ))
	do
		he=$(( $RANDOM % $len + 1 ))
		while (( $(grep -c " $he " n.txt) >= 1 ))
		do
			he=$(( $RANDOM % $len + 1 ))
		done
		echo " $he " >> n.txt
		printf "$he" > $c/$s.txt
	done
	for (( b=1; b<$len; b++ ))
	do
		q=$(($b+1))
		if (( $(cat $c/$b.txt) < $(cat $c/$q.txt) ));then
			g=$(($g+1))
		fi
	done
	sg=$(($g+1))
	if (( $sg == $len  ));then
		bad=2
		mv $c ..
		sc=$c
        fi
	c=$(($c+1))
	g=0
	echo " 0 " > n.txt
done
cd ..
rm -rf tempfile
printf "Sorted in $sc Guesses\n"
