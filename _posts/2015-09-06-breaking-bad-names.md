---
title: "Breaking Bad names"
tags: [math]
layout: post
---

I'm currently binge re-re-watching the show Breaking Bad, when I starting
thinking about the names used in the credits.
All the names have highlighted in green a symbol of one of the
chemical elements.
Here's an example:

![Breaking Bad credits]({{ site.url }}/images/math/BreakingBadCredits.png)

<span style="color: green; font-weight: bold; font-size: 18pt;">V</span>ince Gilligan's name
highlights <span style="color: green; font-weight: bold; font-size: 18pt;">V</span>
for the chemical element Vanadium.
For as long as I was paying attention, all the names in the
credits were able to include an element.
I was wondering, out of the 118 identified elements, how common
is it that we can find at least one element to insert into a random name?

I found a list of 5163 unique first names and
88799 unique last names on
[this site](http://www.quietaffiliate.com/free-first-name-and-last-name-databases-csv-and-sql/)
(Note: there are some duplicates that need to be removed first).
From these lists, and a list of the 118 chemical symbols,
I wrote a little python script to count the number
of symbols that could be inserted into each first name and
last name separately.

I realized that it should be rare to be unable to insert a symbol
into a name, but I wasn't quite aware how rare these names were.
For the first names in this list, only 0.81% of the names
had no possible symbol insertions.
Here is a list of those names:

| * ada | * delma | * ja  | * mae |
| * adele | * ed  | * jada  | * max |
| * adell | * eda | * jade  | * meda |
| * adelle  | * edda  | * jae | * mee |
| * aja | * elda  | * jed | * meg |
| * dede  | * elma  | * le  | * mel |
| * dee | * elza  | * lea | * melda |
| * deedee  | * ema | * leda  | * zada |
| * deja  | * emelda  | * lee | * zelda |
| * del | * emma  | * ma  | * zelma |
| * dell  | * emmett | | |

Let's take a look at the graph of percentage of names
versus number of possible symbol insertions:

![First name replacements]( {{ site.url }}/images/math/FirstNames.svg)

The most common number of possible replacements is 4, and the
largest number possible was 11, using this list of names.
One of the names with 11 possibilities was Catherine, even though
the name only has 9 characters:

+ <span style="color: green; font-weight: bold; font-size: 18pt;">C</span>atherine
+ <span style="color: green; font-weight: bold; font-size: 18pt;">Ca</span>therine
+ C<span style="color: green; font-weight: bold; font-size: 18pt;">At</span>herine
+ Ca<span style="color: green; font-weight: bold; font-size: 18pt;">Th</span>erine
+ Cat<span style="color: green; font-weight: bold; font-size: 18pt;">H</span>erine
+ Cat<span style="color: green; font-weight: bold; font-size: 18pt;">He</span>rine
+ Cath<span style="color: green; font-weight: bold; font-size: 18pt;">Er</span>ine
+ Cather<span style="color: green; font-weight: bold; font-size: 18pt;">I</span>ne
+ Cather<span style="color: green; font-weight: bold; font-size: 18pt;">In</span>e
+ Catheri<span style="color: green; font-weight: bold; font-size: 18pt;">N</span>e
+ Catheri<span style="color: green; font-weight: bold; font-size: 18pt;">Ne</span>


For the last names, just 0.18% had no possible symbol
insertions!
I won't list all of them here.

![Last name replacements]( {{ site.url }}/images/math/LastNames.svg)

The last names follow a similar distribution, but have a longer
tail and larger average, due to having longer names.

We can combine these datasets to find symbol replacements for
full names.
If we assume that any first name can be combined with any last name
in the dataset, then we can write the probability of having
n replacements by:

$$ P(n) = \sum_{i=0}^n P_{first name}(i) * P_{last name}(n - i) $$

Let's break down the above equation.
The probability of getting 0 symbol matches is just the probability
of getting 0 matches on the first name and 0 matches on the last name,
or $$ P(0) = P_{firstname}(0) * P_{lastname}(0) $$.
To get 1 match on the full name, we must consider when the match
comes from the first name and when it comes from the last name.
In this case, we have:
$$P(1) = P_{firstname}(1)*P_{lastname}(0) + P_{firstname}(0)*P_{lastname}(1)$$
The general equation follows from extending this logic.

Here are the results:

![Full name replacements]( {{ site.url }}/images/math/FullNames.svg)

The chance that a full name has no symbol replacements possible is 0.0015%!
We again see that, due to having longer names, we have a larger
mean and a long tail that extends to 25 symbol replacements, if
you have a name like Catherine Bernasconi!

