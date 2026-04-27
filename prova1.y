%{
#include <stdio.h>
int yylex(void);
void yyerror(char *s);
%}

/* Declaro esses tokens que vem do Flex */
%token NUM STRING ID PRINT CONCAT COMPRIMENTO EOL

/* parte de precedência matemática  */
%left '+' '-'
%left '*' '/'

%%

programa:
    linhas
    ;

linhas:
    linha
    | linhas linha
    ;

linha:
    comando EOL
    | EOL
    ;

/*comandos aceitos */
comando:
    atribuicao
    | impressao
    | expressao
    ;

/* aqui o ID = expressao */
atribuicao:
    ID '=' expressao
    ;

impressao:
    PRINT expressao
    ;

expressao:
    expressao '+' expressao
    | expressao '-' expressao
    | expressao '*' expressao
    | expressao '/' expressao
    | '(' expressao ')'
    | chamada_func
    | NUM
    | STRING
    | ID
    ;

chamada_func:
    CONCAT '(' lista_args ')'
    | COMPRIMENTO '(' expressao ')'
    ;

lista_args:
    expressao
    | lista_args ',' expressao
    ;
%%
