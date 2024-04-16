#!/usr/bin/env bash

main() {
	declare -a stack
	close="[]})]"
	open="[[{(]"
	non_a_close="[]}]"
	non_b_close="[)}]"
	non_c_close="[])]"
	for l in $(echo "$1" | grep -o .); do
		if [[ $l =~ $open ]]; then
			stack+=("$l")
		elif [[ $l =~ $close ]]; then
			if [[ -z ${stack[*]} ]]; then
				echo "false"
				return
			fi
			last=${stack[-1]}
			unset "stack[-1]"
			if [[ $last == "{" && $l =~ $non_c_close || $last == "[" && $l =~ $non_b_close || $last == "(" && $l =~ $non_a_close ]]; then
				echo "false"
				return
			fi
		fi
	done
	# echo ${stack[*]}
	if [[ -n ${stack[*]} ]]; then
		echo "false"
		return
	fi
	echo true
}

main "$@"
