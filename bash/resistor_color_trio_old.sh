#!/usr/bin/env bash

main(){
	declare -A code=( [black]=0 [brown]=1 [red]=2 [orange]=3 [yellow]=4 [green]=5 [blue]=6 [violet]=7 [grey]=8 [white]=9  )
	c1=${code[$1]}
	c2=${code[$2]}
	exp=${code[$3]}
	if [[ $c1 == "" ]] || [[ $c2 == "" ]] || [[ $exp == "" ]] ; then
		echo "invalid color" && exit 1
	fi
	(( result = 10*c1+c2 ))
	if (( c2 == 0 )); then
		(( result /= 10 ))
		(( exp += 1 ))
	fi
	if (( exp == 9 )); then
		result+=" gigaohms"
	elif (( exp >= 6 )); then
		(( exp -= 6 ))
		for (( i=0; i<exp; i++ )); do
			result+=0
		done
		result+=" megaohms"
	elif (( exp >= 3 )); then
		(( exp -= 3 ))
		for (( i=0; i<exp; i++ )); do
			result+=0
		done
		result+=" kiloohms"
	else
		for (( i=0; i<exp; i++ )); do
			result+=0
		done
		result+=" ohms"
	fi

	echo "$result"
}

main "$@"
