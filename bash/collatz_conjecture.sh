#!/usr/bin/env bash

main(){
	input=$1
	(( input < 1 )) && { echo "Error: Only positive numbers are allowed"; exit 1; }
	for (( i = 0; input != 1 ; i++ )); do
		(( input = input % 2 ? 3*input+1 : input/2 ))
	done
	echo $i
}

main "$@"
