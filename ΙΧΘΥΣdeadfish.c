#include <wchar.h>
#include <locale.h>
#include "deadfish.h"

int main() {
    setlocale(LC_ALL, ""); 
    wint_t c;
    int acc = 0;
    printf("ΙΧΘΥΣ (%d) >> ", acc);
    while ((c = getwchar()) != WEOF) {
        if (c == L'ι') {
            df_step(&acc, 'i');
        } else if (c == L'χ') {
            df_step(&acc, 'd');
        } else if (c == L'θ') {
            df_step(&acc, 's');
        } else if (c == L'υ') {
            df_step(&acc, 'o');
        }
        if (c == L'\n') {
            printf("ΙΧΘΥΣ (%d) >> ", acc);
            fflush(stdout);
        }
    }
}