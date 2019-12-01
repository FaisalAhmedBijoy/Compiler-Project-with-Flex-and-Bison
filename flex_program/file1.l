
%{

%}
%%
"/".* {} 
"/*"(.*\n*)*"*/"


.* {printf("%s\n",yytext);}


%%
int yywrap()
{
	return 1;
}
int main()
{
	yyin=fopen("in1.c","r");
	yylex();
	return 0;
}