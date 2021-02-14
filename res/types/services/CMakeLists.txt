#******************************************************************************
#  (c) 2020 Copyright, Real-Time Innovations, Inc. (RTI) All rights reserved.
#
#   Licensed according to the terms in the LICENSE.md file located at the root 
#   of this software repository:
#
#                                LICENSE.md
#
#*****************************************************************************

cmake_minimum_required(VERSION 3.14)

###################################################################################
# Convert IDLs to XML
###################################################################################

set(IDLs
  Actuation_svc_t
  CAN_svc_t
  Drive_bus_t
  HMI_svc_t
  Perception_svc_t
  Planning_svc_t
  Sensing_svc_t
)
