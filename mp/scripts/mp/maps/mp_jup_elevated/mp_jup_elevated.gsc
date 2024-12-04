#using script_4bfc204cc71183d6;
#using script_7aa52201dd43d4a8;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_elevated\mp_jup_elevated_fx;
#using scripts\mp\maps\mp_jup_elevated\mp_jup_elevated_lighting;

#namespace mp_jup_elevated;

// Namespace mp_jup_elevated / scripts\mp\maps\mp_jup_elevated\mp_jup_elevated
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184
// Size: 0xa6
function main() {
    namespace_98292dabfb99daba::main();
    scripts\mp\maps\mp_jup_elevated\mp_jup_elevated_fx::main();
    scripts\mp\maps\mp_jup_elevated\mp_jup_elevated_lighting::main();
    namespace_ab478f37974ac238::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_elevated");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

