#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_6cbc59cb53ea0f8;
#using script_4f50da4b9d6cb68e;
#using script_64a27e8746ebced4;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_317088c60426ec56;

// Namespace namespace_317088c60426ec56 / namespace_cb37dfec993836f9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d
// Size: 0x9f
function main() {
    namespace_8c74be7942a6944c::main();
    namespace_ecc1c14625232fec::main();
    namespace_dff6169a416f965a::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_growhouse");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

