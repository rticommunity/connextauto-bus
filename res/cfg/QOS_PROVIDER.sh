#!/bin/sh
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
#   Source the environment variables into the current shell
#     . QOS_PROVIDER.sh
#*****************************************************************************

# --- Project Directory ---
if [ "${DATABUSHOME}" = "" ]; then echo "DATABUSHOME Undefined!" ; return; fi

# --- QoS Profiles ---

NDDS_QOS_PROFILES=""

# QoS: Snippets
NDDS_QOS_PROFILES+="$DATABUSHOME/res/qos/data/snippets/factory_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/data/snippets/participant_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/data/snippets/endpoint_qos.xml"

# QoS: Flows
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/data/doa_qos.xml"

# QoS: Services
[ -f $DATABUSHOME/res/qos/services/MyService_qos.xml ] && 
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/MyService_qos.xml"

# QoS: Systems
[ -f $DATABUSHOME/res/qos/services/MySystem_qos.xml ] && 
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/systems/MySystem_qos.xml"


# --- Data-Oriented Interfaces ---

# Interfaces: Services
[ -f $DATABUSHOME/if/MyService.xml ] && 
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/MyService.xml"

# Interfaces: Systems
[ -f $DATABUSHOME/if/MySystem.xml ] && 
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/MySystem.xml"



# --- RTI Connext DDS Professional Runtime Environment ---
export NDDS_QOS_PROFILES
#echo NDDS_QOS_PROFILES=$NDDS_QOS_PROFILES
