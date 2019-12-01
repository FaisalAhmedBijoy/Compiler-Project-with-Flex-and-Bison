%{
    #include<string.h>
    int loopst=0;
    int condition=0;
    int headercount=0;
    int loopcount=0;
    int conditioncount=0;
    int functioncount=0;
    int arraycount=0;
    int expressioncount=0;
    int numbercount=0;
    int commentcount=0;
%}
varriable [a-z|A-Z]+[a-z|A-Z|0-9]*
Operator "="|"+"|"-"|"/"|"*"|"&"|"|"|"%"
Releational_Operator ">"|"<"|"<="|">="|"&&"|"||"|"=="|"!="
digit [0-9]
keyword "begin"|"end"
%%
"#".* {printf("Comment found : %s\n",yytext);
		commentcount++;
}
"import ".* {
    printf("header found :: ");
    int i;
    headercount++;
    for(i=7;i<strlen(yytext);i++){
        printf("%c",yytext[i]);
    }
    printf("\n");
}

{varriable}{Operator}{digit}* {
	printf("value assign\n");
	expressioncount++;
}
{varriable}{Operator}{varriable}{Operator}{digit}*  {
	printf("Mathematical expression\n");
	expressioncount++;
}

{keyword}.*  {
	printf("keyword Found : %s",yytext);
}

"array ".*   {
	
	printf("array assign : %s\n",yytext);
	arraycount++;

}

"function ".* {
    printf("function called\n");
    int i;
    functioncount++;
    for(i=9;i<strlen(yytext);i++){
        printf("%c",yytext[i]);
    }
    printf("\n");
}
"number "({varriable},)*{varriable} {
    printf("varriable declared\n");
    int i;
    numbercount++;
    for(i=7;i<strlen(yytext);i++){
        if(yytext[i]==','){
            printf("\n");
        }
        else{
            printf("%c",yytext[i]);
        }
    }
}
"loop :"{varriable}{Releational_Operator}({digit}*|{varriable}*) {
    printf("loop found\n");
    loopst++;
    loopcount++;

}
"pool" {
    loopst--;
    if(loopst<1){
        printf("Loop ended\n");
    }
}
"conend" {
    condition--;

    
    printf("condition ended\n");
}
"condition "{varriable}[" "]*{Releational_Operator}[" "]*({digit}*|{varriable}*) {
    printf("if condition\n");
    condition++;
    conditioncount++;
}

"semicondition "{varriable}[" "]*{Releational_Operator}[" "]*({digit}*|{varriable}*) {
    printf("elseif condition\n");
    condition++;
    conditioncount++;
}

"nocondition" {
    printf("else condition\n");
    condition++;
    conditioncount++;
}
.* {
    if(loopst==0 && condition==0){
        printf("%s",yytext);
    }
    if(loopst){
        printf("Inside Loop");
    }
    
    if(condition){
        printf("Inside condition");
    }
}
%%

int yywrap()
{
    return 1;
}

int main(){
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    yylex();
    printf("Program ended\n");
    printf("----------------------------\n");
    printf("Number of header file : %d\n",headercount);
    printf("Number of Loop  : %d\n",loopcount);
    printf("Number of condition  : %d\n",conditioncount);
    printf("Number of function  : %d\n",functioncount);
    printf("Number of array  : %d\n",arraycount);
    printf("Number of expression  : %d\n",expressioncount);
    printf("Number of declared number  : %d\n",numbercount);
    printf("Number of Comment  : %d\n",commentcount);
    return 0;
}
