%{
#include<stdio.h>
#include<stdlib.h>
#define YYSTYPE int

%}

%token INT FLOAT CHAR NEWLINE VAR
%start input

%%
input: /* empty */
	|line NEWLINE {printf("Variable detedted successfully\n");}
	;

line:/*empty */
	|TYPE VAR ';' {printf("variable declare");}
	;
	
TYPE:	/*empty */
	|INT 	{printf("int detedted");}
	|FLOAT	{printf("float detedted");}
	|CHAR	{printf("char detedted");}
	;
%%
int yywrap()
{
	return 0;
}
int yyerror(char *s)
{
	printf("Error occur : %s\n",s);
}

int main()
{
	printf("please declare a variable ");
	yyparse();
	return 0 ;
}