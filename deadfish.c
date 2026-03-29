#include <stdio.h>
int main() {
	int c;
	int acc = 0;
	while (1) {
		printf("deadfish repl >>> ");
		c = getchar();
		if (c == '\n' || c == EOF) continue;
		if (c == 'i') acc++;
		else if (c == 'd') acc--;
		else if (c == 's') acc = acc * acc;
		else if (c == 'o') printf("%d\n",acc);
		if (acc == 256 || acc == -1) acc = 0;
	}
}
