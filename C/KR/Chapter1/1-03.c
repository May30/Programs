#include <stdio.h>

int main() {
	float f, c;
	int l, u, step;

	l = 0;
	u = 300;
	step = 20;

	printf("Fahrenheit\t==>\tCelsius\n~~~~~~~~~~\t   \t~~~~~~~\n");
	f = l;
	while (f <= u) {
		c = (5.0 / 9.0) * (f - 32.0);
		printf("%9.0f\t==>\t%6.2f\n", f, c);
		f = f + step;
	}

	return 0;
}
