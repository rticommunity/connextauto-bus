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
# 
# Emulate all the components of the Shapes service using 
# rtiddsprototyper with Lua, with dummy data. Visualize the databus using
# RTI Admin Console.
#
# USAGE:
#     Shapes.sh

# --- Project Directory ---
PROJ_DIR=$(cd $(dirname "$0")/..; pwd -P)
NDDSHOME=${1:-$NDDSHOME}

# Print Help:
if [ "$NDDSHOME" = "" ] ; then
    echo "Usage:"
    echo "$(basename $0) [NDDSHOME]"
    echo "   Set the NDDSHOME environment variable or specify is on the command line" 
    exit 0
fi

# Initialize environment
source $PROJ_DIR/res/cfg/Shapes_QOS_PROVIDER.sh $PROJ_DIR

# Change working directory to the project directory 
cd $PROJ_DIR

# Service Components to launch
COMPONENTS=""
COMPONENTS+=" Shapes_svc::Pub " 
COMPONENTS+=" Shapes_svc::Sub " 
COMPONENTS+=" Shapes_svc::PubSub " 

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
