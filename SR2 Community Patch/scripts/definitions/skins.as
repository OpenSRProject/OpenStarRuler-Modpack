#priority init 20000
#section client
import elements.Alignment;
#section all

Sprite getSkinSprite(const string& desc) {
    string tmp = desc;
    int pos = tmp.findFirst("::");
    string reference;
    if(pos >= 0) {
        if(activeSkin.spriteSheetOverrides.exists(tmp.substr(0, pos))) {
            activeSkin.spriteSheetOverrides.get(tmp.substr(0, pos), reference);
            return getSprite(reference + tmp.substr(pos));
        }
    }
    else {
        pos = tmp.findFirst("*");
        if(activeSkin.materialOverrides.exists(tmp.substr(0, pos))) {
            activeSkin.materialOverrides.get(tmp.substr(0, pos), reference);
            if(pos >= 0)
                return getSprite(reference + tmp.substr(pos));
            else return getSprite(reference);
        }
    }
    return getSprite(desc); // No matching overrides found, get the default sprite!
}

const Material@ getSkinMaterial(const string& ident) {
    const Material@ mat;
    string reference;
    if(activeSkin.materialOverrides.exists(ident)) {
        activeSkin.materialOverrides.get(ident, reference);
        @mat = getMaterial(reference);
    }
    if(mat is null || mat is material::error)
        return getMaterial(ident);
    return mat;
}

const SpriteSheet@ getSkinSpriteSheet(const string& ident) {
    const SpriteSheet@ sheet;
    string reference;
    if(activeSkin.spriteSheetOverrides.exists(ident)) {
        activeSkin.spriteSheetOverrides.get(ident, reference);
        @sheet = getSpriteSheet(reference);
    }
    if(sheet is null || sheet is spritesheet::error)
        return getSpriteSheet(ident);
    return sheet;
}

const SoundSource@ getSkinSound(const string& ident) {
    const SoundSource@ sound;
    string reference;
    if(activeSkin.soundOverrides.exists(ident)) {
        activeSkin.spriteSheetOverrides.get(ident, reference);
        @sound = getSound(reference);
    }
    if(sound is null)
        return getSound(ident);
    return sound;
}

/* // This doesn't actually work yet. Even when it does, I'm not sure we should use it.
const string getSkinLocale(const string& ident) {
    string locale, reference;
    if(activeSkin.localeOverrides.exists(ident)) {
        activeSkin.localeOverrides.get(ident, reference);
        locale = localize(reference);
    }
    if(locale == "")
        return localize(ident);
    return locale;
}
*/

Color getSkinValue(const string& ident) {
    AnyClass@ cls = getClass(activeSkin);
    for(uint i = 0, cnt = cls.memberCount; i < cnt; ++i) {
        if(cls.memberName[i] == ident) {
            auto@ value = cls.getMember(activeSkin, i);
        }
    }
    return Color();
}

ExtendedSkin@ activeSkin = ExtendedSkin("Default");
dictionary skins;

export getSkinSprite, getSkinMaterial, getSkinSpriteSheet, getSkinSound, getSkinValue;
export ExtendedSkin;
export skins, activeSkin;

tidy class ExtendedSkin {
#section client
    const Skin@ skin;
#section all

    ExtendedSkin(string _skin) {
#section client
        @skin = getSkin(_skin);
#section all
    }

    // All override dictionaries - except colors - contain strings matching
    // the descriptor pattern used by their respective data file entries.
    // Unless specified otherwise, the key is the identifier of the object being replaced/modified.
    // Most comments will instead focus on the format of the values associated with
    // those keys.

    // These generic overrides are just an identifier. No special patterns.
    dictionary/*<string>*/ materialOverrides;
    dictionary/*<string>*/ spriteSheetOverrides;
    dictionary/*<string>*/ soundOverrides;

    // Icon/symbol overrides are specified as sprite descriptors. 
    // Reminder: full format is `Ident::Index*#Color`, but `::Index` is only applicable to spritesheets.
    // The default value for `::Index` is `::0`, while `#Color` defaults to `#fff`.
    //
    // Note that `#Color` will be interpreted differently depending on the amount of
    // digits used. Three digits is 12-bit RGB, four digits is 16-bit RGBA,
    // six digits is 24-bit RGB, and eight digits is 32-bit RGBA.
    // Other sizes have not been thoroughly tested.
    //
    // Also be advised that `#Color` is actually a color filter, rendering X% of the original sprite's color.
    // For example, a color of `#f77` would not modify the red channel, and would render
    // the green and blue channels at 50% brightness.
    // As such, effects are most consistent when dealing with grayscale images, as these
    // can be tinted uniformly across the entire color spectrum.
    dictionary abilityIconOverrides;
    // Sound overrides, as far as I can tell, are specified as plain identifiers.
    dictionary abilitySoundOverrides;

    // Since anomaly options do not have globally unique identifiers,
    // the anomaly type must also be specified. Key format is `AnomalyIdent.OptionIdent`.
    dictionary anomalyOptionIconOverrides;

    dictionary artifactIconOverrides;
    dictionary artifactStratIconOverrides;

    // Color overrides are specified as Color values.
    dictionary attitudeColorOverrides;
    // Attitude levels also don't have identifiers. Key format is `AttitudeIdent.Level` (zero-indexed).
    dictionary attitudeLevelIconOverrides;

    dictionary buildingSpriteOverrides;

    dictionary campaignIconOverrides;
    dictionary campaignPictureOverrides;
    dictionary campaignColorOverrides;

    dictionary cargoIconOverrides;
    dictionary cargoColorOverrides;

    dictionary constructionIconOverrides;

    dictionary weaponSkinIconOverrides;

    // This block of dictionaries deals with influence cards, treaty clauses, influence effects, and votes.
    dictionary cardIconOverrides;
    dictionary cardColorOverrides;
    dictionary clauseIconOverrides;
    dictionary clauseColorOverrides;
    dictionary effectIconOverrides;
    dictionary effectColorOverrides;
    dictionary voteIconOverrides;
    dictionary voteColorOverrides;

    dictionary orbitalIconOverrides;
    dictionary orbitalDistantIconOverrides;
    dictionary orbitalStratIconOverrides;

    // As anomalies - use `EventIdent.OptionIdent`.
    dictionary randomEventOptionIconOverrides;

    dictionary techIconOverrides;
    dictionary techSymbolOverrides;
    dictionary techColorOverrides;

    dictionary resourceIconOverrides;
    dictionary resourceSmallIconOverrides;

    dictionary statusIconOverrides;
    dictionary statusColorOverrides;

    dictionary traitColorOverrides;
    dictionary traitIconOverrides;

    // Note that sprites defined by ExtendedSkin *must* be overridden in order to use overrides.
    // This is because the ExtendedSkin initializer does not know the contents of materialOverrides
    // and spriteSheetOverrides, as we haven't filled it up yet.
    // Similarly, instances of ExtendedSkin should avoid using the skinned sprite getters altogether.
    Sprite InfluencePurchaseCost = Sprite(spritesheet::ConvertIcon, 0);
    Sprite Zoom = Sprite(spritesheet::EditIcons, 6);
    Sprite GalaxyTab = Sprite(material::SystemUnderAttack);

    Sprite InfoBarHoldPosition = Sprite(spritesheet::ActionBarIcons, 12);
    Sprite InfoBarRegionBound = Sprite(spritesheet::ActionBarIcons, 13, Color(0xff8080ff));
    Sprite InfoBarHoldFire = Sprite(material::Minus);
    Sprite InfoBarRaidingOnly = Sprite(spritesheet::ActionBarIcons, 22, Red);

    Sprite DesignEditorHull = Sprite(spritesheet::ShipIcons, 1, Color(0x8080ffff));

    Sprite PlanetsTabTiles = Sprite(spritesheet::PlanetType, 0);
    Sprite PlanetsTabBg = Sprite(spritesheet::PlanetType, 2);

    // As this is a derived sprite - see the comments below - it may not need to be overridden.
    Sprite LobbyMaps = GalaxyTab;

    Sprite SupportBehaviorShield = Sprite(spritesheet::ResourceIcon, 5);
    Sprite SupportBehaviorCavalry = Sprite(material::StatusWar);
    
    // ExtendedSkin colors sometimes draw their value from other colors in that skin.
    // In order to correctly override these, there are four options.
    // 1) Create a subclass of ExtendedSkin, and override the parent colors by redeclaring them with a new initializer.
    // 2) Create subclass of ExtendedSkin, and override the parent colors in the constructor *after* calling `super(skin)`.
    // 3) Create subclass of ExtendedSkin, and apply options 1 or 2 on the derived colors instead.
    // 4) Instantiate ExtendedSkin directly, then set the derived colors manually.
    Color Money(0xd1cb6aff);
    Color Influence(0x0087c7ff);
    Color Energy(0x42b4dfff);
    Color Defense(0xaf7926ff);
    Color Labor(0xb1b4b6ff);
    Color Research(0x8c4ec9ff);
    Color FTL(0x00c0ffff);
    Color FTLResource(0x9bd29cff);

    Color Planet(0x8cc94eff);
    Color Artifact(0xfe82ffff);

    Color White = colors::White;
    Color Red = colors::Red;
    Color Orange = colors::Orange;
    Color Green = colors::Green;
    Color Blue = colors::Blue;
    Color Black = colors::Black;
    
    Color UncommonCard(0x80baffff);
    Color RareCard(0xe580ffff);
    Color EpicCard(0xffe680ff);

    // Various colors used in localization.
    Color PopReq(0xff9000ff);
    Color WarningRed(0xff3333ff);
    Color LocaleBuff = White;
    Color NoteRed(0xff7070ff);
    Color LocaleTitle = White;
    Color MoneyIcon = White;
    Color ResearchIcon = White;
    Color InfluenceIcon = White;
    Color LaborIcon = White;
    Color DefenseIcon = White;
    Color EnergyIcon = White;
    Color BorrowedMoney(0xffff00ff);
    Color ScalableRed(0xffb4b6ff);
    Color MareniumRed(0xff8000ff);

    // The overrides in this section are only used in client scripts (client, gui, menu, toolkit). Any use or alteration of these values must be done in a clientside block.
    // (Technically, the colors and ints are fine. The issue arises when you try overriding `Alignment`s and `recti`s.)

#section client

    Color CommunityDesignBG = FTL;
    Color CommunityWikiBG = Research;

    Color CommunityActive(0xff83bcff);
    Color CommunityInactive(0xff0077ff);
    Color CommunitySeparator(0x8d4969ff);

    Color UploadDesignTitle = FTL;
    
    Color AnomalyTitle = Green;
    Color AnomalyChoicesTitle = Orange;
    Color AnomalyProgressBar(0x6aadcbff);

    int ConstructionListItemHeight = 30;
    int ConstructionListTooltipPadding = 4;
    int ConstructionIconBaseHeight = 30;
    int ConstructionCostIconTopPadding = 3;
    int ConstructionCostTextTopPadding = 0;
    
    int EdictDisplayExtraHeight = 0;

    Alignment PlanetToggleTreeAlignment(Right-40, Top, Right, Top+43);

    Alignment PlanetPopupNameAlignment(Left+50, Top+6, Right-4, Top+28);
    Alignment PlanetPopupOwnerAlignment(Left+48, Top+28, Right-6, Top+46);
    double PlanetPopupOwnerHorizAlign = 1.0;
    Alignment PlanetPopupViewAlignment(Left+4, Top+50, Right-4, Top+120);
    Alignment PlanetPopupBandAlignment(Left+3, Bottom-35, Right-4, Bottom-2);
    Alignment PlanetPopupStatusAlignment(Right-2, Top, Right+34, Bottom);
    recti PlanetPopupSubtitleArea(const recti& bgPos) const {
        return recti_area(bgPos.topLeft + vec2i(2,2), vec2i(bgPos.width-2, 50-4));
    }

    Alignment ShipPopupNameAlignment = PlanetPopupNameAlignment;
    Alignment ShipPopupOwnerAlignment = PlanetPopupOwnerAlignment;
    double ShipPopupOwnerHorizAlign = PlanetPopupOwnerHorizAlign;
    recti ShipPopupSubtitleArea(const recti& bgPos) const {
        return PlanetPopupSubtitleArea(bgPos);
    }

    Alignment SupportGroupLeaderBGAlignment(Left, Top, Right-22, Top+50);
    Color SupportClearGhosts = Red;
    Color SupportOverflow = Red;
    Color SupportNearCap = Orange;
    Color SupportCount = colors::White;
    Color SupportAddShips = Green;
    Color SupportRemoveShips = Red;

    int TimeDisplayExtraHeight = EdictDisplayExtraHeight;

    Color DesignEditorRemove = Red;
    Color DesignEditorApply = Green;
    Color DesignEditorButton(0x80a0ffff);
    Color DesignEditorTool = Green;
    Color DesignEditorClear = Red;
    Color DesignWarningColor = Orange;
    Color DesignEditorLeader(0x00e5f7ff);
    string DesignEditorRoleWide = "[img=$1;$4][vspace=$5]$3:\n[offset=15][font=Subtitle][b]$2[/b][/font][/offset][/vspace][/img]";
    string DesignEditorRole = "[img=$1;$4][vspace=$5][vspace=4]$3:[/vspace] [font=Subtitle][b]$2[/b][/font][/vspace][/img]";
    Color DesignEditorSave = Green;
    Color DesignEditorActive(0x83cfffff);
    Color DesignEditorInactive(0x009cffff);
    Color DesignEditorSeparator(0x49738dff);

    Color DesignOverviewClass1(0x00c3ffff);
    Color DesignOverviewClass2(0xcf4cffff);
    Color DesignOverviewClass3(0xbaff4cff);
    Color DesignOverviewClass4(0xff6c00ff);
    Color DesignOverviewClass5(0xebc0ffff);
    Color DesignOverviewClass6(0xc7af99ff);
    Color DesignOverviewClass7(0xf49bcfff);
    Color DesignOverviewClass8(0x00ff9cff);
    Color DesignOverviewClass9(0x00deffff);
    Color DesignOverviewCreateClass(0x8888ffff);
    Color DesignOverviewActive = DesignEditorActive;
    Color DesignOverviewInactive = DesignEditorInactive;
    Color DesignOverviewSeparator = DesignEditorSeparator;
    Color DesignOverviewFlagship(0x00e5f7ff);

    Color DiplomacyStackTitle(0x53feb3ff);
    Color DiplomacyDrawProgress(0x20adffff);
    Color DiplomacyCardTitle(0xb3fe00ff);
    Color DiplomacyVoteTitle(0x00bffeff);
    Color DiplomacyHistoryButton(0x9be5feff);
    Color DiplomacyEffectBG(0xfe8300ff);
    Color DiplomacyTreatyBG(0x7300feff);
    Color DiplomacyActive(0x74fc4eff);
    Color DiplomacyInactive(0x37ff00ff);
    Color DiplomacySeparator(0x408c2bff);
    Color DiplomacyEnemyVassal = Red;
    Color DiplomacyWarLabel = Red;
    Color DiplomacyStrengthWeak(0xff8080aa);

    Color VoteAgainstBG(0xffffff40);
    Color VoteAgainstFG = Red;
    Color VoteForBG = VoteAgainstBG;
    Color VoteForFG = Green;

    string DiplomacyTreatyLeader = "$1's [b]$2[/b]";
    Color DiplomacyTreatyJoin = Green;
    Color DiplomacyTreatyDecline = Red;
    Color DiplomacyTreatyDismiss = Red;

    Color DiplomacyDeclareWarTitle(0xe00000ff);
    Color DiplomacySurrenderTitle = DiplomacyDeclareWarTitle;
    Color DiplomacyProposeTreaty(0xaaffaaff);
    Color DiplomacyProposeTreatyTitle = Green;
    Color DiplomacyDonateTitle = Green;
    Color DiplomacyDonate = DiplomacyProposeTreaty;

    Color GalaxyTabActive(0xfcb44eff);
    Color GalaxyTabInactive(0xff9600ff);
    Color GalaxyTabSeparator(0x8c642bff);

    uint8 ResourceDisplayBottomAlpha = 0x10;
    Color GlobalBarDeficit = Red;
    Color GlobalBarSemiDeficit = Orange;
    Color GlobalBarBudgetCycleEarly = Money.interpolate(Red, 0.3);
    Color GlobalBarBudgetCycleLate = Money.interpolate(Red, 0.6);
    Color GlobalBarUpcomingDeficit(0xbb0000ff);
    Color GlobalBarDefenseButton; // Use the default for GuiButton. Whatever the hell that is.

    Color HomeTabGalaxy(0xff9600ff);
    Color HomeTabResearch(0xd482ffff);
    Color HomeTabDesigns(0x009cffff);
    Color HomeTabDiplomacy(0x37ff00ff);
    Color HomeTabPlanets(0xccff00ff);
    Color HomeTabWiki(0xff0077ff);

    Color InfluenceHistoryTitle(0x00bffeff);
    Color InfluenceHistoryActive(0x74fc4eff);
    Color InfluenceHistoryInactive(0x37ff00ff);
    Color InfluenceHistorySeparator(0x408c2bff);

    Color InfluenceVoteOfferForTitle = Green;
    Color InfluenceVoteOfferFor = DiplomacyProposeTreaty;
    Color InfluenceVoteOfferAgainstTitle = Red;
    Color InfluenceVoteOfferAgainst(0xffaaaaff);
    Color InfluenceVoteClaimFor = Green;
    Color InfluenceVoteClaimAgainst = Red;

    Color InfluenceVoteAgainstBG = VoteAgainstBG;
    Color InfluenceVoteAgainstFG = VoteAgainstFG;
    Color InfluenceVoteForBG = VoteForBG;
    Color InfluenceVoteForFG = VoteForFG;
    Color InfluenceVoteYeaBox = Green;
    Color InfluenceVoteNayBox = Red;
    Color InfluenceVoteSenate(0xffffff80);
    Color InfluenceVoteLeft(0xffffff80);
    Color InfluenceVoteRight = InfluenceVoteLeft;
    Color InfluenceVoteOfferForButton(0x80ff80ff);
    Color InfluenceVoteOfferAgainstButton(0xff8080ff);
    Color InfluenceVoteCardsTitle(0x8ebc00ff);
    Color InfluenceVoteLogTitle(0x00c7feff);
    Color InfluenceVoteTotalFor = Green;
    Color InfluenceVoteTitleFor(0x7cff00ff);
    Color InfluenceVoteTimerFor = Green;
    Color InfluenceVoteTotalAgainst = Red;
    Color InfluenceVoteTitleAgainst(0xff7c00ff);
    Color InfluenceVoteActive = InfluenceHistoryActive;
    Color InfluenceVoteInactive = InfluenceHistoryInactive;
    Color InfluenceVoteSeparator = InfluenceHistorySeparator;
    Color InfluenceVoteDelegationFor = Green;
    Color InfluenceVoteDelegationPreviousFor(0x88ff88ff);
    Color InfluenceVoteDelegationPreviousAgainst(0xff8888ff);
    Color InfluenceVoteDelegationTitle(0x00c7feff);
    Color InfluenceVoteDelegationPetitionerTitle = Green;

    Color PlanetsTabDecayingPrimary = Red;
    Color PlanetsTabDecayingSecondary = Orange;
    Color PlanetsTabDeficit = Red;
    Color PlanetsTabProfit = Green;
    int PlanetsTabProdTotalWidth(const int& width, const int& tot) {
        return min(width, tot * 40);
    }
    int PlanetsTabProdIconHeight = 16;
    vec2i PlanetsTabProdItemX(24, 0);
    vec2i PlanetsTabProdItemY(24);
    double PlanetsTabProdItemAlign = 0.5;
    Color PlanetsTabTilesGreat = Green;
    Color PlanetsTabTotalGood = Green;
    Color PlanetsTabTotalBad = Red;
    Color PlanetsTabTotalSecondary = Orange;

    Color PlanetsTabActive(0xdafc4eff);
    Color PlanetsTabInactive(0xccff00ff);
    Color PlanetsTabSeparator(0x798c2bff);

    FontType ResearchTabUnlockWithoutStudy = FT_Medium;
    Color ResearchTabBeam(0xadccc9ff);
    Color ResearchTabHeraldsBase(const Color& nodeTypeColor) {
        return nodeTypeColor;
    }
    Color ResearchTabHeraldsBaseUnlocked = colors::Black;
    double ResearchTabHeraldsBaseBoughtInterpolator = 0.75;
    Color ResearchTabHeraldsBaseHighlight(0xaaaaaaff);
    double ResearchTabHeraldsBaseHighlightInterpolator = 0.35;
    Color ResearchTabHeraldsBaseLockedIcon(0x555555ff);
    Color ResearchTabHeraldsBaseLocked(const Color& baseColor) {
        return baseColor.interpolate(Color(0x333333ff), 0.95);
    }
    double ResearchTabSelectedPadding = -0.08;
    Color ResearchTabHoveredColor(const Color& baseColor, const Color& nodeTypeColor) {
        return nodeTypeColor;
    }
    FontType ResearchTabNodeName = FT_Subtitle;
    Color ResearchTabActive(0xd482ffff);
    Color ResearchTabInactive(0xa800ffff);
    Color ResearchTabSeparator(0x75488dff);

    Color SystemTabActive = GalaxyTabActive;
    Color SystemTabInactive = GalaxyTabInactive;
    Color SystemTabSeparator = GalaxyTabSeparator;

    Color WikiTabTitle(0xff83bcff);
    Color WikiTabActive = WikiTabTitle;
    Color WikiTabInactive(0xff0077ff);
    Color WikiTabSeparator(0x8d4969ff);

    Color MultiplayerGamesTitle = Green;
    Color MultiplayerOptionsTitle(0xd0ffefff);
    Color MultiplayerHostTitle = MultiplayerOptionsTitle;
    Color MultiplayerQueueAccept(0x88ff88ff);
    Color MultiplayerQueueReject(0xff8888ff);
    Color MultiplayerTransferProgress = Orange;
    Color MultiplayerVersionMismatch = Red;
    Color MultiplayerModMismatch = Red;

    Color LobbyEmpiresTitle(0x00ffe9ff);
    Color LobbyReset(0xff8080ff);
    Color LobbyNotReady = Orange;
    Color LobbyAllReady = Green;
    Color LobbyReady = LobbyAllReady;
    Color LobbyCustomizeTitle(0xff8000ff);
    Color LobbyRaceNoAI(0xaa3030ff);
    vec2i LobbyShipsetChooserSize(160, 70);
    Color LobbyRaceConfirm(0x00c0ffff);
    Color LobbyRemovePlayer = Red;
    vec2i LobbyOtherShipsetChooserSize(150, 70); // I have no idea, either...
    Alignment LobbyTraitDescriptionAlignment(Left+124, Top+34, Right-168, Bottom-8);
    Color LobbyTraitGives = Green;
    Color LobbyTraitCosts = Red;
    Color LobbyTraitConflicts = Red;
    Color LobbyTraitsTitle = LobbyCustomizeTitle;
    Color LobbyTraitsPositive = Green;
    Color LobbyTraitsNegative = Red;
    Color LobbyTraitsAcceptable = Green;
    Color LobbyTraitsUnacceptable = Red;
    Color LobbyRemoveGalaxy = Red;

    Color DialogTitleColor(0x00bffeff);
    Color DialogDefaultTitleColor = DialogTitleColor;
    vec2i DialogTitleBoxSize(const int& width) {
        return vec2i(width-3, 26);
    }

    Color QuestionDialogYes = Green;
    Color QuestionDialogNo = Red;
    
    recti AccordionButtonSize(0, 0, 100, 29);
    double AccordionButtonAlign = 0.0;

    int ContextMenuItemHeight = 28;

    vec2i ListTextIconSize(const Sprite& icon) {
        return icon.size;
    }
    int ListTextOffsetHorizontal(const vec2i& iconSize) {
        return iconSize.width + 8;
    }
    int ListboxDefaultPaddingHorizontal = 6;
    int ListboxDefaultPaddingVertical = 5;
#section all
}

void preInit() { // We want to set the default skin before any other skins get to init.
    skins.set("Default", @activeSkin);
}

void postInit() { // We don't want to read the skin list until all the skins have had a chance to init.
    skins.get(settings::sSkinName, @activeSkin);
    if(activeSkin is null)
        skins.get("Default", @activeSkin);
}