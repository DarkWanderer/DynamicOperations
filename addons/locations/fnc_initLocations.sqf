/* 
  Finds locations on map and sets relevant variables in mission namespace
*/

#include "script_component.hpp"

INFO("Started location detection");
private _radius = worldSize / (sqrt 2);
private _center = [worldSize/2, worldSize/2, 0];

GVAR(Hospitals) = nearestTerrainObjects [_center, ["HOSPITAL"], _radius, false, true];

// private _fences = nearestTerrainObjects [_center, ["WALL", "FENCE"], _radius, false, true];
private _houses = nearestTerrainObjects [_center, ["HOUSE"], _radius, false, true];
private _enterables = _houses select { _x call BIS_fnc_isBuildingEnterable; };
GVAR(EnterableBuildings) = _enterables;

/*
INFO("Initializing cluster detection");
private _input = _enterables joinString endl;

private _clusters = parseSimpleArray (["cluster", [_input]] call EFUNC(extension,callExtension));

{
	private _uuid = call EFUNC(extension,uuid);
	createMarker [_uuid, _x # 0];
	_uuid setMarkerSize [ _x # 1, _x # 2];
	_uuid setMarkerDir ( _x # 3 );
	_uuid setMarkerShape "RECTANGLE";
	_uuid setMarkerColor "ColorRed";
} forEach _clusters;
*/
INFO("Locations initialized");