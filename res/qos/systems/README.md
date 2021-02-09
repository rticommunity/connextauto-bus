# res/qos/systems/

## Purpose

[System](../../../doc/doma/System.md) Qos Profiles Library.

A System Qos Profile specifies the [deployment](../../../doc/doma/Deployment.md)
qos policies for each [component](../../../doc/doma/Component.md) interface 
in a system.


## Organization

A System Qos Library is defined in a DDS-XML file as follows:

- `<system_name>`_qos.xml
  - collection of qos profiles, one per component interface
  - specifies the *Domain Participant* qos policies

## Dependencies

- [flows/snippets/](../flows/snippets/README.md)
