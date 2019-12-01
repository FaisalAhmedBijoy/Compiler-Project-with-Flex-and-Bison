%{
	#include<stdio.h>
	#include "calculator.tab.h"
	extern YYSTYPE yylval;
%}

NUMBER [0-9]+

%%
{NUMBER} {sscanf(yytext,"%lf",&yylval);
		return NUMBER;
		
}

"+" {return PLUS;}
"-" {return MINUS;}
"/"	{return DIVISION;}
"*"	{return MULTIPLY;}
"("	{return LPAREN;}
")"	{return RPAREN;}
"\n" {return NEWLINE;}
.	{printf("Syntax error or unknown charecter");}

%%
