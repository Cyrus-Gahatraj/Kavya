EXEC = kavya.out        
SOURCES = $(wildcard Src/*.c)
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
	@sudo cp $(EXEC) /usr/local/bin/$(EXEC)
	@sudo ln -sf /usr/local/bin/$(EXEC) /usr/local/bin/kavya

clean:
	@echo "Cleaning up..."
	@-rm -f $(EXEC) *.o ./Src/*.o

run:
	@./$(EXEC)

.PHONY: clean install run
