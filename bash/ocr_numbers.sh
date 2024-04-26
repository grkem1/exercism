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
	if (( ${#array[@]} % 4 )); then
		echo Number of input lines is not a multiple of four
		exit 1
	fi
	for row in "${array[@]}"; do
		if (( ${#row} % 3 )); then
			echo Number of input columns is not a multiple of three
			exit 1
		fi
	done
	# Define bitmasks for rows of 4x3 grid to be tested. Each bitmask filters
	# the possible numeric values for the number to have after the respective
	# row is considered. Once all 4 bitmasks are applied, the final result holds
	# either
	# a) 2**number, that corresponds to the number that satisfies all rows of OC
	# or
	# b) 0, no such number exists that satisfies all the rows (invalid character)
	declare -A top=(["   "]=18   [" _ "]=1005)                                    # sanity check: 18 + 1005 = 1023
	declare -A mid=(["| |"]=1    [" _|"]=12   ["  |"]=130 ["|_|"]=784 ["|_ "]=96) # sanity check:     total = 1023
	declare -A low=(["|_|"]=321  ["  |"]=146  ["|_ "]=4   [" _|"]=552)            # sanity check:     total = 1023
	declare -A bot=(["   "]=1023)                                                 # valid chars have blank bottom row
	out=""
	for (( row = 0; row < ${#array[@]}; row+=4 )); do
		for (( col = 0; col < ${#array[$row]}; col+= 3));do
			(( number = 1023
		            & top[${array[row+0]:col:3}]
			          & mid[${array[row+1]:col:3}]
		            & low[${array[row+2]:col:3}]
		            & bot[${array[row+3]:col:3}] ))
			out+=$(log2 $number)
		done
		out+=,
	done
	echo ${out%,}
}

main "$@"
