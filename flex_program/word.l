%{

int word=0;
int ch=0;
int line=0;

%}

%%
\n {line++ ,word++ ;}
[ ] {word++;}
. {ch ++ ;}


%%

int yywrap(){
	return 1;
}
int main(){
	printf("Enter a sentence \n");
	yylex();
	printf("word length line count ");
	printf("word : %d",word);
	printf("line :%d ",line);
	printf("char : %d",ch);

}