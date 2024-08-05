#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_5fdc2726d4ab11fe;
#using script_75daa7b6a62ac816;
#using script_24094daea166657c;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\outofbounds.gsc;

#namespace namespace_643a34b3ee64b3ae;

// Namespace namespace_643a34b3ee64b3ae / namespace_e42a2311c54e8ae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a3
// Size: 0xa6
function main() {
    namespace_c76596639f3673f2::main();
    namespace_d11af5545757b3bc::main();
    namespace_879d85f7779a97aa::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    initoob();
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_greece");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

// Namespace namespace_643a34b3ee64b3ae / namespace_e42a2311c54e8ae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x251
// Size: 0xb1
function initoob() {
    if (scripts\cp_mp\utility\game_utility::getgametype() == "escort") {
        trigger_origin = (-1920, -1408, 0);
        var_872fff8a91852c9f = (1128, 474, 138);
        var_870c0d8a915cd0b1 = (120, 96, 896);
        trigger = spawn("trigger_box", trigger_origin, 0, var_872fff8a91852c9f, var_870c0d8a915cd0b1);
        trigger.targetname = "OutOfBounds";
        trigger.script_team = "defenders";
        level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
        thread scripts\mp\outofbounds::watchoobtrigger(trigger);
    }
}

