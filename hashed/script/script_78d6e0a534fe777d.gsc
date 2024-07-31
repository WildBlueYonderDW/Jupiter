#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\common\basic_wind.gsc;
#using script_14660943f9b0bb08;
#using script_40d3e90ae6bc0666;
#using script_3bd61160e62c418c;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_912fdce6022ac7e8;

// Namespace namespace_912fdce6022ac7e8 / namespace_205089083210fbcd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185
// Size: 0xb1
function main() {
    namespace_fbeda92550a74a08::main();
    namespace_a41e483c0894ebf8::main();
    namespace_a63bcb1797197506::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_wasteland");
    setdvar(@"r_umbraMinObjectContribution", 8);
    setdvar(@"r_umbraAccurateOcclusionThreshold", 512);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

