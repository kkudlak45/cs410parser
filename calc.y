%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

char identifier_map[5];

void yyerror(const char* s);
void exit_normally(void);
void show_all_vars(void);
%}

%union {
	int num;
	char str;
}

%token<num> NUM
%token<str> IDENTIFIER

%token PLUS MINUS LEFT_PAREN RIGHT_PAREN EQUALS
%token ADD TO SUBTRACT FROM
%token GIVING
%token NEWLINE QUIT

%left PLUS MINUS
%left TO FROM
%left EQUALS GIVING

%type<str> assignment_statement
%type<num> expression
%type<num> value

%start calculation

%%

calculation:
	   | calculation line
;

line: NEWLINE
	| assignment_statement NEWLINE { printf("\tResult: %c = %i\n", $1, identifier_map[$1 - 'A']); }
    | QUIT NEWLINE { printf("quitting... \n"); exit_normally(); }
;

assignment_statement: IDENTIFIER EQUALS expression { identifier_map[$1 - 'A'] = $3; $$ = $1; }
	| expression GIVING IDENTIFIER { identifier_map[$3 - 'A'] = $1; $$ = $3; }
;

expression: value				             { $$ = $1; }
	  | expression PLUS  expression	         { $$ = $1 + $3; }
	  | ADD expression TO expression         { $$ = $4 + $2; }
	  | expression MINUS expression	         { $$ = $1 - $3; }
	  | SUBTRACT expression FROM expression  { $$ = $4 - $2; }
	  | LEFT_PAREN expression RIGHT_PAREN	 { $$ = $2; }
;

value: NUM          { $$ = $1;}
	  | IDENTIFIER  { $$ = identifier_map[$1 - 'A']; }
;

%%

int main() {
	yyin = stdin;

	for (int i = 0; i < 5; i++)
		identifier_map[i] = 0;

	do {
		yyparse();
	} while(!feof(yyin));

	show_all_vars();

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Error: %s\n", s);
	exit(-1);
}

void show_all_vars() {
	for (int i = 0; i < 5; i++)
		printf("\n%c = %i", i+'A', identifier_map[i]);
	printf("\n");
}

void exit_normally() {
	show_all_vars();
	exit(0);
}
