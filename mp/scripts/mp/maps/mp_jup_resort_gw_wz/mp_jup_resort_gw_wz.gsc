#using scripts\common\create_script_utility;
#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\compass;
#using scripts\mp\gametypes\arm;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_resort_gw\gen\mp_jup_resort_gw_art;
#using scripts\mp\maps\mp_jup_resort_gw\mp_jup_resort_gw_fx;
#using scripts\mp\maps\mp_jup_resort_gw\mp_jup_resort_gw_lighting;
#using scripts\mp\maps\mp_jup_resort_gw\mp_jup_resort_gw_precache;
#using scripts\mp\maps\mp_jup_resort_gw_wz\mp_jup_resort_gw_wz_create_script;
#using scripts\mp\spawnlogic;
#using scripts\mp\utility\game;

#namespace mp_jup_resort_gw_wz;

// Namespace mp_jup_resort_gw_wz / scripts\mp\maps\mp_jup_resort_gw_wz\mp_jup_resort_gw_wz
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed
// Size: 0x196
function main()
{
    scripts\mp\maps\mp_jup_resort_gw\mp_jup_resort_gw_precache::main();
    scripts\mp\maps\mp_jup_resort_gw\gen\mp_jup_resort_gw_art::main();
    scripts\mp\maps\mp_jup_resort_gw\mp_jup_resort_gw_fx::main();
    scripts\mp\maps\mp_jup_resort_gw\mp_jup_resort_gw_lighting::main();
    scripts\mp\load::main();
    scripts\cp_mp\utility\game_utility::registerlargemap();
    scripts\cp_mp\utility\game_utility::function_3673befc7dcade8b();
    
    if ( function_a7caa13ebe4c4ba5() || isgroundwarcoremode() )
    {
        if ( !isdefined( scripts\cp_mp\utility\game_utility::getlocaleid() ) )
        {
            if ( getgametype() == "gwtdm" )
            {
                setdvar( @"hash_6beec004cdf37c0", 188 );
                thread function_40066db0bee45b43( "locale_188" );
            }
            else
            {
                setdvar( @"hash_6beec004cdf37c0", 187 );
                thread function_40066db0bee45b43( "locale_187" );
            }
        }
        
        scripts\mp\gametypes\arm::arm_initoutofbounds();
    }
    else
    {
        level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
        level.kill_border_triggers = getentarray( "kill_border_trigger", "targetname" );
        setdvar( @"hash_9365c7a237edaa2f", 1 );
        level.parachutecancutautodeploy = 1;
        level.parachutecancutparachute = 1;
    }
    
    scripts\common\create_script_utility::initialize_create_script();
    level thread scripts\mp\maps\mp_jup_resort_gw_wz\mp_jup_resort_gw_wz_create_script::main();
    scripts\mp\compass::setupminimap( "compass_map_mp_jup_resort_gw" );
    setdvar( @"hash_7686fcb92ccc5edb", 8 );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    setdvar( @"hash_be80c9650d91b8ac", 5000 );
    level.var_56bcdc219d432f80[ "axis" ] = 15;
    level.var_56bcdc219d432f80[ "allies" ] = 15;
}

// Namespace mp_jup_resort_gw_wz / scripts\mp\maps\mp_jup_resort_gw_wz\mp_jup_resort_gw_wz
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38b
// Size: 0x6b
function function_40066db0bee45b43( var_3d727559df866469 )
{
    var_e83ef41f3bc3a833 = ( -31284, 30812, 6308 );
    var_94125ea344e827da = "airstrikeheight";
    airstrikeheight = spawn_script_origin( var_e83ef41f3bc3a833, ( 0, 0, 0 ) );
    airstrikeheight.targetname = var_94125ea344e827da;
    airstrikeheight.script_noteworthy = var_3d727559df866469;
}

