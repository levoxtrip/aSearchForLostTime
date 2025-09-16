---
comments: true
tags:
 - VVVV
---


# Basics

Each patch in VVVV has a `Application` side and a `Definition` side. 
On the `Application` side is the code of the program and it is running on every frame.
On the `Definitions` side are the datatype declarations that you can use in the application side or you can expose as a library.

On the definitions side you only can have definitions but on the application side you can have definitions and running code. 

## Navigating VVVV
show left patch - `Alt+leftarrow`
show right patch - `Alt+rightarrow` 

Move all the nodes including frames - `hold space +drag`

## Connecting Nodes
Sometimes you have the situation where you want to connect a node with a not jet typed input. If you want to be able connect it you hold down space key.

## Process Nodes
We can use `Process` node to group certain functionality together with all the behavior the needs grouped together.

When you create a process node and then you look inside of it you always see the value of that instance of the process node.

`Process` nodes also have a [Generics](./HandlingDataAndValues/TypeFlexibility.md#generics) switch.