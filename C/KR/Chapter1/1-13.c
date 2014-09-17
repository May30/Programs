#include <stdio.h>

#define IN  1
#define OUT 0

int main() {
	int c, state, word_counter, max_count;

	state = OUT;
	word_counter = 0;
	max_count = 0;

	while ( (c = getchar()) != EOF ) {
		if (c == '\n' || c == '\t' || c == ' ') {
			if (state == IN) {
				printf("\n");
				state = OUT;
			}
		}
		else {
			putchar('*');
			if (state != IN) {
				state = IN;
			}
		}
	}

	return 0;
}
