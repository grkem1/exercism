#!/usr/bin/env bash

main(){
	[[ -n $2 ]] && echo "Usage: leap.sh <year>" && exit 1
	[[ -z $1 ]] && echo "Usage: leap.sh <year>" && exit 1
	[[ $1 =~ [[:alpha:]] ]] && echo "Usage: leap.sh <year>" && exit 1
	[[ $1 =~ "." ]] && echo "Usage: leap.sh <year>" && exit 1
	if (( $1 % 400 == 0 || $1 % 100 != 0 && $1 % 4 == 0 )); then
		echo "true"
	else
		echo "false"
	fi
}

main "$@"
