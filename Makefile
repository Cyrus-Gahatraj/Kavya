EXEC = kavya.out
SOURCES = $(wildcard src/*.c)
OBJECTS = $(SOURCES:.c=.o)
FLAGS = -g

.DEFAULT_GOAL := $(EXEC)

$(EXEC): $(OBJECTS)
	@echo "Linking $(EXEC)..."
	@gcc $(OBJECTS) $(FLAGS) -o $(EXEC)

%.o: %.c include/%.h
	@echo "Compiling $<..."
	@gcc -c $(FLAGS) $< -o $@

install:
	@echo "Installing $(EXEC) to /usr/local/bin..."
	@make
	@cp ./kavya.out /usr/local/bin/kavya

clean:
	@echo "Cleaning up..."
	@-rm -f $(EXEC) *.out src/*.o

run:
	@./$(EXEC)

.PHONY: clean install run