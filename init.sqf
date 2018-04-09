// Disable saving (Needed for multiplayer)
enableSaving [false,false];

// Enables ambient sounds and animals (Bunny Wabits)
enableEnvironment true;

// Remove empty groups, preventing zeus spawn limitations
[] spawn {
    while{true} do {
        sleep 60;
        {
            if(local _x && count units _x == 0) then {
                deleteGroup _x;
                sleep 1;
            };
        } forEach allGroups;
    };
};

// Sets Higher Recoil for players
player setUnitRecoilCoefficient 1.5;

// Adds FOB building
// [] execVM 'Scripts\Fortify.sqf';

// starts script to show all units on map for zeuses, because zeuses need to know what is going on
[] execVM 'Scripts\unit_markers_for_zeus.sqf';

// Passes AI groups simulation to headless clients (HC for short), does nothing if HCs are not available, can use up to 3 HCs named HC, HC2, HC3
[] execVM "Scripts\passToHCs.sqf";

// Stop bullets and nades at base. If the base is under attack at the beginning, remove this section.
[] execVM "Scripts\NoBaseNades.sqf";

// Removes suppressors. If it's a stealth mission, remove this section.
[] execVM "G.E.A.R.S\Supressors.sqf";

// Executes Equipment Restriction Script.
[] execVM "G.E.A.R.S\init.sqf";