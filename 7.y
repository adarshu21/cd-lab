%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
%}
%token NUM TYPE IDEN
%left '+' '-'
%left '*' '/'
%%
S:F {printf("accepted\n");exit(0);};
F:TYPE IDEN'('PARAMS')'BODY;
PARAMS:PARAM','PARAMS|PARAM|;
PARAM:TYPE IDEN;
BODY:S1';'|'{'SS'}';
SS:S1';'SS|;
S1:DEC|AS|E;
DEC:TYPE IDEN|TYPE AS;
AS:IDEN'='E;
E:E'+'E|E'-'E|E'*'E|E'/'E|'+''+'E|E'+''+'|'-''-'E|E'-''-'|IDEN|NUM;
%%
int yyerror()
{
printf("invalid\n");
exit(0);
}
int main()
{
printf("enter\n");
yyparse();
printf("valid\n");
return 0;
}
