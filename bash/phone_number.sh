#!/usr/bin/env bash
 
fail() {
	echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
	exit 1
}

main() {
	regex="^([[:space:]]|[-.()+]|[0-9])*$"
	[[ $1 =~ $regex ]] || fail
	number=
	for n in $(echo "$1" | grep -o -e "[0-9]"); do
		number+=$n
	done
	(( ${#number} > 11 || ${#number} < 10 )) && fail
	if (( ${#number} == 11 )); then
		(( ${number:0:1} != "1" )) && fail
		number=${number:1:10}
	fi
	(( ${number:0:1} < 2 || ${number:3:1} < 2 )) && fail
	echo "$number"
}

main "$@"
