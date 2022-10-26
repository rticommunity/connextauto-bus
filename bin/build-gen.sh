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

echo "USAGE:"
echo "    $0 [<pro|micro|micro2> [<target-arch> [<Debug|Release>]]]"
echo

# Build System Parameters
RTI_CONNEXT_SDK=${1:-pro}           # pro | micro | micro2
RTI_ARCH=${2:-x64Darwin17clang9.0}
RTI_BUILD_TYPE=${3:-Debug}


echo "Running..."
echo "    $0 $RTI_CONNEXT_SDK $RTI_ARCH $RTI_BUILD_TYPE" 
echo


# Build Dir
RTI_BUILD_DIR="build/$RTI_CONNEXT_SDK/$RTI_ARCH/$RTI_BUILD_TYPE"
DATABUS_PROJECT_DIR=$(cd $(dirname "$0")/..; pwd -P)


# Generate the Build System
echo "Generating build system..."

# Unix
cmake -B$RTI_BUILD_DIR \
      -DCMAKE_BUILD_TYPE=$RTI_BUILD_TYPE \
      -DRTI_ARCH=$RTI_ARCH \
      -DRTI_CONNEXT_SDK=$RTI_CONNEXT_SDK \
      -DDATABUS_PROJECT_DIR=$DATABUS_PROJECT_DIR \
      -G "Unix Makefiles"

if [ $? -eq 0 ]
then
    # Generate build helper script
    echo "Generating build script..."
    RTI_BUILD_SCRIPT=build/$RTI_CONNEXT_SDK-$RTI_ARCH-$RTI_BUILD_TYPE.sh
    echo "#!/bin/sh" > $RTI_BUILD_SCRIPT
    echo "cmake --build $RTI_BUILD_DIR --config $RTI_BUILD_TYPE" >> $RTI_BUILD_SCRIPT
    chmod a+x $RTI_BUILD_SCRIPT


    # Build using the generated Build System
    echo
    echo
    echo "Build as follows:"
    echo
    echo "$RTI_BUILD_SCRIPT"
    echo "    -or-"
    cat $RTI_BUILD_SCRIPT
fi
