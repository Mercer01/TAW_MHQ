//////////////////////////"Stop blowing up the briefing" Script///////////////////////////////
////////////////////////////////////By Indianawinny///////////////////////////////////////////
/////////////////////////////////////DO NOT MODIFY////////////////////////////////////////////

if (isDedicated) exitWith {};
waitUntil {!isNull player};
waitUntil {time > 0};

private ["_eh1","_inSafeZone","_safeZone","_dis", "_playerSide", "_spawnpos", "_list"];
_inSafeZone = true;
_safeZone = getMarkerPos "Base";
_playerSide = side player;
_dis = 100;

if (_playerSide == WEST) then {
_safeZone = getMarkerPos "Base";
};

_spawnpos = [ _safeZone select 0, _safeZone select 1, 1];
_list = nearestObjects [_spawnpos, ["static"], _dis];


if (alive player) then {
if (_safeZone distance player > _dis) then {
_inSafeZone = false;
}else{
_inSafeZone = true;
_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6); titleText ["That could have hurt someone!", "PLAIN", 3]; titleFadeOut 1; }];
};
sleep 1;
};

while {true} do {
if (alive player) then {
if ((_safeZone distance player < _dis) && (!_inSafeZone)) then {  
_eh1 = player addEventHandler ["fired", {deleteVehicle (_this select 6); titleText ["That could have hurt someone!", "PLAIN", 3]; titleFadeOut 1; }];
_inSafeZone = true;
};
if ((_safeZone distance player > _dis) && (_inSafeZone)) then {
player removeEventHandler ["fired", _eh1];
_inSafeZone = false;
sleep 7200;
};
};
sleep 1;
};