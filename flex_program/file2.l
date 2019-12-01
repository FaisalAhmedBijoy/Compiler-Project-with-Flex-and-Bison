%{

int ch=0;
int line=0;
%}

%%
\n {line++ ;ch++;}
. {ch++;}

%%
int yywrap()
{
	return 1 ;
}
int main()
{
	yyin=fopen("in1.c","r");
	yylex();
	printf("line : %d\n",line);
	printf("char  : %d\n",ch);
}