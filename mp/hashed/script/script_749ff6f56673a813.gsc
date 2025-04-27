#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_22f1701e151b9d12;
#using script_3ab210ea917601e7;
#using script_3e31016b9c11a616;
#using script_41387eecc35b88bf;
#using script_4ef01fe6151dde4d;
#using script_53aac5ae7d2ac1b4;
#using script_64acb6ce534155b7;
#using script_749ff6f56673a813;
#using script_7956d56c4922bd1;
#using scripts\anim\utility_common;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vehicle_code;
#using scripts\cp_mp\agents\agent_utils;
#using scripts\cp_mp\calloutmarkerping;
#using scripts\cp_mp\content_manager;
#using scripts\cp_mp\interaction;
#using scripts\cp_mp\overlord;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\squad_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\vehicles\vehicle_damage;
#using scripts\cp_mp\vehicles\vehicle_interact;
#using scripts\cp_mp\vehicles\vehicle_occupancy;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\utility;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\mp_agent;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\outofbounds;
#using scripts\mp\utility\player;

#namespace exfil;

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1468
// Size: 0x175
function init_exfil()
{
    flag_init( "exfil_initialized" );
    namespace_70aa82e7f409bc33::function_86f446036c3c25a3( level.var_f823a30649b48284, level.var_3a96331857b5f453 );
    registeractivitytype( "REV_OB_EXFIL", &function_4b7ee60fbfb23129 );
    scripts\cp_mp\content_manager::register_script( "exfil", &function_a61e7ab12361f107 );
    level.var_2562ea48235e90b5 = [];
    level.var_b8b3ed33712220d8 = [];
    level.var_44194c664b77bf1b = [];
    level.var_250dc4a23947d41 = [];
    level.var_dc9d9add8a02556a = 1;
    callback::add( "player_spawned", &on_player_spawned );
    callback::add( "player_disconnect", &on_player_disconnect );
    callback::add( "on_ai_killed", &on_ai_killed );
    callback::add( "on_zombie_ai_damaged", &on_ai_damaged );
    callback::add( "on_turned", &function_65ec7747ff7a397a );
    setdvarifuninitialized( @"hash_bc321023e9100f4", 0 );
    setdvarifuninitialized( @"hash_ab8956c864b4d3a4", 0 );
    setdvarifuninitialized( @"hash_348544f95be5e424", 0 );
    var_df3db7e4827942b6 = getentarray( "walkable_heli_navmesh", "targetname" );
    
    foreach ( var_e9fc2f7678426142 in var_df3db7e4827942b6 )
    {
        var_e9fc2f7678426142 notsolid();
        var_e9fc2f7678426142 hide();
    }
    
    level thread function_ec1e9e6af7af5cf();
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e5
// Size: 0x18, Type: bool
function function_8d3b8265c47a2223()
{
    if ( getdvarint( @"hash_348544f95be5e424", 0 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1606
// Size: 0x48, Type: bool
function function_4027f5445bb7c8fb( s_exfil )
{
    if ( isdefined( s_exfil ) && isdefined( s_exfil.instance ) && is_equal( s_exfil.instance.script_noteworthy, "quest_exfil" ) )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1657
// Size: 0x133
function start_exfil_defend_mode( s_exfil )
{
    s_exfil notify( "endon_start_exfil_defend_mode" );
    s_exfil endon( "endon_start_exfil_defend_mode" );
    
    while ( !isdefined( s_exfil.var_576f57af0204c38c ) )
    {
        wait 0.5;
    }
    
    s_exfil.var_576f57af0204c38c endon( "death" );
    
    if ( !istrue( s_exfil.var_1265336893f89f10 ) )
    {
        s_exfil.var_576f57af0204c38c ent_flag_wait( "landed" );
    }
    
    var_514253bf9141a3c4 = isdefined( s_exfil.var_81fff6332116316f ) ? s_exfil.var_81fff6332116316f : 35;
    
    if ( isdefined( s_exfil.var_651b83653ae1f156 ) )
    {
        var_514253bf9141a3c4 = [[ s_exfil.var_651b83653ae1f156 ]]( s_exfil );
    }
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        if ( isalive( player ) && player.sessionstate == "playing" )
        {
            player thread exfil_timer_player_ui( var_514253bf9141a3c4, s_exfil );
        }
    }
    
    level thread exfil_timer( s_exfil, var_514253bf9141a3c4 );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1792
// Size: 0x84
function function_4b7ee60fbfb23129()
{
    function_89384091f7a2dbd( "REV_OB_EXFIL", 0, &function_d7bf9b4af85cbf07 );
    function_89384091f7a2dbd( "REV_OB_EXFIL", 1, &function_45d940ec8c857432 );
    function_89384091f7a2dbd( "REV_OB_EXFIL", 2, &function_b256cf67627a5412 );
    function_89384091f7a2dbd( "REV_OB_EXFIL", 3, &function_10752dbaaf34420f );
    function_89384091f7a2dbd( "REV_OB_EXFIL", 4, &function_ea8918a722bcbeed );
    
    if ( isdefined( level.var_132e390bddaa01b5 ) )
    {
        function_89384091f7a2dbd( "REV_OB_EXFIL", 5, level.var_132e390bddaa01b5 );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x181e
// Size: 0x4c
function function_415547ee4122c2ca()
{
    difficulty_region = undefined;
    
    if ( isdefined( level.var_fac39a693f085779 ) )
    {
        difficulty_region = [[ level.var_fac39a693f085779 ]]( function_ea8918a722bcbeed() );
    }
    
    if ( !isdefined( difficulty_region ) || is_equal( difficulty_region, "difficulty_undefined" ) )
    {
        return "difficulty_easy";
    }
    
    return difficulty_region;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1873
// Size: 0x19
function function_d7bf9b4af85cbf07()
{
    self.difficulty_region = function_415547ee4122c2ca();
    function_b6fc2c96b463c007( self );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1894
// Size: 0x27
function on_player_disconnect( params )
{
    if ( isdefined( self.var_a4408405ef23e289 ) )
    {
        self.var_a4408405ef23e289 delete();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18c3
// Size: 0x54
function on_player_spawned( params )
{
    self endon( "death_or_disconnect" );
    
    /#
        flag_wait( "<dev string:x1c>" );
        
        if ( level.var_dc9d9add8a02556a && isarray( level.var_2562ea48235e90b5 ) && level.var_2562ea48235e90b5.size )
        {
            function_dc9d9add8a02556a();
        }
    #/
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x191f
// Size: 0x69
function function_7d7775bea2f0ecca( str_name )
{
    foreach ( s_exfil in level.var_2562ea48235e90b5 )
    {
        if ( s_exfil.name == str_name )
        {
            return s_exfil;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1990
// Size: 0xb4
function function_dd773e92c0ad5582( str_name, var_6f43094370856dfe, var_6f430a4370857031 )
{
    n_ent_num = 0;
    
    if ( isdefined( var_6f43094370856dfe ) && isdefined( var_6f430a4370857031 ) )
    {
        n_ent_num = int( var_6f430a4370857031 );
    }
    else if ( isdefined( var_6f43094370856dfe ) )
    {
        n_ent_num = int( var_6f43094370856dfe );
    }
    
    foreach ( player in level.players )
    {
        if ( player.name == str_name || player getentitynumber() == n_ent_num )
        {
            return player;
        }
    }
}

/#

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1a4c
    // Size: 0x1ed, Type: dev
    function function_a19741910eb710b4()
    {
        function_6e7290c8ee4f558b( "<dev string:x32>" );
        function_a9a864379a098ad6( "<dev string:x42>", "<dev string:x58>", &function_a3523c367b28d76a, 1 );
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b( "<dev string:x6e>" );
        
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            s_exfil function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1( s_exfil.name, "<dev string:x95>" + s_exfil.name + "<dev string:xa8>", &function_29cada162a27a32 );
        }
        
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b( "<dev string:xb2>" );
        
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            s_exfil function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1( s_exfil.name, "<dev string:x95>" + s_exfil.name + "<dev string:xde>", &function_29cada162a27a32 );
        }
        
        function_fe953f000498048f();
        function_6e7290c8ee4f558b( "<dev string:xe7>" );
        
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            s_exfil function_c4228da55910ea6b();
            function_b23a59dfb4ca49a1( s_exfil.name, "<dev string:x110>" + s_exfil.name + "<dev string:xde>", &function_c68e0d71575a2ff4 );
        }
        
        function_fe953f000498048f();
        waitframe();
        flag_set( "<dev string:x1c>" );
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c41
    // Size: 0x7e4, Type: dev
    function function_a3523c367b28d76a()
    {
        var_39239d1f90650b = ( 0, 0, 4 );
        var_e33953429ed350f = 0.25;
        
        while ( true )
        {
            foreach ( s_exfil in level.var_2562ea48235e90b5 )
            {
                if ( !isdefined( s_exfil.var_d182b8d3f3aaa93b ) )
                {
                    continue;
                }
                
                var_d8b783bf56b63a71 = "<dev string:x12d>";
                
                if ( isent( s_exfil.var_d182b8d3f3aaa93b.interact ) && s_exfil.var_d182b8d3f3aaa93b.interact tagexists( "<dev string:x13b>" ) )
                {
                    v_position = s_exfil.var_d182b8d3f3aaa93b gettagorigin( "<dev string:x13b>" );
                    var_d8b783bf56b63a71 = "<dev string:x13b>";
                }
                else if ( isdefined( s_exfil.var_d182b8d3f3aaa93b.interact ) )
                {
                    v_position = s_exfil.var_d182b8d3f3aaa93b.interact.origin;
                }
                else
                {
                    v_position = s_exfil.origin;
                }
                
                if ( function_8d3b8265c47a2223() )
                {
                    var_10a09b4e9dcdf2ed = 394;
                }
                else
                {
                    var_10a09b4e9dcdf2ed = 64;
                }
                
                draw_circle( v_position, var_10a09b4e9dcdf2ed, ( 0, 0, 1 ), 1, 0, 1 );
                sphere( v_position, 200, ( 0, 0, 1 ) );
                print3d( v_position, "<dev string:x147>" + s_exfil.name, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                print3d( v_position - var_39239d1f90650b * 1, "<dev string:x157>" + s_exfil.var_c9164736baf0694a.size, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                print3d( v_position - var_39239d1f90650b * 2, "<dev string:x176>" + s_exfil.var_953c0bb9dec80174.size, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                print3d( v_position - var_39239d1f90650b * 3, "<dev string:x198>" + ter_op( istrue( s_exfil.var_1326008dc390c510 ), "<dev string:x1a7>", "<dev string:x1ae>" ), ( 0, 1, 0 ), 1, var_e33953429ed350f );
                
                if ( isdefined( s_exfil.s_exfil_destination ) )
                {
                    var_c566965043ea9831 = s_exfil.s_exfil_destination.origin;
                    var_640b35adafbb5c65 = 0;
                    
                    if ( isdefined( s_exfil.targetname ) && isdefined( getstruct( s_exfil.targetname + "<dev string:x1b4>", "<dev string:x1bd>" ) ) )
                    {
                        var_96f7284b1752c0c7 = getstruct( s_exfil.targetname + "<dev string:x1b4>", "<dev string:x1bd>" );
                        var_c566965043ea9831 = var_96f7284b1752c0c7.origin;
                    }
                    else if ( s_exfil.s_exfil_destination == s_exfil )
                    {
                        var_c566965043ea9831 -= var_39239d1f90650b * 4;
                        var_640b35adafbb5c65 = 1;
                    }
                    
                    if ( var_640b35adafbb5c65 )
                    {
                        print3d( var_c566965043ea9831, "<dev string:x1d2>", ( 0, 1, 0 ), 1, var_e33953429ed350f );
                    }
                    else
                    {
                        draw_circle( var_c566965043ea9831, 200, ( 0, 0, 1 ), 1, 0, 1 );
                        sphere( var_c566965043ea9831, 200, ( 0, 0, 1 ) );
                        line( v_position, var_c566965043ea9831 );
                        print3d( var_c566965043ea9831, "<dev string:x1fb>" + s_exfil.name, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                    }
                    
                    if ( !function_8d3b8265c47a2223() )
                    {
                        print3d( var_c566965043ea9831 - var_39239d1f90650b * 1, "<dev string:x215>" + function_9621ef0d09be048d( s_exfil ), ( 0, 1, 0 ), 1, var_e33953429ed350f );
                    }
                }
                else if ( isdefined( s_exfil.target2 ) )
                {
                    var_7b0a39123a9c2f88 = getstructarray( s_exfil.target2, "<dev string:x22a>" );
                    
                    foreach ( n_index, s_exfil_destination in var_7b0a39123a9c2f88 )
                    {
                        draw_circle( s_exfil_destination.origin, 200, ( 1, 0, 0 ), 1, 0, 1 );
                        sphere( s_exfil_destination.origin, 200, ( 1, 0, 0 ) );
                        line( v_position, s_exfil_destination.origin );
                        print3d( s_exfil_destination.origin, "<dev string:x238>" + n_index + "<dev string:x24f>" + s_exfil.name, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                    }
                }
                
                foreach ( player in s_exfil.var_c9164736baf0694a )
                {
                    if ( isplayer( player ) )
                    {
                        print3d( player.origin, "<dev string:x258>" + s_exfil.name, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                    }
                }
                
                s_exfil.var_ed2b93690e12fb86 = array_removedead_or_dying( s_exfil.var_ed2b93690e12fb86 );
                
                foreach ( ai in s_exfil.var_ed2b93690e12fb86 )
                {
                    if ( isalive( ai ) )
                    {
                        print3d( ai.origin, "<dev string:x258>" + s_exfil.name, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                        print3d( ai.origin - var_39239d1f90650b, "<dev string:x272>" + s_exfil.var_ed2b93690e12fb86.size, ( 0, 1, 0 ), 1, var_e33953429ed350f );
                    }
                }
                
                if ( isdefined( s_exfil.var_576f57af0204c38c ) )
                {
                    draw_circle( s_exfil.var_576f57af0204c38c.origin, 500, ( 0, 1, 0 ), 1, 0, 1 );
                    print3d( s_exfil.var_576f57af0204c38c.origin, s_exfil.var_576f57af0204c38c vehicle_getspeed() + "<dev string:x286>", ( 0, 1, 0 ), 1, var_e33953429ed350f * 4 );
                    
                    if ( isdefined( s_exfil.s_exfil_destination ) )
                    {
                        line( s_exfil.var_576f57af0204c38c.origin, s_exfil.s_exfil_destination.origin, ( 0, 1, 0 ) );
                        var_4163a1f601f054ed = s_exfil.var_576f57af0204c38c vehicle_getspeed();
                        
                        if ( var_4163a1f601f054ed > 0 )
                        {
                            var_2b2e9399c3f18884 = distance( s_exfil.var_576f57af0204c38c.origin, s_exfil.s_exfil_destination.origin ) / 63360;
                            var_465c08a30c93971a = var_2b2e9399c3f18884 / var_4163a1f601f054ed;
                            var_465c08a30c93971a *= 3600;
                            print3d( s_exfil.var_576f57af0204c38c.origin - var_39239d1f90650b, "<dev string:x28e>" + var_465c08a30c93971a + "<dev string:x2ae>", ( 0, 1, 0 ), 1, var_e33953429ed350f * 4 );
                        }
                    }
                }
            }
            
            waitframe();
        }
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x242d
    // Size: 0x427, Type: dev
    function function_dc9d9add8a02556a()
    {
        if ( istrue( self.var_fe5253691314ec55 ) )
        {
            return;
        }
        
        self.var_fe5253691314ec55 = 1;
        var_3352bf952cfc182a = default_to( self.name, "<dev string:x2ba>" + self getentitynumber() );
        function_6e7290c8ee4f558b( "<dev string:x2c5>" + var_3352bf952cfc182a + "<dev string:x2e1>" );
        
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            if ( isdefined( s_exfil.target2 ) )
            {
                var_fb43e2df572cabdf = getstructarray( s_exfil.target2, "<dev string:x22a>" );
                
                foreach ( n_index, s_exfil_destination in var_fb43e2df572cabdf )
                {
                    function_b23a59dfb4ca49a1( s_exfil.name + "<dev string:x2e6>" + n_index + "<dev string:x2fe>", "<dev string:x303>" + s_exfil.name + "<dev string:x313>" + var_3352bf952cfc182a + "<dev string:x313>" + n_index + "<dev string:x313>" + self getentitynumber(), &function_e86085969e06a72f );
                }
                
                continue;
            }
            
            function_b23a59dfb4ca49a1( s_exfil.name, "<dev string:x303>" + s_exfil.name + "<dev string:x313>" + var_3352bf952cfc182a + "<dev string:x313>" + self getentitynumber(), &function_e86085969e06a72f );
        }
        
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b( "<dev string:x318>" + var_3352bf952cfc182a + "<dev string:x2e1>" );
        
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            function_b23a59dfb4ca49a1( s_exfil.name, "<dev string:x333>" + s_exfil.name + "<dev string:x313>" + var_3352bf952cfc182a + "<dev string:x313>" + self getentitynumber(), &function_125c8891683ddba9 );
        }
        
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b( "<dev string:x342>" + var_3352bf952cfc182a + "<dev string:x2e1>" );
        
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            function_b23a59dfb4ca49a1( s_exfil.name, "<dev string:x360>" + s_exfil.name + "<dev string:x313>" + var_3352bf952cfc182a + "<dev string:x313>" + self getentitynumber(), &function_419da4ebcd2d6a49 );
        }
        
        function_fe953f000498048f();
        waitframe();
        function_6e7290c8ee4f558b( "<dev string:x372>" + var_3352bf952cfc182a + "<dev string:x2e1>" );
        
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            function_b23a59dfb4ca49a1( s_exfil.name, "<dev string:x396>" + s_exfil.name + "<dev string:x313>" + var_3352bf952cfc182a + "<dev string:x313>" + self getentitynumber(), &function_adcb708587848ffb );
        }
        
        function_fe953f000498048f();
        function_6e7290c8ee4f558b( "<dev string:x3a6>" + var_3352bf952cfc182a + "<dev string:x2e1>" );
        
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            function_b23a59dfb4ca49a1( s_exfil.name, "<dev string:x3ca>" + s_exfil.name + "<dev string:x313>" + var_3352bf952cfc182a + "<dev string:x313>" + self getentitynumber(), &function_7ce9ab45ae5f8406 );
        }
        
        function_fe953f000498048f();
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x285c
    // Size: 0xab, Type: dev
    function function_e86085969e06a72f( params )
    {
        s_exfil = function_7d7775bea2f0ecca( params[ 0 ] );
        player = function_dd773e92c0ad5582( params[ 1 ], params[ 2 ], params[ 3 ] );
        
        if ( isdefined( s_exfil ) )
        {
            if ( isdefined( params[ 2 ] ) && isdefined( params[ 3 ] ) )
            {
                s_exfil.var_2c60ad87c1ee7615 = int( params[ 2 ] );
            }
            
            setdvar( @"hash_bc321023e9100f4", 1 );
            s_exfil.b_disabled = undefined;
            s_exfil function_2e0dc001c9a5c661();
            s_exfil.var_d182b8d3f3aaa93b.interact function_a1778cdfcc8373ae( player );
        }
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x290f
    // Size: 0x49, Type: dev
    function function_125c8891683ddba9( params )
    {
        s_exfil = function_7d7775bea2f0ecca( params[ 0 ] );
        player = function_dd773e92c0ad5582( params[ 1 ], params[ 2 ] );
        player.var_43ca0dfb1b29c6ff = 1;
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2960
    // Size: 0x49, Type: dev
    function function_419da4ebcd2d6a49( params )
    {
        s_exfil = function_7d7775bea2f0ecca( params[ 0 ] );
        player = function_dd773e92c0ad5582( params[ 1 ], params[ 2 ] );
        player.var_fc0a0836d3931cdb = 1;
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x29b1
    // Size: 0x93, Type: dev
    function function_29cada162a27a32( params )
    {
        s_exfil = function_7d7775bea2f0ecca( params[ 0 ] );
        
        if ( !isdefined( s_exfil ) || !istrue( s_exfil.var_1326008dc390c510 ) )
        {
            return;
        }
        
        if ( params[ 1 ] == "<dev string:x3e8>" )
        {
            function_ae18d20050b99c2( s_exfil );
            s_exfil.n_kills = function_5cdb6bf616f071c2( s_exfil );
            s_exfil.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e( "<dev string:x3f0>", function_9621ef0d09be048d( s_exfil ) );
            function_303cb92b5afb6e87( s_exfil );
            return;
        }
        
        s_exfil notify( "<dev string:x409>" );
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2a4c
    // Size: 0x5c, Type: dev
    function function_c68e0d71575a2ff4( params )
    {
        s_exfil = function_7d7775bea2f0ecca( params[ 0 ] );
        
        if ( !isdefined( s_exfil ) || !istrue( s_exfil.var_1326008dc390c510 ) )
        {
            return;
        }
        
        if ( isdefined( s_exfil.var_576f57af0204c38c ) )
        {
            s_exfil.var_576f57af0204c38c function_b7edf3fe42e320a6( s_exfil );
        }
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2ab0
    // Size: 0x89, Type: dev
    function function_adcb708587848ffb( params )
    {
        s_exfil = function_7d7775bea2f0ecca( params[ 0 ] );
        player = function_dd773e92c0ad5582( params[ 1 ], params[ 2 ] );
        
        if ( isdefined( s_exfil.var_576f57af0204c38c ) )
        {
            if ( function_18a23b9f6568641e() )
            {
                s_exfil.var_576f57af0204c38c thread function_59e7feccaa753a46( player, 1 );
                return;
            }
            
            s_exfil.var_576f57af0204c38c.interact function_ef855ac387639af6( player );
        }
    }

    // Namespace exfil / namespace_9f6a961447bab709
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b41
    // Size: 0x70, Type: dev
    function function_7ce9ab45ae5f8406( params )
    {
        s_exfil = function_7d7775bea2f0ecca( params[ 0 ] );
        player = function_dd773e92c0ad5582( params[ 1 ], params[ 2 ] );
        
        if ( isdefined( s_exfil.s_exfil_destination ) && isplayer( player ) )
        {
            player setorigin( s_exfil.s_exfil_destination.origin );
        }
    }

#/

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bb9
// Size: 0x539
function function_ec1e9e6af7af5cf()
{
    level endon( "game_ended" );
    wait 1;
    
    if ( isdefined( level.var_5924b0bd99878b50 ) && !getdvarint( @"hash_ee51e09f87ec1371", 0 ) )
    {
        delayspawntime = [[ level.var_5924b0bd99878b50 ]]();
        
        if ( delayspawntime > 0 )
        {
            wait delayspawntime;
        }
    }
    
    a_destinations = getstructarray( "content_destination", "variantname" );
    
    foreach ( destination in a_destinations )
    {
        if ( is_equal( destination.script_noteworthy, "quest_destination" ) )
        {
            continue;
        }
        
        level thread function_cb80f3df972cd7d4( destination );
    }
    
    wait 0.5;
    level.var_2562ea48235e90b5 = array_randomize( level.var_2562ea48235e90b5 );
    
    if ( function_8d3b8265c47a2223() )
    {
        if ( getdvarint( @"hash_ee51e09f87ec1371", 0 ) )
        {
            foreach ( s_exfil in level.var_2562ea48235e90b5 )
            {
                s_exfil function_2e0dc001c9a5c661();
                level thread start_exfil_spawns_at_destination( s_exfil );
            }
            
            var_6c259ac96406b5a3 = level.var_2562ea48235e90b5;
            
            if ( isdefined( level.var_8873839ca6498959 ) )
            {
                var_6b64c68d444fc421 = [[ level.var_8873839ca6498959 ]]( var_6c259ac96406b5a3 );
                
                foreach ( s_exfil in var_6b64c68d444fc421 )
                {
                    s_exfil.b_disabled = 0;
                }
            }
        }
        else if ( istrue( level.ob_pvpve ) && istrue( level.var_529deb371b5eeb12 ) && isdefined( level.var_8868d59e008df32d ) )
        {
            var_442c95ac4a7887c1 = sortbydistance( level.var_2562ea48235e90b5, [[ level.var_8868d59e008df32d ]]() );
            var_6c259ac96406b5a3 = [ var_442c95ac4a7887c1[ 0 ], var_442c95ac4a7887c1[ 1 ], var_442c95ac4a7887c1[ 2 ] ];
            
            foreach ( s_exfil in var_6c259ac96406b5a3 )
            {
                s_exfil function_2e0dc001c9a5c661();
                level thread start_exfil_spawns_at_destination( s_exfil );
            }
            
            if ( isdefined( level.var_8873839ca6498959 ) )
            {
                var_6b64c68d444fc421 = [[ level.var_8873839ca6498959 ]]( var_6c259ac96406b5a3 );
                
                foreach ( s_exfil in var_6b64c68d444fc421 )
                {
                    s_exfil.b_disabled = 0;
                }
            }
        }
        else
        {
            var_6c259ac96406b5a3 = [];
            
            foreach ( s_exfil in level.var_2562ea48235e90b5 )
            {
                if ( !isdefined( s_exfil.script_parameters ) || s_exfil.script_parameters != "disabled" )
                {
                    var_6c259ac96406b5a3[ var_6c259ac96406b5a3.size ] = s_exfil;
                }
            }
            
            if ( isdefined( level.var_8873839ca6498959 ) )
            {
                var_6b64c68d444fc421 = [[ level.var_8873839ca6498959 ]]( var_6c259ac96406b5a3 );
                
                foreach ( s_exfil in var_6b64c68d444fc421 )
                {
                    s_exfil.b_disabled = 0;
                }
                
                vehicle_tracking::reservevehicle( var_6b64c68d444fc421.size );
            }
            else
            {
                n_enabled = 0;
                
                foreach ( s_exfil in var_6c259ac96406b5a3 )
                {
                    s_exfil.b_disabled = 0;
                    n_enabled += 1;
                    
                    if ( n_enabled >= 4 )
                    {
                        break;
                    }
                }
            }
            
            foreach ( s_exfil in level.var_2562ea48235e90b5 )
            {
                if ( !isdefined( s_exfil.b_disabled ) )
                {
                    s_exfil.b_disabled = 1;
                }
                
                s_exfil function_2e0dc001c9a5c661();
                
                if ( !s_exfil.b_disabled )
                {
                    level thread start_exfil_spawns_at_destination( s_exfil );
                }
            }
        }
    }
    else
    {
        foreach ( s_exfil in level.var_2562ea48235e90b5 )
        {
            s_exfil function_2e0dc001c9a5c661();
        }
    }
    
    wait 1;
    flag_set( "exfil_initialized" );
    
    /#
        function_a19741910eb710b4();
    #/
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30fa
// Size: 0xf7
function function_cb80f3df972cd7d4( destination )
{
    if ( !isdefined( destination.locations ) )
    {
        assertmsg( "<dev string:x427>" + destination.targetname );
        return;
    }
    
    foreach ( location in destination.locations )
    {
        var_dc7002eba85cb997 = location.instances[ "exfil" ];
        
        if ( isdefined( var_dc7002eba85cb997 ) )
        {
            foreach ( instance in var_dc7002eba85cb997.versions )
            {
                scripts\cp_mp\content_manager::spawn_instance( instance );
            }
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31f9
// Size: 0x170
function function_a61e7ab12361f107( instance )
{
    if ( isarray( instance.contentgroups[ "exfil_interact" ] ) )
    {
        var_d142d9da844b0025 = getdvar( @"hash_e497b4cbd51708bd", "" );
        var_71b80581febb7711 = strtok( var_d142d9da844b0025, "," );
        level.var_2562ea48235e90b5 = array_combine_unique( level.var_2562ea48235e90b5, instance.contentgroups[ "exfil_interact" ] );
        str_destination = instance.location.destination.targetname;
        
        foreach ( s_exfil in instance.contentgroups[ "exfil_interact" ] )
        {
            s_exfil.instance = instance;
            s_exfil.str_destination = str_destination;
            level.var_b8b3ed33712220d8[ str_destination ] = function_6d6af8144a5131f1( level.var_b8b3ed33712220d8[ str_destination ], s_exfil );
            
            if ( var_71b80581febb7711.size && isdefined( s_exfil.targetname ) && arraycontains( var_71b80581febb7711, s_exfil.targetname ) )
            {
                s_exfil.script_parameters = "disabled";
            }
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3371
// Size: 0x65
function function_7d45a9e5bf7a3d3e( s_exfil )
{
    var_4a06475b75dd7646 = default_to( level.var_3a96331857b5f453, "REV_OB_EXFIL" );
    
    if ( isdefined( s_exfil ) && isdefined( s_exfil.var_8d00284a103c5803 ) )
    {
        var_4a06475b75dd7646 = s_exfil.var_8d00284a103c5803;
    }
    
    s_activity = namespace_c8e2077fca5ac679::function_3fe7cd75f13c980b( var_4a06475b75dd7646 );
    return namespace_c8e2077fca5ac679::function_b9c4aa88ad97ee68( s_activity );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33df
// Size: 0x59
function function_c4228da55910ea6b()
{
    if ( !isdefined( self.name ) )
    {
        level.var_43add10cc0e80a42 = default_to( level.var_43add10cc0e80a42, 0 );
        self.name = default_to( self.targetname, "Exfil_" + level.var_43add10cc0e80a42 );
        level.var_43add10cc0e80a42++;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3440
// Size: 0x43f
function function_2e0dc001c9a5c661()
{
    var_cad2ff0bf935f3d4 = function_7d45a9e5bf7a3d3e( self );
    self.var_2a1eeca3276ddc4c = default_to( var_cad2ff0bf935f3d4.var_44e5ab6b68eae86, "tag_origin" );
    
    if ( function_8d3b8265c47a2223() )
    {
        self.radius = default_to( self.radius, 394 );
    }
    else
    {
        self.radius = default_to( self.radius, 64 );
    }
    
    self.angles = default_to( self.angles, ( 0, 0, 0 ) );
    self.var_953c0bb9dec80174 = [];
    self.var_c9164736baf0694a = [];
    self.var_ed2b93690e12fb86 = [];
    self.var_fb43e2df572cabdf = [];
    self.n_kills = 0;
    self.var_6e5b4d39d36d4d34 = 0;
    function_360cc0762c8f8dc6( 0, self );
    function_c4228da55910ea6b();
    
    if ( function_8d3b8265c47a2223() )
    {
        self.origin = getgroundposition( self.origin + ( 0, 0, 8 ), 16 ) + ( 0, 0, 2 );
    }
    
    function_5169ff9e47582e7a( self );
    
    if ( !isdefined( self.var_d182b8d3f3aaa93b.interact ) )
    {
        if ( isent( self.var_d182b8d3f3aaa93b ) && !function_4027f5445bb7c8fb( self ) )
        {
            self.var_d182b8d3f3aaa93b.interact = scripts\cp_mp\interaction::register_interact( self.var_d182b8d3f3aaa93b, self.radius, &function_a1778cdfcc8373ae, default_to( level.var_7cc298fa98ce0c7a, %SHARED_HINTSTRINGS/EXFIL_START_USE_GENERIC ) );
            self.var_d182b8d3f3aaa93b.interact sethintonobstruction( "show" );
        }
        else
        {
            self.var_d182b8d3f3aaa93b.interact = scripts\cp_mp\interaction::function_32645103f7520635( self.var_d182b8d3f3aaa93b, &function_a1778cdfcc8373ae );
        }
    }
    
    if ( isent( self.var_d182b8d3f3aaa93b.interact ) && !function_4027f5445bb7c8fb( self ) )
    {
        self.var_d182b8d3f3aaa93b.interact setuseholdduration( 1500 );
        
        if ( self.var_d182b8d3f3aaa93b.interact tagexists( "tag_hint" ) )
        {
            self.var_d182b8d3f3aaa93b.interact sethinttag( "tag_hint" );
        }
    }
    else
    {
        self.var_d182b8d3f3aaa93b.interact utility::function_3677f2be30fdd581( "cp_mp_exfil_site", "ready" );
    }
    
    self.var_d182b8d3f3aaa93b.interact.s_exfil = self;
    
    if ( function_8d3b8265c47a2223() )
    {
        function_9cf09a569caf1a26( self );
        self.s_exfil_destination = random( self.var_fb43e2df572cabdf );
        function_871ded736cf89cc4( self );
        self.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_icon", "default_icon" );
    }
    
    if ( istrue( self.b_disabled ) )
    {
        if ( isdefined( self.var_d182b8d3f3aaa93b.interact ) )
        {
            if ( isent( self.var_d182b8d3f3aaa93b.interact ) )
            {
                self.var_d182b8d3f3aaa93b.interact delete();
            }
            else
            {
                self.var_d182b8d3f3aaa93b.interact freescriptable();
            }
        }
        
        if ( isdefined( self.var_d182b8d3f3aaa93b ) )
        {
            if ( isent( self.var_d182b8d3f3aaa93b ) )
            {
                self.var_d182b8d3f3aaa93b delete();
            }
            else
            {
                self.var_d182b8d3f3aaa93b freescriptable();
            }
        }
        
        if ( isdefined( self.s_exfil_destination.mdl_destination ) )
        {
            if ( isent( self.s_exfil_destination.mdl_destination ) )
            {
                self.s_exfil_destination.mdl_destination delete();
                return;
            }
            
            self.s_exfil_destination.mdl_destination freescriptable();
        }
        
        return;
    }
    
    level.var_44194c664b77bf1b[ level.var_44194c664b77bf1b.size ] = self;
    function_e3ba83b1bb428b8e();
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3887
// Size: 0x117
function function_5169ff9e47582e7a( s_exfil )
{
    if ( !isdefined( s_exfil.var_d182b8d3f3aaa93b ) )
    {
        if ( function_4027f5445bb7c8fb( s_exfil ) && isdefined( s_exfil.var_1f97475ff2d69ebf ) )
        {
            s_exfil.var_d182b8d3f3aaa93b = scripts\cp_mp\content_manager::spawn_script_model( s_exfil, s_exfil.var_1f97475ff2d69ebf, 0, 1 );
            params = spawnstruct();
            params.var_d182b8d3f3aaa93b = s_exfil.var_d182b8d3f3aaa93b;
            callback::callback( "quest_exfil_spawned", params );
        }
        else if ( function_8d3b8265c47a2223() )
        {
            if ( !isdefined( level.var_f08929157ba33935 ) )
            {
                level.var_f08929157ba33935 = "cp_mp_exfil_site_entityless";
            }
            
            s_exfil.var_d182b8d3f3aaa93b = spawnscriptable( level.var_f08929157ba33935, s_exfil.origin, s_exfil.angles );
        }
        else
        {
            s_exfil.var_d182b8d3f3aaa93b = scripts\cp_mp\content_manager::spawn_script_model( s_exfil, s_exfil.var_2a1eeca3276ddc4c, 0, 1 );
        }
    }
    
    calloutmarkerping::function_6b9641d0060c3a2c( s_exfil.var_d182b8d3f3aaa93b );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39a6
// Size: 0x90
function function_871ded736cf89cc4( s_exfil )
{
    if ( !isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        if ( function_8d3b8265c47a2223() && isdefined( s_exfil.var_d182b8d3f3aaa93b ) )
        {
            s_exfil.s_exfil_destination.mdl_destination = s_exfil.var_d182b8d3f3aaa93b;
            return;
        }
        
        s_exfil.s_exfil_destination.mdl_destination = scripts\cp_mp\content_manager::spawn_script_model( s_exfil.s_exfil_destination, "cp_mp_exfil_site_xmodel", 0, 1 );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a3e
// Size: 0xf9
function function_e3ba83b1bb428b8e()
{
    if ( isdefined( level.var_5533a67bdfed946d ) )
    {
        self.var_d182b8d3f3aaa93b thread [[ level.var_5533a67bdfed946d ]]();
        return;
    }
    
    exfil_icon = "ui_map_icon_cp_mp_exfil";
    
    if ( function_4027f5445bb7c8fb( self ) )
    {
        exfil_icon = "ui_map_icon_ob_quest_exfil";
    }
    
    if ( istrue( level.var_a77333195caab0e3 ) )
    {
        n_obj_id = scripts\mp\objidpoolmanager::requestobjectiveid( 1 );
        self.var_d182b8d3f3aaa93b.n_obj_id = n_obj_id;
        scripts\mp\objidpoolmanager::objective_add_objective( n_obj_id, "invisible", self.var_d182b8d3f3aaa93b.origin, exfil_icon, "icon_regular" );
        
        if ( isent( self.var_d182b8d3f3aaa93b ) )
        {
            scripts\mp\objidpoolmanager::update_objective_onentity( n_obj_id, self.var_d182b8d3f3aaa93b );
        }
        
        scripts\mp\objidpoolmanager::function_c3c6bff089dfdd34( n_obj_id, "icon_regular" );
        objective_setlabel( n_obj_id, %SHARED_HINTSTRINGS/EXFIL );
        objective_setplayintro( n_obj_id, 0 );
        self.var_d182b8d3f3aaa93b thread exfil_interact_objective_distance( 1024 );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b3f
// Size: 0x1f7
function exfil_interact_objective_distance( n_distance )
{
    self notify( "end_exfil_interact_objective_distance" );
    self endon( "death" );
    self endon( "end_exfil_interact_objective_distance" );
    
    if ( !isdefined( self.n_obj_id ) )
    {
        return;
    }
    
    n_obj_id = self.n_obj_id;
    n_distance_sq = n_distance * n_distance;
    
    while ( true )
    {
        objective_showtoplayersinmask( n_obj_id );
        
        foreach ( player in level.players )
        {
            if ( !isplayer( player ) )
            {
                continue;
            }
            
            if ( isdefined( level.var_d8b6115a502e7e76 ) )
            {
                if ( !self [[ level.var_d8b6115a502e7e76 ]]( player ) )
                {
                    if ( isdefined( self.s_exfil.var_35e7c712de6487f6 ) )
                    {
                        self.s_exfil.var_35e7c712de6487f6 setscriptablepartstate( "content_interact", "hidden" );
                    }
                    
                    self disableplayeruse( player );
                    objective_removeclientfrommask( n_obj_id, player );
                    continue;
                }
                
                self enableplayeruse( player );
                
                if ( isdefined( self.s_exfil.var_35e7c712de6487f6 ) )
                {
                    self.s_exfil.var_35e7c712de6487f6 setscriptablepartstate( "content_interact", "visible" );
                }
            }
            
            if ( player function_aa1f91da154a3d90() )
            {
                objective_removeclientfrommask( n_obj_id, player );
                continue;
            }
            
            if ( isdefined( self.s_exfil ) && ( istrue( self.s_exfil.var_1326008dc390c510 ) || istrue( self.s_exfil.b_disabled ) ) )
            {
                objective_removeclientfrommask( n_obj_id, player );
                continue;
            }
            
            if ( distancesquared( player.origin, self.origin ) <= n_distance_sq )
            {
                objective_addclienttomask( n_obj_id, player );
            }
            else
            {
                objective_removeclientfrommask( n_obj_id, player );
            }
            
            waitframe();
        }
        
        wait 0.5;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3e
// Size: 0x14f
function function_a1778cdfcc8373ae( player )
{
    if ( !isdefined( self.s_exfil ) || istrue( self.s_exfil.var_1326008dc390c510 ) )
    {
        if ( isdefined( self.s_exfil ) )
        {
            logstring( "==CPMP EXFIL: Exfil " + self.s_exfil.name + " is already active and was never properly reset!" );
            return;
        }
        
        logstring( "==CPMP Exfil: Exfil at " + player.origin + " does not have a valid struct assigned!" );
        return;
    }
    
    if ( isdefined( level.var_d8b6115a502e7e76 ) )
    {
        if ( !self [[ level.var_d8b6115a502e7e76 ]]( player ) )
        {
            if ( isent( self ) )
            {
                self playsoundtoplayer( "ui_zm_core_door_purchase_deny", player );
            }
            
            return;
        }
    }
    
    if ( istrue( level.var_22753af4cd04bb82 ) && isdefined( level.var_867a2a58a53c66f2 ) )
    {
        params = spawnstruct();
        params.s_exfil = self.s_exfil;
        
        if ( !player [[ level.var_867a2a58a53c66f2 ]]( #"hash_eea98455a74fc364", params ) )
        {
            return;
        }
    }
    
    level.var_44194c664b77bf1b = array_remove( level.var_44194c664b77bf1b, self.s_exfil );
    function_555064e06fc5f4b3( 0 );
    level thread exfil_start( self.s_exfil, player );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e95
// Size: 0x65
function function_555064e06fc5f4b3( b_usable )
{
    if ( !isdefined( b_usable ) )
    {
        b_usable = 1;
    }
    
    if ( isent( self ) && !function_4027f5445bb7c8fb( self.s_exfil ) )
    {
        self function_dfb78b3e724ad620( b_usable );
        return;
    }
    
    if ( b_usable )
    {
        utility::function_3677f2be30fdd581( "cp_mp_exfil_site", "ready" );
        return;
    }
    
    utility::function_3677f2be30fdd581( "cp_mp_exfil_site", "standby" );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f02
// Size: 0x21, Type: bool
function function_aa1f91da154a3d90()
{
    if ( isdefined( self.s_exfil ) || istrue( self.var_fd7c2a423b7a47a5 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f2c
// Size: 0x18, Type: bool
function function_18a23b9f6568641e()
{
    if ( getdvarint( @"hash_ab8956c864b4d3a4", 0 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f4d
// Size: 0x37
function function_360cc0762c8f8dc6( n_spawns, s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    
    if ( isdefined( s_exfil ) )
    {
        s_exfil.var_6a8db94b5533083c = n_spawns;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f8c
// Size: 0x36
function function_5cdb6bf616f071c2( s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    
    if ( isdefined( s_exfil ) )
    {
        return default_to( s_exfil.var_6a8db94b5533083c, 0 );
    }
    
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fcb
// Size: 0x44, Type: bool
function function_a374bb164261c788( s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    var_df6b5557dbf001d3 = function_5cdb6bf616f071c2( s_exfil );
    
    if ( s_exfil.var_6e5b4d39d36d4d34 >= var_df6b5557dbf001d3 )
    {
        return true;
    }
    
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4018
// Size: 0x61
function function_e1a9c5d3a4c2a90b( s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    
    if ( isdefined( s_exfil ) && isarray( s_exfil.var_ed2b93690e12fb86 ) )
    {
        s_exfil.var_ed2b93690e12fb86 = array_removedead_or_dying( s_exfil.var_ed2b93690e12fb86 );
        return s_exfil.var_ed2b93690e12fb86.size;
    }
    
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4082
// Size: 0x2f
function function_76a9bc9a24e5cffb( s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    
    if ( isdefined( s_exfil ) )
    {
        return s_exfil.n_kills;
    }
    
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40ba
// Size: 0x33
function function_9621ef0d09be048d( s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    
    if ( isdefined( s_exfil ) )
    {
        return ( function_5cdb6bf616f071c2( s_exfil ) - function_76a9bc9a24e5cffb( s_exfil ) );
    }
    
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40f6
// Size: 0x2
function function_45d940ec8c857432()
{
    
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4100
// Size: 0x2
function function_b256cf67627a5412()
{
    
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x410a
// Size: 0x8c
function function_ea8918a722bcbeed()
{
    if ( isdefined( self.s_exfil ) )
    {
        if ( isdefined( self.s_exfil.s_exfil_destination ) )
        {
            return self.s_exfil.s_exfil_destination.origin;
        }
        else
        {
            return self.s_exfil.origin;
        }
    }
    else if ( isdefined( level.var_980b9351a7816ae8 ) )
    {
        return level.var_980b9351a7816ae8.origin;
    }
    
    return ( 0, 0, 0 );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x419f
// Size: 0x4b8
function exfil_start( s_exfil, player_activator )
{
    level flag_set( "exfil_start" );
    level.var_980b9351a7816ae8 = s_exfil;
    s_exfil.var_1326008dc390c510 = 1;
    var_4a06475b75dd7646 = default_to( level.var_3a96331857b5f453, "REV_OB_EXFIL" );
    
    if ( isdefined( s_exfil.var_8d00284a103c5803 ) )
    {
        var_4a06475b75dd7646 = s_exfil.var_8d00284a103c5803;
    }
    
    s_exfil.var_18da16a5ee3e8314 = namespace_68dc261109a9503f::function_67f4d8928c638abb( "REV_OB_EXFIL", var_4a06475b75dd7646 );
    s_exfil.var_18da16a5ee3e8314.s_exfil = s_exfil;
    s_exfil.player_activator = player_activator;
    var_676b838fa769666b = exfil_opt_in( s_exfil, player_activator );
    s_exfil.var_c9164736baf0694a = array_removeundefined( s_exfil.var_c9164736baf0694a );
    
    if ( !s_exfil.var_c9164736baf0694a.size || isdefined( var_676b838fa769666b ) && !var_676b838fa769666b )
    {
        s_exfil.var_1326008dc390c510 = undefined;
        
        foreach ( player in s_exfil.var_953c0bb9dec80174 )
        {
            player.s_exfil = undefined;
        }
        
        s_exfil.player_activator = undefined;
        
        if ( isdefined( s_exfil.var_d182b8d3f3aaa93b ) )
        {
            s_exfil.var_d182b8d3f3aaa93b notify( "end_exfil_interact_objective_distance" );
        }
        
        if ( !istrue( level.var_1e47df2ee21ee5d6 ) )
        {
            if ( function_8d3b8265c47a2223() )
            {
                var_136f67d0e18850d3 = 1;
            }
            else
            {
                var_136f67d0e18850d3 = getdvarint( @"hash_62412da41b8eaf67", 60 );
            }
            
            logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " will reset in " + var_136f67d0e18850d3 + " seconds!" );
            level delaythread( var_136f67d0e18850d3, &reset_exfil, s_exfil );
        }
        
        logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " was unable to be opted into! Resetting Exfil in " + 60 + " seconds" );
        level flag_clear( "exfil_start" );
        return;
    }
    
    level callback::callback( "on_exfil_start", s_exfil );
    s_exfil.b_disabled = undefined;
    
    if ( isdefined( s_exfil.s_exfil_destination ) && isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
    }
    
    if ( function_4027f5445bb7c8fb( s_exfil ) )
    {
        if ( isdefined( level.var_4dc2d161649b3568 ) )
        {
            self thread [[ level.var_4dc2d161649b3568 ]]( s_exfil, player_activator );
        }
    }
    else
    {
        if ( !isdefined( s_exfil.var_64f10a0f19df265f ) )
        {
            s_exfil.var_64f10a0f19df265f = "exfil_called_acknowledged";
        }
        
        s_exfil.var_c9164736baf0694a thread delaythread( 3.5, &function_895c7e0e9911ff6e, s_exfil, s_exfil.var_64f10a0f19df265f );
        
        foreach ( player in s_exfil.var_c9164736baf0694a )
        {
            player callback::callback( "exfil_acknowledged" );
        }
    }
    
    if ( isdefined( level.var_55a32133643b9217 ) )
    {
        level thread [[ level.var_55a32133643b9217 ]]( s_exfil, player_activator );
        return;
    }
    
    function_9cf09a569caf1a26( s_exfil );
    s_exfil.s_exfil_destination = function_a5c4615f0b00ff83( s_exfil );
    s_exfil.s_exfil_destination.angles = default_to( s_exfil.s_exfil_destination.angles, ( 0, 0, 0 ) );
    s_exfil.s_exfil_destination.var_1326008dc390c510 = 1;
    var_514253bf9141a3c4 = function_890f1e94c79decb( s_exfil );
    s_exfil.n_time_remaining = var_514253bf9141a3c4;
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        if ( isalive( player ) && player.sessionstate == "playing" )
        {
            if ( !function_8d3b8265c47a2223() )
            {
                player thread exfil_timer_player_ui( var_514253bf9141a3c4, s_exfil );
            }
            
            player thread function_689f5a3123aba709( s_exfil );
        }
    }
    
    level thread function_2503b81a18276e3f( s_exfil, player_activator );
    level thread function_367542eff2c7e695( s_exfil, player_activator );
    level thread function_3c0534cf6dbf9399( s_exfil );
    
    if ( !function_8d3b8265c47a2223() )
    {
        level thread exfil_timer( s_exfil, var_514253bf9141a3c4 );
    }
    
    level thread function_748fd8b59180efd1( s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x465f
// Size: 0x416
function function_1590a66b9f6c2c3b( s_exfil, var_514253bf9141a3c4 )
{
    if ( istrue( s_exfil.b_disabled ) )
    {
        println( "<dev string:x472>" );
        return;
    }
    
    level flag_set( "exfil_start" );
    level.var_980b9351a7816ae8 = s_exfil;
    s_exfil.var_1326008dc390c510 = 1;
    var_4a06475b75dd7646 = default_to( level.var_3a96331857b5f453, "REV_OB_EXFIL" );
    
    if ( isdefined( s_exfil.var_8d00284a103c5803 ) )
    {
        var_4a06475b75dd7646 = s_exfil.var_8d00284a103c5803;
    }
    
    s_exfil.var_18da16a5ee3e8314 = namespace_68dc261109a9503f::function_67f4d8928c638abb( "REV_OB_EXFIL", var_4a06475b75dd7646 );
    s_exfil.var_18da16a5ee3e8314.s_exfil = s_exfil;
    s_exfil.var_c9164736baf0694a = [];
    
    foreach ( player in level.players )
    {
        if ( isalive( player ) && player.sessionstate == "playing" && !isdefined( player.s_exfil ) )
        {
            if ( isdefined( s_exfil.var_cfaabfb649760fac ) && s_exfil [[ s_exfil.var_cfaabfb649760fac ]]( player ) )
            {
                continue;
            }
            
            player.s_exfil = s_exfil;
            s_exfil.var_c9164736baf0694a[ s_exfil.var_c9164736baf0694a.size ] = player;
            namespace_d886885225a713a7::function_bbdcd857d0c2a65e( s_exfil.var_18da16a5ee3e8314, player );
            
            if ( !istrue( s_exfil.var_1c13f1737dccef9a ) )
            {
                player scripts\mp\hud_message::showsplash( "cp_mp_exfil_inbound" );
            }
        }
    }
    
    level callback::callback( "on_exfil_start", s_exfil );
    s_exfil ent_flag_set( "player_reached_exfil" );
    
    if ( !isdefined( s_exfil.var_64f10a0f19df265f ) )
    {
        s_exfil.var_64f10a0f19df265f = "exfil_called_acknowledged";
    }
    
    s_exfil.var_c9164736baf0694a thread delaythread( 3, &function_895c7e0e9911ff6e, s_exfil, s_exfil.var_64f10a0f19df265f );
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        player callback::callback( "exfil_acknowledged" );
    }
    
    function_9cf09a569caf1a26( s_exfil );
    
    if ( s_exfil.var_c9164736baf0694a.size > 0 )
    {
        s_exfil.s_exfil_destination = function_a5c4615f0b00ff83( s_exfil );
    }
    else
    {
        s_exfil.s_exfil_destination = random( s_exfil.var_fb43e2df572cabdf );
    }
    
    s_exfil.s_exfil_destination.angles = isdefined( s_exfil.s_exfil_destination.angles ) ? s_exfil.s_exfil_destination.angles : ( 0, 0, 0 );
    s_exfil.s_exfil_destination.var_1326008dc390c510 = 1;
    s_exfil.n_time_remaining = var_514253bf9141a3c4;
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        if ( isalive( player ) && player.sessionstate == "playing" )
        {
            if ( !function_8d3b8265c47a2223() )
            {
                player thread exfil_timer_player_ui( var_514253bf9141a3c4, s_exfil );
            }
            
            player thread function_689f5a3123aba709( s_exfil );
        }
    }
    
    level thread function_2503b81a18276e3f( s_exfil, undefined );
    level thread function_367542eff2c7e695( s_exfil, undefined );
    level thread function_3c0534cf6dbf9399( s_exfil );
    
    if ( function_8d3b8265c47a2223() )
    {
        level thread start_exfil_spawns_at_destination( s_exfil );
        return;
    }
    
    level thread exfil_timer( s_exfil, var_514253bf9141a3c4 );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a7d
// Size: 0x138
function function_9cf09a569caf1a26( s_exfil )
{
    if ( isdefined( s_exfil.target2 ) && !issubstr( s_exfil.target2, "exit" ) )
    {
        s_exfil.var_7b0a39123a9c2f88 = getstructarray( s_exfil.target2, "targetname" );
        
        if ( isdefined( s_exfil.var_2c60ad87c1ee7615 ) )
        {
            s_exfil.var_fb43e2df572cabdf = [ s_exfil.var_7b0a39123a9c2f88[ s_exfil.var_2c60ad87c1ee7615 ] ];
            s_exfil.var_2c60ad87c1ee7615 = undefined;
        }
        else
        {
            foreach ( s_exfil_destination in s_exfil.var_7b0a39123a9c2f88 )
            {
                if ( !istrue( s_exfil_destination.var_1326008dc390c510 ) )
                {
                    s_exfil.var_fb43e2df572cabdf = function_6d6af8144a5131f1( s_exfil.var_fb43e2df572cabdf, s_exfil_destination );
                }
            }
        }
        
        return;
    }
    
    s_exfil.var_a22c85cb6c2df5a0 = 1;
    s_exfil.var_fb43e2df572cabdf = [ s_exfil ];
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bbd
// Size: 0xb0
function function_5daedbca2b53bfdf( var_b70155cf3a8fcacf )
{
    n_time_remaining = var_b70155cf3a8fcacf.var_621cb2c0d9b1cdae;
    level notify( "exfil_time_remaining", n_time_remaining, self.s_exfil );
    self.s_exfil.n_time_remaining = int( n_time_remaining );
    
    foreach ( player in self.s_exfil.var_c9164736baf0694a )
    {
        if ( isdefined( player ) )
        {
            player notify( "exfil_time_remaining", n_time_remaining );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c75
// Size: 0x232
function exfil_opt_in( s_exfil, player_activator )
{
    if ( isdefined( level.var_38452d51edfb282c ) )
    {
        var_676b838fa769666b = level [[ level.var_38452d51edfb282c ]]( s_exfil, player_activator );
        return var_676b838fa769666b;
    }
    
    var_c9b69aecc5c631ed = player_activator scripts\cp_mp\utility\squad_utility::getsquadmembers( undefined, 1 );
    s_exfil.var_953c0bb9dec80174 = array_combine_unique( [ player_activator ], var_c9b69aecc5c631ed );
    
    foreach ( player in level.players )
    {
        if ( !player function_aa1f91da154a3d90() && distance( player_activator.origin, player.origin ) <= 5000 )
        {
            player.var_fd7c2a423b7a47a5 = 1;
            s_exfil.var_953c0bb9dec80174 = function_6d6af8144a5131f1( s_exfil.var_953c0bb9dec80174, player );
        }
    }
    
    array_thread( s_exfil.var_953c0bb9dec80174, &scripts\mp\hud_message::showsplash, "cp_mp_exfil_ready" );
    callback::callback( "on_exfil_player_available", s_exfil );
    wait 3;
    array_thread( s_exfil.var_953c0bb9dec80174, &function_1054441d9ce3414, s_exfil, 10, player_activator );
    
    if ( s_exfil.var_c9164736baf0694a.size < s_exfil.var_953c0bb9dec80174.size )
    {
        s_exfil waittill_any_timeout_1( 10, "exfil_opt_in_done" );
    }
    
    s_exfil notify( "exfil_opt_in_done" );
    s_exfil.var_c9164736baf0694a = array_removeundefined( s_exfil.var_c9164736baf0694a );
    
    if ( !istrue( s_exfil.var_1c13f1737dccef9a ) )
    {
        array_thread( s_exfil.var_c9164736baf0694a, &scripts\mp\hud_message::showsplash, "cp_mp_exfil_inbound" );
    }
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        namespace_d886885225a713a7::function_bbdcd857d0c2a65e( s_exfil.var_18da16a5ee3e8314, player );
    }
    
    return 1;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4eb0
// Size: 0x11f
function function_c263d61b84b751b6( n_timer )
{
    if ( isbot( self ) )
    {
        return;
    }
    
    self endon( "disconnect" );
    self notifyonplayercommand( "exfil_vote_accept", "-actionslot 1" );
    self notifyonplayercommand( "exfil_vote_decline", "+actionslot 2" );
    
    if ( !self usinggamepad() )
    {
        self notifyonplayercommand( "exfil_vote_accept", "+breath_sprint" );
        self notifyonplayercommand( "exfil_vote_decline", "+prone" );
        val::set( "exfil", "prone", 0 );
    }
    
    msg = waittill_any_timeout_3( n_timer, "exfil_vote_accept", "exfil_vote_decline", "exfil_opt_in_done" );
    
    if ( msg == "exfil_vote_accept" )
    {
        self.var_43ca0dfb1b29c6ff = 1;
    }
    else if ( msg == "exfil_vote_decline" )
    {
        self.var_fc0a0836d3931cdb = 1;
    }
    
    self notifyonplayercommandremove( "exfil_vote_accept", "-actionslot 1" );
    self notifyonplayercommandremove( "exfil_vote_decline", "+actionslot 2" );
    self notifyonplayercommandremove( "exfil_vote_accept", "+breath_sprint" );
    self notifyonplayercommandremove( "exfil_vote_decline", "+prone" );
    val::reset( "exfil", "prone" );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4fd7
// Size: 0x2f2
function function_1054441d9ce3414( s_exfil, n_time, player_activator, var_e0f041f233006ee7 )
{
    n_timer = default_to( n_time, 10 );
    self.var_fd7c2a423b7a47a5 = 1;
    self.var_85229ab89df19bb = scripts\mp\hud_util::createtimer( "hudsmall", 1 );
    self.var_85229ab89df19bb.x = 0;
    self.var_85229ab89df19bb.y = 0;
    
    if ( self usinggamepad() )
    {
        self.var_85229ab89df19bb.label = %SHARED_HINTSTRINGS/EXFIL_OPT_IN;
    }
    else
    {
        self.var_85229ab89df19bb.label = %SHARED_HINTSTRINGS/EXFIL_OPT_IN_KBM;
    }
    
    self.var_85229ab89df19bb.alignx = "center";
    self.var_85229ab89df19bb.aligny = "middle";
    self.var_85229ab89df19bb.horzalign = "center";
    self.var_85229ab89df19bb.vertalign = "middle";
    self.var_85229ab89df19bb.alpha = 1;
    self.var_85229ab89df19bb.glowalpha = 0;
    self.var_85229ab89df19bb.archived = 0;
    self.var_85229ab89df19bb settimer( n_timer );
    thread function_6a6527d46f420f47( s_exfil );
    thread function_c263d61b84b751b6( n_timer );
    
    while ( isalive( self ) && n_timer >= 0 )
    {
        if ( istrue( self.var_43ca0dfb1b29c6ff ) || is_equal( player_activator, self ) || isdefined( var_e0f041f233006ee7 ) && s_exfil.var_c9164736baf0694a.size >= var_e0f041f233006ee7 )
        {
            self.s_exfil = s_exfil;
            s_exfil.var_c9164736baf0694a = function_6d6af8144a5131f1( s_exfil.var_c9164736baf0694a, self );
            self.var_85229ab89df19bb.label = %SHARED_HINTSTRINGS/EXFIL_OPT_IN_WAITING_FOR_OTHER_PLAYERS;
            
            if ( s_exfil.var_c9164736baf0694a.size >= s_exfil.var_953c0bb9dec80174.size )
            {
                s_exfil notify( "exfil_opt_in_done" );
            }
            
            callback::callback( "on_exfil_player_joined", s_exfil );
            self notify( "exfil_opt_in_done" );
            break;
        }
        else if ( istrue( self.var_fc0a0836d3931cdb ) )
        {
            s_exfil.var_953c0bb9dec80174 = array_remove( s_exfil.var_953c0bb9dec80174, self );
            self.var_85229ab89df19bb.label = %SHARED_HINTSTRINGS/EXFIL_OPT_IN_WAITING_FOR_OTHER_PLAYERS;
            
            if ( s_exfil.var_c9164736baf0694a.size >= s_exfil.var_953c0bb9dec80174.size )
            {
                s_exfil notify( "exfil_opt_in_done" );
            }
            
            self notify( "exfil_opt_in_done" );
            break;
        }
        
        waitframe();
        n_timer -= level.framedurationseconds;
    }
    
    if ( isdefined( self ) )
    {
        self.var_fd7c2a423b7a47a5 = undefined;
        self.var_43ca0dfb1b29c6ff = undefined;
        self.var_fc0a0836d3931cdb = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x52d1
// Size: 0x36
function private function_6a6527d46f420f47( s_exfil )
{
    self endon( "disconnect" );
    s_exfil waittill( "exfil_opt_in_done" );
    
    if ( isdefined( self.var_85229ab89df19bb ) )
    {
        self.var_85229ab89df19bb destroy();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x530f
// Size: 0xfd
function function_a5c4615f0b00ff83( s_exfil )
{
    if ( isdefined( level.var_570abefbef9b4a90 ) )
    {
        s_exfil_destination = [[ level.var_570abefbef9b4a90 ]]( s_exfil );
        return s_exfil_destination;
    }
    
    var_26efe5d3cfb2c000 = [];
    var_3b258b7b9af78cd5 = [];
    v_pos = ( 0, 0, 0 );
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        v_pos += player.origin;
    }
    
    v_pos /= s_exfil.var_c9164736baf0694a.size;
    s_exfil_destination = get_array_of_farthest( v_pos, s_exfil.var_fb43e2df572cabdf )[ 0 ];
    
    if ( !isdefined( s_exfil_destination ) )
    {
        s_exfil_destination = random( s_exfil.var_fb43e2df572cabdf );
    }
    
    return s_exfil_destination;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5415
// Size: 0x11b
function on_ai_killed( params )
{
    if ( istrue( self.var_47993ccd09da9c11 ) && !isdefined( self.var_941802a0997e0c42 ) )
    {
        player = params.eattacker;
        var_dbe260cceef2da56 = 0;
        
        if ( !isdefined( player ) )
        {
            return;
        }
        
        if ( isdefined( player.var_941802a0997e0c42 ) )
        {
            var_dbe260cceef2da56 = 1;
            player = player.var_941802a0997e0c42;
        }
        
        if ( player scripts\cp_mp\vehicles\vehicle::isvehicle() && !var_dbe260cceef2da56 )
        {
            player = params.eattacker.owner;
        }
        
        var_c2a1a952582c736 = isplayer( player ) && istrue( player.var_ea2269fdafc7eac ) && isdefined( player.s_exfil ) && isdefined( self.s_exfil ) && player.s_exfil == self.s_exfil;
        
        if ( var_c2a1a952582c736 || istrue( self.nuked ) )
        {
            println( "<dev string:x4af>" );
            function_530d63dcbaef6061( self.s_exfil );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5538
// Size: 0xca
function on_ai_damaged( params )
{
    level.var_250dc4a23947d41 = array_removeundefined( level.var_250dc4a23947d41 );
    
    foreach ( var_576f57af0204c38c in level.var_250dc4a23947d41 )
    {
        if ( function_18a23b9f6568641e() && var_576f57af0204c38c namespace_421fb1e92658d94c::function_773691f1a617f7d9( self.origin ) )
        {
            if ( isdefined( self.var_7050024e5f8ca246 ) && params.idamage >= self.health )
            {
                self.var_7e4b076a06c6df27 = 1;
                self [[ self.var_7050024e5f8ca246 ]]();
            }
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x560a
// Size: 0x36
function function_65ec7747ff7a397a( params )
{
    if ( isdefined( self.s_exfil ) )
    {
        println( "<dev string:x4af>" );
        function_530d63dcbaef6061( self.s_exfil );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5648
// Size: 0x56
function function_530d63dcbaef6061( s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    s_exfil.var_ed2b93690e12fb86 = array_removedead_or_dying( s_exfil.var_ed2b93690e12fb86 );
    
    if ( istrue( s_exfil.var_dd4749307484eec4 ) )
    {
        return;
    }
    
    s_exfil.n_kills++;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56a6
// Size: 0x12d
function function_890f1e94c79decb( s_exfil )
{
    v_start = ( 0, 0, 0 );
    a_players = s_exfil.var_c9164736baf0694a;
    
    foreach ( player in a_players )
    {
        v_start += player.origin;
    }
    
    v_start /= a_players.size;
    n_dist = distance2d( s_exfil.s_exfil_destination.origin, v_start );
    var_5c4014b318324da1 = n_dist / 10000;
    
    if ( isdefined( level.var_b1f9a4ecd91da49b ) )
    {
        var_d6d97e149fb05528 = level.var_b1f9a4ecd91da49b;
    }
    else
    {
        var_d6d97e149fb05528 = max( var_5c4014b318324da1 * 120, 120 ) + 60 + max( -30, min( 30, 3 * default_to( level.star_rating, 1 ) ) );
    }
    
    return int( min( 600, var_d6d97e149fb05528 ) );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57dc
// Size: 0xb1
function function_3c0534cf6dbf9399( s_exfil )
{
    s_exfil endon( "exfil_complete_kill_count" );
    s_exfil endon( "exfil_complete_timeout" );
    
    while ( true )
    {
        var_f47f25c4410f0c37 = 1;
        
        foreach ( player in s_exfil.var_c9164736baf0694a )
        {
            if ( isalive( player ) && player.sessionstate == "playing" )
            {
                var_f47f25c4410f0c37 = 0;
                break;
            }
        }
        
        if ( var_f47f25c4410f0c37 )
        {
            s_exfil notify( "exfil_players_dead" );
            break;
        }
        
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5895
// Size: 0x3a5
function function_3c26533e550baeb9( s_exfil, n_speed, n_acceleration, var_ec4d0b8900732e35 )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self endon( "death" );
    
    if ( istrue( self.leaving ) )
    {
        return;
    }
    
    n_speed = default_to( n_speed, 25 );
    n_acceleration = default_to( n_acceleration, 15 );
    var_ec4d0b8900732e35 = default_to( var_ec4d0b8900732e35, "air" );
    
    if ( self issuspendedvehicle() )
    {
        self wakeupvehicle();
    }
    
    self notify( "leaving" );
    self.leaving = 1;
    self clearlookatent();
    self.var_9882cd795c6bfaa = 1;
    function_90637b157ab21264( s_exfil );
    function_698d1a79b041d92e();
    scripts\common\vehicle_code::vehicle_disable_navobstacles();
    
    if ( istrue( s_exfil.var_b81951dbbe126712 ) )
    {
        function_c7311cb3f768f21e( s_exfil.name );
        s_exfil.var_b81951dbbe126712 = undefined;
    }
    
    var_7628ae7e56c936bb = undefined;
    
    if ( isdefined( s_exfil.s_exfil_destination.target2 ) )
    {
        var_50619964211c8bec = getstructarray( s_exfil.s_exfil_destination.target2, "targetname" );
        var_7628ae7e56c936bb = random( var_50619964211c8bec );
    }
    
    if ( isstruct( var_7628ae7e56c936bb ) )
    {
        while ( isstruct( var_7628ae7e56c936bb ) )
        {
            v_goal = var_7628ae7e56c936bb.origin;
            n_speed = default_to( var_7628ae7e56c936bb.script_speed, n_speed );
            n_acceleration = default_to( var_7628ae7e56c936bb.script_accel, n_acceleration );
            var_141440cafe6f5d9 = default_to( var_7628ae7e56c936bb.script_decel, n_acceleration / 2 );
            self vehicle_setspeed( n_speed, n_acceleration, var_141440cafe6f5d9 );
            function_d3cc50a6ae77242( v_goal, 0 );
            self waittill( "goal" );
            
            if ( isdefined( var_7628ae7e56c936bb.target ) )
            {
                var_50619964211c8bec = getstructarray( var_7628ae7e56c936bb.target, "targetname" );
                var_7628ae7e56c936bb = random( var_50619964211c8bec );
                continue;
            }
            
            break;
        }
    }
    else
    {
        if ( var_ec4d0b8900732e35 == "air" )
        {
            self vehicle_setspeed( n_speed, n_acceleration );
            v_goal = self.origin + ( 0, 0, 2000 );
        }
        else
        {
            self vehicle_setspeed( n_speed, n_acceleration );
            v_goal = self.origin + anglestoforward( ( 0, randomint( 360 ), 0 ) ) * 500;
        }
        
        function_d3cc50a6ae77242( v_goal, 1 );
        self waittill( "goal" );
        pathrandomness = 150;
        halfdistance = 25000;
        yaw = self.angles[ 1 ];
        direction = ( 0, yaw, 0 );
        v_end = self.origin + anglestoforward( direction ) * halfdistance;
        
        if ( var_ec4d0b8900732e35 == "air" )
        {
            var_a221887544c34172 = max( v_end[ 2 ], getdvarfloat( @"hash_7f6b2729e5a85bb5", 6000 ) );
            v_end = ( v_end[ 0 ], v_end[ 1 ], var_a221887544c34172 );
        }
        
        self vehicle_setspeed( n_speed * 3 );
        function_d3cc50a6ae77242( v_end, 0 );
        thread function_4b9b9bf8680f3b73();
        self waittill( "goal" );
    }
    
    self stoploopsound();
    
    if ( isdefined( self.mdl_rope ) )
    {
        self.mdl_rope delete();
    }
    
    if ( isdefined( self.e_navmesh ) )
    {
        self.e_navmesh unlink();
        self.e_navmesh.var_576f57af0204c38c = undefined;
    }
    
    function_fbe2ebb67d8d52dd( s_exfil, 1 );
    s_exfil notify( "exfil_vehicle_gone" );
    self notify( "exfil_vehicle_gone" );
    thread function_b7edf3fe42e320a6( s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x5c42
// Size: 0x151
function private function_d86f8d71e862ceb( s_exfil, var_402f13a206b51b0, iterations, ignoregroundent, distance )
{
    if ( !isdefined( ignoregroundent ) )
    {
        ignoregroundent = 0;
    }
    
    if ( !isdefined( distance ) )
    {
        distance = 1000;
    }
    
    self endon( "death" );
    var_42bef2b79361fa61 = s_exfil.var_ed2b93690e12fb86;
    var_42bef2b79361fa61 = array_combine_unique( var_42bef2b79361fa61, getaiarrayinradius( self.origin, distance ) );
    
    for (iteration = 0; iteration < iterations; iteration++) {
        foreach ( ai in var_42bef2b79361fa61 )
        {
            if ( isalive( ai ) && ai.team != var_402f13a206b51b0 )
            {
                groundent = ai getgroundentity();
                
                if ( ignoregroundent || isdefined( groundent ) && self == ai getgroundentity() )
                {
                    ai.var_7e4b076a06c6df27 = 1;
                    
                    if ( isdefined( ai.var_7050024e5f8ca246 ) )
                    {
                        ai [[ ai.var_7050024e5f8ca246 ]]();
                    }
                    
                    ai kill();
                    wait 0.2;
                }
            }
        }
        
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d9b
// Size: 0x159
function function_90637b157ab21264( s_exfil )
{
    if ( isarray( self.var_cac0b7d65fca5e1b ) )
    {
        var_402f13a206b51b0 = "allies";
        
        if ( isdefined( s_exfil ) )
        {
            if ( isdefined( s_exfil.player_activator ) )
            {
                var_402f13a206b51b0 = s_exfil.player_activator.team;
            }
            
            function_d86f8d71e862ceb( s_exfil, var_402f13a206b51b0, 1 );
        }
        
        waitframe();
        
        foreach ( var_50084330acc6846 in self.var_cac0b7d65fca5e1b )
        {
            destroynavlink( var_50084330acc6846 );
            waitframe();
        }
        
        var_42bef2b79361fa61 = getaiarrayinradius( self.origin, 1000 );
        
        foreach ( ai in var_42bef2b79361fa61 )
        {
            ai clearpath();
        }
        
        wait 0.2;
        self.var_cac0b7d65fca5e1b = undefined;
        
        if ( isdefined( s_exfil ) )
        {
            function_d86f8d71e862ceb( s_exfil, var_402f13a206b51b0, 2 );
            wait 1;
            function_d86f8d71e862ceb( s_exfil, var_402f13a206b51b0, 1, 1, 300 );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5efc
// Size: 0x2a
function function_5afba0462c9a0889()
{
    if ( isdefined( self.e_navmesh ) )
    {
        self.e_navmesh dockmovingplatform( undefined );
        self.var_f80d26d657cd2817 = 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f2e
// Size: 0x54
function function_698d1a79b041d92e()
{
    if ( isdefined( self.e_navmesh ) && istrue( self.var_f80d26d657cd2817 ) )
    {
        var_32227d5ad0dad6c9 = getdvarint( @"hash_272475e1eed3e1d0", 0 ) != 0;
        self.e_navmesh undockmovingplatform( var_32227d5ad0dad6c9 );
        self.var_f80d26d657cd2817 = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5f8a
// Size: 0x472
function exfil_timer( s_exfil, var_514253bf9141a3c4, var_b634aaf3ea2ab9ec )
{
    s_exfil notify( "end_exfil_timer" );
    s_exfil endon( "end_exfil_timer" );
    s_exfil.var_8d29349c076b7199 = 1;
    
    if ( isdefined( s_exfil.var_18da16a5ee3e8314.var_e3d833b1e5d30b03[ "exfil_timer" ] ) )
    {
        s_exfil.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b0afa182f3914d4f( "exfil_timer" );
    }
    
    s_exfil.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_95f8d1b9f6685b61( "exfil_timer", var_514253bf9141a3c4, &function_5daedbca2b53bfdf );
    str_result = s_exfil waittill_any_timeout_2( var_514253bf9141a3c4, "exfil_timer_force_complete", "exfil_players_dead" );
    s_exfil notify( "exfil_complete_timeout" );
    s_exfil ent_flag_set( "exfil_complete_timeout" );
    level notify( "exfil_time_remaining", 0, s_exfil );
    level callback::callback( "on_exfil_complete_timeout", s_exfil );
    
    if ( isdefined( s_exfil.var_576f57af0204c38c.interact ) && !function_18a23b9f6568641e() )
    {
        s_exfil.var_576f57af0204c38c.interact function_dfb78b3e724ad620( 0 );
    }
    
    if ( isdefined( s_exfil.s_exfil_destination.mdl_destination.n_obj_id ) )
    {
        if ( isdefined( s_exfil.var_d182b8d3f3aaa93b ) )
        {
            s_exfil.var_d182b8d3f3aaa93b notify( "end_exfil_interact_objective_distance" );
        }
        
        scripts\mp\objidpoolmanager::returnobjectiveid( s_exfil.s_exfil_destination.mdl_destination.n_obj_id );
        s_exfil.s_exfil_destination.mdl_destination.n_obj_id = undefined;
    }
    
    waitframe();
    namespace_68dc261109a9503f::endactivity( s_exfil.var_18da16a5ee3e8314, 0 );
    
    if ( isdefined( s_exfil.s_exfil_destination ) && isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_icon", "disabled_icon" );
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_smoke", "stop" );
    }
    
    s_exfil.s_exfil_destination.var_1326008dc390c510 = undefined;
    s_exfil.var_1326008dc390c510 = undefined;
    
    if ( !function_8d3b8265c47a2223() || function_8d3b8265c47a2223() && !getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
    {
        s_exfil.var_576f57af0204c38c thread function_3c26533e550baeb9( s_exfil );
        wait 1;
    }
    
    if ( !function_8d3b8265c47a2223() )
    {
        s_exfil.s_exfil_destination.mdl_destination delete();
    }
    
    if ( !function_8d3b8265c47a2223() )
    {
        s_exfil.s_exfil_destination = undefined;
    }
    
    s_exfil.var_18da16a5ee3e8314 = undefined;
    
    foreach ( ai in s_exfil.var_ed2b93690e12fb86 )
    {
        ai.s_exfil = undefined;
    }
    
    s_exfil.var_ed2b93690e12fb86 = [];
    s_exfil.var_c9164736baf0694a = array_removeundefined( s_exfil.var_c9164736baf0694a );
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        player.var_ed2b93690e12fb86 = [];
        
        if ( isdefined( player.var_d118936613d86299 ) )
        {
            player.var_d118936613d86299 destroy();
        }
        
        if ( function_8d3b8265c47a2223() )
        {
            player setclientomnvar( "ui_match_start_countdown", -1 );
            player setclientomnvar( "ui_is_exfil_countdown", 0 );
        }
    }
    
    function_fbe2ebb67d8d52dd( s_exfil );
    
    if ( isdefined( level.var_5a7da78693d33e77 ) && !isdefined( var_b634aaf3ea2ab9ec ) )
    {
        var_b634aaf3ea2ab9ec = [[ level.var_5a7da78693d33e77 ]]();
    }
    
    var_136f67d0e18850d3 = isdefined( var_b634aaf3ea2ab9ec ) ? var_b634aaf3ea2ab9ec : getdvarint( @"hash_62412da41b8eaf67", 60 );
    logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " will reset in " + var_136f67d0e18850d3 + " seconds!" );
    level delaythread( var_136f67d0e18850d3, &reset_exfil, s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6404
// Size: 0x1f1
function exfil_timer_player_ui( var_514253bf9141a3c4, s_exfil )
{
    self notify( "endon_exfil_timer_player_ui" );
    self endon( "endon_exfil_timer_player_ui" );
    
    if ( function_8d3b8265c47a2223() )
    {
        thread exfil_defend_mode_timer( s_exfil );
    }
    
    str_notify = s_exfil waittill_any_timeout_2( var_514253bf9141a3c4, "exfil_complete_timeout", "exfil_players_dead" );
    
    if ( isalive( self ) && str_notify != "exfil_players_dead" && ( istrue( self.var_f52eb40ba99ffa4c ) || istrue( self.var_68b9486f4adbcb62 ) ) )
    {
        if ( function_18a23b9f6568641e() )
        {
            if ( istrue( self.var_68b9486f4adbcb62 ) )
            {
                var_c9b69aecc5c631ed = scripts\cp_mp\utility\squad_utility::getsquadmembers();
                
                foreach ( squad_member in var_c9b69aecc5c631ed )
                {
                    if ( !isalive( squad_member ) )
                    {
                        break;
                    }
                }
                
                if ( isdefined( level.var_53677277fc550387 ) )
                {
                    if ( ![[ level.var_53677277fc550387 ]]( var_c9b69aecc5c631ed ) )
                    {
                        thread function_36d898a4d1fd0a31( s_exfil );
                    }
                }
                else
                {
                    thread function_36d898a4d1fd0a31( s_exfil );
                }
                
                params = spawnstruct();
                params.s_exfil = s_exfil;
                callback::callback( "on_exfil_exiting_ao", params );
                s_exfil.var_576f57af0204c38c.interact function_ef855ac387639af6( self );
            }
            else if ( istrue( self.var_f52eb40ba99ffa4c ) )
            {
                if ( function_8d3b8265c47a2223() )
                {
                    function_5de93100388ae73a( s_exfil );
                }
                else
                {
                    s_exfil.var_576f57af0204c38c thread function_59e7feccaa753a46( self, 1 );
                }
            }
        }
    }
    else
    {
        function_5de93100388ae73a( s_exfil );
    }
    
    if ( str_notify == "timeout" || str_notify == "exfil_complete_timeout" )
    {
        self notify( "exfil_time_remaining", 0 );
    }
    
    if ( isdefined( self ) )
    {
        self.s_exfil = undefined;
        self.var_ea2269fdafc7eac = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65fd
// Size: 0x6a
function function_36d898a4d1fd0a31( s_exfil )
{
    if ( function_4027f5445bb7c8fb( s_exfil ) )
    {
        return;
    }
    
    if ( !istrue( s_exfil.var_bab7d5b1eb545062 ) )
    {
        var_1d4ef168fa9068f8 = function_2a44a4371afd7190( s_exfil );
        
        if ( var_1d4ef168fa9068f8.size )
        {
            thread utility::delaythread( 7, &function_895c7e0e9911ff6e, s_exfil, "exfil_called_exiting_ao_zombies_inside" );
            return;
        }
        
        thread utility::delaythread( 7, &function_895c7e0e9911ff6e, s_exfil, "exfil_called_exiting_ao" );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x666f
// Size: 0x136
function function_5de93100388ae73a( s_exfil )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self endon( "disconnect" );
    
    if ( !isdefined( s_exfil.var_ba71f0b6b1b651f5 ) )
    {
        s_exfil.var_ba71f0b6b1b651f5 = "exfil_called_timeout";
    }
    
    if ( !function_4027f5445bb7c8fb( s_exfil ) )
    {
        thread function_895c7e0e9911ff6e( s_exfil, s_exfil.var_ba71f0b6b1b651f5 );
    }
    
    if ( function_8d3b8265c47a2223() && function_18a23b9f6568641e() )
    {
        s_exfil waittill_any_timeout_1( 15, "exfil_vehicle_gone" );
        
        if ( isalive( self ) && isdefined( s_exfil.var_576f57af0204c38c ) && array_contains_key( s_exfil.var_576f57af0204c38c.playersinside, self.guid ) )
        {
            self.var_764da0de2a46452c = 1;
            s_exfil.var_576f57af0204c38c.interact function_ef855ac387639af6( self );
            return;
        }
    }
    
    if ( !istrue( level.var_40e72101aaba1098 ) )
    {
        thread scripts\mp\hud_message::showsplash( "cp_mp_exfil_failure" );
    }
    
    callback::callback( "on_exfil_player_failure", s_exfil );
    
    if ( isdefined( s_exfil.var_18da16a5ee3e8314 ) )
    {
        s_exfil.var_18da16a5ee3e8314 namespace_d886885225a713a7::function_91c9ad377a3c4725( s_exfil.var_18da16a5ee3e8314, self );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67ad
// Size: 0x258
function function_62265a47b3eedbaa( s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    
    if ( !isdefined( s_exfil.var_18da16a5ee3e8314 ) )
    {
        return;
    }
    
    var_61e5ce4489b4c22b = 0;
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        if ( isalive( player ) && player.sessionstate == "playing" && istrue( player.var_ea2269fdafc7eac ) )
        {
            var_61e5ce4489b4c22b = 1;
            break;
        }
    }
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        if ( istrue( s_exfil.var_dd4749307484eec4 ) )
        {
            s_exfil.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d( "exfil_get_to_vehicle", [ player ] );
            s_exfil.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d( "exfil_kills_remaining", [ player ] );
            
            if ( !function_8d3b8265c47a2223() )
            {
                s_exfil.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18( "exfil_board_vehicle", [ player ] );
            }
            
            continue;
        }
        
        if ( istrue( player.var_ea2269fdafc7eac ) || istrue( level.var_c0cced8a5f5b9107 ) && var_61e5ce4489b4c22b )
        {
            if ( function_8d3b8265c47a2223() )
            {
                if ( istrue( player.var_68b9486f4adbcb62 ) )
                {
                }
            }
            else
            {
                s_exfil.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d( "exfil_get_to_vehicle", [ player ] );
                s_exfil.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18( "exfil_kills_remaining", [ player ] );
            }
            
            continue;
        }
        
        if ( !istrue( player.var_ea2269fdafc7eac ) || istrue( level.var_c0cced8a5f5b9107 ) && !var_61e5ce4489b4c22b )
        {
            if ( function_8d3b8265c47a2223() )
            {
                continue;
            }
            
            s_exfil.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_f2a618a7ad2f558d( "exfil_kills_remaining", [ player ] );
            s_exfil.var_18da16a5ee3e8314 namespace_277c27ef297ef569::function_1281c7fff9456e18( "exfil_get_to_vehicle", [ player ] );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a0d
// Size: 0x12d
function function_689f5a3123aba709( s_exfil )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    s_exfil endon( "exfil_complete_kill_count" );
    s_exfil endon( "exfil_complete_timeout" );
    self endon( "disconnect" );
    s_exfil.var_c9164736baf0694a = default_to( s_exfil.var_c9164736baf0694a, [] );
    s_exfil.var_c9164736baf0694a = function_6d6af8144a5131f1( s_exfil.var_c9164736baf0694a, self );
    waitframe();
    
    if ( function_8db1b18eb8068fb9( s_exfil ) )
    {
        self.var_ea2269fdafc7eac = 1;
        s_exfil ent_flag_set( "player_reached_exfil" );
    }
    
    function_62265a47b3eedbaa( s_exfil );
    
    while ( true )
    {
        if ( isdefined( s_exfil ) && isdefined( s_exfil.s_exfil_destination ) )
        {
            if ( istrue( self.var_ea2269fdafc7eac ) && ( !isalive( self ) || !function_8db1b18eb8068fb9( s_exfil ) ) )
            {
                self.var_ea2269fdafc7eac = undefined;
                function_62265a47b3eedbaa( s_exfil );
            }
            else if ( !istrue( self.var_ea2269fdafc7eac ) && function_8db1b18eb8068fb9( s_exfil ) )
            {
                self.var_ea2269fdafc7eac = 1;
                s_exfil ent_flag_set( "player_reached_exfil" );
                function_62265a47b3eedbaa( s_exfil );
            }
        }
        
        wait 0.5;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b42
// Size: 0x62
function function_8db1b18eb8068fb9( s_exfil )
{
    if ( isdefined( level.var_6859449d7f699aec ) )
    {
        return [[ level.var_6859449d7f699aec ]]( s_exfil );
    }
    else if ( isdefined( s_exfil.s_exfil_destination ) )
    {
        return ( distancesquared( self.origin, s_exfil.s_exfil_destination.origin ) <= 3062500 );
    }
    
    return 0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6bad
// Size: 0x223
function function_2503b81a18276e3f( s_exfil, player_activator )
{
    if ( isdefined( level.var_537c4380eaca8f1c ) )
    {
        level thread [[ level.var_537c4380eaca8f1c ]]( s_exfil, player_activator );
        return;
    }
    
    function_871ded736cf89cc4( s_exfil );
    s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_site", "standby" );
    
    if ( function_4027f5445bb7c8fb( s_exfil ) )
    {
        level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare( s_exfil.s_exfil_destination.origin, "dmz_exfil", undefined, 1 );
    }
    else
    {
        level thread namespace_1eb3c4e0e28fac71::utilflare_shootflare( s_exfil.s_exfil_destination.origin, "dmz_exfil" );
    }
    
    if ( !function_8d3b8265c47a2223() )
    {
        s_exfil.s_exfil_destination.mdl_destination makeunusable();
    }
    
    if ( istrue( level.var_a77333195caab0e3 ) && !istrue( s_exfil.var_9dae2c1a677985a8 ) )
    {
        n_obj_id = scripts\mp\objidpoolmanager::requestobjectiveid( 1 );
        s_exfil.s_exfil_destination.mdl_destination.n_obj_id = n_obj_id;
        scripts\mp\objidpoolmanager::objective_add_objective( n_obj_id, "invisible", s_exfil.s_exfil_destination.mdl_destination.origin, "ui_map_icon_cp_mp_exfil", "icon_small" );
        
        if ( isent( s_exfil.s_exfil_destination.mdl_destination ) )
        {
            scripts\mp\objidpoolmanager::update_objective_onentity( n_obj_id, s_exfil.s_exfil_destination.mdl_destination );
        }
        
        scripts\mp\objidpoolmanager::update_objective_setzoffset( n_obj_id, 40 );
        objective_setlabel( n_obj_id, %SHARED_HINTSTRINGS/EXFIL );
        
        foreach ( player in s_exfil.var_c9164736baf0694a )
        {
            objective_addclienttomask( n_obj_id, player );
            objective_showtoplayersinmask( n_obj_id );
        }
    }
    
    level thread function_e0733edbed9b4d59( s_exfil, player_activator );
    s_exfil ent_flag_wait( "exfil_complete_kill_count" );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6dd8
// Size: 0xcf
function function_5b992e42fb3acc6e( s_exfil )
{
    self endon( "leaving" );
    s_exfil endon( "exfil_complete_timeout" );
    self waittill( "death" );
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        if ( isdefined( player ) )
        {
            player.s_exfil = undefined;
            player.var_ea2269fdafc7eac = undefined;
        }
    }
    
    if ( istrue( s_exfil.var_8d29349c076b7199 ) )
    {
        s_exfil notify( "exfil_timer_force_complete" );
    }
    else
    {
        level thread exfil_timer( s_exfil, 1, 1 );
        s_exfil notify( "exfil_timer_force_complete" );
    }
    
    if ( isdefined( self ) )
    {
        function_90637b157ab21264( s_exfil );
        function_b7edf3fe42e320a6( s_exfil );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6eaf
// Size: 0x59
function function_4ade3f10e35d81fc( n_time, v_destination )
{
    n_speed = 30;
    
    if ( n_time > 0 )
    {
        var_e17f7dba583248bd = n_time / 3600;
        var_2b2e9399c3f18884 = distance( self.origin, v_destination ) / 63360;
        n_speed = var_2b2e9399c3f18884 / var_e17f7dba583248bd;
    }
    
    return n_speed;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6f11
// Size: 0x1877
function function_e0733edbed9b4d59( s_exfil, player_activator, var_ec4d0b8900732e35 )
{
    n_speed = 150;
    n_acceleration = 15;
    var_686b3d1d807eeac2 = s_exfil.s_exfil_destination.origin;
    var_ec4d0b8900732e35 = default_to( var_ec4d0b8900732e35, "air" );
    var_4805567cd9027bd7 = undefined;
    
    if ( isdefined( s_exfil.s_exfil_destination.target ) && !istrue( s_exfil.var_a22c85cb6c2df5a0 ) )
    {
        var_c90a0dae35b30ec8 = getstructarray( s_exfil.s_exfil_destination.target, "targetname" );
        var_4805567cd9027bd7 = random( var_c90a0dae35b30ec8 );
    }
    
    if ( isdefined( level.var_3a96331857b5f453 ) && isdefined( s_exfil.targetname ) && isdefined( getstruct( s_exfil.targetname, "script_noteworthy" ) ) )
    {
        var_4805567cd9027bd7 = getstruct( s_exfil.targetname, "script_noteworthy" );
    }
    
    if ( isstruct( var_4805567cd9027bd7 ) )
    {
        var_1790664d2cfa3432 = var_4805567cd9027bd7.origin;
        s_exfil.v_spawn_ang = var_4805567cd9027bd7.angles;
    }
    else
    {
        var_64b356b06ba31794 = level.mapcenter - var_686b3d1d807eeac2;
        var_64b356b06ba31794 = vectornormalize( ( var_64b356b06ba31794[ 0 ], var_64b356b06ba31794[ 1 ], 0 ) );
        var_1790664d2cfa3432 = var_64b356b06ba31794 * -30000 + ( 0, 0, 1 ) * 1000 * 2 + ( 0, 0, var_686b3d1d807eeac2[ 2 ] );
    }
    
    s_exfil.var_576f57af0204c38c = function_98cfcc7bd2f1db6c( s_exfil, player_activator, var_1790664d2cfa3432 );
    s_exfil.var_576f57af0204c38c thread function_5b992e42fb3acc6e( s_exfil );
    s_exfil.var_576f57af0204c38c endon( "death" );
    s_exfil.var_576f57af0204c38c endon( "leaving" );
    s_exfil.var_576f57af0204c38c function_f909f101541f5e10( 1 );
    var_e17f7dba583248bd = getdvarint( @"hash_eb873c5e99093d11", 50 );
    n_speed = s_exfil.var_576f57af0204c38c function_4ade3f10e35d81fc( var_e17f7dba583248bd, var_686b3d1d807eeac2 );
    
    if ( n_speed <= 15 )
    {
        n_speed = 15;
    }
    
    n_start_time = gettime();
    s_exfil.var_576f57af0204c38c thread function_a0a341bd8db877c3( s_exfil );
    
    if ( isstruct( var_4805567cd9027bd7 ) )
    {
        while ( isstruct( var_4805567cd9027bd7 ) )
        {
            v_goal = var_4805567cd9027bd7.origin;
            var_f265596c068668b2 = default_to( var_4805567cd9027bd7.script_speed, n_speed );
            n_acceleration = default_to( var_4805567cd9027bd7.script_accel, n_acceleration );
            var_141440cafe6f5d9 = default_to( var_4805567cd9027bd7.script_decel, n_acceleration / 2 );
            s_exfil.var_576f57af0204c38c vehicle_setspeed( var_f265596c068668b2, n_acceleration, var_141440cafe6f5d9 );
            s_exfil.var_576f57af0204c38c function_d3cc50a6ae77242( v_goal, !isdefined( var_4805567cd9027bd7.target ) );
            msg = s_exfil.var_576f57af0204c38c waittill_any_timeout_1( 40, "goal" );
            
            if ( isdefined( var_4805567cd9027bd7.target ) )
            {
                var_c90a0dae35b30ec8 = getstructarray( var_4805567cd9027bd7.target, "targetname" );
                var_4805567cd9027bd7 = random( var_c90a0dae35b30ec8 );
                continue;
            }
            
            break;
        }
    }
    
    if ( isdefined( level.var_3a96331857b5f453 ) && isdefined( s_exfil.targetname ) && isdefined( getstruct( s_exfil.targetname + "_dest", "script_noteworthy" ) ) )
    {
        s_exfil.s_land = getstruct( s_exfil.targetname + "_dest", "script_noteworthy" );
        s_exfil.v_land = s_exfil.s_land.origin;
        var_57691bb062576aca = s_exfil.v_land + ( 0, 0, 1000 );
    }
    else
    {
        var_57691bb062576aca = var_686b3d1d807eeac2 + ( 0, 0, 1000 );
    }
    
    s_exfil.var_576f57af0204c38c vehicle_setspeed( n_speed, n_acceleration );
    s_exfil.var_576f57af0204c38c function_d3cc50a6ae77242( var_57691bb062576aca, 1 );
    str_return = s_exfil.var_576f57af0204c38c waittill_any_timeout_1( var_e17f7dba583248bd + 15, "goal" );
    
    if ( str_return == "timeout" )
    {
        s_exfil.var_576f57af0204c38c.origin = var_57691bb062576aca;
    }
    
    n_elapsed_time = utility::function_c89ed1840c8d0f0f( gettime() - n_start_time );
    
    /#
        iprintln( "<dev string:x4c2>" + s_exfil.name + "<dev string:x4db>" + n_elapsed_time + "<dev string:x4e5>" );
    #/
    
    logstring( "Exfil Helicopter at: " + s_exfil.name + " took " + n_elapsed_time + " seconds to arrive" );
    s_exfil.var_576f57af0204c38c function_f909f101541f5e10( 0 );
    
    if ( function_8d3b8265c47a2223() )
    {
        s_exfil ent_flag_wait( "player_reached_exfil" );
    }
    else
    {
        s_exfil ent_flag_wait( "exfil_complete_kill_count" );
    }
    
    if ( !istrue( s_exfil.var_1defa642cf137bd ) )
    {
        if ( isdefined( level.var_667b02b5d11ccfcb ) )
        {
            foreach ( player in s_exfil.var_c9164736baf0694a )
            {
                if ( ![[ level.var_667b02b5d11ccfcb ]]( player ) )
                {
                    player thread function_895c7e0e9911ff6e( s_exfil, "exfil_called_landing" );
                }
            }
        }
        else
        {
            s_exfil.var_c9164736baf0694a thread function_895c7e0e9911ff6e( s_exfil, "exfil_called_landing" );
        }
    }
    
    if ( isdefined( s_exfil.s_exfil_destination ) && isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_smoke", "dissipate" );
    }
    
    var_72464fd78466e015 = s_exfil.var_576f57af0204c38c tagexists( "tag_ground" ) ? "tag_ground" : "tag_origin_static";
    var_72464fd78466e015 = default_to( var_72464fd78466e015, "tag_origin" );
    
    if ( function_18a23b9f6568641e() )
    {
        if ( isdefined( level.var_3a96331857b5f453 ) && isdefined( s_exfil.v_land ) )
        {
            v_descend = s_exfil.v_land;
            var_72464fd78466e015 = "tag_origin";
        }
        else
        {
            v_halfsize = s_exfil.var_576f57af0204c38c getboundshalfsize();
            var_9beefe21d77d578 = getgroundposition( var_686b3d1d807eeac2 + ( 0, 0, 8 ), max( v_halfsize[ 0 ], v_halfsize[ 1 ] ) ) + ( 0, 0, 4 );
            v_descend = var_9beefe21d77d578;
        }
    }
    else
    {
        s_exfil.var_576f57af0204c38c.mdl_rope = utility::spawn_model( "br_plunder_extraction_delivery_rope", s_exfil.var_576f57af0204c38c.origin, s_exfil.var_576f57af0204c38c.angles );
        s_exfil.var_576f57af0204c38c.mdl_rope linkto( s_exfil.var_576f57af0204c38c, var_72464fd78466e015, ( 0, 0, 0 ), ( 0, 0, 0 ) );
        v_descend = var_686b3d1d807eeac2 + ( 0, 0, 307.692 );
    }
    
    var_ee8324d52198d1dd = s_exfil.var_576f57af0204c38c function_4ade3f10e35d81fc( getdvarfloat( @"hash_346baccb7a031727", 7 ), v_descend );
    s_exfil.var_576f57af0204c38c vehicle_setspeed( var_ee8324d52198d1dd, 5 );
    var_6b0ec32547042455 = undefined;
    
    if ( isdefined( level.var_3a96331857b5f453 ) && isdefined( s_exfil.s_land ) )
    {
        s_exfil.var_576f57af0204c38c function_d3cc50a6ae77242( v_descend, 1, s_exfil.s_land.angles );
        var_6b0ec32547042455 = s_exfil.s_land.angles[ 1 ];
    }
    else
    {
        s_exfil.var_576f57af0204c38c function_d3cc50a6ae77242( v_descend, 1, s_exfil.s_exfil_destination.angles );
        var_6b0ec32547042455 = s_exfil.s_exfil_destination.angles[ 1 ];
    }
    
    if ( function_18a23b9f6568641e() )
    {
        v_halfsize = s_exfil.var_576f57af0204c38c getboundshalfsize();
        n_radius = max( v_halfsize[ 0 ], v_halfsize[ 1 ] );
        s_exfil.var_576f57af0204c38c.interact = s_exfil.var_576f57af0204c38c;
        s_exfil.var_576f57af0204c38c.interact.s_exfil = s_exfil;
        s_exfil.var_576f57af0204c38c thread function_25794fb990b0b716( var_72464fd78466e015, v_descend );
        
        while ( true )
        {
            var_6587fb87039b58d4 = s_exfil.var_576f57af0204c38c gettagorigin( var_72464fd78466e015 );
            var_9a09f0bcc9be9dde = s_exfil.var_576f57af0204c38c vehicle_getspeed();
            var_6b2f4df48eb57c0d = s_exfil.var_576f57af0204c38c.angles[ 1 ] - var_6b0ec32547042455;
            n_height_diff = var_6587fb87039b58d4[ 2 ] - v_descend[ 2 ];
            
            if ( abs( n_height_diff ) <= 4 || istrue( s_exfil.var_576f57af0204c38c.var_7bb70699db655bd6 ) )
            {
                break;
            }
            
            foreach ( player in level.players )
            {
                if ( function_8d3b8265c47a2223() )
                {
                    continue;
                }
                
                if ( isalive( player ) && player.sessionstate == "playing" && distance( player.origin, v_descend ) < n_radius )
                {
                    dir = vectornormalize( v_descend - player.origin );
                    vel = dir * -150;
                    player setvelocity( vel );
                }
            }
            
            var_d5eb755a325771ba = getentarrayinradius( "script_vehicle", "code_classname", v_descend, n_radius, 1 );
            
            foreach ( vehicle in var_d5eb755a325771ba )
            {
                if ( vehicle == s_exfil.var_576f57af0204c38c )
                {
                    continue;
                }
                
                if ( isalive( vehicle ) )
                {
                    if ( vehicle istouching( s_exfil.var_576f57af0204c38c ) )
                    {
                        scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_ejectalloccupants( vehicle );
                        vehicle dodamage( vehicle.health + 666, vehicle.origin );
                    }
                }
            }
            
            var_42bef2b79361fa61 = getaiarrayinradius( v_descend, n_radius );
            
            foreach ( ai in var_42bef2b79361fa61 )
            {
                if ( isalive( ai ) && ai istouching( s_exfil.var_576f57af0204c38c ) )
                {
                    ai kill();
                }
            }
            
            waitframe();
        }
    }
    else
    {
        s_exfil.var_576f57af0204c38c.interact = scripts\cp_mp\interaction::register_interact( s_exfil.s_exfil_destination.origin + ( 0, 0, 16 ), 100, &function_ef855ac387639af6, %SHARED_HINTSTRINGS/EXFIL_COMPLETE_USE );
        s_exfil.var_576f57af0204c38c.interact.s_exfil = s_exfil;
        msg = s_exfil.var_576f57af0204c38c waittill_any_timeout_1( 10, "goal" );
    }
    
    s_exfil.var_576f57af0204c38c ent_flag_set( "landed" );
    calloutmarkerping::function_ffd6eed18c767472( s_exfil.var_d182b8d3f3aaa93b, s_exfil.var_576f57af0204c38c, 6, 21, ( 0, 0, 72 ) );
    
    if ( !istrue( s_exfil.var_4e8463d4b66778dc ) )
    {
        s_exfil.var_c9164736baf0694a thread function_895c7e0e9911ff6e( s_exfil, "exfil_called_touchdown" );
    }
    
    if ( s_exfil.var_576f57af0204c38c scripts\common\vehicle::ishelicopter() && function_18a23b9f6568641e() )
    {
        s_exfil.var_576f57af0204c38c sethoverparams( 0, 0, 0 );
        s_exfil.var_576f57af0204c38c cleargoalyaw();
        s_exfil.var_576f57af0204c38c settargetyaw( flat_angle( s_exfil.var_576f57af0204c38c.angles )[ 1 ] );
    }
    
    s_exfil.var_576f57af0204c38c scripts\common\vehicle_code::vehicle_remove_navobstacle();
    s_exfil.var_576f57af0204c38c.navobstacleid = createnavbadplacebyent( s_exfil.var_576f57af0204c38c );
    wait 0.5;
    s_exfil.var_576f57af0204c38c scripts\common\vehicle_code::vehicle_remove_navobstacle();
    s_exfil.var_576f57af0204c38c.navobstacleid = createnavbadplacebyent( s_exfil.var_576f57af0204c38c );
    var_42bef2b79361fa61 = getaiarrayinradius( v_descend, n_radius );
    
    foreach ( ai in var_42bef2b79361fa61 )
    {
        if ( isalive( ai ) && ai istouching( s_exfil.var_576f57af0204c38c ) )
        {
            ai kill();
            waitframe();
        }
    }
    
    if ( function_8d3b8265c47a2223() && getdvarint( @"hash_46e4f95ef8ccb491", 0 ) )
    {
        waitframe();
        s_exfil.var_576f57af0204c38c.var_3c8a83869e2d8da = 0;
        
        if ( !isdefined( s_exfil.var_576f57af0204c38c.e_navmesh ) )
        {
            var_df3db7e4827942b6 = getentarray( "walkable_heli_navmesh", "targetname" );
            
            foreach ( var_e9fc2f7678426142 in var_df3db7e4827942b6 )
            {
                if ( !isdefined( var_e9fc2f7678426142.var_576f57af0204c38c ) )
                {
                    s_exfil.var_576f57af0204c38c.e_navmesh = var_e9fc2f7678426142;
                    s_exfil.var_576f57af0204c38c.e_navmesh show();
                    s_exfil.var_576f57af0204c38c.e_navmesh solid();
                    var_e9fc2f7678426142.var_576f57af0204c38c = s_exfil.var_576f57af0204c38c;
                    s_exfil.var_576f57af0204c38c.e_navmesh.origin = s_exfil.var_576f57af0204c38c.origin;
                    s_exfil.var_576f57af0204c38c.e_navmesh.angles = s_exfil.var_576f57af0204c38c.angles;
                    s_exfil.var_576f57af0204c38c.e_navmesh linkto( s_exfil.var_576f57af0204c38c, "tag_origin", ( 0, 0, -6 ), ( 0, 0, 0 ) );
                    break;
                }
            }
        }
        
        if ( isdefined( s_exfil.var_576f57af0204c38c.e_navmesh ) )
        {
            s_exfil.var_576f57af0204c38c function_5afba0462c9a0889();
            s_exfil.var_576f57af0204c38c.e_navmesh.moverdoesnotkill = 1;
            s_exfil.var_576f57af0204c38c.e_navmesh.carriabletype = 1;
            var_59d36e2537eb9215 = s_exfil.var_576f57af0204c38c gettagangles( "tag_turret_rear" ) + ( 0, 90, 0 );
            var_11e758fc4333f947 = s_exfil.var_576f57af0204c38c gettagorigin( "tag_turret_rear" ) + anglestoforward( var_59d36e2537eb9215 ) * 100;
            var_878db166ee07c0ad = var_11e758fc4333f947 + anglestoforward( var_59d36e2537eb9215 ) * 30;
            var_d9bf73caac395a66 = s_exfil.var_576f57af0204c38c gettagangles( "tag_turret_left" );
            var_91cf3756ceb58cfc = s_exfil.var_576f57af0204c38c gettagorigin( "tag_turret_left" ) + anglestoforward( var_d9bf73caac395a66 ) * -20 + anglestoforward( var_59d36e2537eb9215 ) * 10;
            var_859e2c0cf71107de = var_91cf3756ceb58cfc + anglestoforward( var_d9bf73caac395a66 ) * 80;
            var_c44d47f56e2e293b = s_exfil.var_576f57af0204c38c gettagangles( "tag_turret_right" );
            var_bacf92acacfc05a9 = s_exfil.var_576f57af0204c38c gettagorigin( "tag_turret_right" ) + anglestoforward( var_c44d47f56e2e293b ) * -20 + anglestoforward( var_59d36e2537eb9215 ) * 10;
            var_92d78f2a9e00400f = var_bacf92acacfc05a9 + anglestoforward( var_c44d47f56e2e293b ) * 80 + anglestoforward( var_59d36e2537eb9215 ) * -10;
            var_34dc9e9012fdcad9 = var_11e758fc4333f947 + ( 0, 0, 4 ) + anglestoforward( var_d9bf73caac395a66 ) * 20;
            var_5abff59ffaf0965f = var_878db166ee07c0ad + anglestoforward( var_d9bf73caac395a66 ) * 20;
            var_236a941ea9a8237a = var_11e758fc4333f947 + ( 0, 0, 4 ) + anglestoforward( var_c44d47f56e2e293b ) * 20;
            var_c77c56bb4875780c = var_878db166ee07c0ad + anglestoforward( var_c44d47f56e2e293b ) * 20;
            var_7be063cc20e0b014 = s_exfil.var_576f57af0204c38c gettagangles( "wheel_rear_left" );
            var_45cb3f35ff5c5436 = s_exfil.var_576f57af0204c38c gettagorigin( "wheel_rear_left" ) + ( 0, 0, 100 );
            var_aefcd015f728958 = s_exfil.var_576f57af0204c38c gettagorigin( "wheel_rear_left" ) + anglestoleft( var_7be063cc20e0b014 ) * 70;
            var_1ce92188a70af59f = s_exfil.var_576f57af0204c38c gettagangles( "wheel_rear_right" );
            var_7ee420fb0a326689 = s_exfil.var_576f57af0204c38c gettagorigin( "wheel_rear_right" ) + ( 0, 0, 100 );
            var_f3979475a517bd2f = s_exfil.var_576f57af0204c38c gettagorigin( "wheel_rear_right" ) + anglestoright( var_1ce92188a70af59f ) * 70;
            var_68ca99f6005e692a = s_exfil.var_576f57af0204c38c gettagorigin( "wheel_rear_left" ) + ( 0, 0, 100 ) + anglestoforward( var_7be063cc20e0b014 ) * 60;
            var_1cb4e98d5a62639c = s_exfil.var_576f57af0204c38c gettagorigin( "wheel_rear_left" ) + anglestoforward( var_7be063cc20e0b014 ) * 140;
            var_c6ac57dbfe079b05 = s_exfil.var_576f57af0204c38c gettagorigin( "wheel_rear_right" ) + ( 0, 0, 100 ) + anglestoforward( var_1ce92188a70af59f ) * 60;
            var_6f722903c1e6ccb = s_exfil.var_576f57af0204c38c gettagorigin( "wheel_rear_right" ) + anglestoforward( var_1ce92188a70af59f ) * 140;
            
            if ( !isdefined( level.var_898f44671aebc109 ) )
            {
                level.var_898f44671aebc109 = 0;
            }
            
            level.var_898f44671aebc109 += 1;
            n_ent_num = level.var_898f44671aebc109;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 0 ] = "traverse_helicopter_rear_left_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 1 ] = "traverse_helicopter_rear_right_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 2 ] = "traverse_helicopter_left_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 3 ] = "traverse_helicopter_right_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 4 ] = "traverse_helicopter_reverse_rear_left_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 5 ] = "traverse_helicopter_reverse_rear_right_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 6 ] = "traverse_helicopter_reverse_left_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 7 ] = "traverse_helicopter_reverse_right_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 8 ] = "traverse_helicopter_wing_left_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 9 ] = "traverse_helicopter_wing_right_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 10 ] = "traverse_helicopter_reverse_wing_left_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 11 ] = "traverse_helicopter_reverse_wing_right_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 12 ] = "traverse_helicopter_wing_front_left_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 13 ] = "traverse_helicopter_wing_front_right_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 14 ] = "traverse_helicopter_reverse_wing_front_left_" + n_ent_num;
            s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 15 ] = "traverse_helicopter_reverse_wing_front_right_" + n_ent_num;
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 0 ], var_5abff59ffaf0965f, var_34dc9e9012fdcad9 );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 1 ], var_c77c56bb4875780c, var_236a941ea9a8237a );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 2 ], var_859e2c0cf71107de, var_91cf3756ceb58cfc + ( 0, 0, 4 ) );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 3 ], var_92d78f2a9e00400f, var_bacf92acacfc05a9 + ( 0, 0, 4 ) );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 4 ], var_34dc9e9012fdcad9, var_5abff59ffaf0965f );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 5 ], var_236a941ea9a8237a, var_c77c56bb4875780c );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 6 ], var_91cf3756ceb58cfc + ( 0, 0, 4 ), var_859e2c0cf71107de );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 7 ], var_bacf92acacfc05a9 + ( 0, 0, 4 ), var_92d78f2a9e00400f );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 8 ], var_45cb3f35ff5c5436, var_aefcd015f728958 );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 9 ], var_7ee420fb0a326689, var_f3979475a517bd2f );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 10 ], var_aefcd015f728958, var_45cb3f35ff5c5436 );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 11 ], var_f3979475a517bd2f, var_7ee420fb0a326689 );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 12 ], var_68ca99f6005e692a, var_1cb4e98d5a62639c );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 13 ], var_c6ac57dbfe079b05, var_6f722903c1e6ccb );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 14 ], var_1cb4e98d5a62639c, var_68ca99f6005e692a );
            createnavlink( s_exfil.var_576f57af0204c38c.var_cac0b7d65fca5e1b[ 15 ], var_6f722903c1e6ccb, var_c6ac57dbfe079b05 );
        }
    }
    
    s_exfil.var_576f57af0204c38c thread function_e76e826b76d20d32( s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8790
// Size: 0xa7
function function_a0a341bd8db877c3( s_exfil )
{
    self endon( "death" );
    self endon( "landed" );
    
    while ( isdefined( s_exfil.s_exfil_destination ) && !istrue( s_exfil.var_35d53d54bebe2864 ) )
    {
        var_465c08a30c93971a = distance( self.origin, s_exfil.s_exfil_destination.origin ) / 63360 / max( 1, self vehicle_getspeed() );
        var_465c08a30c93971a *= 3600;
        
        if ( var_465c08a30c93971a <= 15 )
        {
            s_exfil.var_c9164736baf0694a thread function_895c7e0e9911ff6e( s_exfil, "exfil_called_15_out" );
            return;
        }
        
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x883f
// Size: 0xcb
function function_d3cc50a6ae77242( v_pos, var_f0e9262ca24fed50, v_ang )
{
    if ( isstruct( v_pos ) )
    {
        v_ang = v_pos.angles;
        v_pos = v_pos.origin;
    }
    
    if ( self vehicle_isphysveh() && self hascomponent( "p2p" ) )
    {
        self function_a7fac0397762d7a6( "p2p", "brakeAtGoal", istrue( var_f0e9262ca24fed50 ) );
        self function_a7fac0397762d7a6( "p2p", "goalPoint", v_pos );
        
        if ( isdefined( v_ang ) )
        {
            self function_a7fac0397762d7a6( "p2p", "goalAngles", ( 0, v_ang[ 1 ], 0 ) );
        }
        
        return;
    }
    
    self setvehgoalpos( v_pos, var_f0e9262ca24fed50 );
    
    if ( isdefined( v_ang ) )
    {
        self setgoalyaw( flat_angle( v_ang )[ 1 ] );
        self settargetyaw( flat_angle( v_ang )[ 1 ] );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8912
// Size: 0xb0
function function_4b9b9bf8680f3b73()
{
    self endon( "goal" );
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "collision", body0, body1, flag0, flag1, position, normal, normalspeed, ent, partenum );
        
        if ( !isdefined( ent ) || !isdefined( ent.classname ) || ent.classname == "worldspawn" )
        {
            self notify( "goal" );
            return;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x89ca
// Size: 0xd1
function function_25794fb990b0b716( var_72464fd78466e015, v_descend )
{
    self endon( "death" );
    self endon( "landed" );
    var_728a8d0ce6b1f8be = self gettagorigin( var_72464fd78466e015 );
    var_95c0b0fccf49faf6 = 0;
    var_97ba094469f8831b = 20;
    var_19db4597bc58eea5 = 0;
    
    while ( true )
    {
        var_37efcfcde90fb8ca = self gettagorigin( var_72464fd78466e015 );
        n_height_diff = var_37efcfcde90fb8ca[ 2 ] - v_descend[ 2 ];
        
        if ( distance( var_37efcfcde90fb8ca, var_728a8d0ce6b1f8be ) < 5 )
        {
            var_95c0b0fccf49faf6 += 1;
        }
        else
        {
            var_728a8d0ce6b1f8be = var_37efcfcde90fb8ca;
            var_95c0b0fccf49faf6 = 0;
        }
        
        if ( abs( n_height_diff ) <= 200 )
        {
            var_19db4597bc58eea5 += 1;
        }
        
        if ( var_95c0b0fccf49faf6 >= 5 || var_19db4597bc58eea5 >= var_97ba094469f8831b )
        {
            self.var_7bb70699db655bd6 = 1;
            break;
        }
        
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8aa3
// Size: 0x1d8
function function_b7edf3fe42e320a6( s_exfil )
{
    if ( isdefined( self.e_navmesh ) )
    {
        self.e_navmesh unlink();
        function_698d1a79b041d92e();
        self.e_navmesh.var_576f57af0204c38c = undefined;
        self.e_navmesh notsolid();
        self.e_navmesh.origin += ( 0, 0, 500 );
        self.e_navmesh hide();
    }
    
    if ( isent( self.mdl_rope ) )
    {
        self.mdl_rope delete();
    }
    
    if ( isarray( self.pilots ) )
    {
        foreach ( pilot in self.pilots )
        {
            if ( isent( pilot ) )
            {
                pilot delete();
            }
        }
    }
    
    foreach ( player in level.players )
    {
        if ( istrue( player.liveragdoll ) && namespace_421fb1e92658d94c::function_773691f1a617f7d9( player.origin ) )
        {
            player setorigin( s_exfil.origin + ( 0, 0, 4 ) );
        }
    }
    
    level.var_250dc4a23947d41 = utility::array_remove( level.var_250dc4a23947d41, self );
    thread vehicle_tracking::_deletevehicle( self );
    vehicle_tracking::reservevehicle();
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c83
// Size: 0xf7
function function_e76e826b76d20d32( s_exfil )
{
    self endon( "death" );
    
    if ( !function_8d3b8265c47a2223() || getdvarint( @"hash_46e4f95ef8ccb491", 0 ) )
    {
        return;
    }
    
    v_halfsize = self getboundshalfsize();
    n_radius = max( v_halfsize[ 0 ], v_halfsize[ 1 ] );
    
    if ( isdefined( s_exfil.player_activator ) )
    {
        var_402f13a206b51b0 = s_exfil.player_activator.team;
    }
    else
    {
        var_402f13a206b51b0 = "allies";
    }
    
    while ( true )
    {
        a_ai = function_2a44a4371afd7190( s_exfil );
        
        foreach ( ai in a_ai )
        {
            ai kill();
            waitframe();
        }
        
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d82
// Size: 0x108
function function_2a44a4371afd7190( s_exfil )
{
    v_halfsize = self getboundshalfsize();
    n_radius = max( v_halfsize[ 0 ], v_halfsize[ 1 ] );
    
    if ( isdefined( s_exfil.player_activator ) )
    {
        var_402f13a206b51b0 = s_exfil.player_activator.team;
    }
    else
    {
        var_402f13a206b51b0 = "allies";
    }
    
    a_ai = getaiarrayinradius( self.origin, n_radius );
    var_1d4ef168fa9068f8 = [];
    
    foreach ( ai in a_ai )
    {
        if ( isalive( ai ) && ai.team != var_402f13a206b51b0 && namespace_421fb1e92658d94c::function_773691f1a617f7d9( ai.origin ) )
        {
            var_1d4ef168fa9068f8[ var_1d4ef168fa9068f8.size ] = ai;
        }
    }
    
    return var_1d4ef168fa9068f8;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e93
// Size: 0x48
function function_f909f101541f5e10( b_enable )
{
    if ( b_enable )
    {
        if ( self vehicle_isphysveh() )
        {
            self function_247ad6a91f6a4ffe( b_enable );
        }
        else
        {
            self notsolid();
        }
        
        return;
    }
    
    if ( self vehicle_isphysveh() )
    {
        self function_247ad6a91f6a4ffe( b_enable );
        return;
    }
    
    self notsolid();
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8ee3
// Size: 0x19f
function function_98cfcc7bd2f1db6c( s_exfil, player_activator, var_1790664d2cfa3432 )
{
    if ( function_18a23b9f6568641e() )
    {
        var_576f57af0204c38c = function_f65e637087bf650a( s_exfil, player_activator, var_1790664d2cfa3432 );
        var_576f57af0204c38c.var_9bd69326cfeb9fe9 = 1;
        var_576f57af0204c38c function_a609274d97743733();
    }
    else
    {
        spawndata = spawnstruct();
        spawndata.origin = var_1790664d2cfa3432;
        spawndata.angles = ( 0, 0, 0 );
        spawndata.spawntype = "GAME_MODE";
        spawndata.var_14cde247ac3313a4 = s_exfil.var_4cdfc3869e61bd9b;
        spawndata.var_699ac4a9c9e9f0ec = 1;
        spawndata.var_24993ee24f7c7c0 = 1;
        var_cad2ff0bf935f3d4 = namespace_9f6a961447bab709::function_7d45a9e5bf7a3d3e( s_exfil );
        var_5a68cfc13f7b49de = isdefined( var_cad2ff0bf935f3d4.var_a097893014a748de ) ? var_cad2ff0bf935f3d4.var_a097893014a748de : "veh9_palfa";
        var_576f57af0204c38c = scripts\cp_mp\vehicles\vehicle::vehicle_spawn( var_5a68cfc13f7b49de, spawndata );
        scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable( var_576f57af0204c38c );
    }
    
    var_576f57af0204c38c.s_exfil = s_exfil;
    var_576f57af0204c38c.godmode = 1;
    var_576f57af0204c38c val::set( "exfil", "vehicle_disallow_lockon", 1 );
    var_576f57af0204c38c scripts\common\vehicle_code::vehicle_disable_navobstacles();
    level.var_250dc4a23947d41[ level.var_250dc4a23947d41.size ] = var_576f57af0204c38c;
    
    if ( scripts\engine\utility::issharedfuncdefined( "exfil", "setupHeliGasmasks" ) )
    {
        [[ scripts\engine\utility::getsharedfunc( "exfil", "setupHeliGasmasks" ) ]]( var_576f57af0204c38c );
    }
    
    var_576f57af0204c38c callback::callback( "on_exfil_vehicle_spawned" );
    return var_576f57af0204c38c;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x908b
// Size: 0x32c
function private function_f65e637087bf650a( s_exfil, player_activator, var_1790664d2cfa3432 )
{
    spawndata = spawnstruct();
    spawndata.origin = function_81384ca609ee5b57( var_1790664d2cfa3432 );
    
    if ( isdefined( s_exfil.v_spawn_ang ) )
    {
        v_spawn_ang = s_exfil.v_spawn_ang;
    }
    else
    {
        v_spawn_ang = ( 0, 0, 0 );
    }
    
    spawndata.angles = v_spawn_ang;
    spawndata.spawntype = "GAME_MODE";
    spawndata.var_14cde247ac3313a4 = s_exfil.var_4cdfc3869e61bd9b;
    spawndata.var_699ac4a9c9e9f0ec = 1;
    spawndata.var_24993ee24f7c7c0 = 1;
    var_cad2ff0bf935f3d4 = namespace_9f6a961447bab709::function_7d45a9e5bf7a3d3e( s_exfil );
    var_5a68cfc13f7b49de = default_to( var_cad2ff0bf935f3d4.var_a097893014a748de, "veh9_palfa" );
    heli = undefined;
    n_tries = 0;
    faildata = spawnstruct();
    
    while ( true )
    {
        vehicle_tracking::clearvehiclereservation();
        heli = scripts\cp_mp\vehicles\vehicle::vehicle_spawn( var_5a68cfc13f7b49de, spawndata, faildata );
        
        if ( isdefined( heli ) )
        {
            break;
        }
        
        n_tries++;
        vehicle_tracking::reservevehicle();
        logstring( "==CPMP Exfil: Walkable vehicle failed to spawn at " + spawndata.origin + " for exfil: " + s_exfil.name + ". Attempts: " + n_tries + ". Reason: " + ( isdefined( faildata.fail ) ? faildata.fail : "unknown" ) );
        wait 0.5;
        
        if ( n_tries > 60 )
        {
            spawndata.origin = s_exfil.s_exfil_destination.origin + ( 0, 0, 1000 );
            continue;
        }
        
        var_64b356b06ba31794 = s_exfil.s_exfil_destination.origin - level.mapcenter;
        var_64b356b06ba31794 = vectornormalize( ( var_64b356b06ba31794[ 0 ], var_64b356b06ba31794[ 1 ], 0 ) );
        var_2b2e9399c3f18884 = -30000 + n_tries * 500;
        spawndata.origin = var_64b356b06ba31794 * var_2b2e9399c3f18884 + ( 0, 0, 1 ) * 1000 * 2;
        
        /#
            iprintln( "<dev string:x4fb>" + s_exfil.name + "<dev string:x51c>" + distance( spawndata.origin, s_exfil.s_exfil_destination.origin ) + "<dev string:x524>" );
        #/
    }
    
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable( heli );
    heli scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_setcandamage( 0 );
    heli.callingteam = isdefined( player_activator ) ? player_activator.team : undefined;
    heli.playersinside = [];
    heli.onstartriding = &function_b28cb16c37f8e7b;
    heli.onendriding = &function_5f4563731f3e286f;
    heli.unload_land_offset = 255;
    heli.var_fd91112a53ea4fea = 1;
    heli.var_4a4265af0a6f92e9 = 1;
    return heli;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x93c0
// Size: 0xde
function private function_a609274d97743733()
{
    var_3c83c6524fa234cc = [ "body_sp_ally_pilot_western_vm_fullbody", "body_sp_ally_pilot_western_vm_fullbody" ];
    var_1484eb6048310f02 = [ "iw9_mp_heli_palfa_seat_0_idle", "iw9_heli_palfa_seat_1_idle" ];
    var_1e29645dfa86c4e9 = [ "tag_seat_0", "tag_seat_1" ];
    self.pilots = [];
    
    foreach ( i, var_3d2b9f6f56c7979b in var_3c83c6524fa234cc )
    {
        mdl_pilot = spawn_pilot( i, var_1e29645dfa86c4e9[ i ], var_1484eb6048310f02[ i ], var_3d2b9f6f56c7979b );
        
        if ( isdefined( mdl_pilot ) )
        {
            self.pilots = array_add( self.pilots, mdl_pilot );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x94a6
// Size: 0x113
function private spawn_pilot( posindex, tag, animname, model, headmodel )
{
    v_pos = self gettagorigin( tag );
    v_ang = self gettagangles( tag );
    
    if ( !isdefined( v_pos ) || !isdefined( v_ang ) )
    {
        return;
    }
    
    mdl_pilot = utility::spawn_model( model, v_pos, v_ang );
    v_pos = mdl_pilot gettagorigin( "j_spine4" );
    v_ang = mdl_pilot gettagangles( "j_spine4" );
    mdl_pilot.linkedents = [];
    
    if ( isdefined( headmodel ) )
    {
        head = spawn( "script_model", v_pos );
        head.angles = v_ang;
        head setmodel( headmodel );
        head linkto( mdl_pilot, "j_spine4" );
        mdl_pilot.linkedents[ mdl_pilot.linkedents.size ] = head;
        mdl_pilot.head = head;
    }
    
    mdl_pilot linkto( self );
    
    if ( isdefined( animname ) )
    {
        mdl_pilot scriptmodelplayanim( animname );
    }
    
    return mdl_pilot;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95c2
// Size: 0x14
function function_b28cb16c37f8e7b( player )
{
    thread function_f814294925882e0( player );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x95de
// Size: 0x427
function private function_f814294925882e0( player )
{
    player notify( "endon_enter_walkable_vehicle" );
    player endon( "endon_enter_walkable_vehicle" );
    player endon( "disconnect" );
    player.var_68b9486f4adbcb62 = 1;
    player.var_cac91eb6521df629 = self;
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    s_exfil = isdefined( self.s_exfil ) ? self.s_exfil : player.s_exfil;
    
    if ( !isdefined( s_exfil ) )
    {
        logstring( "==CPMP Exfil: Exfil vehicle exists, but can't get actual Exfil struct!" );
        return;
    }
    
    ent_flag_wait( "landed" );
    s_exfil.var_c9164736baf0694a = function_6d6af8144a5131f1( s_exfil.var_c9164736baf0694a, player );
    s_exfil.var_c9164736baf0694a = function_fdc9d5557c53078e( s_exfil.var_c9164736baf0694a );
    self.playersinside = function_fdc9d5557c53078e( self.playersinside, 1 );
    
    if ( !array_contains_key( self.playersinside, player.guid ) )
    {
        self.playersinside[ player.guid ] = player;
        scripts\mp\outofbounds::enableoobimmunity( player );
        function_62265a47b3eedbaa( s_exfil );
        
        if ( !function_8d3b8265c47a2223() )
        {
            player function_15c99e8995143f9f( s_exfil );
        }
    }
    
    if ( function_8d3b8265c47a2223() )
    {
        if ( !isdefined( s_exfil.player_activator ) )
        {
            return;
        }
        
        var_c9b69aecc5c631ed = s_exfil.player_activator scripts\cp_mp\utility\squad_utility::getsquadmembers( undefined, 1 );
        var_c718f42faa957098 = 0;
        var_2736b3848a47330f = 0;
        
        foreach ( squad_member in var_c9b69aecc5c631ed )
        {
            if ( istrue( squad_member.var_68b9486f4adbcb62 ) )
            {
                var_2736b3848a47330f++;
            }
        }
        
        if ( var_2736b3848a47330f == var_c9b69aecc5c631ed.size )
        {
            var_c718f42faa957098 = 1;
        }
        else
        {
            var_c718f42faa957098 = 0;
            
            if ( var_2736b3848a47330f >= var_c9b69aecc5c631ed.size / 2 )
            {
                var_2d5b80c94b21ea0e = [];
                var_c0b9c6085cb34c = [];
                
                foreach ( squad_member in var_c9b69aecc5c631ed )
                {
                    if ( istrue( squad_member.var_68b9486f4adbcb62 ) )
                    {
                        var_2d5b80c94b21ea0e = array_add( var_2d5b80c94b21ea0e, squad_member );
                        continue;
                    }
                    
                    var_c0b9c6085cb34c = array_add( var_c0b9c6085cb34c, squad_member );
                }
                
                if ( s_exfil.n_time_remaining > 5 )
                {
                    var_2d5b80c94b21ea0e thread function_895c7e0e9911ff6e( s_exfil, "exfil_called_missing" );
                }
            }
        }
        
        if ( var_c718f42faa957098 && !istrue( s_exfil.var_eeb8c244f1d18546 ) )
        {
            s_exfil.var_eeb8c244f1d18546 = 1;
            
            if ( isdefined( s_exfil.n_time_remaining ) && s_exfil.n_time_remaining > 5 )
            {
                if ( !getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
                {
                    level thread function_cc026051a7037c25( s_exfil );
                }
                
                return;
            }
            
            if ( !istrue( s_exfil.var_bff042c325c612a0 ) )
            {
                s_exfil.var_c9164736baf0694a thread utility::delaythread( 6, &function_895c7e0e9911ff6e, s_exfil, "exfil_called_lastsecond" );
            }
        }
        
        return;
    }
    
    foreach ( player_heli in s_exfil.var_c9164736baf0694a )
    {
        if ( !istrue( player_heli.var_68b9486f4adbcb62 ) )
        {
            return;
        }
    }
    
    foreach ( player_heli in s_exfil.var_c9164736baf0694a )
    {
        self.interact function_ef855ac387639af6( player_heli );
    }
    
    if ( !istrue( self.leaving ) && !getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
    {
        namespace_68dc261109a9503f::endactivity( s_exfil.var_18da16a5ee3e8314, 1 );
        thread function_3c26533e550baeb9( s_exfil );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a0d
// Size: 0xc1
function exfil_defend_mode_timer( s_exfil )
{
    self notify( "endon_exfil_defend_mode_timer" );
    self endon( "endon_exfil_defend_mode_timer" );
    self endon( "death_or_disconnect" );
    self setclientomnvar( "ui_is_exfil_countdown", 1 );
    var_6d06ffa37ff9a762 = isdefined( s_exfil.var_74144fabf9631d37 ) ? s_exfil.var_74144fabf9631d37 : 35;
    
    while ( true )
    {
        self waittill( "exfil_time_remaining", n_time_remaining );
        
        if ( n_time_remaining <= var_6d06ffa37ff9a762 )
        {
            n_time_remaining = int( n_time_remaining );
            self setclientomnvar( "ui_match_start_countdown", n_time_remaining );
            self setclientomnvar( "ui_is_exfil_countdown", 1 );
            
            if ( n_time_remaining <= 0 )
            {
                self setclientomnvar( "ui_match_start_countdown", -1 );
                self setclientomnvar( "ui_is_exfil_countdown", 0 );
                break;
            }
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ad6
// Size: 0x147
function function_cc026051a7037c25( s_exfil )
{
    var_44ff48a7843fe636 = 5;
    
    if ( isplayer( s_exfil.player_activator ) )
    {
        var_c9b69aecc5c631ed = s_exfil.player_activator scripts\cp_mp\utility\squad_utility::getsquadmembers();
        
        foreach ( player in s_exfil.var_c9164736baf0694a )
        {
            if ( isplayer( player ) && !istrue( player.var_68b9486f4adbcb62 ) && !array_contains( var_c9b69aecc5c631ed, player ) )
            {
                var_44ff48a7843fe636 = 10;
                break;
            }
        }
    }
    
    if ( !function_4027f5445bb7c8fb( s_exfil ) )
    {
        s_exfil.var_c9164736baf0694a thread function_895c7e0e9911ff6e( s_exfil, "exfil_called_shortcut" );
    }
    
    if ( isdefined( s_exfil.var_18da16a5ee3e8314.var_e3d833b1e5d30b03[ "exfil_timer" ] ) )
    {
        s_exfil.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b0afa182f3914d4f( "exfil_timer" );
    }
    
    s_exfil.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_95f8d1b9f6685b61( "exfil_timer", int( var_44ff48a7843fe636 ), &function_5daedbca2b53bfdf );
    wait var_44ff48a7843fe636 - 1;
    s_exfil notify( "exfil_timer_force_complete" );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c25
// Size: 0xc0
function function_5f4563731f3e286f( player )
{
    if ( player isjumping() && namespace_421fb1e92658d94c::function_773691f1a617f7d9( player.origin ) )
    {
        thread exfil_vehicle_jump_hack( player );
        return;
    }
    
    player notify( "endon_enter_walkable_vehicle" );
    self.playersinside[ player.guid ] = undefined;
    
    if ( scripts\mp\outofbounds::isoobimmune( player ) )
    {
        scripts\mp\outofbounds::disableoobimmunity( player );
    }
    
    s_exfil = self.interact.s_exfil;
    player.var_68b9486f4adbcb62 = undefined;
    player.var_cac91eb6521df629 = undefined;
    
    if ( istrue( player.var_65be3afaddfe3a79 ) )
    {
        player val::reset( "exfil", "damage" );
    }
    
    function_62265a47b3eedbaa( s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ced
// Size: 0x51
function exfil_vehicle_jump_hack( player )
{
    self endon( "death" );
    player notify( "endon_exfil_vehicle_jump_hack" );
    player endon( "disconnect" );
    player endon( "endon_exfil_vehicle_jump_hack" );
    
    while ( player isjumping() )
    {
        waitframe();
    }
    
    if ( !namespace_421fb1e92658d94c::function_773691f1a617f7d9( player.origin ) )
    {
        function_5f4563731f3e286f( player );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d46
// Size: 0x8c
function function_59e7feccaa753a46( player, var_45fd392609262a96 )
{
    self endon( "death" );
    
    if ( function_8d3b8265c47a2223() && !istrue( var_45fd392609262a96 ) && !istrue( self.leaving ) )
    {
        return;
    }
    
    if ( ( istrue( self.leaving ) || istrue( var_45fd392609262a96 ) ) && !istrue( player.var_68b9486f4adbcb62 ) )
    {
        scripts\cp_mp\utility\game_utility::function_852712268d005332( player, 1, 0.25 );
        player setorigin( self gettagorigin( "tag_seat_7" ) );
        level thread scripts\cp_mp\utility\game_utility::function_852712268d005332( player, 0, 0.25 );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9dda
// Size: 0x177
function function_fbe2ebb67d8d52dd( s_exfil, var_6b53052bba864b7a )
{
    if ( function_8d3b8265c47a2223() && function_18a23b9f6568641e() && isdefined( s_exfil.var_576f57af0204c38c ) )
    {
        foreach ( player in level.players )
        {
            if ( isalive( player ) && player.sessionstate == "playing" && ( s_exfil.var_576f57af0204c38c namespace_421fb1e92658d94c::function_773691f1a617f7d9( player.origin ) || array_contains_key( s_exfil.var_576f57af0204c38c.playersinside, player.guid ) ) && !istrue( player.var_f7b106ebc7f3abf0 ) )
            {
                logstring( "==CPMP Exfil: Attempting to fallback complete exfil for " + ( isdefined( player.name ) ? player.name : "unknown" ) + " at exfil " + s_exfil.name );
                
                if ( istrue( var_6b53052bba864b7a ) )
                {
                    player.var_764da0de2a46452c = 1;
                }
                
                player.s_exfil = s_exfil;
                s_exfil.var_576f57af0204c38c.interact function_ef855ac387639af6( player );
            }
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9f59
// Size: 0x108
function function_ef855ac387639af6( player )
{
    if ( !isplayer( player ) || istrue( player.var_f7b106ebc7f3abf0 ) || getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
    {
        return;
    }
    
    s_exfil = isdefined( self.s_exfil ) ? self.s_exfil : player.s_exfil;
    player function_15c99e8995143f9f( s_exfil );
    player.var_f7b106ebc7f3abf0 = 1;
    
    if ( !isdefined( player.s_exfil ) )
    {
        player.s_exfil = s_exfil;
    }
    
    logstring( "==CPMP Exfil: Start of exfil completion for " + ( isdefined( player.name ) ? player.name : "unknown" ) + " at " + s_exfil.name );
    
    if ( isdefined( level.var_78e0845802741355 ) )
    {
        self thread [[ level.var_78e0845802741355 ]]( player );
        return;
    }
    
    /#
        player iprintlnbold( "<dev string:x532>" );
    #/
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa069
// Size: 0x90
function function_15c99e8995143f9f( s_exfil )
{
    if ( istrue( self.var_f52eb40ba99ffa4c ) || getdvarint( @"hash_fa33eaab52d52fd3", 0 ) )
    {
        return;
    }
    
    self.var_f52eb40ba99ffa4c = 1;
    
    if ( !function_8d3b8265c47a2223() )
    {
        thread scripts\mp\hud_message::showsplash( "cp_mp_exfil_success" );
    }
    
    thread exfil_board_vehicle( s_exfil );
    callback::callback( "on_exfil_board_vehicle", s_exfil );
    
    if ( isdefined( s_exfil.var_18da16a5ee3e8314 ) )
    {
        s_exfil.var_18da16a5ee3e8314 namespace_d886885225a713a7::function_91c9ad377a3c4725( s_exfil.var_18da16a5ee3e8314, self );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa101
// Size: 0x1bf
function exfil_board_vehicle( s_exfil )
{
    if ( istrue( self.var_68b9486f4adbcb62 ) || istrue( s_exfil.var_199168ca946185b0 ) )
    {
        return;
    }
    
    self endon( "disconnect" );
    self.var_a4408405ef23e289 = utility::spawn_model( "tag_origin", self.origin, self.angles );
    self lerpviewangleclamp( 1, 0, 0, 45, 45, 45, 45, 1 );
    self playerlinktodelta( self.var_a4408405ef23e289, "tag_origin", 1, 60, 60, 45, 45, 1 );
    var_a758a3aef0e1e62d = 11;
    
    for (i = 2; i <= var_a758a3aef0e1e62d; i++) {
        var_d089cec462f6900f = "tag_seat_" + i;
        s_exfil.var_576f57af0204c38c.var_9ca68f1ac4e51748 = default_to( s_exfil.var_576f57af0204c38c.var_9ca68f1ac4e51748, [] );
        
        if ( !array_contains( s_exfil.var_576f57af0204c38c.var_9ca68f1ac4e51748, var_d089cec462f6900f ) && s_exfil.var_576f57af0204c38c tagexists( var_d089cec462f6900f ) )
        {
            s_exfil.var_576f57af0204c38c.var_9ca68f1ac4e51748 = array_add( s_exfil.var_576f57af0204c38c.var_9ca68f1ac4e51748, var_d089cec462f6900f );
            level scripts\cp_mp\utility\game_utility::function_852712268d005332( self, 1, 0.5 );
            self.var_a4408405ef23e289 linkto( s_exfil.var_576f57af0204c38c, var_d089cec462f6900f, ( 0, 0, 20 ), ( 0, 0, 0 ) );
            level thread scripts\cp_mp\utility\game_utility::function_852712268d005332( self, 0, 0.5 );
            self.var_68b9486f4adbcb62 = 1;
            break;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa2c8
// Size: 0x3f4
function function_367542eff2c7e695( s_exfil, player_activator )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    s_exfil endon( "exfil_complete_kill_count" );
    s_exfil endon( "exfil_complete_timeout" );
    
    if ( isdefined( level.var_f39442d551882408 ) )
    {
        level thread [[ level.var_f39442d551882408 ]]( s_exfil, player_activator );
        return;
    }
    
    n_player_count = s_exfil.var_c9164736baf0694a.size;
    
    switch ( n_player_count )
    {
        case 1:
            function_360cc0762c8f8dc6( 35, s_exfil );
            break;
        case 2:
            function_360cc0762c8f8dc6( int( 46.9 ), s_exfil );
            break;
        case 3:
            function_360cc0762c8f8dc6( int( 59.5 ), s_exfil );
            break;
        case 4:
        default:
            function_360cc0762c8f8dc6( int( 71.4 ), s_exfil );
            break;
    }
    
    var_686b3d1d807eeac2 = s_exfil.s_exfil_destination.origin;
    team = "team_two_hundred";
    var_2377fe3f0b3be5cf = 60;
    s_exfil.var_185669f0381856d6 = int( min( var_2377fe3f0b3be5cf / ( s_exfil.var_c9164736baf0694a.size + 1 ), var_2377fe3f0b3be5cf / 3 ) );
    
    if ( !function_8d3b8265c47a2223() )
    {
        s_exfil.var_18da16a5ee3e8314 namespace_2bb19978a7035533::function_b05f987b9adfdc21( "exfil_kills_remaining", function_5cdb6bf616f071c2( s_exfil ), 0 );
    }
    
    function_62265a47b3eedbaa( s_exfil );
    var_1d6b32b06fe04f23 = undefined;
    
    if ( isdefined( level.var_35aa4c6db25e81ae ) )
    {
        var_1d6b32b06fe04f23 = [[ level.var_35aa4c6db25e81ae ]]( s_exfil, 1 );
    }
    
    level thread function_d006864bb66299cb( s_exfil );
    
    if ( !function_8d3b8265c47a2223() )
    {
        level thread track_exfil_ai_at_destination( s_exfil, 3, 1, 1 );
    }
    
    if ( isdefined( var_1d6b32b06fe04f23 ) )
    {
        if ( !function_8d3b8265c47a2223() )
        {
            level thread start_exfil_spawns_at_destination( s_exfil );
        }
        
        if ( !getdvarint( @"hash_3d3a3936aa88a240", 0 ) )
        {
            return;
        }
        
        s_exfil.var_c9164736baf0694a = array_removeundefined( s_exfil.var_c9164736baf0694a );
        s_exfil.var_33f4e93d8420b61f = namespace_614554f86e52695c::spawn_request( var_1d6b32b06fe04f23, s_exfil.origin, 10000, 1, 0 );
        
        if ( isdefined( s_exfil.var_33f4e93d8420b61f ) )
        {
            function_f1a80db7eb652acc( s_exfil.var_33f4e93d8420b61f, s_exfil.var_c9164736baf0694a );
            namespace_614554f86e52695c::function_bc5315dc37ae4cf( s_exfil.var_33f4e93d8420b61f, &function_f7f5cf2d9974cd7c, s_exfil );
            namespace_614554f86e52695c::function_e4a67fe4ddca7ed5( s_exfil.var_33f4e93d8420b61f, &function_5217bec60e76c1b3, s_exfil );
            namespace_614554f86e52695c::function_73147cdf5c28d10c( s_exfil.var_33f4e93d8420b61f, &function_18710afbe1a02611, s_exfil );
            
            foreach ( player in s_exfil.var_c9164736baf0694a )
            {
                player.var_df1c932fb5f9cc0d = s_exfil.var_33f4e93d8420b61f;
            }
        }
        
        return;
    }
    
    if ( !getdvarint( @"hash_3d3a3936aa88a240", 0 ) )
    {
        return;
    }
    
    while ( true )
    {
        if ( function_e1a9c5d3a4c2a90b( s_exfil ) < function_9621ef0d09be048d( s_exfil ) )
        {
            foreach ( player in s_exfil.var_c9164736baf0694a )
            {
                if ( isalive( player ) && player.sessionstate == "playing" && !scripts\mp\utility\player::isinlaststand( player ) )
                {
                    player thread exfil_per_player_spawns( s_exfil, var_686b3d1d807eeac2, team, s_exfil.var_185669f0381856d6 );
                }
            }
        }
        
        wait randomfloatrange( 5, 10 );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa6c4
// Size: 0x100
function track_exfil_ai_at_destination( s_exfil, var_1d9d993a883b7051, var_d28bfd15b43eae53, var_d8ff55e583769d60 )
{
    if ( !isdefined( var_1d9d993a883b7051 ) )
    {
        var_1d9d993a883b7051 = 5;
    }
    
    if ( !isdefined( var_d28bfd15b43eae53 ) )
    {
        var_d28bfd15b43eae53 = 0;
    }
    
    if ( !isdefined( var_d8ff55e583769d60 ) )
    {
        var_d8ff55e583769d60 = 0;
    }
    
    s_exfil notify( "end_track_exfil_ai_at_destination" );
    s_exfil endon( "end_track_exfil_ai_at_destination" );
    s_exfil endon( "exfil_complete_kill_count" );
    s_exfil endon( "exfil_complete_timeout" );
    
    while ( true )
    {
        var_5eb85cc70f4b70a0 = function_368cc1002f8e3c9f( s_exfil );
        
        if ( var_d28bfd15b43eae53 )
        {
            var_7480bd83f5b1bef3 = max( function_9621ef0d09be048d( s_exfil ), var_5eb85cc70f4b70a0.size );
        }
        else
        {
            var_7480bd83f5b1bef3 = function_9621ef0d09be048d( s_exfil );
        }
        
        if ( var_7480bd83f5b1bef3 > 0 )
        {
            s_exfil.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e( "exfil_kills_remaining", var_7480bd83f5b1bef3 );
        }
        
        if ( function_9621ef0d09be048d( s_exfil ) <= 0 && ( !var_d28bfd15b43eae53 || var_5eb85cc70f4b70a0.size <= var_1d9d993a883b7051 ) && ( !var_d8ff55e583769d60 || !s_exfil ent_flag( "exfil_boss_alive" ) ) )
        {
            break;
        }
        
        wait 0.25;
    }
    
    level thread function_303cb92b5afb6e87( s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa7cc
// Size: 0xc3
function function_5217bec60e76c1b3( requestid, userdata, agent, data )
{
    s_exfil = userdata;
    
    if ( !function_8d3b8265c47a2223() )
    {
        s_exfil.var_c9164736baf0694a = array_removeundefined( s_exfil.var_c9164736baf0694a );
        closest_player = get_array_of_closest( agent.origin, s_exfil.var_c9164736baf0694a )[ 0 ];
        function_81adda380966c872( s_exfil, agent, closest_player );
    }
    else
    {
        agent.s_exfil = s_exfil;
        s_exfil.var_ed2b93690e12fb86 = array_add( s_exfil.var_ed2b93690e12fb86, agent );
    }
    
    agent callback::callback( "on_exfil_ai_spawned" );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa897
// Size: 0xc3
function function_e94ce448218abffe( requestid, userdata, agent, data )
{
    s_exfil = userdata;
    
    if ( !function_8d3b8265c47a2223() )
    {
        s_exfil.var_c9164736baf0694a = array_removeundefined( s_exfil.var_c9164736baf0694a );
        closest_player = get_array_of_closest( agent.origin, s_exfil.var_c9164736baf0694a )[ 0 ];
        function_81adda380966c872( s_exfil, agent, closest_player );
    }
    else
    {
        agent.s_exfil = s_exfil;
        s_exfil.var_ed2b93690e12fb86 = function_6d6af8144a5131f1( s_exfil.var_ed2b93690e12fb86, agent );
    }
    
    agent callback::callback( "on_exfil_ai_spawned" );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa962
// Size: 0x13c, Type: bool
function function_18710afbe1a02611( requestid, userdata )
{
    s_exfil = userdata;
    
    if ( getdvarint( @"hash_3d3a3936aa88a240", 0 ) )
    {
        if ( s_exfil ent_flag( "exfil_complete_timeout" ) || !istrue( s_exfil.var_1326008dc390c510 ) )
        {
            if ( getdvarint( @"hash_729c0e8d0666b374", 1 ) )
            {
                function_4ad7fe70ca08ef97( requestid );
                function_18790a3cb3f88db7( requestid );
            }
            
            return true;
        }
        
        return false;
    }
    
    if ( function_a374bb164261c788( s_exfil ) )
    {
        function_4ad7fe70ca08ef97( requestid );
        return true;
    }
    
    var_4c6df4049d754ba3 = function_dbae5347e2c01238( s_exfil );
    
    if ( var_4c6df4049d754ba3 >= s_exfil.var_c9164736baf0694a.size * 0.75 || !istrue( s_exfil.var_1326008dc390c510 ) )
    {
        function_4ad7fe70ca08ef97( requestid );
        return true;
    }
    
    if ( isdefined( s_exfil.var_576f57af0204c38c ) && s_exfil.var_576f57af0204c38c ent_flag( "landed" ) || s_exfil ent_flag( "exfil_complete_kill_count" ) || s_exfil ent_flag( "exfil_complete_timeout" ) || !istrue( s_exfil.var_1326008dc390c510 ) )
    {
        s_exfil.var_33f4e93d8420b61f = undefined;
        function_4ad7fe70ca08ef97( requestid );
        return true;
    }
    
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaaa7
// Size: 0x119, Type: bool
function function_794c7399b3beaf40( requestid, userdata )
{
    s_exfil = userdata;
    
    if ( function_8d3b8265c47a2223() )
    {
        if ( isdefined( s_exfil.var_576f57af0204c38c ) && istrue( s_exfil.var_576f57af0204c38c.leaving ) || s_exfil ent_flag( "exfil_complete_timeout" ) )
        {
            s_exfil.var_df1c932fb5f9cc0d = undefined;
            
            if ( getdvarint( @"hash_729c0e8d0666b374", 1 ) )
            {
                function_18790a3cb3f88db7( requestid );
            }
            
            return true;
        }
    }
    else
    {
        if ( function_9621ef0d09be048d( s_exfil ) <= 0 )
        {
            s_exfil.var_df1c932fb5f9cc0d = undefined;
            
            if ( getdvarint( @"hash_729c0e8d0666b374", 1 ) )
            {
                function_18790a3cb3f88db7( requestid );
            }
            
            return true;
        }
        
        if ( s_exfil ent_flag( "exfil_complete_kill_count" ) || s_exfil ent_flag( "exfil_complete_timeout" ) || !istrue( s_exfil.var_1326008dc390c510 ) )
        {
            s_exfil.var_df1c932fb5f9cc0d = undefined;
            
            if ( getdvarint( @"hash_729c0e8d0666b374", 1 ) )
            {
                function_18790a3cb3f88db7( requestid );
            }
            
            return true;
        }
    }
    
    return false;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xabc9
// Size: 0x94, Type: bool
function function_f7f5cf2d9974cd7c( requestid, userdata )
{
    s_exfil = userdata;
    function_5cc7d5014c77d7b1( s_exfil, requestid );
    
    if ( getdvarint( @"hash_3d3a3936aa88a240", 0 ) )
    {
        return !istrue( s_exfil ent_flag( "exfil_complete_timeout" ) );
    }
    
    if ( function_9621ef0d09be048d( s_exfil ) <= 0 )
    {
        return false;
    }
    
    var_4c6df4049d754ba3 = function_dbae5347e2c01238( s_exfil );
    
    if ( var_4c6df4049d754ba3 >= s_exfil.var_c9164736baf0694a.size * 0.5 || !istrue( s_exfil.var_1326008dc390c510 ) )
    {
        return false;
    }
    
    return true;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xac66
// Size: 0x6f, Type: bool
function function_5a36abe36ba8758b( requestid, userdata )
{
    s_exfil = userdata;
    function_5cc7d5014c77d7b1( s_exfil, requestid );
    
    if ( function_8d3b8265c47a2223() )
    {
        if ( gettime() - s_exfil.var_4a86a90d72981109 > 30000 && !istrue( s_exfil.var_1326008dc390c510 ) )
        {
            return false;
        }
    }
    else if ( function_9621ef0d09be048d( s_exfil ) <= 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xacde
// Size: 0x170
function function_5cc7d5014c77d7b1( s_exfil, requestid )
{
    if ( isdefined( s_exfil ) && isarray( s_exfil.var_ed2b93690e12fb86 ) )
    {
        var_d5e75f8a4471a7f8 = 0;
        var_8bfa7f3c950e3f58 = 0;
        s_exfil.var_ed2b93690e12fb86 = array_removedead_or_dying( s_exfil.var_ed2b93690e12fb86 );
        
        foreach ( ai in s_exfil.var_ed2b93690e12fb86 )
        {
            if ( isdefined( ai.aicategory ) )
            {
                switch ( ai.aicategory )
                {
                    case #"hash_8c089e813083e510":
                        var_d5e75f8a4471a7f8++;
                        break;
                    case #"hash_7b0e2f2ed84f34":
                        var_8bfa7f3c950e3f58++;
                        break;
                }
            }
        }
        
        if ( isdefined( s_exfil.var_1d39d0784b73d713 ) && var_d5e75f8a4471a7f8 >= s_exfil.var_1d39d0784b73d713 )
        {
            function_d37068aac7785c04( requestid, "exfil_bucket_zombie_special", 0 );
        }
        else
        {
            function_d37068aac7785c04( requestid, "exfil_bucket_zombie_special", 1 );
        }
        
        if ( isdefined( s_exfil.var_2744fe7a1690ec17 ) && var_8bfa7f3c950e3f58 >= s_exfil.var_2744fe7a1690ec17 )
        {
            function_d37068aac7785c04( requestid, "exfil_bucket_zombie_elite", 0 );
            return;
        }
        
        function_d37068aac7785c04( requestid, "exfil_bucket_zombie_elite", 1 );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae56
// Size: 0x79
function start_exfil_spawns_at_destination( s_exfil )
{
    s_exfil notify( "endon_start_exfil_spawns_at_destination" );
    s_exfil endon( "endon_start_exfil_spawns_at_destination" );
    s_exfil endon( "exfil_complete_kill_count" );
    s_exfil endon( "exfil_complete_timeout" );
    s_exfil.var_4a86a90d72981109 = gettime();
    
    if ( function_8d3b8265c47a2223() )
    {
        s_exfil ent_flag_wait( "player_reached_exfil" );
        function_496ddd68d7c18405( s_exfil );
        level thread start_exfil_defend_mode( s_exfil );
        return;
    }
    
    s_exfil ent_flag_wait( "player_reached_exfil" );
    function_496ddd68d7c18405( s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaed7
// Size: 0x10a
function function_496ddd68d7c18405( s_exfil )
{
    if ( function_4027f5445bb7c8fb( s_exfil ) )
    {
        return;
    }
    
    var_1d6b32b06fe04f23 = undefined;
    
    if ( isdefined( level.var_35aa4c6db25e81ae ) )
    {
        var_1d6b32b06fe04f23 = [[ level.var_35aa4c6db25e81ae ]]( s_exfil, 0 );
    }
    
    if ( isdefined( var_1d6b32b06fe04f23 ) )
    {
        s_exfil.var_df1c932fb5f9cc0d = namespace_614554f86e52695c::spawn_request( var_1d6b32b06fe04f23, s_exfil.s_exfil_destination.origin, 1500, 1, 0 );
        
        if ( isdefined( s_exfil.var_df1c932fb5f9cc0d ) )
        {
            if ( getdvarint( @"hash_faf56f135b3692d6", 0 ) )
            {
                s_exfil.var_b81951dbbe126712 = 1;
                function_606642b946a01237( s_exfil.name, s_exfil.origin, 1500, 1 );
            }
            
            namespace_614554f86e52695c::function_bc5315dc37ae4cf( s_exfil.var_df1c932fb5f9cc0d, &function_5a36abe36ba8758b, s_exfil );
            namespace_614554f86e52695c::function_e4a67fe4ddca7ed5( s_exfil.var_df1c932fb5f9cc0d, &function_e94ce448218abffe, s_exfil );
            namespace_614554f86e52695c::function_73147cdf5c28d10c( s_exfil.var_df1c932fb5f9cc0d, &function_794c7399b3beaf40, s_exfil );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafe9
// Size: 0xf9
function function_a57106214e976a66( var_686b3d1d807eeac2 )
{
    var_d73168c1116bcbf6 = 1500;
    var_8903a8e260bffb4 = self.origin;
    
    if ( istrue( self.var_ea2269fdafc7eac ) )
    {
        var_8903a8e260bffb4 = var_686b3d1d807eeac2;
    }
    else
    {
        v_mod = function_9590e02554440c3f();
        v_dir = vectornormalize( var_686b3d1d807eeac2 - self.origin );
        var_8903a8e260bffb4 = self.origin + v_dir * var_d73168c1116bcbf6;
    }
    
    min = 0;
    max = 250;
    
    while ( true )
    {
        random_x = randomfloatrange( min, max ) * scripts\engine\utility::ter_op( cointoss(), 1, -1 );
        random_y = randomfloatrange( min, max ) * scripts\engine\utility::ter_op( cointoss(), 1, -1 );
        var_8903a8e260bffb4 = getclosestpointonnavmesh( var_8903a8e260bffb4 + ( random_x, random_y, 0 ) );
        
        if ( isdefined( var_8903a8e260bffb4 ) )
        {
            break;
        }
        
        waitframe();
    }
    
    return var_8903a8e260bffb4;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0eb
// Size: 0x23
function function_9590e02554440c3f()
{
    velocity = self getvelocity();
    n_weight = 7;
    return velocity * n_weight;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb117
// Size: 0x77
function function_dbae5347e2c01238( s_exfil )
{
    var_4c6df4049d754ba3 = 0;
    
    foreach ( player in s_exfil.var_c9164736baf0694a )
    {
        if ( istrue( player.var_ea2269fdafc7eac ) )
        {
            var_4c6df4049d754ba3++;
        }
    }
    
    return var_4c6df4049d754ba3;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb197
// Size: 0x194
function exfil_per_player_spawns( s_exfil, var_686b3d1d807eeac2, var_573a69129fea9851, var_185669f0381856d6 )
{
    self notify( "exfil_per_player_spawns" );
    self endon( "death" );
    self endon( "exfil_per_player_spawns" );
    s_exfil endon( "exfil_complete_kill_count" );
    s_exfil endon( "exfil_complete_timeout" );
    self.var_ed2b93690e12fb86 = default_to( self.var_ed2b93690e12fb86, [] );
    self.var_ed2b93690e12fb86 = array_removedead_or_dying( self.var_ed2b93690e12fb86 );
    
    while ( self.var_ed2b93690e12fb86.size < var_185669f0381856d6 )
    {
        if ( function_a374bb164261c788( s_exfil ) && function_e1a9c5d3a4c2a90b( s_exfil ) >= function_9621ef0d09be048d( s_exfil ) )
        {
            waitframe();
            continue;
        }
        
        var_8903a8e260bffb4 = function_a57106214e976a66( var_686b3d1d807eeac2 );
        
        if ( !isdefined( var_8903a8e260bffb4 ) )
        {
            waitframe();
            continue;
        }
        
        aitype = undefined;
        
        if ( isdefined( level.var_9f9cd6f82b781bde ) )
        {
            aitype = [[ level.var_9f9cd6f82b781bde ]]();
        }
        else if ( isdefined( level.agent_definition ) && level.agent_definition.size )
        {
            aitype = random( getarraykeys( level.agent_definition ) );
        }
        
        aitype = getdvar( @"hash_5254c3fbd200d7ee", aitype );
        
        if ( !isdefined( aitype ) || aitype == "" )
        {
            println( "<dev string:x54c>" );
            return;
        }
        
        agent = scripts\mp\mp_agent::spawnnewagentaitype( aitype, var_8903a8e260bffb4, ( 0, 0, 0 ), var_573a69129fea9851 );
        
        if ( isdefined( agent ) )
        {
            function_81adda380966c872( s_exfil, agent, self );
            agent callback::callback( "on_exfil_ai_spawned" );
        }
        
        waitframe();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb333
// Size: 0x106
function function_81adda380966c872( s_exfil, ai, player, var_cc6cfef7ac65a530 )
{
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    ai.s_exfil = s_exfil;
    s_exfil.var_ed2b93690e12fb86 = array_add( s_exfil.var_ed2b93690e12fb86, ai );
    s_exfil.var_ed2b93690e12fb86 = array_removedead_or_dying( s_exfil.var_ed2b93690e12fb86 );
    
    if ( ai function_8db1b18eb8068fb9( s_exfil ) || istrue( var_cc6cfef7ac65a530 ) )
    {
        ai function_258e4a8a5807df8f( s_exfil );
    }
    
    if ( isplayer( player ) )
    {
        player.var_ed2b93690e12fb86 = default_to( player.var_ed2b93690e12fb86, [] );
        player.var_ed2b93690e12fb86 = array_add( player.var_ed2b93690e12fb86, ai );
        player.var_ed2b93690e12fb86 = array_removedead_or_dying( player.var_ed2b93690e12fb86 );
        ai.exfil_player = player;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb441
// Size: 0x2f
function function_258e4a8a5807df8f( s_exfil )
{
    if ( !istrue( self.var_47993ccd09da9c11 ) )
    {
        self.var_47993ccd09da9c11 = 1;
        s_exfil.var_6e5b4d39d36d4d34++;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb478
// Size: 0x54
function function_303cb92b5afb6e87( s_exfil )
{
    s_exfil.var_dd4749307484eec4 = 1;
    s_exfil ent_flag_set( "exfil_complete_kill_count" );
    s_exfil.var_18da16a5ee3e8314 namespace_3ab0c2d9cd55890e::function_82a2f59593fe059e( "exfil_kills_remaining", 0 );
    level callback::callback( "on_exfil_complete_kill_count", s_exfil );
    function_62265a47b3eedbaa( s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb4d4
// Size: 0x390
function reset_exfil( s_exfil )
{
    if ( istrue( s_exfil.var_589c572c53eeeeb6 ) )
    {
        logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " has resetting disabled" );
        return;
    }
    
    logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " is resetting" );
    s_exfil ent_flag_clear( "exfil_complete_kill_count" );
    s_exfil ent_flag_clear( "exfil_complete_timeout" );
    s_exfil ent_flag_clear( "player_reached_exfil" );
    function_c068efdf0abd5258( s_exfil.var_d182b8d3f3aaa93b );
    
    if ( isdefined( s_exfil.s_exfil_destination ) )
    {
        s_exfil.s_exfil_destination.var_1326008dc390c510 = undefined;
        s_exfil.s_exfil_destination = undefined;
    }
    
    s_exfil.var_953c0bb9dec80174 = [];
    s_exfil.var_c9164736baf0694a = [];
    s_exfil.var_ed2b93690e12fb86 = [];
    s_exfil.var_fb43e2df572cabdf = [];
    s_exfil.n_kills = 0;
    s_exfil.var_6e5b4d39d36d4d34 = 0;
    s_exfil.var_31b0d4be41550606 = undefined;
    s_exfil.var_dd4749307484eec4 = undefined;
    s_exfil.var_eeb8c244f1d18546 = undefined;
    s_exfil.var_8d29349c076b7199 = undefined;
    s_exfil.var_1326008dc390c510 = undefined;
    function_360cc0762c8f8dc6( 0, s_exfil );
    
    if ( isdefined( s_exfil.var_d182b8d3f3aaa93b ) && isdefined( s_exfil.var_d182b8d3f3aaa93b.interact ) )
    {
        s_exfil.var_d182b8d3f3aaa93b.interact function_555064e06fc5f4b3( 1 );
    }
    else
    {
        logstring( "==CPMP Exfil: Exfil " + s_exfil.name + " interact was somehow deleted. Respawning and reenabling it" );
        function_5169ff9e47582e7a( s_exfil );
        
        if ( !isdefined( s_exfil.var_d182b8d3f3aaa93b.interact ) )
        {
            if ( isent( s_exfil.var_d182b8d3f3aaa93b ) && !function_4027f5445bb7c8fb( s_exfil ) )
            {
                s_exfil.var_d182b8d3f3aaa93b.interact = scripts\cp_mp\interaction::register_interact( s_exfil.var_d182b8d3f3aaa93b, s_exfil.radius, &function_a1778cdfcc8373ae, default_to( level.var_7cc298fa98ce0c7a, %SHARED_HINTSTRINGS/EXFIL_START_USE_GENERIC ) );
                s_exfil.var_d182b8d3f3aaa93b.interact sethintonobstruction( "show" );
            }
            else
            {
                s_exfil.var_d182b8d3f3aaa93b.interact = scripts\cp_mp\interaction::function_32645103f7520635( s_exfil.var_d182b8d3f3aaa93b, &function_a1778cdfcc8373ae );
            }
        }
        
        s_exfil.var_d182b8d3f3aaa93b.interact function_555064e06fc5f4b3( 1 );
    }
    
    if ( isdefined( s_exfil.var_576f57af0204c38c ) )
    {
        s_exfil notify( "exfil_vehicle_gone" );
        self notify( "exfil_vehicle_gone" );
        s_exfil.var_576f57af0204c38c function_b7edf3fe42e320a6( s_exfil );
    }
    
    if ( function_8d3b8265c47a2223() )
    {
        function_9cf09a569caf1a26( s_exfil );
        s_exfil.s_exfil_destination = random( s_exfil.var_fb43e2df572cabdf );
        function_871ded736cf89cc4( s_exfil );
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_smoke", "smoking" );
        s_exfil.s_exfil_destination.mdl_destination setscriptablepartstate( "cp_mp_exfil_icon", "default_icon" );
        level thread namespace_9f6a961447bab709::start_exfil_spawns_at_destination( s_exfil );
        s_exfil namespace_9f6a961447bab709::function_e3ba83b1bb428b8e();
    }
    
    level.var_44194c664b77bf1b[ level.var_44194c664b77bf1b.size ] = s_exfil;
    level callback::callback( "on_exfil_reset", s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb86c
// Size: 0x143
function function_ae18d20050b99c2( s_exfil )
{
    level endon( "game_ended" );
    s_exfil = default_to( s_exfil, level.var_980b9351a7816ae8 );
    
    if ( isarray( s_exfil.var_ed2b93690e12fb86 ) )
    {
        s_exfil.var_ed2b93690e12fb86 = array_removedead_or_dying( s_exfil.var_ed2b93690e12fb86 );
        
        foreach ( zombie in s_exfil.var_ed2b93690e12fb86 )
        {
            if ( isalive( zombie ) )
            {
                zombie dodamage( zombie.health + 990, zombie.origin );
            }
        }
    }
    
    a_remaining_ai = function_368cc1002f8e3c9f( s_exfil );
    
    foreach ( zombie in a_remaining_ai )
    {
        if ( isalive( zombie ) )
        {
            zombie dodamage( zombie.health + 990, zombie.origin );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb9b7
// Size: 0xfd
function function_748fd8b59180efd1( s_exfil )
{
    s_exfil endon( "exfil_complete_timeout" );
    var_b5c2ca133ea9e7a1 = 875;
    
    if ( isdefined( s_exfil.var_c9b6fe30b53a07f8 ) )
    {
        var_b5c2ca133ea9e7a1 = s_exfil.var_c9b6fe30b53a07f8;
    }
    
    while ( true )
    {
        if ( isdefined( s_exfil.var_576f57af0204c38c ) && istrue( s_exfil.var_576f57af0204c38c.leaving ) )
        {
            break;
        }
        
        var_41860e6f820eae9b = get_array_of_closest( s_exfil.s_exfil_destination.origin, level.players, s_exfil.var_c9164736baf0694a, undefined, var_b5c2ca133ea9e7a1 );
        
        foreach ( player in var_41860e6f820eae9b )
        {
            player thread function_f4f52d20f1fb7650( s_exfil );
        }
        
        wait 1;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbabc
// Size: 0x103
function function_f4f52d20f1fb7650( s_exfil )
{
    self endon( "disconnect" );
    
    if ( !isalive( self ) || is_equal( self.s_exfil, s_exfil ) || !isdefined( s_exfil.var_18da16a5ee3e8314 ) || istrue( self.var_92db26323808779f ) )
    {
        return;
    }
    
    self.var_92db26323808779f = 1;
    function_f246f550360cbdbb();
    self.s_exfil = s_exfil;
    namespace_d886885225a713a7::function_bbdcd857d0c2a65e( s_exfil.var_18da16a5ee3e8314, self );
    
    if ( !istrue( s_exfil.var_1c13f1737dccef9a ) )
    {
        thread scripts\mp\hud_message::showsplash( "cp_mp_exfil_inbound" );
    }
    
    callback::callback( "on_exfil_player_joined", s_exfil );
    function_d0b64b8228a4731( s_exfil );
    thread function_689f5a3123aba709( s_exfil );
    
    while ( true )
    {
        level waittill( "exfil_time_remaining", n_time_remaining, var_fb29279929ca56c7 );
        
        if ( self.s_exfil == var_fb29279929ca56c7 )
        {
            thread exfil_timer_player_ui( n_time_remaining, s_exfil );
            self.var_92db26323808779f = undefined;
            break;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbbc7
// Size: 0xa2
function function_f246f550360cbdbb()
{
    if ( isdefined( self.s_exfil ) && isdefined( self.s_exfil.var_18da16a5ee3e8314 ) )
    {
        var_e51ca3441c2d12c3 = self.s_exfil;
        namespace_d886885225a713a7::function_91c9ad377a3c4725( var_e51ca3441c2d12c3.var_18da16a5ee3e8314, self );
        var_e51ca3441c2d12c3.var_c9164736baf0694a = utility::array_remove( var_e51ca3441c2d12c3.var_c9164736baf0694a, self );
        self.s_exfil = undefined;
        self notify( "endon_exfil_defend_mode_timer" );
        self notify( "endon_exfil_timer_player_ui" );
        self setclientomnvar( "ui_match_start_countdown", -1 );
        self setclientomnvar( "ui_is_exfil_countdown", 0 );
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc71
// Size: 0xb4
function function_d0b64b8228a4731( s_exfil )
{
    n_player_count = s_exfil.var_c9164736baf0694a.size;
    
    switch ( n_player_count )
    {
        case 1:
            function_360cc0762c8f8dc6( 35, s_exfil );
            break;
        case 2:
            function_360cc0762c8f8dc6( int( 46.9 ), s_exfil );
            break;
        case 3:
            function_360cc0762c8f8dc6( int( 59.5 ), s_exfil );
            break;
        case 4:
        default:
            function_360cc0762c8f8dc6( int( 71.4 ), s_exfil );
            break;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbd2d
// Size: 0x187
function function_368cc1002f8e3c9f( s_exfil )
{
    a_ai = getaiarray();
    var_5eb85cc70f4b70a0 = [];
    s_exfil ent_flag_clear( "exfil_boss_alive" );
    
    foreach ( ai in a_ai )
    {
        if ( isalive( ai ) && ai.unittype == "zombie" && !isdefined( ai.var_941802a0997e0c42 ) && ai function_8db1b18eb8068fb9( s_exfil ) )
        {
            var_5eb85cc70f4b70a0 = function_6d6af8144a5131f1( var_5eb85cc70f4b70a0, ai );
            
            if ( !isdefined( ai.s_exfil ) )
            {
                s_exfil.var_c9164736baf0694a = array_removeundefined( s_exfil.var_c9164736baf0694a );
                closest_player = get_array_of_closest( ai.origin, s_exfil.var_c9164736baf0694a )[ 0 ];
                function_81adda380966c872( s_exfil, ai, closest_player, 1 );
                ai callback::callback( "on_exfil_ai_spawned" );
            }
            
            if ( isdefined( ai.aicategory ) && ( ai.aicategory == "special" || ai.aicategory == "elite" || ai.aicategory == "boss" ) )
            {
                s_exfil ent_flag_set( "exfil_boss_alive" );
            }
        }
    }
    
    return var_5eb85cc70f4b70a0;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbebd
// Size: 0x123
function function_d006864bb66299cb( s_exfil )
{
    s_exfil endon( "exfil_complete_kill_count" );
    s_exfil endon( "exfil_complete_timeout" );
    var_61cfb0316b4fd931 = 3000;
    n_cleanup_dist_sq = 1000000;
    var_69409d41a2d5a2dd = 1;
    s_exfil.n_cleanups_processed_this_frame = default_to( s_exfil.n_cleanups_processed_this_frame, 0 );
    n_next_eval = 0;
    
    while ( true )
    {
        waitframe();
        n_time = gettime();
        
        if ( n_time < n_next_eval )
        {
            continue;
        }
        
        n_next_eval += var_61cfb0316b4fd931;
        a_ai_enemies = s_exfil.var_ed2b93690e12fb86;
        
        foreach ( ai_enemy in a_ai_enemies )
        {
            if ( !isalive( ai_enemy ) )
            {
                continue;
            }
            
            if ( s_exfil.n_cleanups_processed_this_frame >= var_69409d41a2d5a2dd )
            {
                s_exfil.n_cleanups_processed_this_frame = 0;
                waitframe();
            }
            
            ai_enemy do_cleanup_check( s_exfil, n_cleanup_dist_sq );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbfe8
// Size: 0x172
function do_cleanup_check( s_exfil, n_cleanup_dist_sq )
{
    var_29fbeef6861b44a9 = 5000;
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    if ( istrue( self.var_9df083b474817260 ) )
    {
        return;
    }
    
    if ( !isdefined( self.spawntime ) )
    {
        return;
    }
    
    n_time_alive = gettime() - self.spawntime;
    
    if ( n_time_alive < var_29fbeef6861b44a9 )
    {
        return;
    }
    
    if ( istrue( self.var_3966ab82314136d4 ) )
    {
        return;
    }
    
    var_b2aba8329033df3d = function_8db1b18eb8068fb9( s_exfil );
    s_exfil.n_cleanups_processed_this_frame++;
    
    if ( !var_b2aba8329033df3d )
    {
        n_dist_sq_min = 10000000;
        players = s_exfil.var_c9164736baf0694a;
        e_closest_player = players[ 0 ];
        
        foreach ( player in players )
        {
            if ( !isalive( player ) || player.sessionstate == "spectator" )
            {
                continue;
            }
            
            n_dist_sq = distancesquared( self.origin, player.origin );
            
            if ( n_dist_sq < n_dist_sq_min )
            {
                n_dist_sq_min = n_dist_sq;
                e_closest_player = player;
            }
        }
        
        if ( n_dist_sq_min >= n_cleanup_dist_sq )
        {
            thread function_3c4b268a77e183ed( s_exfil );
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc162
// Size: 0x2d
function function_3c4b268a77e183ed( s_exfil )
{
    self.var_3966ab82314136d4 = 1;
    delete_zombie_noone_looking( s_exfil );
    
    if ( isdefined( self ) )
    {
        self.var_3966ab82314136d4 = undefined;
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc197
// Size: 0xa8
function delete_zombie_noone_looking( s_exfil )
{
    if ( istrue( self.in_the_ground ) )
    {
        return;
    }
    
    if ( !self.takedamage )
    {
        return;
    }
    
    foreach ( player in level.players )
    {
        if ( !isalive( player ) || player.sessionstate == "spectator" )
        {
            continue;
        }
        
        if ( scripts\anim\utility_common::player_can_see_ai( player, self ) )
        {
            return;
        }
    }
    
    cleanup_zombie( s_exfil );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc247
// Size: 0xbb
function cleanup_zombie( s_exfil )
{
    if ( !isalive( self ) )
    {
        println( "<dev string:x57c>" );
        return;
    }
    
    /#
    #/
    
    self.b_cleaned_up = 1;
    self.var_912527d7e0ebef7 = 1;
    self.allowdeath = 1;
    self.var_7e4b076a06c6df27 = 1;
    self.no_powerups = 1;
    s_exfil.var_ed2b93690e12fb86 = array_remove( s_exfil.var_ed2b93690e12fb86, self );
    
    if ( istrue( self.var_47993ccd09da9c11 ) )
    {
        s_exfil.var_6e5b4d39d36d4d34--;
    }
    
    self kill();
    waitframe();
    
    if ( isdefined( self ) )
    {
        if ( isagent( self ) )
        {
            scripts\cp_mp\agents\agent_utils::despawnagent();
            return;
        }
        
        self delete();
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc30a
// Size: 0x53
function function_895c7e0e9911ff6e( s_exfil, var_26650da51bc166c9, b_conversation )
{
    a_players = self;
    
    if ( !isarray( a_players ) )
    {
        a_players = [ a_players ];
    }
    
    if ( istrue( b_conversation ) )
    {
        scripts\cp_mp\overlord::playconversation( var_26650da51bc166c9, a_players );
        return;
    }
    
    scripts\cp_mp\overlord::playevent( var_26650da51bc166c9, a_players );
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc365
// Size: 0x289
function function_4b5e408a00f4ddd8( s_exfil, var_f7ed3fab43f58dc7 )
{
    if ( !isdefined( s_exfil ) || istrue( s_exfil.var_1326008dc390c510 ) )
    {
        return;
    }
    
    s_exfil.b_disabled = 1;
    s_exfil notify( "endon_start_exfil_spawns_at_destination" );
    level.var_44194c664b77bf1b = array_remove( level.var_44194c664b77bf1b, s_exfil );
    
    if ( isdefined( s_exfil.var_d182b8d3f3aaa93b ) )
    {
        s_exfil.var_d182b8d3f3aaa93b notify( "end_exfil_interact_objective_distance" );
        
        if ( isdefined( s_exfil.var_d182b8d3f3aaa93b.n_obj_id ) )
        {
            scripts\mp\objidpoolmanager::returnobjectiveid( s_exfil.var_d182b8d3f3aaa93b.n_obj_id );
            s_exfil.var_d182b8d3f3aaa93b.n_obj_id = undefined;
        }
        
        if ( isdefined( s_exfil.var_d182b8d3f3aaa93b.interact ) )
        {
            if ( isent( s_exfil.var_d182b8d3f3aaa93b.interact ) )
            {
                if ( s_exfil.var_d182b8d3f3aaa93b.interact isusable() )
                {
                    s_exfil.var_d182b8d3f3aaa93b.interact function_dfb78b3e724ad620( 0 );
                }
            }
            else
            {
                s_exfil.var_d182b8d3f3aaa93b.interact setscriptablepartstate( "cp_mp_exfil_icon", istrue( var_f7ed3fab43f58dc7 ) ? "empty_icon" : "disabled_icon" );
                s_exfil.var_d182b8d3f3aaa93b.interact setscriptablepartstate( "cp_mp_exfil_site", "standby" );
                s_exfil.var_d182b8d3f3aaa93b.interact setscriptablepartstate( "cp_mp_exfil_smoke", "stop" );
            }
        }
    }
    
    if ( isdefined( s_exfil.s_exfil_destination ) && !is_equal( s_exfil.var_d182b8d3f3aaa93b, s_exfil.s_exfil_destination.mdl_destination ) && isdefined( s_exfil.s_exfil_destination.mdl_destination ) )
    {
        s_exfil.s_exfil_destination.mdl_destination function_dfb78b3e724ad620( 0 );
        
        if ( isdefined( s_exfil.s_exfil_destination.mdl_destination.n_obj_id ) )
        {
            scripts\mp\objidpoolmanager::returnobjectiveid( s_exfil.s_exfil_destination.mdl_destination.n_obj_id );
            s_exfil.s_exfil_destination.mdl_destination.n_obj_id = undefined;
        }
    }
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc5f6
// Size: 0xb
function function_c51a46f4a60b13d5()
{
    return level.var_2562ea48235e90b5;
}

// Namespace exfil / namespace_9f6a961447bab709
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc60a
// Size: 0xb
function function_8e6454dd6d0cedd3()
{
    return level.var_44194c664b77bf1b;
}

