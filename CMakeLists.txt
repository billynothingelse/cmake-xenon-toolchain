cmake_minimum_required(VERSION 3.8)

project(cmake-xenon-toolchain)

set(CMAKE_SYSTEM_NAME "Xenon")

include(cmake/config.cmake)
include(cmake/compiler.cmake)

# add sample shared library
add_xenon_module(sample "sample/dllmain.cpp")