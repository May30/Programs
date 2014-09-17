#include <stdio.h>

#define TOTALCHARS 256

int main() {
	int c, count[TOTALCHARS], i;

	for (i = 0; i < TOTALCHARS; i++) {
		count[i] = 0;
	}

	while ( (c = getchar()) != EOF ) {
		count[c]++;
	}

	for (i = 0; i < TOTALCHARS; i++) {
		if (count[i] > 0) {
			putchar(i);
			printf(": %d\n", count[i]);
		}
	}
	return 0;
}
