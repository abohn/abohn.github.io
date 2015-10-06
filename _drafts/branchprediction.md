---
title: "Branch Prediction"
tags: [code]
layout: post
comments: true
---

Processors these days are fast.
They are blazingly fast compared to how long it takes for information
you store in RAM to make it to the processor.

Your processor is zipping along at a few clock cycles every nanosecond when a
terrible thing occurs, it asks your RAM for a byte of data!
"Not a problem, I've got everything under control!" shouts your gazillion
jiggles of RAM,
as they ship your requested byte to the processor.
Meanwhile your process is twiddling its thumbs for not just 1 nanosecond,
not even just 10 nanoseconds, but 100 nanoseconds, hundreds of clock cycles,
before
