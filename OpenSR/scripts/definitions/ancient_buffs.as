double getMassFor(Ship& ship) {
	return getMassFor(ship.blueprint.design, ship.owner);
}

double getMassFor(const Design@ dsg, Empire@ emp) {
	double mass = dsg.total(HV_Mass);
	if(emp !is null)
		mass *= emp.EmpireMassFactor;
	return mass;
}