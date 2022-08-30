import hooks;
import hook_globals;
import generic_effects;
import repeat_hooks;
from generic_effects import GenericEffect;
import statuses;

class RemoveStatusInstance : GenericEffect {
	Document doc("Remove a single instance of a status of a particular type that is on this object at any point.");
	Argument status(AT_Status, doc="Type of status effect to create.");

#section server
	void enable(Object& obj, any@ data) const override {
		check(obj);
	}

	void check(Object& obj) const {
		if(!obj.hasStatuses)
			return;
		obj.removeStatusInstanceOfType(status.integer);
	}

	void tick(Object& obj, any@ data, double tick) const override {
		check(obj);
	}
#section all
};
