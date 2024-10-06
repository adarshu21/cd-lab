%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
S:I {printf("\nans=%d",$$);}
;
I:I'+'I {$$=$1+$3;}
|I'-'I {$$=$1-$3;}
|I'*'I {$$=$1*$3;}
|I'/'I {if($3==0){yyerror();}else{$$=$1/$3;}}
|'('I')' {$$=$2;}
|'-'NUM {$$=-$2;}
|NUM {$$=$1;}
;
%%
int main()
{
printf("\nenter");
yyparse();
printf("valid");}
int yyerror()
{
printf("\ninvalid");
exit(0);}
