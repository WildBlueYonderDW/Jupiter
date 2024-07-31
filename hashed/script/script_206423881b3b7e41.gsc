#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_6506fbaded86192e;
#using script_32f6c66be439f6e2;
#using script_3d279674c0018078;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_75e6ed796c8551d6;

// Namespace namespace_75e6ed796c8551d6 / namespace_7cedf57e0821e35d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x178
// Size: 0xb1
function main() {
    namespace_f8c54b92ff79f0d2::main();
    namespace_29088e7c727ecce8::main();
    namespace_39af6535c32474f6::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_urca");
    setdvar(@"r_umbraMinObjectContribution", 8);
    setdvar(@"r_umbraAccurateOcclusionThreshold", 512);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

