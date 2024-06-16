#!/usr/bin/env bash

fail(){
	echo "$1"
	exit 1
}

main(){
	str=$1
	substr_len=$2
	[[ -z $1 ]]                && fail "series cannot be empty"
	(( substr_len < 0 ))       && fail "slice length cannot be negative"
	(( substr_len == 0 ))      && fail "slice length cannot be zero"
	(( substr_len > ${#str} )) && fail "slice length cannot be greater than series length"
	echo -n "${str:0:$substr_len}"
	for ((i=1; i <= ${#str} - substr_len; i++)); do
		echo -n " ${str:$i:$substr_len}"
	done
	echo
}

main "$@"
