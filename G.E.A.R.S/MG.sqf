///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_autoRiflemen","_autoSpecialised"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Machine Gun

_autoRiflemen = [
//The slots that can use the weapons
"B_Officer_F",
"B_soldier_AR_F",
"B_Patrol_Soldier_AR_F",
"B_Patrol_Soldier_AR_F",
"B_HeavyGunner_F",
"B_Patrol_HeavyGunner_F"
];

_autoSpecialised = [
// The Weapons
"arifle_MX_SW_F",
"arifle_MX_SW_Black_F",
"LMG_Mk200_F",
"arifle_SPAR_02_blk_F",
"arifle_SPAR_02_khk_F",
"arifle_SPAR_02_snd_F",
"LMG_03_F",
"MMG_02_black_F",
"MMG_02_camo_F",
"MMG_02_sand_F",
"MMG_01_tan_F",
"MMG_01_hex_F",
"rhs_weap_m249",
"rhs_weap_m249_pip_L",
"rhs_weap_m249_pip_L_para",
"rhs_weap_m249_pip_L_vfg",
"rhs_weap_m249_pip_S",
"rhs_weap_m249_pip_S_para",
"rhs_weap_m249_pip_S_vfg",
"rhs_weap_m249_pip",
"rhs_weap_m240B",
"rhs_weap_m240B_CAP",
"rhs_weap_m240G",
"rhs_weap_pkm",
"rhs_weap_pkp"
];

_scope = [
"rhsusf_acc_ACOG_MDO"
];

_ammo = [
// The ammo for those weapons
"100Rnd_65x39_caseless_mag_Tracer",
"150Rnd_762x54_Box",
"200Rnd_65x39_cased_Box",
"150Rnd_93x64_Mag",
"130Rnd_338_Mag",
"150Rnd_556x45_Drum_Mag_F",
"200Rnd_556x45_Box_F",
"rhsusf_50Rnd_762x51",
"rhsusf_50Rnd_762x51_m61_ap",
"rhsusf_50Rnd_762x51_m62_tracer",
"rhsusf_50Rnd_762x51_m80a1epr",
"rhsusf_50Rnd_762x51_m82_blank",
"rhsusf_100Rnd_762x51",
"rhsusf_100Rnd_762x51_m61_ap",
"rhsusf_100Rnd_762x51_m62_tracer",
"rhsusf_100Rnd_762x51_m80a1epr",
"rhsusf_100Rnd_762x51_m82_blank",
"rhsusf_50Rnd_762x51_m993",
"rhsusf_100Rnd_762x51_m993",
"rhsusf_100Rnd_556x45_M855_soft_pouch",
"rhsusf_200Rnd_556x45_M855_soft_pouch",
"rhsusf_100Rnd_556x45_soft_pouch",
"rhsusf_200Rnd_556x45_soft_pouch",
"rhsusf_100Rnd_556x45_M200_soft_pouch",
"rhs_200rnd_556x45_M_SAW",
"rhs_200rnd_556x45_B_SAW",
"rhs_200rnd_556x45_T_SAW",
"rhs_100Rnd_762x54mmR",
"rhs_100Rnd_762x54mmR_green",
"rhs_100Rnd_762x54mmR_7N13",
"rhs_100Rnd_762x54mmR_7N26",
"rhs_100Rnd_762x54mmR_7BZ3"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
while {_safeZone distance player < _dis} do {
if (({_x in (weapons player)} count _autoSpecialised) > 0) then {
if (({player isKindOf _x} count _autoRiflemen) < 1) then {
{player removeWeapon _x;} count _autoSpecialised;
player addWeapon "rhs_weap_m4_carryhandle"; //Weapon it is gonna get replaced with
player addPrimaryWeaponItem "30Rnd_556x45_Stanag"; //Mag for that weapon
if (({_x in (uniformItems player)} count _ammo) > 0) then {
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
};
if (({_x in (vestItems player)} count _ammo) > 0) then {
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
};
if (({_x in (backpackItems player)} count _ammo) > 0) then {
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
{player removeItem _x;} count _ammo;
};
titleText ["That gun is a little heavy don't you think?", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
sleep 10;
};
if (({_x in (primaryWeaponItems player)} count _scope) > 0) then {
if (({player isKindOf _x} count _autoRiflemen) < 1) then {
{player removePrimaryWeaponItem  _x;} count _scope;
player addPrimaryWeaponItem "optic_Hamr"; //Scope it is gonna get replaced with
titleText ["That only works with MGs!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
sleep 10;
};
};
sleep 30;
};