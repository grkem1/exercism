#!/usr/bin/env bash

main() {
	(( $1 == 0 )) && exit
	OIFS=$IFS
	IFS=""
	((len = 2 * $1 - 1))
	line=()
	for ((i = 0; i < len; i++)); do
		line[i]="0"
	done
	((line[$1 - 1] = 1))
	line_new=("${line[@]}")
	for ((i = 0; i < $1; i++)); do
		for (( j = 0; j < $1+i; j++ )); do
			el=${line[j]}
			(( el == 0 )) && el=" "
			echo -n "$el"
		done
		echo ""
		((line_new[0] = line[1]))
		((line_new[len-1] = line[len-2]))
		for ((j = 1; j < len - 1; j++)); do
			((line_new[j] = line[j - 1] + line[j + 1]))
		done
		line=("${line_new[@]}")
	done
	IFS=$OIFS
}

main "$@"
