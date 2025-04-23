cmake_minimum_required(VERSION 3.10)
project(DocxFormatterServer)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Включаем директории
include_directories(include)

# tinyxml2 и minizip должны быть установлены на системе или лежать в папке
find_library(TINYXML2_LIB tinyxml2)
find_library(MINIZIP_LIB minizip)

# Источники
add_executable(server
    serverStart.cpp
    formatter.cpp
)

# Линки
target_link_libraries(server ${TINYXML2_LIB} ${MINIZIP_LIB})
