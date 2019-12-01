%{
#include<stdio.h>
#include<stdlib.h>
#define YYSTYPE int

%}
%token ODD EVEN NEWLINE NUMBER
%start input
%%

input:/*empty*/
	|exp NEWLINE {printf("Testing\n");}
	;
exp: /*empty*/
	|ODD { printf("Odd Number\n"); return 0 ;}
	|EVEN {printf("EVEN Number\n"); return 0 ;}
	;

%%
int yywrap()
{
	return 0;
}
int yyerror (char *s)
{
	printf("Error occur : %s\n ",s);
}
int main()
{
	printf("Enter Number : \n");
	yyparse();
	return 0;
}