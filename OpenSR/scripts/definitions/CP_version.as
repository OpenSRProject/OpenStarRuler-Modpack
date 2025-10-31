//#opensr
import version;

/* NOTE: These helpers are outside the MP namespace for ease of access.

	Some features of OpenSR are not backwards-compatible with
	the commercial client (or older builds of OpenSR),
	or at least not in any way that the script engine can understand.
	To prolong compatibility, those features can be gated behind
	special pseudo-comment blocks... but this may be inconvenient
	for a modder, so these helper constants and functions
	have been added to the OpenSR Modpack.

	As you may have noticed, LANGUAGE_LEVEL wraps the value of
	OSR_COMPILER_VERSION, defaulting it to 0 if it doesn't exist
	to avoid a script error. 
*/
const uint LANGUAGE_LEVEL = 0 /*% + OSR_COMPILER_VERSION %*/;

/*
	While the constants below should hopefully prove sufficient
	for most uses of LANGUAGE_LEVEL (maintainers should try to
	add new constants as appropriate), this is sadly not guaranteed.
	This helper function emulates the hardcoded compiler version matching,
	allowing you to do the following:

	`if(hasLanguageLevel(3, 5)) doStuff();`

	equivalent to the versioned block `//%3-5 doStuff();`

	(There is a multi-line equivalent, but nested block comments
	 aren't supported in AngelScript, so this must be left to your imagination.)
*/
bool hasLanguageLevel(uint minLevel = 1, uint maxLevel = UINT_MAX) {
	return LANGUAGE_LEVEL >= minLevel && LANGUAGE_LEVEL <= maxLevel;
}

/* 
	Indicates that the game is definitely using an OpenSR client.
	This has surprisingly little use in itself, as language level 1
	concerned itself solely with establishing the versioned block syntax
	and passing the new OSR_COMPILER_VERSION constant to the script engine.
*/
const bool IS_OPENSR_BUILD = LANGUAGE_LEVEL != 0;

namespace CommunityPatch {
	const array<string> VERSIONS = {
		"v2.0.3",
		"OpenSR v1.0.0",
	};

	const array<string> REVISIONS = {
		"r5101",
		"r5095",
		"OSR r70",
		"OSR r71",
	};
	const string MOD_NAME = "OpenSR Modpack v1.2.0";
	const string MOD_REVISION = "300";
	const string MOD_VERSION = MOD_NAME + " (revision " + MOD_REVISION + ") for Star Ruler 2 " + VERSIONS[0] + " (revision " + REVISIONS[0]
		+ ", currently using " + GAME_VERSION + " " + SCRIPT_VERSION + ")";

	string getLowestSupported(string input) {
		print(input.split("; ")[0]);
		return input.split("; ")[0];
	};

	bool checkSupported() {
		bool resultA = false;
		bool resultB = false;
		for(uint i = 0; i < VERSIONS.length; ++i) {
			if(VERSIONS[i].equals_nocase(GAME_VERSION)) {
				resultA = true;
				break;
			}
		}
		if(resultA) {
			for(uint i = 0; i < REVISIONS.length; ++i) {
				if((REVISIONS[i]).equals_nocase(SCRIPT_VERSION)) {
					resultB = true;
					break;
				}
			}
		}
		if(resultA && resultB)
			return true;
		else {
			error("Mod " + MOD_NAME + " does not support current game version " + GAME_VERSION + "(" + SCRIPT_VERSION + "), use with caution!");
			return false;
		}
	}
}
