///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////


private ["_safeZone","_dis","_missileSoldiers","_missileSpecialised"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Anti-Tank Launchers

_missileSoldiers = [
//The slots that can use the weapons
"B_Officer_F",
"B_soldier_AT_F",
"B_Patrol_Soldier_AT_F",
"B_soldier_AA_F",
"B_soldier_LAT_F"
];

_missileSpecialised = [
// The Weapons
"launch_RPG32_F",
"launch_RPG32_ghex_F",
"launch_RPG32_NATO",
"launch_RPG7_F",
"launch_I_Titan_F",
"launch_O_Titan_ghex_F",
"launch_O_Titan_F",
"launch_B_Titan_F",
"launch_B_Titan_tna_F",
"launch_O_Titan_short_F",
"launch_O_Titan_short_ghex_F",
"launch_I_Titan_short_F",
"launch_B_Titan_short_F",
"launch_B_Titan_short_tna_F",
"launch_O_Titan_short_ghex_F",
"rhs_weap_fim92",
"rhs_weap_fgm148",
"rhs_weap_smaw",
"rhs_weap_smaw_green",
"rhs_weap_rpg7",
"rhs_weap_maaws"
];

_ammo = [
// The ammo for those weapons
"RPG32_F",
"RPG32_HE_F",
"RPG7_F",
"Titan_AA",
"Titan_AT",
"rhs_mag_9k38_rocket",
"rhs_fgm148_magazine_AT",
"rhs_fim92_mag",
"rhs_m136_mag",
"rhs_m136_hedp_mag",
"rhs_m136_hp_mag",
"rhs_m72a7_mag",
"rhs_rpg26_mag",
"rhs_mag_maaws_HEAT",
"rhs_mag_maaws_HEDP",
"rhs_mag_maaws_HE",
"rhs_mag_smaw_HEAA",
"rhs_mag_smaw_HEDP",
"rhs_mag_smaw_SR",
"rhs_rpg7_PG7V_mag",
"rhs_rpg7_PG7VL_mag",
"rhs_rpg7_PG7VR_mag",
"rhs_rpg7_OG7V_mag",
"rhs_rpg7_TBG7V_mag",
"rhs_rpg7_type69_airburst_mag",
"rhs_rshg2_mag"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
while {_safeZone distance player < _dis} do {
if (({_x in (weapons player)} count _missileSpecialised) > 0) then {
if (({player isKindOf _x} count _missileSoldiers) < 1) then {
{player removeWeapon _x;} count _missileSpecialised;
if (({_x in (backpackItems player)} count _ammo) > 0) then {
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
};
titleText ["What's backblast?", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};