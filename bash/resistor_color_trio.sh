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
	(( result = result*10**exp ))
	(( zero_count=0 ))
	for (( i=0 ; i < ${#result}; i++ )); do
		if (( ${result:$i:1} == 0 )); then
			(( zero_count+=1 ))
		fi
	done
	result=${result%%0*}
	scale=( "" "kilo" "mega" "giga" )
	((zeroes = zero_count%3 ))
	zero_str="000"
	zeroes=${zero_str:0:$zeroes}
	result+="${zeroes} ${scale[((zero_count/3))]}ohms"

	echo "$result"
}

main "$@"
