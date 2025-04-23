# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/zlib")
  file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/zlib")
endif()
file(MAKE_DIRECTORY
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zlib-build"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zlib-subbuild/zlib-populate-prefix"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zlib-subbuild/zlib-populate-prefix/tmp"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zlib-subbuild/zlib-populate-prefix/src/zlib-populate-stamp"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zlib-subbuild/zlib-populate-prefix/src"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zlib-subbuild/zlib-populate-prefix/src/zlib-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zlib-subbuild/zlib-populate-prefix/src/zlib-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/zlib-subbuild/zlib-populate-prefix/src/zlib-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
