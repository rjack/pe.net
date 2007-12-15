#!/bin/bash
#
# Giacomo Ritucci <ritucci@cs.unibo.it>

cat << END_DESCR
Problem 1

If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

END_DESCR

# List all of the multiples:
# -e allows echo to recognize seq's newlines
# seq upper limit is included, so to get numbers below 1000 we must use 999
echo -e "$(seq 3 3 999)\n$(seq 5 5 999)" |

	# Eliminiate duplicates
	sort -nu |
	
	# Sum each line and print result at the end.
	awk '{sum = sum + $0} ; END { print "Answer: " sum }'
