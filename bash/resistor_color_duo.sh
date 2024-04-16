#!/usr/bin/env bash

main(){
	declare -A code=( [black]=0 [brown]=1 [red]=2 [orange]=3 [yellow]=4 [green]=5 [blue]=6 [violet]=7 [grey]=8 [white]=9  )
	c1=${code[$1]}
	c2=${code[$2]}
	if [[ $c1 == "" ]] || [[ $c2 == "" ]]; then
		echo "invalid color" && exit 1
	fi
	declare -i result
	(( result = 10*$c1+$c2 ))
	echo $result
}

main "$@"
