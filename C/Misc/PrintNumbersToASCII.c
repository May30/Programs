#include <stdio.h>

int main() {
	int i = 0;
	printf("Dec\t==>\tChar\n");
	for (; i < 128; i++) {
		printf("%d\t==>\t%c\n", i, i);
	}
	return 0;
}
