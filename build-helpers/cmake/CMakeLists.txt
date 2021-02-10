#******************************************************************************
#  (c) 2020 Copyright, Real-Time Innovations, Inc. (RTI) All rights reserved.
#
#   Licensed according to the terms in the LICENSE.md file located at the root 
#   of this software repository:
#
#                                LICENSE.md
#
#*****************************************************************************
# include(<this_list_file_for_common_initialization)
#-----------------------------------------------------------------------------
# Common Initialization for top-level project CMakeLists.txt files
# 
# include(<this_file>) in a top-level project CMakeLists.file, 
# typically after the setting the top level project() name
#
# e.g. 
# 
#    CMakeLists.txt:
#
#        cmake_minimum_required(VERSION 3.14)i
#
#        project(<name>)   # optional 
#
#        include(${databus_SOURCE_DIR}/build-helpers/cmake/CMakeLists.txt)
#
#        :
#
#-----------------------------------------------------------------------------
message(STATUS "--- BEGIN Initialize ${CMAKE_CURRENT_LIST_FILE} ---")
#-----------------------------------------------------------------------------


#-----------------------------------------------------------------------------
message(STATUS "--- END   Initialize ${CMAKE_CURRENT_LIST_FILE} ---")
#-----------------------------------------------------------------------------
