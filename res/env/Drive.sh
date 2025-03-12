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
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/drive/Drive_qos.xml"

# QoS: Participants
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/drive/Camera_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/drive/Lidar_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/drive/Perceptor_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/drive/Planner_qos.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/res/qos/services/drive/HMI_qos.xml"


# --- Data-Oriented Interfaces ---

# Data Interfaces
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/drive/Drive.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/drive/Drive_Camera.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/drive/Drive_Lidar.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/drive/Drive_Perceptor.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/drive/Drive_Planner.xml"
NDDS_QOS_PROFILES+=";$DATABUSHOME/if/drive/Drive_HMI.xml"

# --- Show Environment --- 
echo NDDS_QOS_PROFILES=$NDDS_QOS_PROFILES
#echo NDDS_QOS_PROFILES=$NDDS_QOS_PROFILES
