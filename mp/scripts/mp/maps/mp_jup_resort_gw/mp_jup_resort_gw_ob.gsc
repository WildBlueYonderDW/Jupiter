#using script_2047cdbf5176ba0;
#using script_31b70210f1726bd2;
#using script_62a4f7a62643fe8;
#using script_92b815b18f0ba61;
#using script_badad75eef11559;
#using scripts\common\callbacks;
#using scripts\cp_mp\agents\ai_spawn_director;
#using scripts\engine\utility;

#namespace mp_jup_resort_gw_ob;

// Namespace mp_jup_resort_gw_ob / scripts\mp\maps\mp_jup_resort_gw\mp_jup_resort_gw_ob
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xfd
// Size: 0x10
function autoexec init()
{
    level.var_b59297aa6933406b = &main;
}

// Namespace mp_jup_resort_gw_ob / scripts\mp\maps\mp_jup_resort_gw\mp_jup_resort_gw_ob
// Params 0
// Checksum 0x0, Offset: 0x115
// Size: 0x57
function main()
{
    function_eb7f544259415a09( "mp_jup_bigmap_ob" );
    
    if ( getdvarint( @"hash_f0651c120dc93a94", 0 ) )
    {
        namespace_f0893f8b59f579e9::function_3ececb453fbf07fe();
        namespace_6d31e91c26415292::main();
        namespace_609a41b1d504a8a3::function_429e921f8ad411ff();
        thread namespace_faa32e45e1d64c2::init( 1, undefined, 1 );
        return;
    }
    
    level flag_wait( "ai_spawn_director_initialized" );
    thread scripts\cp_mp\agents\ai_spawn_director::process_create_script();
}

