%{
int s=0;
int l=0;
int w=0;
int t=0;
%}

%%
[ ]  { s++; }
[\n]      { l++; }
[\t] {t++}
[A-Za-z0-9]* {w++}

%%
int yywrap();
int main() {
    printf("enter a string:");
    yylex();
    printf("s=%d\n............)
    return 0; 
}