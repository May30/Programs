#include <stdio.h>

int main() {
	int f;

	printf("Fahrenheit\t==>\tCelsius\n~~~~~~~~~~\t   \t~~~~~~~\n");
	for (f = 0; f <= 300; f += 20) {
		printf("%9d\t==>\t%6.2f\n", f, (5.0 / 9.0) * (f - 32.0));
	}

	return 0;
}
