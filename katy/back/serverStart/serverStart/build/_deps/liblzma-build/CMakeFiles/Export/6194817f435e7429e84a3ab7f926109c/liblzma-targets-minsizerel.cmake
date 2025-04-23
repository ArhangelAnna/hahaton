#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "liblzma::liblzma" for configuration "MinSizeRel"
set_property(TARGET liblzma::liblzma APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(liblzma::liblzma PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_MINSIZEREL "C"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/lib/lzma.lib"
  )

list(APPEND _cmake_import_check_targets liblzma::liblzma )
list(APPEND _cmake_import_check_files_for_liblzma::liblzma "${_IMPORT_PREFIX}/lib/lzma.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
