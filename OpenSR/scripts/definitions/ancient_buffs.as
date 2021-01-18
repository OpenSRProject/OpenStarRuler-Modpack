double getMassFor(Ship& ship) {
	return getMassFor(ship.blueprint.design, ship.owner);
}

double getMassFor(const Design@ dsg, Empire@ emp) {
	double mass = dsg.total(HV_Mass);
	if(emp !is null) {
        mass += dsg.total(HV_SupportCapacityMass) * max(emp.EmpireSupportCapacityMassFactor - 1.0, 0.0);
		mass *= emp.EmpireMassFactor;
    }
	return mass;
}

int getSupportCommandFor(Ship& ship) {
    double command = ship.blueprint.getEfficiencySum(SV_SupportCapacity);
    if(ship.owner !is null)
        command *= ship.owner.EmpireSupportCapacityFactor;
    return floor(command);
}

int getSupportCommandFor(const Design@ dsg, Empire@ emp) {
    double command = dsg.total(SV_SupportCapacity);
    if(emp !is null)
        command *= emp.EmpireSupportCapacityFactor;
    return floor(command);
}