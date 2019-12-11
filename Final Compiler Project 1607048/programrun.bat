flex main.l
bison -d main.y
gcc lex.yy.c main.tab.c -o app
app