#!/usr/bin/env bash

main(){
	letters=({a..z})
	input=${*:2}
	input=${input// /}
	output=""
	number="[0-9]"
	for l in $(echo "$input" | grep -o .); do
		l=${l,}
		[[ $l =~ [[:alnum:]] ]] || continue
		if [[ $1 == "encode" ]] && (( ( ${#output}+1 ) % 6 == 0 )); then
			output+=" "
		fi
		[[ $l =~ $number ]] && output+=$l && continue
		for (( i=0; i < 26; i++ )); do
			if [[ ${letters[i]} == "$l" ]]; then
				output+=${letters[25-$i]}
				break
			fi
		done
	done
	echo "$output"
}

main "$@"
