#!/usr/bin/env bash

main(){
	declare yell
	declare question
	formatted=$(echo "$*" | sed 's/[ \n\t\r]*$//g')
	caps=${formatted^^}
	[[ $* == "$caps" ]] && [[ $* =~ [[:alpha:]] ]] && yell=1 || yell=0
	[[ ${caps%\?} != $caps ]] && question=1 || question=0
	[[ -z $formatted ]] && echo "Fine. Be that way!" && return 0
	result="$yell$question"
	case $result in
		"00") echo "Whatever." ;;
		"01") echo "Sure." ;;
		"10") echo "Whoa, chill out!" ;;
		"11") echo "Calm down, I know what I'm doing!" ;;
	esac
}

main "$@"
