EXEC = kavya.out
INSTALL_PATH = /usr/local/bin/kavya

SOURCES = $(wildcard src/*.c)
OBJECTS = $(SOURCES:.c=.o)


CC = gcc
CFLAGS = -g -Iinclude  
LDFLAGS =
.DEFAULT_GOAL := install

$(EXEC): $(OBJECTS)
	@echo "Linking $(EXEC)..."
	@$(CC) $(OBJECTS) $(LDFLAGS) -o $(EXEC)

src/%.o: src/%.c
	@echo "Compiling $<..."
	@$(CC) -c $(CFLAGS) $< -o $@

install: $(EXEC)
	@echo "Installing $(EXEC) to $(INSTALL_PATH)..."
	@sudo cp $(EXEC) $(INSTALL_PATH)

clean:
	@echo "Cleaning up..."
	@rm -f $(EXEC) src/*.o

run: $(EXEC)
	@./$(EXEC)

debug: CFLAGS += -DDEBUG
debug: clean $(EXEC)

.PHONY: clean install run debug
