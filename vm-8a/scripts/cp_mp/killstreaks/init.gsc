#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;
#using scripts\cp_mp\killstreaks\emp_drone_targeted.gsc;
#using scripts\cp_mp\killstreaks\nuke.gsc;
#using scripts\cp_mp\killstreaks\emp_drone.gsc;
#using script_b6e69ac53e6ee66;
#using script_10ad6174c8938599;
#using script_249f45d992af1114;
#using scripts\cp_mp\killstreaks\sentry_gun.gsc;
#using script_509a782dd5b89cf1;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_1eddec53abf6e24c;
#using scripts\cp_mp\killstreaks\cruise_predator.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using scripts\cp_mp\killstreaks\gunship.gsc;
#using scripts\cp_mp\killstreaks\chopper_gunner.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using script_6d68cfdf0836123c;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;

#namespace init;

// Namespace init / scripts\cp_mp\killstreaks\init
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8
// Size: 0x154
function init() {
    if (getdvarint(@"hash_e6afce2cf5cf7515", 0) == 1) {
        return;
    }
    if (getdvarint(@"hash_742caa13b3c2e685", 0) == 1) {
        return;
    }
    /#
        scripts\engine\utility::issharedfuncdefined("<dev string:x1c>", "<dev string:x27>", 1);
    #/
    [[ scripts\engine\utility::getsharedfunc("killstreak", "init") ]]();
    function_dc7912ca19ed8fff();
    namespace_5890eaf13eeb48fa::function_aa5200593ca327d2();
    level thread function_12bbd0259ce8831f();
    level thread scripts\cp_mp\killstreaks\airdrop::init();
    level thread scripts\cp_mp\killstreaks\airstrike::init();
    level thread scripts\cp_mp\killstreaks\juggernaut::init();
    level thread scripts\cp_mp\killstreaks\toma_strike::init();
    level thread scripts\cp_mp\killstreaks\uav::init();
    level thread scripts\cp_mp\killstreaks\helper_drone::init();
    level thread scripts\cp_mp\killstreaks\manual_turret::init();
    level thread scripts\cp_mp\killstreaks\emp_drone_targeted::init();
    level thread scripts\cp_mp\killstreaks\nuke::init();
    level thread scripts\cp_mp\killstreaks\emp_drone::init();
    level thread namespace_d02a28280306d1bc::init();
    level thread namespace_39febbb7a6990e45::init();
    level thread namespace_8a82a4967e25efd4::init();
    level thread scripts\cp_mp\killstreaks\sentry_gun::init();
    level thread namespace_2c99f682179581bf::init();
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        level thread namespace_e70862d8d2eb291c::init();
        level thread scripts\cp_mp\killstreaks\cruise_predator::init();
        level thread scripts\cp_mp\killstreaks\white_phosphorus::init();
        level thread scripts\cp_mp\killstreaks\gunship::init();
        level thread scripts\cp_mp\killstreaks\chopper_gunner::init();
        level thread scripts\cp_mp\killstreaks\chopper_support::init();
        level thread namespace_893ac0cf28c5af44::init();
    }
    while (!issharedfuncdefined("aggregator", "registerOnPlayerSpawnCallback")) {
        waitframe();
    }
}

// Namespace init / scripts\cp_mp\killstreaks\init
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x334
// Size: 0x42
function function_dc7912ca19ed8fff() {
    var_e2818ad39a3341b4 = scripts\cp_mp\utility\vehicle_omnvar_utility::vehomn_clearleveldataforvehicle("killstreak", 1);
    var_e2818ad39a3341b4.warningbits["missileLocking"] = 2;
    var_e2818ad39a3341b4.warningbits["burningDown"] = 1;
}

// Namespace init / scripts\cp_mp\killstreaks\init
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x57
function function_12bbd0259ce8831f() {
    if (isdefined(level.scripted_spawner_func)) {
        flag_wait("strike_init_done");
    }
    level.heli_structs_entrances = scripts\cp_mp\utility\game_utility::getlocalestructarray("ks_heli_entrance");
    level.heli_structs_goals = scripts\cp_mp\utility\game_utility::getlocalestructarray("ks_heli_goal");
    level.heli_structs_paths = scripts\cp_mp\utility\game_utility::getlocalestructarray("ks_heli_path");
}

