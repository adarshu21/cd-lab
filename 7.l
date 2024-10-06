%{
#include "y.tab.h"
%}
%%
"int"|"float"|"char"|"void" {return TYPE;}
[a-zA-Z_][a-zA-Z0-9_]* {return IDEN;}
[0-9]+ {return NUM;}
[ \n\t] ;
. {return yytext[0];}
%%
