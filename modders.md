# OpenSR Modder's Guide

***NOTE: This document is concerned solely with properly integrating the OpenSR Modpack into your mods. For other modding-related questions, consult the Star Ruler 2 Steam forums or [Discord server](https://discord.gg/sUJKJDc).***

## Inheriting from the Modpack

0. Create your mod.
1. Open your modinfo using either your preferred text editor, or the SR2 mod editor.
2. Add a "Derives From:" field with the value `OpenSR Modpack`. Be advised that a mod can only derive from one other parent, so if you are already deriving from a different mod, that mod must derive from the Modpack, directly or indirectly:
```
    Derives From: OpenSR Modpack
```
3. Save your changes.

**NOTE: If you are adding the Modpack to an existing mod, inspect the Modpack's files to make sure your mod isn't overriding any of them. If your mod is overriding any of those files, you should overlay your changes on top of the overridden Modpack files.**

**NOTE #2: If you need to override a file that already exists in the Modpack, copy the Modpack's version of that file. Do *not* take the file from the base game itself. (Be aware that the ingame mod editor does not currently enable the Modpack when you are editing mods. This may change in a later Modpack update.)**

**NOTE #3: Modpack files may change over time. Be sure to pay attention to the latest Modpack updates, in order to keep any overridden files up to date!**

## Listing the Modpack as a Dependency

### Steam Workshop

0. Publish your mod to the Steam Workshop, if you haven't done so already. This will require you to have a Steam copy of Star Ruler 2.
1. Go to your mod's Workshop page.
2. In the menu on the right side of the page, click on `Add/Remove Required Items`. Navigate until you find the `OpenSR Modpack` Workshop item. (You will need to have subscribed to the Modpack on Steam, *or* added it to your favorites.)
3. Add the `OpenSR Modpack` item.
4. Press `Save and Continue`.
5. Add a disclaimer to your modinfo, stating that Steam users *must* subscribe to the OpenSR Modpack (and any other dependencies) in order to play your mod. It will be automatically installed, and they do not need to take any further action. (This step is optional, but recommended.)

### SR2 Mod Manager

0. Follow the instructions in the [SR2MM Modder's Guide](https://github.com/DaloLorn/SR2ModManager#modders-guide). (This step is optional, but *strongly* recommended.)
1. Push your mod to a publicly accessible Git repository. SR2MM cannot install mods without a public Git repository.
2. Add the file `metadata.json` to the root of your Git repository, with the following text. Be advised that if you are inheriting from a different mod, that mod - and all of its dependencies - must *all* be available in public Git repositories:
```json
{
    "dependencies":[
        {
            "name":"OpenSR Modpack",
            "repository":"github.com/OpenSRProject/OpenStarRuler-Modpack",
            "branch":"master"
        }
    ]
}
```
3. Add a disclaimer to your modinfo, stating that users of SR2MM versions before 1.1.0 must manually install the OpenSR Modpack (and any other dependencies) in order to play your mod. If your `metadata.json` is correctly configured, users of SR2MM versions 1.1.0 or newer will not need to do anything. (This step is optional, but recommended.)
4. Commit and push your changes.

## Adding to Master Mod List

There is a list of non-Workshop mods in the [OpenSR Discord server](https://discord.gg/sUJKJDc), in the `#mods-and-tools` channel.

You can increase your mod's visibility by adding an entry to that list, containing your mod's name, a short description, and a link to your Git repository (or other download location, if you're not SR2MM-compatible).