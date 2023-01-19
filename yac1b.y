%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define YYDEBUG 1
#define char_tip
#define integer_tip
#define string_tip
int i; 
double vector[1000]; 
int yylex(void);
void yyerror(char *s);
double scoateVector(){
	return vector[--i];
}
void adaugaVector(double value)
{
     vector[i++]=value;
}
double returnVector(){
	return vector[i];
}
%}

%token INT_CT
%token STRING_CT
%token ARRAY
%token CONST
%token DO
%token FOR
%token ELSE
%token IF
%token INT
%token READ
%token THEN
%token VAR
%token WHILE
%token WRITE
%token TRUE
%token FALSE
%token IDENTIFIER
%token BOOLEAN
%token INTEGER
%token REAL
%token CHAR
%token DOUBLE
%token <i_val> IDENTIFIER
%token <p_val> INT_CT
%left '+' 
%left '-'
%left '*' 
%left '/'
%left '%'


%%

program : VAR decllist cmpdstmt {printf("1\n");} 
        ;
decllist : declaration {printf("2\n");}
        | declaration ';' decllist {printf("3\n");}
        ;
declaration : IDENTIFIER ':' type {printf("4\n");}
        ;

type : type1 {printf("5\n");}
		| arraydecl {printf("6\n");}
		;
type1 : BOOLEAN {printf("7\n");}
		| INTEGER {printf("8\n");}
		| REAL {printf("9\n");}
		| CHAR {printf("10\n");}
		| DOUBLE {printf("11\n");}
        ;
arraydecl : ARRAY '[' INT_CT ']' 'OF' type1 {printf("12\n");}

		;
cmpdstmt : '{' stmtlist '}' {printf("13\n");}
        ;
stmtlist : stmt {printf("14\n");}
		| stmt ';' stmtlist {printf("15\n");}
		;
stmt : simplstmt {printf("16\n");}
		| structstmt {printf("17\n");}
		;
simplstmt : assignstmt {printf("18\n");}
		      | iostmt {printf("19\n");}
		      ;
		      ;
assignstmt : IDENTIFIER ':=' expression {printf("20\n");}
	   | IDENTIFIER'['IDENTIFIER']' ':=' expression {printf("21\n");}
        ;

expression : expression '+' term {printf("22\n");}
	| term {printf("23\n");}
        | expression '-' term {printf("24\n");}
        ;
term : term '*' factor {printf("25\n");}
	| factor  {printf("26\n");}
        | term '/' factor {printf("27\n");}
        | term '%' factor {printf("28\n");}
        ;
factor: '(' expression ')'  {printf("29\n");}
        | IDENTIFIER {printf("30\n");}
	| INT_CT {printf("31\n");}
	| STRING_CT  {printf("32\n");}
       
        ;
iostmt : READ '(' IDENTIFIER ')' {printf("33\n");}
	| WRITE '(' IDENTIFIER ')' {printf("34\n");}
        ;

structstmt : cmpdstmt {printf("35\n");}
        | whilestmt {printf("37\n");}
        | dowhilestmt {printf("38\n");}
        | forstmt {printf("39\n");}
        ;

        
whilestmt : WHILE  '(' condition ')' stmt {printf("41\n");}
        ;
dowhilestmt : DO stmt WHILE '(' condition ')' {printf("42\n");}
        ;
forstmt : FOR  '(' condition ')' stmt {printf("43\n");}
		;
condition : expression  relation expression {printf("44\n");}
        ;
relation : '<' {printf("45\n");}
        | '<=' {printf("46\n");}
        | '=' {printf("47\n");}
        | '>=' {printf("48\n");}
        | '>' {printf("49\n");}
        ;

%%

%%

void yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
}

