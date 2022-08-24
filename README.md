# Open Star Ruler
Developed by Blind Mind Studios from 2011-2017 and first launched in March 2015,
Star Ruler 2 is a massive-scale 4X/RTS set in space. Explore dozens, hundreds,
or even thousands of systems in a galaxy (or galaxies) of your choosing, expand across their
planets, exploit the resources you find, and ultimately exterminate any who
stand in your way. The fate of your empire depends on your ability to master
the economy, field a military, influence galactic politics, and learn what you
can about the universe.

Open Star Ruler is a community-led attempt to maintain and upgrade the original game
with as little impact as possible upon its compatibility with the commercially distributed
binaries from Steam and GOG.

## What is this?
This repository contains the OpenSR Modpack, the third branch of the OpenSR project and 
the successor to the SR2 Community Patch. Given the extreme moddability provided by the 
Starflare engine, most OpenSR changes can be packaged as a mod (in fact, the original 
game is itself virtually indistinct from a mod). 

The use of the game's modding system to distribute such changes allows us to
maximize compatibility with commercial versions of the game, to the point that we
do not currently foresee a scenario where we shall have to break data compatibility 
with commercial clients.

## Modder's Guide

This mod can be overridden and included as a resource by other mods, allowing them to inherit
the changes made by the Modpack.
The following line must be added to your `modinfo.txt`:

```
    Derives From: OpenSR Modpack
```

The Modpack must not be enabled in the SR2 mod list when used in this way;
the parent mod will enable it implicitly without user intervention.
Files overridden by the parent mod have priority over those of the Modpack.
This means that files overridden by both the parent mod and the OpenSR Modpack
must be merged to keep functionalities from the Modpack.

## Contributor Code of Conduct

It is strongly recommended that you observe certain standards when working on the Modpack, to make things easier for you, people reviewing your code, and people tracking down bugs or other changes:

1. Follow the instructions outlined in the OpenSR modder's guide, located at https://github.com/OpenSRProject/OpenStarRuler-Launchpad#modders-guide, to properly connect your MP repository to your game. (These instructions can, and *should* also be applied to other mods intended for distribution via the OpenSR Launchpad.)

2. When editing a file that previously existed in the base game, commit the original, *unmodified* file in a "clone commit", then commit your changes after that. This will make your changes easier to identify when looking through the commit history. (Obviously, images and other binary files are an exception...)

    Pull requests not observing proper cloning protocols will be closed. While the changes contained in such PRs *may* be subsequently reproduced by a Modpack maintainer in a properly-formatted PR, the OpenSR team does not make any guarantee as to if or when this will take place. 
