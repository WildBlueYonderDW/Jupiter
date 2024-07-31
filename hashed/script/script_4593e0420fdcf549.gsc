#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_38b56eec6d87923e;
#using script_425a6431ff8ecb9a;
#using script_5cf5a19ca055da30;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_68db28eccf227537;

// Namespace namespace_68db28eccf227537 / namespace_a5a24a90d446f4e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x181
// Size: 0x9f
function main() {
    namespace_904610c1c03c2aa2::main();
    namespace_f72f73bfa4398f40::main();
    namespace_a61c1c8d2f5d150e::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_das_haus_alien");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

