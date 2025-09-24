# linguagem

## EBNF

(* Programa principal *)
program        = { statement } ;

(* Instruções *)
statement      = assignment | conditional | loop | io | block ;

(* Blocos *)
block          = "{" { statement } "}" ;

(* Declaração e atribuição de variáveis *)
assignment     = "var" identifier [ "=" expression ] ";"
               | identifier "=" expression ";" ;

(* Estruturas condicionais *)
conditional    = "if" "(" expression ")" block
                 [ "else" block ] ;

(* Estruturas de repetição *)
loop           = "while" "(" expression ")" block
               | "for" "(" assignment expression ";" assignment ")" block ;

(* Expressões *)
expression     = logical_or ;

logical_or     = logical_and { "||" logical_and } ;
logical_and    = equality { "&&" equality } ;
equality       = relational { ("==" | "!=") relational } ;
relational     = additive { ("<" | ">" | "<=" | ">=") additive } ;
additive       = term { ("+" | "-") term } ;
term           = factor { ("*" | "/") factor } ;
factor         = number | identifier | "(" expression ")" ;

(* Entrada/Saída - exemplo opcional *)
io             = "print" "(" expression ")" ";"
               | "read" "(" identifier ")" ";" ;

(* Identificadores e literais *)
identifier     = letter { letter | digit | "_" } ;
number         = digit { digit } ;

(* Tokens básicos *)
letter         = "A"…"Z" | "a"…"z" ;
digit          = "0"…"9" ;
