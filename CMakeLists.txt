#******************************************************************************
# (C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.
#
# The use of this software is governed by the terms specified in the 
# RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 
#
# By accessing, downloading, or otherwise using this software, you agree to 
# be bound by those terms.
#*****************************************************************************

cmake_minimum_required(VERSION 3.20)
project(connextauto-bus)

message(STATUS "databus_SOURCE_DIR = ${databus_SOURCE_DIR}")
message(STATUS "databus_BINARY_DIR = ${databus_BINARY_DIR}")

include(build-helpers/cmake/init.cmake)

#-----------------------------------------------------------------------------

# Generate type handling code + build type libraries
add_subdirectory("res/types")

#-----------------------------------------------------------------------------
