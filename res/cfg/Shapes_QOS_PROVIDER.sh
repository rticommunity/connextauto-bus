#!/bin/bash
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
#     source Shapes_QOS_PROVIDER.sh

# --- Project Directory ---
DATABUS_PROJECT_DIR=$(cd $(dirname "${BASH_SOURCE}")/../..; pwd -P)
source $DATABUS_PROJECT_DIR/res/cfg/QOS_PROVIDER.sh

# --- QoS Profiles ---

# QoS: Services
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/res/qos/services/Shapes_qos.xml"


# --- Data-Oriented Interfaces ---

# Interfaces: Services
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/if/Shapes_svc.xml"


# --- Show Environment --- 
echo NDDS_QOS_PROFILES=$NDDS_QOS_PROFILES
