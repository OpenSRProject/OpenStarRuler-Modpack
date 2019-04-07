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
