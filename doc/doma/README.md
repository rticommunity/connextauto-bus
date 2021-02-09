# Data-Oriented Micro-Services Architecture (DOMA) 

## Purpose

Describes the core concepts, design, conventions, and best practices. 

Provides a template for the organization of the directory tree structure.

- [Core Concepts](#core-concepts)
- [Directory Organization](#directory-organization)
- [How to setup a new DOMA project](#how-to-setup-a-new-doma-project)
- [How to create a new Service](#how-to-create-a-new-service)
- [How to create a new Component](#how-to-create-a-new-component)
- [How to create a new System](#how-to-create-a-new-system)
- [Best Practices](https://github.com/rajive/doma/blob/feature/MyService/doc/BestPractices.md)
- [Conventions](https://github.com/rajive/doma/blob/feature/MyService/doc/Conventions.md)


## Core Concepts

- [Bus](Bus.md)
  - [Data Model](DataModel.md)
  - [Service](Service.md)
    - [Interface](Interface.md)
    - [Deployment](Deployment.md)
- [Component](Component.md)
  - [Module](Module.md)
- [System](System.md)



## Directory Organization

[Goals](https://github.com/rajive/doma/blob/feature/MyService/doc/Organization.md)

- [if/](../../if/README.md)
- [res/](../../res/README.md)
- [src/](../../src/README.md) 
- [bin/](../../bin/README.md)
- [lib/](../../lib/README.md) 
- [doc/](../../doc/README.md)



## How to setup a new DOMA project

- Setup a remote for `doma-skel`

        git remote add doma-skel git@github.com:rajive/doma-skel.git
        git remote set-url --push doma-skel no_push
        git remote -v

- Fetch the upstream updates from `doma-skel`

        git fetch doma-skel

- Merge upstream updates from `doma-skel`

        git merge doma-skel


- Repeat the last two steps (fetch and merge) when the upstream `doma-skel` is updated


## How to create a new Service



- [Creating a new Service](https://github.com/rajive/doma/tree/feature/MyService#creating-a-new-service)
- [Defining the Service](https://github.com/rajive/doma/blob/feature/MyService/doc/Design.md#service-definition)


## How to create a new Component

- [Creating a new Component](https://github.com/rajive/doma/tree/feature/MyService#creating-a-new-component)
- [Defining the Component](https://github.com/rajive/doma/blob/feature/MyService/doc/Design.md#components)
- [Implementing the Component](https://github.com/rajive/doma/tree/feature/MyService/src/c/MyService)



## How to create a new System

- [Create a new "Composite" Service (System)](https://github.com/rajive/doma/tree/feature/MyService#creating-a-new-service)
- [Defining the System](https://github.com/rajive/doma/blob/feature/MyService/doc/Design.md#system)
- [Specify the System qos profile by cloning TEMPLATE_MyDeployment_qos.xml](https://github.com/rajive/doma/blob/feature/MyService/res/TEMPLATE/TEMPLATE_MyDeployment_qos.xml)
