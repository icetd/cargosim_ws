cmake_minimum_required(VERSION 3.0.2)
project(cargosim)

find_package(catkin REQUIRED)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES robot
#  CATKIN_DEPENDS geometrt_msgs nav_msgs roscpp sensor_msgs std_msgs tf2 tf2_ros
#  DEPENDS system_lib
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)



install(DIRECTORY configs launch map param gazebo urdf worlds
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

