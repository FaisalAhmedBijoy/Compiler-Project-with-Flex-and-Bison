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
Comment		#.*
	

%%
"CASE" 			{return CASE;}
"SWITCH" 		{return SWITCH;}
"DEFAULT" 		{return DEFAULT;}
{digit}+	{yylval = atoi(yytext); return NUM; }
"PRINTFUNCTION" 	{return PRINTFUNCTION; } 
"IF" 			   {return IF;   }
"ELSE" 		   {return ELSE; }
"{" 		   {return BRACKETSTART;  }
"}"  		   {return BRACKETEND;	}
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
"TRY"			{return TRY;}
"CATCH"			{return CATCH;}
"FUNCTION"		{ECHO;printf(" "); return FUNCTION;}
"CLASS"			{printf("New Class  Name : ");ECHO;printf(" "); return CLASS;}
"Main"	   {printf("\nMain Function Start\n"); return MAIN; }
{Comment}		{printf("\nSingle line Comment found :: ");ECHO;printf("\n");}
{header}  				{printf("\nHeader file found :\n");ECHO;printf("\n");}
[-+/*<>=,():;%^]     {yylval = yytext[0];	return *yytext;	}
{variable}	    {ECHO;printf("\n"); yylval = *yytext - 'a'; return	VAR; }

[ ]*	    			{}
[\n]*					{}
[\t]*					{}
.						{printf("\nUnknown Syntax : %s\n",yytext);}


%%
