from constructions import ConstructionType;
from buildings import BuildingType;
from orbitals import OrbitalModule;

interface IConstruction {
  int id { get const; set; }
  bool started { get const; }
  bool completed { get const; set; }
};

interface IGenericConstruction : IConstruction {
  const ConstructionType@ construction { get const; }
}

interface IBuildingConstruction : IConstruction {
  const BuildingType@ building { get const; }
}

interface IOrbitalConstruction : IConstruction {
  const OrbitalModule@ module { get const; }
}

interface IFlagshipConstruction : IConstruction {
  const Design@ design { get const; }
}

interface IStationConstruction : IConstruction {
  const Design@ design { get const; }
}
