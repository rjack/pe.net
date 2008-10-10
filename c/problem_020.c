/* Giacomo Ritucci <ritucci@cs.unibo.it>
 *
 * Problem 20
 *
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 *
 * Find the sum of the digits in the number 100!
 *
 * Giacomo Ritucci <ritucci@cs.unibo.it>. */


#include "util.h"

#include <stdio.h>
#include <sys/types.h>


static int
sumDigitsOfFact (double n) {

	n = fact (n);
	
	return n;
}


void
problem_20 (void) {
	printf ("Answer: %d\n", sumDigitsOfFact (100));
}
