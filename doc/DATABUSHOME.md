# DATABUSHOME

The `DATABUSHOME` environment variable is used to access the common databus utilities from anywhere---including this repo and downstream component repositories defined elsewhere. 

It's value is the path to the [databus repo's root directory](../).

- Setup the `DATABUSHOME` environment variable to point to [the databus repo](../)

      cd </path/to/the/databus/repo/>   # change working directory
      export DATABUSHOME=$(pwd -P)      # /path/to/working/directory

- `$DATABUSHOME` refers to the value of the `DATABUSHOME` environment variable and must always expand to the path to [the databus repo's root directory](../) on the development host.

---
(C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.

The use of this software is governed by the terms specified in the RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 

By accessing, downloading, or otherwise using this software, you agree to be bound by those terms.
