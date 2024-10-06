%{
#include <stdio.h>
#include <stdlib.h>
int yyerror();
int yylex();
%}
%%
S:A B
;
A:'a'A'b'
|
;
B:'b'B'c'
|
;
%%
int main()
{
printf("\nENTER");
yyparse();
printf("\nVALID");
}
int yyerror()
{
printf("\nINVALID");
exit(0);
}
