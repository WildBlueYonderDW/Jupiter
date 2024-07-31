#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_531126308cf12f02;
#using script_55058391cd43bb18;
#using script_7acaa8f3ed4611ed;
#using script_7e4251bb1af4180a;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\animation_suite.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_d5b1d0134972bf63;

// Namespace namespace_d5b1d0134972bf63 / namespace_4da5c853f82df1e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223
// Size: 0xb4
function main() {
    namespace_4a0468ec27120e40::main();
    namespace_6c53a65580625c0e::main();
    namespace_f216662fc383141b::main();
    namespace_e86e419862c2e1de::main();
    scripts\mp\load::main();
    scripts\mp\compass::setupminimap("compass_map_mp_m_blacksite2");
    thread function_132a917b60035b48();
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    thread scripts\mp\animation_suite::animationsuite();
    scripts\cp_mp\utility\game_utility::registersmallmap();
    scripts\cp_mp\utility\game_utility::registerarenamap();
    thread function_6e3cce6a02667476();
}

// Namespace namespace_d5b1d0134972bf63 / namespace_4da5c853f82df1e5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2df
// Size: 0x3e
function function_da7c9335e454c032(player) {
    if (getdvarint(@"hash_c00e244ea59d530e") == 1 || istrue(level.thirdpersonmode)) {
        setdvar(@"hash_31f818870138cd26", 1);
    }
}

// Namespace namespace_d5b1d0134972bf63 / namespace_4da5c853f82df1e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x325
// Size: 0x36
function function_6e3cce6a02667476() {
    level endon("game_ended");
    while (true) {
        player = level waittill("connected");
        function_da7c9335e454c032(player);
        player thread function_5b2361e97848cabd();
    }
}

// Namespace namespace_d5b1d0134972bf63 / namespace_4da5c853f82df1e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x363
// Size: 0x21
function function_5b2361e97848cabd() {
    self endon("disconnect");
    level waittill("game_ended");
    setdvar(@"hash_31f818870138cd26", 0);
}

// Namespace namespace_d5b1d0134972bf63 / namespace_4da5c853f82df1e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38c
// Size: 0x1f3
function function_132a917b60035b48() {
    var_9efc16c371b26a71 = spawn("trigger_rotatable_radius", (265, 554, 8), 0, 256, 256);
    var_9efc16c371b26a71.angles = (90, 0, 0);
    var_9efc16c371b26a71.targetname = "callout_area";
    var_9efc16c371b26a71.script_noteworthy = "Cells";
    var_b5f33de5958a1664 = spawn("trigger_rotatable_radius", (-519, -227, 8), 0, 256, 600);
    var_b5f33de5958a1664.angles = (90, 90, 0);
    var_b5f33de5958a1664.targetname = "callout_area";
    var_b5f33de5958a1664.script_noteworthy = "Interrogation Rooms";
    var_10fa32e77e7a9e9c = spawn("trigger_rotatable_radius", (437, -701, 1), 0, 256, 512);
    var_10fa32e77e7a9e9c.angles = (90, 90, 0);
    var_10fa32e77e7a9e9c.targetname = "callout_area";
    var_10fa32e77e7a9e9c.script_noteworthy = "Prisoner Cage";
    var_2a1b57069ff61256 = spawn("trigger_rotatable_radius", (-272, -945, 0), 0, 256, 512);
    var_2a1b57069ff61256.angles = (90, 0, 0);
    var_2a1b57069ff61256.targetname = "callout_area";
    var_2a1b57069ff61256.script_noteworthy = "Firing Line";
    var_3573a1006d871fa1 = spawn("trigger_rotatable_radius", (-386, 866, -2), 0, 256, 512);
    var_3573a1006d871fa1.angles = (90, 0, 0);
    var_3573a1006d871fa1.targetname = "callout_area";
    var_3573a1006d871fa1.script_noteworthy = "Destroyed Van";
}

