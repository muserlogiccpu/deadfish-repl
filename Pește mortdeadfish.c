#include "deadfish.h"
int main() {
    int c;
    int acc = 0;
    printf("Pește mort (%d) >> ", acc);
    fflush(stdout);
    while ((c = getchar()) != EOF) {
        if (c == 'c') {
            df_step(&acc, 'i');
        } else if (c == 's') {
            df_step(&acc, 'd');
        } else if (c == 'p') {
            df_step(&acc, 's');
        } else if (c == 'i') {
            df_step(&acc, 'o');
        } else if (c == 'o') {
            break;
        } 
        if (c == '\n') {
            printf("Pește mort (%d) >> ", acc);
            fflush(stdout);
        }
    }
    return 0;
}