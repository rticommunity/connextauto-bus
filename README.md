# Common Data Architecture

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Data Architecture Emulation](#data-architecture-emulation)
- [Exploring Further](#exploring-further)
- [References](#references)

## Introduction

The *common data architecture* repo defines a [software databus](https://github.com/rajive/doma-skel/blob/master/doc/doma/Bus.md) comprising of:

- A **common [Data Model](https://github.com/rajive/doma-skel/blob/master/doc/doma/DataModel.md)** using the [DDS](https://www.dds-foundation.org/omg-dds-standard/) standard
-  Component **[Data Interfaces](https://github.com/rajive/doma-skel/blob/master/doc/doma/Interface.md)**
  that use the common data model

These can be opened and edited in the [RTI System Designer](https://community.rti.com/documentation#doc_tools) or using a code editor with XML completion.

In addition, the repo provides:
  - An emulation of the software system architecture **functional blocks** and **data flows** for software system architects
- A **[common build system](doc/Build.md)** for building the interfaces and components for the convenience of application developers

The repo showcases an approach for rapidly building large distibuted software systems, with components developed by multiple independent teams. The common data architecture serves as the *lingua franca* for **software system integration**.

A component *data interface* is an executable contract that a **software system architecture team** can share with an **application development team** for implementing a component. Each application devleopment team can work independently, with the assurance that their component implementation would be easily and quickly integrated into the software system.  The system software architecture team can independently evolve the data models and data interfaces consistently across application development teams, to support rapid and agile software development.

The common data model can be used to define many component data interfaces. The component data interfaces defined in this repo should be regarded as examples of  possible functional decomposition of a software system architecture using the common data model. For each component data interface, many implementations are possible. Components implement component data data interfaces defined in this repo.

Component implementations may be written in any supported programming language of choice with any RTI Connext DDS Software Development Kit (SDK) such as *RTI Connext Professional* or *RTI Connext Micro*. Component implementations could also be written using a scipting language such as Python, Lua, or JavaScript---especially useful for generating test data, prototyping, or emulation.

Components implementations are provided by **component specific project repositories *defined elsewhere*** (see [Usage](#usage)). This repo provides a **common build system** for application developers, to build generated datatypes and data interfaces into a common library that can be linked to by component implementations. The *common build system* is intended to be used by component repositories that use this repo. Thus, this repo would be a dependency (prerequisite) for building independent standalone components using the provided *common data model, data interfaces, and build system*.

However, this repo provides a way to emulate and visualize the *software system architecture functional blocks and data flows* for system software architects. Each component data interface is emulated using  *[RTI Prototyper with Lua](https://community.rti.com/static/documentation/connext-dds/6.1.0/doc/manuals/connext_dds_professional/tools/prototyper/index.htm#prototyper/LuaComponentProgModel.htm%3FTocPath%3D7.%2520Lua%2520Component%2520Programming%2520Model%7C_____0)*. The data flows and the component data interfaces can be visualized using *[RTI Admin Console](https://www.rti.com/gettingstarted/adminconsole)*. Thus, changes to the data model data interfaces can be quickly visualized and validated at the software system architecture level.


## Prerequisites

Please ensure that the following are installed on your development host:

- [CMake](https://cmake.org/): 3.20 or later
- A [RTI Connext SDK](https://community.rti.com/documentation/), i.e. one or both of the following:
  - RTI Connext DDS Professional: 7.3 LTS or later
  - RTI Connext DDS Micro: 2.4.14.2 or later


Currently this repo and the common build system had been verified on the following development hosts:

- OCI Containers (docker)
- Linux
- macOS
- Windows


## Getting Started
### Get this repo

- Clone (or fork and clone) this repo

      git clone <a_git_url_to_this_repository>

### Browse the Data Architecture in System Designer

- Launch [RTI System Designer](https://community.rti.com/static/documentation/connext-dds/current/doc/manuals/connext_dds_professional/tools/system_designer/index.html)

- Open the `connextauto.rtisdproj`

### Setup the environnment variables

- Setup the [DATABUSHOME](doc/DATABUSHOME.md) environment variable to point to [this repo](./)

      cd </path/to/this/repo/>         # created by git clone above
      export DATABUSHOME=$(pwd -P)     # /path/to/this/repo

- Setup environment variables for at least one RTI Connext SDK:
  - If you want to build for *RTI Connext DDS Professional*, setup `NDDSHOME`

      export NDDSHOME=/path/to/<rti_connext_dds-x.y.z>

  - If you want to build for *RTI Connext DDS Micro*, setup `RTIMEHOME`

      export RTIMEHOME=/path/to/<rti_connext_dds_micro-x.y.z>

  - Setup both `NDDSHOME` and `RTIMEHOME` if you want to build for **both SDKs**.

- Setup environment variables for your architecture. Example:

      export RTI_ARCH=x64Linux4gcc7.3.0

### Generate the build system for at least one RTI Connext SDK

From the repo's top-level directory:

- To generate the build system for *RTI Connext DDS Professional*, e.g.

      $DATABUSHOME/bin/build-gen.sh pro $RTI_ARCH Debug

- To generate the build system for *RTI Connext DDS Micro*, e.g.

      $DATABUSHOME/bin/build-gen.sh micro $RTI_ARCH Debug

This step creates a `build/` directory in the project top-level directory. The `build/` directory contains a shell script to build for the specified target platform and build kind.

For more details, please refer to the documentation on the [common build system](doc/Build.md).

### Build the datatypes for at least one RTI Connext SDK

From this git repo's top-level directory, run the generated build script to build the datatypes:

- To build for *RTI Connext DDS Professional*, e.g.:

      ./build/pro-$RTI_ARCH-Debug.sh

- To build for *RTI Connext DDS Micro*, e.g.:

      ./build/micro-$RTI_ARCH-Debug.sh

This step generates the equivalent XML representations of the datatypes in the [res/types/](res/types/) directory tree. It also ensures that the code generated from the IDL datatype definitions in this repo are buildable for the selected target platform.

The generated XML datatype representations are now ready for use by the emulators, tools, and infrastruture services, and components that use dynamic datatypes.

Repeat this step everytime a source *IDL* or *XML App Creation* file is updated.

For more details, please refer to the documentation on the [common build system](doc/Build.md).


## Usage

- Use [RTI System Designer](https://community.rti.com/static/documentation/connext-dds/current/doc/manuals/connext_dds_professional/tools/system_designer/index.html) or 
a code editor with XML completion to browse and edit the Data Architecture in *this* repo

- Use the [connextauto-swc-template](https://github.com/rticommunity/connextauto-swc-template) to create a new software component repo

- Follow the [Getting Started](https://github.com/rticommunity/connextauto-swc-template?tab=readme-ov-file#getting-started) in README of the new software component repo

- Populate the [`CMakeLists.txt`](Mhttps://github.com/rticommunity/connextauto-swc-template/blob/master/CMakeLists.txt) in the new software component repo with list of executables to build, the source files, the SDKs to build for, and the libraries to link.

- To include datatypes, use the paths to the datatype files (`.idl`) **relative** to the `$DATABUSHOME` top-level directory. For example, in C or C++:

      #include "res/types/data/sensing/Camera_t.h"
      #include "res/types/data/sensing/Camera_tSupport.h"

- You are free to organize and implement the new component repo as it befits the implementation. Take a look a other [`connextauto-swc-*/`](https://github.com/orgs/rticommunity/repositories?q=connextauto) repositories for ideas.


## Data Architecture Emulation

The open *data architecture* defined in this repo can be quickly emulated and visualized without the need for implementing new components in code. The technique is useful for software system architects as new datatypes, qos profiles, and data interfaces are added to the repo and architectue considerations are being evaluated.

Selected examples of data architecture emulation are descibed below.
- [Shapes](doc/Shapes.md) : DDS Shapes Demo
- [Drive](doc/Drive.md) : Automated and Assisted Driving (AD)

*NOTE: The data interface emulation currently relies on Lua scripting provided by the
[RTI Prototyper](https://community.rti.com/documentation/rti-connext-dds-612#doc_tools),
and that was deprecated after RTI Connext 6.1.2 LTS. The examples below
use the [rtiddsprototyper](https://community.rti.com/static/documentation/connext-dds/6.1.2/doc/manuals/connext_dds_professional/tools/prototyper/index.htm#prototyper/LuaComponentProgModel.htm%3FTocPath%3D7.%2520Lua%2520Component%2520Programming%2520Model%7C_____0)
from RTI Connext 6.1.2, by simply overriding the NDDSHOME environment variable, as shown below.*

      env NDDSHOME=/path/to/rti_connext_dds-6.1.2
      $DATABUSHOME/bin/run <env_name> ./bin/<script> [<args>]

### Run the *Shapes* emulation

From this git repo's top-level directory, run an emulation of the [Shapes](https://www.rti.com/products/tools/shapes-demo) data interfaces as follows:

      env NDDSHOME=/path/to/rti_connext_dds-6.1.2 \
      $DATABUSHOME/bin/run Shapes ./bin/Shapes [domainId]

where the [bin/Shapes](bin/Shapes) component emulates the Shapes data interfaces using *RTI Prototyper with Lua*.

- For more details on running components, please refer to the documentation on the [common component launcher](doc/Run.md) utility.
- Use the [RTI Admin Console](https://www.rti.com/gettingstarted/adminconsole) to visualize the data flows and the emulated component data interfaces.
- Use [rtiddsspy](https://community.rti.com/static/documentation/connext-dds/7.0.0/doc/manuals/connext_dds_professional/tools/rti_dds_spy/index.html) to view the data.

To stop the shapes data flow emulator, press `^C` (Control-C)

For more details, please refer to the documentation on
[Shapes](doc/Shapes.md) data architecture.

### Run the *Drive* emulation

From the git repo's top-level directory, run an emulation of the *Drive* interfaces as follows:

      env NDDSHOME=/path/to/rti_connext_dds-6.1.2 \
      $DATABUSHOME/bin/run Drive ./bin/Drive [domainId]

where the [bin/Drive](bin/Drive) component emulates the Drive data interfaces using *RTI Prototyper with Lua*.

- For more details on running components, please refer to the documentation on the [common component launcher](doc/Run.md) utility.
- Use the [RTI Admin Console](https://www.rti.com/gettingstarted/adminconsole) to visualize the data flows and the emulated component data interfaces.
- Use [rtiddsspy](https://community.rti.com/static/documentation/connext-dds/7.0.0/doc/manuals/connext_dds_professional/tools/rti_dds_spy/index.html) to view the data.

To stop the drive data flow emulator, press `^C` (Control-C)

For more details, please refer to the documentation on the
[Drive](doc/Drive.md) data architecture.

## Exploring Further

- Common Data Model
  - [data types](res/types/data/) (structure)
  - [qos of service](res/qos/data/) (behavior)
- Component Data Interfaces
  - [Shapes](doc/Shapes.md) : DDS Shapes Demo
  - [Drive](doc/Drive.md) : Automated and Assisted Driving (AD)
- [Data-Oriented Micro-Services Architecture (DOMA)](https://github.com/rajive/doma-skel) : an approach to data-centric system software architecture repository organization that supports independent lifecycles for artifacts that need to be maintained by system software architects and by applicaton developers.
  -  Databus repository : this repository, maintained by system architects, that defines the data flows and [component data interfaces](if/) declaratively
  - Component repositories : downstream component repositories, maintained by application developers, that implement [component data interfaces](if/) defined in this repository using the [common build system](doc/Build.md)
- [Common Component Launcher](doc/Run.md) utility
- [Common Build System Generator](doc/Build.md) utility

Component implementations are independently **defined elsewhere in other project repositories**. Those component implementation repositories depend on this repository for the common data model, the component data interfaces, the common build system, and the common component launcher.

The component implementations defined elsewhere can be mixed and matched with the emulated components defined in this repository. Such an approach allows a software system to be built and tested incrementally, where some data interfaces are emulated, while others are being fully implemented.

## References

- [TR-005 Data-Oriented Communication Architecture for Automated and Assisted Driving Systems](https://avcc.org/tr005/)
- [TR-001 Conceptual Architecture for Automated and Assisted Driving Systems](https://avcc.org/tr001/)
- [Data-Oriented Architecture: A Loosely-Coupled Real-Time SOA](https://community.rti.com/archive/data-oriented-architecture-loosely-coupled-real-time-soa)

---
(C) Copyright 2020-2025 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs.

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.
