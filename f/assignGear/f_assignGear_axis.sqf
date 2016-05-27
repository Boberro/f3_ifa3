// F3 - Folk ARPS Assign Gear Script - NATO
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//      co          - commander
//      dc          - deputy commander / squad leader
//      m           - medic
//      ftl         - fire team leader
//      ar          - automatic rifleman
//      aar         - assistant automatic rifleman
//      rat         - rifleman (AT)
//      mmgg        - medium mg gunner
//      mmgag       - medium mg assistant
//      matg        - medium AT gunner
//      matag       - medium AT assistant
//      hmgg        - heavy mg gunner (deployable)
//      hmgag       - heavy mg assistant (deployable)
//      mtrg        - mortar gunner (deployable)
//      mtrag       - mortar assistant (deployable)
//      sn          - sniper
//      sp          - spotter (for sniper)
//      vc          - vehicle commander
//      vg          - vehicle gunner
//      vd          - vehicle driver (repair)
//      spgg        - spg gunner
//      spgc        - spg commander
//      eng         - engineer (demo)
//      engm        - engineer (mines)
//
//      r           - rifleman
//      fc_r        - rifleman 1st class (semi auto)
//      smg         - submachinegunner
//      smg2        - veteran submachinegunner
//
//      v_car       - car/4x4
//      v_tr        - truck
//      v_ifv       - ifv
//      v_spg_tr    - spg tractor
//      v_eng       - engineer team vehicle
//
//      crate_small - small ammocrate
//      crate_med   - medium ammocrate
//      crate_large - large ammocrate
//
// ====================================================================================

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

// WEAPON SELECTION

// Bolt action rifle
_rifle = "LIB_K98";
_riflemag = "lib_5Rnd_792x57";
_riflevest = "V_LIB_GER_VestKar98";

// Semi-auto rifle
_sarifle = "LIB_G43";
_sariflemag = "lib_10Rnd_792x57";
_sariflevest = "V_LIB_GER_VestG43";

// Standard Submachine Gun
_smg = "LIB_MP40";
_smgmag = "LIB_32Rnd_9x19";
_smgvest = "V_LIB_GER_VestMP40";

// Advanced Submachine Gun / Assault rifle
_smg2 = "LIB_MP44";
_smg2mag = "lib_30Rnd_792x33";
_smg2vest = "V_LIB_GER_VestSTG";

// Pistol
_pistol = "LIB_P38";
_pistolmag = "lib_8Rnd_9x19";
_pistolvest = "V_LIB_GER_PrivateBelt";

// Flare pistol
_flaregun = "LIB_FLARE_PISTOL";
_flare = "lib_1Rnd_flare_white";
_flarered = "lib_1Rnd_flare_red";
_flaregreen = "lib_1Rnd_flare_green";
_flareyellow = "lib_1Rnd_flare_yellow";

// Grenades
_grenade = "lib_m39";
_Mgrenade = "lib_m39";
_smokegrenade = "lib_nb39";

// misc medical items.
_firstaid = "FirstAidKit";
_medkit = "Medikit";

// Backpacks
_radiobag = "B_LIB_GER_Radio";              // used by radio operators
_bagsmall = "B_LIB_GER_A_frame";
_bagmedium = "B_LIB_GER_SapperBackpack";
_bagmedic = "B_LIB_GER_MedicBackpack";      // used by medics
_bagmat = "B_LIB_GER_Panzer";           // used by Medium AT team
_baghmgg = "LIB_MG42_Bag";                  // used by Heavy MG gunner
_baghmgag = "LIB_MG42_Tripod_disasm";       // used by Heavy MG assistant gunner
_bagmtrg = "LIB_GrWr34_Bag";                // used by Mortar gunner
_bagmtrag = "LIB_GrWr34_bar";               // used by Mortar assistant gunner

// ====================================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

_binocular = "Item_LIB_Binocular_SU";

// Automatic Rifleman
_AR = "LIB_MG42";
_ARmag = "lib_50Rnd_792x57";
_ARmag_tr = "lib_50Rnd_792x57_sS";
_ARvest = "V_LIB_GER_VestMG";

// Medium MG
_MMG = "LIB_MG42";
_MMGmag = "lib_50Rnd_792x57";
_MMGmag_tr = "lib_50Rnd_792x57_sS";
_MMGvest = "V_LIB_GER_VestMG";

// Rifleman AT
_RAT = "LIB_PzFaust_30m";
_RATmag = "1Rnd_LIB_PzFaust_30m";

// Medium AT
_MAT = "LIB_RPzB";
_MATmag1 = "LIB_1Rnd_RPzB";

// Sniper
_SNrifle = "LIB_K98ZF39";
_SNrifleMag = "lib_5Rnd_792x57";
_SNriflevest = "V_LIB_GER_SniperBelt";

// Engineer items
_sapper_tools = "LIB_W";
_ATmine = "LIB_TMI_42_MINE_mag";
_APmine1 = "LIB_SMI_35_1_MINE_mag";
_satchel = "LIB_Ladung_Big_MINE_mag";
_satchel_wire = "LIB_PM_Provod_100";
_satchel_detonator = "LIB_Ladung_PM_MINE_mag";
_sapper_flag = "LIB_MARKER_MINE_mag";

// Crew
_crewvest = "V_LIB_GER_TankPrivateBelt";

// Officer
_officervest = "V_LIB_GER_OfficerVest";
_officersmgvest = "V_LIB_GER_FieldOfficer";

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);         // Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;                 // expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";    // We check if we're dealing with a soldier or a vehicle
_no_radioman = f_param_give_radios > 0;

// ====================================================================================

if (_isMan) then {
    _unit setVariable ["BIS_enableRandomization", false];
    removeVest _unit;
    removeBackpack _unit;
    removeAllWeapons _unit;
    removeAllItemsWithMagazines _unit;
    removeAllAssignedItems _unit;
    _unit addItem _firstaid;
    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
};

// ====================================================================================

// SETUP BACKPACKS
// Include the correct backpack file for the faction

_backpack = {
    _typeofBackPack = _this select 0;
    _loadout = f_param_backpacks;
    if (count _this > 1) then {_loadout = _this select 1};
    switch (_typeofBackPack) do
    {
        #include "f_assignGear_axis_b.sqf";
    };
};

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// ====================================================================================

// LOADOUT: COMMANDER
    case "co":
    {
        if (!_no_radioman) then {
            _unit addVest _officervest;
            _unit addmagazines [_pistolmag,5];
            _unit addweapon _pistol;
            _unit addWeapon _binocular;
        } else {
            _unit addVest _officersmgvest;
            _unit addMagazines [_smgmag, 4];
            _unit addWeapon _smg;
            _unit addMagazines [_flare, 2];
            _unit addMagazines [_flarered, 2];
            _unit addMagazines [_flareyellow, 2];
            _unit addMagazines [_flaregreen, 2];
            _unit addWeapon _flaregun;
            _unit addWeapon _binocular;
        };
        ["commander_radio"] call _backpack;
    };

// LOADOUT: DEPUTY COMMANDER
    case "dc":
    {
        if (!_no_radioman) then {
            _unit addVest _officervest;
            _unit addmagazines [_pistolmag,5];
            _unit addweapon _pistol;
            _unit addWeapon _binocular;
        } else {
            _unit addVest _officersmgvest;
            _unit addMagazines [_smgmag, 4];
            _unit addWeapon _smg;
            _unit addMagazines [_flare, 2];
            _unit addMagazines [_flarered, 2];
            _unit addMagazines [_flareyellow, 2];
            _unit addMagazines [_flaregreen, 2];
            _unit addWeapon _flaregun;
            _unit addWeapon _binocular;
        };
        ["commander_radio"] call _backpack;
    };

// LOADOUT: RADIO OPERATOR AND SIGNALMAN
    case "radio":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_flare, 2];
        _unit addMagazines [_flarered, 2];
        _unit addMagazines [_flareyellow, 2];
        _unit addMagazines [_flaregreen, 2];
        _unit addWeapon _flaregun;
        _unit addWeapon _binocular;
        ["radio"] call _backpack;
    };
    
// LOADOUT: JTAC
    case "jtac":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addWeapon _binocular;
        ["radio"] call _backpack;
    };

// LOADOUT: MEDIC
    case "m":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addmagazines [_smokegrenade,4];
        {_unit addItem _firstaid} forEach [1,2,3,4];
        ["m"] call _backpack;
    };

// LOADOUT: SQUAD LEADER
    case "sl":
    {
        _unit addVest _smgvest;
        _unit addmagazines [_smgmag, 6];
        _unit addweapon _smg;
        _unit addmagazines [_pistolmag,4];
        _unit addweapon _pistol;
        _unit addmagazines [_grenade,1];
        _unit addmagazines [_smokegrenade,2];
        _unit addWeapon _binocular;
        ["commander_radio"] call _backpack;
    };

// LOADOUT: FIRETEAM LEADER
    case "ftl":
    {
        _unit addVest _smgvest;
        _unit addmagazines [_smgmag, 6];
        _unit addweapon _smg;
        _unit addmagazines [_grenade,2];
        _unit addmagazines [_smokegrenade,2];
        ["smg"] call _backpack;
    };

// LOADOUT: FIRETEAM LEADER (RIFLE)
    case "ftl_rifle":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addmagazines [_grenade,2];
        _unit addmagazines [_smokegrenade,2];
        ["r"] call _backpack;
    };

// LOADOUT: AUTOMATIC RIFLEMAN
    case "ar":
    {
        _unit addVest _ARvest;
        _unit addmagazines [_ARmag,3];
        _unit addweapon _AR;
        _unit addMagazines [_pistolmag, 2];
        _unit addWeapon _pistol;
        ["ar"] call _backpack;
    };

// LOADOUT: ASSISTANT AUTOMATIC RIFLEMAN
    case "aar":
    {
        _unit addVest _riflevest;
        _unit addmagazines [_riflemag,10];
        _unit addweapon _rifle;
        _unit addmagazines [_grenade,2];
        ["aar"] call _backpack;
    };

// LOADOUT: RIFLEMAN (AT)
    case "rat":
    {
        _unit addVest _riflevest;
        _unit addmagazines [_riflemag,10];
        _unit addweapon _rifle;
        _unit addMagazines [_RATmag, 1];
        _unit addweapon _RAT;
        ["rat"] call _backpack;
    };

// LOADOUT: MEDIUM MG GUNNER
    case "mmgg":
    {
        _unit addVest _MMGvest;
        _unit addMagazines [_MMGmag, 2];
        _unit addWeapon _MMG;
        _unit addMagazines [_pistolmag, 2];
        _unit addWeapon _pistol;
        ["mmg"] call _backpack;
    };

// LOADOUT: MEDIUM MG ASSISTANT GUNNER
    case "mmgag":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_grenade, 2];
        _unit addMagazines [_smokegrenade, 2];
        _unit addWeapon _binocular;
        ["mmgag"] call _backpack;
    };

// LOADOUT: HEAVY MG GUNNER
    case "hmgg":
    {
        _unit addVest _pistolvest;
        _unit addMagazines [_pistolmag, 4];
        _unit addWeapon _pistol;
        ["hmgg"] call _backpack;
    };

// LOADOUT: HEAVY MG ASSISTANT GUNNER
    case "hmgag":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_grenade, 2];
        _unit addMagazines [_smokegrenade, 2];
        _unit addWeapon _binocular;
        ["hmgag"] call _backpack;
    };

// LOADOUT: MEDIUM AT GUNNER
    case "matg":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addWeapon _MAT;
        ["matg"] call _backpack;
    };

// LOADOUT: MEDIUM AT ASSISTANT GUNNER
    case "matag":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_grenade, 2];
        _unit addMagazines [_smokegrenade, 2];
        ["matag"] call _backpack;
    };

// LOADOUT: MORTAR GUNNER
    case "mtrg":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        ["mtrg"] call _backpack;
    };

// LOADOUT: MORTAR ASSISTANT GUNNER
    case "mtrag":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        ["mtrag"] call _backpack;
    };

// LOADOUT: SNIPER
    case "sn":
    {
        _unit addVest _SNriflevest;
        _unit addMagazines [_SNrifleMag, 10];
        _unit addWeapon _SNrifle;
        _unit addMagazines [_pistolmag, 2];
        _unit addWeapon _pistol;
        _unit addMagazines [_smokegrenade, 1];
    };

// LOADOUT: SPOTTER
    case "sp":
    {
        _unit addVest _SNriflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_pistolmag, 2];
        _unit addWeapon _pistol;
        _unit addMagazines [_smokegrenade, 1];
        _unit addMagazines [_grenade, 1];
    };

// LOADOUT: VEHICLE COMMANDER
    case "vc":
    {
        _unit addVest _crewvest;
        _unit addMagazines [_pistolmag, 4];
        _unit addWeapon _pistol;
        _unit addMagazines [_smokegrenade, 1];
    };

// LOADOUT: VEHICLE DRIVER
    case "vd":
    {
        _unit addVest _crewvest;
        _unit addMagazines [_pistolmag, 4];
        _unit addWeapon _pistol;
        _unit addMagazines [_smokegrenade, 1];
        ["cc"] call _backpack;
    };

// LOADOUT: VEHICLE GUNNER
    case "vg":
    {
        _unit addVest _crewvest;
        _unit addMagazines [_pistolmag, 4];
        _unit addWeapon _pistol;
        _unit addMagazines [_smokegrenade, 1];
    };

// LOADOUT: SPG GUNNER
    case "spgg":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_grenade, 1];
    };

// LOADOUT: SPG COMMANDER
    case "spgc":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_grenade, 1];
        _unit addWeapon _binocular;
        ["cc"] call _backpack;
    };

// LOADOUT: ENGINEER (DEMO)
    case "eng":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_grenade, 2];
        _unit addMagazines [_smokegrenade, 2];
        ["eng"] call _backpack;
    };

// LOADOUT: ENGINEER (MINES)
    case "engm":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_grenade, 2];
        _unit addMagazines [_smokegrenade, 2];
        ["engm"] call _backpack;
    };

// LOADOUT: RIFLEMAN
    case "r":
    {
        _unit addVest _riflevest;
        _unit addMagazines [_riflemag, 10];
        _unit addWeapon _rifle;
        _unit addMagazines [_grenade, 4];
        ["r"] call _backpack;
    };

// LOADOUT: RIFLEMAN 1ST CLASS
    case "fc_r":
    {
        _unit addVest _sariflevest;
        _unit addMagazines [_sariflemag, 8];
        _unit addWeapon _sarifle;
        _unit addMagazines [_grenade, 4];
        ["fc_r"] call _backpack;
    };

// LOADOUT: SUBMACHINEGUNNER
    case "smg":
    {
        _unit addVest _smgvest;
        _unit addMagazines [_smgmag, 6];
        _unit addWeapon _smg;
        _unit addMagazines [_grenade, 4];
        ["smg"] call _backpack;
    };

// LOADOUT: VETERAN SUBMACHINEGUNNER
    case "smg2":
    {
        _unit addVest _smg2vest;
        _unit addMagazines [_smg2mag, 6];
        _unit addWeapon _smg2;
        _unit addMagazines [_grenade, 3];
        _unit addMagazines [_smokegrenade, 1];
        ["smg2"] call _backpack;
    };

// CARGO: CAR - room for 10 weapons and 50 cargo items
    case "v_car":
    {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
        _unit addWeaponCargoGlobal [_rifle, 4];
        _unit addMagazineCargoGlobal [_riflemag, 8];
        _unit addWeaponCargoGlobal [_flaregun, 1];
        _unit addMagazineCargoGlobal [_flare, 2];
        _unit addMagazineCargoGlobal [_flarered, 2];
        _unit addMagazineCargoGlobal [_flaregreen, 2];
        _unit addMagazineCargoGlobal [_flareyellow, 2];
        _unit addItemCargoGlobal [_firstaid,4];
        _unit addMagazineCargoGlobal [_grenade, 4];
        _unit addMagazineCargoGlobal [_smokegrenade, 4];
    };

// CARGO: TRUCK - room for 50 weapons and 200 cargo items
    case "v_tr":
    {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
        _unit addWeaponCargoGlobal [_rifle, 4];
        _unit addMagazineCargoGlobal [_riflemag, 20];
        _unit addMagazineCargoGlobal [_grenade, 10];
        _unit addMagazineCargoGlobal [_smokegrenade, 10];
        _unit addItemCargoGlobal [_firstaid,10];
        _unit addWeaponCargoGlobal [_flaregun, 1];
        _unit addMagazineCargoGlobal [_flare, 2];
        _unit addMagazineCargoGlobal [_flarered, 2];
        _unit addMagazineCargoGlobal [_flaregreen, 2];
        _unit addMagazineCargoGlobal [_flareyellow, 2];
        _unit addMagazineCargoGlobal [_armag, 8];
        _unit addMagazineCargoGlobal [_ratmag, 2];
    };

// CARGO: IFV - room for 10 weapons and 100 cargo items
    case "v_ifv":
    {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
        _unit addWeaponCargoGlobal [_rifle, 4];
        _unit addMagazineCargoGlobal [_riflemag, 20];
        _unit addMagazineCargoGlobal [_grenade, 10];
        _unit addMagazineCargoGlobal [_smokegrenade, 10];
        _unit addItemCargoGlobal [_firstaid,10];
        _unit addWeaponCargoGlobal [_flaregun, 1];
        _unit addMagazineCargoGlobal [_flare, 2];
        _unit addMagazineCargoGlobal [_flarered, 2];
        _unit addMagazineCargoGlobal [_flaregreen, 2];
        _unit addMagazineCargoGlobal [_flareyellow, 2];
        _unit addMagazineCargoGlobal [_armag, 8];
        _unit addMagazineCargoGlobal [_ratmag, 2];
    };

// CARGO
    case "v_spg_tr":
    {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
    };

// CARGO
    case "v_eng":
    {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
    };

// CRATE: Small, ammo for 1 fireteam
    case "crate_small":
{
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
        _unit addMagazineCargoGlobal [_riflemag, 8];
        _unit addMagazineCargoGlobal [_armag, 1];
        _unit addMagazineCargoGlobal [_ratmag, 1];
        _unit addMagazineCargoGlobal [_grenade, 4];
        _unit addMagazineCargoGlobal [_smokegrenade, 2];
        _unit addItemCargoGlobal [_firstaid, 4];
};

// CRATE: Medium, ammo for 1 squad
    case "crate_med":
{
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
        _unit addMagazineCargoGlobal [_riflemag, 20];
        _unit addMagazineCargoGlobal [_grenade, 10];
        _unit addMagazineCargoGlobal [_smokegrenade, 10];
        _unit addMagazineCargoGlobal [_armag, 8];
        _unit addMagazineCargoGlobal [_ratmag, 2];
        _unit addItemCargoGlobal [_firstaid,24];
};

// CRATE: Large, ammo for 1 platoon
    case "crate_large":
{
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
        _unit addMagazineCargoGlobal [_riflemag, 80];
        _unit addMagazineCargoGlobal [_grenade, 40];
        _unit addMagazineCargoGlobal [_smokegrenade, 20];
        _unit addItemCargoGlobal [_firstaid,80];
        _unit addWeaponCargoGlobal [_flaregun, 1];
        _unit addMagazineCargoGlobal [_flare, 2];
        _unit addMagazineCargoGlobal [_flarered, 2];
        _unit addMagazineCargoGlobal [_flaregreen, 2];
        _unit addMagazineCargoGlobal [_flareyellow, 2];
        _unit addMagazineCargoGlobal [_armag, 20];
        _unit addMagazineCargoGlobal [_ratmag, 10];
};

// LOADOUT: DEFAULT/UNDEFINED (use RIFLEMAN)
   default
   {
        _unit addmagazines [_riflemag,7];
        _unit addweapon _rifle;

        _unit selectweapon primaryweapon _unit;

        if (true) exitwith {player globalchat format ["DEBUG (f\assignGear\f_assignGear_aaf.sqf): Unit = %1. Gear template %2 does not exist, used Rifleman instead.",_unit,_typeofunit]};
   };

// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================

// If this is an ammobox, check medical component settings and if needed run converter script.

if (!_isMan) then
    {
    // Authentic Gameplay Modification
    if (f_var_medical == 2) exitWith
        {
            [_unit] execVM "f\medical\AGM_converter.sqf";
        };
    };

// ====================================================================================

// If this isn't run on an infantry unit we can exit
if !(_isMan) exitWith {};

// ====================================================================================

// Handle weapon attachments
// #include "f_assignGear_attachments.sqf";

// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectweapon primaryweapon _unit;
