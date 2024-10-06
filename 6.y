%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
typedef char *string;
struct{string res,op1,op2;char op;}code[100];
int id=-1;
string table(string, char ,string);
void tac();
void quad();
%}
%union{char *exp;}
%token <exp> IDEN NUM
%type <exp> EXP
%left '+' '-'
%left '*' '/'
%right '='
%%
ST:ST S
|
;
S:EXP '\n'
;
EXP:IDEN'='EXP {$$=table($1,'=',$3);}
|EXP'+'EXP {$$=table($1,'+',$3);}
|EXP'*'EXP {$$=table($1,'*',$3);}
|EXP'-'EXP {$$=table($1,'-',$3);}
|EXP'/'EXP {$$=table($1,'/',$3);}
|'('EXP')' {$$=$2;}
|IDEN {$$=$1;}
|NUM {$$=$1;}
;
%%
int yyerror()
{printf("\nERROR\n"); return 0;}
int main()
{
printf("enter\n");
yyparse();
printf("TAC\n");
tac();
printf("QUAD\n");
quad();
return 0;}
string table(string op1,char op,string op2)
{
if(op=='=')
{
code[id+1].res=op1;
return op1;
}
id++;
string res=malloc(3);
sprintf(res,"@%c",id+'A');
code[id].op1=op1;
code[id].op2=op2;
code[id].op=op;
code[id].res=res;
return res;
}
void tac()
{
for(int i=0;i<=id;i++)
printf("%s\t=\t%s\t%c\t%s\n",code[i].res,code[i].op1,code[i].op,code[i].op2);
}
void quad()
{
for(int i=0;i<=id;i++)
printf("%d\t%s\t%s\t%s\t%c\n",i,code[i].res,code[i].op1,code[i].op2,code[i].op);
}
