#include <stdio.h>

int main() {
	int c;
	int f;
	while ( (c = getchar()) != EOF ) {
		if ( c == '\b' ) {
			putchar('\\');
			putchar('b');
			f = 1;
		}
		if ( c == '\t' ) {
			putchar('\\');
			putchar('t');
			f = 1;
		}
		if ( c == '\\' ) {
			putchar('\\');
			putchar('\\');
			f = 1;
		}
		if ( f != 1 ) putchar(c);
		f = 0;
	}

	return 0;
}
