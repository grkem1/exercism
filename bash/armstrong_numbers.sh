#!/usr/bin/env bash


main () {
  ((i=$1))
  ((j=0))
  ((result=0))
    while (( i > 0 ))
    do
        i=$((i/10))
        j=$((j+1))
    done
#   echo "j is $j"
    i=$1
    while (( i > 0 ))
    do
        d=$((i%10))
#       echo "d is $d"
        i=$((i/10))
        result=$((result+d**j))
    done
#   echo $result
    [[ $result -eq $1 ]] && final="true" || final="false"
    echo "$final"
}
main "$@"
