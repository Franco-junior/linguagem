%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *out;
int current_loop_id;

int yylex(void);
void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}

%}

%token INCREMENT DECREMENT MOVE_RIGHT MOVE_LEFT OUTPUT INPUT LOOP_START LOOP_END

%%

program:
    { fprintf(out, "SET TIME 0\n"); }
    instructions
    { fprintf(out, "HALT\n"); }
;

instructions:
    /* vazio */
  | instructions instruction
;

instruction:
    INCREMENT       { fprintf(out, "INC TIME\n"); }
  | DECREMENT       { 
                        static int lbl = 0;
    			int id = lbl++;
    			fprintf(out, "DECJZ TIME CONT_%d\n", id);
    			fprintf(out, "CONT_%d:\n", id);
                    }
  | MOVE_RIGHT      { fprintf(out, "PUSH TIME\n"); fprintf(out, "SET TIME 0\n"); }
  | MOVE_LEFT       { fprintf(out, "POP TIME\n"); }
  | OUTPUT          { fprintf(out, "PRINT\n"); }
  | INPUT           { fprintf(out, "SET TIME 65\n"); } // exemplo: entrada fixa "A"
  | loop
;
loop:
    LOOP_START { 
        static int loop_id = 0; 
        current_loop_id = loop_id++;  // salva no global
        fprintf(out, "LOOP_START_%d:\n", current_loop_id);
        fprintf(out, "DECJZ TIME LOOP_END_%d\n", current_loop_id);
    } instructions LOOP_END {
        fprintf(out, "GOTO LOOP_START_%d\n", current_loop_id);
        fprintf(out, "LOOP_END_%d:\n", current_loop_id);
    }
;


%%
