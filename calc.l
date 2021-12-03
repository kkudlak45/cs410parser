%option noyywrap

%{
#include <stdio.h>

#define YY_DECL int yylex()

#include "calc.tab.h"

%}

%%

[ \t]	; // ignore all whitespace
[0-9]+		{yylval.num = atoi(yytext); return NUM;}
[ABCDE] {yylval.str = *yytext; return IDENTIFIER;}

\n		{return NEWLINE;}
"+"		{return PLUS;}
"-"		{return MINUS;}
"("		{return LEFT_PAREN;}
")"		{return RIGHT_PAREN;}
"="     {return EQUALS;}
"q"		{return QUIT;}

"GIVING"   {return GIVING;}
"ADD"      {return ADD;}
"SUBTRACT" {return SUBTRACT;}
"TO"       {return TO;}
"FROM"     {return FROM;}
"to"       {return TO;}
"from"     {return FROM;}

 
%%
