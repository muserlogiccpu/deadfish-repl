#include <string.h>
#include "deadfish.h"

int main() {
    char line[256];
    int acc = 0;
    printf("嘭！哐！叮！呲！咣！ (%d) >> ", acc);
    fflush(stdout);
    while (fgets(line, sizeof(line), stdin)) {
        if (strstr(line, "嘭！"))      df_step(&acc, 'i');
        else if (strstr(line, "哐！")) df_step(&acc, 'd');
        else if (strstr(line, "叮！")) df_step(&acc, 's');
        else if (strstr(line, "呲！")) df_step(&acc, 'o');
        if (strstr(line, "\n")) {
            printf("嘭！哐！叮！呲！咣！ (%d) >> ", acc);
            fflush(stdout);
        }
    }
    return 0;
}