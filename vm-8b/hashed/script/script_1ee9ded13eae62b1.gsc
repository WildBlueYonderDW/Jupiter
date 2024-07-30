#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_1d7c9b5d6df19b6c;
#using script_32fc1dc3f580eb2;
#using script_60c925a3a240548;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_ef52994bc4785a4e;

// Namespace namespace_ef52994bc4785a4e / namespace_edafa453b00da8d9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6
// Size: 0xa8
function main() {
    namespace_53eed35d133860a4::main();
    namespace_8cb2e295e59fb98c::main();
    namespace_acab5569660f31fa::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_rundown");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_b2d0d10e6da4e389();
}

// Namespace namespace_ef52994bc4785a4e / namespace_edafa453b00da8d9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x266
// Size: 0x11a
function function_b2d0d10e6da4e389() {
    spawns = [];
    if (getbasegametype() == "koth") {
        var_a49ec225ecf23882 = scripts\mp\spawnlogic::getspawnpointarray("mp_koth_spawn");
        foreach (spawnpoint in var_a49ec225ecf23882) {
            if (!isdefined(spawnpoint.script_noteworthy) || spawnpoint.script_noteworthy == "") {
                spawn_origin = getoriginidentifierstring(spawnpoint);
                level.modifiedspawnpoints[spawn_origin][spawnpoint.classname]["remove"] = 1;
                spawns[spawns.size] = scripts\mp\spawnlogic::createscriptedspawnpoint("mp_koth_spawn", spawnpoint.origin + anglestoforward(spawnpoint.angles) * 2, spawnpoint.angles, undefined, "5");
            }
        }
        if (spawns.size > 0) {
            scripts\mp\spawnlogic::addscriptedspawnpoints(spawns);
        }
    }
}

