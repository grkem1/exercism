#!/usr/bin/env bash

# Due to overflow, we can either use bc or define
# a new function to workaround the limitation.
pow_mod(){
	pow=$2
	base=$1
	result=$1
	while (( pow > 1 )); do
		(( result *= base ))
		(( result %= $3 ))
		(( pow-- ))
	done
	echo "$result"
}

main(){
	case $1 in
		privateKey)
			echo $((RANDOM % ($2-2) + 2 ))
			;;
		publicKey)
			pow_mod "$3" "$4" "$2"
			;;
		# positional parameters are given such that
		# publicKey and secret run the same operation
		secret)
			pow_mod "$3" "$4" "$2"
			;;
		*)
			echo "Wrong input!"
	esac
}

main "$@"
