%{
#include <stdio.h>
int l=0,w=0,s=0,c=0;
%}
%%
[\n] {l++;}
[\t] {s+=4;}
[ ] {s++;}
[^ \n\t#]+ {w++;c+=yyleng;}
# {return 0;}
%%
int yywrap()
{
return 1;
}
int main()
{
printf("ENTER THE INPUT PLS\n");
yylex();
l=l+1;
printf("SPACE=%d\nWORD=%d\nCHAR=%d\nLINES=%d\n",s,w,c,l);
return 0;
}
