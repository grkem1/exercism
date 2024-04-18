#!/usr/bin/env bash

die(){
	case $1 in
		0)
			echo "Negative roll is invalid"
			;;
		1)
			echo "Pin count exceeds pins on the lane"
			;;
		2)
			echo "Score cannot be taken until the end of the game"
			;;
		3)
			echo "Cannot roll after game is over"
			;;
	esac
	exit 1

}
main(){
	# echo "$@"
	(( score = 0 ))
	(( frame = 1 ))
	(( frame_pins = 0 ))
	(( new_frame = 1 ))
	while (( frame <= 10 )); do
		if [[ -z $1 ]]; then die 2; fi
		if (( $1 < 0 )); then die 0 ; fi
		(( score += $1 ))
		if (( new_frame )); then
			(( frame_pins = $1 ))
		else
			(( frame_pins += $1 ))
		fi
		if (( frame_pins > 10 )); then die 1 ; fi
		if (( frame_pins == 10 )); then
			if (( new_frame )); then
				if [[ -n $2 && $2 -gt 10 ]]; then die 1; fi
				if [[ -n $3 ]]; then
					if (( $3 > 10 )) || (( $2 < 10 )) && (( $2 + $3 > 10 )); then
						die 1;
					fi
				fi
				if [[ -z $3 ]]; then die 2; fi
				(( score += ($2 + $3) ))
				if [[ $frame -eq 10 ]]; then
					shift
					shift
				fi
			else
				if [[ -z $2 ]]; then
					die 2
				fi
				(( score += $2 ))
				if [[ $frame -eq 10 ]]; then
					shift
				fi
			fi
			(( new_frame = 1 ))
			(( frame_pins = 0 ))
			(( frame += 1 ))
		else
			(( new_frame = 1-new_frame ))
			if (( new_frame == 1 )) ; then
				(( frame_pins = 0 ))
				(( frame += 1 ))
			fi
		fi
		shift
		if [[ $frame -eq 11 ]]; then break; fi
	done
	if [[ -n $1 ]]; then die 3; fi
	echo "$score"
}

main "$@"
