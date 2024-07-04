# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME "constellation_dart")
project(${PROJECT_NAME} LANGUAGES CXX)


set(constellation_dart_bundled_libraries
  "${CMAKE_CURRENT_SOURCE_DIR}/../platform/linux_x64/libconstellation.so"
  PARENT_SCOPE
)
