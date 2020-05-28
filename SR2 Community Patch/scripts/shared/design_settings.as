#priority init 9990
import skins;

enum SupportBehavior {
	SG_Brawler,
	SG_Shield,
	SG_Cavalry,
	SG_Artillery,
	SG_Cannon,
	SG_Support,

	SG_COUNT,
	SG_Satellite,
};

const array<string> SUPPORT_BEHAVIOR_NAMES = {
	"Brawler",
	"Shield",
	"Cavalry",
	"Artillery",
	"Cannon",
	"Support",
};
array<Sprite> SUPPORT_BEHAVIOR_ICONS;

enum SupportRange {
	SR_Auto,
	SR_Far,
	SR_Close,

	SR_COUNT
};

const array<string> SUPPORT_RANGE_NAMES = {
	"Auto", "Far", "Close",
};

final class DesignSettings : Serializable, Savable {
	uint behavior = SG_Cannon;
	uint range = SR_Auto;

	DesignSettings() {
	}

	void write(Message& msg) {
		msg.writeSmall(behavior);
		msg.writeSmall(range);
	}

	void read(Message& msg) {
		behavior = msg.readSmall();
		range = msg.readSmall();
	}

	void save(SaveFile& file) {
		file << behavior;
		file << range;
	}

	void load(SaveFile& file) {
		file >> behavior;
		file >> range;
	}

	void write(JSONNode@ node) const {
		node["behavior"] = SUPPORT_BEHAVIOR_NAMES[clamp(behavior, 0, SUPPORT_BEHAVIOR_NAMES.length-1)];
		node["range"] = SUPPORT_RANGE_NAMES[clamp(range, 0, SUPPORT_RANGE_NAMES.length-1)];
	}

	void read(JSONNode@ node) {
		auto@ field = node.findMember("behavior");
		if(field !is null && field.isString()) {
			string value = field.getString();
			for(uint i = 0, cnt = SUPPORT_BEHAVIOR_NAMES.length; i < cnt; ++i) {
				if(SUPPORT_BEHAVIOR_NAMES[i].equals_nocase(value)) {
					behavior = i;
					break;
				}
			}
			if(value == "Bomber")
				behavior = SG_Cavalry;
		}

		@field = node.findMember("range");
		if(field !is null && field.isString()) {
			string value = field.getString();
			for(uint i = 0, cnt = SUPPORT_RANGE_NAMES.length; i < cnt; ++i) {
				if(SUPPORT_RANGE_NAMES[i].equals_nocase(value)) {
					range = i;
					break;
				}
			}
		}
	}
};

void init() {
	array<Sprite> behaviorIcons = {
		Sprite(getSkinSpriteSheet("AttributeIcons"), 3),
		activeSkin.SupportBehaviorShield,
		activeSkin.SupportBehaviorCavalry,
		Sprite(getSkinSpriteSheet("CardCategoryIcons"), 5),
		Sprite(getSkinSpriteSheet("AttributeIcons"), 4),
		Sprite(getSkinMaterial("SupplyIcon")),
	};
	SUPPORT_BEHAVIOR_ICONS = behaviorIcons;
}