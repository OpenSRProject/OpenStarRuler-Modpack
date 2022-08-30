import hooks;
import hook_globals;
import generic_effects;
import repeat_hooks;
from generic_effects import GenericEffect;
import statuses;
from statuses import StatusHook;

class IfFewerStatusStacks : IfHook {
	Document doc("Only applies the inner hook if the object has fewer status stacks than an amount.");
	Argument status(AT_Status, doc="Type of status effect to limit.");
	Argument amount(AT_Integer, doc="Minimum number of stacks to stop triggering inner hook at.");
	Argument hookID(AT_Hook, "planet_effects::GenericEffect");

	bool instantiate() override {
		if(!withHook(hookID.str))
			return false;
		return GenericEffect::instantiate();
	}

#section server
	bool condition(Object& obj) const override {
		if(!obj.hasStatuses)
			return false;
		int count = obj.getStatusStackCount(status.integer);
		return count < amount.integer;
	}
#section all
};

class IfMoreStatusStacks : IfHook {
	Document doc("Only applies the inner hook if the object has more status stacks than an amount.");
	Argument status(AT_Status, doc="Type of status effect to limit.");
	Argument amount(AT_Integer, doc="Maximum number of stacks to stop triggering inner hook at.");
	Argument hookID(AT_Hook, "planet_effects::GenericEffect");

	bool instantiate() override {
		if(!withHook(hookID.str))
			return false;
		return GenericEffect::instantiate();
	}

#section server
	bool condition(Object& obj) const override {
		if(!obj.hasStatuses)
			return false;
		int count = obj.getStatusStackCount(status.integer);
		return count > amount.integer;
	}
#section all
};

class RemoveIfMissingSubsystem : StatusHook {
	Document doc("Removes the status if the ship doesn't have any of the required subsystems anymore.");
	Argument tag(AT_Custom, doc="Subsystem tag identifying a required subsystem.");
	Argument allow_disabled(AT_Boolean, "False", doc="Whether to count destroyed or otherwise disabled subsystems as present.");

#section server
	bool onTick(Object& obj, Status@ status, any@ data, double time) override {
		if(!obj.isShip)
			return true;
		SubsystemTag sysTag = getSubsystemTag(tag.str);
		if(sysTag == -1)
			return true;
		Ship@ ship = cast<Ship>(obj);
		if(allow_disabled.boolean)
			return ship.blueprint.design.hasTag(sysTag);
		return ship.blueprint.hasTagActive(sysTag);
	}
#section all
}