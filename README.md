This project is the completed second assignment for CS 410 - Compiler Construction at WVU. This code must requires the programs flex and bison in order to execute. It is recommended to install the LOUD VM located at https://lcseesystems.wvu.edu/services/loud. This VM can be opened using Virtual Box. Once inside the VM, run the following commands to install flex and bison:

```
sudo apt install flex
sudo apt install bison
```

With flex and bison installed, this project can be compiled using the Makefile with the following command:

```
make
````

If you would prefer to compile it without the Makefile, instead run:

```
bison -d calc.y
flex calc.l
gcc calc.tab.c lex.yy.c -o calc -lm
```

Once the program is compiled, it can be executed with the following command:

```
./calc
```

Alternatively, if you would like to execute it using the set of given inputs to test the assignment from the assignment doc, execute by running:

```
cat inputs.txt | ./calc
```

***PLEASE NOTE***: If you are executing the program without the input file, you *MUST* enter the 'q' key in order to terminate execution and have the values of each of the variables printed to the screen. There is a special production statement for 'q' followed by a newline ('\n') that will terminate execution of the program and call a function to display the values of each of the variables.