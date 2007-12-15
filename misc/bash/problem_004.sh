#!/bin/bash
#
# Giacomo Ritucci <ritucci@cs.unibo.it>

cat << END_DESCR
Problem 4

A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

END_DESCR

max=999
min=900
answer=

while [[ -z $answer ]] ; do
	answer=$(
		seq $max -1 $min |
			awk '{ i = '$max' ; while (i > '$min') { print $0 * i ; i-- } }' |
			grep '\(.\)\(.\)\(.\)\3\2\1' |
			sort -nr |
			head -n1
		)
	max=$min
	min=$(($min - 100))
done

echo Answer: $answer
