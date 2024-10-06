%{
#include <stdio.h>
int pi=0,ni=0,pf=0,nf=0;
%}
num [0-9]+
pi \+?{num}
ni -{num}
pf \+?{num}\/\+?{num}|-{num}\/-{num}
nf -{num}\/\+?{num}|\+?{num}\/-{num}
%%
{pi} pi++;
{ni} ni++;
{pf} pf++;
{nf} nf++;
[ \t] ;
[\n] return 0;
. ECHO;
%%
int yywrap() {}
int main()
{
printf("\nENTER");
yylex();
printf("\nPI=%d\nNI=%d\nPF=%d\nNF=%d",pi,ni,pf,nf);
}
