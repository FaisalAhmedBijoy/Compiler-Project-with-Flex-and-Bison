%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
	#include "main.tab.h"
%}

variable [a-zA-Z]
digit [0-9]
header		"import ".*
Comment		[#].*
	

%%

{digit}+	{yylval = atoi(yytext); return NUM; }
"PRINTFUNCTION" 	{return PRINTFUNCTION; } 
"IF" 			   {return IF;   }
"ELSE" 		   {return ELSE; }
"{" 		   {return START;  }
"}"  		   {return END;	}
"FOR" 		   {return FOR;}
"WHILE"		   {return WHILE;}
"FACTORIAL"		{return FACTORIAL;}
"ODDEVEN"		{return ODDEVEN;}
"SIN"		   {return SIN;}
"COS"          {return COS;}
"TAN"          {return TAN;}
"LOG"			{return LOG;}
"INTEGER"  		{return INT;}
"CHAR" 		     {return CHAR;}
"FLOAT"			 {return FLOAT;}
"ARRAY"			{return ARRAY;}
"main"	   {printf("\nmain function strat\n"); return MAIN; }
{Comment}		{printf("\nSingle line comment found :: ");ECHO;printf("\n");}
{header}  				{printf("\nHeader file found :\n");ECHO;printf("\n");}
[-+/*<>=,():;%^]     {yylval = yytext[0];	return *yytext;	}
{variable}	    {ECHO;printf("\n"); yylval = *yytext - 'a'; return	VAR; }

[ ]*	    			{}
[\n]*					{}
[\t]*					{}
.						{printf("\nUnknown syntax : %s\n",yytext);}


%%
