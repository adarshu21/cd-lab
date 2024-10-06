%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror();
typedef char *string;
struct {string op1,op2,res;char op;}code[100];
int id=-1;
string table(string, string, char);
void ans();
%}
%union{char *exp;}
%token <exp> NUM IDEN
%type <exp> E
%left '+' '-'
%left '*' '/'
%right '='
%%
STMTS:STMT STMTS|;
STMT:E'\n';
E:IDEN'='E {$$=table($1,$3,'=');}
|E'+'E {$$=table($1,$3,'+');}
|E'*'E {$$=table($1,$3,'*');}
|E'/'E {$$=table($1,$3,'/');}
|E'-'E {$$=table($1,$3,'-');}
|'('E')' {$$=$2;}
|IDEN {$$=$1;}
|NUM {$$=$1;}
;
%%
int yyerror()
{
printf("INVALID\n");
exit(0);
}
int main()
{
printf("ENTER\n");
yyparse();
printf("INSTRUCTIONS\n");
ans();
exit(0);
}
string table(string op1,string op2,char op)
{
if(op=='=')
{
code[id+1].res=op1;
return op1;
}
id++;
string res=malloc(3);
sprintf(res,"@%c",id+'A');
code[id].res=res;
code[id].op1=op1;
code[id].op=op;
code[id].op2=op2;
return res;
}
void ans()
{
for(int i=0;i<=id;i++)
{
string ins;
switch(code[i].op)
{
case '+':ins="ADD"; break;
case '-':ins="SUB"; break;
case '*':ins="MUL"; break;
case '/':ins="DIV"; break;
}
printf("MOV\tR1,%s\n",code[i].op1);
printf("MOV\tR1,%s\n",code[i].op2);
printf("%s\tR3,R2,R1\n",ins);
printf("STR\t%s,R3\n",code[i].res);

}
}
