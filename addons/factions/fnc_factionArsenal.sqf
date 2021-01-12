#include "script_component.hpp"

params ["_box", "_faction"];

["AmmoboxInit", _box] spawn BIS_fnc_arsenal;

private _factionData = [GVARMAIN(FactionData), _faction] call CBA_fnc_hashGet;

private _weapons = [_factionData, "Weapons"] call CBA_fnc_hashGet;
private _magazines = [_factionData, "Magazines"] call CBA_fnc_hashGet;
private _items = [_factionData, "Items"] call CBA_fnc_hashGet;
private _backpacks = [_factionData, "Backpacks"] call CBA_fnc_hashGet;
private _uniforms = [_factionData, "Uniforms"] call CBA_fnc_hashGet;

[_box, _backpacks, true] call BIS_fnc_addVirtualBackpackCargo;
[_box, _items, true] call BIS_fnc_addVirtualItemCargo;
[_box, _magazines, true] call BIS_fnc_addVirtualMagazineCargo;
[_box, _uniforms, true] call BIS_fnc_addVirtualItemCargo;
[_box, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;

_box;
