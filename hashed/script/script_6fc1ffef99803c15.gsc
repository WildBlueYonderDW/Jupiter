#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_468934889d71b78;
#using script_38a8681fd881232e;
#using script_5247c3a9848fc6f4;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace mp_shoothouse2;

// Namespace mp_shoothouse2 / namespace_b17a5999f54cbbb9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x164
// Size: 0x87
function main() {
    namespace_8c05f97002876eb4::main();
    namespace_d3522a399fd463ac::main();
    namespace_dacdd6f9fa23cd1a::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_shoothouse2");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

