# Service

Collection of related interfaces that work together.


## Definition

A service is a collection of [endpoint interfaces](Interface.md) that 
collaborate to accomplish certain objectives and provide certain 
capabilities.

- A service may be *composed* of other services. 
- A **micro-service** comprises of the the *atomic* set of interfaces.
  Such interfaces may not be further decomposed into smaller interfaces.
- A **composite service** is a service whose 
  [endpoint interfaces](Interface.md) are a **composition** of 
  other [service endpoint interfaces](Interface.md).

A [service endpoint interface](Interface.md), sometimes simply called 
a **service interface** is implemented by a [component](Component.md).

Many [components](Component.md) may implement a given 
[service interface](Interface.md). 


## Organization

- [if/](../../if/README.md)
- [res/qos/services/](../../res/qos/services/README.md)

## Maintainer

Services are maintained by team members responsible for architecture defintion.
