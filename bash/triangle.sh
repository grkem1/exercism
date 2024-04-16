#!/usr/bin/env bash

main() {
	(( $(echo "$2 <= 0" | bc) || $(echo "$3 <= 0" | bc) || $(echo "$4 <= 0" | bc) )) && { echo "false"; exit; }
	(( $( echo "$2 + $3 > $4" | bc ) )) || { echo "false"; exit; }
	(( $( echo "$3 + $4 > $2" | bc ) )) || { echo "false"; exit; }
	(( $( echo "$2 + $4 > $3" | bc ) )) || { echo "false"; exit; }
	case $1 in
		"scalene")
			[[ $2 == "$3" || $3 == "$4" || $2 == "$4" ]] && { echo "false"; exit; }
			;;

		"equilateral")
			[[ $2 == "$3" && $2 == "$4" && $3 == "$4" ]] || { echo "false"; exit; }
			;;

		"isosceles")
			[[ $2 == "$3" || $2 == "$4" || $3 == "$4" ]] || { echo "false"; exit; }
			;;

	esac
	echo "true"
}

main "$@"
