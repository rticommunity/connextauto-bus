# Shapes Service

The *Shapes* service defines the *service* interface that can be used with
the [**RTI Shapes Demo**](https://www.rti.com/gettingstarted/shapes-demo)

- [Service Definition](#service-definition)
- [Dependencies](#dependencies)
- [Generating Types](#generating-types)
- [Running the Service](#running-the-service)

## Service Definition

The *Shapes* Service is defined by the following artifacts

- Service: [Shapes.xml](../if/Shapes.xml)
- Data Model:
  - Datatypes: [Shapes_t.idl](../res/types/Shapes_t.idl)
  - QosProfiles: [Shapes_qos.xml](../res/qos/services/Shapes_qos.xml)

- Configuration: [Shapes_QOS_PROVIDER.sh](../res/cfg/Shapes_QOS_PROVIDER.sh)


## Dependencies 

[RTI Connext DDS 6.1.1+](https://community.rti.com/documentation)


## Setup RTI Connext DDS Environment

In each Terminal Window in which you want to run RTI COnnext DDS Applications:

    source NDDSHOME/resource/scripts/rtisetenv_<architecture>.bash

where `NDDSHOME` is the location of the **RTI Connext DDS** *installation directory*.

## Generating Types

*NOTE: the build steps automatically take care of the generation. The manual steps are
listed below.*

Generate the XML representation of the datatypes from XML as follows:

    rtiddsgen -convertToXml res/types/Shapes_t.idl

This step needs to be done only when [Shapes_t.idl](../res/types/Shapes_t.idl)
changes.
 
## Running the Shapes system using emulated components

- Run the shapes system using emulated components

        ./bin/shapes

  To stop the emulation, press ^C
  
  The above uses the `RTI Prototyper with Lua` to emulate the entire system architecture.
  - Run `RTI Admin Console` to visualize databus.
  - Run `rtiddsspy` to view the data.


## Running the Components Individually

### Run Shapes Publisher

Open a Terminal Window, and run the shapes publisher and type:

    # Setup the Shapes Service Configuration
    source res/cfg/Shapes_QOS_PROVIDER.sh

    # Run the Shapes Service in RTI Prototyper
    rtiddsprototyper -luaOnData 0 -luaFile src/utils/Publisher.lua -cfgName Shapes_svc::Pub


### Run Shapes Subscriber

Open a Terminal Window, and run the shapes publisher and type:

    # Setup the Shapes Service Configuration
    source res/cfg/Shapes_QOS_PROVIDER.sh

    # Run the Shapes Service in RTI Prototyper
    rtiddsprototyper -luaOnPeriod 0 -luaFile src/utils/Subscriber.lua -cfgName Shapes_svc::Sub 


## Run RTI Shapes Demo

Use the RTI Launcher to launch 
[RTI Shapes Demo](https://www.rti.com/gettingstarted/shapes-demo), or
Open a Terminal Window and type:

    rtishapesdemo


## Run RTI Admin Console

View the system connectivity using 
[RTI Admin Console](https://www.rti.com/gettingstarted/adminconsole).

Use the RTI Launcher to launch RTI Admin Console, or 
Open a Terminal Window and type:

    rtiadminconsole

---
(C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.