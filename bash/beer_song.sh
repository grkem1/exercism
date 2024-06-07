#!/usr/bin/env bash

fail() {
	echo "$1"
	exit 1
}

verse() {
	if (( $1 > 2 )); then
		echo "$1 bottles of beer on the wall, $1 bottles of beer."
		echo "Take one down and pass it around, $(($1-1)) bottles of beer on the wall."
	elif (( $1 == 2 )); then
		echo "$1 bottles of beer on the wall, $1 bottles of beer."
		echo "Take one down and pass it around, $(($1-1)) bottle of beer on the wall."
	elif (( $1 == 1 )); then
		echo "1 bottle of beer on the wall, 1 bottle of beer."
		echo "Take it down and pass it around, no more bottles of beer on the wall."
	else
		echo "No more bottles of beer on the wall, no more bottles of beer."
		echo "Go to the store and buy some more, 99 bottles of beer on the wall."
	fi
}

main() {
	[[ -n $3 || -z $1 ]]     && fail "1 or 2 arguments expected"
	[[ -n $2 && $1 -lt $2 ]] && fail "Start must be greater than End"
	for i in $(seq "$1" -1 "${2:-$1}"); do
		verse "$i"
		echo
	done
}

main "$@"
