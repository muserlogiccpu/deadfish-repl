#include "deadfish.h"
int main() {
    int c;
    int acc = 0;
    printf("(%d) >> ", acc);
    fflush(stdout);
    while ((c = getchar()) != EOF) {
        if (c == 'h') break;
        df_step(&acc, (char)c);
        if (c == '\n') {
            printf("(%d) >> ", acc);
            fflush(stdout);
        }
    }
    return 0;
}
