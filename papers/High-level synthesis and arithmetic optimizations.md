# High-level synthesis and arithmetic optimizations

## Notes
> However, because of the very mature nature of HDLs, many libraries and code generators provide highly optimized designs for programmers to build around.
What? In my humble opinion, these tools are still in their infancy. Maybe their referring to something I don't know about, but the debuggability is a problem with these tools. I really feel like their missing the software viewpoint.

Great visualizations of fixed point arithmetics.

People who do exactly what I've done: [18, 19, 20, 21, 22]
I should check out these sources.

Great explanation of hardware.

Great explanation of float vs real usage and definitions.
Outlines the problem of addition not being associative for floats.

## Summary
 - Makes adding associative and gets a performance increase, but also uses more resources
 - Essentially does the same thing as I will do
 - Presents `Hint` library, which deduces word lengths
 - Compilers and arithmetic need to communicate more
