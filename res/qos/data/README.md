# res/qos/data/

## Purpose

Data Flow Qos Profiles Library.

Top-level Qos Profiles that specify the primary patterns of data flow in a system
architecture.

Note that Flow Qos Profiles are not topic or endpoint specific. They define
patterns of dataflow behavior, that can be used by various topics and endpoints.


## Organization

A Flow Qos Library is defined in a DDS-XML file as follows:

- `<architecture_style>`_qos.xml
  - collection of qos profiles, where each describes a primary data flow behavior 


## Dependencies

- [snippets/](snippets/README.md)
- [builtin/](builtin/README.md)
