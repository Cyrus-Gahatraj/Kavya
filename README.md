# Kavya: Programming Language

Kavya is a dynamically typed, open-source programming language designed with easy-to-understand code in mind. It features a clean and concise syntax similar to pseudocode, making it a great choice for beginners or those looking for a lightweight scripting language.

### Derived from:

Kavya is derived from Clox, the C implementation of the Lox language from the book _`Crafting Interpreters`_ by Robert Nystrom. This project extent and adapt the structure and behaviour from Clox to offer extra feature with personal touch.

## Features

- **`Simple Syntax`**: Kavya's syntax is designed to be easy to read and write, making it intuitive for both new and experienced programmers.
- **`Dynamic typing`**: Kavya allows you to use variables without explicitly declaring their types, providing flexibility in your code.
- **`Garbage collector`**: Kavya automatically manages memory allocation and deallocation, simplifying memory management for developers.
- **`REPL`**: Kavya includes a REPL (Read-Eval-Print Loop) feature that allows you to interact with the language in real-time, without writing and saving entire scripts.

## Installation Process (Current Development status):

Kavya is currently under active development, offical installation process is not available yet.
However, we can compile the code from source with the help of some tools.

## Prerequisites

* **GCC (C compiler):** Required for compiling the C source code.
* **CMake:** Used for building the project.

## Building Kavya from Source

1.  **Clone the Repository:**

    ```bash
    git clone https://github.com/Cyrus-Gahatraj/Kavya.git
    cd Kavya
    ```

2.  **Create a Build Directory and Generate Build Files:**

    ```bash
    mkdir build
    cd build
    cmake ..
    ```

3.  **Build the Executable:**

    ```bash
    make
    ```

4.  **Install (Optional):**

    ```bash
    sudo make install #Installs to /usr/local/bin
    ```

## Running Kavya

* **Run the REPL (Read-Eval-Print Loop):**

    ```bash
    ./kavya.out  #If not installed. If installed just use kavya
    ```
    or
    ```bash
    kavya #If installed
    ```

* **Run a Specific Kavya File:**

    ```bash
    ./kavya.out <file.kav> #If not installed. If installed just use kavya
    ```
    or
    ```bash
    kavya <file.kav> #if installed.
    ```

## Notes

* Ensure that you have the necessary dependencies installed before attempting to build Kavya.
* The `sudo make install` command requires administrator privileges.
* The kavya.out file is located in the build directory, if you do not install.
* As Kavya is under active development, expect changes and updates.
* If you have installed Kavya, you can use the command "kavya" from any directory.

## Demo

#### 1) Hello World

Printing "Hello World" to the screen.

```kavya
    write "Hello World".  // Output: Hello World
```

#### 2) Variables

In Kavya variables are declare from **`the`** keyword and can be assign with with **`'='`** or **`is`**.

```kavya
    the programming = "boring".
    the rose is "red".
    the sky is "blue".
```

#### 3) Taking input from user

To take input from the user in kavya, use the **`ask`** keyword followed by the prompt message in quotes.

```kavya
   the love is (ask "What's your love?: "). // Input: You
```

In Kavya, user input is stored as a string by default, ensuring simplicity and consistency in handling input data. However, future updates will introduce support for data type conversion, allowing developers to work seamlessly with different types of input.

#### 4) Printing statenments with variables

In Kavya we can print a statement that includes a variable by using the **`+`** symbol to concatenate the text and variable value.

```kavya
    write "Roses are " + rose + " Sky is " + sky + " Programming is " + programming + " without " + love.

    // Output: Roses are red Sky is blue Programming is boring without You
```

## Contributing

Contributions are always welcome!

See `contributing.md` file (if it exits) for ways to get started.

## License

Licensed under the [MIT](https://choosealicense.com/licenses/mit/)

## Acknowledgements

- Inspired by [Crafting Interpreters](https://craftinginterpreters.com/) by Robert Nystrom.
