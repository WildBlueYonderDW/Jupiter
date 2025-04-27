#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\agents\agent_utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_jup_rust_alt\gen\mp_jup_rust_alt_art;
#using scripts\mp\maps\mp_jup_rust_alt\mp_jup_rust_alt_fx;
#using scripts\mp\maps\mp_jup_rust_alt\mp_jup_rust_alt_lighting;
#using scripts\mp\spawnlogic;
#using scripts\mp\utility\game;

#namespace mp_jup_rust_alt;

// Namespace mp_jup_rust_alt / scripts\mp\maps\mp_jup_rust_alt\mp_jup_rust_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7
// Size: 0xb8
function main()
{
    scripts\mp\maps\mp_jup_rust_alt\gen\mp_jup_rust_alt_art::main();
    scripts\mp\maps\mp_jup_rust_alt\mp_jup_rust_alt_fx::main();
    scripts\mp\maps\mp_jup_rust_alt\mp_jup_rust_alt_lighting::main();
    scripts\mp\load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    scripts\mp\compass::setupminimap( "compass_map_mp_jup_rust_alt" );
    setdvar( @"hash_7686fcb92ccc5edb", 8 );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    scripts\cp_mp\utility\game_utility::registersmallmap();
    
    if ( getdvarint( @"hash_75c08b5d09e65c6c", 1 ) == 1 )
    {
        level.var_e886c825dc0634c0 = 1;
    }
    
    level thread function_31dc060e85f4a689();
}

// Namespace mp_jup_rust_alt / scripts\mp\maps\mp_jup_rust_alt\mp_jup_rust_alt
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7
// Size: 0x413
function function_31dc060e85f4a689()
{
    spawns = [];
    
    switch ( getbasegametype() )
    {
        case #"hash_1a5d186c17c00d3c":
            break;
        case #"hash_a1313b745c17c07e":
            break;
        case #"hash_fa50b0f6bd82e972":
        case #"hash_fa50baf6bd82f930":
            break;
        case #"hash_2fcf99fb5dbdcffb":
        case #"hash_3a17de6e294210d2":
        case #"hash_515260130b210bff":
        case #"hash_7485fa6c474ec865":
        case #"hash_973d1db8b6644466":
        case #"hash_b0eb18371d980895":
        case #"hash_b9458959b10637f8":
        case #"hash_c3668076a0827ce0":
        case #"hash_dd5b900f435d3f36":
        case #"hash_ddd385f0a27d71bb":
        case #"hash_ea061d29bbd1f237":
        case #"hash_ec24570718a340f5":
            break;
        case #"hash_6efb0f59a62300fb":
        case #"hash_fa34c5f6bd6d4432":
            break;
        case #"hash_c51506c10984515":
        case #"hash_21eed743fb721f4a":
        case #"hash_31104ebc01bd9ba9":
        case #"hash_3696c16c262a0862":
        case #"hash_77eb1179a728005e":
        case #"hash_fa0ed9f6bd4f4e9a":
        case #"hash_fb5b5e6c07253005":
            level.modifiedspawnpoints[ "580 -95" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            level.modifiedspawnpoints[ "1288 -165" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            level.modifiedspawnpoints[ "1618 509" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            level.modifiedspawnpoints[ "852 932" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            level.modifiedspawnpoints[ "1129 1799" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            level.modifiedspawnpoints[ "-201 -57" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            level.modifiedspawnpoints[ "860 604" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            level.modifiedspawnpoints[ "1746 1148" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            level.modifiedspawnpoints[ "148 1472" ][ "mp_dm_spawn_start" ][ "remove" ] = 1;
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( 1372, 1539.5, 51 ), ( 0, 180, 0 ), undefined, undefined );
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( 1515.5, 922, 31 ), ( 0, 90, 0 ), undefined, undefined );
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( 1553.5, -52, 30.2574 ), ( 0, 90, 0 ), undefined, undefined );
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( 1055.5, 880, 53.343 ), ( 0, 28, 0 ), undefined, undefined );
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( 838, 494.5, 38.5457 ), ( 0, 0, 0 ), undefined, undefined );
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( 572, -27.5, 70 ), ( 0, 0, 0 ), undefined, undefined );
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( -186, -57.5, 45.3439 ), ( 0, 342, 0 ), undefined, undefined );
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( -246, 1004.5, 45.3439 ), ( 0, 0, 0 ), undefined, undefined );
            spawns[ spawns.size ] = scripts\mp\spawnlogic::createscriptedspawnpoint( "mp_dm_spawn_start", ( -100, 1780.5, 19.9797 ), ( 0, 0, 0 ), undefined, undefined );
            break;
        case #"hash_f4a9126c03d3385b":
            break;
    }
    
    if ( spawns.size > 0 )
    {
        scripts\mp\spawnlogic::addscriptedspawnpoints( spawns );
    }
}

