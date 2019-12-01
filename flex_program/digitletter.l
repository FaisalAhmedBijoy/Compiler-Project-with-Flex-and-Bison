digit [0-9]
letter [A-Za-z]
%{

	int count=0;
%}
%%

{letter}({letter}|{digit})*      count++; 

%%
int yywrap()
{
	return 1;
}
int main(){
	
	printf("Enter digit and letter\n");
	yylex();
	printf("Total identifier : %d",count);


}
