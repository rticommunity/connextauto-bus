#!/bin/bash
#******************************************************************************
# (C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.
#
# The use of this software is governed by the terms specified in the 
# RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 
#
# By accessing, downloading, or otherwise using this software, you agree to 
# be bound by those terms.
#*****************************************************************************
# USAGE:
#     source Shapes_QOS_PROVIDER.sh
#*****************************************************************************

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
