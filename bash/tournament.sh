#!/usr/bin/env bash

main(){
	declare -A results
	while read -r input; do
		case $(cut -d ";" -f 3 <<< "$input") in
			"win")
				winner=$(cut -d ";" -f 1 <<< "$input")
				loser=$(cut -d ";" -f 2 <<< "$input")
				;;
			"loss")
				winner=$(cut -d ";" -f 2 <<< "$input")
				loser=$(cut -d ";" -f 1 <<< "$input")
				;;
			"draw")
				t1=$(cut -d ";" -f 1 <<< "$input")
				t2=$(cut -d ";" -f 2 <<< "$input")
				for key in "${t1}"_d "${t2}"_d "${t1}"_p "${t2}"_p "${t1}"_mp "${t2}"_mp; do
					(( results[$key]+=1 ))
				done
				continue
				;;
			*)
				break
				;;
		esac
		for key in "${winner}"_w "$loser"_l "${winner}"_mp "$loser"_mp; do
			(( results[$key]+=1 ))
		done
		(( results["${winner}"_p] += 3 ))
	done
	final_results=$(
		for r in "${!results[@]}"; do
			if [[ ${r:${#r}-2:2} == "mp" ]]; then
				team=${r%_*}
				mp=${results["$team"_mp]}
				w=${results["$team"_w]:-0}
				d=${results["$team"_d]:-0}
				l=${results["$team"_l]:-0}
				p=${results["$team"_p]:-0}
				printf "%-30s | %2s | %2s | %2s | %2s | %2s\n" "$team" "$mp" "$w" "$d" "$l" "$p"
			fi
		done
	)
	# header
	printf "%-30s | %2s | %2s | %2s | %2s | %2s\n" "Team" "MP" "W" "D" "L" "P"
	# table
	if [[ -n $final_results ]]; then
		sort -k 6rn -t "|" -k 1 <<< "$final_results"
	fi
}

main "$@"
