cmake_minimum_required(VERSION 3.10)
project(DocxFormatterServer)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Настройки minizip
set(MZ_BZIP2 OFF CACHE BOOL "Disable bzip2" FORCE)
set(MZ_LZMA OFF CACHE BOOL "Disable LZMA" FORCE)
set(MZ_ZSTD OFF CACHE BOOL "Disable Zstd" FORCE)

# Добавление директорий с библиотеками
add_subdirectory(libs/tinyxml2)
add_subdirectory(libs/minizip)

# Для nlohmann/json (header-only библиотека)
add_subdirectory(libs/json)

# Для cpp-httplib (header-only библиотека)
add_subdirectory(libs/cpp-httplib)

# Подключаем заголовочные файлы
include_directories(
        include
        libs/tinyxml2
        libs/minizip
        libs/json/include  # Путь к json.hpp
        libs/cpp-httplib   # Путь к httplib.h
)

# Основной исполняемый файл
add_executable(serverStart
        serverStart.cpp
        formatter.cpp
)

# Копирование frontend-файлов в бинарную директорию
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/front DESTINATION ${CMAKE_BINARY_DIR})

# Линковка библиотек
target_link_libraries(serverStart PRIVATE
        tinyxml2
        minizip
        nlohmann_json::nlohmann_json  # Для nlohmann/json
        httplib                       # Для cpp-httplib
        stdc++fs  # Для работы с filesystem
        $<$<PLATFORM_ID:Windows>:ws2_32>  # Для cpp-httplib на Windows
        $<$<PLATFORM_ID:Windows>:crypt32>
)