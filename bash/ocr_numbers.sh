#!/usr/bin/env bash

: '       _   _       _   _   _   _   _   _  '
: '    |  _|  _| |_| |_  |_    | |_| |_| | | ' decimal numbers.
: '    | |_   _|   |  _| |_|   | |_|  _| |_| '
: '                                          ' fourth row is always blank
 
fail() {
	echo "$@" >&2
	exit 1
}
# return the corresponding value in {0..9} given the bitmask
# return "?" if the bitmask does not correspond to a number
value() {
	input=$1
	for (( output = 0; input > 1; ++output )); do
		(( input /= 2 ))
	done
	# shellcheck disable=SC2125
	(( input == 0 )) && output=?
	echo "$output"
}
main() {
	mapfile -t rows
	(( ${#rows[@]} % 4 ))  && fail Number of input lines is not a multiple of four
	for row in "${rows[@]}"; do
		(( ${#row} % 3 ))    && fail Number of input columns is not a multiple of three
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
	out=
	for (( row = 0; row < ${#rows[@]}; row += 4 )); do
		for (( col = 0; col < ${#rows[$row]}; col += 3));do
			(( bitmask = 1023
				& top[${rows[row+0]:col:3}]
				& mid[${rows[row+1]:col:3}]
				& low[${rows[row+2]:col:3}]
				& bot[${rows[row+3]:col:3}] ))
			out+=$(value $bitmask)
		done
		out+=,
	done
	# shellcheck disable=SC2086
	echo ${out%,}
}

main "$@"
