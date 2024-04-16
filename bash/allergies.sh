#!/usr/bin/env bash

main() {
	declare -a allergies=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
	result=""
	(( power=1 ))
	for allergy in "${allergies[@]}"; do
		if (($1 & power)); then
			result+="${allergy} "
			if [[ $2 != "list" && $3 == "$allergy" ]]; then
				echo "true" && exit;
			fi
		fi
		(( power *= 2 ))
	done
	if [[ $2 != "list" ]]; then
		echo "false" && exit;
	fi
	echo "${result% }"
}

main "$@"
