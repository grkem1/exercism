#!/usr/bin/env bash
 
main() {
	declare -A letters
	for l in $(echo "$1" | grep -o -e "[[:alpha:]]"); do
		l=${l,,}
		if (( ++letters[$l] > 1 )); then { echo false; return 0; } ; fi
	done
	echo "true"
}

main "$@"
