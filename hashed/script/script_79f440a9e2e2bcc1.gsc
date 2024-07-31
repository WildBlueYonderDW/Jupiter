#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using script_10ec51ef4ae45a4d;
#using script_3e122cc226e7fe52;
#using script_714304f79673b662;
#using script_5d19350ee07a23f8;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_17a5c83925bc5d5b;

// Namespace namespace_17a5c83925bc5d5b / namespace_932063bcf3e37dcd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x201
// Size: 0xc8
function main() {
    namespace_9f23cf9f86c2a493::main();
    namespace_fa28ed6b82c64fae::main();
    namespace_26bcd3ae12e8c1f8::main();
    namespace_d4369ea5130e1b06::main();
    scripts\mp\load::main();
    level.var_ca0420748e3190ed = getstructarray("dcover_invalid_struct", "targetname");
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_zooquarium");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level thread function_713f089988ee955e();
}

// Namespace namespace_17a5c83925bc5d5b / namespace_932063bcf3e37dcd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d1
// Size: 0xb0
function function_713f089988ee955e() {
    level endon("game_ended");
    var_994221fd735ca3bb = getent("delta_windmill_01_axle", "targetname");
    parts = getentarray("delta_windmill_01_part", "targetname");
    var_994221fd735ca3bb forcenetfieldhighlod(1);
    foreach (part in parts) {
        part linkto(var_994221fd735ca3bb);
        part forcenetfieldhighlod(1);
    }
    while (true) {
        var_994221fd735ca3bb rotateroll(360, 60);
        wait 60;
    }
}

