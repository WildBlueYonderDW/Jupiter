#using script_14660943f9b0bb08;
#using scripts\common\basic_wind;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_wasteland\mp_jup_wasteland_fx;
#using scripts\mp\maps\mp_jup_wasteland\mp_jup_wasteland_lighting;

#namespace mp_jup_wasteland;

// Namespace mp_jup_wasteland / scripts\mp\maps\mp_jup_wasteland\mp_jup_wasteland
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x185
// Size: 0xb1
function main() {
    namespace_fbeda92550a74a08::main();
    scripts\mp\maps\mp_jup_wasteland\mp_jup_wasteland_fx::main();
    scripts\mp\maps\mp_jup_wasteland\mp_jup_wasteland_lighting::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_wasteland");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    setdvar(@"r_umbraaccurateocclusionthreshold", 512);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

