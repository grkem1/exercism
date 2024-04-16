#!/usr/bin/env bash

declare -A map
map=([AUG]=Methionine
	[UUU]=Phenylalanine [UUC]=Phenylalanine 
	[UUA]=Leucine [UUG]=Leucine 
	[UCU]=Serine [UCC]=Serine [UCA]=Serine [UCG]=Serine
	[UAU]=Tyrosine [UAC]=Tyrosine
	[UGU]=Cysteine [UGC]=Cysteine
	[UGG]=Tryptophan
	[UAA]=STOP [UAG]=STOP [UGA]=STOP
)

main() {
	rna=$1
	result=""
	for (( i=0; i < ${#rna}; i+=3 )); do
		codon=${rna:$i:3}
		protein=${map[$codon]}
		[[ -z ${protein} ]] && { echo "Invalid codon"; exit 1; }
		[[ ${protein} == "STOP" ]] && break;
		result+=${protein}" "
	done
	echo "${result% }"
}

main "$@"
