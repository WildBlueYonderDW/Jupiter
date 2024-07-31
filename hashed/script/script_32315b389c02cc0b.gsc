#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_69e05503cecc53da;
#using script_623d6678cbdfe3e8;
#using script_502800b6abe8006;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_7f6b15f0d74bef1;

// Namespace namespace_7f6b15f0d74bef1 / namespace_76ddb73643c90eff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c
// Size: 0x8e
function main() {
    namespace_dcf8e44a38aa314e::main();
    namespace_c4f0ca4ccb7df3e::main();
    namespace_499370a154b38804::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_incline");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    scripts\cp_mp\utility\game_utility::registersmallmap();
}

