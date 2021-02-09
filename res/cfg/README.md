# res/cfg/

## Purpose

Configuration files specific to a component's operation. 

Examples include:

- Configuration files for DDS Persistence component etc.

- Configuration files for user-defined service components.

- Environment variable settings, for example, to specify
the list of DDS-XML files and other environment variable dependencies



## Organization

A component *<name>* configuration is defined in a file as follows:

 - `<name>`[-`<config_name>`].sh
   - a named configuration for component `<name>`

For example, to setup a runtime environment

        source <name>[-<config_name>].sh
