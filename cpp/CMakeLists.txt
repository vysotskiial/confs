cmake_minimum_required(VERSION 3.1)
project(name VERSION 1.0)

find_package(Package REQUIRED)
find_package( REQUIRED)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wshadow -Werror")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(target SOURCES)

target_include_directories(target PRIVATE include)
target_link_libraries(target LIBS)
