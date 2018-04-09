///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_snipers","_sniperSpecialised"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Marksman Rifles

_snipers = [
//The slots that can use the weapons
"B_Officer_F",
"B_soldier_M_F",
"B_Patrol_soldier_M_F",
"B_Sharpshooter_F",
"B_sniper_F",
"B_spotter_F",
"B_recon_TL_F",
"B_ghillie_ard_F",
"B_ghillie_lsh_F",
"B_ghillie_sard_F"
];

_sniperSpecialised = [
// The Weapons
"srifle_LRR_F",
"srifle_LRR_camo_F",
"srifle_EBR_F",
"arifle_MXM_Black_F",
"arifle_MXM_F",
"srifle_DMR_06_camo_F",
"srifle_DMR_06_olive_F",
"srifle_DMR_02_camo_F",
"srifle_DMR_02_sniper_F",
"srifle_DMR_02_F",
"srifle_DMR_03_F",
"srifle_DMR_03_multicam_F",
"srifle_DMR_03_khaki_F",
"srifle_DMR_03_tan_F",
"srifle_DMR_03_woodland_F",
"arifle_SPAR_03_blk_F",
"arifle_SPAR_03_khk_F",
"arifle_SPAR_03_snd_F",
"srifle_LRR_tna_F",
"arifle_MXM_khk_F",
"srifle_DMR_05_blk_F",
"srifle_DMR_05_hex_F",
"srifle_DMR_05_tan_F",
"srifle_GM6_F",
"rhs_weap_m14ebrri",
"rhs_weap_XM2010",
"rhs_weap_XM2010_wd",
"rhs_weap_XM2010_d",
"rhs_weap_XM2010_sa",
"rhs_weap_m24sws",
"rhs_weap_m24sws_blk",
"rhs_weap_m24sws_ghillie",
"rhs_weap_m40a5",
"rhs_weap_m40a5_d",
"rhs_weap_m40a5_wd",
"rhs_weap_sr25",
"rhs_weap_sr25_d",
"rhs_weap_sr25_ec",
"rhs_weap_sr25_ec_d",
"rhs_weap_sr25_ec_wd",
"rhs_weap_sr25_wd",
"rhs_weap_t5000",
"rhs_weap_M107",
"rhs_weap_M107_d",
"rhs_weap_M107_w",
"rhs_weap_svdp",
"rhs_weap_svdp_npz",
"rhs_weap_svdp_wd",
"rhs_weap_svdp_wd_npz",
"rhs_weap_svds",
"rhs_weap_svds_npz",
"SMA_HK417",
"SMA_HK417vfg",
"SMA_HK417_16in",
"SMA_Mk17",
"SMA_Mk17_black",
"SMA_Mk17_Green",
"SMA_Mk17_EGLM",
"SMA_MK17_EGLM_black",
"SMA_MK17_EGLM_Green",
"SMA_Mk17_16",
"SMA_Mk17_16_black",
"SMA_Mk17_16_Green"
];

_ammo = [
// The ammo for those weapons
"5Rnd_127x108_Mag",
"5Rnd_127x108_APDS_Mag",
"7Rnd_408_Mag",
"10Rnd_93x64_DMR_05_Mag",
"10Rnd_338_Mag",
"20Rnd_762x51_Mag",
"ACE_5Rnd_127x99_Mag",
"ACE_5Rnd_127x99_API_Mag",
"ACE_5Rnd_127x99_AMAX_Mag",
"ACE_7Rnd_408_305gr_Mag",
"ACE_20Rnd_762x51_Mag_Tracer",
"ACE_20Rnd_762x51_Mag_Tracer_Dim",
"ACE_20Rnd_762x51_Mk316_Mod_0_Mag",
"ACE_20Rnd_762x51_M118LR_Mag",
"ACE_20Rnd_762x51_Mk319_Mod_0_Mag",
"ACE_20Rnd_762x51_M993_AP_Mag",
"ACE_20Rnd_762x51_Mag_SD",
"ACE_10Rnd_338_300gr_HPBT_Mag",
"ACE_10Rnd_338_API526_Mag",
"ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag",
"ACE_20Rnd_762x67_Mk248_Mod_1_Mag",
"ACE_20Rnd_762x67_Mk248_Mod_0_Mag",
"rhsusf_20Rnd_762x51_m118_special_Mag",
"rhsusf_20Rnd_762x51_m993_Mag",
"rhsusf_20Rnd_762x51_m62_Mag",
"rhsusf_mag_10Rnd_STD_50BMG_M33",
"rhsusf_mag_10Rnd_STD_50BMG_mk211",
"rhs_5Rnd_338lapua_t5000",
"rhs_10Rnd_762x54mmR_7N1"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
while {_safeZone distance player < _dis} do {
if (({_x in (weapons player)} count _sniperSpecialised) > 0) then {
if (({player isKindOf _x} count _snipers) < 1) then {
{player removeWeapon _x;} count _sniperSpecialised;
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
titleText ["Stop stealing from the marksmen!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};