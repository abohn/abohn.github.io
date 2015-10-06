---
title: "Be nice to your cache"
tags: [code]
layout: post
comments: true
---
### CPU cache

Processors these days are fast.
They are blazingly fast compared to how long it takes for information
you store in RAM to make it to the processor.

Your processor is zipping along at a few clock cycles every nanosecond when a
terrible thing occurs; it asks your RAM for a byte of data!
"Not a problem, I've got everything under control!" shouts your gazillion
jiggles of RAM
as they ship your requested byte to the processor.
Meanwhile your process is twiddling its thumbs for not just 1 nanosecond,
not even just 10 nanoseconds, but **100 nanoseconds**, hundreds of clock cycles,
before the byte finally arrives.

How do processors actually get anything done?
Most processors have a hierarchy of small memory storage in between the RAM
and the actual CPUs.
The purpose of these memory caches is to reduce the amount of time it takes to
get information from RAM to the processor.
Below is an example of a 4 core processor with three levels of memory cache,
called L1, L2, and L3 cache.

![Memory caches]({{ site.url }}/images/CacheHierarchy.jpg)
*[image source: wiki.csiro.au](https://wiki.csiro.au/download/attachments/494698781/CacheHierarchy.jpg?version=1&modificationDate=1326170957303&api=v2)*

The largest cache, L3 cache in this example, is connected to the RAM.
Generally, the smaller the size of the cache, the faster the cache is.
Here are the sizes of the caches for my computer:

| Cache | Size |
| :---: | :---: |
| L1 | 384 KB |
| L2 | 1536 KB |
| L3 | 15 MB |

These cache sizes are quite large 
