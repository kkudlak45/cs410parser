A small example of a calculator written with flex / bison.

In order to compile with the Makefile, run:

`make`

If you would prefer to execute it manually, run:

```
bison -d calc.y
flex calc.l
gcc calc.tab.c lex.yy.c -o calc -lm
./calc
```
