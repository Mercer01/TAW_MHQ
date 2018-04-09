///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_missileSoldiers","_missileSpecialised"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Disposables

_missileSoldiers = [
//The slots that can use the weapons
"B_Officer_F",
"B_Soldier_F",
"B_Soldier_SL_F",
"B_Soldier_lite_F",
"B_Soldier_TL_F",
"B_soldier_AT_F",
"B_soldier_AA_F",
"B_soldier_LAT_F"
];

_missileSpecialised = [
// The Weapons
"rhs_weap_M136",
"rhs_weap_M136_hedp",
"rhs_weap_M136_hp",
"rhs_weap_m72a7",
"launch_NLAW_F"
];

_ammo = [
// The ammo for those weapons
"rhs_m136_mag",
"rhs_m136_hedp_mag",
"rhs_m136_hp_mag",
"rhs_m72a7_mag",
"rhs_rpg26_mag",
"rhs_rshg2_mag"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
while {_safeZone distance player < _dis} do {
if (({_x in (weapons player)} count _missileSpecialised) > 0) then {
if (({player isKindOf _x} count _missileSoldiers) < 1) then {
{player removeWeapon _x;} count _missileSpecialised;
if (({_x in (uniformItems player)} count _ammo) > 0) then {
{player removeItem _x;} count _ammo;
};
if (({_x in (vestItems player)} count _ammo) > 0) then {
{player removeItem _x;} count _ammo;
};
if (({_x in (backpackItems player)} count _ammo) > 0) then {
{player removeItem _x;} count _ammo;
};
titleText ["It fell of your shoulder!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};