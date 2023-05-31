// 3. Write a program to check whether a grammar is left recursive and remove left recursion.

#include <stdio.h>
#include <string.h>

#define MAX_RULES 10
#define MAX_SYMBOLS 10

void removeLeftRecursion(char grammar[MAX_RULES][MAX_SYMBOLS], int numRules)
{
    char updatedGrammar[MAX_RULES][MAX_SYMBOLS * 2]; // Allowing extra space for the updated grammar
    int updatedRules = 0;

    for (int i = 0; i < numRules; i++)
    {
        char nonTerminal = grammar[i][0];
        char production[MAX_SYMBOLS];
        strcpy(production, grammar[i]);

        if (production[3] == nonTerminal)
        {
            // Left recursion found
            char updatedNonTerminal = 'A' + updatedRules;

            // Remove left recursion from the production
            memmove(production, production + 4, strlen(production) - 3);

            // Add new productions without left recursion
            // A -> Ab | c  will become A -> cA'
            sprintf(updatedGrammar[updatedRules], "%c%s%c'", nonTerminal, production, updatedNonTerminal);
            updatedRules++;

            // Add new productions for A'
            // A' -> bA' | ε
            sprintf(updatedGrammar[updatedRules], "%c'->%s%c'|ε", updatedNonTerminal, production, updatedNonTerminal);
            updatedRules++;
        }
        else
        {
            // No left recursion found, copy the original production
            strcpy(updatedGrammar[updatedRules], production);
            updatedRules++;
        }
    }

    printf("Updated Grammar:\n");
    for (int i = 0; i < updatedRules; i++)
    {
        printf("%s\n", updatedGrammar[i]);
    }
}

int main()
{
    char grammar[MAX_RULES][MAX_SYMBOLS];
    int numRules;

    printf("Enter the number of rules in the grammar: ");
    scanf("%d", &numRules);

    printf("Enter the grammar rules:\n");
    for (int i = 0; i < numRules; i++)
    {
        scanf("%s", grammar[i]);
    }

    printf("Removing left recursion...\n");
    removeLeftRecursion(grammar, numRules);

    return 0;
}