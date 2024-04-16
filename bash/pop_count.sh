#!/usr/bin/env bash

main() {
	number=$1
	((count = 0))
	while ((number > 0)); do
		((number = number & (number - 1)))
		((count += 1))
	done
	echo "$count"
}

main "$@"
