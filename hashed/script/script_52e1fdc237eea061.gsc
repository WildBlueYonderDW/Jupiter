#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_330f23498ceb121a;
#using script_56c65b5981c1b142;
#using script_6d86b78b9f562458;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_c229a2cd880586e6;

// Namespace namespace_c229a2cd880586e6 / namespace_e0cce41f865afda5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x174
// Size: 0x8e
function main() {
    namespace_4fd1de940f5123be::main();
    namespace_667f6f0d9ec5ef00::main();
    namespace_3a5f8aa6b68676ce::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_trainingfacility");
    scripts\cp_mp\utility\game_utility::registerarenamap();
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

