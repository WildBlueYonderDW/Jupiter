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
#using scripts\mp\compass.gsc;
#using script_48814951e916af89;

#namespace mp_jup_resort_gw;

// Namespace mp_jup_resort_gw / namespace_3510512cbfdc6d87
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5
// Size: 0x180
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
            } else {
                setdvar(@"scr_localeID", 187);
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
    scripts\mp\compass::setupminimap("compass_map_mp_jup_resort_gw");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    setdvar(@"fd_helicopter_altitude_limiter", 4500);
    level.var_56bcdc219d432f80["axis"] = 15;
    level.var_56bcdc219d432f80["allies"] = 15;
    if (istrue(level.var_289df80e1ded586f)) {
        namespace_bfef6903bca5845d::function_c8393014dd7f8ab6();
    }
}

