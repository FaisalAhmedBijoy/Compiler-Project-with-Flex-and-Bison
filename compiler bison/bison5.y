%{
#include<stdio.h>
#include<stdlib.h>
int sym[26];
int type;
%}

%token IF ELSE  NUM VAR
%left '+' '-'
%left '*' '/'
%nonassoc IFX
%nonassoc ELSE
%left '<' '>'

%%
input:	/* empty input */
		|input statment
		;

statment: ';' {printf("No statment");}
		|expression ';' {printf("simple expression : \n",$1);}
		|VAR '=' expression ';' { sym[$1]=$3;
		 							printf("variable declared : \n",$3);}
		|IF '(' expression ')' expression ';'  %prec IFX {if($3){
					printf("IF executed : expression result :  ",$5);
				}
				else{
					printf("ELSE block executed");
				}
			}
		|IF '(' expression ')' expression ';' ELSE expression ';' {
				if($3){
					printf("IF executed : expression result -> \n",$5);
				}
				else{
					printf("ELSE block executed : expression result -> \n",$8);

				}

			}
		;

expression: NUM 	{$$=$1;}
		|VAR 	{$$=sym[$1];}
		|expression '>' expression {$$=$1>$3;}
		|expression '<' expression {$$=$1<$3;}
		|expression '+' expression {$$=$1+$3;}
		|expression '-' expression {$$=$1-$3;}
		|expression '*' expression {$$=$1*$3;}
		|expression '/' expression {
				if($3>0){
					printf("Divison possible");
					$$=$1/$3;
				}
				else{
					printf("Divison not possible");
				}
			}
		| '(' expression ')' {$$=$2;}
		;


%%

int yywrap(){
	return 0;
}

int yyerror(char *s)
{
	printf("Error occur : %s\n",s);
}
int main()
{
	printf("Enter Something : \n");
	yyparse();
	return 0 ;
}