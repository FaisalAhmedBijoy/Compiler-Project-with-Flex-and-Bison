%{
	#include<math.h>

%}
DIGIT [0-9]
ID [a-z][a-z0-9]

%%
{DIGIT}* {printf("Digit found %s -> %d \n",yytext,atoi(yytext));}
{DIGIT}*"."{DIGIT}* {printf("float found %s -> %g \n",yytext,atof(yytext));}
.
%%
int yywrap()
{
	return 1;

}
int main()
{
	printf("File open\n");
	
	yyin=fopen("in1.c","r");
	yylex();
	
	return 0;
}