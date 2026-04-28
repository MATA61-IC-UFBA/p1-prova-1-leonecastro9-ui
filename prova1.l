%{
#include <stdio.h>
#include "token.h"
%}
%option noyywrap

%%
[ \t\r]+                { }

"//"[^\n]* { }

"print"                 { return PRINT; }
"concat"                { return CONCAT; }
"length"                { return COMPRIMENTO; }

[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
\"[^\n"]*\"             { return STRING; }
[0-9]+("."[0-9]+)?      { return NUM; }

"="                     { return '='; }
","                     { return ','; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"("                     { return '('; }
")"                     { return ')'; }
\n                      { return EOL; }
.                       { return yytext[0]; }
%%
