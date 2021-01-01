### r171 - January 1, 2021

- Bromma and Farum shipsets should no longer have issues loading starter designs. Thanks to Skeletonxf for noticing the issue!

# OpenSR Modpack v1.1.0 (r169) - December 29, 2020

## Major Highlights

- The SR2 Community Patch is now part of the Open Star Ruler project, and is being rereleased as the OpenSR Modpack.
    - A notable effect of this change is that the Modpack is expected to see more frequent releases.
    - Mods deriving from the CP should now derive from the MP. 
    - Mods which specify an SR2MM dependency should change their repository target from `github.com/sol-oriens/SR2-Community-Patch` to `github.com/OpenSRProject/OpenStarRuler-Modpack`.
- Restored data compatibility between OpenSR and the commercial builds of the game.
    - Jon Micheelsen's new Bromma and Farum shipsets are now available as part of the Modpack!

## Bug Fixes

- Removed illegal fusion generators from the default Ancient Gate.
- Fixed a vanilla bug causing the AI to retain exports to planets it no longer owns.
- Fixed a few syntax errors in the ringworld shader.
- The **Planets/Orbitals with Labor** quickbar no longer erroneously checks if orbitals have construction. Instead, only orbitals with more than 0 Labor are considered.
- The bombardment status from Carpet Bombs now correctly affects overpopulated planets.
- The `ConvertResource` hook now correctly behaves with `convert_percent` values other than 0.5.
    - This should only affect mods.
- The `IfInOwnedSpace` hook now correctly checks for allied *or* owned space if `allow_allies` is set to true, not just allied space.
- The `AddLocalDefense` hook will no longer discard excess Defense when it constructs a ship, or skip a tick when picking a new design.
- Civilian ships will no longer fly to unowned planets.
- Civilian ships will no longer treat unflattened galaxies as flat.
- Civilian ships will now fly on the correct side of trade lanes.
- Civilian ships will no longer path to system borders if a gate, wormhole, or slipstream tear would get them to their destination sooner.
- Civilian ships will no longer waste time pathing while they're in transit.
- The `ProduceNativePressurePct` hook will now correctly produce pressure for multiple resources (if applicable), and updates its pressure selection if the planet's resources are altered.
    - This update runs every 30 seconds. Future MP versions will instead add a new callback to notify hooks that the planet's resources have changed.
- Primary resource selection now treats scalables as more valuable than tiered resources. Consequently, Ancient races can once again build Infusers on planets where scalables are present alongside such resources.
    - This should only affect mods.
- The netcode now correctly reads a planet's level chain ID *before* trying to read the level chain. This prevents crashes and other issues that might occur with a level chain with more or less levels than the default chain.
    - This should only affect mods.
- When spawned, support ships will now inherit the velocity of their leader, instead of starting stationary. This will prevent them from being lost in space when spawned by moving planets or other such entities.
- Linked races now correctly start with AI Cores unlocked at the beginning of the game.
- Fixed an exploit that could occasionally cause pickups to be collected more than once. (Not to be confused for the Delinquent attitude effect that doubles pickup rewards!)

## Improvements

- Since the IRC is now empty (if it even exists anymore), the integrated AutoIRC functionality is now off by default.
- Added a configurable minimum labor threshold for the **Planets/Orbitals with Labor** quickbar. Objects with less Labor than the specified amount will no longer be shown in the quickbar.
    - Mechanoid objects are treated as having 1 more Labor than they do, to prevent instances where literally every Mechanoid planet is shown on the quickbar.
- Added the Bromma and Farum shipsets, first added to the SR2 open source repository by Jon Micheelsen.
- Planet popups now always display the planet's health.
- Additionally, planet popups now display the planet's fleet strength.
    - Note that this will always be counted as zero when the planet has no support ships, even if it has planetary defenses. This is due to a quirk of the strength calculation formula, since a planet cannot be damaged by conventional weapons.
- If a resource is disabled due to ongoing terraforming, the UI will now show an appropriate message.
- Improved the readability of global bar resource tooltips.

# SR2 Community Patch v1.0.0 - April 7, 2019

## Artificial Intelligence

- AIs will no longer send damaged flagships to battle.
- AIs are now able to build and prioritize Outposts to protect their territory or expand beyond systems without planets or resources (including nebulae). Evangelical lifestyles will build Star Temples instead.
- AIs now expand outside their trade area when they are out of other options.
- AIs now build moon bases on planets when needed (except, of course, Star Children).
- AIs now slow down or even temporarily stop their colonization effort when necessary in order to maintain a budget buffer for other expenditures.
- Colonization prioritization has been revised and all randomness in the decision process has been replaced by a deterministic weighting.
- AIs now abandon certain planets if their estimated next budget becomes negative.
- AIs can now choose to focus on one particular area with their budget spending under certain circumstances.
- AIs can now borrow money from their next budget for construction projects critical to their development.
- AIs now build Commerce Stations to establish trade routes between their territories.
- AIs now build a Factory in territories where no labor is available to establish a trade route.
- AIs now build Research Complexes if their research generation rate is too low.

## Bug Fixes

- Fixed a bug where map generation would sometimes fail due to a script error related to Remnants.
- Fixed a bug where Remnant fleets would attack their own defense stations in Invasion maps.
- Fixed a bug where Flagship Health research nodes would also increase support ship health (Wake of the Heralds DLC only).
- Fixed a bug where the Buy Influence ability on Commerce Stations would display an incorrect cost.
- Fixed a bug where the dry dock construction menu would list different versions of a design under certain circumstances.
- Fixed a bug with the asteroid fields orbiting Local Asteroid Field Planets not being rendered in certain circumstances.
- Fixed a bug where persistent beam effects were not restored upon loading a save file.
- Fixed a bug where strategic icons of Ore asteroids spawned when a planet is destroyed were incorrectly set to resource asteroid icons.
- Fixed a bug where Ore asteroids in the mirrored part of a Dumbbell Galaxy generated with the 'Perfect Mirror' option had a resource asteroid strategic icon.
- Fixed a bug where the incremental Ore cost spent to build certain things would refund the next increment's worth of Ore when refunded.
- Fixed a bug where elapsed time was not tracked correctly for empire-related attributes and planet statuses.
- Fixed a bug where status stacks spent to build certain things (like troop pods filled with troops) would only ever refund one instance instead of the correct amount when refunded.
- Fixed a bug where orbital types present in systems tracked by AIs were not loaded from a previously saved game.
- Fixed a bug where the packed and unpacked gate statuses were not tracked by AIs.
- Fixed a bug where Mothership population status was not tracked by AIs.
- Fixed a bug where the game would crash when trying to display a Ringworld with certain older graphics cards.

## Improvements

- The shipset selection box is now dynamically resized depending of the number of available shipsets.
- Added Advanced and Crazy options tabs for universe generation.
- Added FXAA graphics option.
- Added 'Safe Ringworlds' graphics option. Activate only if experiencing issues when displaying Ringworlds.
- Added an option to automatically connect to the SR2 IRC.
- The IRC now pings you if a message is addressed to you or contains the string '%everyone%'.
- Added an option to enable playback of in-game music in the title screen.
- Added additional failsafes to the design import process.
