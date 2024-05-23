#!/usr/bin/env bash
 
# set -x
fail() {
	echo "$1"
	exit 1
}

main() {
	x=$1
	y=$2
	direction=$3
	instructions=$4
	# default position
	[[ -z $3 ]] && { x=0; y=0; direction="north"; }
	directions=( "south" "west" "north" "east" )
	for (( i = 0; i < ${#directions[@]}; i++ )); do
		if [[ ${directions[$i]} == "$direction" ]]; then
			found=yes
			direction=$i
			break
		fi
	done
	[[ -z "$found" ]] && fail "invalid direction"
	for l in $(echo "$instructions" | grep -o .); do
		case $l in
			R)
				(( direction = (direction + 1) % 4 ))
				;;
			L)
				(( direction = (direction + 3) % 4 ))
				;;
			A)
				case $direction in
					0)
						(( y-= 1 ))
						;;
					1)
						(( x-= 1 ))
						;;
					2)
						(( y+= 1 ))
						;;
					3)
						(( x+= 1 ))
						;;
				esac
				;;
			*)
				fail "invalid instruction"
				;;
		esac
	done
	echo "$x $y ${directions[$direction]}"
}

main "$@"

