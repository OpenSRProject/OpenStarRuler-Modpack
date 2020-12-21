// BEGIN NON-MIT CODE - SOI (AI)
from orbitals import OrbitalModule;

//Event callback

funcdef void EventHandler(ref& sender, EventArgs& args);

//Event interfaces

interface IOwnedSystemEvents {
	void onOwnedSystemAdded(ref& sender, EventArgs& args);
	void onOwnedSystemRemoved(ref& sender, EventArgs& args);
};

interface IBorderSystemEvents {
	void onBorderSystemAdded(ref& sender, EventArgs& args);
	void onBorderSystemRemoved(ref& sender, EventArgs& args);
};

interface IOutsideBorderSystemEvents {
	void onOutsideBorderSystemAdded(ref& sender, EventArgs& args);
	void onOutsideBorderSystemRemoved(ref& sender, EventArgs& args);
};

interface IPlanetEvents {
	void onPlanetAdded(ref& sender, EventArgs& args);
	void onPlanetRemoved(ref& sender, EventArgs& args);
};

interface ITradeRouteEvents {
  void onTradeRouteNeeded(ref& sender, EventArgs& args);
};

interface IOrbitalRequestEvents {
	void onOrbitalRequested(ref& sender, EventArgs& args);
};

// Generic type for event arguments

class EventArgs {
	//This is used to hold instances that cannot be explicitly typed, because of circular imports for example
	ref@ bag;
  
	EventArgs() { }
	
	EventArgs(ref@ bag) {
		@this.bag = bag;
	}
};

// Specialized event arguments

class TradeRouteNeededEventArgs : EventArgs {
	Territory@ territoryA;
	Territory@ territoryB;
	
	TradeRouteNeededEventArgs(Territory@ territoryA, Territory@ territoryB) {
			@this.territoryA = territoryA;
			@this.territoryB = territoryB;
	}
};

class OrbitalRequestedEventArgs : EventArgs {
	Region@ region;
	const OrbitalModule@ module;
	double priority;
	double expires;
	uint moneyType;
	
	OrbitalRequestedEventArgs(Region@ region, const OrbitalModule@ module, double priority, double expires, uint moneyType) {
		@this.region = region;
		@this.module = module;
		this.priority = priority;
		this.expires = expires;
		this.moneyType = moneyType;
	}
};
// END NON-MIT CODE