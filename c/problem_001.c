/* Giacomo Ritucci <ritucci@cs.unibo.it>
 *
 * Problem 1 - http://projecteuler.net/
 *
 * Add all the natural numbers below 1000 that are multiples of 3 or 5.
 *
 * If we list all the natural numbers below 10 that are multiples of 3 or 5,
 * we get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 *
 * Giacomo Ritucci <ritucci@cs.unibo.it>. */


#include <stdio.h>


static int
sumMultiplesOf (const int a, const int b, const int max) {

	int i;
	int lcm = a * b;
	int sum = 0;

	for (i = a; i < max; i += a) {
		sum += i;
	}

	for (i = b; i < max; i += b) {
		sum += i;
	}

	for (i = lcm; i < max; i += lcm) {
		sum -= i;
	}

	return sum;
}


void
problem_1 (void) {
	printf ("Answer: %d\n", sumMultiplesOf (3, 5, 1000));
}
