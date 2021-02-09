# Module 

Service interface *coordination* logic implementation.


## Definition

A module implements the *coordination* logic of a 
[service endpoint interface](Interface.md).

- For a **micro-service** interface, implements the minimal coordination logic
  to satisfy the responsibilities of the service interface in the
  service collaboration
- For a *composite* service interface, implements the minimal coordination 
  logic to satisfy the responsibilities of the service interface in the
  composite service collaboration
  - may be a composition of the underlying service modules
- For a *system* component interface, implements the minimal coordination 
  logic to satisfy the responsibilities of the component interface in the
  composite (system) service collaboration
  - may be a composition of the underlying service modules

A module is used by a [component](Component.md), to maintain the service
interface collaboration contract.

A module may be implemented in an appropriate programming language, 
as required by the components in a system architecture.


## Organization

- [if/](../../if/README.md)
- [res/cfg/](../../res/cfg/README.md)
- [src/](../../src/README.md)


## Maintainer

Modules are maintained by the team members responsible for implementing 
the common software framework used by components. 
