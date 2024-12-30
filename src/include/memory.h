#ifndef MEMORY_H
#define MEMORY_H

#include "main.h"

#define GROW_CAPACITY(capacity) \
    ((capacity) < 16 ? 16 : (capacity) * 1.5)

#define GROW_ARRAY(type, pointer, oldCount, newCount) \
    (type*) reallocate(pointer, sizeof(type) * (oldCount), \
    sizeof(type) * (newCount))

#define FREE_ARRAY(type, pointer, oldCount) \
    reallocate(pointer, sizeof(type)*(oldCount), 0)

void* reallocate(void* pointer, size_t oldSize, size_t newSize);

#endif