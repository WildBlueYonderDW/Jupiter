#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_7a9d5ad66c18883e;
#using script_2e8f3e864ee544c4;
#using script_6e23b719d511a481;
#using script_36ec76f1ba5fd3b0;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\mp\animation_suite.gsc;

#namespace namespace_ee24bc630a3a65d4;

// Namespace namespace_ee24bc630a3a65d4 / namespace_c9399f376bc4d741
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb
// Size: 0x174
function main() {
    namespace_e3aa7d5c2907c884::main();
    namespace_430ee43c2810f292::main();
    namespace_a969c2c01f770b87::main();
    namespace_5d14b47bb04d56e4::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_subbase");
    setdvar(@"hash_7686fcb92ccc5edb", 8);
    setdvar(@"hash_2e38c6027743fefc", 1024);
    setdvar(@"hash_71fe8b216d50a24c", 0.68);
    setdvar(@"hash_402173c7dbee15d9", 3);
    setdvar(@"hash_656131a98e0d2c9d", 100);
    setdvar(@"hash_6a4705943fd574b8", 0.4);
    setdvar(@"hash_d0658156fb7f2311", 2);
    setdvar(@"hash_595f2292597ec0c7", (0.3, -1, 0));
    setdvar(@"hash_43a74b2ca0523ded", 1);
    setdvar(@"hash_a7d3d16432fa5feb", 1);
    setdvar(@"hash_ed0c0ee0926e1d16", 1500);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_b1262e3cb659add1();
    thread scripts\mp\animation_suite::animationsuite();
}

// Namespace namespace_ee24bc630a3a65d4 / namespace_c9399f376bc4d741
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x377
// Size: 0x85
function function_b1262e3cb659add1() {
    level waittill("infil_setup_complete");
    var_ee23f0b1f42da962 = getent("static_infil_rhib", "targetname");
    if (gameflag("infil_will_run") && isdefined(var_ee23f0b1f42da962)) {
        var_ee23f0b1f42da962 hide();
        level waittill("prematch_over");
        var_ee23f0b1f42da962 show();
        setdvar(@"hash_43a74b2ca0523ded", 1);
        setdvar(@"hash_ed0c0ee0926e1d16", 29.31);
        setdvar(@"hash_a7d3d16432fa5feb", 22);
    }
}

