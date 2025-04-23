# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/bzip2")
  file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/libs/minizip/third_party/bzip2")
endif()
file(MAKE_DIRECTORY
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/bzip2-build"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/bzip2-subbuild/bzip2-populate-prefix"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/bzip2-subbuild/bzip2-populate-prefix/tmp"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/bzip2-subbuild/bzip2-populate-prefix/src/bzip2-populate-stamp"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/bzip2-subbuild/bzip2-populate-prefix/src"
  "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/bzip2-subbuild/bzip2-populate-prefix/src/bzip2-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/bzip2-subbuild/bzip2-populate-prefix/src/bzip2-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/AAN/hahaton/katy/back/serverStart/serverStart/build/_deps/bzip2-subbuild/bzip2-populate-prefix/src/bzip2-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
