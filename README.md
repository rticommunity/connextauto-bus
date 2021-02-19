# Databus

The [databus](doc/doma/Bus.md) project comprises of:

- A common [Data Model](doc/doma/DataModel.md), and
- Component Micro-Service [Interfaces](doc/doma/Interface.md)
  that use the common data model


The databus project does not contain component implementations.
Many components implementations are possible for the the defined
component interfaces. Components implementations are provided by
component implementation specific projects define elsewhere.

The databus project does provide a way to run and visualize the
enrire system architecture by emulating all the dataflows.
Each component interface is  emulated using  *RTI Prototyper with Lua*.
The data flows and the component interfaces can be visualized
using *RTI Admin Console*.

The databus project also provides a way to build all the generated datatypes
and interfaces into libraries, ready to be linked with components
implementations. This saves not only time, but also ensures that all the
generated code is compiled in a consistemt manner with the right settings
(e.g. -unboundedSupport, -namespace etc.)

The databus project also provides a build system that can be used to
build the component implementations for the various service interfaces, and
ensures that interface libraries are linked correctly (e.g. with the right
compiler and linker options etc.)


- [Organization](doc/doma/README.md)
- [Documentation](doc/README.md)
- [Emulation](#emulation)
- [Building](#building)
- [Running](#running)


# `DATABUS_PROJECT_DIR`

The databus project may be used as a sub-project of other projects.

In the documentation, the variable `DATABUS_PROJECT_DIR/` is used to refer
to the path of this *databus* project directory (i.e. the directory
containing this [README](./README.md) file).

When the working directory is not the same as the databus project directory,
the appropriate `DATABUS_PROJECT_DIR` path should be used. It may  be a
relative path or absolute path.

For example:

    # when working directory is the databus project
    DATABUS_PROJECT_DIR = .

    # when the working directory contains the databus project as sub-directory
    DATABUS_PROJECT_DIR = databus

    # when the working directory is two levels above the databus project
    DATABUS_PROJECT_DIR = ../../databus


# Emulation

- Emulate the system architecture and data flows with emulated components
  (see [Drive Service](doc/Drive.md))

        [DATABUS_PROJECT_DIR/]bin/emulator [NDDSHOME]

  e.g.

        bin/emulator [NDDSHOME]
  or

        databus/bin/emulator [NDDSHOME]

  To stop the emulator, press ^C

  The emulator uses the *RTI Prototyper with Lua* to emulate the entire system
  architecture.

- Visualizing the system architecture
  - Run `RTI Admin Console` to visualize databus.
  - Run `rtiddsspy` to view the data.

- Emulated components can be mixed and matched with full component interface
  implementations defined elsewhere. This allows a system to be built
  incrementally, where some interfaces are emulated, while others are
  fully implemented components.

- To get started, component interfaces for the familiar *RTI Shapes Demo* are
  also provided (see [Shapes Service](doc/Shapes.md)). To emulate the Shapes
  Demo interfaces:

        [DATABUS_PROJECT_DIR/]bin/shapes [NDDSHOME]
  e.g.

        bin/shapes [NDDSHOME]
  or

        databus/bin/shapes [NDDSHOME]

  To stop the shapes mulator, press ^C



## Building

- Specify the **RTI Connext SDK** to build for, by setting the environment
  variables

  - `NDDSHOME` to the location of the RTI Connext DDS Professional
  - `RTIMEHOME` to the location of the RTI Connext Micro
     - needed only if building components for Connext DDS Micro

- Generate the build system

      [DATABUS_PROJECT_DIR/]bin/build-gen.sh [<connext_sdk> [<target-arch> [<build_type>]]]

  where 
  - `<connext_sdk>` is the name that you want to use to refer to the build 
     for the selected SDK.  In the documentation, we use the names
      - `pro` | `micro` | `micro2`
     for Connext Professional, Connext Micro, and Connext Micro 2 respectively.
  - `<build_type>` is the type of build
    - `Debug` : to build using the debug libraries of the selected RTI Connext SDK
    - `Release` : to build using the release libraries of the selected RTI Connext SDK 

  e.g. (default)

      bin/build-gen.sh pro x64Darwin17clang9.0 Debug
  or

      databus/bin/build-gen.sh pro x64Darwin17clang9.0 Debug

- Build the repository using the generated build system

      build/<connext_sdk>-<target_arch>-<build_type>.sh
        
  e.g. (pro):

      build/pro-x64Darwin17clang9.0-Debug.sh

- You can repeat the above steps for any desired combinations of 
  `(connext_sdk, target_arch, build_type)`

   - An isolated build tree is generated for each combination
         
         build/<connext_sdk>/<target_arch>/<build_type>/
   
   - A standalone build script is generated for each combination
         
         build/<connext_sdk>-<target_arch>-<build_type>.sh

   - All the combinations can co-exist 

- Cleaning the generated build system

   - Delete the `build` directory to remove ALL the generated build systems
      
         rm -rf build/

   - Remove a specific combination of the build tree by removing a specific 
     `build/<connext_sdk>/<target_arch>/<build_type>` tree, e.g.:

         rm -rf build/pro/x64Darwin17clang9.0/Debug

## Running

Once components are built (see [Building](#building)), the component
applications can be launched as follows.

- Connext Professional Apps

    The `[DATABUS_PROJECT_DIR/]/bin/run` app launcher sets up the environment
    to load the XML files (if any) needed by the Connext Profesional
    Applications. It should  be used to launch the Connext Professional Apps
    as follows:

        [DATABUS_PROJECT_DIR/]bin/run build/pro/<target_arch>/<build_type>/MyApp

    e.g.

        bin/run build/pro/<target_arch>/<build_type>/MyApp
    or

        databus/bin/run build/pro/<target_arch>/<build_type>/MyApp

- Connext Micro Apps

     The `databus/bin/run` app launcher can also be used to launch the Connext 
     Micro Applications, even though the micro apps do not need the XML 
     environment:

        [DATABUS_PROJECT_DIR/]bin/run build/pro/<target_arch>/<build_type>/MyApp

     e.g.

        bin/run build/pro/<target_arch>/<build_type>/MyApp
     or

        databus/bin/run build/pro/<target_arch>/<build_type>/MyApp


     *NOTE:* The Connext Micro Apps can also be simply launched directly:

        build/micro/<target_arch>/<build_type>/MyApp

