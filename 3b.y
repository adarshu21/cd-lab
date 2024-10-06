%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror();int c=0;
%}
%token NUM IDEN OP FOR TYPE
%left '+' '-'
%left '*' '/'
%%
S:F;
F:FOR'('DA';'COND';'S1')'BODY {c++;}|
F:FOR'('DA';'';'S1')'BODY {c++;}|
F:FOR'('';'COND';'S1')'BODY {c++;}|
F:FOR'('';'';'S1')'BODY{c++;};
DA:DEC|ASGN;
DEC:TYPE IDEN|TYPE ASGN;
ASGN:IDEN'='E;
COND:T OP T;
BODY:S1';'|'{'SS'}'|F|';';
SS:S1';'SS|F SS|;
S1:DA|E;
E:E'+'E|E'-'E|E'*'E|E'/'E|E'+''+'|'+''+'E|'-''-'E|E'-''-'|T;
T:NUM|IDEN;
%%
int main()
{
printf("\nenter");
yyparse();
printf("ans=%d",c);
exit(0);
}
int yyerror(){printf("invalid");return 0;}
// %{
// 	#include<stdio.h>
// 	#include<stdlib.h>
// 	int yylex();
// 	int yyerror();
// 	int cnt=0;
// %}
// %token FOR IDEN NUM TYPE OP
// %left '+' '-'
// %left '*' '/'
// %%
//
// // Tokens
//
// // FOR -> for
// // IDEN -> identifier
// // NUM -> number
// // TYPE -> datatype
// // OP -> relational operator
//
// // Non-terminals
//
// // S -> Start symbol
// // BODY -> Body  of For loop
// // COND -> Condition
// // S1 -> Single Statement
// // SS -> Set of statements
// // T -> Term
// // E -> Expression
// // F -> For loop block
// // DA -> Declaration or assignment
// // DECL -> Declaration
// // ASSGN -> Assignment
//
// S:F;
// F:FOR'('DA';'COND';'S1')'BODY { cnt++; } |
//   FOR'(' ';'COND';'S1')'BODY { cnt++; } |
//   FOR'('DA';' ';'S1')'BODY { cnt++; } |
//   FOR'(' ';' ';'S1')'BODY { cnt++; } ;
//
// DA:DECL|ASSGN
// DECL: TYPE IDEN | TYPE ASSGN;
// ASSGN : IDEN '=' E;
// COND : T OP T;
// T : NUM | IDEN ;
//
// BODY: S1';' | '{'SS'}' | F |';';
//
// SS: S1 ';' SS | F SS |;
// S1: ASSGN | E | DECL ;
// E : E '+' E | E '-' E | E '*' E | E '/' E | '-''-'E | '+''+'E | E'+''+' | E'-''-' | T ;
// %%
// int main()
// {
// 	printf("Enter the snippet:\n");
// 	yyparse();
// 	printf("Count of for : %d\n",cnt);
// 	return 0;
// }
// int yyerror()
// {
// 	printf("Invalid\n");
// 	exit(0);
// }
