#include <stdio.h>

float CelsiusToFahrenheit(int);

int main() {
	float c;
	int l, u, step;

	l = -100;
	u = 200;
	step = 20;

	printf("Celsius\t==>\tFahrenheit\n~~~~~~~\t   \t~~~~~~~~~~\n");
	c = l;
	while (c <= u) {
		printf("%6.0f\t==>\t%6.2f\n", c, CelsiusToFahrenheit(c));
		c = c + step;
	}

	return 0;
}

float CelsiusToFahrenheit(int c) {
	return ( (9.0 / 5.0) * c + 32.0 );
}