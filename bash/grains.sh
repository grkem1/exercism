#!/usr/bin/env bash

main(){
	[[ $1 != 0 ]] && [[ $1 -eq "total" ]] && echo "2 ^ 64 - 1" | bc && exit 0
	if (( $1 < 1 || $1 > 64 )); then
		echo "Error: invalid input"
		exit 1
	fi
# dc -e "2 $1 ^ p"
	echo "2 ^ (($1-1))" | bc
	
# python3 -c 'import sys; print(2**int(sys.argv[1]))' $1
# python3 - $1 <<- EOF
#	 import sys
#	 print(2**int(sys.argv[1]))
#EOF
# echo $(( 2 ** $1 )) doesn't work, bash can't handle large numbers
}

main "$@"
