%%
[+]?[0-9]+ {printf("Positive number detect");}
[-]?[0-9]+ {printf("negative number detect");}

%%
int yywrap()
{
	return 1 ;
}
int main()
{
	printf("Enter Positive or negative number ");
	yylex();
	return 0 ;
}