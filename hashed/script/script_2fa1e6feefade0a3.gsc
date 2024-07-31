#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\anim.gsc;
#using script_73cf2ad01a9c42c2;
#using script_314b8e4f5302c210;
#using script_5c081cebbed6572e;
#using scripts\mp\load.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_5bc19770215cada1;

// Namespace namespace_5bc19770215cada1 / namespace_226ca906012d3bd7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1
// Size: 0xa6
function main() {
    namespace_f846d36b8730246::main();
    namespace_58e6141db730d286::main();
    namespace_ab9d35d69293bb6c::main();
    scripts\mp\load::main();
    scripts\cp_mp\utility\game_utility::function_35f564beac680d88();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_security_area");
    setdvar(@"r_umbraMinObjectContribution", 8);
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
}

