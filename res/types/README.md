# res/types/

## Purpose

Datatype definitions.

Datatypes define the *structure* of a service interface input/output.


## Organization

Datatypes are defined in IDL files, organized as appropriate. 

- `<datatypes>`_t.idl
  - file containing a collection of datatypes

- [`<name>`_svc_t.idl]
   - datatypes used by the service `<name>`
   - may define the string constants for entity names used in the 
     `if/<name>_svc.xml` file
