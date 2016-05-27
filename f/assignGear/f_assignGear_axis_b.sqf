// DEFINE BACKPACK CONTENTS
// The following blocks of code define different backpack loadouts. These are then
// called from the role loadouts.

// BACKPACK: MEDIC
case "m":
{
    // LOADOUT: MEDIUM
    if (_loadout <= 1) then {
        _unit addBackpack _bagmedic;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_medkit,1];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmedic;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_medkit,1];
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 5];
    };
};

// BACKPACK: RADIO OPERATOR
case "commander_radio":
{
    if (_no_radioman) then {
        _unit addBackpack _radiobag;
        clearMagazineCargoGlobal (unitBackpack _unit);
    };
    if (_loadout >= 1) then {
        {_unit addItem _firstaid} forEach [1,2];
    };
};

// BACKPACK: RADIO OPERATOR
case "radio":
{
    _unit addBackpack _radiobag;
    clearMagazineCargoGlobal (unitBackpack _unit);
    if (_loadout >= 1) then {
        {_unit addItem _firstaid} forEach [1,2];
    };
    if (_loadout == 2) then {
        _unit addMagazines [_grenade, 2];
        _unit addMagazines [_riflemag, 4];
    };
};

// BACKPACK: AR
case "ar":
{
    // LOADOUT: MEDIUM
    if (_loadout == 1) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_ARmag, 2];
    };
};

// BACKPACK: ASSISTANT AUTOMATIC RIFLEMAN
case "aar":
{
    // LOADOUT: LIGHT
    if (_loadout == 0) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_ARmag, 2];
    };
    // LOADOUT: MEDIUM
    if (_loadout >= 1) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_ARmag, 2];
        (unitBackpack _unit) addItemCargoGlobal [_riflemag, 4];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        (unitBackpack _unit) addItemCargoGlobal [_ARmag, 2];
        (unitBackpack _unit) addItemCargoGlobal [_smokegrenade, 2];
    };
};

// BACKPACK: RIFLEMAN (AT)
case "rat":
{
    // LOADOUT: MEDIUM
    if (_loadout == 1) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_RATmag, 1];
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_riflemag, 4];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_RATmag, 3];
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_riflemag, 4];
    };
};

// BACKPACK: RIFLEMAN (R)
case "r":
{
    // LOADOUT: MEDIUM
    if (_loadout == 1) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_riflemag, 4];
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_riflemag, 8];
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_grenade, 4];
    };
};

// BACKPACK: RIFLEMAN 1ST CLASS
case "fc_r":
{
    // LOADOUT: MEDIUM
    if (_loadout >= 1) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_sariflemag, 4];
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_sariflemag, 8];
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_grenade, 3];
        (unitBackpack _unit) addItemCargoGlobal [_smokegrenade, 1];
    };
};

// BACKPACK: MMG GUNNER (MMG)
case "mmg":
{
    // LOADOUT: MEDIUM
    if (_loadout == 1) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 4];
        (unitBackpack _unit) addMagazineCargoGlobal [_pistolmag, 4];
    };
};

// BACKPACK: MMG ASSISTANT GUNNER (MMGAG)
case "aar":
{
    // LOADOUT: LIGHT
    if (_loadout == 0) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_ARmag, 2];
    };
    // LOADOUT: MEDIUM
    if (_loadout >= 1) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_ARmag, 2];
        (unitBackpack _unit) addItemCargoGlobal [_riflemag, 4];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        (unitBackpack _unit) addItemCargoGlobal [_ARmag, 2];
        (unitBackpack _unit) addItemCargoGlobal [_smokegrenade, 2];
    };
};

// LOADOUT: HEAVY MG GUNNER (HMGG)
case "hmgg":
{
    _unit addBackpack _baghmgg;
    if (_loadout >= 1) then {
        { _unit addItem _firstaid; } forEach [1, 2];
    };
};

// LOADOUT: HEAVY MG ASSISTANT GUNNER (HMGAG)
case "hmgag":
{
    _unit addBackpack _baghmgag;
    if (_loadout >= 1) then {
        { _unit addItem _firstaid; } forEach [1, 2];
    };
};

// BACKPACK: MAT GUNNER (MATG)
case "matg":
{
    _unit addBackpack _bagmat;
    clearMagazineCargoGlobal (unitBackpack _unit);
    (unitBackpack _unit) addItemCargoGlobal [_MATmag1, 5];

    // LOADOUT: MEDIUM
    if (_loadout >= 1) then {
        { _unit addItem _firstaid; } forEach [1, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addMagazines [_grenade, 2];
        _unit addMagazines [_riflemag, 4];
    };
};

// BACKPACK: MAT ASSISTANT (MATAG)
case "matag":
{
    // LOADOUT: MEDIUM
    if (_loadout >= 1) then {
        { _unit addItem _firstaid; } forEach [1, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmat;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_MATmag1, 5];
        _unit addMagazines [_riflemag, 4];
    };
};

// BACKPACK: MORTAR GUNNER (MTRG)
case "mtrg":
{
    _unit addBackpack _bagmtrg;
    if (_loadout >= 1) then {
        { _unit addItem _firstaid; } forEach [1, 2];
    };
    if (_loadout == 2) then {
        _unit addMagazines [_riflemag, 4];
    };
};

// BACKPACK: MORTAR ASSISTANT GUNNER (MTRAG)
case "mtrag":
{
    _unit addBackpack _bagmtrag;
    if (_loadout >= 1) then {
        { _unit addItem _firstaid; } forEach [1, 2];
    };
    if (_loadout == 2) then {
        _unit addMagazines [_riflemag, 4];
    };
};

// BACKPACK: ENGINEER (DEMO)
case "eng":
{
    _unit addBackpack _bagmedium;
    clearMagazineCargoGlobal (unitBackpack _unit);
    (unitBackpack _unit) addItemCargoGlobal [_sapper_tools, 1];

    (unitBackpack _unit) addItemCargoGlobal [_satchel, 2];
    (unitBackpack _unit) addItemCargoGlobal [_satchel_wire, 2];
    (unitBackpack _unit) addItemCargoGlobal [_satchel_detonator, 1];
    
    // LOADOUT: MEDIUM
    if (_loadout >= 1) then {
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        (unitBackpack _unit) addItemCargoGlobal [_riflemag, 2];
    };
};

// BACKPACK: ENGINEER (MINES)
case "engm":
{

    _unit addBackpack _bagmedium;
    clearMagazineCargoGlobal (unitBackpack _unit);
    (unitBackpack _unit) addItemCargoGlobal [_sapper_tools, 1];

    (unitBackpack _unit) addItemCargoGlobal [_ATmine, 1];
    (unitBackpack _unit) addItemCargoGlobal [_APmine1, 2];
    (unitBackpack _unit) addItemCargoGlobal [_sapper_flag, 6];
    
    // LOADOUT: MEDIUM
    if (_loadout >= 1) then {
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        (unitBackpack _unit) addItemCargoGlobal [_riflemag, 2];
        (unitBackpack _unit) addItemCargoGlobal [_ATmine, 1];
        (unitBackpack _unit) addItemCargoGlobal [_APmine1, 2];
    };
};

// BACKPACK: SUBMACHINEGUNNER (SMG)
case "smg":
{
    // LOADOUT: MEDIUM
    if (_loadout == 1) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_smgmag, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_smgmag, 4];
        (unitBackpack _unit) addItemCargoGlobal [_grenade, 2];
        (unitBackpack _unit) addItemCargoGlobal [_smokegrenade, 2];
    };
};

// BACKPACK: SUBMACHINEGUNNER (SMG2)
case "smg2":
{
    // LOADOUT: MEDIUM
    if (_loadout == 1) then {
        _unit addBackpack _bagsmall;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_smg2mag, 2];
    };
    // LOADOUT: HEAVY
    if (_loadout == 2) then {
        _unit addBackpack _bagmedium;
        clearMagazineCargoGlobal (unitBackpack _unit);
        (unitBackpack _unit) addItemCargoGlobal [_firstaid, 2];
        (unitBackpack _unit) addItemCargoGlobal [_smg2mag, 4];
        (unitBackpack _unit) addItemCargoGlobal [_grenade, 2];
        (unitBackpack _unit) addItemCargoGlobal [_smokegrenade, 2];
    };
};

// BACKPACK: CREW CHIEFS & VEHICLE DRIVERS
case "cc":
{
    _unit addBackpack _bagmedium;
    clearMagazineCargoGlobal (unitBackpack _unit);
    (unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
};