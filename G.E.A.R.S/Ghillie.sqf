///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
///////////////////////////////By Indianawinny and PREACHr/////////////////////////////////

private ["_safeZone","_dis","_uniformAllowed","_uniformRestricted"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Uniforms

_uniformAllowed = [
//The slots that can use the uniforms
"B_Officer_F",
"B_recon_TL_F",
"B_spotter_F",
"B_sniper_F"
];

_uniformRestricted = [
// The Uniforms
"AOR2_Ghillie_1",
"AOR2_Ghillie_2",
"MC_Ghillie_1",
"MC_Ghillie_2",
"U_B_FullGhillie_ard", 
"U_B_T_FullGhillie_tna_F", 
"U_B_FullGhillie_lsh", 
"U_B_FullGhillie_sard"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {TRUE} do {
while {_safeZone distance player < _dis} do {
if(({player isKindOf _x} count _uniformAllowed) < 1) then {
if((_uniformRestricted find (uniform player)) >= 0) then {
removeUniform player;
player addUniform "MC_Camo"; //Uniform it is gonna get replaced with
titleText ["That's sniper gear!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};