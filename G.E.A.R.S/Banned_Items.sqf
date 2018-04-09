///////////////////Gear, Equipment and Arsenal Restriction Script v1.2/////////////////////
/////////////////////////////////By Indianawinny///////////////////////////////////////////

//Banned Items

[] spawn {

_restrictedItems = [
// Well...the list of banned items, what do you expect? :P
"rhsusf_5Rnd_doomsday_Buck",
"rhsusf_8Rnd_doomsday_Buck",
"optic_Nightstalker",
"optic_tws",
"optic_tws_mg",
"rhsusf_acc_anpas13gv1",
"rhs_weap_m32",
"B_rhsusf_B_BACKPACK"
];

//////////////////////////////////DO NOT MODIFY BELOW////////////////////////////////////////////
while {TRUE} do {
if (({_x in (uniformItems player)} count _restrictedItems) > 0) then {
{player removeItem _x;} count _restrictedItems;
titleText ["That item is BANNED!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
if (({_x in (vestItems player)} count _restrictedItems) > 0) then {
{player removeItem _x;} count _restrictedItems;
titleText ["That item is BANNED!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
if (({_x in (backpackItems player)} count _restrictedItems) > 0) then {
{player removeItem _x;} count _restrictedItems;
titleText ["That item is BANNED!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
if (({_x in (weapons player)} count _restrictedItems) > 0) then {
{player removeWeapon _x;} count _restrictedItems; 
player addWeapon "rhs_weap_m4_carryhandle"; //Weapon it is gonna get replaced with
player addPrimaryWeaponItem "30Rnd_556x45_Stanag"; //Mag for that weapon
titleText ["That weapon is BANNED!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
if (({_x in (primaryWeaponItems player)} count _restrictedItems) > 0) then {
{player removePrimaryWeaponItem _x;} count _restrictedItems;
player addPrimaryWeaponItem "optic_Hamr"; //Scope it is gonna get replaced with
titleText ["That scope is BANNED!", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
if((_restrictedItems find (backpack player)) >= 0) then {
removeBackpack player;
player addBackpack "MC_Backpack_Kitbag"; //Backpack it is gonna get replaced with
titleText ["That is BANNED!.", "PLAIN", 3]; titleFadeOut 1; // The comment it tells the player
};
sleep 10;
};
sleep 10;
};