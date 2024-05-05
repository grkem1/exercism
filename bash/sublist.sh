#!/usr/bin/env bash

main(){
	a=${1:1:${#1}-2}
	b=${2:1:${#2}-2}
	[[ "$a" == "$b" ]]   && { echo equal    ; exit 0; }
	a=${a:-\*}
	b=${b:-\*}
	regex="(,|^| )$a($| |,)"
	[[ "$b" =~ $regex ]] && { echo sublist  ; exit 0; }
	regex="(,|^| )$b($| |,)"
	[[ "$a" =~ $regex ]] && { echo superlist; exit 0; }
	echo unequal
}

main "$@"
