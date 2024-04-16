#!/usr/bin/env bash

main(){
	declare -A actions=( [w]="wink" [d]="double blink" [c]="close your eyes" [j]="jump" )
	result=""
	(( $1 & 1 ))  && result+="w"
	(( $1 & 2 ))  && result+="d"
	(( $1 & 4 ))  && result+="c"
	(( $1 & 8 ))  && result+="j"
	(( $1 & 16 )) && result=$(echo $result | rev)
	for (( i=0; i < ${#result}; i++ )); do
		echo -n "${actions[${result:$i:1}]}"
		(( i < ${#result}-1 )) && echo -n ","
	done
	echo
}

main "$@"
