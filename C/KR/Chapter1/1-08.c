#include <stdio.h>

int main() {
	int c;
	int b, t, n;
	b = t = n = 0;
	while ( (c = getchar()) != EOF ) {
		if ( c == ' ' ) ++b;
		if ( c == '\t' ) ++t;
		if ( c == '\n' ) ++n;
	}

	printf("Blanks: %d\nTabs: %d\nNew lines: %d\n", b, t, n);

	return 0;
}
