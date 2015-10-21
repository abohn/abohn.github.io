---
layout: page
title: Gravitational lensing
share: true
---

First things first... *High res movies!*

* [Merging black holes](http://www.black-holes.org/lensing/GenericPerpWide.mp4)
* [Another view of merging black holes](http://www.black-holes.org/lensing/GenericParaWide.mp4)
* [Partial orbit around black hole](https://www.black-holes.org/lensing/SchwarzschildPartialOrbit.mp4)


An interesting prediction of general relativity is that light does not just
travel in a straight line, but its path is bent by gravity.
Gravitational
lensing is the name for the bending of light by gravity, as the source of
gravity (e.g. a galaxy) acts as a physical lens which bends the light.
There is ample observational evidence of these deflections of light by massive
bodies, including measuring the deflection of starlight passing near the Sun.
However, the largest observed deflection of light is only very slight, around 11
arc seconds or 0.003 degrees.

![Light deflection]({{site.url}}/images/science/LightDeflection.jpg)

The SXS Lensing group is interested in much more eXtreme deflections of light.
Near black holes, the most compact objects in the universe, light can be so
strongly bent by gravity that it can orbit many times around the black hole
before making it to your eye.
In theory, there is no limit to the number of times a light ray can orbit the
black hole.
Even though black holes emit no light themselves, their effect on light passing
nearby leads to some stunning visual and mathematical results!

###Single black hole

We have written code to produce images of stars from a star catalog, such as the
<a href="http://www.ipac.caltech.edu/2mass/">2MASS catalog</a>.
We take each star's location and its
<a href="http://en.wikipedia.org/wiki/Photometric_system">
magnitude in different color bands</a> from the catalog.
To generate the image, we need to know from where light enters each pixel of the
camera as well as the redshift of the light.
More details are provided in
<a href="http://iopscience.iop.org/article/10.1088/0264-9381/32/6/065002/">our
paper</a>.
Below is an image showing the Milky Way using our star rendering code.
Note that we do not use any raster images, we are simply rendering many stars
to produce all the light in this images.

![Milky Way - Star rendering code]({{site.url}}/images/science/ParaFlat.png)

With our camera pointing in the same direction as the previous image,
we now see how a black hole affects light from these stars.
The first feature that pops out is a large circular shadow in the center of the
image.
This is called the shadow of the black hole, because it is a region where the
black hole prevents light from reaching the camera, such that the black hole
is casting a shadow on the image.

Near the borders of the image, light from the stars is slightly deflected.
Notice the dark patches where there aren't many stars in the lower right
portion of the original image.
These appear to be located near the lower right corner of the image now, due
to the gravity of the black hole.
This is analogous to the light being deflected around the sun, making a star's
apparent position somewhere else, as depicted earlier.

![black hole affects light from stars]({{site.url}}/images/science/ParaSchwarzschild.png)

Light passing closer to the shadow is being deflected even more by the black
hole.
There is a large ring structure around the shadow called an
<a href="http://en.wikipedia.org/wiki/Einstein_ring">Einstein ring</a>.
This is where light from directly on the opposite side of the black hole is
deflected around the hole on its way to the camera.
It makes a ring due to the symmetry, but we even see such a ring in cases
where the black hole has spin.
Roughly in the center of the original image, there is a bright blue star
near an orange one.
This is almost directly behind the black hole, so it is very close to the
Einstein ring.
You may have noticed that we can see two images of both of these stars, one at
about 1:30 inside the Einstein ring, and one at about 7:30 on the outside
of the ring.
In fact, inside the Einstein ring, we can see an image of the rest of the
galaxy!
Light from behind the camera, for example, can take a path halfway around the
black hole on the way to the camera.

Although it is hard to see, very close to the shadow there is a bright ring.
This is actually the second Einstein ring, corresponding to light from directly
behind the camera.
In fact, there are an infinite number of these Einstein rings in theory,
but we can only resolve two of them in this particular image.

### Binary black hole

While lensing by a single black hole has been studied for quite a long time,
no one had previously known what astrophysically interesting binary black holes
would actually look like.
The problem is complicated significantly by having to solve what happens to
two black holes orbiting each other.
The SXS collaboration uses the Spectral Einstein Code (SpEC) to simulate
these kinds of compact object mergers, be it with black holes or neutron stars
with high accuracy.
With SpEC, the SXS Lensing group is in a unique position to explore what a
binary black hole merger would look like.

In the following video, we see the last three orbits of a three to one mass
ratio binary with arbitrarily chosen spins on both black holes.
The details of this merger can be found in
<a href="http://journals.aps.org/prd/abstract/10.1103/PhysRevD.88.124010">
Taylor <em>et al.</em></a> as case 4.
The stars used are the same as the ones used in the single black hole image
above.
The camera is located above the orbital plane of the binary looking down.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qg6PwRI2uS8" frameborder="0" allowfullscreen></iframe>

Or see the high res video here:
[high resolution](http://www.black-holes.org/lensing/GenericParaWide.mp4)

![3 to 1 mass ratio binary: Face-on]({{site.url}}/images/science/ParaHighRes.png)

We see an Einstein ring surrounding both masses.
This is not general, however.
When the black holes are separated by a large distance spatially, we could see
an Einstein ring around each black hole individually.
Near both shadows we see a smaller shadow, which is called an eyebrow due to
its shape.
These secondary shadows correspond to one black hole casting a shadow which is
lensed by the other black hole on the way to the camera.
<a href="http://iopscience.iop.org/article/10.1088/0264-9381/32/6/065002/">
Our paper</a> explores these smaller shadows in more detail, finding that
there are in fact an infinite number of these shadows, but we can only resolve
a few in this video.

After the merger, the shadows transition to a single shadow and the background
deflections settle to a stationary state which looks like the lensing by a
single black hole.
This matches our expectations.
After black holes have merged, there is a ringdown phase, where energy is
radiated from the black hole until it settles to a stationary single black hole
solution.

We have another viewpoint of this merger, shown below.
The opening angles of the cameras were slightly different for this video,
so we also provide what the background stars would look like with these new
parameters.

![Milky Way - Star rendering code]({{site.url}}/images/science/PerpFlat.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/ENd8Sz0AFOk" frameborder="0" allowfullscreen></iframe>

Or see the high res video here:
[high resolution](http://www.black-holes.org/lensing/GenericPerpWide.mp4)

![3 to 1 mass ratio binary: Edge-on]({{site.url}}/images/science/PerpHighRes.png)

In this video, the camera is essentially located in the orbital plane of the
binary.
This is what we call an "edge-on" view.
As the black holes orbit, one black hole passes behind the other relative to
the camera.
As this happens, the shadow cast by the farther black hole is lensed by the
closer black hole into a ring-like shadow.
Additionally, we can see the effect that the arbitrary spins has on the orbit.
The orbital plane precesses visibly in these last three orbits before merger.
As before, we see that the lensing settles down to look like lensing by a
single black hole.

We have some interesting brightness effects which are more apparent from this
viewpoint than the previous video's viewpoint.
Some photons passing through the binary system have accumulate non-unity
redshift.
The brightness is affected by the redshift by a factor of redshift cubed,
so there is a large brightness change for only a small redshift difference.
Overall, near the left side of the shadows we see the brightness damped
significantly, while on the right side we see flashes of brightness!

### Black holes at Cornell

While looking at black holes in front of a field of stars, it is easy to lose
your bearings.
In <a href="http://iopscience.iop.org/article/10.1088/0264-9381/32/6/065002/">
our paper</a>, we frequently color sections of the sky with a grid to more
easily understand the deflection of light by the black holes.
A more fun way to accomplish this is by using a recognizable image.
Instead of using stars, we therefore use a picture of the clock tower at
Cornell.

![Clock tower]({{site.url}}/images/science/ClockTower.png)

Now we stick a black hole on campus, because we can and it's awesome.
We can see clearly that near the edges of the image, the view of campus is
only slightly changed.
The image of the clock tower is bent slightly.
However, inside the Einstein ring, we can see the size of the deflections grows.
The image is also inverted.
The clock tower here is on the left and is upside down, in addition to being
even more bent.
The grass is up and the sky is down inside the Einstein ring.

Now is a good time to remind you that light can be deflected all the way
around the black hole.
To properly see what a black hole on campus would look like, we need not only
an image of what's in front of the camera, but also directly above and below
the camera.
Even light from directly behind the camera will get deflected around the black
hole on its way to the camera!
Light-rays can take paths which orbit many times around the black hole
before reaching the camera, resulting in an infinite number of clock towers
(if you had an infinite resolution camera to see them)!

![Black hole in front of clock tower]({{site.url}}/images/science/ClockTower_BH.png)

If we can put one black hole on campus, why not two?
This is the same binary discussed in the Binary black hole section.
It is a three to one mass ratio binary.
The same discussion of an infinite number of black hole shadows applies here as
well.

![Binary black hole in front of clock tower]({{site.url}}/images/science/ClockTower_Para.png)

### Accretion disk

After seeing the accretion disk in *Interstellar*, we wanted to see what our
code had to say on the matter (*sorry about that pun*).
Because the black hole in *Interstellar* needed to be almost maximally spinning
in order to get a planet so close to its event horizon, we simulated a maximally
spinning black hole with an accretion disk.

![accretion disk]({{site.url}}/images/science/disk.png)

In the above image, we have a maximally spinning black hole with spin axis
pointing upward.
Due to this spin, the space-time is being dragged around, making it easier
for photons to pass when moving with the frame dragging than it is to pass
against the frame dragging.
The left side of the black hole shadow is flat and closer to the black hole for
this reason.
The right side of the shadow is elongated, since these photons are
trying to move *against* the frame dragging on their way to the camera.

We modeled the disk as a thin disk orbiting around the black hole the
equatorial orbital velocity.
The disk extends from 5 to 17 solar masses, and was given temperature profile
dependent on the radius as $$T(r) \propto r^{-3/4}$$,
which is physically motivated by energy balance.
To make the disk look more realistic, we introduced arbitrary density and
temperature variations across the disk.
Finally we added a nice big Hollywood glow!

Notice that it sort of looks like we are seeing multiple disks.
For example, above and blow the black hole shadow it looks like there is a
disk, but
the disk is almost flat across the middle of the image in the simulation.
What's going on?
Light is being emitted in all directions by the matter of the disk, so some
of the light
from the part of the disk behind the black hole is emitted upward.
The path of the light is bent by the black hole and some of it actually makes
it to your eye, such that you are actually seeing the far part of the disk above
the shadow!
Similarly, you are seeing the bottom side of the back part of the disk below
the shadow.
Taking this a step farther, some of the light from the disk does an orbit around
the black hole before making it to your eye, so you can see a small ring
around the black hole shadow due to these photons!

We also notice that the left side of the disk is brighter and bluer than the
right side.
This is mostly due to the relativistic Doppler effect.
Similar to how a passing car sounds higher in frequency then drops in frequency
as it passes by you, the frequency of the photons is higher on the left side
of the disk because the matter is traveling towards you.
Remember that the matter is orbiting around the black hole.
On the right side of the disk, it is moving away from you, so the photons
appear more red.

So how did *Interstellar* do?
Let's compare the images directly.

![accretion disk]({{site.url}}/images/science/disk.png)
![accretion disk]({{site.url}}/images/science/InterstellarDisk.jpg)

Apart from looking really great just aesthetically, the *Interstellar* disk
shows the correct light bending effects.
However, you may notice it looks very uniform in color.
Did they forget to include redshift physics?
It turns out that they had produced more physically accurate visuals, but
decided to omit redshift and brightness effects intentionally
to try not to confuse the audience *too* much.

### In the spotlight

Partially due to the timing of our paper with the release of *Interstellar*,
and due to how beautiful our visualizations are (to me at least), we have
gotten a lot of attention for our work.
In fact, our videos will be shown in an upcoming
[PBS NOVA](http://www.pbs.org/wgbh/nova/) documentary about
black holes!

Here is a list of some of the places where our work was discussed:

#### Articles
  * Binary black hole work
    * [Nature](http://www.nature.com/news/black-hole-mergers-cast-kaleidoscope-of-shadows-1.16283)
    * [Nature images of the month](http://www.nature.com/news/images-of-the-month-november-2014-1.16481)
    * [Astronomy picture of the day](http://apod.nasa.gov/apod/ap151020.html)
    * [Popular Science](http://www.popsci.com/article/science/big-pic-simulated-black-hole-collision-shreds-milky-way-animated)
    * [NSF Discovery](http://1.usa.gov/1xymrxx)
    * [Astrobites](http://astrobites.org/2014/11/04/what-would-a-binary-black-hole-merger-look-like/)
    * [io9](http://io9.com/this-is-what-it-really-looks-like-when-two-black-holes-1654123326)
    * [Brian Koberlein](https://briankoberlein.com/2014/11/05/weft-warp/)
    * [Medium](https://medium.com/the-physics-arxiv-blog/first-simulated-images-of-two-black-holes-colliding-9be9cd5b8498)
    * [Outer Places](http://www.outerplaces.com/universe/astrophysics/item/6729-watch-simulation-of-black-hole-collision-rips-spacetime-to-shreds)
    * [Nerdist](http://www.nerdist.com/2014/11/we-now-know-what-it-looks-like-when-black-holes-eat-each-other/)
    * [Universe Today](http://www.universetoday.com/116500/new-simulation-offers-stunning-images-of-black-hole-merger/)
  * Association with *Interstellar*
    * [Cornell News](http://www.news.cornell.edu/stories/2014/11/grad-students-help-envision-black-holes-sci-fi-interstellar)
    * Cornell Daily Sun - [(deceased link)](http://cornellsun.com/blog/2014/11/20/team-of-graduate-students-aid-in-making-of-interstellar/)
  * From around the world
    * [Folha - Brazilian newspaper](http://www1.folha.uol.com.br/ciencia/2014/11/1555213-cientistas-simulam-choque-de-buracos-negros-pela-primeira-vez.shtml)
    * The official state news agency of Cuba -
    [(deceased link)](http://www.plenglish.com/index.php?option=com_content&task=view&id=3244741&Itemid=1)
    * Article in the German magazine
    [bild der wissenschaft](http://www.wissenschaft.de/startseite/).
    No link, but I promise I have a copy on my desk :)

#### Reddit
  * [AMA](http://www.reddit.com/r/science/comments/2l259x/science_ama_series_we_are_graduate_students_at/) - my handle is selecsosi
  * [Post on Interstellar trailer](http://www.reddit.com/r/movies/comments/25q3rk/new_trailer_for_chistopher_nolans_interstellar/chjr26v)
