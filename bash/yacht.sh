#!/usr/bin/env bash
number_s(){
	number=$1
	shift
	count=0
	while [[ -n $1 ]]; do
		(( number == $1 )) && (( count++ ))
		shift
	done
	echo $(( number * count ))
}

ones(){
	number_s 1 "$@"
}

twos(){
	number_s 2 "$@"
}

threes(){
	number_s 3 "$@"
}

fours(){
	number_s 4 "$@"
}

fives(){
	number_s 5 "$@"
}

sixes(){
	number_s 6 "$@"
}

full_house(){
	total=$(choice "$@")
	declare -a roll
	while [[ -n $1 ]]; do
		(( roll[$1]++ ))
		shift
	done
	if [[ "${roll[*]}" == *2*3* ]] || [[ "${roll[*]}" == *3*2* ]]; then
		echo "$total"
		return
	fi
	echo 0
	return
}

four_of_a_kind(){
	declare -a roll
	while [[ -n $1 ]]; do
		(( roll[$1]++ ))
		shift
	done
	for die in "${!roll[@]}"; do
		if (( ${roll[$die]} >= 4 )); then
			echo $(( 4 * die ))
			return
		fi
	done
	echo 0
	return
}

little_straight(){
	declare -a roll
	roll[0]=0
	roll[6]=0
	while [[ -n $1 ]]; do
		(( roll[$1]++ ))
		shift
	done
	if [[ ${roll[*]} == "0 1 1 1 1 1 0" ]]; then
		echo 30
	else
		echo 0
	fi
}

big_straight(){
	declare -a roll
	roll[0]=0
	roll[1]=0
	while [[ -n $1 ]]; do
		(( roll[$1]++ ))
		shift
	done
	if [[ ${roll[*]} == "0 0 1 1 1 1 1" ]]; then
		echo 30
	else
		echo 0
	fi
}

choice(){
	total=0
	while [[ -n $1 ]]; do
		(( total+=$1 ))
		shift
	done
	echo $total
}

yacht(){
	number=$1
	shift
	while [[ -n $1 ]]; do
		(( number != $1 )) && { echo 0; return; }
		shift
	done
	echo 50
	return
}

main(){
	fn=$(echo "$1" | tr ' ' '_' )
	shift
	$fn "$@"
}

main "$@"
