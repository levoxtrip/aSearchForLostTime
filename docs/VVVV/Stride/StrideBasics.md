---
comments: true
tags:
 - VVVV
 - VVVV/Stride
 - VVVV/FX
---

# Stride Basics

## Stride Scene

### Entity

A *Scene* in Stride contains *Entities* which are the building blocks of the 3D scene - `Plane`, `Sphere`,`Box`, `Camera`, `Lights`.

Each entity can also be a parent of spread of child entities. We can plug them into the `Children` input of an entity. This also allows us to create herachies where the children transformations behave relative to the parent transformation. A way to group the children is either with `Cons` node or a `Spread`.

![Children Entities Img](../img/StrideChildrenEntities.png)



On the `Components` input of the entity we can add special behavior and functionality - for example physics behavior, Instancing and more.


## Stride Transformations
Stride has different ways to transform an entity. We can use `TransformSRT` but also use instead the *matrix operations* `Translation`,`Rotation`,`Scaling` of type `3D.Matrix` as well as `Translate`,`Rotate`,`Scale` of type `3D.Transform`.

==??? What is the actual different between them?===

## 2D Primitives 
In *Stride* we have the 2D primitives `Disc`,`Plane` and `RoundRectangle`

![Stride 2D Primitives Img](../img/Stride2DPrimitives.png)

## 2D Meshes
If you specifically want to draw meshes you need a `MeshRenderer` which then gets connected to a `RenderEntity`.

![Meshes In Stride Img](../img/MeshRenderer.png)

## Draw Wireframe Mesh
To render as Mesh as wireframe we need to add `RasterizerStateDescription` and set the Fill mode to `Wireframe`. For the color of the wireframe we add a `ConstantColorShader`. The `Topology` parameter of the `MeshRenderer` allows different kinds of Wireframes. It is worth experimenting with them.

![Stride WireFrame Mesh Img](../img/StrideWireFrameMesh.png)



## Keyboard Shortcuts
F2 - Performance meter
F3 - Profiler - When active you can hit F5 to cylcle through cpu,gpu events.
F4 - Debug View - Grid with measurments, coordinate system, light source, camera