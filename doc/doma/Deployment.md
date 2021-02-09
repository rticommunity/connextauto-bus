# Deployment

Instantation of a service.


## Definition

A deployment binds service interfaces to resources. 

Specified as a composite (system) service qos profile library that 
specifies the system resources used (transports, initial peers, 
discovery, monitoring, resources etc.) for each [component](Component.md) 
interface.

Typically specified as per component interface qos policies for:
- `participant_qos`
- `participant_factory_qos`

## Organization

- [res/qos/systems/](../../res/qos/systems/README.md)


## Maintainer

Deployments are maintained by the team members responsible for system 
integration, test, and provisioning.
