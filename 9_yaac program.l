// 9. Write a YACC program to recognize the grammer [anb/n>0] . Test whether the following string belongs to this grammer.  

// Lexical Analyzer Source Code :

%{
   /* Definition section */
  #include "y.tab.h"
 %}
  
/* Rule Section */
 %%
[aA] {return A;}
[bB] {return B;}
\n {return NL;}
.  {return yytext[0];}
%%
  
int yywrap() 
 { 
  return 1; 
 } 
Parser Source Code :

%{
   /* Definition section */
   #include<stdio.h>
   #include<stdlib.h>
%}
  
%token A B NL
  
/* Rule Section */
%%
stmt: S NL  { printf("valid string\n");
              exit(0); }
;
S: A S B |
;
%%
  
int yyerror(char *msg)
 {
  printf("invalid string\n");
  exit(0);
 }
  
//driver code 
main()
 {
  printf("enter the string\n");
  yyparse();
 }