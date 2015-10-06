---
title: "Almost always use std::vector"
tags: [code]
layout: post
comments: true
---

Common wisdom is you should use structures like linked lists
instead of vectors when you expect to perform many insertions and deletions.
Insertion in a list is $$\mathcal{O}(1)$$ operation, just allocate memory
for the new element, and update a handful of pointers.
Vector insertion on the other hand is $$\mathcal{O}(n)$$, since we must move all
elements beyond the insertion point by 1 spot in the vector.
However, we usually need to find the insertion location first,
and this operation renders list insertions to be slower than vector
insertions!

I recently watched a talk by
[Bjarne Stroustrup](https://en.wikipedia.org/wiki/Bjarne_Stroustrup)
called
[Why you should avoid Linked Lists](https://www.youtube.com/watch?v=YQs6IC-vgmo),
where he talks about this exact issue.
Unfortunately, his plot did not display properly during the talk,
so I tried to recreate the results for myself.

### Benchmarking

For the timings, I start wit a sorted list and sorted vector with $$N$$ elements
each.
I generate $$1,000$$ random elements, and insert these elements both into
the list and vector.
This should give us a uniform distribution of insertion points for a
fair speed test.
The insertion procedure is to find the iterator to the correct location in the
sorted container as to keep it sorted, then use `.insert` on the container.
The `std::vector` will have to move all elements beyond the insertion
spot, which on average is $$n/2$$ elements.

How do we find the insertion point?
For `std::list`,
since we do not have random access, we must step through the
list one element at a time.
Here is how I do that:

~~~ cpp
auto it = c.begin();
const auto kEnd = c.end();
while (it != kEnd && *it < insertElement) {
  ++it;
}
~~~

An alternative is to use `std::lower_bound`, but I think this will try to do
a binary search with the non-RandomAccessIterator for some reason, as my timings
suggest.

For `std::vector`, we can simply use `std::lower_bound` to do a binary search
for the insertion point with our RandomAccessIterator.
Since this was so fast, I also tried to handicap `std::vector` by forcing it
to step through the vector using the code block above.

Here are the results, showing the total time in milliseconds to insert
$$1,000$$ elements into a vector and list using the different find methods:

![Insertion Speed]({{site.url}}/images/code/InsertionSpeed.svg)

I ran the code with clang 3.6 and gcc 4.8, and the results were similar.
The red squares show the `std::list` using `std::lower_bound`, and the blue
stars use the linear search.
The green triangles show `std::vector` using the linear search and the
purple circles use the binary search with `std::lower_bound`.

This shows that the vector find and insert operation is about an order of
magnitude faster than the list find and insert on my machine!
As expected, the binary search and insert with vector is the fastest, and
the linear search and insert with vector is not far behind.
Iterating manually through the linked list and inserting was always faster than
using the binary search, which also makes sense.
What does not make sense to me is why `std::lower_bound` is trying the binary
search without a RandomAccessIterator, but maybe someone can help me out in
the comments.

The vector speed seems to slow down right where the dashed blue vertical line
is shown, whereas the list speed does not seem to be affected.
This dashed line corresponds exactly to the size of my L3 cache, so the
increased runtime for vector is most likely just due to increased cache misses
for the vector.
When iterating through the list, we may have just as good a chance
to cache miss with a small or large list due to the list elements not
being contiguous in memory.
This would explain why the speed is unaffected by the list size.

### Discussion

Bjarne Stroustrup has three suggestions regarding this topic:

1. "don't store data unnecessarily"
2. "keep data compact"
3. "access memory in a predictable manner"

Point 1: The linked list has to store at least a forward pointer for each
element, and if it is a doubly linked list, a back pointer.
Thus, if the containers are storing doubles, then we are using 3x as much
memory as we really need!

Point 2: The vector allows for random access, which speeds up the find, but
remember that we did not need to use the random access property of the vector
to beat list.
Keeping the vector compact allows more data to be stored in cache, resulting
in reduces cache misses.

Point 3: Even though we need to do $$\mathcal{O}(n)$$ operations to do the
vector insertion, we are being nice to our CPUs and accessing memory in a
predictable way.
What does that even mean?
Traversing contiguous data forwards or backwards constitutes predictable
behavior, and allows the CPU to accurately
[prefetch data](https://en.wikipedia.org/wiki/CPU_cache#Cache_miss) while
other instructions are being carried out.
Points 2 and 3 allow the $$\mathcal{O}(n)$$ vector insertion to be much
faster than the list's $$\mathcal{O}(n)$$ find operation.

When choosing vector versus list, the advice seems to be default to vector
unless you have a good reason to use a list.
This does not mean to always use vector, but at the very least, when using
a data structure that doesn't follow the points listed above, you should
benchmark your choice.
