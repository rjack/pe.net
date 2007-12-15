/* util.h - reinventing the wheel since 1982.
 *
 * Giacomo Ritucci <ritucci@cs.unibo.it> */

#ifndef UTIL_H
#define UTIL_H

#include <sys/types.h>


int
countDigits (double n);
/* Return the count of the digits in n (e.g. 3 if n = 1000). */


double
fact (double n);
/* Return n! */


void *
xmalloc (size_t n, size_t size);
/* Malloc n blocks of the specified size or die. */


#endif /* UTIL_H */
