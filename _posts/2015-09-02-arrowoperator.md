---
title: "Operator-> in c++"
tags: [coding]
layout: post
---

I recently discovered an interesting fact about how operator->() operates
differently than other overloads in C++.
Consider the following code:

~~~
#include <iostream>

struct A {
    void f() { std::cout << "A::f\n"; }
};

int main() {
  A* pA = new A;
  pA->f();
  delete pA;
  return 0;
}
~~~
{: .language-c++}

This example, perhaps unsurprisingly, prints out "A::f".
We create a pointer to an 'A' struct, and use the arrow operator '->'
to dereference the pointer and call the function 'f()'.

The surprise comes when you consider the following code:

~~~
#include <iostream>

struct A {
  void f() { std::cout << "A::f\n"; }
};

struct B {
  A* operator->() { return &a; };
  A a;
};

struct C {
  B operator->() { return b; };
  B b;
};


int main() {
  C c;
  c->f();
  return 0;
}

~~~
{: .language-c++}

In this example, we create a 'C' struct and call 'c->f()'.
What does the program do?
The neat thing about the arrow operator is that it continually reapplies itself
as many times as possible, until we reach a raw pointer!
When the raw pointer is reached, it is dereferenced and the function 'f()' is
called on the object.
Therefore the output of the code is, again, "A::f()".
'c->f()' expands to '(c.operator->())->f()' or 'b->f()',
and once again until we reach an 'A*'.
Finally, we call 'A::f()', which prints out our friendly message.

Here is a quote from the
[standard (13.5.6)](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2005/n1905.pdf) about this idea:

> An  expression  x->m is interpreted as (x.operator->())->m for a class
  object x of type T if T::operator->() exists and if  the  operator  is
  selected as the best match function by the overload resolution mechanism

One way to take advantage of this is for creating certain pointer wrapper
classes, although C++11 introduces some of the more general use cases with unique_ptr and shared_ptr, for example.


