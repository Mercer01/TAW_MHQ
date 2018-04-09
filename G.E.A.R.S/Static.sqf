///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_backpacksAllowed","_backpacksRestricted"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//AA Static backpack

_backpacksAllowed = [
//The slots that can use the statics
"B_Officer_F",
"B_Pilot_F",
"B_Fighter_Pilot_F",
"B_Helipilot_F"
];

_backpacksRestricted = [
//The Statics
"B_AA_01_weapon_F", 
"B_HMG_01_support_F"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while{TRUE} do {
while {_safeZone distance player < _dis} do {
if(({player isKindOf _x} count _backpacksAllowed) < 1) then {
if((_backpacksRestricted find (backpack player)) >= 0) then {
removeBackpack player;
player addBackpack "MC_Backpack_Kitbag"; //Backpack it is gonna get replaced with
titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};