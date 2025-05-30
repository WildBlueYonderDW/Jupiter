#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp\cp_checkpoint;
#using scripts\cp\endgame;
#using scripts\cp\utility;
#using scripts\engine\utility;

#namespace starts;

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x296
// Size: 0x26
function init_starts()
{
    flag_init( "start_is_set" );
    add_start( "no_game", &start_nogame );
    add_no_game_starts();
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c4
// Size: 0x2
function start_nogame()
{
    
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce
// Size: 0x11
function do_starts()
{
    thread handle_starts();
    do_no_game_start();
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e7
// Size: 0x92
function add_no_game_starts()
{
    start_spots = getentarray( "script_origin_start_nogame", "classname" );
    
    if ( !start_spots.size )
    {
        return;
    }
    
    foreach ( spot in start_spots )
    {
        if ( !isdefined( spot.script_startname ) )
        {
            continue;
        }
        
        add_start( "no_game_" + spot.script_startname, &start_nogame );
    }
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x381
// Size: 0x14
function do_no_game_start()
{
    if ( !is_no_game_start() )
    {
        return;
    }
    
    level waittill( "eternity" );
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39d
// Size: 0x61
function start_menu()
{
    /#
        for ( ;; )
        {
            if ( getdvarint( @"debug_start" ) )
            {
                setdevdvar( @"debug_start", 0 );
                level.debug.debug_start = 1;
                display_starts();
                level.debug.debug_start = 0;
            }
            
            wait 0.05;
        }
    #/
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x406
// Size: 0x46
function get_start_dvars()
{
    dvars = [];
    
    for (i = 0; i < level.start_functions.size; i++) {
        dvars[ dvars.size ] = level.start_functions[ i ][ "name" ];
    }
    
    return dvars;
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x455
// Size: 0x55f
function display_starts()
{
    if ( level.start_functions.size <= 0 )
    {
        return;
    }
    
    dvars = get_start_dvars();
    dvars[ dvars.size ] = "default";
    dvars[ dvars.size ] = "cancel";
    
    for (i = 0; i < level.players.size; i++) {
        level.players[ i ] freezecontrols( 1 );
        level.players[ i ] val::set( "startpoints", "backpack_inventory", 0 );
        level.players[ i ] val::set( "startpoints", "tacmap_scoreboard", 0 );
        level.players[ i ] val::set( "startpoints", "spotter_scope", 0 );
    }
    
    var_954453d0fe43373c = getdvarint( @"hash_58f6ddd5e5892406", 1 );
    
    if ( istrue( var_954453d0fe43373c ) )
    {
        setdvar( @"hash_58f6ddd5e5892406", 0 );
    }
    
    var_e431c1b8e670a6ed = !getdvarint( @"hash_c13b17d1d59956a5", 0 );
    
    if ( var_e431c1b8e670a6ed )
    {
        setdvar( @"hash_c13b17d1d59956a5", 1 );
    }
    
    elems = start_list_menu();
    title = create_start( "Selected Start:", -1 );
    title.color = ( 1, 1, 1 );
    strings = [];
    
    for (i = 0; i < dvars.size; i++) {
        dvar = dvars[ i ];
        start_string = "[" + dvars[ i ] + "]";
        strings[ strings.size ] = start_string;
    }
    
    selected = dvars.size - 1;
    up_pressed = 0;
    down_pressed = 0;
    var_23c24faf493b443a = 0;
    
    while ( selected > 0 )
    {
        if ( dvars[ selected ] == level.start_point )
        {
            var_23c24faf493b443a = 1;
            break;
        }
        
        selected--;
    }
    
    if ( !var_23c24faf493b443a )
    {
        selected = dvars.size - 1;
    }
    
    start_list_settext( elems, strings, selected );
    old_selected = selected;
    var_1a6f1e60b90fbe7c = 0;
    
    for ( ;; )
    {
        if ( old_selected != selected )
        {
            start_list_settext( elems, strings, selected );
            old_selected = selected;
        }
        
        if ( gettime() - var_1a6f1e60b90fbe7c > 150 )
        {
            up_pressed = 0;
            down_pressed = 0;
        }
        
        if ( !up_pressed )
        {
            if ( level.player buttonpressed( "UPARROW" ) || level.player buttonpressed( "DPAD_UP" ) || level.player buttonpressed( "APAD_UP" ) )
            {
                up_pressed = 1;
                var_1a6f1e60b90fbe7c = gettime();
                selected--;
            }
        }
        else if ( !level.player buttonpressed( "UPARROW" ) && !level.player buttonpressed( "DPAD_UP" ) && !level.player buttonpressed( "APAD_UP" ) )
        {
            up_pressed = 0;
        }
        
        if ( !down_pressed )
        {
            if ( level.player buttonpressed( "DOWNARROW" ) || level.player buttonpressed( "DPAD_DOWN" ) || level.player buttonpressed( "APAD_DOWN" ) )
            {
                down_pressed = 1;
                var_1a6f1e60b90fbe7c = gettime();
                selected++;
            }
        }
        else if ( !level.player buttonpressed( "DOWNARROW" ) && !level.player buttonpressed( "DPAD_DOWN" ) && !level.player buttonpressed( "APAD_DOWN" ) )
        {
            down_pressed = 0;
        }
        
        if ( selected < 0 )
        {
            selected = dvars.size - 1;
        }
        
        if ( selected >= dvars.size )
        {
            selected = 0;
        }
        
        if ( level.player buttonpressed( "BUTTON_B" ) || level.player buttonpressed( "escape" ) )
        {
            start_display_cleanup( elems, title );
            break;
        }
        
        if ( level.player buttonpressed( "kp_enter" ) || level.player buttonpressed( "BUTTON_A" ) || level.player buttonpressed( "enter" ) )
        {
            if ( dvars[ selected ] == "cancel" )
            {
                start_display_cleanup( elems, title );
                break;
            }
            
            /#
                setdevdvar( @"debug_start", 0 );
            #/
            
            setdvar( @"start", dvars[ selected ] );
            scripts\cp\cp_checkpoint::checkpoint_set( "" );
            scripts\cp\endgame::restart_map( 0, "map_restart" );
            break;
        }
        
        wait 0.05;
    }
    
    for (i = 0; i < level.players.size; i++) {
        level.players[ i ] freezecontrols( 0 );
        level.players[ i ] val::set( "startpoints", "backpack_inventory", 1 );
        level.players[ i ] val::set( "startpoints", "tacmap_scoreboard", 1 );
        level.players[ i ] val::set( "startpoints", "spotter_scope", 0 );
    }
    
    if ( istrue( var_954453d0fe43373c ) )
    {
        setdvar( @"hash_58f6ddd5e5892406", 1 );
    }
    
    if ( var_e431c1b8e670a6ed )
    {
        setdvar( @"hash_c13b17d1d59956a5", 0 );
    }
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bc
// Size: 0x45
function start_list_menu()
{
    hud_array = [];
    
    for (i = 0; i < 11; i++) {
        hud = create_start( "", i );
        hud_array[ hud_array.size ] = hud;
    }
    
    return hud_array;
}

// Namespace starts / scripts\cp\starts
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa0a
// Size: 0x71
function start_list_settext( hud_array, strings, num )
{
    for (i = 0; i < hud_array.size; i++) {
        index = i + num - 5;
        
        if ( isdefined( strings[ index ] ) )
        {
            text = strings[ index ];
        }
        else
        {
            text = "";
        }
        
        /#
            hud_array[ i ] setdevtext( text );
        #/
    }
}

// Namespace starts / scripts\cp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa83
// Size: 0x3c
function start_display_cleanup( elems, title )
{
    title destroy();
    
    for (i = 0; i < elems.size; i++) {
        elems[ i ] destroy();
    }
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xac7
// Size: 0xbe
function private function_e085c11cc5e27261()
{
    sorted_array = [];
    
    if ( level.start_functions.size <= 1 )
    {
        return;
    }
    
    for (i = 0; i < level.start_functions.size; i++) {
        if ( !isstartstr( level.start_functions[ i ][ "name" ], "no_game" ) )
        {
            sorted_array[ sorted_array.size ] = level.start_functions[ i ];
        }
    }
    
    for (i = 0; i < level.start_functions.size; i++) {
        if ( isstartstr( level.start_functions[ i ][ "name" ], "no_game" ) )
        {
            sorted_array[ sorted_array.size ] = level.start_functions[ i ];
        }
    }
    
    level.start_functions = sorted_array;
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8d
// Size: 0x48f
function handle_starts()
{
    level endon( "game_ended" );
    level.start_struct = spawnstruct();
    setdvarifuninitialized( @"start", "" );
    
    if ( getdvar( @"hash_7f5c464e214c560c" ) != "" && getdvar( @"hash_7f5c464e214c560c" ) != "0" )
    {
        return;
    }
    
    if ( !isdefined( level.start_functions ) )
    {
        level.start_functions = [];
    }
    else
    {
        function_e085c11cc5e27261();
    }
    
    start = tolower( getdvar( @"start" ) );
    dvars = get_start_dvars();
    
    if ( isdefined( level.start_point ) )
    {
        start = level.start_point;
    }
    
    start_index = 0;
    
    for (i = 0; i < dvars.size; i++) {
        if ( start == dvars[ i ] )
        {
            start_index = i;
            level.start_point = dvars[ i ];
            break;
        }
    }
    
    if ( isdefined( level.default_start_override ) && !isdefined( level.start_point ) )
    {
        foreach ( dvar in dvars )
        {
            if ( level.default_start_override == dvar )
            {
                start_index = index;
                level.start_point = dvar;
                break;
            }
        }
    }
    
    if ( !isdefined( level.start_point ) )
    {
        if ( isdefined( level.default_start ) )
        {
            level.start_point = "default";
        }
        else if ( level_has_start_points() )
        {
            level.start_point = level.start_functions[ 0 ][ "name" ];
        }
        else
        {
            level.start_point = "default";
        }
    }
    
    waittillframeend();
    flag_set( "start_is_set" );
    thread start_menu();
    
    while ( !isdefined( level.player ) )
    {
        waitframe();
    }
    
    if ( scripts\cp\cp_checkpoint::checkpoint_isset() && is_default_start() )
    {
        /#
            announcement( "<dev string:x1c>" );
        #/
        
        return;
    }
    
    start_array = level.start_arrays[ level.start_point ];
    
    if ( level.start_point == "default" )
    {
        if ( isdefined( level.default_start ) )
        {
            level thread [[ level.default_start ]]();
        }
    }
    else
    {
        start_array = level.start_arrays[ level.start_point ];
        
        /#
            thread indicate_start( level.start_point );
        #/
        
        if ( isdefined( start_array[ "start_func" ] ) )
        {
            thread [[ start_array[ "start_func" ] ]]();
        }
    }
    
    if ( is_default_start() )
    {
        string = get_string_for_starts( dvars );
    }
    
    if ( getdvarint( @"fpstool_run" ) )
    {
        string = get_string_for_starts( dvars );
        setdvar( @"start", string );
        setdvar( @"hash_46467383874e22fd", "" );
    }
    
    waittillframeend();
    var_8751813f2dae82ee = [];
    
    if ( !is_default_start() && level.start_point != "no_game" )
    {
        time = gettime();
        
        for (i = 0; i < level.start_functions.size; i++) {
            start_array = level.start_functions[ i ];
            
            if ( start_array[ "name" ] == level.start_point )
            {
                break;
            }
            
            if ( !isdefined( start_array[ "catchup_function" ] ) )
            {
                continue;
            }
            
            [[ start_array[ "catchup_function" ] ]]();
        }
        
        assertex( time == gettime(), "time should not pass in the catchup functions." );
    }
    
    /#
        if ( getdvarint( @"hash_3d432dfb7c350f0a", 0 ) == 1 )
        {
            thread function_e23af6a2a99c6450();
        }
    #/
    
    for (i = start_index; i < level.start_functions.size; i++) {
        start_array = level.start_functions[ i ];
        
        if ( !isdefined( start_array[ "logic_func" ] ) )
        {
            continue;
        }
        
        if ( already_ran_function( start_array[ "logic_func" ], var_8751813f2dae82ee ) )
        {
            continue;
        }
        
        if ( getdvarint( @"fpstool_run" ) || getdvarint( @"prof_gameplaygfx" ) )
        {
            setdvar( @"hash_46467383874e22fd", start_array[ "name" ] );
        }
        
        level.start_struct [[ start_array[ "logic_func" ] ]]();
        
        if ( getdvarint( @"hash_47b7445b595408f7", 0 ) > 0 )
        {
            return;
        }
        
        var_8751813f2dae82ee[ var_8751813f2dae82ee.size ] = start_array[ "logic_func" ];
    }
}

// Namespace starts / scripts\cp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1024
// Size: 0x5e, Type: bool
function already_ran_function( func, var_8751813f2dae82ee )
{
    foreach ( logic_function in var_8751813f2dae82ee )
    {
        if ( logic_function == func )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace starts / scripts\cp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108b
// Size: 0x51
function get_string_for_starts( dvars )
{
    string = " ** No starts have been set up for this map with scriptsenginecputility::add_start().";
    
    if ( dvars.size )
    {
        string = " ** ";
        
        for (i = dvars.size - 1; i >= 0; i--) {
            string = string + dvars[ i ] + " ";
        }
    }
    
    return string;
}

// Namespace starts / scripts\cp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10e5
// Size: 0x13a
function create_start( start, index )
{
    alpha = 1;
    color = ( 0.9, 0.9, 0.9 );
    
    if ( index != -1 )
    {
        middle = 5;
        
        if ( index != middle )
        {
            alpha = 1 - abs( middle - index ) / middle;
        }
        else
        {
            color = ( 1, 1, 0 );
        }
    }
    
    if ( alpha == 0 )
    {
        alpha = 0.05;
    }
    
    hudelem = newclienthudelem( level.player );
    hudelem.alignx = "left";
    hudelem.aligny = "middle";
    hudelem.x = 80;
    hudelem.y = 80 + index * 18;
    
    /#
        hudelem setdevtext( start );
    #/
    
    hudelem.alpha = 0;
    hudelem.foreground = 1;
    hudelem.color = color;
    hudelem.fontscale = 1.75;
    hudelem fadeovertime( 0.5 );
    hudelem.alpha = alpha;
    return hudelem;
}

// Namespace starts / scripts\cp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1228
// Size: 0xd7
function indicate_start( start )
{
    while ( !isdefined( level.player ) )
    {
        waitframe();
    }
    
    hudelem = newclienthudelem( level.player );
    hudelem.alignx = "left";
    hudelem.aligny = "middle";
    hudelem.x = 10;
    hudelem.y = 400;
    
    /#
        hudelem setdevtext( start );
    #/
    
    hudelem.alpha = 0;
    hudelem.fontscale = 3;
    wait 1;
    hudelem fadeovertime( 1 );
    hudelem.alpha = 1;
    wait 5;
    hudelem fadeovertime( 1 );
    hudelem.alpha = 0;
    wait 1;
    hudelem destroy();
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1307
// Size: 0xd
function force_start_catchup()
{
    level.forced_start_catchup = 1;
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x131c
// Size: 0x29, Type: bool
function is_first_start()
{
    if ( !level_has_start_points() )
    {
        return true;
    }
    
    return level.start_point == level.start_functions[ 0 ][ "name" ];
}

// Namespace starts / scripts\cp\starts
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x134e
// Size: 0x85
function is_after_start( name )
{
    var_81878d29f5a714f3 = 0;
    
    if ( level.start_point == name )
    {
        return 0;
    }
    
    for (i = 0; i < level.start_functions.size; i++) {
        if ( level.start_functions[ i ][ "name" ] == name )
        {
            var_81878d29f5a714f3 = 1;
            continue;
        }
        
        if ( level.start_functions[ i ][ "name" ] == level.start_point )
        {
            return var_81878d29f5a714f3;
        }
    }
}

// Namespace starts / scripts\cp\starts
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x13db
// Size: 0x54
function add_start_construct( msg, func, optional_func, catchup_function )
{
    array = [];
    array[ "name" ] = msg;
    array[ "start_func" ] = func;
    array[ "logic_func" ] = optional_func;
    array[ "catchup_function" ] = catchup_function;
    return array;
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1438
// Size: 0x19
function add_start_assert()
{
    if ( !isdefined( level.start_functions ) )
    {
        level.start_functions = [];
    }
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1459
// Size: 0xf, Type: bool
function level_has_start_points()
{
    return level.start_functions.size > 1;
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1471
// Size: 0x3b
function is_no_game_start()
{
    if ( isdefined( level.start_point ) )
    {
        return issubstr( level.start_point, "no_game" );
    }
    
    return getdvar( @"start" ) == "no_game";
}

// Namespace starts / scripts\cp\starts
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x14b4
// Size: 0x5d
function function_6e12fd79b9071650( start, targetname )
{
    for (i = 0; i < level.start_functions.size; i++) {
        if ( level.start_functions[ i ][ "name" ] == start )
        {
            level.start_functions[ i ][ "default_spawn_tname" ] = targetname;
        }
    }
}

// Namespace starts / scripts\cp\starts
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1519
// Size: 0x9b
function function_78a0c5e1af6166f5()
{
    flag_wait( "start_is_set" );
    var_9439b3eda986bf2a = 0;
    
    if ( isdefined( level.start_point ) )
    {
        for (i = 0; i < level.start_functions.size; i++) {
            if ( level.start_functions[ i ][ "name" ] == level.start_point && isdefined( level.start_functions[ i ][ "default_spawn_tname" ] ) )
            {
                level.default_player_spawns = level.start_functions[ i ][ "default_spawn_tname" ];
                var_9439b3eda986bf2a = 1;
            }
        }
    }
    
    return var_9439b3eda986bf2a;
}

/#

    // Namespace starts / scripts\cp\starts
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x15bd
    // Size: 0xc2, Type: dev
    function function_e23af6a2a99c6450()
    {
        if ( level.start_arrays.size <= 1 )
        {
            return;
        }
        
        var_5047e6f735ee65b1 = getdvarint( @"hash_be67443edc41afd0", 15 );
        
        for ( ;; )
        {
            wait var_5047e6f735ee65b1;
            spotindex = randomintrange( 0, level.start_arrays.size );
            
            foreach ( startstruct in level.start_arrays )
            {
                if ( spotindex == 0 )
                {
                    setdvar( @"start", startstruct[ "<dev string:x3c>" ] );
                    break;
                }
                
                spotindex--;
            }
            
            map_restart();
        }
    }

#/
