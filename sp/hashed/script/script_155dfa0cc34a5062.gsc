#using script_155dfa0cc34a5062;
#using script_1e172edbfbe283b6;
#using script_4dac3680f88a01c3;
#using script_6202afd5acdbf2da;
#using scripts\anim\dialogue;
#using scripts\anim\notetracks_sp;
#using scripts\anim\shared;
#using scripts\common\ai;
#using scripts\common\ai_lookat;
#using scripts\common\anim;
#using scripts\common\scene;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\anim;
#using scripts\sp\friendlyfire;
#using scripts\sp\hud_util;
#using scripts\sp\maps\sp_jup_hijack\sp_jup_hijack_lighting;
#using scripts\sp\player;
#using scripts\sp\utility;
#using scripts\stealth\threat_sight;
#using scripts\stealth\utility;

#namespace namespace_1372601db13b5bbc;

/#

    // Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2082
    // Size: 0x5, Type: dev
    function function_ebad7db0ae66fe42()
    {
        
    }

#/

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x208f
// Size: 0x21f
function function_9b348eda8aba43ce( struct_name, var_96d11d0d148248f4 )
{
    level.player setstance( "stand" );
    current_struct = getstruct( struct_name, "targetname" );
    
    if ( !isdefined( current_struct.angles ) )
    {
        current_struct.angles = ( 0, 0, 0 );
    }
    
    var_e0e9bcc402a552d4 = ( 0, 0, -60 );
    cam = spawn( "script_origin", current_struct.origin + var_e0e9bcc402a552d4 );
    cam.angles = current_struct.angles;
    level.player playerlinkto( cam, undefined, 0, 0, 0, 0, 0, 0 );
    
    if ( istrue( var_96d11d0d148248f4 ) )
    {
        level.player playerlinktoblend( cam, undefined, 2 );
    }
    
    while ( true )
    {
        wait_time = float( current_struct.script_noteworthy );
        
        if ( isdefined( wait_time ) )
        {
            wait wait_time;
        }
        
        if ( !isdefined( current_struct.target ) )
        {
            break;
        }
        
        next_struct = getstruct( current_struct.target, "targetname" );
        
        if ( !isdefined( next_struct ) )
        {
            break;
        }
        
        if ( !isdefined( next_struct.angles ) )
        {
            next_struct.angles = ( 0, 0, 0 );
        }
        
        travel_time = float( current_struct.script_parameters );
        
        if ( !isdefined( travel_time ) || is_equal( travel_time, 0 ) )
        {
            cam dontinterpolate();
            cam.origin = next_struct.origin + var_e0e9bcc402a552d4;
            cam.angles = next_struct.angles;
        }
        else
        {
            cam moveto( next_struct.origin + var_e0e9bcc402a552d4, travel_time );
            cam rotateto( next_struct.angles, travel_time );
            wait travel_time;
        }
        
        current_struct = next_struct;
    }
    
    level.player unlink();
    cam delete();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x22b6
// Size: 0x111
function function_3890eaf25f4d31ce( struct_name, var_96d11d0d148248f4, endon_flag )
{
    level.player setstance( "stand" );
    current_struct = getstruct( struct_name, "targetname" );
    
    if ( !isdefined( current_struct ) )
    {
        return;
    }
    
    var_e0e9bcc402a552d4 = ( 0, 0, -60 );
    cam = spawn_tag_origin( current_struct.origin + var_e0e9bcc402a552d4, current_struct.angles );
    level.player playerlinkto( cam, "tag_origin", 1, 60, 60, 50, 50, 0 );
    
    if ( istrue( var_96d11d0d148248f4 ) )
    {
        level.player playerlinktoblend( cam, undefined, 2 );
        wait 2;
        level.player playerlinkto( cam, "tag_origin", 1, 60, 60, 50, 50, 0 );
    }
    
    if ( isdefined( endon_flag ) )
    {
        flag_wait( endon_flag );
    }
    
    level.player unlink();
    cam delete();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x23cf
// Size: 0x119
function function_112eb3afa848aa64( struct_name, time )
{
    if ( !isdefined( time ) )
    {
        time = 2;
    }
    
    start_time = gettime();
    player_forward = anglestoforward( level.player getplayerangles() );
    var_c27840c1f8beff05 = level.player geteye() + player_forward * 30;
    org = spawn( "script_origin", var_c27840c1f8beff05 );
    struct = function_7a18da6e48b71c35( struct_name );
    org moveto( struct.origin, time );
    level.player freezecontrols( 1 );
    
    while ( true )
    {
        if ( gettime() > start_time + time * 1000 )
        {
            break;
        }
        
        level.player setplayerangles( vectortoangles( org.origin - level.player geteye() ) );
        waitframe();
    }
    
    level.player freezecontrols( 0 );
    org delete();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x24f0
// Size: 0x17a
function function_6f3fabd396506d70( pos, var_257b516e62ea1d2b, dur, max_dist, endon_flag )
{
    line_limit = 40;
    var_bf8e408018c36808 = [];
    var_642668232f8b999d = var_257b516e62ea1d2b;
    
    while ( var_642668232f8b999d.size > 0 )
    {
        new_line = getsubstr( var_642668232f8b999d, 0, line_limit );
        
        if ( var_642668232f8b999d.size > line_limit )
        {
            var_642668232f8b999d = getsubstr( var_642668232f8b999d, line_limit, var_642668232f8b999d.size );
            
            while ( !is_equal( new_line[ new_line.size - 1 ], " " ) )
            {
                var_642668232f8b999d = new_line[ new_line.size - 1 ] + var_642668232f8b999d;
                new_line = getsubstr( new_line, 0, new_line.size - 1 );
            }
        }
        else
        {
            var_642668232f8b999d = "";
        }
        
        var_bf8e408018c36808[ var_bf8e408018c36808.size ] = new_line;
    }
    
    while ( true )
    {
        waitframe();
        
        if ( isdefined( endon_flag ) && flag( endon_flag ) )
        {
            break;
        }
        
        if ( isdefined( max_dist ) )
        {
            if ( !isdefined( level.player ) )
            {
                continue;
            }
            
            var_c591756c172fe4ce = distance( level.player.origin, pos );
            
            if ( var_c591756c172fe4ce > max_dist )
            {
                continue;
            }
        }
        
        for (i = 0; i < var_bf8e408018c36808.size; i++) {
            var_b836d672dc79ed93 = ( 0, 0, -2 * i );
            
            /#
                print3d( pos + var_b836d672dc79ed93, var_bf8e408018c36808[ i ], ( 1, 1, 1 ), 1, 0.1, 1, 1 );
            #/
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2672
// Size: 0xb2
function function_37d4e1a89bef5c44( struct_names, toggle_on )
{
    endon_flag = "flag_world_text_disable_" + struct_names;
    
    if ( istrue( toggle_on ) )
    {
        text_array = getstructarray( struct_names, "targetname" );
        
        foreach ( text in text_array )
        {
            thread function_6f3fabd396506d70( text.origin, text.script_noteworthy, 1, 100, endon_flag );
        }
        
        return;
    }
    
    flag_set( endon_flag );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x272c
// Size: 0x20
function function_fa35b59a26e5cc66( str_name )
{
    model_array = function_60ff77d168418390( str_name );
    return model_array[ 0 ];
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2755
// Size: 0x1cf
function function_60ff77d168418390( str_name )
{
    model_structs = getstructarray( str_name, "targetname" );
    model_array = [];
    
    foreach ( struct in model_structs )
    {
        model_obj = spawn( "script_model", struct.origin );
        
        if ( !isdefined( struct.angles ) )
        {
            struct.angles = ( 0, 0, 0 );
        }
        
        model_obj.struct = struct;
        model_obj.angles = struct.angles;
        model_obj setmodel( struct.script_noteworthy );
        
        if ( isdefined( struct.target ) )
        {
            model_obj.target = struct.target;
        }
        
        if ( isdefined( struct.script_parameters ) )
        {
            head_obj = spawn( "script_model", ( 0, 0, 0 ) );
            head_obj setmodel( struct.script_parameters );
            head_obj linkto( model_obj, "j_spine4", ( 0, 0, 0 ), ( 0, 0, 0 ) );
            model_obj.headmodel = head_obj;
            
            if ( is_equal( struct.script_parameters, "head_hero_price_nohat_lod" ) )
            {
                model_obj.hatmodel = "hat_hero_price_undercover_beanie";
                model_obj attach( model_obj.hatmodel );
            }
        }
        
        model_array[ model_array.size ] = model_obj;
    }
    
    return model_array;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x292d
// Size: 0xd6
function function_2778ccf84f201fd( time, next_pos )
{
    if ( isdefined( self.current_pos ) && !isdefined( next_pos ) )
    {
        if ( !isdefined( self.current_pos.target ) )
        {
            return;
        }
        
        next_pos = getstruct( self.current_pos.target, "targetname" );
    }
    else if ( !isdefined( next_pos ) )
    {
        next_pos = getstruct( self.target, "targetname" );
    }
    
    self moveto( next_pos.origin, time );
    
    if ( !isdefined( next_pos.angles ) )
    {
        next_pos.angles = ( 0, 0, 0 );
    }
    
    self rotateto( next_pos.angles, time );
    self.current_pos = next_pos;
    wait time;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0b
// Size: 0x54
function function_ada99e3722b4ce7( struct_goal )
{
    next_pos = getstruct( struct_goal, "targetname" );
    self.origin = next_pos.origin;
    self.angles = next_pos.angles;
    self.current_pos = next_pos;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a67
// Size: 0xbf
function function_eed6250e31a849f0()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isarray( self ) )
    {
        if ( isdefined( self.headmodel ) )
        {
            self.headmodel delete();
        }
        
        self delete();
        return;
    }
    
    foreach ( item in self )
    {
        if ( isdefined( item.headmodel ) )
        {
            item.headmodel delete();
        }
        
        if ( isdefined( item.hatmodel ) )
        {
            item.hatmodel delete();
        }
        
        item delete();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2e
// Size: 0xa1
function function_eb263be9bd7f802b( var_257b516e62ea1d2b )
{
    self endon( "death" );
    self notify( "print3d" );
    self endon( "print3d" );
    randomoffset = randomintrange( 20, 80 );
    
    if ( isai( self ) )
    {
        offset = ( 0, 0, 60 );
    }
    else
    {
        offset = ( 0, 0, 0 );
    }
    
    while ( true )
    {
        /#
            print3d( self.origin + ( 0, 0, randomoffset ), var_257b516e62ea1d2b, ( 1, 1, 1 ), 1, 0.35, 1, 1 );
        #/
        
        waitframe();
    }
}

/#

    // Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x2bd7
    // Size: 0x66, Type: dev
    function function_ccc9189861847214( origin, text, color, scale, ender )
    {
        if ( isent( self ) )
        {
            self endon( "<dev string:x1c>" );
        }
        
        if ( isdefined( ender ) )
        {
            if ( isdefined( self ) )
            {
                self endon( ender );
            }
            else
            {
                level endon( ender );
            }
        }
        
        while ( true )
        {
            print3d( origin, text, color, 1, scale );
            waitframe();
        }
    }

    // Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2c45
    // Size: 0x5, Type: dev
    function function_9e08608ba165709c()
    {
        
    }

#/

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c52
// Size: 0x71
function turbulence( scale, duration, slow_scale )
{
    var_8e93e1ba5054c701 = 0.075 * scale;
    level.player earthquakeforplayer( var_8e93e1ba5054c701, duration, level.player.origin, 10000 );
    level.player playrumbleonentity( "damage_light" );
    thread function_ce27b151bd7ba930( slow_scale );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ccb
// Size: 0x5f
function function_30a8198b3c0f3b1( scale, duration )
{
    var_8e93e1ba5054c701 = 0.075 * scale;
    earthquake( var_8e93e1ba5054c701, duration, level.player.origin, 800 );
    level.player playrumbleonentity( "damage_light" );
    thread function_ce27b151bd7ba930();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2d32
// Size: 0x62
function function_f398c9cf637d3e18( time, shader, scale )
{
    if ( !isdefined( time ) )
    {
        time = 0.3;
    }
    
    overlay = scripts\sp\hud_util::get_optional_overlay( shader );
    
    if ( time > 0 )
    {
        overlay fadeovertime( time );
    }
    
    overlay.alpha = 0.12 * scale;
    
    if ( time > 0 )
    {
        wait time;
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d9c
// Size: 0x73
function function_ce27b151bd7ba930( slow_scale )
{
    movespeedscale = level.player.movespeedscale;
    
    if ( !isdefined( slow_scale ) )
    {
        slow_scale = 0.35;
    }
    
    level.player scripts\engine\sp\utility::blend_movespeedscale( slow_scale, 0.25 );
    wait 0.25;
    
    if ( !isdefined( movespeedscale ) )
    {
        movespeedscale = 0.5;
    }
    
    level.player scripts\engine\sp\utility::blend_movespeedscale( movespeedscale, 3 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e17
// Size: 0x11b
function function_7cbb2723d14c566b( scale, flag_string )
{
    var_8e93e1ba5054c701 = scale * 0.075;
    level.earthquake_active = 0;
    
    while ( !flag( flag_string ) )
    {
        if ( level.earthquake_active )
        {
            wait 1;
            continue;
        }
        
        wait_time = randomintrange( 15, 30 );
        values = [ randomfloatrange( 0.25, 0.5 ), randomfloatrange( 0.25, 0.5 ), randomfloatrange( 0.25, 0.5 ), randomfloatrange( 0.5, 2 ), randomfloatrange( 0.5, 2 ), randomfloatrange( 0.5, 1.5 ) ];
        screenshake( level.player.origin, values[ 0 ], values[ 1 ], values[ 2 ], wait_time, 0, 0, 0, values[ 3 ], values[ 4 ], values[ 5 ] );
        wait wait_time / 2;
    }
    
    thread function_ce27b151bd7ba930();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f3a
// Size: 0x128
function function_a3c560b7e0a3f584()
{
    flag_wait( "flag_trigger_turbulence_1" );
    wait 1;
    var_e7b764034781cf94 = 1;
    thread function_365c95a5050985c9();
    level.player thread scripts\sp\maps\sp_jup_hijack\sp_jup_hijack_lighting::function_872ab8327e05cf14();
    wait 4;
    thread function_365c95a5050985c9( 0 );
    level.player thread scripts\sp\maps\sp_jup_hijack\sp_jup_hijack_lighting::function_872ab8327e05cf14();
    wait 4;
    thread function_365c95a5050985c9( 1 );
    level.player thread scripts\sp\maps\sp_jup_hijack\sp_jup_hijack_lighting::function_872ab8327e05cf14();
    flag_wait( "flag_trigger_turbulence_2" );
    
    while ( !flag( "flag_standoff_end" ) )
    {
        var_81568d4ee1187346 = [ undefined, 0, 1 ];
        thread function_365c95a5050985c9( random( var_81568d4ee1187346 ) );
        level.player thread scripts\sp\maps\sp_jup_hijack\sp_jup_hijack_lighting::function_872ab8327e05cf14();
        rand = randomfloatrange( 4, 5 );
        wait rand;
    }
    
    thread function_782e986772ce6fdb();
    flag_wait( "lgt_mak_para_door_open" );
    scale = 3.5;
    duration = 16;
    thread turbulence( scale, duration );
    flag_set( "flag_show_o2_masks" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x306a
// Size: 0x7c
function function_365c95a5050985c9( big_shake )
{
    scale = 2.5;
    duration = 3;
    level.earthquake_active = 1;
    thread namespace_2f067fefb7259496::turbulence( big_shake );
    
    if ( isdefined( big_shake ) && big_shake )
    {
        scale = 3;
        duration = 4;
    }
    else if ( isdefined( big_shake ) && !big_shake )
    {
        scale = 1.5;
        duration = 2;
    }
    
    thread turbulence( scale, duration );
    wait duration;
    level.earthquake_active = 0;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30ee
// Size: 0x7c
function function_42ad86cbdd2d532c( big_shake )
{
    scale = 2.5;
    duration = 3;
    level.earthquake_active = 1;
    thread namespace_2f067fefb7259496::function_e587439a27a5c001( big_shake );
    
    if ( isdefined( big_shake ) && big_shake )
    {
        scale = 3;
        duration = 4;
    }
    else if ( isdefined( big_shake ) && !big_shake )
    {
        scale = 1.5;
        duration = 2;
    }
    
    thread turbulence( scale, duration );
    wait duration;
    level.earthquake_active = 0;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3172
// Size: 0xc9
function function_782e986772ce6fdb()
{
    scale = 1.5;
    duration = 5;
    rand = randomfloatrange( 10, 13 );
    wait rand;
    
    while ( !flag( "lgt_mak_para_door_open" ) )
    {
        level.earthquake_active = 1;
        thread turbulence( scale, duration );
        thread namespace_2f067fefb7259496::function_c0f0d9a29d612e95();
        wait duration;
        level.earthquake_active = 0;
        rand = randomfloatrange( 5, 10 );
        wait rand;
    }
    
    flag_wait( "flag_trigger_turbulence_3" );
    wait 8;
    scale = 2;
    duration = 5;
    
    while ( true )
    {
        rand = randomfloatrange( 5, 10 );
        wait rand;
        level.earthquake_active = 1;
        thread turbulence( scale, duration );
        wait duration;
        level.earthquake_active = 0;
    }
}

/#

    // Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3243
    // Size: 0x5, Type: dev
    function function_4c3e170c701819f9()
    {
        
    }

#/

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3250
// Size: 0x6fa
function function_8ea1fb185586cc5a()
{
    level.var_cfc29cd454498f9e = [];
    level.var_cfc29cd454498f9e[ "man" ] = 0;
    level.var_cfc29cd454498f9e[ "woman" ] = 0;
    level.var_cfc29cd454498f9e[ "adult" ] = 0;
    level.civspawners = [];
    level.civspawners[ "adult_spawners" ] = getspawnerarray( "adult_spawner" );
    level.civspawners[ "man_spawners" ] = [];
    level.civspawners[ "woman_spawners" ] = [];
    
    foreach ( spawner in level.civspawners[ "adult_spawners" ] )
    {
        if ( spawner.script_noteworthy == "man" )
        {
            level.civspawners[ "man_spawners" ][ level.civspawners[ "man_spawners" ].size ] = spawner;
            continue;
        }
        
        level.civspawners[ "woman_spawners" ][ level.civspawners[ "woman_spawners" ].size ] = spawner;
    }
    
    level.var_e471ce013e2cc820 = [];
    level.var_ffd93feee6d8259b = [];
    
    if ( getdvarint( @"hash_3dcc1c3d7415db25", 0 ) )
    {
        return;
    }
    
    var_cfe2e30acba4c67e = level_spawner( "man" );
    var_5d61c5dd97f0ad03 = level_spawner( "woman" );
    var_3337184997f609bc = getstructarray( "passenger_seat_animnode", "targetname" );
    var_1b3fc8ff798f0a08 = getdvarint( @"hash_40215944f9aa5045", 0 );
    
    foreach ( animnode in var_3337184997f609bc )
    {
        if ( !istrue( var_1b3fc8ff798f0a08 ) && is_equal( animnode.script_noteworthy, "high_density_passenger" ) )
        {
            continue;
        }
        
        if ( level.start_point == "standoff_recording" && is_equal( animnode.script_parameters, "delete_for_bink" ) )
        {
            continue;
        }
        
        start_time = randomfloatrange( 0.1, 1 );
        gender = getdvar( @"hash_2d48b458366c7f5d", "default" );
        
        if ( gender == "men" )
        {
            civ = function_aa07d9f9a1f53ec0( animnode, "civ", var_cfe2e30acba4c67e, undefined, "male" );
            animnode thread delaythread( start_time, &anim_loop_solo, civ, animnode.animation );
        }
        else if ( gender == "women" )
        {
            civ = function_aa07d9f9a1f53ec0( animnode, "civ", var_5d61c5dd97f0ad03, undefined, "female" );
            animnode thread delaythread( start_time, &anim_loop_solo, civ, animnode.animation );
        }
        else if ( isdefined( animnode.script_noteworthy ) && animnode.script_noteworthy == "man" )
        {
            civ = function_aa07d9f9a1f53ec0( animnode, "civ", var_cfe2e30acba4c67e, undefined, "male" );
            animnode thread delaythread( start_time, &anim_loop_solo, civ, animnode.animation );
        }
        else if ( isdefined( animnode.script_noteworthy ) && animnode.script_noteworthy == "woman" )
        {
            civ = function_aa07d9f9a1f53ec0( animnode, "civ", var_5d61c5dd97f0ad03, undefined, "female" );
            animnode thread delaythread( start_time, &anim_loop_solo, civ, animnode.animation );
        }
        else if ( utility::cointoss() )
        {
            civ = function_aa07d9f9a1f53ec0( animnode, "civ", var_cfe2e30acba4c67e, undefined, "man" );
            animnode thread delaythread( start_time, &anim_loop_solo, civ, animnode.animation );
        }
        else
        {
            civ = function_aa07d9f9a1f53ec0( animnode, "civ", var_5d61c5dd97f0ad03, undefined, "female" );
            animnode thread delaythread( start_time, &anim_loop_solo, civ, animnode.animation );
        }
        
        civ.animnode = animnode;
        civ.curstate = 0;
        civ.script_noteworthy = animnode.script_noteworthy;
        civ.script_linkname = animnode.script_linkname;
        civ.target = animnode.target;
        animnode.civ = civ;
        
        if ( isdefined( animnode.script_offhands ) && animnode.script_offhands.size > 0 )
        {
            var_bcd0896585faba23 = strtok( animnode.script_offhands, "," );
            model = var_bcd0896585faba23[ 0 ];
            lefthanded = 0;
            
            if ( var_bcd0896585faba23.size > 1 && ( var_bcd0896585faba23[ 1 ] == " left" || string_starts_with( var_bcd0896585faba23[ 1 ], "left" ) ) )
            {
                lefthanded = 1;
            }
            
            civ thread function_f46b574e6bde386d( model, lefthanded );
            level.var_ffd93feee6d8259b[ level.var_ffd93feee6d8259b.size ] = civ;
        }
        
        level.var_e471ce013e2cc820[ level.var_e471ce013e2cc820.size ] = civ;
        level.var_8fdfe8e04db3db1f = level.var_e471ce013e2cc820;
    }
    
    wait 2.1;
    
    foreach ( civ in level.var_8fdfe8e04db3db1f )
    {
        if ( isdefined( civ.animnode.script_linkto ) )
        {
            civ.paired_partner = getstruct( civ.animnode.script_linkto, "script_linkname" );
            civ thread function_384d78dd0b8f21da( civ.paired_partner );
            civ.paired_partner = civ.paired_partner.civ;
            civ.paired_partner.paired_child = 1;
        }
    }
    
    flag_wait( "passenger_transition_to_alert" );
    level notify( "kill_idle_managers" );
    level.player thread function_e3449985ee5fe6f2();
    
    foreach ( civ in level.var_8fdfe8e04db3db1f )
    {
        if ( istrue( civ.paired_child ) )
        {
            continue;
        }
        
        if ( isdefined( civ.animnode.target ) )
        {
            continue;
        }
        
        civ thread transition_to_alert( 0 );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3952
// Size: 0x86
function function_53bfad63cce70ff3()
{
    var_fce7542d277a7a39 = getstructarray( "passenger_dead_animnode", "targetname" );
    
    foreach ( animnode in var_fce7542d277a7a39 )
    {
        if ( isdefined( animnode.animation ) )
        {
            animnode scene::play( undefined, animnode.animation, "jup_hij_dead_bodies_staging" );
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x39e0
// Size: 0xb0
function function_f46b574e6bde386d( phone_model, left_hand )
{
    self endon( "death" );
    
    if ( !isdefined( self.var_48491c1dd7d0a33d ) )
    {
        model = spawn( "script_model", ( 0, 0, 0 ) );
        model setmodel( phone_model );
        
        if ( left_hand )
        {
            model linkto( self, "tag_accessory_left", ( 0, 0, 0 ), ( -90, 0, 180 ) );
        }
        else
        {
            model linkto( self, "tag_accessory_right", ( 0, 0, 0 ), ( -90, 0, 180 ) );
        }
        
        self.var_48491c1dd7d0a33d = model;
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a98
// Size: 0x87
function transition_to_alert( instant )
{
    civ = self;
    wait_time = randomfloatrange( 0, 1 );
    
    if ( !istrue( instant ) )
    {
        wait wait_time;
    }
    
    if ( isdefined( civ.paired_partner ) )
    {
        thread function_caae90accdd1699c( civ.paired_partner, 2 );
    }
    
    function_caae90accdd1699c( civ, 2 );
    
    if ( !istrue( instant ) )
    {
        wait 1;
    }
    
    civ thread function_cf1311a027d39d1b( "futile_defuse_black_out", civ.paired_partner );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b27
// Size: 0x3c
function function_7abafeddc8d99f46( angle )
{
    return within_fov( level.player geteye(), level.player getplayerangles(), self.origin, cos( angle ) );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b6c
// Size: 0x3e, Type: bool
function function_5d60dc2181ca061d()
{
    animnode = self.animnode;
    starting_anim = self.animnode.animation;
    return isdefined( function_fbd76024d6a47870( starting_anim, 7 ) );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb3
// Size: 0x5b
function function_5619f5c41494dc0a( paired_partner, state )
{
    if ( isdefined( paired_partner ) )
    {
        paired_partner stopanimscripted();
        paired_partner.animnode notify( "stop_loop" );
        thread function_caae90accdd1699c( paired_partner, state );
    }
    
    self stopanimscripted();
    self.animnode notify( "stop_loop" );
    function_caae90accdd1699c( self, state );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c16
// Size: 0x116
function function_cf1311a027d39d1b( flag_endon, paired_partner )
{
    self endon( "death" );
    in_panic = 0;
    true_panic = 0;
    
    while ( !flag( flag_endon ) )
    {
        var_2d58e8aae155cc83 = distance( level.player.origin, self.origin );
        var_80974f880973e4b6 = level.player isads() && function_7abafeddc8d99f46( 45 );
        
        if ( level.var_35dc8163678b4227 )
        {
            if ( !in_panic )
            {
                in_panic = 1;
                
                if ( function_5d60dc2181ca061d() )
                {
                    function_5619f5c41494dc0a( paired_partner, 7 );
                }
                else
                {
                    function_5619f5c41494dc0a( paired_partner, 4 );
                }
                
                while ( level.var_35dc8163678b4227 )
                {
                    wait 1;
                }
            }
        }
        else if ( var_2d58e8aae155cc83 < 200 && var_80974f880973e4b6 )
        {
            if ( !in_panic )
            {
                function_5619f5c41494dc0a( paired_partner, 4 );
                in_panic = 1;
                wait 2;
            }
        }
        else if ( in_panic )
        {
            function_5619f5c41494dc0a( paired_partner, 5 );
            in_panic = 0;
            true_panic = 0;
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d34
// Size: 0x161
function function_8a39e2a8a63ec1ac( impactpos )
{
    bullet_start = self geteye();
    bullet_end = impactpos;
    wait 0.1;
    
    foreach ( guy in level.var_8fdfe8e04db3db1f )
    {
        if ( is_dead_or_dying( guy ) )
        {
            level.var_8fdfe8e04db3db1f = array_remove( level.var_8fdfe8e04db3db1f, guy );
            continue;
        }
        
        foreach ( deathpos in level.recent_deaths )
        {
            var_e2cea03548e8d846 = distance( deathpos, guy.origin );
            
            if ( var_e2cea03548e8d846 < 100 )
            {
                guy.var_3038ff91bd42a629 = 1;
                break;
            }
        }
        
        if ( !istrue( guy.var_ed6a778872306a90 ) )
        {
            var_9dc1de17618492d7 = function_6765f46c2f6e7249( bullet_start, bullet_end, guy.origin );
            
            if ( var_9dc1de17618492d7 < 100 )
            {
                guy.var_e26752ded17f72ec = 1;
            }
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9d
// Size: 0x5c
function function_e3449985ee5fe6f2()
{
    self endon( "death" );
    
    if ( !isdefined( level.recent_deaths ) )
    {
        level.recent_deaths = [];
    }
    
    while ( true )
    {
        self waittill( "bullet_first_impact", _, _, _, _, _, _, _, impactpos, _ );
        function_8a39e2a8a63ec1ac( impactpos );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3f01
// Size: 0x78
function function_6765f46c2f6e7249( p1, p2, var_cdcd2c78f5175a86 )
{
    l2 = distancesquared( p1, p2 );
    
    if ( l2 == 0 )
    {
        return distance( p1, var_cdcd2c78f5175a86 );
    }
    
    t = clamp( vectordot( var_cdcd2c78f5175a86 - p1, p2 - p1 ) / l2, 0, 1 );
    projection = p1 + t * ( p2 - p1 );
    return distance( var_cdcd2c78f5175a86, projection );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f82
// Size: 0x17
function function_e2ee6f531da3872c()
{
    anim.callbacks[ "DoAnimation" ] = &function_aabfd2fc04931c29;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3fa1
// Size: 0x159
function function_aabfd2fc04931c29( org, angles, animname, anime, anim_string, idleanim, scripted_node_ent )
{
    animlength = scripts\sp\anim::do_animation( org, angles, animname, anime, anim_string, idleanim, scripted_node_ent );
    
    if ( isdefined( level.var_70a7354d67759191[ animname ] ) && isdefined( level.var_70a7354d67759191[ animname ][ anime ] ) )
    {
        var_1c8d96beb843e7b1 = undefined;
        var_792db042affa13d = [];
        
        foreach ( index, animentry in level.var_70a7354d67759191[ animname ][ anime ] )
        {
            if ( index == 0 )
            {
                var_1c8d96beb843e7b1 = animentry;
                continue;
            }
            
            var_792db042affa13d[ index - 1 ] = animentry;
        }
        
        assertex( isdefined( var_1c8d96beb843e7b1 ), "Index 0 of level.hijack_tracking_nodes[" + anime + "] doesn't contain a valid anim node" );
        assertex( isdefined( var_792db042affa13d[ 0 ] ), "level.hijack_tracking_nodes[" + animname + "][" + anime + "] doesn't contain any anim leaf nodes at index 1 or higher" );
        
        if ( isdefined( var_1c8d96beb843e7b1 ) && isdefined( var_792db042affa13d[ 0 ] ) )
        {
            self thread [[ level.tracking_callbacks[ anime ] ]]( anime, var_1c8d96beb843e7b1, var_792db042affa13d );
        }
    }
    
    return animlength;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4103
// Size: 0x18c
function function_caae90accdd1699c( civ, state )
{
    animnode = civ.animnode;
    starting_anim = civ.animnode.animation;
    animnode notify( "stop_loop" );
    civ stopanimscripted();
    
    if ( is_equal( state, 2 ) )
    {
        civ.curstate = 1;
        transition_anim = function_fbd76024d6a47870( starting_anim, 1 );
        animnode anim_single_solo( civ, transition_anim );
    }
    else if ( is_equal( state, 4 ) )
    {
        civ.curstate = 3;
        transition_anim = function_fbd76024d6a47870( starting_anim, 3 );
        animnode anim_single_solo( civ, transition_anim );
    }
    else if ( is_equal( state, 7 ) )
    {
        civ.curstate = 6;
        transition_anim = function_fbd76024d6a47870( starting_anim, 6 );
        
        if ( isdefined( transition_anim ) )
        {
            animnode anim_single_solo( civ, transition_anim );
        }
    }
    else if ( utility::is_equal( state, 5 ) )
    {
        civ.curstate = 5;
        transition_anim = function_fbd76024d6a47870( starting_anim, 5 );
        
        if ( isdefined( transition_anim ) )
        {
            animnode anim_single_solo( civ, transition_anim );
        }
        
        state = 2;
    }
    
    state_anim = function_fbd76024d6a47870( starting_anim, state );
    animnode thread anim_loop_solo( civ, state_anim );
    civ.curstate = state;
    waitframe();
    
    if ( isai( civ ) && isalive( civ ) )
    {
        if ( state <= 4 )
        {
            civ enable_lookat();
            return;
        }
        
        civ stoplookat();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4297
// Size: 0x2b
function function_693d03525ad49ffc( targetentity )
{
    function_602de23a88754761();
    level.tracking_targets = array_add( level.tracking_targets, targetentity );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42ca
// Size: 0x2b
function function_f9dcadb2db9f2781( targetentity )
{
    function_602de23a88754761();
    level.tracking_targets = array_remove( level.tracking_targets, targetentity );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42fd
// Size: 0x13
function function_733e573493a9ef16()
{
    level.tracking_targets = undefined;
    function_602de23a88754761();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4318
// Size: 0xaf
function function_25b67057c0f2b89b( targetarray )
{
    closesttarget = targetarray[ 0 ];
    closestdistance = -1;
    
    foreach ( target in targetarray )
    {
        if ( isdefined( target ) )
        {
            targetdistance = distancesquared( self.origin, target.origin );
            
            if ( closestdistance < 0 || targetdistance < closestdistance )
            {
                closestdistance = targetdistance;
                closesttarget = target;
            }
        }
    }
    
    return closesttarget.origin;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43d0
// Size: 0xb1
function function_d41d018414fca105( targetarray )
{
    if ( !isdefined( level.var_fe2285eb3c953b79 ) || !isdefined( level.var_c459b6972f6c6380 ) || level.var_c459b6972f6c6380 <= 0 )
    {
        assertmsg( "Attempted to use get_closest_tracking_target_with_priority without setting level.tracking_priority_entity and/or level.tracking_priority_entity_radius ( with a value above 0 )" );
        return level.player.origin;
    }
    
    var_4fe4da608dea7c5b = distancesquared( self.origin, level.var_fe2285eb3c953b79.origin );
    
    if ( var_4fe4da608dea7c5b <= level.var_c459b6972f6c6380 )
    {
        return level.var_fe2285eb3c953b79.origin;
    }
    
    return function_25b67057c0f2b89b( targetarray );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4489
// Size: 0x1e
function function_c6f77bd43877c9c6( targetarray )
{
    return level.player.origin;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x44b0
// Size: 0x3a
function private function_602de23a88754761()
{
    if ( !isdefined( level.tracking_targets ) )
    {
        level.tracking_targets = [];
        level.tracking_targets = array_add( level.tracking_targets, level.player );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x44f2
// Size: 0x8b
function private function_11461c82ae478f8a()
{
    function_602de23a88754761();
    
    if ( isdefined( self.var_87b3e310a36b0f7d ) )
    {
        return self.var_87b3e310a36b0f7d.origin;
    }
    
    if ( isdefined( self.var_47d42a0c7d19c938 ) )
    {
        return [[ self.var_47d42a0c7d19c938 ]]( level.tracking_targets );
    }
    
    if ( isdefined( level.var_47d42a0c7d19c938 ) )
    {
        return [[ level.var_47d42a0c7d19c938 ]]( level.tracking_targets );
    }
    
    return level.player.origin;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4585
// Size: 0x26
function private function_d47d250d79b7975f( var_b9b0654d37d30f11, var_1c8d96beb843e7b1, var_792db042affa13d )
{
    function_aa40a6d42ee9dd39( var_b9b0654d37d30f11, var_1c8d96beb843e7b1, var_792db042affa13d, 0 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x45b3
// Size: 0x28
function private function_e42447fbc054d453( var_b9b0654d37d30f11, var_1c8d96beb843e7b1, var_792db042affa13d )
{
    function_aa40a6d42ee9dd39( var_b9b0654d37d30f11, var_1c8d96beb843e7b1, var_792db042affa13d, 360 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x45e3
// Size: 0x240
function private function_aa40a6d42ee9dd39( var_b9b0654d37d30f11, var_1c8d96beb843e7b1, var_792db042affa13d, rotationoffset )
{
    self.animnode endon( "stop_loop" );
    var_3057d921cdb189e8 = 0;
    var_aca99d6e23e8de95 = 0;
    var_4197014e580fc93c = gettime();
    var_71766f8f82b20561 = var_792db042affa13d[ 0 ];
    self setanimlimited( var_1c8d96beb843e7b1, 0 );
    self setanimlimited( var_71766f8f82b20561, 1, 0, 0 );
    
    if ( !isdefined( self.var_f72317aa54b389c6 ) )
    {
        self.var_f72317aa54b389c6 = 0;
    }
    
    while ( true )
    {
        dt = gettime() - var_4197014e580fc93c;
        var_d1ceb2434569f84e = dt / 1000;
        var_d94197c8ffe4e9bb = function_11461c82ae478f8a();
        var_1a9c293ad162288 = flat_origin( self.origin );
        var_965456bd5df29265 = flat_origin( var_d94197c8ffe4e9bb );
        dirtotarget = var_1a9c293ad162288 - var_965456bd5df29265;
        var_5189a13207464f7b = generateaxisanglesfromforwardvector( dirtotarget, ( 0, 0, 0 ) );
        
        if ( rotationoffset != 0 )
        {
            var_b38f9f63c4ae4218 = rotationoffset - var_5189a13207464f7b[ 1 ];
        }
        else
        {
            var_b38f9f63c4ae4218 = var_5189a13207464f7b[ 1 ];
        }
        
        var_c1634c1b0c46570c = clamp( var_b38f9f63c4ae4218, 15, 345 );
        var_31625b97e5869e96 = ( var_c1634c1b0c46570c - 15 ) / 330;
        angledifference = var_31625b97e5869e96 - self.var_f72317aa54b389c6;
        
        if ( angledifference > 0.00277778 || angledifference < -0.00277778 )
        {
            var_aca99d6e23e8de95 = self.var_f72317aa54b389c6 + angledifference * var_d1ceb2434569f84e * 0.6;
            self.var_f72317aa54b389c6 = var_aca99d6e23e8de95;
        }
        
        var_3057d921cdb189e8 += var_d1ceb2434569f84e * 0.25;
        var_3057d921cdb189e8 = clamp( var_3057d921cdb189e8, 0, 1 );
        self setanimlimited( var_71766f8f82b20561, 1, 0, 0 );
        self setanimlimited( var_1c8d96beb843e7b1, var_3057d921cdb189e8 );
        self setanimtime( var_71766f8f82b20561, self.var_f72317aa54b389c6 );
        var_4197014e580fc93c = gettime();
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x482b
// Size: 0xd27
function function_fbd76024d6a47870( starting_anim, state )
{
    if ( !isdefined( level.var_a3ecd9469cde6f42 ) )
    {
        var_f509e1f67170bf4e = [ "jup_hij_idle_01_civ_01", "jup_hij_idle_01_to_alert_01_civ_01", "jup_hij_alert_01_civ_01", "jup_hij_alert_to_recoil_right_civ01", "jup_hij_recoil_idle_right_civ01", "jup_hij_recoil_to_alert_right_civ01", "jup_hij_alert_01_to_panic_01_civ_01", "jup_hij_panic_01_civ_01" ];
        var_f509e0f67170bd1b = [ "jup_hij_idle_01_civ_02", "jup_hij_idle_01_to_alert_01_civ_02", "jup_hij_alert_01_civ_02", "jup_hij_alert_to_recoil_right_civ01", "jup_hij_recoil_idle_right_civ01", "jup_hij_recoil_to_alert_right_civ01", "jup_hij_alert_01_to_panic_01_civ_02", "jup_hij_panic_01_civ_02" ];
        var_6320b1842f6bcfad = [ "jup_hij_idle_02_civ01", "jup_hij_idle_to_alert_02_civ01", "jup_hij_alert_02_civ01", "jup_hij_alert_to_panic_02_civ01", "jup_hij_panic_02_civ01" ];
        var_6320ae842f6bc914 = [ "jup_hij_idle_02_civ02", "jup_hij_idle_to_alert_02_civ02", "jup_hij_alert_02_civ02", "jup_hij_alert_to_panic_02_civ02", "jup_hij_panic_02_civ02" ];
        var_4475ff9173dcb3b4 = [ "jup_hij_idle_03_handhold_civ_01", "jup_hij_idle_handhold_03_to_alert_03_civ_01", "jup_hij_alert_03_civ_01", "jup_hij_alert_03_to_panic_03_civ_01", "jup_hij_panic_03_civ_01" ];
        var_4476029173dcba4d = [ "jup_hij_idle_03_handhold_civ_02", "jup_hij_idle_handhold_03_to_alert_03_civ_02", "jup_hij_alert_03_civ_02", "jup_hij_alert_03_to_panic_03_civ_02", "jup_hij_panic_03_civ_02" ];
        var_4476019173dcb81a = [ "jup_hij_idle_03_civ_01", "jup_hij_idle_handhold_03_to_alert_03_civ_01", "jup_hij_alert_03_civ_01", "jup_hij_alert_03_to_panic_03_civ_01", "jup_hij_panic_03_civ_01" ];
        var_4475fc9173dcad1b = [ "jup_hij_idle_03_civ_02", "jup_hij_idle_handhold_03_to_alert_03_civ_02", "jup_hij_alert_03_civ_02", "jup_hij_alert_03_to_panic_03_civ_02", "jup_hij_panic_03_civ_02" ];
        var_33da088527f0a68b = [ "jup_hij_idle_04_civ_01", "jup_hij_idle_04_to_alert_04_civ_01", "jup_hij_alert_04_civ_01", "jup_hij_alert_04_to_panic_04_civ_01", "jup_hij_panic_04_civ_01" ];
        var_33da098527f0a8be = [ "jup_hij_idle_04_civ_02", "jup_hij_idle_04_to_alert_04_civ_02", "jup_hij_alert_04_civ_02", "jup_hij_alert_04_to_panic_04_civ_02", "jup_hij_panic_04_civ_02" ];
        var_94f703d6bb8b14b2 = [ "jup_hij_smartphone_02_idle_civ01", "jup_hij_smartphone_02_transition_civ01", "jup_hij_smartphone_02_recording_civ01", "jup_hij_alert_04_to_panic_04_civ_01", "jup_hij_panic_04_civ_01" ];
        var_94f702d6bb8b127f = [ "jup_hij_smartphone_02_idle_civ02", "jup_hij_smartphone_02_transition_civ02", "jup_hij_smartphone_02_recording_civ02", "jup_hij_smartphone_recording_to_recoil_civ01", "jup_hij_smartphone_recoil_idle_civ01", "jup_hij_smartphone_recoil_to_recording_civ01" ];
        var_94f701d6bb8b104c = [ "jup_hij_smartphone_02_idle_civ03", "jup_hij_smartphone_02_transition_civ03", "jup_hij_smartphone_02_recording_civ03", "jup_hij_smartphone_recording_to_recoil_civ01", "jup_hij_smartphone_recoil_idle_civ01", "jup_hij_smartphone_recoil_to_recording_civ01" ];
        var_9b4121fcef1a94a1 = [ "jup_hij_smartphone_03_idle_civ01", "jup_hij_smartphone_03_transition_civ01", "jup_hij_smartphone_03_record_civ01", "jup_hij_alert_04_to_panic_04_civ_02", "jup_hij_panic_04_civ_02" ];
        var_9b411efcef1a8e08 = [ "jup_hij_smartphone_03_idle_civ02", "jup_hij_smartphone_03_transition_civ02", "jup_hij_smartphone_03_record_civ02", "jup_hij_alert_04_to_panic_04_civ_02", "jup_hij_panic_04_civ_02" ];
        var_9b411ffcef1a903b = [ "jup_hij_smartphone_03_idle_civ03", "jup_hij_smartphone_03_transition_civ03", "jup_hij_smartphone_03_record_civ03", "jup_hij_alert_04_to_panic_04_civ_02", "jup_hij_panic_04_civ_02" ];
        var_5f93f3e3d73dedc8 = [ "jup_hij_smartphone_06_idle_civ01", "jup_hij_smartphone_06_transition_civ01", "jup_hij_smartphone_06_record_civ01", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_left_idle_civ01", "jup_hij_recoil_to_alert_left_civ01" ];
        var_5f93f6e3d73df461 = [ "jup_hij_smartphone_06_idle_civ02", "jup_hij_smartphone_06_transition_civ02", "jup_hij_smartphone_06_record_civ02", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_left_idle_civ01", "jup_hij_recoil_to_alert_left_civ01" ];
        var_5f93f5e3d73df22e = [ "jup_hij_smartphone_06_idle_civ03", "jup_hij_smartphone_06_transition_civ03", "jup_hij_smartphone_06_record_civ03", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_left_idle_civ01", "jup_hij_recoil_to_alert_left_civ01" ];
        var_bdfa74525c9c6b7f = [ "jup_hij_smartphone_04_idle_civ01", "jup_hij_smartphone_04_transition_civ01", "jup_hij_smartphone_04_recording_civ01", "jup_hij_smartphone_recording_to_recoil_civ01", "jup_hij_smartphone_recoil_idle_civ01", "jup_hij_smartphone_recoil_to_recording_civ01", "jup_hij_alert_04_to_panic_04_civ_02", "jup_hij_panic_04_civ_02" ];
        var_bdfa75525c9c6db2 = [ "jup_hij_smartphone_04_idle_civ02", "jup_hij_smartphone_04_transition_civ02", "jup_hij_smartphone_04_recording_civ02", "jup_hij_smartphone_recording_to_recoil_civ01", "jup_hij_smartphone_recoil_idle_civ01", "jup_hij_smartphone_recoil_to_recording_civ01", "jup_hij_alert_04_to_panic_04_civ_02", "jup_hij_panic_04_civ_02" ];
        var_bdfa76525c9c6fe5 = [ "jup_hij_smartphone_04_idle_civ03", "jup_hij_smartphone_04_transition_civ03", "jup_hij_smartphone_04_recording_civ03", "jup_hij_alert_04_to_panic_04_civ_02", "jup_hij_panic_04_civ_02" ];
        var_737b10d48b02bc56 = [ "jup_hij_seated_large_left_idle_civ04", "jup_hij_seated_large_left_idle_to_react_civ04", "jup_hij_seated_large_left_react_loop_civ04", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_left_idle_civ01", "jup_hij_recoil_to_alert_left_civ01" ];
        var_737b0fd48b02ba23 = [ "jup_hij_seated_large_left_idle_civ05", "jup_hij_seated_large_left_idle_to_react_civ05", "jup_hij_seated_large_left_react_loop_civ05", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_left_idle_civ01", "jup_hij_recoil_to_alert_left_civ01" ];
        var_53161fb9125eeb38 = [ "jup_hij_idle_left_civ_01", "jup_hij_idle_to_alert_back_left_civ_01", "jup_hij_alert_idle_left_civ01", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_idle_left_civ01", "jup_hij_recoil_to_alert_left_civ01" ];
        var_3ce24d0c3cc11b3b = [ "jup_hij_idle_left_civ_02", "jup_hij_idle_to_alert_back_left_civ_02", "jup_hij_alert_idle_left_civ02", "jup_hij_alert_to_recoil_left_civ02", "jup_hij_recoil_idle_left_civ02", "jup_hij_recoil_to_alert_left_civ02" ];
        var_ae48d0082c8a5e9e = [ "jup_hij_idle_right_civ_01", "jup_hij_idle_to_alert_back_right_civ_01", "jup_hij_alert_idle_right_civ01", "jup_hij_alert_to_recoil_right_civ01", "jup_hij_recoil_idle_right_civ01", "jup_hij_recoil_to_alert_right_civ01" ];
        var_32df220966960631 = [ "jup_hij_idle_right_civ_02", "jup_hij_idle_to_alert_back_right_civ_02", "jup_hij_alert_idle_right_civ02", "jup_hij_alert_to_recoil_right_civ02", "jup_hij_recoil_idle_right_civ02", "jup_hij_recoil_to_alert_right_civ02" ];
        var_ee098fbd8d4a37b2 = [ "jup_hij_idle_window_01_civ_02", "jup_hij_window_01_idle_to_alert_01_civ_02", "jup_hij_alert_01_civ_01", "jup_hij_alert_01_to_panic_01_civ_01", "jup_hij_panic_01_civ_01" ];
        var_908a7836a4798c3e = [ "jup_hij_overhead_compartment_idle_civ01", "jup_hij_idle_01_to_alert_01_civ_02", "jup_hij_alert_01_civ_02", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_left_idle_civ01", "jup_hij_recoil_to_alert_left_civ01" ];
        var_b84bf13fb3d75cf9 = [ "jup_hij_overhead_compartment_idle_civ02", "jup_hij_idle_01_to_alert_01_civ_01", "jup_hij_alert_01_civ_01", "jup_hij_alert_01_to_panic_01_civ_01", "jup_hij_panic_01_civ_01" ];
        var_a589e8432ec0bf1c = [ "jup_hij_overhead_compartment_idle_civ03", "jup_hij_idle_to_alert_02_civ_01", "jup_hij_alert_02_civ_01", "jup_hij_alert_to_panic_02_civ_01", "jup_hij_panic_02_civ_01" ];
        var_97a4736c9f71c598 = [ "jup_hij_seated_large_left_idle_civ01", "jup_hij_idle_to_alert_back_left_civ_01", "jup_hij_alert_idle_left_civ01", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_idle_left_civ01", "jup_hij_recoil_to_alert_left_civ01", "jup_hij_alert_01_to_panic_01_civ_01", "jup_hij_panic_01_civ_01" ];
        var_2bb962347636aded = [ "jup_hij_seated_large_right_idle_civ01", "jup_hij_idle_to_alert_back_right_civ_01", "jup_hij_alert_idle_right_civ01", "jup_hij_alert_to_recoil_right_civ01", "jup_hij_recoil_idle_right_civ01", "jup_hij_recoil_to_alert_right_civ01", "jup_hij_alert_01_to_panic_01_civ_02", "jup_hij_panic_01_civ_02" ];
        var_97a4766c9f71cc31 = [ "jup_hij_seated_large_left_idle_civ02", "jup_hij_idle_to_alert_back_left_civ_02", "jup_hij_alert_idle_left_civ02", "jup_hij_alert_to_recoil_left_civ02", "jup_hij_recoil_idle_left_civ02", "jup_hij_recoil_to_alert_left_civ02", "jup_hij_alert_to_panic_02_civ01", "jup_hij_panic_02_civ01" ];
        var_2bb95f347636a754 = [ "jup_hij_seated_large_right_idle_civ02", "jup_hij_idle_to_alert_back_right_civ_02", "jup_hij_alert_idle_right_civ02", "jup_hij_alert_to_recoil_right_civ02", "jup_hij_recoil_idle_right_civ02", "jup_hij_recoil_to_alert_right_civ02", "jup_hij_alert_to_panic_02_civ02", "jup_hij_panic_02_civ02" ];
        var_97a4756c9f71c9fe = [ "jup_hij_seated_large_left_idle_civ03", "jup_hij_idle_to_alert_back_left_civ_01", "jup_hij_alert_idle_left_civ01", "jup_hij_alert_to_recoil_left_civ01", "jup_hij_recoil_idle_left_civ01", "jup_hij_recoil_to_alert_left_civ01", "jup_hij_alert_01_to_panic_01_civ_01", "jup_hij_panic_01_civ_01" ];
        var_2bb960347636a987 = [ "jup_hij_seated_large_right_idle_civ03", "jup_hij_idle_to_alert_back_right_civ_01", "jup_hij_alert_idle_right_civ01", "jup_hij_alert_to_recoil_right_civ01", "jup_hij_recoil_idle_right_civ01", "jup_hij_recoil_to_alert_right_civ01", "jup_hij_alert_01_to_panic_01_civ_02", "jup_hij_panic_01_civ_02" ];
        var_97a4786c9f71d097 = [ "jup_hij_seated_large_left_idle_civ04", "jup_hij_idle_to_alert_back_left_civ_02", "jup_hij_alert_idle_left_civ02", "jup_hij_alert_to_recoil_left_civ02", "jup_hij_recoil_idle_left_civ02", "jup_hij_recoil_to_alert_left_civ02", "jup_hij_alert_to_panic_02_civ01", "jup_hij_panic_02_civ01" ];
        var_2bb95d347636a2ee = [ "jup_hij_seated_large_right_idle_civ04", "jup_hij_idle_to_alert_back_right_civ_02", "jup_hij_alert_idle_right_civ02", "jup_hij_alert_to_recoil_right_civ02", "jup_hij_recoil_idle_right_civ02", "jup_hij_recoil_to_alert_right_civ02", "jup_hij_alert_to_panic_02_civ02", "jup_hij_panic_02_civ02" ];
        level.var_a3ecd9469cde6f42 = [ var_f509e1f67170bf4e, var_f509e0f67170bd1b, var_6320b1842f6bcfad, var_6320ae842f6bc914, var_4475ff9173dcb3b4, var_4476029173dcba4d, var_4476019173dcb81a, var_4475fc9173dcad1b, var_33da088527f0a68b, var_33da098527f0a8be, var_ee098fbd8d4a37b2, var_94f703d6bb8b14b2, var_94f702d6bb8b127f, var_94f701d6bb8b104c, var_9b4121fcef1a94a1, var_9b411efcef1a8e08, var_9b411ffcef1a903b, var_5f93f3e3d73dedc8, var_5f93f6e3d73df461, var_5f93f5e3d73df22e, var_bdfa74525c9c6b7f, var_bdfa75525c9c6db2, var_bdfa76525c9c6fe5, var_737b10d48b02bc56, var_737b0fd48b02ba23, var_53161fb9125eeb38, var_3ce24d0c3cc11b3b, var_ae48d0082c8a5e9e, var_32df220966960631, var_97a4736c9f71c598, var_2bb962347636aded, var_97a4766c9f71cc31, var_2bb95f347636a754, var_97a4756c9f71c9fe, var_2bb960347636a987, var_97a4786c9f71d097, var_2bb95d347636a2ee, var_908a7836a4798c3e, var_b84bf13fb3d75cf9, var_a589e8432ec0bf1c ];
        level.tracking_callbacks = [];
        level.tracking_callbacks[ "jup_hij_smartphone_02_recording_civ01" ] = &function_d47d250d79b7975f;
        level.tracking_callbacks[ "jup_hij_smartphone_02_recording_civ02" ] = &function_d47d250d79b7975f;
        level.tracking_callbacks[ "jup_hij_smartphone_02_recording_civ03" ] = &function_d47d250d79b7975f;
        level.tracking_callbacks[ "jup_hij_smartphone_03_record_civ01" ] = &function_e42447fbc054d453;
        level.tracking_callbacks[ "jup_hij_smartphone_03_record_civ02" ] = &function_e42447fbc054d453;
        level.tracking_callbacks[ "jup_hij_smartphone_03_record_civ03" ] = &function_e42447fbc054d453;
        level.tracking_callbacks[ "jup_hij_smartphone_04_recording_civ01" ] = &function_d47d250d79b7975f;
        level.tracking_callbacks[ "jup_hij_smartphone_04_recording_civ02" ] = &function_d47d250d79b7975f;
        level.tracking_callbacks[ "jup_hij_smartphone_04_recording_civ03" ] = &function_d47d250d79b7975f;
        level.tracking_callbacks[ "jup_hij_smartphone_06_record_civ01" ] = &function_e42447fbc054d453;
        level.tracking_callbacks[ "jup_hij_smartphone_06_record_civ02" ] = &function_e42447fbc054d453;
        level.tracking_callbacks[ "jup_hij_smartphone_06_record_civ03" ] = &function_e42447fbc054d453;
        level.tracking_callbacks[ "jup_hij_smartphone_recoil_idle_civ01" ] = &function_d47d250d79b7975f;
    }
    
    foreach ( var_369688ee361b5dff in level.var_a3ecd9469cde6f42 )
    {
        if ( is_equal( var_369688ee361b5dff[ 0 ], starting_anim ) )
        {
            return var_369688ee361b5dff[ state ];
        }
    }
    
    return undefined;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x555b
// Size: 0xe5
function function_384d78dd0b8f21da( paired_partner )
{
    if ( is_equal( "jup_hij_idle_03_civ_01", self.animnode.animation ) )
    {
        start_time = randomfloatrange( 20, 35 );
        wait start_time;
        
        if ( !flag( "passenger_transition_to_alert" ) )
        {
            self.animnode notify( "stop_loop" );
            self stopanimscripted();
            paired_partner notify( "stop_loop" );
            paired_partner.civ stopanimscripted();
            self.animnode thread anim_single_solo( self, "jup_hij_idle_03_to_idle_handhold_03_civ_01" );
            paired_partner anim_single_solo( paired_partner.civ, "jup_hij_idle_03_to_idle_handhold_03_civ_02" );
            self.animnode thread anim_loop_solo( self, "jup_hij_idle_03_handhold_civ_01" );
            paired_partner thread anim_loop_solo( paired_partner.civ, "jup_hij_idle_03_handhold_civ_02" );
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5648
// Size: 0x6e
function level_spawner( gender )
{
    spawner = level.civspawners[ gender + "_spawners" ][ level.var_cfc29cd454498f9e[ gender ] ];
    level.var_cfc29cd454498f9e[ gender ]++;
    
    if ( level.var_cfc29cd454498f9e[ gender ] >= level.civspawners[ gender + "_spawners" ].size )
    {
        level.var_cfc29cd454498f9e[ gender ] = 0;
    }
    
    return spawner;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56bf
// Size: 0x2a
function function_9e780d1193746f9e()
{
    self setanim( generic_human#proc_node, 1, 0 );
    self.anim_getrootfunc = &namespace_3123a12d1da4993::set_root;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56f1
// Size: 0x19
function enable_lookat()
{
    self function_f51ff412609193b9( 1, "script" );
    self function_c6a5eda5ddec35cc( 1 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5712
// Size: 0x1f0
function function_aa07d9f9a1f53ec0( animnode, animname, spawner, index, gender )
{
    if ( !isdefined( level.var_24c48e6936b30519 ) )
    {
        level.var_24c48e6936b30519 = 0;
    }
    
    if ( level.var_24c48e6936b30519 > 34 || isdefined( animnode.script_offhands ) && animnode.script_offhands.size > 0 )
    {
        civ = fakeactorspawn( spawner );
        
        if ( isdefined( animnode.animation ) && array_contains( level.var_4b008acd8d4972c5, animnode.animation ) )
        {
            civ.var_2fdbdaf623328172 = 1;
        }
    }
    else
    {
        civ = spawner stalingradspawn( 1, spawner.targetname, 1 );
        level.var_24c48e6936b30519++;
        civ.ignoreall = 1;
        civ.ignoreme = 1;
        civ.dontevershoot = 1;
        civ.dontattackme = 1;
        civ.dontavoidplayer = 1;
        civ function_65502ee2f2b28d07();
        civ pausepath( 0 );
        civ function_e8971dd45d6d700c( 0 );
        civ function_b661b022700ba72f( "script", 1 );
        civ function_9e8aba535d998963();
        civ thread function_382c9c7dbf0a67e9();
    }
    
    civ endon( "death" );
    civ.spawner = spawner;
    civ.gender = spawner.script_noteworthy;
    civ.var_e0676499119d450b = 1;
    civ.fakeactor_face_anim = 1;
    
    if ( isdefined( animname ) )
    {
        civ.animname = animname;
    }
    else
    {
        civ.animname = "generic";
    }
    
    if ( isdefined( animnode ) )
    {
        civ.animnode = animnode;
    }
    else
    {
        civ.animnode = self;
    }
    
    return civ;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x590b
// Size: 0x4f
function function_90751bbbdd7f9aeb( body, head )
{
    if ( isdefined( body ) )
    {
        self setmodel( body );
    }
    
    if ( isdefined( head ) )
    {
        self detach( self.headmodel );
        self.headmodel = head;
        self attach( self.headmodel );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5962
// Size: 0x6c
function fakeactor_spawn( expendable )
{
    expendable = default_to( expendable, 0 );
    level notify( "new_fakeactor" );
    self.script_forcespawn = undefined;
    self.var_a328fea8cfacdcec = 1;
    self function_fc803f63f14ba95e( 0 );
    self hide();
    delaycall( 0.05, &show );
    self setcandamage( 1 );
    self.health = 1;
    thread function_10eab2a711b5c320();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59d6
// Size: 0x2c
function function_3da114b1569afef( location )
{
    level.recent_deaths = array_add( level.recent_deaths, location );
    thread function_8702a3d357872ddf();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a0a
// Size: 0x21
function function_8702a3d357872ddf()
{
    wait 0.5;
    level.recent_deaths = array_remove_index( level.recent_deaths, 0 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a33
// Size: 0x108
function function_382c9c7dbf0a67e9( var_b8c7444c4543fe5f )
{
    level endon( "flashbang_done" );
    flag_wait( "flag_intro_complete" );
    self.health = 1000;
    
    while ( !istrue( level.player.gun_taken ) )
    {
        wait 0.5;
    }
    
    while ( isalive( self ) )
    {
        self waittill( "damage", amount, attacker, direction_vec, point, type );
        
        if ( attacker == level.player )
        {
            scripts\sp\friendlyfire::missionfail( 1 );
            
            if ( istrue( var_b8c7444c4543fe5f ) )
            {
                animnode = self.animnode;
                animnode notify( "stop_loop" );
            }
            
            self notify( "passenger_shot" );
            self stoplookat();
            waitframe();
            function_3da114b1569afef( self.origin );
            self function_e8971dd45d6d700c( 1 );
            scripts\sp\anim::function_ce450b9957138bd5();
            wait 1;
            self kill();
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b43
// Size: 0x86
function function_38497ef67aae58c8( actors )
{
    foreach ( actor in actors )
    {
        if ( isdefined( actor.entity ) && isalive( actor.entity ) )
        {
            actor.entity.dropweapon = 0;
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bd1
// Size: 0x19d
function function_10eab2a711b5c320()
{
    self endon( "entitydeleted" );
    level endon( "flashbang_done" );
    flag_wait( "flag_intro_complete" );
    
    while ( !istrue( level.player.gun_taken ) )
    {
        wait 0.5;
    }
    
    while ( isalive( self ) )
    {
        self waittill( "damage", amount, attacker, direction_vec, point, type );
        
        if ( attacker == level.player )
        {
            scripts\sp\friendlyfire::missionfail( 1 );
            self.last_damage_type = type;
            self.lastattacker = attacker;
            
            if ( isdefined( attacker ) && isplayer( attacker ) )
            {
                attacker setclientomnvar( "damage_feedback_notify", gettime() );
            }
            
            self notify( "passenger_shot" );
            var_bcf7d6e19b4b5f12 = [ "jup_hij_death_pose_civ01", "jup_hij_death_pose_civ02", "jup_hij_death_pose_civ03", "jup_hij_death_pose_civ04", "jup_hij_death_pose_civ05", "jup_hij_death_pose_civ06", "jup_hij_death_pose_civ07", "jup_hij_death_pose_civ08", "jup_hij_death_pose_civ09" ];
            var_88178c3bf5845b1c = random( var_bcf7d6e19b4b5f12 );
            animnode = self.animnode;
            animnode notify( "stop_loop" );
            self stopanimscripted();
            waitframe();
            function_3da114b1569afef( self.origin );
            self notify( "death" );
            waitframe();
            animnode anim_single_solo( self, var_88178c3bf5845b1c );
            waitframe();
            scripts\sp\anim::function_ce450b9957138bd5();
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d76
// Size: 0x3b
function function_ae12c21bcfcdd83f()
{
    level.player endon( "death" );
    
    while ( true )
    {
        if ( isdefined( level.player ) && level.player istouching( self ) )
        {
            return;
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5db9
// Size: 0x5a
function function_7d89f98164b6df3d( viewmodel, legmodel, shadowmodel )
{
    if ( isdefined( viewmodel ) )
    {
        level.player setviewmodel( viewmodel );
    }
    
    if ( isdefined( legmodel ) )
    {
        level.player setlegsmodel( legmodel );
    }
    
    if ( isdefined( shadowmodel ) )
    {
        level.player setshadowmodel( shadowmodel );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5e1b
// Size: 0x4f
function function_587b8e0d4e4090f4( npc, animnode, animname )
{
    if ( !isdefined( npc ) )
    {
        return;
    }
    
    animnode anim_single_solo( npc, animname );
    
    if ( !isdefined( npc.animnode.script_linkname ) )
    {
        npc thread transition_to_alert( 1 );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e72
// Size: 0x3b
function function_1734e4f3a27d192f()
{
    level endon( "flashbang_done" );
    flags = [ "stewardess_sees_gun", "neighbor_takedown" ];
    function_5adca43f839a3cce( flags );
    flag_set( "passenger_transition_to_alert" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5eb5
// Size: 0x47
function function_2b76b679c7d68922()
{
    level endon( "flashbang_done" );
    flags = [ "standoff_canceled", "standoff_first_shot_fired" ];
    function_5adca43f839a3cce( flags );
    level.var_35dc8163678b4227 = 1;
    waitframe();
    flag_set( "passenger_transition_to_alert" );
}

/#

    // Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5f04
    // Size: 0x5, Type: dev
    function function_d7f8f6ca8e87874f()
    {
        
    }

#/

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f11
// Size: 0x10e
function function_db7cf901994d45d0()
{
    level endon( "stewardess_death" );
    flag_wait_either( "design_flag_spawn_stewardess", "flag_spawn_civ_checkpoint" );
    spawner = getspawner( "civ_to_shoot", "targetname" );
    level.stewardess = spawner spawn_ai( 1 );
    level.stewardess.health = 100000;
    level.stewardess.pushable = 0;
    level.stewardess.script_pushable = 0;
    level.stewardess.ignorerandombulletdamage = 1;
    thread function_2ea419e0536f6d12( level.stewardess );
    level.stewardess waittill( "damage", amount, attacker, direction_vec, point, type );
    
    if ( attacker == level.player )
    {
        scripts\sp\friendlyfire::missionfail( 1 );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6027
// Size: 0xa7
function stewardess_death()
{
    node = spawnstruct();
    node.origin = self.origin;
    node.angles = self.angles;
    stewardess = get_object( "civ_to_shoot" );
    level waittill( "stewardess_death" );
    
    if ( isdefined( stewardess ) )
    {
        stewardess.functable[ "shotObjectStopAnim" ] = undefined;
        stewardess.var_41dc93404af773a3 = undefined;
    }
    
    node anim_single_solo( level.stewardess, "jup_hij_0200_standoff_stewardess_01_death" );
    node anim_last_frame_solo( level.stewardess, "jup_hij_0200_standoff_stewardess_01_death" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60d6
// Size: 0x56
function function_46a7af93f6a23ac3()
{
    if ( !isdefined( self ) && is_dead_or_dying( self ) )
    {
        return;
    }
    
    if ( flag( "stewardess_death" ) )
    {
        return;
    }
    
    self function_b661b022700ba72f( "script", 1 );
    self function_d5cda8a759cc36bc( "cower" );
    self function_b661b022700ba72f( "only_reactions", 1 );
    self.health = 10;
}

/#

    // Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6134
    // Size: 0x5, Type: dev
    function function_7d501d4bd01286f7()
    {
        
    }

#/

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6141
// Size: 0x19c
function function_67758dee03bded8b()
{
    self endon( "death" );
    level endon( "neighbor_takedown" );
    level endon( "hijackers_end" );
    level endon( "flag_hero_rusher_start" );
    level.player thread shove_spline( "shove_spline" );
    level.var_6d3b1ff57ed455b9 = -1;
    
    while ( true )
    {
        if ( function_b95cde2adc07d968( self, level.player, 50 ) )
        {
            /#
                if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
                {
                    notification = "<dev string:x22>";
                    self notify( notification );
                    thread draw_circle_until_notify( self.origin, 50, 0, 1, 0, self, notification );
                }
            #/
            
            selfforward = anglestoforward( self.angles );
            offset = selfforward * 50;
            var_518c88fe42a7c320 = self.origin + offset;
            angles = vectortoangles( level.player.origin - var_518c88fe42a7c320 );
            forward = anglestoforward( angles );
            dot = vectordot( forward, selfforward );
            
            if ( dot < 0 )
            {
                result = function_469c45272a910658( var_518c88fe42a7c320 );
                
                if ( result )
                {
                    flag_waitopen( "hijack_shove_active" );
                }
                else
                {
                    flag_wait( "hijack_shove_enabled" );
                }
            }
        }
        else
        {
            /#
                if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
                {
                    notification = "<dev string:x22>";
                    self notify( notification );
                    thread draw_circle_until_notify( self.origin, 50, 1, 0, 0, self, notification );
                }
            #/
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62e5
// Size: 0x499
function shove_spline( targetname )
{
    self endon( "death" );
    level endon( "hijackers_end" );
    
    if ( isdefined( self.var_ce8de5f635cfa2ab ) )
    {
        return;
    }
    
    var_e47012497d2a870c = getstruct( targetname, "targetname" );
    var_d10812c3cf2eedd5 = undefined;
    
    for (currentnode = var_e47012497d2a870c; isdefined( currentnode ); currentnode = undefined) {
        if ( isdefined( currentnode.target ) )
        {
            nextnode = getstruct( currentnode.target, "targetname" );
            currentnode.nextnode = nextnode;
            nextnode.prevnode = currentnode;
            
            /#
                if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
                {
                    if ( isplayer( self ) )
                    {
                        r = 1;
                        g = 1;
                        b = 0;
                    }
                    else
                    {
                        r = 1;
                        g = 0.25;
                        b = 0;
                    }
                    
                    thread draw_line_until_notify( currentnode.origin + ( 0, 0, 30 ), nextnode.origin + ( 0, 0, 30 ), r, g, b, level, "<dev string:x32>" );
                }
            #/
            
            currentnode = nextnode;
            continue;
        }
        
        var_d10812c3cf2eedd5 = currentnode;
    }
    
    spline = spawnstruct();
    spline.currentnode = var_e47012497d2a870c;
    spline.nextnode = var_e47012497d2a870c.nextnode;
    spline.startnode = var_e47012497d2a870c;
    spline.endnode = var_d10812c3cf2eedd5;
    self.var_ce8de5f635cfa2ab = spline;
    
    /#
    #/
    
    var_2ac35ea45761aebb = undefined;
    starttime = gettime();
    
    while ( true )
    {
        if ( isplayer( self ) && self islinked() )
        {
            waitframe();
            continue;
        }
        
        currentnode = spline.currentnode;
        nextnode = spline.nextnode;
        
        if ( !isdefined( nextnode ) )
        {
            break;
        }
        
        var_42d0d4ffa62ce4ce = vectortoangles( currentnode.origin - nextnode.origin );
        
        /#
            if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
            {
                thread draw_line_for_time( nextnode.origin + ( 0, 0, 30 ) + anglestoleft( var_42d0d4ffa62ce4ce ) * 1000, nextnode.origin + ( 0, 0, 30 ) + anglestoright( var_42d0d4ffa62ce4ce ) * 1000, 1, 1, 1, 0.05 );
            }
        #/
        
        if ( !within_fov( nextnode.origin, var_42d0d4ffa62ce4ce, self.origin, 0 ) )
        {
            /#
                if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
                {
                    normal = vectornormalize( self.origin - nextnode.origin );
                    forward = anglestoforward( var_42d0d4ffa62ce4ce );
                    dot = vectordot( forward, normal );
                    print3d( nextnode.origin + ( 0, 0, 30 ), dot, ( 1, 1, 1 ), 1, 0.3, 200 );
                    thread draw_line_for_time( nextnode.origin + ( 0, 0, 30 ), nextnode.origin + ( 0, 0, 30 ) + anglestoforward( var_42d0d4ffa62ce4ce ) * 1000, 0, 1, 0, 10 );
                    thread draw_line_for_time( nextnode.origin + ( 0, 0, 30 ), self.origin + ( 0, 0, 30 ), 1, 0, 0, 10 );
                }
            #/
            
            var_7c5c8d7b472bdcf4 = 0;
            
            if ( isdefined( var_2ac35ea45761aebb ) && within_fov( currentnode.origin, var_2ac35ea45761aebb, self.origin, 0 ) )
            {
                prevnode = currentnode.prevnode;
                
                if ( isdefined( prevnode ) )
                {
                    spline.currentnode = prevnode;
                    spline.nextnode = currentnode;
                    var_42d0d4ffa62ce4ce = var_2ac35ea45761aebb;
                    var_7c5c8d7b472bdcf4 = 1;
                }
            }
            
            if ( !var_7c5c8d7b472bdcf4 )
            {
                spline.currentnode = nextnode;
                
                while ( true )
                {
                    spline.nextnode = spline.currentnode.nextnode;
                    break;
                }
            }
            
            var_2ac35ea45761aebb = var_42d0d4ffa62ce4ce;
            waitframe();
            continue;
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6786
// Size: 0x394, Type: bool
function function_469c45272a910658( var_518c88fe42a7c320 )
{
    level endon( "hijackers_end" );
    notification = "new_draw_shove";
    self notify( notification );
    
    if ( !flag( "hijack_shove_enabled" ) )
    {
        /#
            if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
            {
                thread function_ccc9189861847214( self.origin + ( 0, 0, 75 ), "<dev string:x38>", ( 1, 0, 0 ), 1, notification );
            }
        #/
        
        return false;
    }
    
    if ( flag( "hijack_shove_active" ) )
    {
        /#
            if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
            {
                thread function_ccc9189861847214( self.origin + ( 0, 0, 75 ), "<dev string:x41>", ( 1, 1, 0 ), 1, notification );
            }
        #/
        
        return false;
    }
    
    if ( level.player islinked() )
    {
        /#
            if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
            {
                thread function_ccc9189861847214( self.origin + ( 0, 0, 75 ), "<dev string:x48>", ( 1, 0, 0 ), 1, notification );
            }
        #/
        
        return false;
    }
    
    currentnode = level.player.var_ce8de5f635cfa2ab.currentnode;
    nextnode = level.player.var_ce8de5f635cfa2ab.nextnode;
    var_4dfdc410f588cefe = 50;
    var_d1ca53724c220d5d = vectornormalize( nextnode.origin - currentnode.origin ) * var_4dfdc410f588cefe;
    var_234ccb54fd00cf6a = -1 * vectorfromlinetopoint( currentnode.origin, nextnode.origin, level.player.origin );
    var_4ad2d8b076d17a8b = level.player.origin + var_234ccb54fd00cf6a + var_d1ca53724c220d5d;
    var_b4cb39e172d7bae = vectortoangles( nextnode.origin - currentnode.origin );
    
    while ( true )
    {
        var_b4cb39e172d7bae = vectortoangles( nextnode.origin - currentnode.origin );
        var_42d0d4ffa62ce4ce = vectortoangles( currentnode.origin - nextnode.origin );
        
        if ( within_fov( nextnode.origin, var_42d0d4ffa62ce4ce, var_4ad2d8b076d17a8b, 0 ) )
        {
            break;
        }
        
        currentnode = nextnode;
        nextnode = currentnode.nextnode;
        
        if ( !isdefined( nextnode ) )
        {
            break;
        }
        
        var_4ad2d8b076d17a8b -= vectorfromlinetopoint( currentnode.origin, nextnode.origin, var_4ad2d8b076d17a8b );
    }
    
    /#
        if ( getdvarint( @"hash_7d45d3f1782561cf" ) )
        {
            thread draw_line_for_time( level.player.origin + ( 0, 0, 30 ), level.player.origin + var_234ccb54fd00cf6a + ( 0, 0, 30 ), 0, 0, 1, 10 );
            thread draw_line_for_time( level.player.origin + ( 0, 0, 30 ), var_4ad2d8b076d17a8b + ( 0, 0, 30 ), 1, 0, 1, 10 );
        }
    #/
    
    thread function_7a9b07e72d8214e( var_518c88fe42a7c320, var_4ad2d8b076d17a8b, var_b4cb39e172d7bae );
    return true;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6b23
// Size: 0x6e
function function_7a9b07e72d8214e( var_518c88fe42a7c320, var_4ad2d8b076d17a8b, var_b4cb39e172d7bae )
{
    level endon( "hijackers_end" );
    flag_set( "hijack_shove_active" );
    anime = "push_front";
    delaythread( 0.3, &player_shoved, var_518c88fe42a7c320, var_4ad2d8b076d17a8b, var_b4cb39e172d7bae );
    level.player waittill( "shove_done" );
    flag_clear( "hijack_shove_active" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6b99
// Size: 0x124
function player_shoved( sourcepos, targetpos, targetangles, var_d0613ca1d9a8ae36 )
{
    level endon( "hijackers_end" );
    
    if ( !isdefined( var_d0613ca1d9a8ae36 ) )
    {
        var_d0613ca1d9a8ae36 = 0.4;
    }
    
    mover = level.player spawn_script_origin();
    function_6c677bfd559ec633( sourcepos, var_d0613ca1d9a8ae36, 1 );
    level.player playerlinktodelta( mover, undefined, var_d0613ca1d9a8ae36, 50, 70, 50, 50 );
    level thread function_d0551eaf85c0e266( vectortoangles( targetpos - level.player.origin ) );
    level.player playerlinktodelta( mover, undefined, 0, 90, 90, 90, 90, 1 );
    level.player lerpviewangleclamp( 0.3, 0, 0.2, 5, 5, 10, 10 );
    mover move_and_rotate_to( 0.5, targetpos, targetangles, 1, 0.1, 0.3 );
    
    if ( !isdefined( level.player_rig ) )
    {
        level.player unlink();
    }
    
    mover delete();
    level.player notify( "shove_done" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6cc5
// Size: 0x7c
function function_6c677bfd559ec633( sourcepos, var_d0613ca1d9a8ae36, var_b78ee32baaa3c23b )
{
    level endon( "hijackers_end" );
    level.player scripts\sp\player::radial_distortion( 0.05, 0.05, var_d0613ca1d9a8ae36 );
    earthquake( 0.5, 0.3, sourcepos, 100 );
    
    if ( istrue( var_b78ee32baaa3c23b ) )
    {
        level.player viewkick( 8, sourcepos, 0 );
    }
    
    level.player playrumbleonentity( "light_1s" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d49
// Size: 0x22
function function_d0551eaf85c0e266( angles )
{
    level endon( "hijackers_end" );
    wait 0.25;
    
    if ( function_f303bff968cdb8d8( angles ) )
    {
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d73
// Size: 0x1cb, Type: bool
function function_f303bff968cdb8d8( angles )
{
    level endon( "hijackers_end" );
    var_6d95dec01d52e89b = anglestoforward( angles ) * ( 20 + length( level.player getvelocity() ) );
    
    if ( level.player getnormalizedcameramovement()[ 1 ] > 0.2 )
    {
        var_7c6826a6aa25007c = anglestoright( angles ) * ( 20 + length( level.player getvelocity() ) );
        
        if ( !ray_trace_passed( level.player.origin + ( 0, 0, 32 ), level.player.origin + ( 0, 0, 32 ) + var_7c6826a6aa25007c, level.player ) )
        {
            return false;
        }
    }
    else if ( level.player getnormalizedcameramovement()[ 1 ] < -0.2 )
    {
        var_67feffd3d2c927b1 = anglestoleft( angles ) * ( 20 + length( level.player getvelocity() ) );
        
        if ( !ray_trace_passed( level.player.origin + ( 0, 0, 32 ), level.player.origin + ( 0, 0, 32 ) + var_67feffd3d2c927b1, level.player ) )
        {
            return false;
        }
    }
    
    if ( !ray_trace_passed( level.player.origin + ( 0, 0, 32 ), level.player.origin + ( 0, 0, 32 ) + var_6d95dec01d52e89b, level.player ) )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x6f47
// Size: 0x74
function move_and_rotate_to( time, origin, angles, shouldwait, accel, decel )
{
    level endon( "hijackers_end" );
    
    if ( !isdefined( accel ) )
    {
        accel = 0;
    }
    
    if ( !isdefined( decel ) )
    {
        decel = 0;
    }
    
    if ( !isdefined( shouldwait ) )
    {
        shouldwait = 1;
    }
    
    self moveto( origin, time, accel, decel );
    
    if ( isdefined( angles ) )
    {
        self rotateto( angles, time, accel, decel );
    }
    
    if ( shouldwait )
    {
        wait time;
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6fc3
// Size: 0x3b, Type: bool
function within_dist( start, end, dist )
{
    level endon( "hijackers_end" );
    
    if ( !isdefined( start ) || !isdefined( end ) )
    {
        return false;
    }
    
    return distancesquared( start, end ) <= dist * dist;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7007
// Size: 0x3f, Type: bool
function function_b95cde2adc07d968( ent1, ent2, dist )
{
    level endon( "hijackers_end" );
    return within_dist( ent1.origin, ent2.origin, dist );
}

/#

    // Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x704f
    // Size: 0x5, Type: dev
    function function_f079872c1a36b31b()
    {
        
    }

#/

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x705c
// Size: 0x35
function function_d90ecafe1cffe760()
{
    blocker = getent( "temp_am_blocker", "targetname" );
    waitframe();
    flag_wait( "flag_air_marshals_spawned" );
    
    if ( isdefined( blocker ) )
    {
        blocker hide();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7099
// Size: 0x40
function function_1f51580c2472a5c8()
{
    business_class_blocker = getent( "business_class_blocker", "targetname" );
    
    if ( isdefined( business_class_blocker ) )
    {
        business_class_blocker hide();
    }
    
    flag_wait( "flag_block_business_class" );
    
    if ( isdefined( business_class_blocker ) )
    {
        business_class_blocker show();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70e1
// Size: 0xdb
function function_3f41cb77e2785636( bool )
{
    if ( !bool )
    {
        val::set( "earpiece_allow", "crouch", 0 );
        val::set( "earpiece_allow", "prone", 0 );
        val::set( "earpiece_allow", "offhand_weapons", 0 );
        val::set( "earpiece_allow", "allow_jump", 0 );
        val::set( "earpiece_allow", "sprint", 0 );
        val::set( "earpiece_allow", "weapon_switch", 0 );
        val::set( "earpiece_allow", "melee", 0 );
        val::set( "earpiece_allow", "mantle", 0 );
        val::set( "earpiece_allow", "reload", 0 );
        
        if ( !function_4a691d90212e9398() )
        {
            val::set( "earpiece_allow", "fire", 0 );
        }
        
        return;
    }
    
    val::reset_all( "earpiece_allow" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x71c4
// Size: 0x14, Type: bool
function function_4a691d90212e9398()
{
    return getdvarint( @"hash_6016dbc223b1ee67", 0 ) == 1;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x71e1
// Size: 0x11a
function function_ebd10619133e859c()
{
    level.player notifyonplayercommand( "fake_weapon_fire_attempted", "+attack" );
    
    while ( true )
    {
        level.player waittill( "fake_weapon_fire_attempted" );
        
        if ( !function_4a691d90212e9398() )
        {
            continue;
        }
        
        if ( !flag( "flag_fake_pistol_enabled" ) )
        {
            continue;
        }
        
        player_org = level.player geteye();
        player_angles = level.player getplayerangles();
        var_c81f9e334cca7062 = anglestoforward( player_angles );
        bullet_start = player_org + var_c81f9e334cca7062 * 50;
        bullet_end = bullet_start + var_c81f9e334cca7062 * 2000;
        all_ai = getaiarray();
        var_56e6ae8d71d42a7b = array_add( all_ai, level.player );
        trace = scripts\engine\trace::ray_trace( bullet_start, bullet_end, var_56e6ae8d71d42a7b );
        magicbullet( make_weapon( "iw9_pi_golf17_sp" ), bullet_start, bullet_end );
        level.player notify( "fake_weapon_fired" );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7303
// Size: 0x5e
function function_5d1e8e5b4a31254e( dialogue )
{
    if ( !time_has_passed( level.var_c2bdd88f0b642617, 3.5 ) )
    {
        var_7b360e9ae09d91e4 = gettime() - level.var_c2bdd88f0b642617;
        var_e10f4271fbaa2b07 = 3.5 - var_7b360e9ae09d91e4 / 1000;
        wait var_e10f4271fbaa2b07;
    }
    
    say( dialogue );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7369
// Size: 0x1e
function function_7a18da6e48b71c35( name )
{
    if ( !isdefined( name ) )
    {
        return undefined;
    }
    
    return getstruct( name, "targetname" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7390
// Size: 0x50
function function_a7ed7711dc58e0b( toggle_open )
{
    var_8697cf5f6210732e = getentarray( "pistol_bathroom_door", "targetname" );
    
    if ( toggle_open )
    {
        array_call( var_8697cf5f6210732e, &movex, 48, 0.75 );
        return;
    }
    
    array_call( var_8697cf5f6210732e, &movex, -48, 0.75 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x73e8
// Size: 0x53
function function_7d2e287b72a27d32( position, time )
{
    start_time = gettime();
    
    while ( true )
    {
        if ( function_cf0d23ab6a54057e( position ) )
        {
            if ( gettime() > start_time + time * 1000 )
            {
                break;
            }
        }
        else
        {
            start_time = gettime();
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7443
// Size: 0x56
function function_c580a41a277e4291( position, time )
{
    start_time = gettime();
    
    while ( true )
    {
        if ( function_e7c30095a6cdc3ef( position, 10, 0 ) )
        {
            if ( gettime() > start_time + time * 1000 )
            {
                break;
            }
        }
        else
        {
            start_time = gettime();
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x74a1
// Size: 0x2c
function function_6783bbaabfd68cd1( position, time, var_acba072b7e847a86 )
{
    function_c580a41a277e4291( position, time );
    flag_set( var_acba072b7e847a86 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x74d5
// Size: 0x29
function function_cf0d23ab6a54057e( position )
{
    if ( !level.player isads() )
    {
        return 0;
    }
    
    return function_e7c30095a6cdc3ef( position, 15, 0 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7507
// Size: 0xed, Type: bool
function function_e7c30095a6cdc3ef( position, fov, occlude )
{
    if ( !isdefined( level.player ) )
    {
        return false;
    }
    
    if ( !isdefined( fov ) )
    {
        fov = getdvarint( @"cg_fov" );
    }
    
    if ( !isdefined( occlude ) )
    {
        occlude = 0;
    }
    
    in_fov = within_fov( level.player geteye(), level.player getplayerangles(), position, cos( fov ) );
    
    if ( !in_fov )
    {
        return false;
    }
    
    if ( !occlude )
    {
        return true;
    }
    
    contents = physics_createcontents( [ "physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_ainosight" ] );
    castresult = physics_raycast( level.player geteye(), position, contents, undefined, 0, "physicsquery_closest", 0 );
    
    if ( isdefined( castresult ) && castresult.size > 0 )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x75fd
// Size: 0x52, Type: bool
function player_moving_toward( point )
{
    return within_fov( level.player.origin, level.player.angles, point, 0.642788 ) && istrue( level.player getnormalizedmovement()[ 0 ] );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7658
// Size: 0x3b
function melee_tracker()
{
    val::set( "earpiece_allow", "melee", 1 );
    context_melee_enable( 0 );
    flag_wait( "flag_hijackers_end" );
    val::set( "earpiece_allow", "melee", 0 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x769b
// Size: 0x42
function function_e3ef9d2f0513d055( position, fov, occlude )
{
    while ( true )
    {
        seen_by_player = function_e7c30095a6cdc3ef( position, fov, occlude );
        
        if ( seen_by_player )
        {
            return "seen_by_player";
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x76e5
// Size: 0x73
function function_238801b2923279cf( position, timeout, fov, occlude )
{
    start_time = gettime();
    timeout *= 1000;
    
    while ( true )
    {
        seen_by_player = function_e7c30095a6cdc3ef( position, fov, occlude );
        
        if ( seen_by_player )
        {
            return "seen_by_player";
        }
        
        if ( timeout < gettime() - start_time )
        {
            return "timeout";
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7760
// Size: 0x5a
function function_6342ec57ac648f0e( position, flag_name, fov, occlude )
{
    while ( true )
    {
        seen_by_player = function_e7c30095a6cdc3ef( position, fov, occlude );
        
        if ( seen_by_player )
        {
            return "seen_by_player";
        }
        
        if ( flag( flag_name ) )
        {
            return "flag_hit";
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x77c2
// Size: 0x45
function function_3c72aef86fe48dab( struct_name, fov, occlude )
{
    look_struct = getstruct( struct_name, "targetname" );
    return function_e3ef9d2f0513d055( look_struct.origin, fov, occlude );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7810
// Size: 0x4e
function function_777a76bee2b363ed( struct_name, timeout, fov, occlude )
{
    look_struct = getstruct( struct_name, "targetname" );
    return function_238801b2923279cf( look_struct.origin, timeout, fov, occlude );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7867
// Size: 0x4e
function function_c8431cc67f0b0824( struct_name, flag_name, fov, occlude )
{
    look_struct = getstruct( struct_name, "targetname" );
    return function_6342ec57ac648f0e( look_struct.origin, flag_name, fov, occlude );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78be
// Size: 0x4a
function function_e2ef62b3f4e104c( org, var_acba072b7e847a86 )
{
    while ( true )
    {
        level.player waittill( "weapon_fired" );
        
        if ( function_e7c30095a6cdc3ef( org.origin, 10, 0 ) )
        {
            flag_set( var_acba072b7e847a86 );
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7910
// Size: 0xc7
function function_80a4a5e9830057a9( guy, var_8d9a61b271ef2344, endon_string, var_e1330ad3638c394f )
{
    level endon( endon_string );
    
    while ( true )
    {
        guy waittill( "damage", damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon );
        
        if ( isplayer( attacker ) )
        {
            flag_set( var_8d9a61b271ef2344 );
            return;
        }
        
        flag_set( var_e1330ad3638c394f );
        return;
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79df
// Size: 0xb2
function function_4062dbbf7b62a4f8( flag_name )
{
    level endon( "flag_hero_rusher_start" );
    flag_wait( "hijackers_final_blocker_shot_once" );
    
    while ( true )
    {
        self waittill( "damage", damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon );
        
        if ( isplayer( attacker ) )
        {
            flag_set( flag_name );
            break;
        }
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a99
// Size: 0x168
function function_38e061a78d470508()
{
    level endon( "flag_hero_rusher_start" );
    self endon( "death" );
    
    switch ( self.targetname )
    {
        case #"hash_8f9c7cf67782423":
            pain_anim = "jup_hij_0525_pain_enemy01";
            react_anim = "jup_hij_0525_react_enemy01";
            break;
        case #"hash_1dd4867f748523cf":
            pain_anim = "jup_hij_0525_pain_enemy02";
            react_anim = "jup_hij_0525_react_enemy02";
            break;
        case #"hash_7b31ab4a64c5a4ff":
            pain_anim = "jup_hij_0525_pain_enemy01";
            react_anim = "jup_hij_0525_react_enemy02";
            break;
        default:
            pain_anim = "jup_hij_0525_pain_enemy01";
            react_anim = "jup_hij_0525_react_enemy01";
            break;
    }
    
    set_dontmelee( 1 );
    flag_wait( "flag_player_attacked_hijackers" );
    
    if ( isalive( self ) )
    {
        anim_stopanimscripted();
        
        if ( self.health < 100 && self != level.rear_hijacker )
        {
            anim_single_solo( self, pain_anim, undefined, 3.8 );
        }
        else
        {
            magic_bullet_shield();
            random_time = randomfloatrange( 0.1, 0.3 );
            wait random_time;
        }
        
        self.favoriteenemy = level.player;
        self.maxfaceenemydist = 1000;
        self.goalradius = 100;
        self.accuracy = 1;
        self.disablereload = 1;
        self.ignoreall = 0;
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7c09
// Size: 0x46
function function_319c2f097ede51e0( targetname, entities, shot, time_fraction )
{
    animnode = getstruct( targetname, "targetname" );
    animnode scene::play( entities, shot, undefined, time_fraction );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7c57
// Size: 0x49
function function_57ac36ea7abb5af4( targetname, entities, shots, time_fraction )
{
    if ( isdefined( targetname ) )
    {
        function_319c2f097ede51e0( targetname, entities, shots, time_fraction );
    }
    else
    {
        scene::play( entities, shots, undefined, time_fraction );
    }
    
    self notify( "scene_complete" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x7ca8
// Size: 0x49
function function_54376d79bb3d20f5( targetname, entities, shots, time_fraction )
{
    if ( isdefined( targetname ) )
    {
        function_319c2f097ede51e0( targetname, entities, shots, time_fraction );
    }
    else
    {
        scene::play( entities, shots, undefined, time_fraction );
    }
    
    self notify( "scene_secondary_complete" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7cf9
// Size: 0x53
function function_96cef8a436875213( targetname, entities )
{
    if ( isdefined( targetname ) )
    {
        animnode = getstruct( targetname, "targetname" );
    }
    else
    {
        animnode = self;
    }
    
    animnode function_57ac36ea7abb5af4( undefined, entities, "enter" );
    animnode thread scene::play( entities, "loop" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d54
// Size: 0x1b9
function function_36bd1eff3569fcad()
{
    level endon( "kill_zoom" );
    level.player notifyonplayercommand( "safe_zoom_pressed", "+toggleads_throw" );
    level.player notifyonplayercommand( "safe_zoom_pressed", "+melee_zoom" );
    level.player notifyonplayercommand( "safe_zoom_pressed", "+speed_throw" );
    level.player notifyonplayercommand( "safe_zoom_released", "-toggleads_throw" );
    level.player notifyonplayercommand( "safe_zoom_released", "-melee_zoom" );
    level.player notifyonplayercommand( "safe_zoom_released", "-speed_throw" );
    wait 1;
    
    if ( !isdefined( level.player.animating ) )
    {
        level.player.animating = 0;
    }
    
    while ( !player_has_weapon( level.weap ) )
    {
        level.player waittill( "safe_zoom_pressed" );
        
        if ( !level.player.animating && !player_has_weapon( level.weap ) )
        {
            level.player lerpfov( 40, 0.5, 0.25, 0.25 );
        }
        
        level.player waittill( "safe_zoom_released" );
        
        if ( level.player.animating || player_has_weapon( level.weap ) )
        {
            level.player lerpfov( 50, 0.25, 0.05, 0.05 );
            continue;
        }
        
        level.player lerpfov( 50, 0.5, 0.25, 0.25 );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f15
// Size: 0x28
function zoom_disable()
{
    level.player notify( "safe_zoom_released" );
    level.player.animating = 1;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f45
// Size: 0x17
function zoom_enable()
{
    level.player.animating = 0;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f64
// Size: 0x19d
function function_e804c126791f1d54()
{
    animnode = self;
    flag_string = animnode.script_noteworthy;
    flag_wait( "passenger_transition_to_alert" );
    shots = [ "idle_to_standing", "standing" ];
    animnode thread scene::play( undefined, shots );
    guy = animnode scene::get_entity( "civ" );
    waittill_any_ents( level, flag_string, level, "aisle_father_dead", level.player, "attack_pressed" );
    
    if ( !flag( flag_string ) )
    {
        shots = [ "standing_to_recoil" ];
        animnode scene::play( guy, shots );
        shots = [ "recoil" ];
        animnode thread scene::play( guy, shots );
        
        while ( distance( level.player.origin, animnode.origin ) > 400 )
        {
            waitframe();
        }
        
        if ( !flag( flag_string ) && !flag( "aisle_father_dead" ) )
        {
            waittill_any_ents_or_timeout_return( 5, level, flag_string, level, "aisle_father_dead", level.player, "attack_pressed" );
        }
        
        shots = [ "recoil_to_standing" ];
        animnode thread scene::function_bc521bee52fde214( 3 );
        animnode scene::play( guy, shots );
        shots = [ "standing_to_panic" ];
        animnode thread scene::function_bc521bee52fde214( 1 );
        animnode scene::play( guy, shots );
    }
    else
    {
        shots = [ "standing_to_panic" ];
        animnode scene::play( guy, shots );
    }
    
    shots = [ "panic" ];
    animnode thread scene::play( guy, shots );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8109
// Size: 0x63
function enter_economy_curtains()
{
    var_36109f139cb57b7c = getent( "first_class_curtain_entrance", "targetname" );
    var_d7feeae39b9325e5 = getent( "first_class_curtain_entrance_open", "targetname" );
    waitframe();
    
    if ( isdefined( var_36109f139cb57b7c ) && isdefined( var_d7feeae39b9325e5 ) )
    {
        var_d7feeae39b9325e5 hide();
        flag_wait( "flag_enter_economy_curtains" );
        var_d7feeae39b9325e5 show();
        var_36109f139cb57b7c hide();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8174
// Size: 0x2a
function function_7070c8a674d0b8c9( actor )
{
    cinematicingameloop( "sp_jup_hijack_intro_phone", 1 );
    flag_wait( "flag_intro_complete" );
    stopcinematicingame();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81a6
// Size: 0x36
function function_d926ab4104653b4a( actor )
{
    flag_wait( "phone_countdown_start" );
    cinematicingameloop( "sp_jup_hijack_bomb_countdown", 1 );
    flag_wait( "phone_countdown_end" );
    stopcinematicingame();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81e4
// Size: 0x3f
function function_d7c6627f65ecb8ac( actor )
{
    flag_wait( "makarov_phone_countdown_init" );
    cinematicingame( "sp_jup_hijack_bomb_countdown", 1 );
    pausecinematicingame( 1 );
    flag_wait( "makarov_phone_countdown_start" );
    pausecinematicingame( 0 );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x822b
// Size: 0x163
function temp_dialogue( speaker, text, duration, color_value )
{
    level notify( "temp_dialogue", speaker, text, duration );
    level endon( "temp_dialogue" );
    
    if ( !isdefined( color_value ) )
    {
        color_value = 2;
    }
    
    if ( !isdefined( duration ) )
    {
        duration = 4;
    }
    
    if ( isdefined( level.var_e1dec5807616ebbb ) )
    {
        level.var_e1dec5807616ebbb destroy();
        level.var_e1dec5807616ebbb = undefined;
    }
    
    level.var_e1dec5807616ebbb = newhudelem();
    level.var_e1dec5807616ebbb.x = 0;
    level.var_e1dec5807616ebbb.y = -64;
    level.var_e1dec5807616ebbb settext( "^" + color_value + speaker + ": ^7" + text );
    level.var_e1dec5807616ebbb.fontscale = 1.46;
    level.var_e1dec5807616ebbb.alignx = "center";
    level.var_e1dec5807616ebbb.aligny = "middle";
    level.var_e1dec5807616ebbb.horzalign = "center";
    level.var_e1dec5807616ebbb.vertalign = "bottom";
    level.var_e1dec5807616ebbb.sort = 1;
    wait duration;
    thread function_21bbf0b607eef131();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8396
// Size: 0x59
function function_21bbf0b607eef131()
{
    level endon( "temp_dialogue" );
    alpha = 1;
    
    while ( alpha > 0 )
    {
        level.var_e1dec5807616ebbb.alpha = alpha;
        wait 0.05;
        alpha -= 0.1;
    }
    
    level.var_e1dec5807616ebbb destroy();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x83f7
// Size: 0x43
function function_8435dd9d3a6a867b( from_point )
{
    if ( !isdefined( from_point ) )
    {
        return 0;
    }
    
    if ( distance2d( level.player.origin, from_point.origin ) < 75 )
    {
        return 0;
    }
    
    return 1;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8442
// Size: 0x75
function function_4e77ad3c291b5056()
{
    level.player thread scripts\sp\player::disable_player_weapon_info();
    
    if ( !self isgestureplaying( "jup_ges_hands_up" ) && function_3a0c2d9cf044a4d() )
    {
        self playgestureviewmodel( "jup_ges_hands_up", undefined, 0, 0.5, 0, 1 );
        thread function_476ec9d2a0a9fe9e();
        return;
    }
    
    if ( self isgestureplaying( "jup_ges_hands_up" ) )
    {
        self notify( "hands_down" );
        self stopgestureviewmodel( "jup_ges_hands_up", 0.1, 0 );
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84bf
// Size: 0x37
function function_476ec9d2a0a9fe9e()
{
    self endon( "hands_down" );
    
    while ( !isads() || self attackbuttonpressed() )
    {
        waitframe();
    }
    
    if ( self isgestureplaying( "jup_ges_hands_up" ) )
    {
        thread function_4e77ad3c291b5056();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84fe
// Size: 0x55, Type: bool
function function_3a0c2d9cf044a4d()
{
    if ( isnullweapon( level.player getcurrentweapon() ) )
    {
        return false;
    }
    
    if ( level.player issprinting() )
    {
        return false;
    }
    
    if ( level.player issupersprinting() )
    {
        return false;
    }
    
    if ( !level.player isweaponsenabled() )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x855c
// Size: 0x6f
function function_4dd6bcfa285fa86e( node )
{
    if ( !isdefined( node ) || !isdefined( self ) )
    {
        return;
    }
    
    self.ignoreall = 1;
    self usecovernode( node, 1 );
    self setgoalnode( node );
    
    while ( true )
    {
        if ( isdefined( self.pathgoalpos ) && self pathdisttogoal() > 0 )
        {
            break;
        }
        
        waitframe();
    }
    
    self.ignoreall = 0;
    self.var_3056d8c9bd11f1f2 = 1;
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x85d3
// Size: 0x78
function function_2ea419e0536f6d12( stewardess )
{
    level endon( "standoff_canceled" );
    flag_wait( "stewardess_sees_gun" );
    
    if ( level.player.gun_taken == 1 )
    {
        stewardess say( "dx_sp_hjck_intr_fefl_shesgotagun" );
    }
    else
    {
        stewardess say( "dx_sp_hjck_intr_fefl_hesgotagun" );
    }
    
    flag_wait( "samara_reply_marshal" );
    wait 3;
    level.player say( "dx_sp_hjck_intr_sama_nononopleasethereare" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8653
// Size: 0x14c
function function_c8583438e5aded0c()
{
    spawner = getspawner( "hijacker_v2_neighbour", "targetname" );
    hijacker_v2_neighbour = spawner spawn_ai( 1 );
    hijacker_v2_neighbour.ignoreall = 1;
    hijacker_v2_neighbour.dontevershoot = 1;
    hijacker_v2_neighbour.goalradius = 16;
    hijacker_v2_neighbour.name = "Hijacker";
    hijacker_v2_neighbour.var_3119604b74dfdbbd = 0;
    hijacker_v2_neighbour enableavoidance( 0, 0 );
    hijacker_v2_neighbour.maxfaceenemydist = 1000;
    hijacker_v2_neighbour demeanor_override( "casual" );
    hijacker_v2_neighbour.fixednode = 1;
    namespace_bde1a0e87b86090::function_693d03525ad49ffc( hijacker_v2_neighbour );
    level.cleanup_crew = array_add( level.cleanup_crew, hijacker_v2_neighbour );
    level.neighbor = hijacker_v2_neighbour;
    struct = getstruct( "neighbour_first_loc_shove", "targetname" );
    first_loc = spawn_script_origin( struct.origin, struct.angles );
    
    if ( isdefined( first_loc ) )
    {
        hijacker_v2_neighbour forceteleport( first_loc.origin, first_loc.angles, 1000 );
    }
    
    wait 2;
    flag_wait( "flag_mexican_standoff_begin" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87a7
// Size: 0x72
function function_ed04e541e65d1dce( animnode )
{
    neighbor = animnode scene::get_entity( "neighbor" );
    neighbor.team = "neutral";
    level notify( "visibilityTeamName", "neutral", [ neighbor ] );
    level waittill( "neighborRevealGun" );
    neighbor.team = "axis";
    level notify( "visibilityTeamName", "axis", [ neighbor ] );
}

/#

    // Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x8821
    // Size: 0x5, Type: dev
    function function_4aa65d546609bfd8()
    {
        
    }

#/

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x882e
// Size: 0x107
function function_32cb2a1de20d7e6()
{
    level endon( "neighbor_takedown" );
    level endon( "flag_mexican_standoff_end" );
    infov = 0;
    level.var_9472023eb28270b2 = 0;
    messages = [ "hij_player_remove_takedown", "hij_melee_button_pressed" ];
    level waittill( "enable_standoff_takedown" );
    
    while ( isalive( level.neighbor ) )
    {
        infov = within_fov( level.player geteye(), level.player getplayerangles(), level.neighbor geteye(), cos( 150 ) );
        
        if ( infov && !level.var_9472023eb28270b2 )
        {
            level.var_9472023eb28270b2 = 1;
            level.player thread scripts\engine\sp\utility::display_hint_forced( "hijack_disarm_hint", undefined, 0, level.player, messages );
        }
        else if ( !infov && level.var_9472023eb28270b2 )
        {
            level.player notify( "hij_player_remove_takedown" );
            level.var_9472023eb28270b2 = 0;
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x893d
// Size: 0x1d
function function_a733404fceca139f()
{
    level endon( "flag_mexican_standoff_end" );
    flag_wait( "player_melee_hit" );
    thread function_d2ff41bc463d86e6();
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8962
// Size: 0x187
function function_d2ff41bc463d86e6()
{
    level.neighbor delete();
    animnode = getstruct( "scene_hij_0150_second_takedown", "targetname" );
    waitframe();
    level.player.gun_taken = 1;
    level.var_a613011527cdaa23.entity delete();
    animnode scene::play( undefined, "shot_010" );
    level.player take_weapon( level.weap );
    level.weap = make_weapon( "jup_cp24_pi_glima21_sp_3d" );
    level.player give_weapon( level.weap );
    level.player switchtoweaponimmediate( level.weap );
    level.player setweaponammostock( level.weap, 0 );
    level.player setweaponammoclip( level.weap, 15 );
    level.player allowreload( 0 );
    level.player allowfire( 1 );
    level.player allowcrouch( 1 );
    level.player allowsprint( 1 );
    level.player setstance( "stand", 1, 1, 0 );
    level.player notify( "hij_melee_button_pressed" );
    waitframe();
    level.var_9472023eb28270b2 = !level.var_9472023eb28270b2;
    flag_set( "neighbor_takedown" );
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8af1
// Size: 0x6e
function melee_listener()
{
    level endon( "flag_mexican_standoff_end" );
    level endon( "neighbor_takedown" );
    self endon( "death" );
    self allowmelee( 1 );
    self allowfire( 1 );
    
    while ( true )
    {
        if ( level.player meleebuttonpressed() )
        {
            if ( level.var_9472023eb28270b2 )
            {
                flag_set( "player_melee_hit" );
                level.player notify( "hij_player_remove_takedown" );
                break;
            }
        }
        
        waitframe();
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b67
// Size: 0xc2
function function_e47ba6fce6829dbd( targets )
{
    level endon( "flag_flashbang_done" );
    self endon( "death" );
    
    while ( !flag( "flag_flashbang_done" ) )
    {
        var_e465d9f169f3da24 = 1;
        
        foreach ( var_a03582deacadbd78 in targets )
        {
            if ( !is_dead_or_dying( var_a03582deacadbd78 ) )
            {
                var_e465d9f169f3da24 = 0;
            }
        }
        
        if ( var_e465d9f169f3da24 )
        {
            level.player.ignoreme = 0;
            level.var_21fd20948641a30b = 1;
            set_favoriteenemy( level.player );
            break;
        }
        
        wait 0.5;
    }
}

// Namespace namespace_1372601db13b5bbc / namespace_bde1a0e87b86090
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c31
// Size: 0xda
function function_ad2aff0233216ab9( targets )
{
    level endon( "flag_flashbang_done" );
    self endon( "death" );
    
    while ( !flag( "flag_flashbang_done" ) )
    {
        var_e465d9f169f3da24 = 1;
        
        foreach ( var_a03582deacadbd78 in targets )
        {
            if ( !is_dead_or_dying( var_a03582deacadbd78 ) )
            {
                var_e465d9f169f3da24 = 0;
            }
        }
        
        if ( var_e465d9f169f3da24 && istrue( level.player.var_179ccec341f75747 ) )
        {
            level.player.ignoreme = 0;
            level.var_21fd20948641a30b = 1;
            set_favoriteenemy( level.player );
            break;
        }
        
        wait 0.5;
    }
}

