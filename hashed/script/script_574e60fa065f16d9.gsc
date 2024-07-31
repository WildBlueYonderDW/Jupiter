#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_32096891b2fc39de;
#using script_7e751349e3a8e270;
#using script_3d5a100dc3354c0e;
#using script_2165d661d946d128;
#using scripts\mp\load.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\arm.gsc;
#using scripts\mp\compass.gsc;
#using scripts\common\create_script_utility.gsc;
#using script_2d66b5a0aec8827a;

#namespace namespace_cf617ded6dc87be1;

// Namespace namespace_cf617ded6dc87be1 / namespace_abdf60b52dc9688d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e1
// Size: 0x1f2
function main() {
    namespace_94b1197fdb3f0d3e::main();
    namespace_5a88d782439c6b3a::main();
    namespace_6e9d91682c9346a0::main();
    namespace_a9afa590a6465da6::function_637a32c2ae8e99c2();
    scripts\mp\load::main();
    scripts\cp_mp\utility\game_utility::registerlargemap();
    scripts\cp_mp\utility\game_utility::function_3673befc7dcade8b();
    if (!isdefined(level.outofboundstriggers)) {
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    }
    if (function_a7caa13ebe4c4ba5() || isgroundwarcoremode()) {
        if (!isdefined(scripts\cp_mp\utility\game_utility::getlocaleid())) {
            if (getgametype() == "gwtdm") {
                setdvar(@"scr_localeID", 142);
            } else {
                setdvar(@"scr_localeID", 141);
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
    allvolumes = function_f159c10d5cf8f0b4("noent_volume_minimap", "classname");
    foreach (volume in allvolumes) {
        volume delete();
    }
    scripts\mp\compass::setupminimap("compass_map_mp_jup_st_c_gw");
    setdvar(@"r_umbraMinObjectContribution", 8);
    setdvar(@"hash_9365c7a237edaa2f", 1);
    scripts\common\create_script_utility::initialize_create_script();
    level thread namespace_4c970d44ea63fd32::main();
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    setdvar(@"fd_helicopter_altitude_limiter", 3500);
}

