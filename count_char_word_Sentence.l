%{
#include<stdio.h>
#include<string.h>

int word_count = 0;
int space_count = 0;
int line_count = 1;
int char_count = 0;
%}

%%

[\t ]      { space_count++; }

\n         { line_count++; }

[^\n\t ]+          { word_count++; char_count+=strlen(yytext); }

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

    yyin = input_file;

    yylex();

    printf("Word count: %d\n", word_count);
    printf("Space count: %d\n", space_count);
    printf("Line count: %d\n", line_count);
    printf("Character count: %d\n", char_count);

    fclose(input_file);

    return 0;
}

