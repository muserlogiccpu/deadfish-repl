#include "deadfish.h"
#include <string.h>
int main() {
    char buffer[100];
    int acc = 0;
    while (1) {
        printf("f!-- (%d) >> ", acc);
        if (fgets(buffer, sizeof(buffer), stdin) == NULL) break;
        buffer[strcspn(buffer, "\n")] = 0;
        if (strcmp(buffer, "F!") == 0) {
            df_step(&acc, 'i');
        } else if (strcmp(buffer, "U!") == 0) {
            df_step(&acc, 'd');
        } else if (strcmp(buffer, "C!") == 0) {
            df_step(&acc, 's');
        } else if (strcmp(buffer, "K!") == 0) {
            df_step(&acc, 'o');
        }
    }
    return 0;
}