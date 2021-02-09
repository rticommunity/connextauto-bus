# Interface

Information exchange specification. 

## Definition

A data-oriented interface is defined by:

- an *abstract* participant whose name is the *interface name*:
  - can be be composed with other abstract participants (interfaces)
  - does not specify a `participant_qos`

- inputs:
  - Subscriber(s) containing DataReaders
    - DataReader(s) contained in the Subscriber
      - DataReaderQos specified for the DataReader
    - SubscriberQos specified for the subscriber

- outputs:
  - Publishers(s) containing DataWriters
    - DataWriters(s) icontained in the Publisher
      - DataWriterQos specified for the DataWriter
    - PublisherQos spcified for the publisher


A data-oriented interface *uses* a [Data Model](DataModel.md).


## Organization

- [if/](../../if/README.md)
- [res/qos/](../../res/qos/README.md)
- [res/types/](../../res/types/README.md)


## Maintainer

Interfaces are maintained by team members responsible for 
architecture defintion.
