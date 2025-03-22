#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "kavya/main.h"
#include "kavya/chunk.h"
#include "kavya/debug.h"
#include "kavya/vm.h"

// Function to check if the file has the .kav extension
static int hasKavExtension(const char *path)
{
    size_t len = strlen(path);
    if (len < 4)
        return 0;
    return strcmp(path + len - 4, ".kav") == 0;
}

static char *readFile(const char *path)
{
    FILE *file = fopen(path, "rb");
    if (file == NULL)
    {
        fprintf(stderr, "Could not open file \"%s\".\n", path);
        exit(74);
    }

    fseek(file, 0L, SEEK_END);
    size_t fileSize = ftell(file);
    rewind(file);

    char *buffer = (char *)malloc(fileSize + 1);
    if (buffer == NULL)
    {
        fprintf(stderr, "Not enough memory to read \"%s\".\n", path);
        exit(74);
    }
    size_t bytesRead = fread(buffer, sizeof(char), fileSize, file);
    if (bytesRead < fileSize)
    {
        fprintf(stderr, "Could not read file \"%s\".\n", path);
        exit(74);
    }
    buffer[bytesRead] = '\0';

    fclose(file);
    return buffer;
}

static void runFile(const char *path)
{
    char *source = readFile(path);
    InterpretResult result = interpret(source);
    free(source);

    if (result == INTERPRET_COMPILE_ERROR)
        exit(65);
    if (result == INTERPRET_RUNTIME_ERROR)
        exit(70);
}

static void repl()
{
    char line[1024];
    for (;;)
    {
        printf("(Kavya)→ ");

        if (!fgets(line, sizeof(line), stdin))
        {
            printf("\n");
            break;
        }

        line[strcspn(line, "\n")] = '\0';

        if (strcmp(line, "exit") == 0)
        {
            printf("Exiting...\nGoodbye!\n");
            break;
        }
        interpret(line);
    }
}

int main(int argc, const char *argv[])
{
    initVM();

    if (argc == 1)
    {
        // Start the REPL if no file argument is provided
        repl();
    }
    else if (argc == 2)
    {
        const char *filePath = argv[1];

        // Check if the file has the .kav extension
        if (hasKavExtension(filePath))
        {
            runFile(filePath);
        }
        else
        {
            fprintf(stderr, "Unsupported file type. Please use a .kav file.\n");
            exit(64);
        }
    }
    else
    {
        fprintf(stderr, "Usage: kavya [path to .kav file]\n");
        exit(64);
    }

    freeVM();
    return 0;
}
