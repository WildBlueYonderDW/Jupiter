#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_32096891b2fc39de;
#using script_7e751349e3a8e270;
#using script_3d5a100dc3354c0e;
#using scripts\mp\load.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\compass.gsc;
#using scripts\common\create_script_utility.gsc;
#using script_2d66b5a0aec8827a;
#using script_261f1b574c15eab1;
#using script_3a535b44f9ecc6df;
#using script_2d3fead1b9e1d7e5;
#using script_69a61780e1cc21a9;
#using script_49314540c657d352;
#using script_36967ce8ee2ea745;
#using script_66e0e331f9783820;
#using script_7abaa04d5f9fc22e;
#using script_1d1428a3b7b402b0;
#using script_248ec5040062d3ce;
#using script_2d4b9c58ed0e3d91;

#namespace namespace_b4ebddf55bcf083b;

// Namespace namespace_b4ebddf55bcf083b / namespace_7041507a019a2f93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4
// Size: 0xf1
function main() {
    namespace_94b1197fdb3f0d3e::main();
    namespace_5a88d782439c6b3a::main();
    namespace_6e9d91682c9346a0::main();
    initvehicles();
    scripts\mp\load::main();
    scripts\cp_mp\utility\game_utility::registerlargemap();
    scripts\cp_mp\utility\game_utility::function_3673befc7dcade8b();
    if (!isdefined(level.outofboundstriggers)) {
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    }
    setdvar(@"hash_6beec004cdf37c0", 141);
    scripts\mp\compass::setupminimap("compass_map_mp_jup_st_c_gw");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    setdvar(@"hash_9365c7a237edaa2f", 1);
    scripts\common\create_script_utility::initialize_create_script();
    level thread namespace_4c970d44ea63fd32::main();
    level.parachutecancutautodeploy = 1;
    level.parachutecancutparachute = 1;
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

// Namespace namespace_b4ebddf55bcf083b / namespace_7041507a019a2f93
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd
// Size: 0x5a
function initvehicles() {
    level.var_1b4da6b781c9dfbd = 1;
    namespace_8db7d778efdc3d65::main();
    namespace_15896d40cab0d429::main();
    namespace_a8c01726524388f5::main();
    namespace_d8c2d739478db8bb::main();
    namespace_a8b2611e1c2c0f9c::main();
    namespace_65ad5249b19d5d41::main();
    namespace_9972b4aee3d673ca::main();
    namespace_a5c3c313b4f6886a::main();
    namespace_3568ab3cfd523b38::main();
    namespace_405c71940c7ec9ea::main();
    namespace_8624e3257d13b029::main();
}

