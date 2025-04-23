cmake_minimum_required(VERSION 3.10)
project(DocxFormatterServer)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

# Поддержка vcpkg пакетов
find_package(tinyxml2 CONFIG REQUIRED)
find_package(unofficial-minizip CONFIG REQUIRED)

add_executable(serverStart
    serverStart.cpp
    formatter.cpp
)

# Линкуем библиотеки
target_link_libraries(serverStart PRIVATE tinyxml2 unofficial::minizip::minizip)
