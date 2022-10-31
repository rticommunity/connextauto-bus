# Common Build System

The common build system ensures that datatypes and component interfaces defined in this repo, and the source code defined in downstream component repositories are compiled and linked consistently (e.g. with the right compiler and linker options etc.) to create an executable component (i.e. an app binary).

When a datatype or interface definition in this repo changes, the common library should be rebuilt, followed by the downstream components. The workflow reduces the build time since the datatypes only need to be built once for all the components (and not per component).

The common build system allows a developer to maintain multiple parallel builds for any combination of build kinds (release vs debug), RTI Connext SDKs (pro vs micro) for any of the RTI Connext supported target architecture platform. This capability is especially useful when different software components need to use different RTI Connext SDKs, different software components need to run on different compute platfoms, or when a subset of software components need to be run using a *debug* build.


## Build System Generator: build-gen

The `build-gen` utility uses [CMake](https://cmake.org/) to generate a build system for the selected build kind (release or debug), selected RTI Connext SDK (pro or micro), for the selected the RTI Connext supported target architecture platforms.

The `build-gen` utility is invoked from any repo using the [DATABUSHOME](DATABUSHOME.md) environment variable to specify its full path. This ensures that all downstream component repos are built consistently and linked to the same databus libraries as built by the [databus](../) repo.

    $DATABUSHOME/bin/
    build-gen.sh [<connext_sdk> [<target-arch> [<build_type>]]]

  where 
  - `<connext_sdk>` is the name that you want to use to refer to the build 
     for the selected SDK.  In the documentation, we use the names

      - `pro` *(default)* | `micro` | `micro2` for RTI Connext DDS Professional, RTI Connext DDS Micro, and RTI Connext DDS Micro 2 respectively.
      
    - for `pro*`, the environment variable `NDDSHOME` must be set to point to the location of the *RTI Connext DDS Professional* installation directory

            export NDDSHOME=/path/to/<rti_connext_dds-x.y.z>

    -  for `micro*`, the environment variable `RTIMEHOME` must be set to point to the location of the *RTI Connext DDS Micro* installation directory

            export RTIMEHOME=/path/to/<rti_connext_dds_micro-x.y.z>

  - `<target-arch>` is a RTI Connext SDK supported platform targe architecture; for example, on macOS `x64Darwin17clang9.0` *(default)*

  - `<build_type>` is the type of build
    - `Debug` *(default)*: to build using the debug libraries of the selected RTI Connext SDK
    - `Release` : to build using the release libraries of the selected RTI Connext SDK 

The output of the `build-gen` build system generator is a `./build/` directory (if not already present) in the  *working  directory* (i.e. the directory from where the `$DATABUSHOME/bin/build-gen.sh` utility was invoked) containing the following files:

    ./build/
        <connext_sdk>-<target_arch>-<build_type>.sh
        <connext_sdk>/
            <target_arch>/
                <build_type>/

- The build script `<connext_sdk>-<target_arch>-<build_type>.sh` is a helper to run the build system with the default settings. 
- The `<connext_sdk>/<target_arch>/<build_type>/` tree holds the build artifacts (generated files, binaries, etc.) for the selected combination of *(connext_sdk, target_arch, build_type)*.

The  `build-gen` utility can be invoked for any desired combinations of 
`(connext_sdk, target_arch, build_type)`. An isolated build tree is generated for each combination and can co-exist simultanepously with other build trees. Each tree can be built in parallel from the same source files---thus making it very easy to maintain multiple build variants for a component without cluttering the source file directories.

To clean the generated build system files, simply delete the generated build script and the build tree. 

    rm ./build/<connext_sdk>-<target_arch>-<build_type>.sh
    rm -rf <connext_sdk>/<target_arch>/<build_type>/

You can clean *all* the generated build systems simply by removing the generated `./build/` directory.
      
    rm -rf build/

The generated build system files should **not** be checked into a version control system. They can be (re)created anytime using the `build-gen` utility.

The build system generation step needs to be done just once for a selected combination of *(connext_sdk, target_arch, build_type)*. It needs be regenerated only if the environment variables `DATABUSHOME`, `NDDSHOME`, or `RTIMEHOME` change. Note that the build system itself does not need to be re-generated when source files change.


## Building Repos Using the Generated Build System

Once a build system is generated, it can be used again and again to build a repository, whenever the source files change. The output of a build may one or more binaries. A binary may be a library or an executable component. 

- To build a repo with the default settings

        ./build/<connext_sdk>-<target_arch>-<build_type>.sh

- The output binaries and generated code are located in the directory:

        ./build/<connext_sdk>/<target_arch>/<build_type>/

Executable binaries can be run using the [common component launcher](Run.md) utility.


## Example

To build for RTI Professional SDK on the macOS with Debug enabled, i.e. for the combination: *(pro, x64Darwin17clang9.0, Debug)*:

- Ensure [DATABUSHOME](DATABUSHOME.md) and `NDDSHOME` are defined

        export DATABUSHOME=/path/to/the/databus/repo
        export NDDSHOME=/path/to/<rti_connext_dds-x.y.z>

- **(Only Once)** Generate the build system (if not already generated):

        $DATABUSHOME/bin/build-gen.sh pro x64Darwin17clang9.0 Debug

    This generates the following build system files:

        ./build/
            pro-x64Darwin17clang9.0-Debug.sh
            pro/
                x64Darwin17clang9.0/
                    Debug/

- **(Repeat)** Build the repo (whenever the repo source files change):

        ./build/pro-x64Darwin17clang9.0-Debug.sh

To build for RTI Micro SDK on the macOS with Debug enabled, i.e. for the combination: *(micro, x64Darwin17clang9.0, Debug)*:

- Ensure [DATABUSHOME](DATABUSHOME.md) and `RTIMEHOME` are defined

        export DATABUSHOME=/path/to/the/databus/repo
        export RTIMEHOME=/path/to/<rti_connext_dds_micro-x.y.z>

- **(Only Once)** Generate the build system (if not already generated):

        $DATABUSHOME/bin/build-gen.sh micro x64Darwin17clang9.0 Debug

     This generates the following build system files:

        ./build/
            micro-x64Darwin17clang9.0-Debug.sh
            micro/
                x64Darwin17clang9.0/
                    Debug/

- **(Repeat)** Build the repo (whenever the repo source files change):

        ./build/micro-x64Darwin17clang9.0-Debug.sh


---
(C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.
