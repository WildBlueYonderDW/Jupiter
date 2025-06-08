#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_rundown\gen\mp_jup_rundown_art;
#using scripts\mp\maps\mp_jup_rundown\mp_jup_rundown_fx;
#using scripts\mp\maps\mp_jup_rundown\mp_jup_rundown_lighting;
#using scripts\mp\spawnlogic;
#using scripts\mp\utility\game;

#namespace mp_jup_rundown;

// Namespace mp_jup_rundown / scripts\mp\maps\mp_jup_rundown\mp_jup_rundown
// Params 0
// Checksum 0x0, Offset: 0x1b6
// Size: 0xa8
function main()
{
    scripts\mp\maps\mp_jup_rundown\gen\mp_jup_rundown_art::main();
    scripts\mp\maps\mp_jup_rundown\mp_jup_rundown_fx::main();
    scripts\mp\maps\mp_jup_rundown\mp_jup_rundown_lighting::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    level.kill_border_triggers = getentarray( "kill_border_trigger", "targetname" );
    scripts\mp\compass::setupminimap( "compass_map_mp_jup_rundown" );
    setdvar( @"hash_7686fcb92ccc5edb", 8 );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread function_b2d0d10e6da4e389();
}

// Namespace mp_jup_rundown / scripts\mp\maps\mp_jup_rundown\mp_jup_rundown
// Params 0
// Checksum 0x0, Offset: 0x266
// Size: 0x11a
function function_b2d0d10e6da4e389()
{
    spawns = [];
    
    if ( getbasegametype() == "koth" )
    {
        var_a49ec225ecf23882 = scripts\mp\spawnlogic::getspawnpointarray( "mp_koth_spawn" );
        
        foreach ( spawnpoint in var_a49ec225ecf23882 )
        {
            if ( !isdefined( spawnpoint.script_noteworthy ) || spawnpoint.script_noteworthy == "" )
            {
                spawn_origin = getoriginidentifierstring( spawnpoint );
                level.modifiedspawnpoints[ spawn_origin ][ spawnpoint.classname ][ "remove" ] = 1;
                spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_koth_spawn", spawnpoint.origin + anglestoforward( spawnpoint.angles ) * 2, spawnpoint.angles, undefined, "5" );
            }
        }
        
        if ( spawns.size > 0 )
        {
            scripts\mp\spawnlogic::addscriptedspawnpoints( spawns );
        }
    }
}

