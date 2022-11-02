# Common Component Launcher

The common run helper provides a laucher for [component](doma/Component.md) executables. It ensures that [components](doma/Component.md) are launched with the correct environment for a [service](doma/Service.md).

## Component Launcher: run

The `run` utility is invoked from any repo using the [DATABUSHOME](DATABUSHOME.md) environment variable to specify its full path. This ensures that all downstream component executables are run consistently using same service environment as defined by the [databus](../) repo.

    $DATABUSHOME/bin/
    run <service_env> <path/to/dds/component/executable> [<args>]

  where 
   - `<service_env>` is the name the service environment for the executable

   - `<path/to/dds/component/executable>` is the path to the executable

   - `[<args>]` are the optional arguments that are passed through to the  executable (and may be interpreted by the executable)

The `run` utility loads the service environment from the file: [res/cfg/\<service_env\>.sh](../res/cfg/), changes the working directory to [DATABUSHOME](DATABUSHOME.md) (so that relative paths in XML files are resolved correctly), and then launches the component executable, passing it any specified arguments.

For *RTI Connext DDS Professional* the run utility sets up the environment to load the XML files (if any) needed by the component executable.

## Running Apps Using the Component Launcher

To use the service environment `<service_env>` for launching the component `<app>`:

    $DATABUSHOME/bin/run <service_env> ./build/<connext_sdk>/<target_arch>/<build_type>/<app> [<args>]


## Example

To use the service environment `Drive` for launching `app` built using the RTI Professional SDK on the macOS with Debug enabled, i.e. for the combination: *(pro, x64Darwin17clang9.0, Debug)*:

- Ensure [DATABUSHOME](DATABUSHOME.md) is defined

        export DATABUSHOME=/path/to/the/databus/repo
     
- Launch the component executable

        $DATABUSHOME/bin/run Drive ./build/pro/x64Darwin17clang9.0/app [<args>]


To use the service environment `Drive` for launching `app` built using the RTI Professional SDK on the macOS with Debug enabled, i.e. for the combination: *(micro, x64Darwin17clang9.0, Debug)*:

- Ensure [DATABUSHOME](DATABUSHOME.md) is defined

        export DATABUSHOME=/path/to/the/databus/repo
     
- Launch the component executable

        $DATABUSHOME/bin/run Drive ./build/micro/x64Darwin17clang9.0/app [<args>]

---
(C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.
