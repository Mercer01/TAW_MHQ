///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

private ["_safeZone","_dis","_ItemsAllowed","_restrictedItems"];

_safeZone = getMarkerPos "Base"; // The marker it uses to get the area around.
_dis = 200; // Area around the marker, in Meters.

//Rugged Tablet

_ItemsAllowed = [
//The slots that can use the tablet
"B_Officer_F",
"B_Survivor_F",
"B_Soldier_TL_F",
"B_Patrol_Soldier_TL_F",
"B_Soldier_SL_F",
"B_diver_TL_F",
"B_recon_TL_F",
"B_Pilot_F",
"B_Fighter_Pilot_F",
"B_Helipilot_F"
];

_restrictedItems = [
// The Tablet
"ItemcTab",
"ItemAndroid"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {true} do {
while {_safeZone distance player < _dis} do {
if (({_x in (assignedItems player)} count _restrictedItems) > 0) then {
if (({player isKindOf _x} count _ItemsAllowed) < 1) then {
{player unassignItem  _x; player removeItem  _x;} count _restrictedItems;
player linkItem "ItemMicroDAGR"; //The Item it is gonna get replaced with
titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (uniformItems player)} count _restrictedItems) > 0) then {
if (({player isKindOf _x} count _ItemsAllowed) < 1) then {
{player removeItem _x;} count _restrictedItems;
player addItemToUniform"ItemMicroDAGR"; //The Item it is gonna get replaced with
titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (vestItems player)} count _restrictedItems) > 0) then {
if (({player isKindOf _x} count _ItemsAllowed) < 1) then {
{player removeItem _x;} count _restrictedItems;
player addItemToVest "ItemMicroDAGR"; //The Item it is gonna get replaced with
titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
if (({_x in (backpackItems player)} count _restrictedItems) > 0) then {
if (({player isKindOf _x} count _ItemsAllowed) < 1) then {
{player removeItem _x;} count _restrictedItems;
player addItemToBackpack "ItemMicroDAGR"; //The Item it is gonna get replaced with
titleText ["Please hand that to someone who will find it more useful.", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
sleep 30;
};