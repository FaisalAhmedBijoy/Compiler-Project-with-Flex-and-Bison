%{
#include<math.h>

%}

ID [a-z][a-z0-9]
DIGIT [0-9]

%%

{DIGIT}+ {printf("A int number : %s -> %d\n",yytext,atoi(yytext)) ;}
{DIGIT}+"."{DIGIT}+ {printf("Float number :%s ->%g \n",yytext,atof(yytext));}

if|else|function|end {printf("Keyword found : %s\n",yytext );}
{ID}+ {printf("A Identifier : %s\n",yytext);}
"+"|"-"|"*"|"/" {printf("Operator found :%s \n",yytext);}
[\n \t ] {printf(" \n");}
. {printf("Unexpected things\n");}
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter Someting \n");
	yylex();
	return 0;

}