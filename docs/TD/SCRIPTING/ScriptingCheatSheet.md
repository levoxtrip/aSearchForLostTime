---
comments: true
tags:
 - TD/SCRIPTING
 - TD/UI
 - TouchDesigner
---

# Scripting Cheatsheet

Get width and height from parent
`me.parent().par.w` - width
`me.parent().par.h` - height

Get width/ height of child operator
`op('/out1').width`
`op('/out1').height`


## Tables

Get value from input cell
`me.inputCell`

## Inputs
Count inputs of operator
`len(op('switch1').inputs)`