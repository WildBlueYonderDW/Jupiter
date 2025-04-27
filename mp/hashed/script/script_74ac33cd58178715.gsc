#using script_137b22598c1ad811;
#using script_2047cdbf5176ba0;
#using script_22f1701e151b9d12;
#using script_2816a042b9f7996;
#using script_43ff2abb883f6e70;
#using script_4b9ba3e93e27bf79;
#using script_62a4f7a62643fe8;
#using script_6cacd83c740d5239;
#using script_6ccb901b5b948f50;
#using script_77cff22e154e94df;
#using script_7ff1c5399d2d9500;
#using script_92b815b18f0ba61;
#using scripts\common\callbacks;
#using scripts\engine\utility;

#namespace namespace_9025d36a6a08d37d;

// Namespace namespace_9025d36a6a08d37d / namespace_b2033386a8301a0b
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x250
// Size: 0x10
function autoexec init()
{
    level.var_c61c1ef4d4aaec8f = &main;
}

// Namespace namespace_9025d36a6a08d37d / namespace_b2033386a8301a0b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x268
// Size: 0x108
function main()
{
    function_eb7f544259415a09( "mp_jup_bigmap_ob" );
    level thread function_119594974f1048e4();
    namespace_a8cf1dfd1cca638a::main();
    namespace_9a0d4e1a2d76ab09::main();
    namespace_e999d8dfe317a9c1::main();
    scripts\engine\utility::flag_set( "gas_station_create_script_initialized" );
    level callback::add( "register_activities", &function_98dce043b7f26498 );
    level callback::add( "register_objectives", &function_ecac04e0ca8cce3 );
    level callback::add( "register_features", &function_78d8a7de4d17b72 );
    function_3c4623aaf1b2a9ad();
    namespace_7a1eecd8c2a5b9c::main();
    thread namespace_6776e8e74ed64842::init();
    
    if ( getdvar( @"hash_b656ae1ef74dda84", "0" ) == "1" )
    {
        thread namespace_6776e8e74ed64842::init();
        thread namespace_fc8edd9c56ed42bb::main();
    }
    
    if ( getdvar( @"hash_6ffd9adb060c50c9", "0" ) == "1" )
    {
        namespace_53bdc92c472f7f73::main();
        thread namespace_d7e80b14e1130dc4::init();
    }
    
    thread function_418a018c60144943();
    var_21af87bdbe252cf2 = getstructarray( "vehicle_group_f", "script_noteworthy" );
    level thread namespace_f9b6a4254d2d8100::function_63c6d4fbc0bc4d94( var_21af87bdbe252cf2 );
}

// Namespace namespace_9025d36a6a08d37d / namespace_b2033386a8301a0b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x378
// Size: 0x129
function function_119594974f1048e4()
{
    setdvar( @"hash_f1d095735ac37f33", 1 );
    waitframe();
    function_9b8829ab4092a7d7( "ob_zombie_ambient", 1 );
    a_pos = scripts\engine\utility::getstructarray( "s_ob_infil_supress", "targetname" );
    
    foreach ( pos in a_pos )
    {
        function_606642b946a01237( "infil_supress", pos.origin, pos.radius, 1 );
    }
    
    var_102014ab68ac4b78 = scripts\engine\utility::getstructarray( "s_ambient_blocker", "targetname" );
    
    foreach ( pos in var_102014ab68ac4b78 )
    {
        if ( isdefined( pos.radius ) )
        {
            function_606642b946a01237( "ambient_blocker", pos.origin, pos.radius, 1 );
        }
    }
}

// Namespace namespace_9025d36a6a08d37d / namespace_b2033386a8301a0b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a9
// Size: 0x10
function function_418a018c60144943()
{
    function_4486c88d950ef33f();
    namespace_614554f86e52695c::process_create_script();
}

// Namespace namespace_9025d36a6a08d37d / namespace_b2033386a8301a0b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c1
// Size: 0xe
function function_4486c88d950ef33f()
{
    flag_wait( "mp_jup_st_f_ob_contracts_merc_defend_cs_completed" );
}

