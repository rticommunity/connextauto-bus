#!/bin/sh
#******************************************************************************
#  (c) 2020 Copyright, Real-Time Innovations, Inc. (RTI) All rights reserved.
#
#   Licensed according to the terms in the LICENSE.md file located at the root 
#   of this software repository:
#
#                                LICENSE.md
#
#*****************************************************************************
# USAGE:
#     source Drive_QOS_PROVIDER.sh [</path/to/project_dir]>]

# --- Project Directory ---
PROJ_DIR=${1:-${PWD}}
source $PROJ_DIR/res/cfg/QOS_PROVIDER.sh

# --- QoS Profiles ---

# QoS: Services
NDDS_QOS_PROFILES+=";$PROJ_DIR/res/qos/services/Drive_qos.xml"
NDDS_QOS_PROFILES+=";$PROJ_DIR/res/qos/systems/Drive-default_qos.xml"

# --- Data-Oriented Interfaces ---

# Interfaces: Services
NDDS_QOS_PROFILES+=";$PROJ_DIR/if/Drive_bus.xml"
NDDS_QOS_PROFILES+=";$PROJ_DIR/if/Sensing_svc.xml"
NDDS_QOS_PROFILES+=";$PROJ_DIR/if/Perception_svc.xml"
NDDS_QOS_PROFILES+=";$PROJ_DIR/if/Planning_svc.xml"
NDDS_QOS_PROFILES+=";$PROJ_DIR/if/Actuation_svc.xml"
NDDS_QOS_PROFILES+=";$PROJ_DIR/if/HMI_svc.xml"
NDDS_QOS_PROFILES+=";$PROJ_DIR/if/CAN_svc.xml"

# --- Show Environment --- 
echo NDDS_QOS_PROFILES=$NDDS_QOS_PROFILES
