///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_muzzleAllowed","_specialisedMuzzle"];
 
_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Supressors

_muzzleAllowed = [
//The slots that can use the scopes
"B_Officer_F",
"B_sniper_F",
"B_spotter_F",
"B_recon_TL_F",
"B_ghillie_ard_F",
"B_ghillie_lsh_F",
"B_ghillie_sard_F"
];

_specialisedMuzzle = [
// The Supressors
"muzzle_snds_338_black",
"muzzle_snds_338_green",
"muzzle_snds_338_sand",
"muzzle_snds_B",
"muzzle_snds_H_khk_F",
"muzzle_snds_H_snd_F",
"muzzle_snds_H",
"muzzle_snds_65_TI_blk_F",
"muzzle_snds_65_TI_ghex_F",
"muzzle_snds_65_TI_hex_F",
"muzzle_snds_L",
"muzzle_snds_B_khk_F",
"muzzle_snds_B_snd_F",
"muzzle_snds_acp",
"muzzle_snds_M",
"muzzle_snds_m_khk_F",
"muzzle_snds_m_snd_F",
"muzzle_snds_H_MG_blk_F",
"muzzle_snds_H_MG",
"muzzle_snds_H_MG_khk_F",
"muzzle_snds_338_black",
"muzzle_snds_338_green",
"muzzle_snds_338_sand",
"SMA_supp1Bwht_556",
"SMA_supp1BOD_556",
"SMA_supp1BT_556",
"SMA_supp1TT_556",
"SMA_supp1TB_556",
"SMA_supp1TW_556",
"SMA_supp1TOD_556",
"SMA_supp1b_556",
"SMA_supp1tan_556",
"SMA_rotex_blk",
"SMA_rotex_gry",
"SMA_rotex_tan",
"SMA_Silencer_556",
"SMA_Silencer_556_Bronze",
"SMA_Silencer_556_Silver",
"SMA_supp2smaB_556",
"SMA_supp2smaT_556",
"SMA_supp_762",
"SMA_supptan_762",
"sma_gemtech_one_blk",
"SMA_supp2BW_556",
"SMA_supp2BOD_556",
"SMA_supp2BT_556",
"SMA_supp2T_556",
"SMA_supp2TB_556",
"SMA_supp2TWH_556",
"SMA_supp2TOD_556",
"SMA_supp2b_556",
"SMA_supp2btan_556",
"sma_gemtech_one_blk",
"sma_gemtech_one_des",
"sma_gemtech_one_wdl",
"SMA_supp1BB_556",
"rhsusf_acc_M2010S",
"rhsusf_acc_SR25S",
"rhsusf_acc_nt4_black",
"rhsusf_acc_nt4_tan",
"rhsusf_acc_rotex5_grey",
"rhsusf_acc_rotex5_tan",
"rhsusf_acc_rotex_mp7_aor1",
"rhsusf_acc_rotex_mp7",
"rhsusf_acc_rotex_mp7_desert",
"rhsusf_acc_rotex_mp7_winter",
"rhsusf_acc_SR25S_d",
"rhsusf_acc_SR25S_wd",
"rhsusf_acc_omega9k"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
while {_safeZone distance player < _dis} do {
if (({_x in (primaryWeaponItems player)} count _specialisedMuzzle) > 0) then {
if (({player isKindOf _x} count _muzzleAllowed) < 1) then {
{player removePrimaryWeaponItem  _x;} count _specialisedMuzzle;
titleText ["This is not a sneaky beaky mission!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (handgunItems player)} count _specialisedMuzzle) > 0) then {
if (({player isKindOf _x} count _muzzleAllowed) < 1) then {
{player removeHandgunItem  _x;} count _specialisedMuzzle;
titleText ["This is not a sneaky beaky mission!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (backpackItems player)} count _specialisedMuzzle) > 0) then {
if (({player isKindOf _x} count _muzzleAllowed) < 1) then {
{player removeItem _x;} count _specialisedMuzzle;
titleText ["This is not a sneaky beaky mission!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (vestItems player)} count _specialisedMuzzle) > 0) then {
if (({player isKindOf _x} count _muzzleAllowed) < 1) then {
{player removeItem _x;} count _specialisedMuzzle;
titleText ["This is not a sneaky beaky mission!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (uniformItems player)} count _specialisedMuzzle) > 0) then {
if (({player isKindOf _x} count _muzzleAllowed) < 1) then {
{player removeItem _x;} count _specialisedMuzzle;
titleText ["This is not a sneaky beaky mission!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};