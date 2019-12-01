keyword "number"|"method"|"loop"|"print"|"if"|"elif"|"else"
alphabet [A-Za-z]
digit [0-9]
operator "assign"|"<="|"+"|"=="|"!="
punctuation "`"|":"|";"

%{
   int key=0;
   int variable;
   int operator;
   int punc;
%}

%%
[-][-] {printf("single line comment found: %s",yytext);}
{keyword} {key++;printf("Keyword %s",yytext);}
{alphabet}[{digit}|{alphabet}]* {variable++;printf("variable %s",yytext);}
{operator} {operator++;printf("operator %s",yytext);}
{punctuation} {punc++;printf("punctuation %s",yytext);}
%%

int yywrap()
{
    return 1;
}

int main()
{
	yyin = freopen( "input.c", "r" ,stdin);
	yyout = freopen( "output.txt","w",stdout);
	yylex();

	return 0;

}