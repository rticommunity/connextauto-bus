# Shapes Service

The *Shapes* service comprises of the data flows and the interfaces defined by the [RTI Shapes Demo](https://www.rti.com/products/tools/shapes-demo). It consists of the following artifacts.
- Common Data Model
  - [data types](../res/types/data/) (structure)
    - [ShapeType_t.idl](../res/types/data/demo/ShapeType_t.idl)
  - [qos of service](../res/qos/data/) (behavior)
     - [Shapes_qos.xml](../res/qos/services/Shapes_qos.xml)
- Micro Service and Component Interfaces
  - [databus](doma/Bus.md)
    -  [Shapes.xml](../if/Shapes.xml)
  - [interfaces](doma/Interface.md)
    - [Shapes_Pub](../if/Shapes_Pub.xml)
    - [Shapes_Sub](../if/Shapes_Sub.xml)
    - [Shapes_PubSub](../if/Shapes_PubSub.xml)
  - [constants](../res/types/services/README.md)
    - [Shapes_t.idl](../res/types/services/Shapes_t.idl)
- Micro Service Environment
  - [Shapes_QOS_PROVIDER.sh](../res/cfg/Shapes_QOS_PROVIDER.sh) 

The *Shapes* service artifacts are organized as shown below.

    .
    ├── bin
    │   └── Shapes
    ├── doc
    │   └── Shapes.md
    ├── if
    │   ├── Shapes.xml
    │   ├── Shapes_Pub.xml
    │   ├── Shapes_PubSub.xml
    │   └── Shapes_Sub.xml
    └── res
        ├── cfg
        │   └── Shapes_QOS_PROVIDER.sh
        ├── qos/services
        │   └── Shapes_qos.xml
        └── types/services
            └── Shapes_t.idl

The *Shapes* service interfaces are interoperable with the [RTI Shapes Demo](https://www.rti.com/gettingstarted/shapes-demo). They can be used to implement new components that can exchange data with the *RTI Shapes Demo* app.

For details on how to run an emulation of the Shapes service, please refer to [Run the *Shapes* service emulation](../README.md#run-the-shapes-service-emulation)

To emulate a specific interface, say [Shapes::Pub](../if/Shapes_Pub.xml), using the [RTI Prototyper with Lua](https://community.rti.com/static/documentation/connext-dds/6.1.0/doc/manuals/connext_dds_professional/tools/prototyper/index.htm#prototyper/LuaComponentProgModel.htm%3FTocPath%3D7.%2520Lua%2520Component%2520Programming%2520Model%7C_____0), use the [common component launcher](Run.md) utility as follows:

    $DATABUSHOME/bin/run Shapes_QOS_PROVIDER $NDDSHOME/bin/rtiddsprototyper -luaOnData 0 -luaFile src/utils/Publisher.lua -cfgName Shapes::Pub

---
(C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.