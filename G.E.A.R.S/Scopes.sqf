///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_opticsAllowed","_specialisedOptics"];
 
_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Scopes

_opticsAllowed = [
//The slots that can use the scopes
"B_Officer_F",
"B_soldier_M_F",
"B_Patrol_soldier_M_F",
"B_Sharpshooter_F",
"B_Recon_Sharpshooter_F",
"B_sniper_F",
"B_recon_TL_F",
"B_spotter_F",
"B_ghillie_ard_F",
"B_ghillie_lsh_F",
"B_ghillie_sard_F"
];

_specialisedOptics = [
// The Scopes
"optic_DMS",
"optic_LRPS",
"optic_NVS",
"optic_AMS",
"optic_AMS_khk",
"optic_AMS_snd",
"optic_KHS_blk",
"optic_KHS_hex",
"optic_KHS_old",
"optic_KHS_tan",
"optic_DMS_ghex_F",
"optic_LRPS_ghex_F",
"optic_LRPS_tna_F",
"optic_SOS_khk_F",
"optic_SOS",
"ACE_optic_LRPS_2D",
"ACE_optic_LRPS_PIP",
"ACE_optic_SOS_2D",
"ACE_optic_SOS_PIP",
"rhs_acc_dh520x56",
"rhsusf_acc_M8541",
"rhsusf_acc_M8541_low",
"rhsusf_acc_M8541_low_d",
"rhsusf_acc_M8541_low_wd",
"rhsusf_acc_premier_low",
"rhsusf_acc_premier_anpvs27",
"rhsusf_acc_premier",
"rhsusf_acc_LEUPOLDMK4",
"rhsusf_acc_LEUPOLDMK4_2",
"rhsusf_acc_LEUPOLDMK4_2_d",
"RKSL_optic_PMII_312",
"RKSL_optic_PMII_312_des",
"RKSL_optic_PMII_312_wdl",
"RKSL_optic_PMII_312_sunshade",
"RKSL_optic_PMII_312_sunshade_des",
"RKSL_optic_PMII_312_sunshade_wdl",
"RKSL_optic_PMII_525",
"RKSL_optic_PMII_525_des",
"RKSL_optic_PMII_525_wdl"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
while {_safeZone distance player < _dis} do {
if (({_x in (primaryWeaponItems player)} count _specialisedOptics) > 0) then {
if (({player isKindOf _x} count _opticsAllowed) < 1) then {
{player removePrimaryWeaponItem  _x;} count _specialisedOptics;
player addPrimaryWeaponItem "optic_Hamr"; //Scope it is gonna get replaced with
titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (backpackItems player)} count _specialisedOptics) > 0) then {
if (({player isKindOf _x} count _opticsAllowed) < 1) then {
{player removeItem _x;} count _specialisedOptics;
player addItemToBackpack "optic_Hamr"; //Scope it is gonna get replaced with
titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (vestItems player)} count _specialisedOptics) > 0) then {
if (({player isKindOf _x} count _opticsAllowed) < 1) then {
{player removeItem _x;} count _specialisedOptics;
player addItemToVest "optic_Hamr"; //Scope it is gonna get replaced with
titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (uniformItems player)} count _specialisedOptics) > 0) then {
if (({player isKindOf _x} count _opticsAllowed) < 1) then {
{player removeItem _x;} count _specialisedOptics;
player addItemToUniform "optic_Hamr"; //Scope it is gonna get replaced with
titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};