#!/usr/bin/env bash

dist_2(){
	result=$(echo "$1*$1 + $2*$2" | bc) 
	echo "$result"
}

main(){
	if [[ -z "$1"	|| -z "$2" || $1 =~ [[:alpha:]] || $2 =~ [[:alpha:]] ]] ; then
		echo "# there is _some_ output"
		exit 1
	fi
	d=$(dist_2 "$1" "$2")
	declare -i score=0
	if   (( $(echo "$d<=1"   | bc) )); then ((score+=10)); 
	elif (( $(echo "$d<=25"  | bc) )); then ((score+=5));
	elif (( $(echo "$d<=100" | bc) )); then ((score+=1)); fi
	echo $score
}

main "$@"
