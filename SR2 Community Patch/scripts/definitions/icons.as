#priority init 9990
import skins;

IconWrapper@ iconWrapper;

class IconWrapper {
	Sprite Loyalty(getSkinSpriteSheet("AttributeIcons"), 1);
	Sprite Population(getSkinSpriteSheet("ResourceIcon"), 8);
	Sprite Pressure(getSkinSpriteSheet("AttributeIcons"), 0);
	Sprite Effectiveness(getSkinSpriteSheet("StatusIcons"), 0);

	Sprite Planet(getSkinSpriteSheet("PlanetType"), 2);
	Sprite Artifact(getSkinSpriteSheet("ArtifactIcon"), 0);
	Sprite Anomaly(getSkinSpriteSheet("AnomalyIcons"), 0);
	Sprite Asteroid(getSkinMaterial("AsteroidIcon"));
	Sprite Building(getSkinMaterial("Warehouse"));
	Sprite Orbital(getSkinSpriteSheet("GuiOrbitalIcons"), 0, Color(0x9e33ddff));
	Sprite Ship(getSkinSpriteSheet("ActionBarIcons"), 2);
	Sprite Project(getSkinSpriteSheet("ResourceIcon"), 6);

	Sprite Money(getSkinSpriteSheet("ResourceIcon"), 0);
	Sprite Influence(getSkinSpriteSheet("ResourceIcon"), 1);
	Sprite Energy(getSkinSpriteSheet("ResourceIcon"), 2);
	Sprite Labor(getSkinSpriteSheet("ResourceIcon"), 6);
	Sprite Defense(getSkinSpriteSheet("ResourceIcon"), 5);
	Sprite Research(getSkinSpriteSheet("ResourceIcon"), 4);
	Sprite FTL(getSkinSpriteSheet("ResourceIcon"), 3);
	Sprite Empty;

	Sprite Health(getSkinSpriteSheet("AttributeIcons"), 6);
	Sprite Strength(getSkinSpriteSheet("AttributeIcons"), 3);
	Sprite Supply(getSkinSpriteSheet("AttributeIcons"), 4);
	Sprite Shield(getSkinSpriteSheet("ResourceIcon"), 5, Color(0x429cffff));

	Sprite FoodRequirement(getSkinSpriteSheet("ResourceClassIcons"), 3);
	Sprite WaterRequirement(getSkinSpriteSheet("ResourceClassIcons"), 4);
	Sprite FoodWaterRequirement(getSkinSpriteSheet("ResourceClassIcons"), 7);

	Sprite InfluenceWeight(getSkinMaterial("SupportIcon"));
	Sprite InfluencePlayCost = Influence;
	Sprite InfluenceUpkeep(getSkinMaterial("SupplyIcon"));
	Sprite Duration(getSkinSpriteSheet("ContextIcons"), 1);

	Sprite Manage(getSkinSpriteSheet("ActionBarIcons"), 0);
	Sprite ManageSupports(getSkinSpriteSheet("ActionBarIcons"), 2);
	Sprite Colonize(getSkinSpriteSheet("ActionBarIcons"), 1);
	Sprite ProjectDefense(getSkinSpriteSheet("ActionBarIcons"), 3);
	Sprite ColonizeThis(getSkinSpriteSheet("ActionBarIcons"), 4);
	Sprite UnderSiege(getSkinSpriteSheet("QuickbarIcons"), 7);
	
	Sprite Hyperdrive(getSkinSpriteSheet("ActionBarIcons"), 5);
	Sprite Slipstream(getSkinSpriteSheet("ActionBarIcons"), 6);
	Sprite Gate(getSkinSpriteSheet("ActionBarIcons"), 7);
	Sprite Fling(getSkinSpriteSheet("ActionBarIcons"), 8);
	
	Sprite Explore(getSkinSpriteSheet("ActionBarIcons"), 9);
	Sprite HyperExplore(getSkinSpriteSheet("ActionBarIcons"), 10);

	Sprite Ability(getSkinSpriteSheet("ActionBarIcons"), 7);

	Sprite Customize(getSkinSpriteSheet("StatusIcons"), 0);

	Sprite NotReady(getSkinSpriteSheet("CardCategoryIcons"), 0);
	Sprite Ready(getSkinSpriteSheet("CardCategoryIcons"), 4);

	Sprite Obsolete(getSkinSpriteSheet("CardCategoryIcons"), 0);
	Sprite Unobsolete(getSkinSpriteSheet("CardCategoryIcons"), 3);

	Sprite Back(getSkinSpriteSheet("MenuIcons"), 11);
	Sprite Close(getSkinSpriteSheet("MenuIcons"), 8);
	Sprite Remove(getSkinSpriteSheet("MenuIcons"), 8);
	Sprite Delete(getSkinSpriteSheet("MenuIcons"), 8);
	Sprite Create(getSkinSpriteSheet("AttributeIcons"), 2);
	Sprite Add(getSkinSpriteSheet("AttributeIcons"), 2);
	Sprite Plus(getSkinSpriteSheet("AttributeIcons"), 2);
	Sprite Minus(getSkinMaterial("Minus"));
	Sprite Exclaim(getSkinSpriteSheet("MenuIcons"), 5);
	Sprite Info(getSkinSpriteSheet("MenuIcons"), 3);
	Sprite Details(getSkinSpriteSheet("MenuIcons"), 10);
	Sprite Chat(getSkinSpriteSheet("MenuIcons"), 6);
	Sprite Go(getSkinSpriteSheet("MenuIcons"), 9);
	Sprite Refresh(getSkinSpriteSheet("MenuIcons"), 12);
	Sprite Repeat(getSkinSpriteSheet("MenuIcons"), 12);
	Sprite Reset(getSkinSpriteSheet("MenuIcons"), 12, activeSkin.Red);
	Sprite Import(getSkinSpriteSheet("MenuIcons"), 13);
	Sprite Export(getSkinSpriteSheet("MenuIcons"), 13);
	Sprite Forward(getSkinSpriteSheet("MenuIcons"), 10);
	Sprite Load(getSkinSpriteSheet("MenuIcons"), 1);
	Sprite Save(getSkinSpriteSheet("MenuIcons"), 2);
	Sprite Edit(getSkinMaterial("TabDesigns"));
	Sprite Action(getSkinSpriteSheet("CardCategoryIcons"), 0);

	Sprite Undo(getSkinSpriteSheet("EditIcons"), 0);
	Sprite Redo(getSkinSpriteSheet("EditIcons"), 2);
	Sprite UndoDisabled(getSkinSpriteSheet("EditIcons"), 1);
	Sprite RedoDisabled(getSkinSpriteSheet("EditIcons"), 3);
	Sprite Clear(getSkinSpriteSheet("EditIcons"), 8);

	Sprite Paint(getSkinSpriteSheet("EditIcons"), 4);
	Sprite Move(getSkinSpriteSheet("EditIcons"), 5);
	Sprite Eyedrop(getSkinSpriteSheet("EditIcons"), 6);
	Sprite Search(getSkinSpriteSheet("EditIcons"), 6);

	Sprite Donate(getSkinSpriteSheet("ActionBarIcons"), 4, colors::Green);
	Sprite Upvote(getSkinMaterial("ThumbsUp"));
	Sprite Next(getSkinSpriteSheet("MenuIcons"), 9);
	Sprite Previous(getSkinSpriteSheet("MenuIcons"), 11);

	Sprite Replace(getSkinSpriteSheet("EditIcons"), 7);
	Sprite Satellite(getSkinSpriteSheet("GuiOrbitalIcons"), 14, Color(0xe759ffff));
};

void init() {
	@iconWrapper = IconWrapper();
}