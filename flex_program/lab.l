%{ 
    int c=0;  
%} 
  
%% 
[ ] {c++;}  
%% 
int yywrap()
{

	return 1;

}  
int main() 
{ 
  	printf("Enter Someting\n");

    yylex();
    printf("Count : %d",c);
    return 0; 
} 