#using scripts\common\devgui;
#using scripts\common\powerups;
#using scripts\cp_mp\magicbox;
#using scripts\cp_mp\powerups\powerups;
#using scripts\engine\utility;

#namespace fire_sale;

// Namespace fire_sale / scripts\cp_mp\powerups\fire_sale
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x10e
// Size: 0x9
function autoexec main()
{
    function_3eca05f9ae1998ea();
}

// Namespace fire_sale / scripts\cp_mp\powerups\fire_sale
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f
// Size: 0x5a
function function_3eca05f9ae1998ea()
{
    register_powerup( "fire_sale", &grab_fire_sale, &function_c68bab44a377354f );
    
    /#
        function_6e7290c8ee4f558b( "<dev string:x1c>" );
        function_b23a59dfb4ca49a1( "<dev string:x2f>", "<dev string:x4e>", &function_e2b8eeccc951133f );
        function_b23a59dfb4ca49a1( "<dev string:x71>", "<dev string:x90>", &function_e2b8eeccc951133f );
        function_fe953f000498048f();
    #/
}

// Namespace fire_sale / scripts\cp_mp\powerups\fire_sale
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x181
// Size: 0x33, Type: bool
function function_c68bab44a377354f()
{
    if ( flag( "magicbox_moving" ) || flag( "powerup_fire_sale_active" ) || level.var_75e032c5035207fe < 1 )
    {
        return false;
    }
    
    return true;
}

// Namespace fire_sale / scripts\cp_mp\powerups\fire_sale
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd
// Size: 0x1b
function grab_fire_sale( str_powerup, ent_powerup )
{
    thread run_fire_sale();
}

// Namespace fire_sale / scripts\cp_mp\powerups\fire_sale
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0
// Size: 0xf9
function run_fire_sale()
{
    level notify( "run_fire_sale" );
    level endon( "run_fire_sale" );
    flag_set( "powerup_fire_sale_active" );
    level thread scripts\cp_mp\magicbox::firesale_start();
    root = function_ecdae672c660149e();
    n_lifetime = root.powerups[ "fire_sale" ].var_f862e718db266e0a;
    
    if ( isdefined( level.powerup_timeout_override ) )
    {
        n_lifetime = self [[ level.powerup_timeout_override ]]( n_lifetime );
    }
    
    a_players = function_a56a8b17eae57b09( "fire_sale" );
    
    foreach ( player in a_players )
    {
        player thread function_676437737684783f( "fire_sale", n_lifetime );
    }
    
    level waittill_any_timeout_1( n_lifetime, "end_fire_sale" );
    flag_clear( "powerup_fire_sale_active" );
}

