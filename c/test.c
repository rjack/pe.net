/* Test single problems.
 *
 * Usage:
 * test [n ...]
 * Solve problem number n.
 * Without arguments print a list of available tests. */

#include "problems.h"
#include "util.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>


/*******************************************************************************
			    Private vars and defs
*******************************************************************************/

/* Problems solved so far... */
#define     NMODULES     20

/* Brief description of problems.
 * See http://projecteuler.net/index.php?section=problems */
static char *description[NMODULES] = {
	"Add all the natural numbers below 1000 that are multiples of 3 or 5.",
	"Find the sum of all the even-valued terms in the Fibonacci sequence which do not exceed one million.",
	"Find the largest prime factor of 317584931803.",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"TODO",
	"Find the sum of digits in 100!"
};

/* Function pointers. Call solve[i] to solve problem number i. */
void (*solve[NMODULES])(void) = {
	problem_1,
	problem_2,
	problem_3,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	problem_20
};


/*******************************************************************************
			      Private functions
*******************************************************************************/


static void
printUsage (void) {
	printf ("Usage: test [n ...]\n");
	printf ("Run test number n...\n");
	printf ("Run without arguments to get a list of solved problems\n");
}


static void
listModules (void) {
	int i;

	for (i = 0; i < NMODULES; i++) {
		printf ("%d - %s\n", i + 1, description[i]);
	}
}


static int *
getArgsOrDie (int argc, char **argv) {
	int i;
	char *badCharPtr;
	int *selected = xmalloc (argc - 1, sizeof (int));

	/* Skip program name. */
	for (i = 1; i < argc; i++) {
		errno = 0;
		selected[i - 1] = strtol (argv[i], &badCharPtr, 10); 
		if (errno != 0 || *badCharPtr != '\0') {
			perror ("strtol");
			fprintf (stderr,
			        "Error parsing argument %d: %s\n", i, argv[i]);
			printUsage ();
			exit (EXIT_FAILURE);
		}
		if (selected[i - 1] > NMODULES
		    || selected[i - 1] <= 0
		    || description[selected[i - 1] - 1] == NULL) {
			fprintf (stderr,
			         "Problem %d not solved.\nRun without "
			         "arguments to get a list.\n", selected[i - 1]);
			exit (EXIT_FAILURE);
		}
		selected[i - 1]--;
	}
	return selected;
}


int
main (int argc, char **argv) {

	int i;
	int *selected;

	if (argc == 1) {
		printUsage ();
		listModules ();
		exit (EXIT_SUCCESS);
	}

	selected = getArgsOrDie (argc, argv);

	for (i = 0; i < argc - 1; i++) {
		printf ("%d - %s\n", selected[i] + 1, description[selected[i]]);
		solve[selected[i]] ();
	}

	return 0;
}
