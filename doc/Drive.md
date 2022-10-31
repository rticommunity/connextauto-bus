# Drive Service

The *Drive* service defines the *service* interface for 
an autonomous vehicle databus.

- [Service Definition](#service-definition)
- [System Definition](#system-definition)
- [Dependencies](#dependencies)
- [Generating Types](#generating-types)
- [Running the Service](#running-the-service)
- [Adding a new Service](#adding-a-new-service)

## Service Definition

The reference architecture is defined as a collection
of data-oriented micro-services.

- Services: [if/](../if/)
- Data Model
  - Datatypes: [res/types/data/](../res/types/data)
  - Qos Profiles: [Drive_qos.xml](../res/qos/services/Drive_qos.xml)


## System Deployments

The following system deployments for the *Drive* service are currently available:

  - `default` 
    - Qos Profiles: [Drive-default_qos.xml](../res/qos/systems/Drive-default_qos.xml)
    - Configuration: [Drive_QOS_PROVIDER.sh](../res/cfg/Drive_QOS_PROVIDER.sh)


## Dependencies 

[RTI Connext DDS 6.1.1+](https://community.rti.com/documentation)


## Setup RTI Connext DDS Environment

In each Terminal Window in which you want to run RTI Connext DDS Applications:

    source NDDSHOME/resource/scripts/rtisetenv_<architecture>.bash

where `NDDSHOME` is the location of the **RTI Connext DDS** *installation directory*.

## Generating Types

*NOTE: the build steps automatically take care of the generation. The manual steps are
listed below.*

Generate the XML representation of the datatypes from XML as follows:

    rtiddsgen -convertToXml res/types/data/<path/to/datatype>_t.idl

 

## Visualizing the software system architecture using emulated components

- Run the emulated component interfaces

        ./bin/drive

  To stop the drive data flow emulator, press ^C

  The drive emulator uses the `RTI Prototyper with Lua` to emulate the software system architecture.
  - Run `RTI Admin Console` to visualize databus.
  - Run `rtiddsspy` to view the data.


## Running the Components Individually 

*NOTE: The steps below show how to emulate individual components*

### Run a Publisher

Open a Terminal Window, and run the test publisher:

    # Setup the Drive Service Configuration
    source res/cfg/Drive_QOS_PROVIDER.sh

    # Run the Drive Service in RTI Prototyper
    rtiddsprototyper -luaOnData 0 -luaFile src/utils/Publisher.lua -cfgName <ServiceName>_svc::<InterfaceName>


### Run a Subscriber

Open a Terminal Window, and run the test subscriber:

    # Setup the Drive Service Configuration
    source res/cfg/Drive_QOS_PROVIDER.sh

    # Run the Drive Service in RTI Prototyper
    rtiddsprototyper -luaOnPeriod 0 -luaFile src/utils/Subscriber.lua -cfgName <ServiceName>_svc::<InterfaceName>


## Run rtiddsspy

Open a Terminal Window, and run spy:

    rtiddsspy -printSample

 

## Run RTI Admin Console

View the system connectivity using 
[RTI Admin Console](https://www.rti.com/gettingstarted/adminconsole).

Use the RTI Launcher to launch RTI Admin Console, or 
Open a Terminal Window and type:

    rtiadminconsole


## Adding a new service

To add a new service, called `My`:

1. Define the service interfaces in `if/My_svc.xml`
2. Add service interface specific qos profiles in: `res/qos/services/Drive_qos.xml`
3. Add service interface deployment specific qos profiles in: `res/qos/systems/Drive-default_qos.xml`
4. Add service to the `NDDS_QOS_PROFILES` in the file: `res/cfg/Drive_QOS_PROVIDER.sh`
5. Add service interface constants in: `res/types/services/My_svc_t.idl` and update the `CMakeLists.txt` file
6. Test the service interfaces using `rtiddsprototyper`
7. Update [drive](../bin/drive) script(s) to append the new service interface to the `COMPONENT` list


## Implementing Components

Component interface implementations are independently **defined elsewhere in other project repositories**. Those component implementation repositories depend on this repository for the common data model, component interfaces, and the common build system.

The component implementations defined elsewhere can be mixed and matched with the emulated components defined in this repository. This allows a software system to be built incrementally, where some interfaces are emulated, while others are fully implemented components.

---
(C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.