#!/bin/bash
#
# Giacomo Ritucci <ritucci@cs.unibo.it>

cat << END_DESCR
Problem 19

You are given the following information, but you may prefer to do some
research for yourself.
- 1 Jan 1900 was a Monday.
- Thirty days has September,
- April, June and November.
- All the rest have thirty-one,
- Saving February alone,
- Which has twenty-eight, rain or shine.
- And on leap years, twenty-nine.
- A leap year occurs on any year evenly divisible by 4, but not on a century
  unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century
(1 Jan 1901 to 31 Dec 2000)?

END_DESCR


# ncal label for "Sunday" in your locale (Su, do, ...)
sunday=$(ncal | sed -n '$s/[ 0-9]//gp')

echo -n "Answer: "

# output all the years from 1901 to 2000...
for i in $(seq 1901 2000) ; do
       	ncal $i
done |
	# select only sundays...
	grep "^$sunday" |
	# verticalize output...
       	tr -s [:space:] '\n' |
	# count ones.
       	grep -c '^1$'
