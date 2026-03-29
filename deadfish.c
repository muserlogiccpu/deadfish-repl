#include <stdio.h>
#include <limits.h>
int main() {
	int c;
	int acc = 0;
	printf("deadfish repl >>> ");
	fflush(stdout);
	while ((c = getchar()) != EOF) {
		if (c == 'i') {
			if (acc == INT_MAX) acc = 0;
			else acc++;
		}
		else if (c == 'd') {
			acc--;
		}
		else if (c == 's') {
			// anti overflow system
			if (acc > 0 && acc > INT_MAX / acc) acc = 0;
			else acc = acc * acc;
		}
		else if (c == 'o') printf("%d\n",acc);
		else if (c == 'h') break;
		if (acc == 256 || acc == -1) acc = 0;
		if (c == '\n') {
			printf("deadfish repl >>> ");
			fflush(stdout);
		};
	}
}
