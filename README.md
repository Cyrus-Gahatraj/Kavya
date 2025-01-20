# Kavya: Programming Language

Kavya is a dynamically typed, open-source programming language designed with easy-to-understand code in mind. It features a clean and concise syntax similar to pseudocode, making it a great choice for beginners or those looking for a lightweight scripting language.

### Derived from:

Kavya is derived from Clox, the C implementation of the Lox language from the book _`Crafting Interpreters`_ by Robert Nystrom. This project extent and adapt the structure and behaviour from Clox to offer extra feature with personal touch.

## Features

- **_`Simple Syntax`_**: Kavya's syntax is designed to be easy to read and write, making it intuitive for both new and experienced programmers.
- **_`Dynamic typing`_**: Kavya allows you to use variables without explicitly declaring their types, providing flexibility in your code.
- **_`Grabage collector`_**: Kavya automatically manages memory allocation and deallocation, simplifying memory management for developers.
- **_`REPL`_**: Kavya includes a REPL (Read-Eval-Print Loop) feature that allows you to interact with the language in real-time, without writing and saving entire scripts.

## Installation Process (Current Development stage):


Kavya is currently under active development, offical installation process is not available yet.
However, we can compile the code from source with the help of some tools.

### Prerequisites:

- **`GCC (C compiler)`**
- **`Makefile`**

### Building kavya from source

1. Clone the repository

```bash
  git clone https://github.com/Cyrus-Gahatraj/Kavya.git
  cd Kavya
```

2. Building

```bash
    make
```

3. Running

```bash
    kavya            #Run Kavya REPL
    kavya <file.kav> #Run a specific Kavya file
```

## Demo

#### 1) Hello World

Printing "Hello World" to the screen.

```kavya
    write "Hello World";  // Output: Hello World
```

#### 2) Variables

In Kavya variables are declare from **`the`** keyword and can be assign with with **`'='`** or **`is`**.

```kavya
    the programming is "boring";
    the rose is "red";
    the sky is "blue";
```

#### 3) Taking input from user
To take input from the user in kavya, use the **`ask`** keyword followed by the prompt message in quotes.
```kavya
   the love is (ask "What's your love?: "); // Input: You
```
In Kavya, user input is stored as a string by default, ensuring simplicity and consistency in handling input data. However, future updates will introduce support for data type conversion, allowing developers to work seamlessly with different types of input.



#### 4) Printing statenments with variables
In Kavya we can print a statement that includes a variable by using the **`+`** symbol to concatenate the text and variable value.

```kavya
   the you is (ask "Who are you?"); // Input: Poet
   write "Hello " +  you + " Plus Programmer";

   //Output: Hello Poet Plus Programmer
```

## Contributing

Contributions are always welcome!

See `contributing.md` file (if it exits) for ways to get started.

## License

Licensed under the [MIT](https://choosealicense.com/licenses/mit/)

## Acknowledgements


- Inspired by [Crafting Interpreters](https://craftinginterpreters.com/) by Robert Nystrom.
