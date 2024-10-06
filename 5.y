%{
#include <stdio.h>
#include <stdlib.h>
int c=0;
int yylex();
void yyerror(const char *s);
%}
%token INT FLOAT DOUBLE CHAR
%token NUM IDEN
%token COMMA SEMI LB RB
%%
DEC:TYPE VLIST SEMI {printf("vars=%d",c);}
;
TYPE:INT {printf("int\n");}
|FLOAT {printf("float\n");}
|CHAR {printf("char\n");}
|DOUBLE{printf("double\n");}
;
VLIST: VAR {c++;}
|VAR COMMA VLIST {c++;}
;
VAR:IDEN
|IDEN LB NUM RB
;
%%
void yyerror(const char *s)
{
fprintf(stderr,"%s\n",s);
exit(0);
}
int main()
{
printf("enter\n");
yyparse();
return 0;
}
