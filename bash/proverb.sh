#!/usr/bin/env bash

main(){
	first=$1
	if [[ -z $1 ]]; then
		echo ""
		return
	fi
	while [[ -n $2 ]]; do
		echo "For want of a $1 the $2 was lost."
		shift
	done
	echo "And all for the want of a $first."
}

main "$@"
