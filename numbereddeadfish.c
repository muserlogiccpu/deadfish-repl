#include "deadfish.h"
int main() {
    int c;
    int acc = 0;
    printf("Numbered (%d) >> ", acc);
    fflush(stdout);
    while ((c = getchar()) != EOF) {
        if (c == '1') {
            df_step(&acc, 'i');
        } else if (c == '2') {
            df_step(&acc, 'd');
        } else if (c == '3') {
            df_step(&acc, 's');
        } else if (c == '4') {
            df_step(&acc, 'o');
        } else if (c == '5') {
            break;  
        } 
        if (c == '\n') {
            printf("Numbered (%d) >> ", acc);
            fflush(stdout);
        }
    }
    return 0;
}