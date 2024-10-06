%{
#include <stdio.h>
int s=0,m=0,ml=0;
FILE *comment;
%}
%%
"//"[^\n]* {s++;fprintf(comment,"\n%s",yytext);}
"/*"([^*]|[*]+[^*/]|[*]*)*"*/" {m++;for(int i=0;i<yyleng;i++){if(yytext[i]=='\n')ml++;}fprintf(comment,"\n%s",yytext);}
. {fprintf(yyout,"%s",yytext);}
%%
int yywrap()
{return 1;}
int main()
{
yyin=fopen("input.txt","r");
yyout=fopen("output.txt","w");
comment=fopen("comment.txt","w");
yylex();
printf("\nsingle=%d\nmulti=%d\nmutlilines=%d\n",s,m,ml);
return 0;
}
