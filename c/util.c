/* util.c - reinventing the wheel since 1982.
 *
 * Giacomo Ritucci <ritucci@cs.unibo.it> */

#include <assert.h>
#include <stdlib.h>


int
countDigits (double n) {
	int i = 0;

	do {
		i++;
		n = n / 10;
	} while (n > 1);

	return i;
}


double
fact (double n) {
	/* Return n! */
	
	double f = 1;
	while (n >= 1) {
		f *= n;
		n--;
	}
	return f;
}


void *
xmalloc (size_t n, size_t size) {
	void *m = malloc (n * size);
	assert (m != NULL);
	return m;
}
