// Events
// ------
// Notifies subscribed components of events raised by other components.
//
import empire_ai.weasel.WeaselAI;

import ai.events;

final class Events : AIComponent {
	//Event callbacks

	private array<EventHandler@> _onOwnedSystemAdded;
	private array<EventHandler@> _onOwnedSystemRemoved;
	private array<EventHandler@> _onBorderSystemAdded;
	private array<EventHandler@> _onBorderSystemRemoved;
	private array<EventHandler@> _onOutsideBorderSystemAdded;
	private array<EventHandler@> _onOutsideBorderSystemRemoved;
	private array<EventHandler@> _onPlanetAdded;
	private array<EventHandler@> _onPlanetRemoved;
	private array<EventHandler@> _onTradeRouteNeeded;
	private array<EventHandler@> _onOrbitalRequested;

	void create() {
	}

	//Event delegate registration

	Events@ opAddAssign(IOwnedSystemEvents& events) {
		_onOwnedSystemAdded.insertLast(EventHandler(events.onOwnedSystemAdded));
		_onOwnedSystemRemoved.insertLast(EventHandler(events.onOwnedSystemRemoved));
		return this;
	}

	Events@ opAddAssign(IBorderSystemEvents& events) {
		_onBorderSystemAdded.insertLast(EventHandler(events.onBorderSystemAdded));
		_onBorderSystemRemoved.insertLast(EventHandler(events.onBorderSystemRemoved));
		return this;
	}

	Events@ opAddAssign(IOutsideBorderSystemEvents& events) {
		_onOutsideBorderSystemAdded.insertLast(EventHandler(events.onOutsideBorderSystemAdded));
		_onOutsideBorderSystemRemoved.insertLast(EventHandler(events.onOutsideBorderSystemRemoved));
		return this;
	}

	Events@ opAddAssign(IPlanetEvents& events) {
		_onPlanetAdded.insertLast(EventHandler(events.onPlanetAdded));
		_onPlanetRemoved.insertLast(EventHandler(events.onPlanetRemoved));
		return this;
	}

	Events@ opAddAssign(ITradeRouteEvents& events) {
		_onTradeRouteNeeded.insertLast(EventHandler(events.onTradeRouteNeeded));
		return this;
	}

	Events@ opAddAssign(IOrbitalRequestEvents& events) {
		_onOrbitalRequested.insertLast(EventHandler(events.onOrbitalRequested));
		return this;
	}

	//Event notifications

	private void raiseEvent(array<EventHandler@>& subscribed, ref@ sender, EventArgs& args) {
		for (uint i = 0, cnt = subscribed.length; i < cnt; ++i)
			subscribed[i](sender, args);
	}

	void notifyOwnedSystemAdded(ref@ sender, EventArgs& args) {
		raiseEvent(_onOwnedSystemAdded, sender, args);
	}

	void notifyOwnedSystemRemoved(ref@ sender, EventArgs& args) {
		raiseEvent(_onOwnedSystemRemoved, sender, args);
	}

	void notifyBorderSystemAdded(ref@ sender, EventArgs& args) {
		raiseEvent(_onBorderSystemAdded, sender, args);
	}

	void notifyBorderSystemRemoved(ref@ sender, EventArgs& args) {
		raiseEvent(_onBorderSystemRemoved, sender, args);
	}

	void notifyOutsideBorderSystemAdded(ref@ sender, EventArgs& args) {
		raiseEvent(_onOutsideBorderSystemAdded, sender, args);
	}

	void notifyOutsideBorderSystemRemoved(ref@ sender, EventArgs& args) {
		raiseEvent(_onOutsideBorderSystemRemoved, sender, args);
	}

	void notifyPlanetAdded(ref@ sender, EventArgs& args) {
		raiseEvent(_onPlanetAdded, sender, args);
	}

	void notifyPlanetRemoved(ref@ sender, EventArgs& args) {
		raiseEvent(_onPlanetRemoved, sender, args);
	}

	void notifyTradeRouteNeeded(ref@ sender, EventArgs& args) {
		raiseEvent(_onTradeRouteNeeded, sender, args);
	}

	void notifyOrbitalRequested(ref@ sender, EventArgs& args) {
		raiseEvent(_onOrbitalRequested, sender, args);
	}

	void save(SaveFile& file) {
	}

	void load(SaveFile& file) {
	}
};

AIComponent@ createEvents() {
	return Events();
}
