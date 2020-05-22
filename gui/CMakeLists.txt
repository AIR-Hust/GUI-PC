cmake_minimum_required(VERSION 3.1.0)
project(gui)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages


SET(CMAKE_AUTOMOC ON)
SET(CMAKE_AUTOUIC ON)
SET(CMAKE_AUTORCC ON)

set(QT_VERSION_REQ "5.3")
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fPIC")
set(CMAKE_PREFIX_PATH "/usr/include/x86_64-linux-gnu/qt5")


find_package(Qt5 COMPONENTS Core Gui Qml Test Quick Widgets REQUIRED)
#find_package(Qt5Widgets CONFIG REQUIRED)
#find_package(Qt5Core ${QT_VERSION_REQ} REQUIRED)
#get_target_property(QtCore_location Qt5::Core LOCATION)
#find_package(Qt5Quick ${QT_VERSION_REQ} REQUIRED)
#find_package(Qt5Widgets ${QT_VERSION_REQ} REQUIRED)
#find_package(Qt5Gui ${QT_VERSION_REQ} REQUIRED)



set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_RELEASE} -fprofile-arcs -ftest-coverage")
#set_target_properties(Qt::Core PROPERTIES MAP_IMPORTED_CONFIG_COVERAGE "RELEASE")

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  genmsg
  sensor_msgs
  cv_bridge
)

#qt5_add_resources(RESOURCES qml.qrc)

#set(QML_IMPORT_PATH "${QML_IMPORT_PATH};${CATKIN_GLOBAL_LIB_DESTINATION}")
#set(QML_IMPORT_PATH2 "${QML_IMPORT_PATH};${CATKIN_GLOBAL_LIB_DESTINATION}")

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)


## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## To declare and build messages, services or actions from within this
## package, follow these steps:
## * Let MSG_DEP_SET be the set of packages whose message types you use in
##   your messages/services/actions (e.g. std_msgs, actionlib_msgs, ...).
## * In the file package.xml:
##   * add a build_depend tag for "message_generation"
##   * add a build_depend and a exec_depend tag for each package in MSG_DEP_SET
##   * If MSG_DEP_SET isn't empty the following dependency has been pulled in
##     but can be declared for certainty nonetheless:
##     * add a exec_depend tag for "message_runtime"
## * In this file (CMakeLists.txt):
##   * add "message_generation" and every package in MSG_DEP_SET to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * add "message_runtime" and every package in MSG_DEP_SET to
##     catkin_package(CATKIN_DEPENDS ...)
##   * uncomment the add_*_files sections below as needed
##     and list every .msg/.srv/.action file to be processed
##   * uncomment the generate_messages entry below
##   * add every package in MSG_DEP_SET to generate_messages(DEPENDENCIES ...)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
generate_messages(
   DEPENDENCIES   
   std_msgs
   sensor_msgs
)

################################################
## Declare ROS dynamic reconfigure parameters ##
################################################

## To declare and build dynamic reconfigure parameters within this
## package, follow these steps:
## * In the file package.xml:
##   * add a build_depend and a exec_depend tag for "dynamic_reconfigure"
## * In this file (CMakeLists.txt):
##   * add "dynamic_reconfigure" to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * uncomment the "generate_dynamic_reconfigure_options" section below
##     and list every .cfg file to be processed

## Generate dynamic reconfigure parameters in the 'cfg' folder
# generate_dynamic_reconfigure_options(
#   cfg/DynReconf1.cfg
#   cfg/DynReconf2.cfg
# )

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES gui
#  CATKIN_DEPENDS roscpp std_msgs
#  DEPENDS system_lib
    LIBRARIES gui
    CATKIN_DEPENDS roscpp rospy std_msgs sensor_msgs cv_bridge 
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations


include_directories(
  include
  src 
  ${catkin_INCLUDE_DIRS}
  /usr/include
  /usr/include/x86_64-linux-gnu/qt5
  /usr/include/x86_64-linux-gnu/qt5/QtCore
  /usr/include/x86_64-linux-gnu/qt5/QtWidgets
  /usr/include/x86_64-linux-gnu/qt5/QtQml
  /usr/include/x86_64-linux-gnu/qt5/QtGui
  /usr/include/x86_64-linux-gnu/qt5/QtQuick
  /src/build-gui_cbot-Desktop-Debug
)

set(QT_FILES /usr/include/x86_64-linux-gnu/qt5)

set (HEADER_FILES 
    ${QT_FILES}/QtCore/qobject.h 
    ${QT_FILES}/QtWidgets/qapplication.h
    ${QT_FILES}/QtGui/qicon.h
    src/backend.h
    src/weather.h
)

## Declare a C++ library
# add_library(${PROJECT_NAME}
#   src/${PROJECT_NAME}/gui.cpp
# )

#add_library(gui_lib src/backend.cpp ${HEADER_FILES})
#target_include_directories(gui_lib PRIVATE src)
#add_library(main_lib src/main.cpp ${HEADER_FILES})
#target_include_directories(main_lib PRIVATE src)

## Add cmake target dependencies of the library
## as an example, code may need to be generated before libraries
## either from message generation or dynamic reconfigure
# add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
# add_executable(${PROJECT_NAME}_node src/gui_node.cpp)
add_executable(node_name ${RESOURCES} src/main.cpp src/backend.h src/backend.cpp src/moving.h src/moving.cpp src/weather.h src/weather.cpp)

#add_executable(node_name src/main.cpp ${HEADER_FILES})
target_include_directories(node_name PRIVATE gui)

## Rename C++ executable without prefix
## The above recommended prefix causes long target names, the following renames the
## target back to the shorter version for ease of user use
## e.g. "rosrun someones_pkg node" instead of "rosrun someones_pkg someones_pkg_node"
# set_target_properties(${PROJECT_NAME}_node PROPERTIES OUTPUT_NAME node PREFIX "")

## Add cmake target dependencies of the executable
## same as for the library above
# add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
# target_link_libraries(${PROJECT_NAME}_node
#   ${catkin_LIBRARIES}
# )
target_link_libraries(node_name ${catkin_LIBRARIES} )
target_link_libraries(node_name Qt5::Core)
target_link_libraries(node_name Qt5::Widgets)
target_link_libraries(node_name Qt5::Qml)
target_link_libraries(node_name Qt5::Gui)



#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS ${PROJECT_NAME} ${PROJECT_NAME}_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_gui.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)

###########################
# Qt Environment
###########################

#SET (CFLAGS        "-m64 -pipe -g -Wall -W -D_REENTRANT -fPIC $(DEFINES)")
#SET (CXXFLAGS      "-m64 -pipe -g -Wall -W -D_REENTRANT -fPIC $(DEFINES)")


# -stdlib=libstdc++

#SET(Qt5Core_EXECUTABLE_COMPILE_FLAGS "-fPIC")

#SET(CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")
#SET(CMAKE_C_FLAGS           "${CMAKE_C_FLAGS}   ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")
#STRING(TOUPPER "CMAKE_CXX_FLAGS_${CMAKE_BUILD_TYPE}" _flags_var_name)
#SET(${_flags_var_name}      "${${_flags_var_name}} ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")
#SET("CMAKE_CXX_FLAGS_${CMAKE_BUILD_TYPE}" _flags_var_name)








##############################################################################
# Sections
##############################################################################

#file(GLOB QT_RESOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} resources/*.qrc)
#file(GLOB_RECURSE QT_MOC RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS gui/src/*.h)

#QT5_ADD_RESOURCES(QT_RESOURCES_CPP ${QT_RESOURCES})
#QT5_WRAP_CPP(QT_MOC_HPP ${QT_MOC})

##############################################################################
# Sources
##############################################################################

#file(GLOB_RECURSE QT_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS src/*.cpp)

##############################################################################
# Binaries
##############################################################################

