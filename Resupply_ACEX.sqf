// Place [this, west] execVM "Scripts\Resupply_ACEX.sqf" into a box in the template.
Resupply_fnc_check_distance_close = {
	_object = _this select 0;
	while {true} do {
		scopeName "mainloop";

		_closest_objects = nearestObjects[getPos _object,[],25];
		{	
			_value = 0;
			_addAction = false;
			_alreadyHas = _x getVariable ["hasAction", false];

			if !(_alreadyHas) then {
				switch (typeOf _x) do {
					case "B_CargoNet_01_ammo_F": {
						_action = _x addAction["Add Supplies","[_this select 0, 200] remoteExec ['Resupply_fnc_add_money'];"];
						_x setVariable ["hasAction",true];
					};
					case "CargoNet_01_barrels_F": {
						_action = _x addAction["Add Supplies","[_this select 0, 150] remoteExec ['Resupply_fnc_add_money'];"];
						_x setVariable ["hasAction",true];

					};
					case "Box_CSAT_Equip_F": {
						_action = _x addAction["Add Supplies","[_this select 0, 10] remoteExec ['Resupply_fnc_add_money'];"];
						_x setVariable ["hasAction",true];

					};
				};
			};
		} forEach _closest_objects;
		sleep 10;
	};
	// [_object] call Resupply_fnc_check_distance_far;
};

Resupply_fnc_check_distance_far ={
	hint "Test";
};



Resupply_fnc_add_money = {
	_object = _this select 0;
	_value = _this select 1;
	// _value = 200;

	_current_credits = ["west"] call acex_fortify_fnc_getBudget;
	
	if (_current_credits == -1) then {
		_current_credits = 0;
	};

	//hint format["value:%1 current total %2",_value, _current_credits];
	_newcredits = _current_credits + _value;

	[west, _newcredits, [
		["Land_BagFence_Long_F", 5], //Long Sandbag
		["Land_BagFence_Round_F", 5], // Round Sandbag
		["Land_BagFence_Corner_F",5],
		["Land_BagBunker_Small_F", 50],
		["Land_BagBunker_01_small_green_F", 50],
		["Land_BagBunker_Tower_F",200],
		["Land_HBarrier_01_tower_green_F",200],
		["Land_HBarrier_3_F",50],
		["Land_HBarrier_01_line_3_green_F",50],
		["Land_HBarrierWall_corridor_F",100],
		["Land_HBarrier_01_wall_corridor_green_F",100],
		["Land_HBarrierWall_corner_F", 100], //H-Barrier Wall Corner
		["Land_HBarrier_01_wall_corner_green_F",100], //H-Barrier Wall Green Corner
		["Land_HBarrier_01_wall_4_green_F", 100], //H-Barrier Wall Green
		["Land_HBarrierWall4_F",100], //H-Barrier Wall
		["Land_HBarrierTower_F", 200], //H-Barrier Tower
		["Land_HBarrier_01_big_tower_green_F",200],
		["Land_CncShelter_F",25], //Concrete Shelter
		["CamoNet_BLUFOR_open_F", 50], //Camonet Open
		["CamoNet_BLUFOR_F", 50], // Camonet
		["Land_PortableLight_double_F",10], //Double Light
		["Flag_NATO_F",5], //Nato Flag
		["Land_CampingChair_V2_F",1], //Camping Chair
		["Land_HelipadCircle_F",10], //Hellipad
		["UK3CB_BAF_Box_L16_Ammo_Mixed",150] //Mixed ammo box for L16 Mortar
	]] call acex_fortify_fnc_registerObjects;
	deleteVehicle _object;	
};


Resupply_fnc_Armory = {
	_man = _this select 0;
	_man allowDamage false;
	_man enableSimulationGlobal false;
	_man switchMove 'Acts_AidlPercMstpSnonWnonDnon_warmup_1_loop';
	_resupply = _man addAction ["Create Supplies",Resupply_fnc_spawn_box];	
};

Resupply_fnc_spawn_box = {
	_target = _this select 0;
	_veh = 'B_CargoNet_01_ammo_F' createVehicle position _target; 
	clearWeaponCargoGlobal _veh;
	clearItemCargo _veh;
	clearMagazineCargo _veh;
	clearWeaponCargoGlobal _veh;
};

waitUntil {time > 0};
_object = _this select 0;

if(_object isKindOf "man") then {
	[_object] call Resupply_fnc_Armory;
} else {
	[_object] call Resupply_fnc_check_distance_close;
};