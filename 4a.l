%{
#include <stdio.h>
int k=0,id=0,op=0;
%}
%%
int|float|double|bool|for|if|else|return|while {k++;printf("\nkeywords");}
[a-zA-Z_][a-zA-Z0-9_]* {id++,printf("\nidens");}
[\-\*\/\+\%\^\&\+] {op++;printf("\nops");}
[^\n]* {printf("\ninvlaid");}
%%
int main()
{
printf("\nenter");
yylex();
printf("\nop=%d,key=%d,iden=%d",op,k,id);
exit(0);
}
int yywrap()
{return 1;}
