%{
#include <stdlib.h>
#include <stdio.h>
#include "cucu.tab.h"
void yyerror(char *s);

%}




%%
[ \t\n]+                 ;
int     		{fprintf (yyout,"TYPE : \t%s\n",yytext); yylval.string=strdup(yytext); return TYPE;}
"#include<stdio.h>"    {fprintf (yyout,"TYPE : \t%s\n",yytext); yylval.string=strdup(yytext); return INTRO;}
main     		{fprintf (yyout,"\nTYPE : \tmain\n"); yylval.string=strdup(yytext); return MAIN;}
"printf"     		{fprintf (yyout,"\nTYPE : \tprintf\n"); yylval.string=strdup(yytext); return PRINT;}
"return"     		{fprintf (yyout,"\nTYPE : \treturn\n"); yylval.string=strdup(yytext); return RETURN;}
"if"    		{fprintf (yyout,"\nTYPE : \tIF\n"); yylval.string=strdup(yytext); return IF;}
"else"    		{fprintf (yyout,"\nTYPE : \tELSE\n"); yylval.string=strdup(yytext); return ELSE;}
char    		{fprintf (yyout,"\nTYPE : \tchar\n"); yylval.string=strdup(yytext); return TYPE;}
"char *"    		{fprintf (yyout,"\nTYPE : \tchar *\n"); yylval.string=strdup(yytext); return TYPE;}   
"char **"    		{fprintf (yyout,"\nTYPE : \tchar **\n"); yylval.string=strdup(yytext); return TYPE;}  
"for"    		{fprintf (yyout,"\nFOR_LOOP : \tfor\n"); yylval.string=strdup(yytext); return FOR;}
[,]		        {fprintf (yyout,"COMMA: \t,\n"); yylval.string=strdup(yytext); return COMMA;}
[=]                     {fprintf (yyout,"ASSIGN: \t=\n"); yylval.string=strdup(yytext); return ASSIGN;}
[+]                     {fprintf (yyout,"PLUS: \t\t+\n"); yylval.string=strdup(yytext); return ADD;}
[-]                     {fprintf (yyout,"MINUS: \t\t+\n"); yylval.string=strdup(yytext); return MINUS;}
["]                     {fprintf (yyout,"QUOTE: \t\t%s\n",yytext); yylval.string=strdup(yytext); return QUOTE;}
[&]                     {fprintf (yyout,"AND: \t\t&\n"); yylval.string=strdup(yytext); return AND;}
[|]                  	{fprintf (yyout,"OR: \t\t|\n"); yylval.string=strdup(yytext); return OR;}
[/]                 	{fprintf (yyout,"DIV: \t\t/\n"); yylval.string=strdup(yytext); return DIV;}
[*]                	{fprintf (yyout,"MUL: \t\t*\n"); yylval.string=strdup(yytext); return MUL;}
[;]                	{fprintf (yyout,"SEMI: \t\t;\n"); yylval.string=strdup(yytext); return SEMI;}
[%] 			{fprintf (yyout,"MOD: \t\t%s\n",yytext); yylval.string=strdup(yytext); return MOD;}
[{]                     {fprintf (yyout,"LEFT_CURLY: \t{\n"); yylval.string=strdup(yytext); return LEFT_CURLY;}
[}]                     {fprintf (yyout,"RIGHT_CURLY: \t}\n"); yylval.string=strdup(yytext); return RIGHT_CURLY;}
[(]                     {fprintf (yyout,"LEFT_BRAC: \t(\n"); yylval.string=strdup(yytext); return LEFT_BRAC;}
[)]                  	{fprintf (yyout,"RIGHT_BRAC: \t)\n"); yylval.string=strdup(yytext); return RIGHT_BRAC;}
[\[]                    {fprintf (yyout,"LEFT_SQBRAC: \t[\n"); yylval.string=strdup(yytext); return LEFT_SQBRAC;}
[\]]                    {fprintf (yyout,"RIGHT_SQBRAC: \t]\n"); yylval.string=strdup(yytext); return RIGHT_SQBRAC;}
[=][=]                  {fprintf (yyout,"COMPARE_EQUAL: ==\n"); yylval.string=strdup(yytext); return COMPARE_EQUAL;}
[<]                     {fprintf (yyout,"LESS_THAN: \t<\n"); yylval.string=strdup(yytext); return LESS_THAN;}
[>]                     {fprintf (yyout,"GREATER_THAN: \t>\n"); yylval.string=strdup(yytext); return GREATER_THAN;}
[<][=]                  {fprintf (yyout,"LESS_THAN_EQUAL: \t<=\n"); yylval.string=strdup(yytext); return LESS_THAN_EQUAL;}
[>][=]                  {fprintf (yyout,"GREATER_THAN_EQUAL: \t>=\n"); yylval.string=strdup(yytext); return GREATER_THAN_EQUAL;}
[!][=]                  {fprintf (yyout,"COMPARE_NOT_EQUAL: \t!=\n"); yylval.string=strdup(yytext); return COMPARE_NOT_EQUAL;}
[a-zA-Z_][a-zA-Z0-9_]*  {fprintf (yyout,"\nID : \t\t%s\n",yytext); yylval.string=strdup(yytext); return ID;}
[0-9]+(.)*[0-9]*        {fprintf(yyout,"NUM : \t\t%d\n",atoi(yytext));yylval.number=atoi(yytext);return NUM;} 
\/\/(.*)                 ;					
\/\*(.*\n*.*)\*\/        ;
%%







