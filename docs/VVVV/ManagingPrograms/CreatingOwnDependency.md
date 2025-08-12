---
comments: true
tags:
 - VVVV
 - VVVV/ManagingPrograms
---

# Creating Own Dependency
To create your own dependency that you then can use in other projects you create your own nodes on the *definition side* of your dependency patch.

It is important that you don't set them on the *application side* of the patch. Otherwise it is always opening up the application side when you reference your dependency.

You can name your dependency on the *definition side* on the top left corner where `[main]` is written.

If you want that certain parts of your dependency nodes are shown in a category in the node browser you can create your own categories by looking for `Category` in the node browser. They are always starting with a dot.