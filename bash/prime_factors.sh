#!/usr/bin/env bash

main() {
	number=$1
	factor=2
	result=""
	while(( number > 1 )); do
		if (( number % factor == 0 )); then
			(( number = number / factor ))
			result+=${factor}" "
		else
			(( factor += 1 ))
		fi
	done
	echo "${result% }"
}

main "$@"
