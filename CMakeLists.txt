cmake_minimum_required(VERSION 3.10)

project(kavya C)

set(CMAKE_C_FLAGS "-g -O2 -DNDEBUG -Wall -Wextra -Wpedantic -Werror -march=native -flto -fstack-protector-strong -D_FORTIFY_SOURCE=2")

# Find Flex package
find_package(FLEX REQUIRED)

# Add the include directory
include_directories(include)

# Generate lexer
flex_target(kavya_lexer src/lex/lexer.l ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.c)

# Add the lexer source to the sources list
file(GLOB SOURCES "src/*.c")
add_executable(kavya ${SOURCES} ${FLEX_kavya_lexer_OUTPUTS})

# Install the binary as 'kavya'
install(TARGETS kavya DESTINATION /usr/local/bin)

add_custom_target(run
    COMMAND ./kavya
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running kavya"
    VERBATIM
)

add_custom_target(debug
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target kavya
    COMMAND ${CMAKE_COMMAND} -E echo "Debug build complete."
    COMMENT "Building in debug mode"
)

set_target_properties(debug PROPERTIES CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDEBUG")

add_dependencies(debug kavya)

# Reinstall target: Removes old installation and reinstalls
add_custom_target(reinstall
    COMMAND sudo rm -f /usr/local/bin/kavya
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target install
    COMMENT "Reinstalling kavya..."
    VERBATIM
)
