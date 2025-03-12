#!/bin/sh
#******************************************************************************
# (C) Copyright 2020-2025 Real-Time Innovations, Inc.  All rights reserved.
#
# The use of this software is governed by the terms specified in the
# RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs.
#
# By accessing, downloading, or otherwise using this software, you agree to
# be bound by those terms.
#*****************************************************************************
# USAGE:
#   Source the environment variables into the current shell
#     . Drive.sh
#*****************************************************************************

# --- Project Directory ---
if [ "${DATABUSHOME}" = "" ]; then echo "DATABUSHOME Undefined!" ; return; fi

# -- Base Environment ---
[ -f $DATABUSHOME/res/env/QOS_PROVIDER.sh ] &&
. $DATABUSHOME/res/env/QOS_PROVIDER.sh || NDDS_QOS_PROFILES=""


# --- QoS Profiles ---

# QoS: Domain
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/Domain_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/steering/Steering_qos.xml"

# QoS: Participants
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/steering/SteeringColumn_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/steering/SteeringDisplay_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/steering/env/SteeringController_qos.xml"


# --- Data-Oriented Interfaces ---

# Data Interfaces
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/steering/Steering.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/steering/SteeringColumn.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/steering/SteeringController.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/steering/SteeringDisplay.xml"

# --- Show Environment ---
echo NDDS_QOS_PROFILES=$NDDS_QOS_PROFILES
#echo NDDS_QOS_PROFILES=$NDDS_QOS_PROFILES
