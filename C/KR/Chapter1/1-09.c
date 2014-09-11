#include <stdio.h>

int main() {
	int c, prevchar;
	prevchar = 0;
	while ( (c = getchar()) != EOF ) {
		if ( c != ' ' || prevchar != ' ') {
			putchar(c);
		}
		prevchar = c;
	}

	return 0;
}
