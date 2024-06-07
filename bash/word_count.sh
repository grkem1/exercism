#!/usr/bin/env bash

# set -x
declare -A counter

main(){
	for i in $(echo -e "${1,,}" | grep -oE "[[:alnum:]]+('?[[:alnum:]]+)?"); do
		(( counter["${i/\'/_}"]++ ))
	done
	for word in "${!counter[@]}"; do
		echo "${word/_/"'"}: ${counter[$word]}"
	done

}

main "$@"
