#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_4e8de969a844d61a;
#using script_41dead3a5715aff6;
#using script_7315db6ce505a35c;
#using scripts\mp\load.gsc;
#using scripts\mp\compass.gsc;

#namespace namespace_2f6bdda12167cd52;

// Namespace namespace_2f6bdda12167cd52 / namespace_4d9983e48517f241
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17a
// Size: 0x99
function main() {
    namespace_f9acfb401365b826::main();
    namespace_a16091024e915184::main();
    namespace_497591ecd8577392::main();
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

