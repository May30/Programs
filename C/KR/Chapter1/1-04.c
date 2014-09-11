#include <stdio.h>

int main() {
	float f, c;
	int l, u, step;

	l = -100;
	u = 200;
	step = 20;

	printf("Celsius\t==>\tFahrenheit\n~~~~~~~\t   \t~~~~~~~~~~\n");
	c = l;
	while (c <= u) {
		f = (9.0 / 5.0) * c + 32.0;
		printf("%6.0f\t==>\t%6.2f\n", c, f);
		c = c + step;
	}

	return 0;
}
