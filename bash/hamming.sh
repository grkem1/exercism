#!/usr/bin/env bash

main(){
	len=${#1}
	if (( $# != 2 ))
	then
		echo "Usage: hamming.sh <string1> <string2>"
		exit 1
	fi
	if (( ${#1} != ${#2} ))
	then
		echo "strands must be of equal length"
		exit 1
	fi
	total=0
	for i in $(seq 0 "$len")
	do
		if [ "${1:$i:1}" != "${2:$i:1}" ]
		then
			((total += 1))
		fi
		# echo "$i"
	done
	echo $total
}

main "$@"
