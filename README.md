# Software Databus

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Exploring Further](#exploring-the-repository)

## Introduction

This [software databus](doc/doma/Bus.md) project repo comprises of:

- A **common [Data Model](doc/doma/DataModel.md)** using the [DDS](https://www.dds-foundation.org/omg-dds-standard/) standard
-  Micro **[Services](doc/doma/Service.md)** and Component **[Interfaces](doc/doma/Interface.md)**
  that use the common data model
- A **[common build system](doc/Build.md)** for building the interfaces and the components that use those interfaces

The common data model can be used to define many component interfaces. Thus the component interfaces defined in this repo should be regarded as examples of  possible functional decomposition of a software system architecture using the common data model. 

For each component interface, many implementations are possible. Component implementations may be written in any supported programming language of choice with any RTI Connext DDS Software Development Kit (SDK) such as *RTI Connext Professional* or *RTI Connext Micro*. Component implementations could also be written using a scipting language such as Python, Lua, or JavaScript---especially useful for generating test data, prototyping, or emulation. This repo does **not** contain component implementations. Components implementations are provided by **component specific project repositories *defined elsewhere***. Components implement component interfaces defined in this repo. 

This repo provides a **common build system** for building generated datatypes and interfaces into a common library that can be linked to by component implementations. The *common build system* is intended to be used by use by component repositories that use this repo. Thus, this repo is a dependency (prerequisite) for building independent standalone components using the provided *common data model, interfaces, and build system*.

This repo also provide a way to emulate and visualize the *software system architecture functional blocks and data flows*. Each component interface is emulated using  *[RTI Prototyper with Lua](https://community.rti.com/static/documentation/connext-dds/6.1.0/doc/manuals/connext_dds_professional/tools/prototyper/index.htm#prototyper/LuaComponentProgModel.htm%3FTocPath%3D7.%2520Lua%2520Component%2520Programming%2520Model%7C_____0)*. The data flows and the component interfaces can be visualized using *RTI Admin Console*. Thus, changes to the data model and functional interfaces can be quickly visualized and validated at the software system architecture level.


## Prerequisites

Please ensure that the following are installed on your development host:

- [CMake](https://cmake.org/): 3.14 or later
- A [RTI Connext SDK](https://community.rti.com/documentation/), i.e. one or both of the following:
  - RTI Connext DDS Professional: 6.1.1 LTS or later
  - RTI Connext DDS Micro: 2.4.14 or later


Currently this repo and the common build system had been verified on the following development hosts:
- macOS
- Linux: ubuntu:20.04, docker/ubuntu:20.04​

## Getting Started
### Get this repo

- Clone (or fork and clone) this repo

      git clone <a_git_url_to_this_repository>

### Setup the environnment variables

- Setup the [DATABUSHOME](doc/DATABUSHOME.md) environment variable to point to [this repo](./)

      cd </path/to/this/repo/>         # created by git clone above
      export DATABUSHOME=$(pwd -P)     # /path/to/this/repo

Setup environment variables for at least one RTI Connext SDK:
- If you want to build for *RTI Connext DDS Professional*, setup `NDDSHOME`

      export NDDSHOME=/path/to/<rti_connext_dds-x.y.z>

- If you want to build for *RTI Connext DDS Micro*, setup `RTIMEHOME`

      export RTIMEHOME=/path/to/<rti_connext_dds_micro-x.y.z>

- Setup both `NDDSHOME` and `RTIMEHOME` if you want to build for **both SDKs**.

### Generate the build system for at least one RTI Connext SDK
 
From the repo's top-level directory:

- To generate the build system for *RTI Connext DDS Professional*, e.g.

      $DATABUSHOME/bin/build-gen.sh pro x64Darwin17clang9.0 Debug

- To generate the build system for *RTI Connext DDS Micro*, e.g.

      $DATABUSHOME/bin/build-gen.sh micro x64Darwin17clang9.0 Debug

This step creates a `build/` directory in the project top-level directory. The `build/` directory contains a shell script to build for the specified target platform and build kind.

For more details, please refer to the documentation on the [comon build system](doc/Build.md). 

### Build the datatypes for at least one RTI Connext SDK

From this git repo's top-level directory, run the generated build script to build the datatypes:

- To build for *RTI Connext DDS Professional*, e.g.:

      ./build/pro-x64Darwin17clang9.0-Debug.sh

- To build for *RTI Connext DDS Micro*, e.g.:

      ./build/pro-x64Darwin17clang9.0-Debug.sh

This step generates the equivalent XML representations of the datatypes in the [res/types/](res/types/) directory tree. It also ensures that the code generated from the IDL datatype definitions in this repo are buildable for the selected target platform.
  
The generated XML datatype representations are now ready for use by the emulators, tools, and infrastruture services, and components that use dynamic datatypes.

Repeat this step everytime a source *IDL* or *XML App Creation* file is updated.

For more details, please refer to the documentation on the [comon build system](doc/Build.md).

### Run the *Shapes* service emulation

From this git repo's top-level directory, run an emulation of the [Shapes](https://www.rti.com/products/tools/shapes-demo) service interfaces as follows:
      
      $DATABUSHOME/bin/run Shapes_QOS_PROVIDER ./bin/shapes [domainId]

where the [bin/shapes](bin/shapes) component emulates the Shapes interfaces using *RTI Prototyper with Lua*.

- For more details on running components, please refer to the documentation on the [common component launcher](doc/Run.md) utility.
- Use the `RTI Admin Console` to visualize the data flows and the emulated component interfaces. 
- Use `rtiddsspy` to view the data.

To stop the shapes data flow emulator, press `^C` (Control-C)

For more details, please refer to the documentation on the
[Shapes Service](doc/Shapes.md). 

### Run the *Drive* service emulation

From the git repo's top-level directory, run an emulation of the *Drive* service interfaces as follows:
      
      $DATABUSHOME/bin/run Drive_QOS_PROVIDER ./bin/drive [domainId]

where the [bin/drive](bin/drive) component emulates the Drive interfaces using *RTI Prototyper with Lua*.

- For more details on running components, please refer to the documentation on the [common component launcher](doc/Run.md) utility.
- Use the `RTI Admin Console` to visualize the data flows and the emulated component interfaces. 
- Use `rtiddsspy` to view the data.

To stop the drive data flow emulator, press `^C` (Control-C)

For more details, please refer to the documentation on the 
[Drive Service](doc/Drive.md). 

## Exploring Further

- Common Data Model
  - [data types](res/types/data/) (structure)
  - [qos of service](res/qos/data/) (behavior)
- Micro Services and Component Interfaces
  - [Shapes](doc/Shapes.md) : DDS Shapes Demo Service
  - [Drive](doc/Drive.md) : Automated and Assisted Driving (ADAS) Service
- [Data-Oriented Micro-Services Architecture (DOMA)](doc/doma/README.md) : software system architecture and repository organization
  - Component repositories : a downstream component repository would implement one or more [component interfaces](if/) defined in this repository using the [comon build system](doc/Build.md)
  - System repositories: a downstream system repository would configure multiple components for a deployment to realize system use cases
- [Common Component Launcher](doc/Run.md) utility
- [Common Build System Generator](doc/Build.md) utility

---
(C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.
