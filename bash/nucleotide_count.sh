#!/usr/bin/env bash

main() {
	true
	declare -A count
	count=(["A"]=0 ["C"]=0 ["G"]=0 ["T"]=0)
	for ((i = 0; i < ${#1}; i++)); do
		[[ -z ${count[${1:$i:1}]} ]] && echo "Invalid nucleotide in strand" && exit 1
		letter=${1:$i:1}
		(( count[$letter] += 1 ))
	done
	for i in A C G T; do
		echo "$i: ${count[$i]}"
	done
}

main "$@"
