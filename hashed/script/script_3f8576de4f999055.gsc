#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_331d554c750258eb;
#using script_56491e053fa9be9a;
#using script_4107afd4c2fcd490;
#using script_5b3352c9025375ae;
#using scripts\mp\load.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\arm.gsc;
#using scripts\common\create_script_utility.gsc;
#using script_31fc3f9690a04db0;
#using scripts\mp\compass.gsc;

#namespace namespace_7a30a240a58b3649;

// Namespace namespace_7a30a240a58b3649 / namespace_73b1ba7e8535ccd9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed
// Size: 0x196
function main() {
    namespace_42f73e1f1c09c3a1::main();
    namespace_4fd3a0fdc71bea96::main();
    namespace_99acc9292ac3a616::main();
    namespace_22cd3edc9e771e7c::main();
    scripts\mp\load::main();
    scripts\cp_mp\utility\game_utility::registerlargemap();
    scripts\cp_mp\utility\game_utility::function_3673befc7dcade8b();
    if (function_a7caa13ebe4c4ba5() || isgroundwarcoremode()) {
        if (!isdefined(scripts\cp_mp\utility\game_utility::getlocaleid())) {
            if (getgametype() == "gwtdm") {
                setdvar(@"scr_localeID", 188);
                thread function_40066db0bee45b43("locale_188");
            } else {
                setdvar(@"scr_localeID", 187);
                thread function_40066db0bee45b43("locale_187");
            }
        }
        scripts\mp\gametypes\arm::arm_initoutofbounds();
    } else {
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
        level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
        setdvar(@"hash_9365c7a237edaa2f", 1);
        level.parachutecancutautodeploy = 1;
        level.parachutecancutparachute = 1;
    }
    scripts\common\create_script_utility::initialize_create_script();
    level thread namespace_cea3a630d232b3cc::main();
    scripts\mp\compass::setupminimap("compass_map_mp_jup_resort_gw");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    setdvar(@"fd_helicopter_altitude_limiter", 5000);
    level.var_56bcdc219d432f80["axis"] = 15;
    level.var_56bcdc219d432f80["allies"] = 15;
}

// Namespace namespace_7a30a240a58b3649 / namespace_73b1ba7e8535ccd9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38b
// Size: 0x6b
function function_40066db0bee45b43(var_3d727559df866469) {
    var_e83ef41f3bc3a833 = (-31284, 30812, 6308);
    var_94125ea344e827da = "airstrikeheight";
    airstrikeheight = spawn_script_origin(var_e83ef41f3bc3a833, (0, 0, 0));
    airstrikeheight.targetname = var_94125ea344e827da;
    airstrikeheight.script_noteworthy = var_3d727559df866469;
}

