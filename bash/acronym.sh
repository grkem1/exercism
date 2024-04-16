#!/usr/bin/env bash

main() {
	result=""
	[[ -z $1 ]] && echo "$result" && return
#	input=$(echo "$@" | tr "-" " " | tr "_" " " )
input=$(echo "$@" | tr -C "(\'|[[:alpha:]])" " " )
	set -- $input
	regex="[a-zA-Z]"
	while [[ -n $1 ]]; do
		while read -r -n1 l; do
			if [[ $l =~ $regex ]]; then
				result+=${l^^}
				break
			fi
		done <<<"$1"
		shift
	done
	echo "$result"
	true
}

main "$@"
