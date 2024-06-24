#!/usr/bin/env bash

fail(){
	echo "$@"
	exit 1
}

main(){
	declare -A convert=( Mercury 0.2408467 Venus 0.61519726 Earth 1.0 Mars 1.8808158 Jupiter 11.862615 Saturn 29.447498 Uranus 84.016846 Neptune 164.79132 )
	if [[ ${convert[$1]} ]]; then
		printf %.2f "$(echo "scale=3; $2 / 31557600 / ${convert[$1]}" | bc)"
		# python3 -c "print( $2 / 31557600 / ${convert[$1]} )"
	else
		fail $1 "is not a planet"
	fi
}

main "$@"
