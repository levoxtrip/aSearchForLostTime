---
comments: true
tags:
- ART
- PROGRAMMING
---
# Creative Coding
Here are some creative coding approaches that I found


## Convert 2D Pixel Position into Single Integer Index
![Convert 2D Pixel Position into Single Integer Index Img](./img/PixelIndex.png)
The formula to convert the position of a pixel on a texture into an index is `index = y*texture_width +x`.

```
assume texture_width = 10
[FIRST ROW]
index = 0*10 + 0 -> index = 0
index = 0*10 + 1 -> index = 1
...
[SECOND ROW]
index = 1*10 + 0 -> index = 10
...

```

