#!/usr/bin/env bash
 
# set -x
fail() {
	echo $1
	exit 1
}

pass() {
	echo "true"
	exit 0
}

main() {
	declare -a white=(${2%,*} ${2##*,})
	declare -a black=(${4%,*} ${4##*,})
	(( white[0] < 0 || black[0] < 0 )) && fail "row not positive"
	(( white[0] > 7 || black[0] > 7 )) && fail "row not on board"
	(( white[1] < 0 || black[1] < 0 )) && fail "column not positive"
	(( white[1] > 7 || black[1] > 7 )) && fail "column not on board"
	(( white[0] == black[0] && white[1] == black[1] )) && fail "same position"
	(( white[0] == black[0] || white[1] == black[1] )) && pass
	(( black[1] == white[1] + (black[0]-white[0]) || black[1] == white[1] - (black[0]-white[0]) )) && pass
	echo "false"
}

main "$@"

