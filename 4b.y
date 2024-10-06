%{
#include <stdio.h>
#include <stdlib.h>
int c=0;
int yylex();
int yyerror();
%}
%token IF NUM IDEN
%left '+' '-'
%left '*' '/'
%%
S:I
;
I:IF A B {c++;}
;
A:'('E')'
;
E:IDEN|
IDEN OP IDEN|
IDEN OP NUM|
IDEN U|
U IDEN
;
OP:'<'|'>'|'<''='|'>''='|'!''='|'=''='
;
U:'+''+'|'-''-'
;
B:B B|'{'B'}'|I|E';'
;
%%
int main()
{
printf("\nenter pls\n");
yyparse();
printf("\nans=%d",c);
return 0;}
int yyerror()
{printf("\ninvalid");
return 0;}
