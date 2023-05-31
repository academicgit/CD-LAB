%
{
    int v = 0;
    int c = 0;
    %
}

% %
    [aAeEiIoOuU]
{ v++; }
        [a - zA - Z] { c++; }
% %

    int main()
{
    yylex();
    printf("Number of vowels: %d\n", v);
    printf("Number of consonants: %d\n", c);
    return 0;
}


// flex filename.l
// gcc lex.yy.c -lfl
// ./a.out