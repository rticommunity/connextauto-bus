# Drive Service

The *Drive* service comprises of the data flows and the interfaces defined for Automated and Assisted Driving (AD). Over time, the intention is to cover [SAE levels 2 to 5](https://www.sae.org/standards/content/j3016_202104/). The data-centric approach allows the sotware system architectuture to include new data flows and component interfaces for increasing levels of autonomy, and evolve incrementally over time. Currently, the *Drive* service consists of the following artifacts.

- Common Data Model
  - [data types](../res/types/data/) (structure)
    - [res/types/data/**/*_t.idl](../res/types/data/)
  - [qos of service](../res/qos/data/) (behavior)
     - [Drive_qos.xml](../res/qos/services/Drive_qos.xml)
     - [Drive-default_qos.xml](../res/qos/systems/Drive-default_qos.xml)
- Micro Service and Component Interfaces
  - [databus](doma/Bus.md)
    -  [Drive.xml](../if/Drive.xml)
  - [interfaces](doma/Interface.md)
    - [Drive_*.xml](../if/)
  - [constants](../res/types/services/README.md)
    - [Drive_t.idl](../res/types/services/Drive_t.idl)
- Micro Service Environment
  - [Drive_QOS_PROVIDER.sh](../res/cfg/Drive_QOS_PROVIDER.sh) 

The *Drive* service artifacts are organized as shown below.

    .
    ├── bin
    │   └── Drive
    ├── doc
    │   └── Drive.md
    ├── if
    │   ├── Drive.xml
    │   ├── Drive_Actuator.xml
    │   ├── Drive_CAN.xml
    │   ├── Drive_Camera.xml
    │   ├── Drive_HMI.xml
    │   ├── Drive_Lidar.xml
    │   ├── Drive_Perceptor.xml
    │   └── Drive_Planner.xml
    └── res
        ├── cfg
        │   └── Drive_QOS_PROVIDER.sh
        ├── qos
        │   ├── services
        │   │   └── Drive_qos.xml
        │   └── systems
        │       └── Drive-default_qos.xml
        └── types/services
            └── Drive_t.idl

For details on how to run an emulation of the Drive service, please refer to [Run the *Drive* service emulation](../README.md#run-the-drive-service-emulation)

To emulate a specific interface, say [Drive::Camera](../if/Drive_Camera.xml), using the [RTI Prototyper with Lua](https://community.rti.com/static/documentation/connext-dds/6.1.0/doc/manuals/connext_dds_professional/tools/prototyper/index.htm#prototyper/LuaComponentProgModel.htm%3FTocPath%3D7.%2520Lua%2520Component%2520Programming%2520Model%7C_____0), use the [common component launcher](Run.md) utility as follows:

    $DATABUSHOME/bin/run Drive_QOS_PROVIDER $NDDSHOME/bin/rtiddsprototyper -luaOnData 0 -luaFile src/utils/Publisher.lua -cfgName Drive::Camera

---
(C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.