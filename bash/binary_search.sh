#!/usr/bin/env bash

# set -x

main(){
	[[ -z $2 ]] && { echo -1; return 0; }
	target=$1
	shift
	array=("$@")
	local -i i=0 j=${#array[@]}
	(( mid = (i+j) / 2 ))
	while (( i <= j )); do
		if (( array[mid] < target )); then
			(( i = mid + 1 ))
		elif (( array[mid] > target )); then
			(( j = mid - 1 ))
		else
			echo $mid; return 0
		fi
		(( mid = (i + j) / 2 ))
	done
	echo -1
	return 0
}

main "$@"
