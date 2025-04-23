# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma")
  file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/liblzma")
endif()
file(MAKE_DIRECTORY
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-build"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-subbuild/liblzma-populate-prefix"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-subbuild/liblzma-populate-prefix/tmp"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-subbuild/liblzma-populate-prefix/src/liblzma-populate-stamp"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-subbuild/liblzma-populate-prefix/src"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-subbuild/liblzma-populate-prefix/src/liblzma-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-subbuild/liblzma-populate-prefix/src/liblzma-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/liblzma-subbuild/liblzma-populate-prefix/src/liblzma-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
