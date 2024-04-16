#!/bin/bash

echo "Hi, $USER"
echo "I'll print the logged in users"
echo
set -x
w
set +x
echo
echo "I'm setting two variables now."
COLOUR="black"					# set a local shell variable
VALUE="9"					# set a local shell variable
echo "This is a string: $COLOUR"		# display content of variable
echo "And this is a number: $VALUE"		# display content of variable
echo

