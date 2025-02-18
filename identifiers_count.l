digit [0-9]
letter [A-Za-z]

%{
    int count;
%}

%%

{letter}({letter}|{digit})* {count++; }

%%

int yywrap() {
    return 1; // Indicates that there are no more input files to process
}

int main(void)
{
    yylex();
    printf("number of identifiers = %d\n", count);
    return 0;
}
