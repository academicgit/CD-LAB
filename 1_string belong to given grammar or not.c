// To Check Weather a String Belongs to a Given Grammer or not
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    char str[10];
    printf("The grammar is as follows:\nS -> aS\nS -> Sb\nS -> ab\n");
    printf("Enter a string: ");
    scanf("%s", str);

    if (str[0] != 'a')
    {
        printf("String is invalid because of incorrect first character\n");
        exit(0);
    }

    int n = 1;
    while (str[n] == 'a')
        n++;

    if (str[n] != 'b')
    {
        printf("String does not belong to grammar\n");
        exit(0);
    }

    n++;
    while (str[n] == 'b')
        n++;

    if (str[n] != '\0')
    {
        printf("String does not belong to grammar\n");
        exit(0);
    }

    printf("String is valid\n");

    return 0;
}