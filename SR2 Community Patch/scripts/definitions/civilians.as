#priority init 9990
import skins;

enum CargoType {
	CT_Resource,
	CT_Goods,
};

enum CivilianType {
	CiT_Freighter,
	CiT_Station,
};

array<const Model@> CivilianModels = {
	model::Fighter,
	model::CommerceStation,
};

array<const Material@> CivilianMaterials;

array<Sprite> CivilianIcons;

const double CIV_SIZE_MIN = 2.0;
const double CIV_SIZE_MAX = 5.4;
const double CIV_SIZE_FREIGHTER = 2.7;
const double CIV_SIZE_CARAVAN = 5.0;

const double CIV_RADIUS_WORTH = 1.0;

const int CIV_CARAVAN_INCOME = 15;
const int CIV_STATION_INCOME = 20;

const Model@ getCivilianModel(Empire@ owner, uint type, double radius) {
	if(owner !is null) {
		auto@ ss = owner.shipset;
		if(ss !is null) {
			const ShipSkin@ skin;
			if(type == CiT_Freighter)
				@skin = ss.getSkin("Freighter");

			if(skin !is null)
				return skin.model;
		}
	}
	return CivilianModels[type];
}

const Material@ getCivilianMaterial(Empire@ owner, uint type, double radius) {
	if(owner !is null) {
		auto@ ss = owner.shipset;
		if(ss !is null) {
			const ShipSkin@ skin;
			if(type == CiT_Freighter)
				@skin = ss.getSkin("Freighter");

			if(skin !is null)
				return skin.material;
		}
	}
	return CivilianMaterials[type];
}

double randomCivilianFreighterSize() {
	return sqr(randomd()) * (CIV_SIZE_MAX - CIV_SIZE_MIN) + CIV_SIZE_MIN;
}

string getCivilianName(uint type, double radius) {
	if(type == CiT_Freighter) {
		if(radius >= CIV_SIZE_CARAVAN)
			return locale::CIVILIAN_CARAVAN;
		else if(radius >= CIV_SIZE_FREIGHTER)
			return locale::CIVILIAN_FREIGHTER;
		return locale::CIVILIAN_MERCHANT;
	}
	else if(type == CiT_Station) {
		return locale::CIVILIAN_STATION;
	}
	return locale::CIVILIAN;
}

Sprite getCivilianIcon(Empire@ owner, uint type, double radius) {
	if(type == CiT_Freighter) {
		if(radius >= CIV_SIZE_CARAVAN)
			return Sprite(getSkinSpriteSheet("HullIcons"), 4);
		else if(radius >= CIV_SIZE_FREIGHTER)
			return Sprite(getSkinSpriteSheet("HullIcons"), 3);
	}
	return CivilianIcons[type];
}

const double STATION_MIN_RAD = 5.0;
const double STATION_MAX_RAD = 10.0;

void init() {
	CivilianMaterials.insertLast(getSkinMaterial("Ship10"));
	CivilianMaterials.insertLast(getSkinMaterial("GenericPBR_CommerceStation"));
	CivilianIcons.insertLast(Sprite(getSkinSpriteSheet("HullIcons"), 2));
	CivilianIcons.insertLast(Sprite(getSkinSpriteSheet("OrbitalIcons"), 0));
}