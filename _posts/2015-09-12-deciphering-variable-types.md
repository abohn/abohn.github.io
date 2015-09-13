---
title: "Deciphering C++ types"
tags: [code]
layout: post
comments: true
---

I was once like you.
When encountering a type declaration like **char const \* const \***,
I'd either curl up in a ball clutching my office mate's leg and crying,
or spend a few minutes figuring out
the type and a few more grumbling and sighing.
Well grumble and sigh no more!

### Basic idea

I found a method to simply read off the type of a C++ variable.
I did not come up with this method, but I'd like to explain it here.
This has been called the
["right-left" rule](http://ieng9.ucsd.edu/~cs30x/rt_lt.rule.html),
although that site did not cover consts or references.
I believe this is similar to the
["Clockwise/Spiral rule](http://c-faq.com/decl/spiral.anderson.html),
but that rule might not apply to all cases, and I think it's more confusing
anyway.

The right-left rule (or maybe the "right-left sweep" rule is a good way to
name it) essentially means to start with the identifier and sweep right,
then sweep left, replacing symbols with words.
I'll explain in more detail briefly, but let's try to apply it to the
example at the beginning of the post:

~~~
char const * const * id
~~~
{: .language-c++}

In this example, **id** is the identifier.
We start by sweeping right, and find nothing.
The next step is to sweep left, reading the symbols as words.
**id** is a pointer (**\***) to a constant (**const**) pointer
to a constant character (**char**).

Here is a good spot to point out that the order of the **const**
relative to **char** doesn't matter.
An equivalent way to write that type is:

~~~
const char * const * id
~~~
{: .language-c++}

With this information alone, you have enough to deduce 99% of the
C++ cases you'll encounter.
We can try a few more simpler examples before getting into more
complicated examples.

Here's one (that I did not write, thankfully) from a code
I've worked with:

~~~
const double * const & id
~~~
{: .language-c++}

**id** is a reference to a constant pointer to constant double.
(Why is this a reference to a constant pointer?
I don't have a great answer to that)

Here's an example that doesn't compile, and we can see quickly by reading
the type why:

~~~
// doesn't compile!
double x = 7;
const double & const y = x;
~~~
{: .language-c++}

**y** is a constant reference to a constant double, wait what?
Making a reference constant is not valid, because references
can never be reassigned to refer to a different variable.

So far, we've only looked at the "left" part of the sweep.

~~~
int *id[];
~~~
{: .language-c++}

This type requires both sides of the sweep.
Always start with the identifier, sweep right, then left.
**id** is an array of pointers to int.


### Getting explicit

Here is a table of how to translate certain symbols as you see them.


| symbol | translation |
| :----: | :----: |
| **\*** | pointer to |
| **&** | reference to |
| **const** | constant |
| **[]**    | array of |
| **()**    | function returning |

In order for the type to make sense you can only see these symbols in certain
spots, but I'm going to assume these are types that compile for simplicity.

Here are the steps you should follow:

1. Find the identifier and start there
2. Sweep to the right, translating the symbols you see.
You should stop your sweep to the right when you get to the end of the type,
or if you see a lone right parenthesis **)**.
(Seeing a left parenthesis **(** is the start of a function symbol, so
continue sweeping right.)
3. Sweep left of the identifier until you run out of symbols, or you hit
a left parenthesis **(**.
If you hit the left parenthesis now, you should go back to part 2, sweeping
right, but now on the outside of the enclosing **)**, and continuing
onto part 3 on the outside of the enclosing **(**.

### Laundry list of examples

We'll see an example with **(** and **)** that are not functions right now.

~~~
int (**id)();

// 1. find the identifier, id
//    "id is a..."

// 2. Start sweeping right, we first find a lone ) and stop
//    "id is a..."

// 3. Start sweeping left until we find the matching (
//    "id is a pointer to a pointer..."

// 2. Sweep right again, outside the enclosing parens until the end of the type
//    "id is a pointer to a pointer to a function returning..."

// 3. Sweep left again, outside the enclosing parens until the beginning
//    "id is a pointer to a pointer to a function returning an int"
~~~
{: .language-c++}

Who would create such a monster?
I don't know, but now you can quickly figure out type!
Some of these examples are ridiculous, especially with C++
(with std::vector and std::array instead of C arrays, auto,
etc.), but it's nice to be able to read them when you see them.

Here's a bunch of examples with their translations,
(I decided to make all the identifier names be **id**
out of simplicity, not because they are good names.)

| declaration | translation |
| :---- | :---- |
| int id | int |
| int *id | pointer to int |
| int &id | reference to int |
| int * const id | constant pointer to an int |
| int **id | point to a pointer to an int |
| int id[][] | array of an array of ints |
| int (*id[])() | array of pointers to functions returning an int |
| int (*id())() | function returning a pointer to a function returning an int |

Here's a big example:

~~~
int (*(*id)(char *,double))[9][20]
~~~
{: .language-c++}

**id** is a pointer to a function taking a character pointer and a double,
returning a pointer to an array of size 9 of an array of size 20 of integers.

Happy deciphering!
