double getMassFor(Ship& ship) {
	return getMassFor(ship.blueprint.design, ship.owner);
}

double getMassFor(const Design@ dsg, Empire@ emp) {
	double mass = dsg.total(HV_Mass);
	if(emp !is null) {
        mass += dsg.total(HV_SupportCapacityMass) * max(emp.EmpireSupportCapacityMassFactor - 1.0, 0.0);
        mass += dsg.total(HV_RepairMass) * max(emp.EmpireRepairMassFactor - 1.0, 0.0);
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

float getRepairFor(Ship& ship) {
    float repair = ship.blueprint.getEfficiencySum(SV_Repair);
    if(ship.owner !is null)
        repair *= ship.owner.EmpireRepairFactor;
    return repair;
}

float getRepairCostFor(Ship& ship) {
    float repairCost = ship.blueprint.getEfficiencySum(SV_RepairSupplyCost);
    if(ship.owner !is null)
        repairCost *= ship.owner.EmpireRepairFactor;
    return repairCost;
}

float getRepairFor(const Design@ dsg, Empire@ emp) {
    float repair = dsg.total(SV_Repair);
    if(emp !is null)
        repair *= emp.EmpireRepairFactor;
    return repair;
}

float getRepairCostFor(const Design@ dsg, Empire@ emp) {
    float repairCost = dsg.total(SV_RepairSupplyCost);
    if(emp !is null)
        repairCost *= emp.EmpireRepairFactor;
    return repairCost;
}

float getSupplyDrainFor(const Design@ dsg, Empire@ emp) {
    return dsg.total(SV_SupplyDrain) - dsg.total(SV_RepairSupplyCost) + getRepairCostFor(dsg, emp);
}