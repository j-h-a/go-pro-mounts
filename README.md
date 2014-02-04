GoPro Mounts
============

Various mounts for GoPro cameras. These mounts are designed to be 3D-printed and assembled.

All models are built using [OpenSCAD](http://www.openscad.org).

Models
======

This repository contains the following models:

[<img width="64" src="http://j-h-a.github.io/go-pro-mounts/thumbscrew_long.png"/>](#ThumbScrewLong "Thumb-screw (long)")
[<img width="64" src="http://j-h-a.github.io/go-pro-mounts/connector_triprong.png"/>](#TriprongConnector "Tri-pronged Connector")
[<img width="64" src="http://j-h-a.github.io/go-pro-mounts/connector_biprong.png"/>](#BiprongConnector "Bi-pronged Connector")
[<img width="64" src="http://j-h-a.github.io/go-pro-mounts/connector_flat.png"/>](#FlatConnector "Flat Connector")
[<img width="64" src="http://j-h-a.github.io/go-pro-mounts/quickrelease_clip.png"/>](#QRClip "Quick-release Clip")
[<img width="64" src="http://j-h-a.github.io/go-pro-mounts/quickrelease_pole_grip.png"/>](#PoleGrip "Pole Grip")

Click the images to jump to that model, hover to see the title.



<a name="ThumbScrewLong"/>

Thumb-screw (long)
==================

- **File**: [`thumbscrew_long.scad`](https://github.com/j-h-a/go-pro-mounts/blob/master/thumbscrew_long.scad)
- **Description**: The long thumbscrew, for use directly under the camera housing or whenever you want extra reach.
- **Also needs**: 1x 50mm M5 bolt.

![Thumb-screw (long)](http://j-h-a.github.io/go-pro-mounts/thumbscrew_long.png)

### Build Instructions

1. Print out as many as you want.
2. Insert a 50mm M5 bolt.
 - The bolt should slide through (not screw in) so that the head can go all the way into the recess. You may need to file or sand the inside of the hole using a small circular file or rolled-up sandpaper in order to get it to slide through, but you want a nice snug fit.
 - There should be about 18.5mm sticking out of the end.
3. Super-glue the bolt in place.

![Thumb-screw (long) printing](http://j-h-a.github.io/go-pro-mounts/thumbscrew_long_01_printing.jpg)
![Thumb-screw (long) complete](http://j-h-a.github.io/go-pro-mounts/thumbscrew_long_02_complete.jpg)



<a name="TriprongConnector"/>

Tri-pronged Connector
=====================

- **File**: [`connector_triprong.scad`](https://github.com/j-h-a/go-pro-mounts/blob/master/connector_triprong.scad)
- **Description**: Parts for a 3-pronged connector section.
- **Also needs**: 1x M5 nut (domed or regular).

![Tri-pronged Connector](http://j-h-a.github.io/go-pro-mounts/connector_triprong.png)

### Build Instructions

1. Print out the model (3 pieces).
2. Screw each piece onto a thumb-screw all the way to the bottom and keep going to strip the thread off the inside of the hole.
 - You may wish to file or sand the hole a bit more on the inside to get a looser fit so that the thumb-screw goes in more easily. If you do want to do this, do it after you've glued it together so you get a more accurate position while glueing.
3. Stack the pieces, being careful to get them in the right order (the middle piece is a bit thicker).
4. Put a domed or regular M5 nut on the end to verify that it fits correctly and that the thumbscrew can go through and engage with it.
 - You may need to sand the inside of the recess or remove any excess bits of plastic to get a good fit.
 - The nut can be glued in place now, or at the very end.
5. Place them in-between a bi-pronged connector (use an official one if possible) and insert a thumb-screw through the holes to get them aligned and spaced correctly.
 - Leave the thumbscrew loose, it's better if the top and bottom plates diverge slightly because then it is easier to insert the finished connector. They will flex slightly and grip together when the thumb-screw is tightened.
 - You may need to sand down the middle layer a little bit if the fit is too tight.
6. Spread the ends slightly to inject some super-glue between each plate.
 - An alternative method would be to put the glue on first then put them in place and insert the thumb-screw to align everything properly while the glue dries. If you put on a bit too much glue you should have a bit more time to re-position, then you can wipe off the excess that seeps out with a damp tissue.
7. Make sure the pieces are aligned at the glue-end. Remember they can still rotate around the thumb-screw.
8. Immediately put a small clamp on to squeeze them together while the glue dries.
9. Glue on the nut (if not done already), being careful not to allow excess glue to block the hole or glue the thumb-screw in place.

This connector section can be super-glued back-to-back with a bi-pronged connector at any rotation you like (not restricted to 90 degrees rotation like the official ones).
You can also stick it directly onto wherever you want to mount your camera, the notches in the sides are there to get a better contact when sticking it to things with mouldable materials such as [Sugru][].

![Tri-pronged connector clamped](http://j-h-a.github.io/go-pro-mounts/connector_triprong_00_clamped.jpg)



<a name="BiprongConnector"/>

Bi-pronged Connector
====================

- **File**: [`connector_biprong.scad`](https://github.com/j-h-a/go-pro-mounts/blob/master/connector_biprong.scad)
- **Description**: Parts for a 2-pronged connector section.

![Bi-pronged Connector](http://j-h-a.github.io/go-pro-mounts/connector_biprong.png)

### Build Instructions

Construction is very similar to the tri-pronged connector, but much simpler.

1. Read the build instructions for the [Tri-pronged Connector](#TriprongConnector) above.
2. Adapt those techniques to build the bi-pronged connector section.

This connector section can be super-glued back-to-back with a tri-pronged connector at any rotation you like (not restricted to 90 degrees rotation like the official ones).



<a name="FlatConnector"/>

Flat Connector
====================

- **File**: [`connector_flat.scad`](https://github.com/j-h-a/go-pro-mounts/blob/master/connector_flat.scad)
- **Description**: Parts for a flat (no 90-degree rotation) connector.

![Flat Connector](http://j-h-a.github.io/go-pro-mounts/connector_flat.png)

### Build Instructions

These parts can be assembled as a flat straight connector, or a flat corner connector.

1. For the corner connector, keep the adjustable `plateLength` value as 23mm, for the straight connector it can be adjusted to the desired length.
2. Stack the pieces as desired and glue together, using thumb-screws to ensure alignment of the holes and correct spacing of the layers.
 - See the build instructions for the [Tri-pronged Connector](#TriprongConnector) above for more details.



<a name="QRClip"/>

Quick-release Clip
==================

- **File**: [`quickrelease_clip.scad`](https://github.com/j-h-a/go-pro-mounts/blob/master/quickrelease_clip.scad)
- **Description**: Half of the quick-release clip (print two of them).

![Quick-release Clip](http://j-h-a.github.io/go-pro-mounts/quickrelease_clip.png)

### Build Instructions

1. Print out two copies of the model.
2. Place them together and use an official quick-release clip that comes with the GoPro to test the fit.
 - You may need to sand the centre ridge so it is a bit more square and the base area so that the clip slides in with a smooth but snug fit.
3. The two clip-halves can be super-glued together and stuck directly onto whatever you like with a double-sided sticky-pad or super-glue.
 - Stick it down with the quick-release clip in-place to ensure exact alignment of the halves.
 - Be careful not to glue the quick-release clip into the holder.
 - It should bot be necessary to glue the halves together directly, but if you want extra strength, inject glue to the crack after releasing the clip.



<a name="PoleGrip"/>

Pole Grip
=========

- **File**: [`quickrelease_pole_grip.scad`](https://github.com/j-h-a/go-pro-mounts/blob/master/quickrelease_pole_grip.scad)
- **Description**: A grip to attach the quick-release clip to a pole.
- **Also needs**: Quick-release Clip. A thin, flat piece of rubber. Plastic wire-ties.

![Pole Grip Model](http://j-h-a.github.io/go-pro-mounts/quickrelease_pole_grip.png)
![Pole Grip Print](http://j-h-a.github.io/go-pro-mounts/quickrelease_pole_grip_00.jpg)

### Build Instructions

1. Print out a quick-release clip and a pole grip.
 - You can adjust the `poleDiameter` and `poleClearance` values in the `.scad` file if required.
2. Glue them together as described in the quick-release clip build instructions.

![Pole Grip Parts](http://j-h-a.github.io/go-pro-mounts/quickrelease_pole_grip_01_parts.jpg)
![Pole Grip Glueing](http://j-h-a.github.io/go-pro-mounts/quickrelease_pole_grip_02_glue.jpg)
![Pole Grip Complete](http://j-h-a.github.io/go-pro-mounts/quickrelease_pole_grip_03_complete.jpg)

### Attaching to a Pole (Permanent)

1. Adjust `poleDiameter` and `poleClearance` to get a tight fit.
2. Build the pole-grip as per the build instructions above.
3. Clip onto the pole using [Sugru][] or super-glue to fix it permanently in place.

### Attaching to a Pole (Temporary)

1. Cut a rectangle of rubber from an old bicycle inner-tube, 50mm long and wide enough to wrap around the pole with a 10mm overlap.
2. Adjust `poleDiameter` to the diameter of your pole and `poleClearance` to the thickness of your rubber.
 - You can make it a bit smaller to get a nice tight fit.
3. Build the pole-grip as per the build instructions above.
4. Feed two plastic wire-ties through the grooves in the base of the pole-grip.
5. Place the rubber centrally in the grip and clip onto the pole.
6. Overlap the rubber and connect the wire-ties around it, pulling tight.

![Pole Grip Temporary Attachment](http://j-h-a.github.io/go-pro-mounts/quickrelease_pole_grip_04_pole.jpg)
![Pole Grip With Camera](http://j-h-a.github.io/go-pro-mounts/quickrelease_pole_grip_05_camera.jpg)



[Sugru]: http://www.sugru.com
