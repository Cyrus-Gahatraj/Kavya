EXEC = kavya.out
INSTALL_PATH = /usr/local/bin/kavya
SOURCES = $(wildcard Src/*.c)
OBJECTS = $(SOURCES:.c=.o)
FLAGS = -g

.DEFAULT_GOAL := install

$(EXEC): $(OBJECTS)
	@echo "Linking $(EXEC)..."
	@gcc $(OBJECTS) $(FLAGS) -o $(EXEC)

%.o: %.c include/%.h
	@echo "Compiling $<..."
	@gcc -c $(FLAGS) $< -o $@

install: $(EXEC)
	@echo "Installing/Updating $(EXEC) to $(INSTALL_PATH)"
	@sudo cp $(EXEC) $(INSTALL_PATH)

clean:
	@echo "Cleaning up..."
	@-rm -f $(EXEC) Src/*.o

run: $(EXEC)
	@./$(EXEC)

.PHONY: clean install run
