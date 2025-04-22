# Указываем минимальную версию CMake
cmake_minimum_required(VERSION 3.10)

# Устанавливаем имя проекта
project(MyProject)

# Указываем стандарт C++
set(CMAKE_CXX_STANDARD 11)

# Добавляем исполнимый файл
add_executable(main main.cpp)
