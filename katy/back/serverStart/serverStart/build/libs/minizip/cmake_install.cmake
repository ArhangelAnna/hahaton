# Install script for directory: C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/Debug/minizip.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/Release/minizip.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/MinSizeRel/minizip.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/RelWithDebInfo/minizip.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/Debug/bzip2.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/Release/bzip2.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/MinSizeRel/bzip2.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/RelWithDebInfo/bzip2.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
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

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zstd-build/lib/Debug/zstd_static.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zstd-build/lib/Release/zstd_static.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zstd-build/lib/MinSizeRel/zstd_static.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zstd-build/lib/RelWithDebInfo/zstd_static.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip/minizip.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip/minizip.cmake"
         "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/CMakeFiles/Export/4fe77da0f4d2c94dd906efce3aa1c0aa/minizip.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip/minizip-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip/minizip.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/CMakeFiles/Export/4fe77da0f4d2c94dd906efce3aa1c0aa/minizip.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/CMakeFiles/Export/4fe77da0f4d2c94dd906efce3aa1c0aa/minizip-debug.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/CMakeFiles/Export/4fe77da0f4d2c94dd906efce3aa1c0aa/minizip-minsizerel.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/CMakeFiles/Export/4fe77da0f4d2c94dd906efce3aa1c0aa/minizip-relwithdebinfo.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/CMakeFiles/Export/4fe77da0f4d2c94dd906efce3aa1c0aa/minizip-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/minizip" TYPE FILE FILES
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/minizip-config-version.cmake"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/minizip-config.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/minizip" TYPE FILE FILES
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_os.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_crypt.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_buf.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_mem.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_split.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_os.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_zip.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_zip_rw.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_zlib.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_bzip.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_lzma.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_zstd.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_pkcrypt.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/mz_strm_wzaes.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/compat/ioapi.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/compat/unzip.h"
    "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/compat/zip.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/minizip.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/libs/minizip/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
