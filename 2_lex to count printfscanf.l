//Write a LEX program to count number of printf and scanf from a given c program file and replace them with write and read respectively.
%
{
    int printfCount = 0;
    int scanfCount = 0;
    %
}

% %
    "printf" { printfCount++; }
"scanf" { scanfCount++; }

% %

    int main()
{
    yylex();
    printf("Number of printf statements: %d\n", printfCount);
    printf("Number of scanf statements: %d\n", scanfCount);
    return 0;
}

/*
#include<stdio.h>
int pfc=0, sfc=0;
%}

%%
"printf" {fprintf(yyout,"writef"); pfc++;}
"scanf" {fprintf(yyout,"readf"); sfc++;}
%%

main(int argc, char *argv[])
{
if(argc!=3)
{
printf("Usage: ./a.out in.txt out.txt\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("\n the number of printf lines = %d\n",pfc);
printf("\n the number of scanf lines = %d\n",sfc);
}

int yywrap()
{
return 1;
}

OUTPUT :

>lex pscount.l
>cc lex.yy.c -ll
>./a.out in.txt
Usage: ./a.out in.txt out.txt


>./a.out in.txt out.txt
 the number of printf lines = 2
 the number of scanf lines = 1

CONTENTS OF IN.TXT FILE

#include<stdio.h>
int main()
{
int a,b,c;
printf("enter two numbers");
scanf("%d %d",&a,&b);
c=a+b;
printf("sum is %d",c);
return 0;
}

CONTENTS OF OUT.TXT FILE

#include<stdio.h>
int main()
{
int a,b,c;
writef("enter two numbers");
readf("%d %d",&a,&b);
c=a+b;
writef("sum is %d",c);
return 0;
}
*/