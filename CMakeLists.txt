cmake_minimum_required(VERSION 3.10)

project(kavya C)

set(CMAKE_C_FLAGS "-g")

# Add the include directory
include_directories(include)

file(GLOB SOURCES "src/*.c")

add_executable(kavya.out ${SOURCES})

install(TARGETS kavya.out DESTINATION /usr/local/bin)

add_custom_target(run
    COMMAND ./kavya.out
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    COMMENT "Running kavya.out"
    VERBATIM
)

add_custom_target(debug
    COMMAND ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target kavya.out
    COMMAND ${CMAKE_COMMAND} -E echo "Debug build complete."
    COMMENT "Building in debug mode"
)

set_target_properties(debug PROPERTIES CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDEBUG")

add_dependencies(debug kavya.out)