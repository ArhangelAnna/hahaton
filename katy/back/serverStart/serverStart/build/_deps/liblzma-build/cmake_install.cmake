# Install script for directory: C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/DocxFormatterServer")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "liblzma_Development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Debug/lzma.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Release/lzma.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/MinSizeRel/lzma.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/RelWithDebInfo/lzma.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "liblzma_Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/src/liblzma/api/" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "liblzma_Development" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma/liblzma-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma/liblzma-targets.cmake"
         "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/CMakeFiles/Export/6194817f435e7429e84a3ab7f926109c/liblzma-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma/liblzma-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma/liblzma-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/CMakeFiles/Export/6194817f435e7429e84a3ab7f926109c/liblzma-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/CMakeFiles/Export/6194817f435e7429e84a3ab7f926109c/liblzma-targets-debug.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/CMakeFiles/Export/6194817f435e7429e84a3ab7f926109c/liblzma-targets-minsizerel.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/CMakeFiles/Export/6194817f435e7429e84a3ab7f926109c/liblzma-targets-relwithdebinfo.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/CMakeFiles/Export/6194817f435e7429e84a3ab7f926109c/liblzma-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "liblzma_Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/liblzma" TYPE FILE FILES
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/liblzma-config.cmake"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/liblzma-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "liblzma_Development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/liblzma.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "xzdec_Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Debug/xzdec.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Release/xzdec.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/MinSizeRel/xzdec.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/RelWithDebInfo/xzdec.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "lzmadec_Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Debug/lzmadec.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Release/lzmadec.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/MinSizeRel/lzmadec.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/RelWithDebInfo/lzmadec.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "lzmainfo_Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Debug/lzmainfo.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Release/lzmainfo.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/MinSizeRel/lzmainfo.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/RelWithDebInfo/lzmainfo.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "xz_Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Debug/xz.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/Release/xz.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/MinSizeRel/xz.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/RelWithDebInfo/xz.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "liblzma_Documentation" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/minizip-ng" TYPE DIRECTORY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/doc/examples")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Documentation" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/minizip-ng" TYPE FILE FILES
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/AUTHORS"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/COPYING"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/COPYING.0BSD"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/COPYING.GPLv2"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/NEWS"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/README"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/THANKS"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/doc/faq.txt"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/doc/history.txt"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/doc/lzma-file-format.txt"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma/doc/xz-file-format.txt"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
