%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>

	int sym[30];

	
	int variablenumber=0;
	int expressionnumber=0;
	int variableassignment=0;
	int switchnumber=0;
	int printnumber=0;
	int fornumber=0;
	int arraynumber=0;
	int classnumber=0;
	int trycatchnumber=0;
	int functionnumber=0;
	int whilenumber=0;
	int mathexpressionnumber=0;
	int ifelsenumber=0;

%}

/* bison declarations */

%token NUM VAR IF ELSE ARRAY MAIN INT FLOAT CHAR BRACKETSTART BRACKETEND FOR WHILE ODDEVEN PRINTFUNCTION SIN COS TAN LOG FACTORIAL CASE DEFAULT SWITCH CLASS TRY CATCH FUNCTION
%nonassoc IFX
%nonassoc ELSE

%left '<' '>'
%left '+' '-'
%left '*' '/'

/* Grammar rules and actions follow.  */

%%

program: MAIN ':' BRACKETSTART  line BRACKETEND {printf("Main function END\n");}
	 ;

line: /* NULL */

	| line statement
	;

statement: ';'			
	| declaration ';'		{ printf("Declaration\n"); variablenumber++;}

	| expression ';' 			{   printf("\nvalue of expression: %d\n", $1); $$=$1;
		printf("\n.........................................\n");
		expressionnumber++;
		}
	
	| VAR '=' expression ';' { 
							printf("\nValue of the variable: %d\n",$3);
							sym[$1]=$3;
							$$=$3;
							printf("\n.........................................\n");
						variableassignment++;
						} 
   
	| WHILE '(' NUM '<' NUM ')' BRACKETSTART statement BRACKETEND  {
	                                int i;
	                                printf("WHILE Loop execution");
	                                for(i=$3 ; i<$5 ; i++) {printf("\nvalue of the loop: %d expression value: %d\n", i,$8);}
	                                printf("\n.........................................\n");									
				               whilenumber++;
				               }
	

	| IF '(' expression ')' BRACKETSTART statement BRACKETEND %prec IFX {
								if($3){
									printf("\nvalue of expression in IF: %d\n",$6);
								}
								else{
									printf("\ncondition value zero in IF block\n");
								}

								printf("\n.........................................\n");
								ifelsenumber++;
							}

	| IF '(' expression ')' BRACKETSTART statement BRACKETEND ELSE BRACKETSTART statement BRACKETEND {
								if($3){
									printf("value of expression in IF: %d\n",$6);
								}
								else{
									printf("value of expression in ELSE: %d\n",$11);
								}
								ifelsenumber++;
								printf("\n.........................................\n");
							}
	| PRINTFUNCTION '(' expression ')' ';' {printf("\nPrint Expression %d\n",$3);
		printnumber++;
		printf("\n.........................................\n");}

	| FACTORIAL '(' NUM ')' ';' {
		printf("\nFACTORIAL declaration\n");
		int i;
		int f=1;
		for(i=1;i<=$3;i++)
		{
			f=f*i;
		}
		printf("FACTORIAL of %d is : %d\n",$3,f);
		printf("\n.........................................\n");

		functionnumber++;

		}

	| ODDEVEN '(' NUM ')' ';' {
		printf("Odd Even Number detection \n");

		if($3 %2 ==0){
			printf("Number : %d is -> Even\n",$3);
		}
		else{
			printf("Number is :%d is -> Odd\n",$3);
		}
		printf("\n.........................................\n");
		functionnumber++;
		}

	| FUNCTION VAR '(' expression ')' BRACKETSTART statement BRACKETEND {
		printf("FUNCTION found :  \n");
		printf("Function Parameter : %d\n",$4);
		printf("Function internal block statement : %d\n",$7);
		printf("\n.........................................\n");
		functionnumber++;


	}

	| ARRAY TYPE VAR '(' NUM ')' ';' {
		printf("ARRAY Declaration\n");
		
		printf("Size of the ARRAY is : %d\n",$5);
		arraynumber++;
		printf("\n.........................................\n");
	}

	| SWITCH '(' NUM ')' BRACKETSTART  SWITCHCASE BRACKETEND {
		printf("\nSWITCH CASE Declaration\n");
		printf("\nFinally Choose Case number :-> %d\n",$3);
		printf("\n.........................................\n");
		switchnumber++;
	}

	| CLASS VAR  BRACKETSTART statement BRACKETEND {

		printf("Class Declaration\n");
		printf("Expression : %d\n",$4);
		classnumber++;
	}

	| CLASS VAR ':' VAR  BRACKETSTART statement BRACKETEND {

		printf("Inheritance occur \n");
		printf("Expression value : %d",$6);
		classnumber++;
		
	}

	| TRY BRACKETSTART  statement BRACKETEND  CATCH '(' expression ')' BRACKETSTART statement BRACKETEND{
		printf("TRY CATCH block found\n");
		printf("TRY Block operation : %d\n",$3);
		printf("CATCH Value : %d\n",$7);
		printf("Catch Block operation :%d\n",$10);
		printf("\n.........................................\n");

		trycatchnumber++;
	}

	



	
	| FOR '(' NUM ',' NUM ',' NUM ')' BRACKETSTART  statement BRACKETEND {
	                                int i;
	                                printf("FOR Loop execution");
	                                for(i=$3 ; i<$5 ; i=i+$7 ) 
	                                {printf("\nvalue of the  i: %d expression value : %d\n", i,$10);}
	                                printf("\n.........................................\n");

				               fornumber++;
				               }

	
	;
	

	
declaration : TYPE ID1   {printf("\nvariable Dection\n");
		printf("\n.........................................\n");}
            ;


TYPE : INT   {printf("interger declaration\n");}
     | FLOAT  {printf("float declaration\n");}
     | CHAR   {printf("char declaration\n");}
     ;



ID1 : ID1 ',' VAR  
    |VAR  
    ;

 SWITCHCASE: casegrammer
 			|casegrammer defaultgrammer
 			;

 casegrammer: /*empty*/
 			| casegrammer casenumber
 			;

 casenumber: CASE NUM ':' expression ';' {printf("Case No : %d & expression value :%d \n",$2,$4);}
 			;
 defaultgrammer: DEFAULT ':' expression ';' {
 				printf("\nDefault case & expression value : %d",$3);
 			}
 		;


expression: NUM					{ printf("\nNumber :  %d\n",$1 ); $$ = $1;  }

	| VAR						{ $$ = sym[$1]; }
	
	| expression '+' expression	{printf("\nAddition :%d+%d = %d \n",$1,$3,$1+$3 );  $$ = $1 + $3;}

	| expression '-' expression	{printf("\nSubtraction :%d-%d=%d \n ",$1,$3,$1-$3); $$ = $1 - $3; }

	| expression '*' expression	{printf("\nMultiplication :%d*%d \n ",$1,$3,$1*$3); $$ = $1 * $3; }

	| expression '/' expression	{ if($3){
				     					printf("\nDivision :%d/%d \n ",$1,$3,$1/$3);
				     					$$ = $1 / $3;
				     					
				  					}
				  					else{
										$$ = 0;
										printf("\ndivision by zero\n\t");
				  					} 	
				    			}
	| expression '%' expression	{ if($3){
				     					printf("\nMod :%d % %d \n",$1,$3,$1 % $3);
				     					$$ = $1 % $3;
				     					
				  					}
				  					else{
										$$ = 0;
										printf("\nMOD by zero\n");
				  					} 	
				    			}
	| expression '^' expression	{printf("\nPower  :%d ^ %d \n",$1,$3,$1 ^ $3);  $$ = pow($1 , $3);}
	| expression '<' expression	{printf("\nLess Than :%d < %d \n",$1,$3,$1 < $3); $$ = $1 < $3 ; }
	
	| expression '>' expression	{printf("\nGreater than :%d > %d \n ",$1,$3,$1 > $3); $$ = $1 > $3; }

	| '(' expression ')'		{	 $$ = $2; }
	| SIN expression 			{printf("\nValue of Sin(%d) is : %lf\n",$2,sin($2*3.1416/180)); $$=sin($2*3.1416/180);}

    | COS expression 			{printf("\nValue of Cos(%d) is : %lf\n",$2,cos($2*3.1416/180)); $$=cos($2*3.1416/180);}

   
   
	| LOG expression 			{printf("\nValue of Log(%d) is : %lf\n",$2,(log($2))); $$=(log($2));}
	
	;
%%


int  yyerror(char *s){
	printf( "%s\n", s);
}
int yywrap()
{
	return 1;
}

int main()
{
	freopen("input.txt","r",stdin);

	freopen("output.txt","w",stdout);
	yyparse();

	printf("\n**********************************\n");

	printf("All the input parsing complete \n");
	
	printf("\n**********************************\n");


	printf("Number of array : %d\n",arraynumber);
	printf("Number of if else : %d\n",arraynumber);
	printf("Number of while loop : %d\n",whilenumber);
	printf("Number of for loop :  %d\n",fornumber);
	printf("Number of SWITCHCASE : %d\n",switchnumber++);
	printf("Number of class : %d \n",classnumber);
	printf("Number of Print function : %d\n",printnumber);
	printf("Number of try catch : %d \n",trycatchnumber);
	printf("Number of variable declaration :%d \n",variablenumber);
	printf("Number of variable assignment : %d \n",variableassignment);
	printf("Number of expression : %d",expressionnumber);

	printf("\n**********************************\n");

	printf("\n**********************************\n");

	printf("Name : Faisal Ahmed\n");
	printf("Roll :1607048\n");
	printf("Section : A\n");
	printf("Department : CSE\n");
	printf("University : KUET\n");
	printf("Email : faisal.cse16.kuet@gmail.com\n");

	
	printf("\n**********************************\n");





    
	return 0;
}