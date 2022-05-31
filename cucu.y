%{
#include<stdio.h>

FILE *out;
int yylex();
int yywrap(void) {return 1;}
extern FILE *yyin,*yyout;

void yyerror(char *s) {fprintf(out,"Error in code!\n");}

%}

%union{
int number;
char *string;
} 


%token<number> NUM 
%token<string> ID
%token<string> MAIN
%token<string> INTRO
%token<string> TYPE
%token<string> PRINT
%token<string> RETURN
%token<string> QUOTE
%token<string> FOR
%token<string> IF
%token<string> WHILE
%token<string> ELSE
%token<string> MOD
%token<string> COMMA 
%token<string> ASSIGN
%token<string> ADD
%token<string> MINUS
%token<string> AND
%token<string> OR
%token<string> DIV
%token<string> MUL
%token<string> SEMI
%token<string> LEFT_CURLY
%token<string> RIGHT_CURLY
%token<string> LEFT_BRAC
%token<string> RIGHT_BRAC
%token<string> LEFT_SQBRAC
%token<string> RIGHT_SQBRAC
%token<string> COMPARE_EQUAL
%token<string> LESS_THAN_EQUAL
%token<string> GREATER_THAN_EQUAL
%token<string> LESS_THAN
%token<string> GREATER_THAN
%token<string> COMPARE_NOT_EQUAL






%%

code_start : STATE
	    | INTRO STATE
            | code_start STATE
            ;

STATE   : var_decl
        | func_decl
        | func_def
        ;

var_decl : 
        | TYPE ID SEMI 
         | TYPE ID ASSIGN expr SEMI 
         | var_decl ID SEMI
         | TYPE ID ASSIGN expr COMMA var_decl
         | TYPE ID COMMA var_decl 
         ;

func_decl : TYPE ID LEFT_BRAC func_args RIGHT_BRAC SEMI
          ;

func_def :   TYPE ID LEFT_BRAC func_args RIGHT_BRAC LEFT_CURLY func_body RIGHT_CURLY {fprintf(out,"ID: %s\n",$2);}
        | TYPE ID LEFT_BRAC  RIGHT_BRAC LEFT_CURLY func_body RIGHT_CURLY {fprintf(out,"ID: %s\n",$2);}
        | TYPE MAIN LEFT_BRAC func_args RIGHT_BRAC LEFT_CURLY func_body RIGHT_CURLY {fprintf(out,"ID: Main\n");}
        | TYPE MAIN LEFT_BRAC RIGHT_BRAC LEFT_CURLY func_body RIGHT_CURLY {fprintf(out,"ID: Main\n");}
        | MAIN LEFT_BRAC func_args RIGHT_BRAC LEFT_CURLY func_body RIGHT_CURLY {fprintf(out,"ID: Main\n");}
        | MAIN LEFT_BRAC RIGHT_BRAC LEFT_CURLY func_body RIGHT_CURLY {fprintf(out,"ID: Main\n");}
         ; 
 




func_args : 
         |TYPE ID
         | TYPE ID COMMA func_args
         ;
         
                   
func_body : stmt
          | func_body stmt 
          ; 
                           
stmt    : func_call
        | TYPE ID ASSIGN expr SEMI                    
        | TYPE ID SEMI 
        | code_start
        | var_decl
        | RETURN expr SEMI
        | ID LEFT_SQBRAC expr RIGHT_SQBRAC ASSIGN expr SEMI       
        | ID MINUS MINUS SEMI                        
        | ID ADD ADD SEMI    
        | ID ASSIGN ID OPERATOR ID SEMI
        | expr
        | if_else 
        | forloop
        | printstmt 
        ;   

func_call : ID LEFT_BRAC NUM COMMA NUM RIGHT_BRAC SEMI
          | ID LEFT_BRAC ID COMMA ID RIGHT_BRAC SEMI
          ;


if_else : IF LEFT_BRAC ID OPERATOR ID RIGHT_BRAC LEFT_CURLY func_body RIGHT_CURLY ELSE LEFT_CURLY func_body RIGHT_CURLY
        | IF LEFT_BRAC expr RIGHT_BRAC RETURN ID SEMI 
        | IF LEFT_BRAC expr RIGHT_BRAC RETURN ID SEMI ELSE LEFT_CURLY RETURN ID SEMI RIGHT_CURLY
        | IF LEFT_BRAC ID OPERATOR ID RIGHT_BRAC RETURN ID SEMI ELSE LEFT_CURLY RETURN ID SEMI RIGHT_CURLY
        ;

forloop : FOR LEFT_BRAC TYPE ID ASSIGN NUM SEMI ID OPERATOR ID SEMI ID ADD ADD RIGHT_BRAC LEFT_CURLY func_body RIGHT_CURLY
        ;

printstmt : PRINT LEFT_BRAC string COMMA ID RIGHT_BRAC SEMI
          | PRINT LEFT_BRAC string RIGHT_BRAC SEMI
            ;

string : ID
       | ID string
       | QUOTE ID string QUOTE
       ;


expr : TYPE ID             {fprintf(out," Variable %s",$1);}
     | ID
     | NUM                 {fprintf(out," Const: %d  ",$1);}
     | expr OPERATOR expr        
     | expr COMMA expr
     | ID expr 
     ;
     

          
OPERATOR : MOD
        | COMMA 
        | ASSIGN
        | ADD
        | MINUS
        | AND
        | OR
        | DIV
        | MUL
        | SEMI
        | COMPARE_EQUAL
        |LESS_THAN_EQUAL
        |GREATER_THAN_EQUAL
        |LESS_THAN
        |GREATER_THAN
        | COMPARE_NOT_EQUAL


%%



int main(int argc[],char *argv[]){

yyin=fopen(argv[1],"r");
yyout=fopen("lexer.txt","w");
out=fopen("parser.txt","w");
yyparse();

return 0;
}

