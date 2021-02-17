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
# 
# Emulate all the components of the autonomy reference architecture using 
# rtiddsprototyper with Lua, with dummy data. 
# 
# The system databus architecture can be visualized using RTI Admin Console.
#
# USAGE:
#     emulator.sh

# --- Project Directory ---
DATABUS_PROJECT_DIR=$(cd $(dirname "$0")/..; pwd -P)
NDDSHOME=${1:-$NDDSHOME}

# Print Help:
if [ "$NDDSHOME" = "" ] ; then
    echo "Usage:"
    echo "$(basename $0) [NDDSHOME]"
    echo "   Set the NDDSHOME environment variable or specify is on the command line" 
    exit 0
fi

# Initialize environment
source $DATABUS_PROJECT_DIR/res/cfg/Drive_QOS_PROVIDER.sh

# Change working directory to the project directory 
cd $DATABUS_PROJECT_DIR

# Service Components to launch
COMPONENTS=""
COMPONENTS+=" Sensing_svc::Camera " 
COMPONENTS+=" Sensing_svc::Lidar "
COMPONENTS+=" Perception_svc::Perceptor " 
COMPONENTS+=" Planning_svc::Planner "
COMPONENTS+=" Actuation_svc::Actuator "
COMPONENTS+=" HMI_svc::HMI "
COMPONENTS+=" CAN_svc::CANGateway "
COMPONENTS+=" CAN_svc::CANComponent "
COMPONENTS+=" CAN_svc::CANTunnel "

echo "COMPONENTS = $COMPONENTS"

# Launch the components emulated using Lua
i=0
for component in ${COMPONENTS} 
do
    echo "$component"
    $NDDSHOME/bin/rtiddsprototyper -luaOnData 0 -luaFile src/utils/Publisher.lua -cfgName $component &
    COMPONENT_PID[$i]=$!
    echo "   PID = ${COMPONENT_PID[$i]}"
    i=$((i+1))
done

# wait for the user to terminate this shell process
while :
do
    sleep 1
done

# Kill the components
trap "{
i=0
for component in ${COMPONENTS} 
do
    echo "Killing: $component, PID = ${COMPONENT_PID[$i]}"
    kill -9 ${COMPONENT_PID[$i]}
    i=$((i+1))
done
}" EXIT
