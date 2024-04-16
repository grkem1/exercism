#!/usr/bin/env bash

main() {
	small_letter=${*,,}
	seen=""
	while read -r -n1 l; do
		[[ $l =~ [[:alpha:]] ]] || continue
		[[ $seen =~ $l ]] || seen+=$l
		((${#seen} == 26)) && break
	done <<<"$small_letter"
	echo "$seen"
	((${#seen} == 26)) && echo "true" || echo "false"
}

main "$@"
