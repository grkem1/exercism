#!/usr/bin/env bash

main(){
	declare -a numbers
	for (( i = 0; i <= $1; i++ )); do
		numbers+=(1)
	done
	numbers[0]=0
	numbers[1]=0
	for (( i = 2; i < $1; i++ )); do
		if (( numbers[i] == 1 )); then
			(( n = i ))
			(( multiplier = 2 ))
			while (( n*multiplier <= $1 )); do
				(( numbers[n*multiplier] = 0 ))
				(( multiplier+=1 ))
			done
		fi
	done
	declare -a result
	for (( i=2; i <= $1; i++ )); do
		if (( numbers[i]==1 )); then
			result+=("$i")
		fi
	done
	echo "${result[@]}"
}

main "$@"
