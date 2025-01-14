#ifndef COMPILER_H
#define COMPILER_H

#include "vm.h"
#include "object.h"

bool compile(const char* source, Chunk* chunk);

#endif