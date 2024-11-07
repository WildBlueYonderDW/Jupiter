#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_4bfc204cc71183d6;
#using script_7f6133fe6c8de5ca;
#using script_f084cc4c5d4c60;
#using script_7aa52201dd43d4a8;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace mp_jup_elevated;

// Namespace mp_jup_elevated / namespace_734b3c31253a1205
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184
// Size: 0xa6
function main() {
    namespace_98292dabfb99daba::main();
    namespace_9236325d89d8f720::main();
    namespace_56885e0d9a1bfdee::main();
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

