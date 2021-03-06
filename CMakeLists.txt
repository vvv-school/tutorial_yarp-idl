# requires minimum cmake version
cmake_minimum_required(VERSION 2.8.9)

# produce the cmake var PROJECT_NAME
project(tutorial_yarp-idl)

# mandatory use of these packages
find_package(YARP 3.0 REQUIRED)
find_package(ICUBcontrib REQUIRED)

# extend the current search path used by cmake to load helpers
list(APPEND CMAKE_MODULE_PATH ${ICUBCONTRIB_MODULE_PATH})

# helpers defining certain macros
include(ICUBcontribHelpers)
include(ICUBcontribOptions)

# specify to install in $ICUBcontrib_DIR/bin
icubcontrib_set_default_prefix()

# building module
include_directories(${CMAKE_SOURCE_DIR}/src
                    ${CMAKE_SOURCE_DIR}/src/idl/generated)

# bulding server
add_executable(tutorial_yarp-idl-server
               ${CMAKE_SOURCE_DIR}/src/idl/generated/Memory.cpp
               ${CMAKE_SOURCE_DIR}/src/MemoryModule.cpp
               ${CMAKE_SOURCE_DIR}/src/main.cpp)
target_link_libraries(tutorial_yarp-idl-server ${YARP_LIBRARIES})
install(TARGETS tutorial_yarp-idl-server DESTINATION bin)

# bulding client
add_executable(tutorial_yarp-idl-client
               ${CMAKE_SOURCE_DIR}/src/idl/generated/Memory.cpp
               ${CMAKE_SOURCE_DIR}/src/MemoryClient.cpp)
target_link_libraries(tutorial_yarp-idl-client ${YARP_LIBRARIES})
install(TARGETS tutorial_yarp-idl-client DESTINATION bin)

# generate ad-hoc project to perform "make uninstall"
icubcontrib_add_uninstall_target()

file(GLOB scripts ${CMAKE_SOURCE_DIR}/app/scripts/*.xml)
yarp_install(FILES ${scripts} DESTINATION ${ICUBCONTRIB_APPLICATIONS_INSTALL_DIR})

#file(GLOB scripts ${CMAKE_SOURCE_DIR}/app/scripts/*.xml)
#yarp_install(FILES tutorial_yarp-idl.xml DESTINATION ${ICUBCONTRIB_MODULES_INSTALL_DIR})
