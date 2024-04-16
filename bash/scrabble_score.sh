#!/usr/bin/env bash

main(){
	declare -A values
	for i in {a..z}; do
		values[$i]=1
	done
	for i in d g; do values[$i]=2; done
	for i in b c m p; do values[$i]=3; done
	for i in f h v w y; do values[$i]=4; done
	for i in k; do values[$i]=5; done
	for i in j x; do values[$i]=8; done
	for i in q z; do values[$i]=10; done
	input=${1,,}
	declare -i score=0
	for (( i=0; i<${#input}; i++ )); do
		letter=${input:$i:1}
		(( score+=${values[$letter]} ))
	done
	echo $score
	true;
}

main "$@"
