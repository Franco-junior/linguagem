%{
#include "parser.tab.h"   // tokens gerados pelo Bison
%}

%%

"Labubu"              { return INCREMENT; }
"Bobbie Goods"        { return DECREMENT; }
"Bebe Reborn"         { return MOVE_RIGHT; }
"Sorvete de pistache" { return MOVE_LEFT; }
"Dame un grr"         { return OUTPUT; }
"chat qual e a minha bencao"   { return INPUT; }
"Morango("            { return LOOP_START; }
")do amor"            { return LOOP_END; }

"#".*                    { /* ignora comentários */ }
[ \t\n\r]+               { /* ignora espaços */ }

.                        { /* erro léxico */ }

%%
int yywrap(void) {
    return 1;   // indica que terminou a leitura
}
