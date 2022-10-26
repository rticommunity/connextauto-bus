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
#     source QOS_PROVIDER.sh
#*****************************************************************************

# --- Project Directory ---
DATABUS_PROJECT_DIR=$(cd $(dirname "${BASH_SOURCE}")/../..; pwd -P)
echo "DATABUS_PROJECT_DIR=$DATABUS_PROJECT_DIR"


# --- QoS Profiles ---

NDDS_QOS_PROFILES=""

# QoS: Snippets
NDDS_QOS_PROFILES+="$DATABUS_PROJECT_DIR/res/qos/data/snippets/factory_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/res/qos/data/snippets/participant_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/res/qos/data/snippets/endpoint_qos.xml"

# QoS: Flows
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/res/qos/data/doa_qos.xml"

# QoS: Services
[ -f $DATABUS_PROJECT_DIR/res/qos/services/MyService_qos.xml ] && 
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/res/qos/services/MyService_qos.xml"

# QoS: Systems
[ -f $DATABUS_PROJECT_DIR/res/qos/services/MySystem_qos.xml ] && 
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/res/qos/systems/MySystem_qos.xml"


# --- Data-Oriented Interfaces ---

# Interfaces: Services
[ -f $DATABUS_PROJECT_DIR/if/MyService.xml ] && 
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/if/MyService.xml"

# Interfaces: Systems
[ -f $DATABUS_PROJECT_DIR/if/MySystem.xml ] && 
NDDS_QOS_PROFILES+=";$DATABUS_PROJECT_DIR/if/MySystem.xml"



# --- RTI Connext DDS Professional Runtime Environment ---
export NDDS_QOS_PROFILES
#echo NDDS_QOS_PROFILES=$NDDS_QOS_PROFILES
