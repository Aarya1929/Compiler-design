DIGIT [0-9]
HEX_DIGIT [0-9A - Fa-f]

%{
#include<stdio.h>
%}

%%
{DIGIT}+    {
                int decimal = atoi(yytext);
                printf("%X\n", decimal);
              }
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
            printf("Error opening the file.\nEnter decimal number:\n");
            yyin = stdin;
        }
        else {
            yyin = input_file;
        }
    
        yylex();
        
        fclose(input_file);
    
        return 0;
}
