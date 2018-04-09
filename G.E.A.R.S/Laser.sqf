///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_DesignatorsAllowed","_restrictedDesignators"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Laser Designators

_DesignatorsAllowed = [
//The slots that can use the designators
"B_Officer_F",
"B_Survivor_F",
"B_Soldier_TL_F",
"B_Patrol_Soldier_TL_F",
"B_Soldier_SL_F",
"B_diver_TL_F",
"B_spotter_F",
"B_recon_TL_F",
"B_Pilot_F",
"B_Fighter_Pilot_F",
"B_Helipilot_F"
];

_restrictedDesignators = [
// The Designators
"Laserdesignator_02_ghex_F",
"Laserdesignator_02",
"Laserdesignator_01_khk_F",
"Laserdesignator_03",
"Laserdesignator",
"Laserdesignator_02_ghex_F"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while{true} do {
while {_safeZone distance player < _dis} do {
if (({_x in (weapons player)} count _restrictedDesignators) > 0) then {
if (({player isKindOf _x} count _DesignatorsAllowed) < 1) then {
{player removeWeapon _x;} count _restrictedDesignators;
player addWeapon "binocular"; //Binocular it is gonna get replaced with
titleText ["Too many buttons!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (uniformItems player)} count _restrictedDesignators) > 0) then {
if (({player isKindOf _x} count _DesignatorsAllowed) < 1) then {
{player removeItem _x;} count _restrictedDesignators;
player addItemToUniform "binocular"; //Binocular it is gonna get replaced with
titleText ["Too many buttons!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (vestItems player)} count _restrictedDesignators) > 0) then {
if (({player isKindOf _x} count _DesignatorsAllowed) < 1) then {
{player removeItem _x;} count _restrictedDesignators;
player addItemToVest "binocular"; //Binocular it is gonna get replaced with
titleText ["Too many buttons!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (backpackItems player)} count _restrictedDesignators) > 0) then {
if (({player isKindOf _x} count _DesignatorsAllowed) < 1) then {
{player removeItem _x;} count _restrictedDesignators;
player addItemToBackpack "binocular"; //Binocular it is gonna get replaced with
titleText ["Too many buttons!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};
