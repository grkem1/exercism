#!/usr/bin/env bash

main() {
	input=$1
	[[ $input =~ ^[ACGT]*$ ]] || { echo "Invalid nucleotide detected." ; exit 1; }
	for N in $(echo "$input" | grep -o .); do
		case "$N" in
			A)
				echo -n "U"
				;;
			C)
				echo -n "G"
				;;
			G)
				echo -n "C"
				;;
			T)
				echo -n "A"
				;;
		esac
	done
	echo ""
}

main "$@"
