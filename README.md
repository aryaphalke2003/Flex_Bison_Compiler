# Flex & Bison
A compiler which does lexical analysis and syntax analysis of given sample.cu code file as per the grammar mentioned in the cucu.y file which basically is yacc file and we used bison command to run the same. Similarly lexical analyser cucu.l sort the file in tokens. Lexer.txt file has all the tokens & Parser.txt file contains any errors and lines of code parsed.

For this we created cucu.l and cucu.y (lex and yacc) files according to the general few C grammar rules.

Team: Arya (2020CSB1107) & Shyam (2020CSB1110)

# Commands
bison -d cucu.y <br />
lex cucu.l <br />
g++ cucu.tab.c lex.yy.c -lfl -o cucu <br />
./cucu sample.cu <br />

# Input Files
sample.cu <br />
cucu.l <br />
cucu.y <br />

# Output Files
cucu.tab.h <br />
cucu.tab.c <br />
cucu <br />
Lexer.txt <br />
Parser.txt <br />
