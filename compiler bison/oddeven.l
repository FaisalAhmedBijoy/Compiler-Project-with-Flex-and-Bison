%{
#include<stdio.h>
#include "oddeven.tab.h"
extern YYSTYPE yylval; 
%}

NUMBER [0-9]+
%%
{NUMBER} {
	
	if(atoi(yytext) %2 ==0)
	{
		return EVEN;
	}
	else{
		return ODD;
	}
}
"\n" {return NEWLINE;}
%%