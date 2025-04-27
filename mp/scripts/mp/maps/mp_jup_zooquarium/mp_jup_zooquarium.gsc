#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\anim;
#using scripts\mp\compass;
#using scripts\mp\flags;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_zooquarium\gen\mp_jup_zooquarium_art;
#using scripts\mp\maps\mp_jup_zooquarium\mp_jup_zooquarium_fx;
#using scripts\mp\maps\mp_jup_zooquarium\mp_jup_zooquarium_lighting;
#using scripts\mp\maps\mp_jup_zooquarium\mp_jup_zooquarium_precache;
#using scripts\mp\utility\game;

#namespace mp_jup_zooquarium;

// Namespace mp_jup_zooquarium / scripts\mp\maps\mp_jup_zooquarium\mp_jup_zooquarium
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x201
// Size: 0xc8
function main()
{
    scripts\mp\maps\mp_jup_zooquarium\mp_jup_zooquarium_precache::main();
    scripts\mp\maps\mp_jup_zooquarium\gen\mp_jup_zooquarium_art::main();
    scripts\mp\maps\mp_jup_zooquarium\mp_jup_zooquarium_fx::main();
    scripts\mp\maps\mp_jup_zooquarium\mp_jup_zooquarium_lighting::main();
    scripts\mp\load::main();
    level.var_ca0420748e3190ed = getstructarray( "dcover_invalid_struct", "targetname" );
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    level.kill_border_triggers = getentarray( "kill_border_trigger", "targetname" );
    scripts\mp\compass::setupminimap( "compass_map_mp_jup_zooquarium" );
    setdvar( @"hash_7686fcb92ccc5edb", 8 );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread function_713f089988ee955e();
}

// Namespace mp_jup_zooquarium / scripts\mp\maps\mp_jup_zooquarium\mp_jup_zooquarium
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d1
// Size: 0xb0
function function_713f089988ee955e()
{
    level endon( "game_ended" );
    axle = getent( "delta_windmill_01_axle", "targetname" );
    parts = getentarray( "delta_windmill_01_part", "targetname" );
    axle forcenetfieldhighlod( 1 );
    
    foreach ( part in parts )
    {
        part linkto( axle );
        part forcenetfieldhighlod( 1 );
    }
    
    while ( true )
    {
        axle rotateroll( 360, 60 );
        wait 60;
    }
}

