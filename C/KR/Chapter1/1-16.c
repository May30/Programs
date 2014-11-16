
#include <stdio.h>

int getlines(char line[]);
void copy(char to[], char from[]);

/*print longest input line */

int main()
{
	int len; /* current line legnth*/
	int max; /* maximum length so far */
	char line[]; /* current input line */
	char longest[]; /* longest line saved here */

	max = 0;
	while ((len = getlines(line)) > 0)
		if (len > max) {
			max = len;
		copy(longest, line);
		}

	if (max > 0) /* there was a line */
	printf("%s", longest);
	return 0;
}



/* getlines: read a line into s, return length */
int getlines(char s[])
{
	int c, i;

	while( (c = getchar()) != EOF && c != '\n' )
		s[i] = c;
	if (c == '\n') {
		s[i] = c;
		++i;
	}
	s[i] = '\0';
	return i;
}

/*copy: copy 'from' into 'to'; assume to is big enough */
void copy(char to[], char from[])
{
	int i;

	i = 0;
	while ((to[i] = from[i]) != '\0')
		++i;
}
