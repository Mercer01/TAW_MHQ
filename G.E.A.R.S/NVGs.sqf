///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

//Thermal NVGs
[] spawn {
private ["_ItemsAllowed","_restrictedItems"];
_ItemsAllowed = [
//The slots that can use the NVGs
"B_Officer_F",
"B_Pilot_F",
"B_Fighter_Pilot_F",
"B_Helipilot_F"
];
_restrictedItems = [
// The NVGs
"NVGogglesB_blk_F",
"NVGogglesB_grn_F",
"NVGogglesB_gry_F"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {TRUE} do {
if (({_x in (assignedItems player)} count _restrictedItems) > 0) then {
if (({player isKindOf _x} count _ItemsAllowed) < 1) then {
{player unassignItem  _x; player removeItem  _x;} count _restrictedItems;
player addItem "NVGoggles"; //NVGs it is gonna get replaced with
player assignItem "NVGoggles"; //NVGs it is gonna get replaced with
titleText ["Too many buttons!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
};
sleep 10;
};
};