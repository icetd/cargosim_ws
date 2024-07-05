cmake_minimum_required(VERSION 3.10)
project(segment_global_planner)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++17)

set(SOURCE_DIR      ${CMAKE_CURRENT_LIST_DIR}/src)
set(INCLUDE_DIR     ${CMAKE_CURRENT_LIST_DIR}/src)

find_package(catkin REQUIRED COMPONENTS
  nav_core
  costmap_2d
  base_local_planner
  pluginlib
  roscpp
  geometry_msgs
  nav_msgs
  tf2
  dynamic_reconfigure
)

generate_dynamic_reconfigure_options(
	cfg/SegmentGlobalPlanner.cfg
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  ${INCLUDE_DIR}
)


catkin_package(
  INCLUDE_DIRS 
  LIBRARIES
	${PROJECT_NAME}
  CATKIN_DEPENDS
    nav_core
    costmap_2d
    base_local_planner
    pluginlib
    roscpp
    geometry_msgs
    nav_msgs
    tf2
    dynamic_reconfigur
)

file(GLOB_RECURSE SRC_FILES
    "${SOURCE_DIR}/*.c*"
)

file (GLOB_RECURSE INC_FILES
    "${INCLUDE_DIR}/*.h"
)

add_library(${PROJECT_NAME}
  ${SRC_FILES}
  ${INC_FILES}
)

target_include_directories(${PROJECT_NAME} PRIVATE ${INCLUDE_DIR})
target_include_directories(${PROJECT_NAME} PRIVATE ${SOURCE_DIR})

target_link_libraries(segment_global_planner
  ${catkin_LIBRARIES}
)

install(TARGETS segment_global_planner
	ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
	LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
)

install(
  FILES segment_global_planner_plugin.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
