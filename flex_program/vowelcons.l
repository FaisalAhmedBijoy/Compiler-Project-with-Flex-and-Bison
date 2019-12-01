%{
int vowel=0;
int constant=0;
%}

%%
[a|e|i|o|u] {vowel++;}
[A|E|I|O|U] {vowel++;}
[A-Z|a-z] {constant++;}
%%

int yywrap()
{
return 1;
}

int main()
{
printf("Enter a word : \n");	
yylex();
printf("Vowel : %d\nConstant : %d",vowel,constant);
}