#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_657b7e6f27cb96d0;
#using script_398c0ee8e7c4ad9e;
#using script_31e98bc0f90fdd24;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_79ebdcd2992be0cc;

// Namespace namespace_79ebdcd2992be0cc / namespace_f4ad60dbf515efb9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0x87
function main() {
    namespace_653a5ceb3b4eefd4::main();
    namespace_97c713748dd01fac::main();
    namespace_8e80c5e8ccb4a91a::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_paris");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

