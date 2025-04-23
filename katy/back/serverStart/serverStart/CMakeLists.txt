cmake_minimum_required(VERSION 3.10)
project(DocxFormatterServer)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


set(MZ_BZIP2 OFF CACHE BOOL "Disable bzip2" FORCE)
set(MZ_LZMA OFF CACHE BOOL "Disable LZMA" FORCE)
set(MZ_ZSTD OFF CACHE BOOL "Disable Zstd" FORCE)

add_subdirectory(libs/tinyxml2)
add_subdirectory(libs/minizip)


include_directories(
    include
    libs/tinyxml2
    libs/minizip  
)


add_executable(serverStart
    serverStart.cpp
    formatter.cpp
)

# Линковка библиотек
target_link_libraries(serverStart PRIVATE
    tinyxml2
    minizip
)