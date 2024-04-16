#!/usr/bin/env bash

main() {
	((rot = $2))
	letters=({a..z})
	capital=({A..Z})
	declare -A mapping
	for ((i = 0; i < 26; i++)); do
		((index = (i + rot) % 26))
		mapping["${letters[$i]}"]=${letters[$index]}
		mapping["${capital[$i]}"]=${capital[$index]}
	done
	for ((j = 0; j < ${#1}; j++)); do
		l=${1:$j:1}
		l=${mapping[$l]:-$l}
		echo -n "$l"
	done
	echo ""
}

main "$@"
