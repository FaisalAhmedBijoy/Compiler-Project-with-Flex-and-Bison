%{
#include<stdio.h>
#include<stdlib.h>
#include "var.tab.h"
extern YYSTYPE yylval;
%}

VAR [a-z]+
%%
"int" 		{return INT;}
"float" 	{return FLOAT;}
"char" 		{return CHAR;}
{VAR} 		{return VAR;}
"\n" 		{return NEWLINE;}

%%
