# Systems

A system implements one or more complete User Stories and has
standalone business value.

## Definition

A system is a [composite service](Service.md), bound to a collection of 
resources, that accomplishes certain business goals by 
providing certain capabilities. 

- A [system](System.md) is a composition of services
  - A **[component interface](Component.md)** is a composite (system) 
    [service endpoint interface](Interface.md)
  - A [deployment](Deployment.md) is a composite (system) service qos profile 
    library
- [Components](Component.md) implement the composite (system) [service endpoint 
interface](Interface.md) (i.e. the *component interface*). 
   - Thus, a system can be viewed as a collection of [components](Components.md).
- A [deployment](Deployment.md) binds the [component interfaces](Interface.md) 
to the system resources.


## Organization

- [if/](../../if/README.md)
- [res/qos/systems/](../../res/qos/systems/README.md)
- [res/cfg/](../../res/cfg/README.md)
- [bin/](../../bin/README.md)


## Maintainer

Systems are maintained by the team members responsible for system 
integration, test, and provisioning.
