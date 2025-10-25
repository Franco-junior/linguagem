#include <stdio.h>
#include "parser.tab.h"

extern FILE *yyin;
FILE *out;
int yyparse();

int main(int argc, char **argv) {
    if (argc < 3) {
        printf("Uso: %s <arquivo.brainrot> <saida.asm>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    out = fopen(argv[2], "w");

    if (!yyin || !out) {
        perror("Erro ao abrir arquivos");
        return 1;
    }

    yyparse();

    fclose(yyin);
    fclose(out);
    return 0;
}
