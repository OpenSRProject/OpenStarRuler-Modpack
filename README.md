# SR2 Community Patch

This mod can be overridden and included as a resource by other mods for them to inherit
the changes from the Community Patch.
The following line must be added to modinfo.txt:

Derives From: SR2 Community Patch

The Community Patch must not be enabled in the SR2 mod list when used in this way,
the parent mod will automatically run it. Files overridden by the parent mod have
priority over those of the Community Patch.
This means that files overridden by both the parent mod and the Community Patch
must be merged to keep functionalities from the Community Patch.

## For contributors

It is strongly recommended that you observe certain standards when working on the Community Patch, to make things easier for you, people reviewing your code, and people tracking down bugs or other changes:

1. Follow the instructions outlined in the SR2MM readme, located at https://github.com/DaloLorn/SR2ModManager, to properly connect your CP repository to your game.

2. When editing a file that previously existed in the base game, commit the original, *unmodified* file in a "clone commit", then commit your changes after that. This will make your changes easier to identify when looking through the commit history. (Obviously, images and other binary files are an exception...)
