This project is the completed second assignment for CS 410 - Compiler Construction at WVU. This code must requires the programs flex and bison in order to execute. It is recommended to install the LOUD VM located at https://lcseesystems.wvu.edu/services/loud. This VM can be opened using Virtual Box. Once inside the VM, run the following commands to install flex and bison:

```
sudo apt install flex
sudo apt install bison
```

With flex and bison installed, this project can be compiled using the Makefile with the following command:

```
make
````

If you would prefer to execute it without the Makefile, instead run:

```
bison -d calc.y
flex calc.l
gcc calc.tab.c lex.yy.c -o calc -lm
./calc
```
