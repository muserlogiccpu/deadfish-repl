#include <string.h>
#include "deadfish.h"
int main() {
    char line[256];
    int acc = 0;
    printf("sakana (%d) >> ", acc);
    fflush(stdout);
    while (fgets(line, sizeof(line), stdin)) {
        if (strstr(line, "増")) {
            df_step(&acc, 'i');
        } else if (strstr(line, "減")) {
            df_step(&acc, 'd');
        } else if (strstr(line, "乗")) {
            df_step(&acc, 's');
        } else if (strstr(line, "出")) {
            df_step(&acc, 'o');
        } else if (strstr(line, "停")) {
            break;
        }
        if (strchr(line, '\n')) {
            printf("sakana (%d) >> ", acc);
            fflush(stdout);
        }
    }
    return 0;
}