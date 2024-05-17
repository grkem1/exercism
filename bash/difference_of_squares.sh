#!/usr/bin/env bash
 
square_of_sum() {
	echo $(( ( $1 * ($1+1) / 2 ) ** 2 ))
}
sum_of_squares() {
	echo $(( $1 * ($1+1) * (2*$1+1) / 6 ))
}

main() {
	case $1 in
		"square_of_sum")
			square_of_sum "$2"
			;;
		"sum_of_squares")
			sum_of_squares "$2"
			;;
		*)
			echo $(( $(square_of_sum "$2") - $(sum_of_squares "$2") ))
			;;
	esac
}

main "$@"
