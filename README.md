# Flex & Bison
A compiler which does lexical analysis and syntax analysis of given sample.cu code file as per the grammar mentioned in the cucu.y file which basically is yacc file and we used bison command to run the same. Similarly lexical analyser cucu.l sort the file in tokens. Lexer.txt file has all the tokens & Parser.txt file contains any errors and lines of code parsed.

For this I created cucu.l and cucu.y (lex and yacc) files according to the general few C grammar rules.

# Commands
bison -d cucu.y
lex cucu.l
g++ cucu.tab.c lex.yy.c -lfl -o cucu
./cucu sample.cu

# Input Files
sample.cu
cucu.l 
cucu.y

# Output Files
cucu.tab.h
cucu.tab.c
cucu
Lexer.txt
Parser.txt
