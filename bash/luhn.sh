#!/usr/bin/env bash

main(){
	input=$(echo "$@" | tr -d " ")
	if (( ${#input} < 2 )); then
		echo false
		return
	fi
	(( offset = (${#input})%2 ))
	total=0
	for (( i=0; i < ${#input}; i++ )); do
		if [[ ! ${input:$i:1} =~ [0-9] ]]; then
			echo false
			return
		fi
		if (( i % 2 == offset )); then
			(( number = ${input:$i:1} ))
			(( number *= 2 ))
			(( number > 9 )) && (( number -= 9 ))
			(( total += number ))
		else
			(( total += ${input:$i:1} ))
		fi
	done
	(( total % 10 == 0 )) && echo "true" || echo "false"
}

main "$@"
