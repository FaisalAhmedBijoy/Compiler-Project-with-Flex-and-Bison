%{

#define YYSTYPE double
#include<stdio.h>
#include<stdlib.h>
%}


%token NEWLINE NUMBER PLUS MINUS MULTIPLY DIVISION LPAREN RPAREN EXPONEN 
%left PLUS MINUS
%left MULTIPLY DIVISION
%right EXPONEN
%start input

%%

input:	/* empty*/
	|input line
	;

line: NEWLINE
	|expression NEWLINE 	{printf("Value is : %g\n",$1);}
	;

expression: NUMBER					{$$=$1;}
	|expression PLUS expression		{$$=$1+$3;}
	|expression MINUS expression	{$$=$1-$3;} 
	|expression MULTIPLY expression	{$$=$1*$3;}
	|expression DIVISION expression {$$=$1/$3;}
	|LPAREN expression RPAREN		{$$=$2;}
	;
%%

int yywrap()
{
	return 0;
}
int yyerror(char *s)
{
	printf("error: %s\n", s);
}

int main()
{
	printf("Enter something :\n");
	yyparse();
	printf("Mathematical expression");
	return 0 ;
}