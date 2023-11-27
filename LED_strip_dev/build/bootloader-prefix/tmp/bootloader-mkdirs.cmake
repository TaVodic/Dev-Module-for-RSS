# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "T:/ESP-IDF/esp-idf/components/bootloader/subproject"
  "S:/ALPS/GITLAB/tavoda-bachelor-thesis/InitialDevelopement/hello_world/build/bootloader"
  "S:/ALPS/GITLAB/tavoda-bachelor-thesis/InitialDevelopement/hello_world/build/bootloader-prefix"
  "S:/ALPS/GITLAB/tavoda-bachelor-thesis/InitialDevelopement/hello_world/build/bootloader-prefix/tmp"
  "S:/ALPS/GITLAB/tavoda-bachelor-thesis/InitialDevelopement/hello_world/build/bootloader-prefix/src/bootloader-stamp"
  "S:/ALPS/GITLAB/tavoda-bachelor-thesis/InitialDevelopement/hello_world/build/bootloader-prefix/src"
  "S:/ALPS/GITLAB/tavoda-bachelor-thesis/InitialDevelopement/hello_world/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "S:/ALPS/GITLAB/tavoda-bachelor-thesis/InitialDevelopement/hello_world/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "S:/ALPS/GITLAB/tavoda-bachelor-thesis/InitialDevelopement/hello_world/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
