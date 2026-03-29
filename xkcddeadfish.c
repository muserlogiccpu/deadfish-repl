#include "deadfish.h"
int main() {
    int c;
    int acc = 0;
    printf("xkcd (%d) >> ", acc);
    fflush(stdout);
    while ((c = getchar()) != EOF) {
        if (c == 'x') {
            df_step(&acc, 'i');
        } else if (c == 'd') {
            df_step(&acc, 'd');
        } else if (c == 'k') {
            df_step(&acc, 's');
        } else if (c == 'c') {
            df_step(&acc, 'o');
        } 
        if (c == '\n') {
            printf("xkcd (%d) >> ", acc);
            fflush(stdout);
        }
    }
    return 0;
}