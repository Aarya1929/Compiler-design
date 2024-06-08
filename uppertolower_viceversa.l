%{
#include <stdio.h>
#include <ctype.h>
%}

%%
[A-Z]    { putchar(yytext[0] + 32); } //ASCII
[a-z]    { putchar(yytext[0] - 32); } 
.        { putchar(yytext[0]); }
%%

int yywrap()
{
    return 1;
} 

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s input_file\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        printf("Error opening the file.\nEnter text:\n");
        yyin = stdin;
    }
    else {
        yyin = input_file;
    }

    yylex();
    
    fclose(input_file);

    return 0;
}

/*[a-z] printf("%c", yytext[0]-('a'-'A')); //Mapping
[A-Z] printf("%c", yytext[0]-('A'-'a'));

[A-Z]    { putchar(tolower(yytext[0])); } // In-built function
[a-z]    { putchar(toupper(yytext[0])); } 
.        { putchar(yytext[0]); } */
