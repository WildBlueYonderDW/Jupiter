#using scripts\common\callbacks;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\compass;
#using scripts\mp\load;

#namespace mp_jup_fort;

// Namespace mp_jup_fort / scripts\mp\maps\mp_jup_fort\mp_jup_fort
// Params 0
// Checksum 0x0, Offset: 0x12c
// Size: 0x5b
function main()
{
    level.var_b017944f02bb5e97 = 1;
    scripts\mp\compass::setupminimap( "compass_map_mp_jup_fort" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    scripts\cp_mp\utility\game_utility::function_35f5b4e643757db7();
    scripts\mp\load::main();
}

