%{
#include <stdio.h>
#include <string.h>
#include "kavya/main.h"
#include "kavya/scanner.h"

// Global token storage
Token current_token;

// Function to create a token and return its type
int make_token(TokenType type, const char* text, int len) {
    current_token.type = type;
    current_token.start = text;
    current_token.length = len;
    current_token.line = yylineno;
    return type;
}

// Function to create an error token and return its type
int error_token(const char* message) {
    current_token.type = TOKEN_ERROR;
    current_token.start = message;
    current_token.length = strlen(message);
    current_token.line = yylineno;
    return TOKEN_ERROR;
}
%}

%option noyywrap
%option yylineno
%option nounput
%option noinput

DIGIT       [0-9]
ALPHA       [a-zA-Z_]
ALNUM       [a-zA-Z0-9_]
WHITESPACE  [ \t\r]
NEWLINE     \n

%%

{WHITESPACE}+       /* Skip whitespace */
"//".*              /* Skip comments */
{NEWLINE}           { return make_token(TOKEN_NEWLINE, yytext, yyleng); }

"("                 { return make_token(TOKEN_LEFT_PAREN, yytext, yyleng); }
")"                 { return make_token(TOKEN_RIGHT_PAREN, yytext, yyleng); }
"{"                 { return make_token(TOKEN_LEFT_BRACE, yytext, yyleng); }
"}"                 { return make_token(TOKEN_RIGHT_BRACE, yytext, yyleng); }
","                 { return make_token(TOKEN_COMMA, yytext, yyleng); }
"."                 { return make_token(TOKEN_DOT, yytext, yyleng); }
"-"                 { return make_token(TOKEN_MINUS, yytext, yyleng); }
"+"                 { return make_token(TOKEN_PLUS, yytext, yyleng); }
":"                 { return make_token(TOKEN_COLON, yytext, yyleng); }
"/"                 { return make_token(TOKEN_SLASH, yytext, yyleng); }
"*"                 { return make_token(TOKEN_STAR, yytext, yyleng); }
";"                 { return make_token(TOKEN_SEMICOLON, yytext, yyleng); }

"!"                 { return make_token(TOKEN_BANG, yytext, yyleng); }
"!="                { return make_token(TOKEN_BANG_EQUAL, yytext, yyleng); }
"="                 { return make_token(TOKEN_EQUAL, yytext, yyleng); }
"=="                { return make_token(TOKEN_EQUAL_EQUAL, yytext, yyleng); }
">"                 { return make_token(TOKEN_GREATER, yytext, yyleng); }
">="                { return make_token(TOKEN_GREATER_EQUAL, yytext, yyleng); }
"<"                 { return make_token(TOKEN_LESS, yytext, yyleng); }
"<="                { return make_token(TOKEN_LESS_EQUAL, yytext, yyleng); }

\"[^"\n]*\"         { return make_token(TOKEN_STRING, yytext, yyleng); }
{DIGIT}+            { return make_token(TOKEN_NUMBER, yytext, yyleng); }
{DIGIT}+"."{DIGIT}+ { return make_token(TOKEN_NUMBER, yytext, yyleng); }

"and"               {  return make_token(TOKEN_AND, yytext, yyleng); }
"class"             { return make_token(TOKEN_CLASS, yytext, yyleng); }
"else"              { return make_token(TOKEN_ELSE, yytext, yyleng); }
"false"             { return make_token(TOKEN_FALSE, yytext, yyleng); }
"for"               { return make_token(TOKEN_FOR, yytext, yyleng); }
"purpose"           { return make_token(TOKEN_PURPOSE, yytext, yyleng); }
"if"                { return make_token(TOKEN_IF, yytext, yyleng); }
"null"              { return make_token(TOKEN_NULL, yytext, yyleng); }
"or"                { return make_token(TOKEN_OR, yytext, yyleng); }
"write"             { return make_token(TOKEN_WRITE, yytext, yyleng); }
"ask"               { return make_token(TOKEN_ASK, yytext, yyleng); }
"return"            { return make_token(TOKEN_RETURN, yytext, yyleng); }
"super"             { return make_token(TOKEN_SUPER, yytext, yyleng); }
"this"              { return make_token(TOKEN_THIS, yytext, yyleng); }
"true"              { return make_token(TOKEN_TRUE, yytext, yyleng); }
"the"               { return make_token(TOKEN_THE, yytext, yyleng); }
"while"             { return make_token(TOKEN_WHILE, yytext, yyleng); }

{ALPHA}{ALNUM}*     { return make_token(TOKEN_IDENTIFIER, yytext, yyleng); }

.                   { return error_token("Unexpected character"); }

%% 