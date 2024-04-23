#!/usr/bin/env bash

#      _  _     _  _  _  _  _  _  #
#    | _| _||_||_ |_   ||_||_|| | # decimal numbers.
#    ||_  _|  | _||_|  ||_| _||_| #
#                                 # fourth line is always blank
 
log2() {
	input=$1
	for ((output=0; input > 1; output++)); do
		(( input /= 2 ))
	done
	if (( input == 0 )) ; then output="?"; fi
	echo "$output"
}
main() {
	mapfile -t array
	if (( ${#array[@]} % 4 != 0 )); then
		echo "Number of input lines is not a multiple of four"
		exit 1
	fi
	for row in "${array[@]}"; do
		if (( ${#row} % 3 != 0 )); then
			echo "Number of input columns is not a multiple of three"
			exit 1
		fi
	done
	declare -A top=(["   "]=18   [" _ "]=1005)                                    # sanity check: 18 + 1005 = 1023
	declare -A mid=(["| |"]=1    [" _|"]=12   ["  |"]=130 ["|_|"]=784 ["|_ "]=96) # sanity check:     total = 1023
	declare -A low=(["|_|"]=321  ["  |"]=146  ["|_ "]=4   [" _|"]=552)            # sanity check:     total = 1023
	declare -A bot=(["   "]=1023)
	for (( row = 0; row < ${#array[@]}; row+=4 )); do
		for (( col = 0; col < ${#array[$row]}; col+= 3));do
			(( number = 1023 ))
			(( number &= top[${array[row]:col:3}] ))
			(( number &= mid[${array[row+1]:col:3}] ))
			(( number &= low[${array[row+2]:col:3}] ))
			(( number &= bot[${array[row+3]:col:3}] ))
			echo -n "$(log2 $number)"
		done
		(( row+4 < ${#array[@]} )) && echo -n "," # avoid ',' in last row
	done
	echo ""
}

main "$@"
