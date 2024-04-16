#!/usr/bin/env bash

main(){
	[[ -n $5 ]] && { echo "invalid arguments"; return 1; }
	[[ -z $2 ]] && { echo "invalid arguments"; return 1; }
	[[ -n $3 ]] && [[ -z $4 ]] && { echo "invalid arguments"; return 1; }
	input=$*
	input=${input//[[:space:]]/}
	regex="^[0-9+-]*$"
	[[ ${input} =~ $regex ]] || { echo "invalid arguments"; return 1; }
	(( m = $1 * 60 + $2 ))
	[[ $3 == "+" ]] && (( m += $4 ))
	[[ $3 == "-" ]] && (( m -= $4 ))
	(( m = ( m%(60*24) + 60*24 ) % (60*24) ))
	(( h = m / 60 ))
	(( m = m % 60 ))
	printf "%02d:%02d\n" $h $m
}

main "$@"
