#using script_4e8de969a844d61a;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_derail\mp_jup_derail_fx;
#using scripts\mp\maps\mp_jup_derail\mp_jup_derail_lighting;

#namespace mp_jup_derail;

// Namespace mp_jup_derail / scripts\mp\maps\mp_jup_derail\mp_jup_derail
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17a
// Size: 0x99
function main() {
    namespace_f9acfb401365b826::main();
    scripts\mp\maps\mp_jup_derail\mp_jup_derail_fx::main();
    scripts\mp\maps\mp_jup_derail\mp_jup_derail_lighting::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    level.kill_border_triggers = getentarray("kill_border_trigger", "targetname");
    scripts\mp\compass::setupminimap("compass_map_mp_jup_derail");
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    level.ttlos_suppressasserts = 1;
}

