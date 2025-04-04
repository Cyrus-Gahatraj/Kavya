#include <stdio.h>
#include <string.h>

#include "kavya/main.h"
#include "kavya/scanner.h"

// External declarations from Flex
extern int yylex();
extern void yyrestart(FILE*);
extern FILE* yyin;
extern int yylineno;
extern Token current_token;

void initScanner(const char* source) {
    // Create a temporary file to hold the source
    FILE* temp = tmpfile();
    if (!temp) {
        fprintf(stderr, "Failed to create temporary file\n");
        return;
    }
    
    // Write source to temporary file
    fwrite(source, 1, strlen(source), temp);
    rewind(temp);
    
    // Set Flex input to the temporary file
    yyin = temp;
    yyrestart(yyin);
}

Token scanToken() {
    int token_type = yylex();
    if (token_type == 0) {  // EOF
        current_token.type = TOKEN_EOF;
        current_token.start = "";
        current_token.length = 0;
        current_token.line = yylineno;
    }
    return current_token;
}