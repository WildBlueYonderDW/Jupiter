#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\compass.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\load.gsc;

#namespace mp_jup_sira;

// Namespace mp_jup_sira / namespace_82fd7e81cd6db0e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b
// Size: 0x5b
function main() {
    level.var_b017944f02bb5e97 = 1;
    scripts\mp\compass::setupminimap("compass_map_mp_jup_sira");
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    scripts\cp_mp\utility\game_utility::function_35f5b4e643757db7();
    scripts\mp\load::main();
}

