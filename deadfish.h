#ifndef DEADFISH_CORE_H
#define DEADFISH_CORE_H
#include <stdio.h>
#include <limits.h>
void df_step(int *acc, char cmd) {
    if (cmd == 'i') {
        if (*acc == INT_MAX) *acc = 0;
        else (*acc)++;
    }
    else if (cmd == 'd') {
        (*acc)--;
    }
    else if (cmd == 's') {
        // anti overflow system
        if (*acc > 0 && *acc > INT_MAX / *acc) *acc = 0;
        else *acc = (*acc) * (*acc);
    }
    else if (cmd == 'o') {
        printf("%d\n", *acc);
    }
    if (*acc == 256 || *acc == -1) {
        *acc = 0;
    }
}
#endif