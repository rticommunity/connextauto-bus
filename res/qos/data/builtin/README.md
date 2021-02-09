# res/qos/flows/builtin/

## Purpose

Builtin Qos Profiles that are available in the standard product. 

Satisfy the missing "dependencies" on builtin profiles for DDS products that 
don't already provide builtin profiles.


## Organization

A builtin Qos library is defined in a DDS-XML file as follows:

- `<product_name>`_qos.xml
  - collection of builtin qos profiles, to satisfy the missing dependencies 
  - provide behavior equivalent to the standard builtin qos profiles
