%{
#include "y.tab.h"
%}
%%
"int" {return INT;}
"float" {return FLOAT;}
"char" {return CHAR;}
"double" {return DOUBLE;}
";" {return SEMI;}
"," {return COMMA;}
"[" {return LB;}
"]" {return RB;}
[a-zA-Z_][a-zA-Z0-9_]* {return IDEN;}
[0-9]+ {yylval=atoi(yytext);return NUM;}
[\n ] ;
. {return yytext[0];}
%%
int yywrap()
{return 1;}
