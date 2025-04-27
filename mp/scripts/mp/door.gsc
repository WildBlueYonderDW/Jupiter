#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\anim;
#using scripts\mp\door;
#using scripts\mp\events;
#using scripts\mp\flags;
#using scripts\mp\gameobjects;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\movers;
#using scripts\mp\rank;
#using scripts\mp\utility\debug;
#using scripts\mp\utility\game;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\spawn_event_aggregator;
#using scripts\mp\utility\weapon;

#namespace door;

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda6
// Size: 0x95
function door_dynamic_setup( starthidden )
{
    if ( isdefined( level.doors ) )
    {
        return;
    }
    
    /#
        setdevdvarifuninitialized( @"hash_a35456ddcb0a6051", 0 );
        setdevdvarifuninitialized( @"hash_b75e6afff090e790", 0 );
    #/
    
    setdvar( @"hash_60f76e342fa97cce", 150 );
    level.doors = [];
    level.doorsetupstarted = 0;
    thread door_dynamic_setup_adapter( "dynamic_door", 0 );
    thread door_dynamic_setup_adapter( "lean_dynamic_door", 1, starthidden );
    script_model_anims();
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback( &onplayerspawned );
}

// Namespace door / scripts\mp\door
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe43
// Size: 0x727
function door_dynamic_setup_adapter( enttargetname, lean, starthidden )
{
    doors = getentarray( enttargetname, "targetname" );
    level.doorsetupstarted++;
    level.doorsetupfinished = 0;
    content = [ "physicscontents_clipshot", "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_characterproxy", "physicscontents_glass", "physicscontents_itemclip", "physicscontents_item" ];
    contentoverride = physics_createcontents( content );
    level.doorcontentoverride = contentoverride;
    
    foreach ( door in doors )
    {
        if ( isdefined( door.script_parameters ) )
        {
            door door_dynamic_parse_parameters( door.script_parameters );
        }
        
        door.doors = [];
        door.doors[ 0 ] = door;
        door.islean = lean;
        door.baseangles = door.angles;
        
        if ( door.baseangles[ 1 ] == 360 )
        {
            door.baseangles = ( door.baseangles[ 0 ], 0, door.baseangles[ 2 ] );
        }
        
        door.state = 0;
        doortarget = door.target;
        startopened = isdefined( door.script_noteworthy ) && door.script_noteworthy == "OPEN" || getdvarint( @"hash_a35456ddcb0a6051", 0 ) != 0;
        startlocked = isdefined( door.script_noteworthy ) && door.script_noteworthy == "LOCKED";
        door.length = 52;
        door.height = 96;
        door.leftplantorg = door.origin + anglestoforward( door.angles ) * door.length * 0.5 + anglestoright( door.angles ) * -24.5;
        door.leftplantang = ( 0, door.baseangles[ 1 ] - 90, 0 );
        door.rightplantorg = door.origin + anglestoforward( door.angles ) * door.length * 0.5 + anglestoright( door.angles ) * 24.5;
        door.rightplantang = ( 0, door.baseangles[ 1 ] + 90, 0 );
        door.doorcenter = door.origin + anglestoforward( door.angles ) * door.length * 0.5 + anglestoup( door.angles ) * door.height * 0.5;
        door.max_yaw_left = 90;
        door.max_yaw_right = 90;
        handletag = door gettagorigin( "tag_door_handle", 1 );
        
        if ( isdefined( handletag ) )
        {
            door scripts\mp\gameobjects::sethintobject( "tag_door_handle", "HINT_BUTTON", undefined, %MP/DOOR_USE_OPEN_DOUBLE, undefined, "duration_none", undefined, 200, 90, 72, 90 );
            door.useprompt = door;
            door.useprompt setusewhenhandsoccupied( 1 );
            
            if ( !lean && !scripts\cp_mp\utility\game_utility::isbrstylegametype() )
            {
                door.lockprompt = scripts\mp\gameobjects::createhintobject( handletag, "HINT_BUTTON", undefined, %MP/DOOR_USE_LOCK, undefined, undefined, "show", 200, 90, 72, 90 );
                door.lockprompt linkto( door, "tag_door_handle", ( 3, 0, 15 ), ( 0, 0, 0 ) );
                door.lockprompt setusewhenhandsoccupied( 1 );
                door.alarmprompts = [];
                var_32fac41ab88d1e04 = [ ( 4, 0, 4 ), ( 4, 0, 90 ) ];
                
                foreach ( offset in var_32fac41ab88d1e04 )
                {
                    alarmprompt = scripts\mp\gameobjects::createhintobject( handletag, "HINT_BUTTON", undefined, %MP/DOOR_USE_ALARM, undefined, undefined, "show", 100, 90, 80, 20 );
                    alarmprompt linkto( door, "tag_origin", offset, ( 0, 0, 0 ) );
                    alarmprompt setusewhenhandsoccupied( 0 );
                    alarmnum = alarmprompt getentitynumber();
                    door.alarmprompts[ alarmnum ] = alarmprompt;
                }
                
                clip = undefined;
                
                if ( isdefined( doortarget ) )
                {
                    clip = getent( doortarget, "targetname" );
                }
                
                if ( isdefined( clip ) )
                {
                    door.clipent = clip;
                    door.clipent linkto( door );
                    door.clipent.unresolved_collision_func = &scripts\mp\movers::unresolved_collision_void;
                    door.clipent connectpaths();
                    
                    if ( isdefined( clip.target ) )
                    {
                        audioportal = getent( clip.target, "targetname" );
                        door.audioportalent = audioportal;
                    }
                }
            }
            
            if ( startopened )
            {
                door thread changestate( 2 );
                door.angles = ( door.angles[ 0 ], door.angles[ 1 ] + 90, door.angles[ 2 ] );
            }
            else if ( startlocked )
            {
                door thread changestate( 7 );
            }
            else
            {
                door thread changestate( 0 );
            }
        }
        
        level.doors[ level.doors.size ] = door;
        waitframe();
    }
    
    if ( !lean )
    {
        level thread amortizeyawtraces();
        
        foreach ( door in level.doors )
        {
            door thread get_max_yaws();
        }
        
        level thread linkdoubledoors();
    }
    
    level.doorsetupstarted--;
    level.doorsetupfinished = level.doorsetupstarted == 0;
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1572
// Size: 0x92
function door_dynamic_setup_post_init()
{
    waitframe();
    
    if ( getdvarint( @"hash_a35456ddcb0a6051", 0 ) != 0 )
    {
        foreach ( door in level.doors )
        {
            door.statecurr = 2;
            door.angles = door.doortarget.angles;
        }
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x160c
// Size: 0x21b
function triggerlisten( door )
{
    self notify( "disableTrigger" );
    self endon( "disableTrigger" );
    level endon( "game_ended" );
    
    if ( !door.islean && door.statecurr == 0 )
    {
        door thread bashmonitor();
    }
    
    while ( true )
    {
        self waittill( "trigger", player );
        self makeunusable();
        targetrotation = door.doortarget;
        
        if ( isdefined( door.doortargetccw ) )
        {
            doorangle = anglestoforward( door.angles );
            doorfwd = vectorcross( ( 0, 0, 1 ), doorangle );
            playerfwd = anglestoforward( ( 0, player.angles[ 1 ], 0 ) );
            
            if ( vectordot( playerfwd, doorfwd ) < 0 )
            {
                targetrotation = door.doortargetccw;
            }
        }
        
        transitiontime = 0.666;
        
        if ( door.statecurr == 0 )
        {
            self notify( "stop_bash_monitor" );
            door.statecurr = 3;
            door rotateto( targetrotation.angles, transitiontime, 0, 0.333 );
            hintstring = %MP/DOOR_USE_CLOSE;
        }
        else
        {
            door.statecurr = 1;
            door rotateto( door.baseangles, transitiontime, 0, 0.333 );
            hintstring = %MP/DOOR_USE_OPEN;
        }
        
        door scripts\mp\events::doorused( player, door.statecurr == 3 );
        wait 0.1;
        door childthread door_state_update_sound();
        wait transitiontime;
        
        if ( door.statecurr == 1 )
        {
            door.statecurr = 0;
            
            if ( !door.islean )
            {
                door thread bashmonitor();
            }
        }
        else
        {
            door.statecurr = 2;
        }
        
        self makeusable();
        self sethintstring( hintstring );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x182f
// Size: 0x1a0
function door_dynamic_parse_parameters( parameters )
{
    door = self;
    door.button_sound = undefined;
    
    if ( !isdefined( parameters ) )
    {
        parameters = "";
    }
    
    params = strtok( parameters, ";" );
    
    foreach ( param in params )
    {
        toks = strtok( param, "=" );
        
        if ( toks.size != 2 )
        {
            continue;
        }
        
        if ( toks[ 1 ] == "undefined" || toks[ 1 ] == "default" )
        {
            door.params[ toks[ 0 ] ] = undefined;
            continue;
        }
        
        switch ( toks[ 0 ] )
        {
            case #"hash_5c3e74aaa13bc78d":
                door.stop_sound = toks[ 1 ];
                break;
            case #"hash_9e73d538861d053c":
                door.interrupt_sound = toks[ 1 ];
                break;
            case #"hash_78225775c0698cc3":
                door.loop_sound = toks[ 1 ];
                break;
            case #"hash_1e106e4c46349825":
                door.open_interrupt = string_to_bool( toks[ 1 ] );
                break;
            case #"hash_4d982a4c5ddaeacf":
                door.start_sound = toks[ 1 ];
                break;
            case #"hash_edda8e2907d42dc0":
                door.material = toks[ 1 ];
                break;
        }
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19d7
// Size: 0xd2
function door_system_init( triggername )
{
    buttons = getentarray( triggername, "targetname" );
    
    foreach ( button in buttons )
    {
        if ( isdefined( button.script_parameters ) )
        {
            button button_parse_parameters( button.script_parameters );
        }
        
        button door_setup();
    }
    
    foreach ( button in buttons )
    {
        button thread door_think();
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab1
// Size: 0x4bd
function door_setup()
{
    button = self;
    assertex( isdefined( button.target ), "<dev string:x1c>" );
    button.doors = [];
    button.hasbeenused = 0;
    
    if ( isdefined( button.script_index ) )
    {
        button.doormovetime = max( 0.1, float( button.script_index ) / 1000 );
    }
    
    targetents = getentarray( button.target, "targetname" );
    
    foreach ( ent in targetents )
    {
        if ( issubstr( ent.classname, "trigger" ) )
        {
            if ( !isdefined( button.trigblock ) )
            {
                button.trigblock = [];
            }
            
            if ( isdefined( ent.script_parameters ) )
            {
                ent trigger_parse_parameters( ent.script_parameters );
            }
            
            if ( isdefined( ent.script_linkto ) )
            {
                linked_door = getent( ent.script_linkto, "script_linkname" );
                ent enablelinkto();
                ent linkto( linked_door );
            }
            
            button.trigblock[ button.trigblock.size ] = ent;
            continue;
        }
        
        if ( ent.classname == "script_brushmodel" || ent.classname == "script_model" )
        {
            if ( isdefined( ent.script_noteworthy ) && issubstr( ent.script_noteworthy, "light" ) )
            {
                if ( issubstr( ent.script_noteworthy, "light_on" ) )
                {
                    if ( !isdefined( button.lights_on ) )
                    {
                        button.lights_on = [];
                    }
                    
                    ent hide();
                    button.lights_on[ button.lights_on.size ] = ent;
                }
                else if ( issubstr( ent.script_noteworthy, "light_off" ) )
                {
                    if ( !isdefined( button.lights_off ) )
                    {
                        button.lights_off = [];
                    }
                    
                    ent hide();
                    button.lights_off[ button.lights_off.size ] = ent;
                }
                else
                {
                    assertmsg( "<dev string:x5b>" + ent.script_noteworthy );
                }
            }
            else if ( ent.spawnflags & 2 )
            {
                if ( !isdefined( button.ai_sight_brushes ) )
                {
                    button.ai_sight_brushes = [];
                }
                
                ent notsolid();
                ent hide();
                button.ai_sight_brushes[ button.ai_sight_brushes.size ] = ent;
            }
            else
            {
                button.doors[ button.doors.size ] = ent;
            }
            
            continue;
        }
        
        if ( ent.classname == "script_origin" )
        {
            button.entsound = ent;
        }
    }
    
    if ( !isdefined( button.entsound ) && button.doors.size )
    {
        button.entsound = sortbydistance( button.doors, button.origin )[ 0 ];
    }
    
    foreach ( door in button.doors )
    {
        assertex( isdefined( door.target ), "<dev string:x8c>" );
        door.posclosed = door.origin;
        door.posopen = getstruct( door.target, "targetname" ).origin;
        door.distmove = distance( door.posopen, door.posclosed );
        door.no_moving_unresolved_collisions = 0;
        
        if ( !istrue( button.start_closed ) )
        {
            door.origin = door.posopen;
        }
        
        if ( isdefined( door.script_parameters ) )
        {
            door door_parse_parameters( door.script_parameters );
        }
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f76
// Size: 0xea
function door_think()
{
    button = self;
    startstate = ter_op( istrue( button.start_closed ), 0, 2 );
    button door_state_change( startstate, 1 );
    
    while ( true )
    {
        button.statedone = undefined;
        button.stateinterrupted = undefined;
        button waittill_any_2( "door_state_done", "door_state_interrupted" );
        
        if ( isdefined( button.statedone ) && button.statedone )
        {
            statenext = button door_state_next( button.statecurr );
            button door_state_change( statenext, 0 );
            continue;
        }
        
        if ( isdefined( button.stateinterrupted ) && button.stateinterrupted )
        {
            button door_state_change( 4, 0 );
            continue;
        }
        
        assertmsg( "<dev string:xcf>" );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2068
// Size: 0x9b
function door_state_next( state )
{
    button = self;
    statenext = undefined;
    
    if ( state == 0 )
    {
        statenext = 3;
    }
    else if ( state == 2 )
    {
        statenext = 1;
    }
    else if ( state == 1 )
    {
        statenext = 0;
    }
    else if ( state == 3 )
    {
        statenext = 2;
    }
    else if ( state == 4 )
    {
        assertex( isdefined( button.stateprev ), "<dev string:x10f>" );
        statenext = button.stateprev;
    }
    else
    {
        assertmsg( "<dev string:x164>" + state );
    }
    
    return statenext;
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x210c
// Size: 0xb36
function door_state_update( nosound )
{
    button = self;
    button endon( "door_state_interrupted" );
    button.statedone = undefined;
    
    if ( button.statecurr == 0 || button.statecurr == 2 )
    {
        if ( !nosound )
        {
            foreach ( door in button.doors )
            {
                if ( isdefined( door.stop_sound ) )
                {
                    door stoploopsound();
                    door playsoundonmovingent( door.stop_sound );
                }
            }
        }
        
        if ( isdefined( button.lights_on ) )
        {
            foreach ( light in button.lights_on )
            {
                light show();
            }
        }
        
        foreach ( door in button.doors )
        {
            if ( button.statecurr == 0 )
            {
                if ( isdefined( button.ai_sight_brushes ) )
                {
                    foreach ( var_e7fe58b8bf035286 in button.ai_sight_brushes )
                    {
                        var_e7fe58b8bf035286 show();
                    }
                }
                
                if ( door.spawnflags & 1 )
                {
                }
            }
            else
            {
                if ( isdefined( button.ai_sight_brushes ) )
                {
                    foreach ( var_e7fe58b8bf035286 in button.ai_sight_brushes )
                    {
                        var_e7fe58b8bf035286 hide();
                    }
                }
                
                if ( door.spawnflags & 1 )
                {
                    if ( isdefined( door.script_noteworthy ) && door.script_noteworthy == "always_disconnect" )
                    {
                    }
                }
            }
            
            if ( isdefined( door.script_noteworthy ) )
            {
                if ( door.script_noteworthy == "clockwise_wheel" || door.script_noteworthy == "counterclockwise_wheel" )
                {
                    door rotatevelocity( ( 0, 0, 0 ), 0.1 );
                }
            }
            
            if ( door.no_moving_unresolved_collisions )
            {
                door.unresolved_collision_func = undefined;
            }
        }
        
        isusable = !istrue( button.one_time_use ) || !button.hasbeenused;
        
        if ( isusable )
        {
            hintstring = ter_op( button.statecurr == 0, %MP/DOOR_USE_OPEN, %MP/DOOR_USE_CLOSE );
            button makeusable();
            
            if ( !scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
            {
                button sethintstring( hintstring );
            }
            
            button waittill( "trigger" );
            
            if ( isdefined( button.button_sound ) )
            {
                button playsound( button.button_sound );
            }
            
            button.hasbeenused = 1;
        }
        else
        {
            button waittill( "forever" );
        }
    }
    else if ( button.statecurr == 1 || button.statecurr == 3 )
    {
        if ( isdefined( button.lights_off ) )
        {
            foreach ( light in button.lights_off )
            {
                light show();
            }
        }
        
        button makeunusable();
        
        if ( button.statecurr == 1 )
        {
            button thread door_state_on_interrupt();
            
            foreach ( door in button.doors )
            {
                if ( isdefined( door.script_noteworthy ) )
                {
                    timemove = ter_op( isdefined( button.doormovetime ), button.doormovetime, 3 );
                    posgoal = ter_op( button.statecurr == 1, door.posclosed, door.posopen );
                    distremaining = distance( door.origin, posgoal );
                    time = max( 0.1, distremaining / door.distmove * timemove );
                    timeease = max( time * 0.25, 0.05 );
                    angulardistance = 360 * distremaining / 94.2;
                    
                    if ( door.script_noteworthy == "clockwise_wheel" )
                    {
                        door rotatevelocity( ( 0, 0, -1 * angulardistance / time ), time, timeease, timeease );
                        continue;
                    }
                    
                    if ( door.script_noteworthy == "counterclockwise_wheel" )
                    {
                        door rotatevelocity( ( 0, 0, angulardistance / time ), time, timeease, timeease );
                    }
                }
            }
        }
        else if ( button.statecurr == 3 )
        {
            if ( isdefined( button.open_interrupt ) && button.open_interrupt )
            {
                button thread door_state_on_interrupt();
            }
            
            foreach ( door in button.doors )
            {
                if ( isdefined( door.script_noteworthy ) )
                {
                    timemove = ter_op( isdefined( button.doormovetime ), button.doormovetime, 3 );
                    posgoal = ter_op( button.statecurr == 1, door.posclosed, door.posopen );
                    distremaining = distance( door.origin, posgoal );
                    time = max( 0.1, distremaining / door.distmove * timemove );
                    timeease = max( time * 0.25, 0.05 );
                    angulardistance = 360 * distremaining / 94.2;
                    
                    if ( door.script_noteworthy == "clockwise_wheel" )
                    {
                        door rotatevelocity( ( 0, 0, angulardistance / time ), time, timeease, timeease );
                        continue;
                    }
                    
                    if ( door.script_noteworthy == "counterclockwise_wheel" )
                    {
                        door rotatevelocity( ( 0, 0, -1 * angulardistance / time ), time, timeease, timeease );
                    }
                }
            }
        }
        
        wait 0.1;
        button childthread door_state_update_sound();
        timemove = ter_op( isdefined( button.doormovetime ), button.doormovetime, 3 );
        timemax = undefined;
        
        foreach ( door in button.doors )
        {
            posgoal = ter_op( button.statecurr == 1, door.posclosed, door.posopen );
            
            if ( door.origin != posgoal )
            {
                time = max( 0.1, distance( door.origin, posgoal ) / door.distmove * timemove );
                timeease = max( time * 0.25, 0.05 );
                door moveto( posgoal, time, timeease, timeease );
                door scripts\mp\movers::notify_moving_platform_invalid();
                
                if ( door.no_moving_unresolved_collisions )
                {
                    door.unresolved_collision_func = &scripts\mp\movers::unresolved_collision_void;
                }
                
                if ( !isdefined( timemax ) || time > timemax )
                {
                    timemax = time;
                }
            }
        }
        
        if ( isdefined( timemax ) )
        {
            wait timemax;
        }
    }
    else if ( button.statecurr == 4 )
    {
        foreach ( door in button.doors )
        {
            door moveto( door.origin, 0.05, 0, 0 );
            door scripts\mp\movers::notify_moving_platform_invalid();
            
            if ( door.no_moving_unresolved_collisions )
            {
                door.unresolved_collision_func = undefined;
            }
            
            if ( isdefined( door.script_noteworthy ) )
            {
                if ( door.script_noteworthy == "clockwise_wheel" || door.script_noteworthy == "counterclockwise_wheel" )
                {
                    door rotatevelocity( ( 0, 0, 0 ), 0.05 );
                }
            }
        }
        
        assertex( isdefined( button.stateprev ) && ( button.stateprev == 1 || button.stateprev == 3 ), "<dev string:x182>" );
        
        if ( isdefined( button.lights_off ) )
        {
            foreach ( light in button.lights_off )
            {
                light show();
            }
        }
        
        button.entsound stoploopsound();
        
        foreach ( door in button.doors )
        {
            if ( isdefined( door.interrupt_sound ) )
            {
                door playsound( door.interrupt_sound );
            }
        }
        
        wait 1;
    }
    else
    {
        assertmsg( "<dev string:x164>" + button.statecurr );
    }
    
    button.statedone = 1;
    
    foreach ( door in button.doors )
    {
        door.statedone = 1;
    }
    
    button notify( "door_state_done" );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c4a
// Size: 0x26b
function door_state_update_sound()
{
    button = self;
    var_b11324d10bc5b631 = 1;
    var_d1eab7ec60299bd1 = 1;
    sound_length = 0;
    
    if ( button.statecurr == 3 || button.statecurr == 1 )
    {
        foreach ( door in button.doors )
        {
            if ( isdefined( door.start_sound ) )
            {
                door playsoundonmovingent( door.start_sound );
                sound_length = lookupsoundlength( door.start_sound ) / 1000;
                var_b11324d10bc5b631 = 0;
            }
        }
        
        if ( var_b11324d10bc5b631 )
        {
            if ( !isdefined( button.entsound ) )
            {
                button.entsound = button;
            }
            
            if ( button.statecurr == 3 )
            {
                if ( soundexists( "scrpt_door_wood_double_open" ) )
                {
                    sound_length = lookupsoundlength( "scrpt_door_wood_double_open" ) / 1000;
                    playsoundatpos( button.entsound.origin, "scrpt_door_wood_double_open" );
                }
            }
            else if ( button.statecurr == 1 )
            {
                if ( soundexists( "scrpt_door_wood_double_close" ) )
                {
                    sound_length = lookupsoundlength( "scrpt_door_wood_double_close" ) / 1000;
                    playsoundatpos( button.entsound.origin, "scrpt_door_wood_double_close" );
                }
            }
        }
    }
    
    wait sound_length * 0.3;
    
    if ( button.statecurr == 3 || button.statecurr == 1 )
    {
        foreach ( door in button.doors )
        {
            if ( isdefined( door.loop_sound ) )
            {
                if ( door.loop_sound != "none" )
                {
                    door playloopsound( door.loop_sound );
                }
                
                var_d1eab7ec60299bd1 = 0;
            }
        }
        
        if ( var_d1eab7ec60299bd1 )
        {
            if ( soundexists( "" ) )
            {
                button.entsound playloopsound( "" );
            }
        }
    }
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ebd
// Size: 0x6f
function door_state_change( state, nosound )
{
    button = self;
    
    if ( isdefined( button.statecurr ) )
    {
        door_state_exit( button.statecurr );
        button.stateprev = button.statecurr;
    }
    
    button.statecurr = state;
    button thread door_state_update( nosound );
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f34
// Size: 0x18c
function door_state_exit( state )
{
    button = self;
    
    if ( state == 0 || state == 2 )
    {
        if ( isdefined( button.lights_on ) )
        {
            foreach ( light in button.lights_on )
            {
                light hide();
            }
        }
        
        return;
    }
    
    if ( state == 1 || state == 3 )
    {
        if ( isdefined( button.lights_off ) )
        {
            foreach ( light in button.lights_off )
            {
                light hide();
            }
        }
        
        button.entsound stoploopsound();
        
        foreach ( door in button.doors )
        {
            if ( isdefined( door.loop_sound ) )
            {
                door stoploopsound();
            }
        }
        
        return;
    }
    
    if ( state == 4 )
    {
        return;
    }
    
    assertmsg( "<dev string:x164>" + state );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30c8
// Size: 0x140
function door_state_on_interrupt()
{
    button = self;
    button endon( "door_state_done" );
    
    if ( !isdefined( button.trigblock ) )
    {
        return;
    }
    
    filtered_triggers = [];
    
    foreach ( trigger in button.trigblock )
    {
        if ( button.statecurr == 1 )
        {
            if ( isdefined( trigger.not_closing ) && trigger.not_closing == 1 )
            {
                continue;
            }
        }
        else if ( button.statecurr == 3 )
        {
            if ( isdefined( trigger.not_opening ) && trigger.not_opening == 1 )
            {
                continue;
            }
        }
        
        filtered_triggers[ filtered_triggers.size ] = trigger;
    }
    
    if ( filtered_triggers.size > 0 )
    {
        interrupter = button waittill_any_triggered_return_triggerer( filtered_triggers );
        
        if ( !isdefined( interrupter.fauxdead ) || interrupter.fauxdead == 0 )
        {
            button.stateinterrupted = 1;
            button notify( "door_state_interrupted" );
        }
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3210
// Size: 0x77
function waittill_any_triggered_return_triggerer( triggers )
{
    button = self;
    
    foreach ( trigger in triggers )
    {
        button thread return_triggerer( trigger );
    }
    
    button waittill( "interrupted" );
    return button.interrupter;
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3290
// Size: 0x102
function return_triggerer( trigger )
{
    button = self;
    button endon( "door_state_done" );
    button endon( "interrupted" );
    
    while ( true )
    {
        trigger waittill( "trigger", ent );
        
        if ( isdefined( trigger.prone_only ) && trigger.prone_only == 1 )
        {
            if ( isplayer( ent ) )
            {
                stance = ent getstance();
                
                if ( stance != "prone" )
                {
                    continue;
                }
                else
                {
                    var_5074d4cee390d757 = vectornormalize( anglestoforward( ent.angles ) );
                    var_40d98d9c533fd919 = vectornormalize( trigger.origin - ent.origin );
                    dot = vectordot( var_5074d4cee390d757, var_40d98d9c533fd919 );
                    
                    if ( dot > 0 )
                    {
                        continue;
                    }
                }
            }
        }
        
        break;
    }
    
    button.interrupter = ent;
    button notify( "interrupted" );
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x339a
// Size: 0x17d
function button_parse_parameters( parameters )
{
    button = self;
    button.button_sound = undefined;
    
    if ( !isdefined( parameters ) )
    {
        parameters = "";
    }
    
    params = strtok( parameters, ";" );
    
    foreach ( param in params )
    {
        toks = strtok( param, "=" );
        
        if ( toks.size != 2 )
        {
            continue;
        }
        
        if ( toks[ 1 ] == "undefined" || toks[ 1 ] == "default" )
        {
            button.params[ toks[ 0 ] ] = undefined;
            continue;
        }
        
        switch ( toks[ 0 ] )
        {
            case #"hash_1e106e4c46349825":
                button.open_interrupt = string_to_bool( toks[ 1 ] );
                break;
            case #"hash_6b61f3acb03c8ba1":
                button.button_sound = toks[ 1 ];
                break;
            case #"hash_4f3615defbb56240":
                button.start_closed = string_to_bool( toks[ 1 ] );
                break;
            case #"hash_cf9b0fd30cea035":
                button.one_time_use = string_to_bool( toks[ 1 ] );
                break;
            default:
                break;
        }
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x351f
// Size: 0x21e
function door_parse_parameters( parameters )
{
    door = self;
    door.start_sound = undefined;
    door.stop_sound = undefined;
    door.loop_sound = undefined;
    door.interrupt_sound = undefined;
    
    if ( !isdefined( parameters ) )
    {
        parameters = "";
    }
    
    params = strtok( parameters, ";" );
    
    foreach ( param in params )
    {
        toks = strtok( param, "=" );
        
        if ( toks.size != 2 )
        {
            continue;
        }
        
        if ( toks[ 1 ] == "undefined" || toks[ 1 ] == "default" )
        {
            door.params[ toks[ 0 ] ] = undefined;
            continue;
        }
        
        switch ( toks[ 0 ] )
        {
            case #"hash_5c3e74aaa13bc78d":
                door.stop_sound = toks[ 1 ];
                break;
            case #"hash_9e73d538861d053c":
                door.interrupt_sound = toks[ 1 ];
                break;
            case #"hash_78225775c0698cc3":
                door.loop_sound = toks[ 1 ];
                break;
            case #"hash_1e106e4c46349825":
                door.open_interrupt = string_to_bool( toks[ 1 ] );
                break;
            case #"hash_4d982a4c5ddaeacf":
                door.start_sound = toks[ 1 ];
                break;
            case #"hash_82406ab59ce5c4df":
                door.unresolved_collision_nodes = getnodearray( toks[ 1 ], "targetname" );
                break;
            case #"hash_16b31759aeac5f43":
                door.no_moving_unresolved_collisions = string_to_bool( toks[ 1 ] );
                break;
            case #"hash_edda8e2907d42dc0":
                door.material = toks[ 1 ];
                break;
            default:
                break;
        }
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3745
// Size: 0x153
function trigger_parse_parameters( parameters )
{
    trigger = self;
    
    if ( !isdefined( parameters ) )
    {
        parameters = "";
    }
    
    params = strtok( parameters, ";" );
    
    foreach ( param in params )
    {
        toks = strtok( param, "=" );
        
        if ( toks.size != 2 )
        {
            continue;
        }
        
        if ( toks[ 1 ] == "undefined" || toks[ 1 ] == "default" )
        {
            trigger.params[ toks[ 0 ] ] = undefined;
            continue;
        }
        
        switch ( toks[ 0 ] )
        {
            case #"hash_9d83eef6d488a45":
                trigger.not_opening = string_to_bool( toks[ 1 ] );
                break;
            case #"hash_5f7e7fdb9440ae8e":
                trigger.not_closing = string_to_bool( toks[ 1 ] );
                break;
            case #"hash_74a33663cf817e18":
                trigger.prone_only = string_to_bool( toks[ 1 ] );
                break;
            default:
                break;
        }
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38a0
// Size: 0x127
function bashmonitor()
{
    if ( self.islean || scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    self endon( "stateChanged" );
    self notify( "bashMonitor" );
    self endon( "bashMonitor" );
    thread monitordamage();
    
    while ( true )
    {
        self.doorcenter = self.origin + anglestoforward( self.angles ) * self.length * 0.5 + anglestoup( self.angles ) * self.height * 0.5;
        players = getplayersinradius( self.origin, 250 );
        
        if ( players.size > 0 )
        {
            foreach ( player in players )
            {
                if ( bashproxcheck( player ) && shouldbashopen( player ) )
                {
                    thread bashopen( player, player.origin );
                }
            }
            
            waitframe();
            continue;
        }
        
        wait 0.1;
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39cf
// Size: 0x40, Type: bool
function bashproxcheck( player )
{
    d = distancesquared( player.origin, self.doorcenter );
    range = 4900;
    return d < range;
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a18
// Size: 0x1af, Type: bool
function shouldbashopen( player )
{
    if ( !isreallyalive( player ) )
    {
        return false;
    }
    
    playerfwd = anglestoforward( player.angles );
    
    if ( within_fov( player.origin + playerfwd * -45, player.angles, self.doorcenter, cos( 43 ) ) )
    {
        doorright = anglestoright( self.angles );
        var_d3310de4c428a779 = vectornormalize( self.doorcenter - player geteye() );
        var_88516b40c2f83b3c = vectordot( playerfwd, var_d3310de4c428a779 );
        var_f77a6113861d6cfd = vectordot( playerfwd, doorright );
        playervelocity = player getvelocity();
        var_9b69954f476c76fe = vectordot( vectornormalize( playervelocity ), ( 0, 0, 1 ) );
        
        if ( ( length( playervelocity ) >= 200 || player scripts\mp\utility\killstreak::isjuggernaut() && length( playervelocity ) >= 140 ) && abs( var_9b69954f476c76fe ) < 0.75 && abs( var_f77a6113861d6cfd ) > 0.75 && var_88516b40c2f83b3c > 0.75 )
        {
            handletag = self gettagorigin( "tag_door_handle", 1 );
            
            if ( isdefined( handletag ) )
            {
                trace = scripts\engine\trace::ray_trace( player geteye(), handletag, player, level.doorcontentoverride, 0 );
                
                if ( isdefined( trace[ "entity" ] ) && trace[ "entity" ] == self )
                {
                    return true;
                }
            }
            else
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3bd0
// Size: 0x3fc
function bashopen( player, pos )
{
    thread checktriggeralarm( player );
    thread changestate( 5 );
    
    if ( istrue( self.bashed ) )
    {
        return;
    }
    
    if ( !isdefined( self.useprompt ) )
    {
        self.bashed = 1;
    }
    
    origin = self.origin;
    angles = self.angles;
    right = anglestoright( angles );
    normal = vectornormalize( pos - self.origin );
    dot = vectordot( right, normal );
    openleft = dot > 0;
    bash_yaw = undefined;
    
    if ( isdefined( player ) && isplayer( player ) )
    {
        if ( !isai( player ) )
        {
            thread bashpresentation( player );
        }
        else
        {
            self notify( "ai_opened" );
        }
    }
    
    if ( isdefined( self.material ) )
    {
        if ( self.material == "metal" )
        {
            playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_heavy_metal_single_bash" );
        }
        else if ( self.material == "wood" )
        {
            playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_barn_bash" );
        }
    }
    else
    {
        playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_double_bash" );
    }
    
    if ( openleft )
    {
        bash_yaw = self.baseangles[ 1 ] + self.max_yaw_left;
    }
    else
    {
        bash_yaw = self.baseangles[ 1 ] - self.max_yaw_right;
    }
    
    if ( bash_yaw > 360 )
    {
        bash_yaw -= 360;
    }
    else if ( bash_yaw < 0 )
    {
        bash_yaw += 360;
    }
    
    var_5e7a100369fafe1e = 0.35;
    var_11b200101076bc6c = 0.15;
    timefactor = math::normalize_value( 0, 170, bash_yaw );
    bashtime = math::factor_value( var_5e7a100369fafe1e, var_11b200101076bc6c, timefactor );
    current_angles = self.angles;
    current_yaw = current_angles[ 1 ];
    
    if ( current_yaw > 360 )
    {
        current_yaw -= 360;
    }
    else if ( current_yaw < 0 )
    {
        current_yaw += 360;
    }
    
    currentdiff = angle_diff( current_yaw, self.baseangles[ 1 ] );
    bashdiff = angle_diff( bash_yaw, self.baseangles[ 1 ] );
    currentfwd = anglestoforward( current_angles );
    baseright = anglestoright( self.baseangles );
    var_397e59a9937b07db = vectordot( currentfwd, baseright ) < 0;
    
    if ( openleft )
    {
        if ( !var_397e59a9937b07db )
        {
            bashdiff += currentdiff;
        }
        else
        {
            bashdiff -= currentdiff;
        }
    }
    else
    {
        if ( var_397e59a9937b07db )
        {
            bashdiff += currentdiff;
        }
        else
        {
            bashdiff -= currentdiff;
        }
        
        bashdiff *= -1;
    }
    
    var_41e917596d6bf09f = ( 0, bashdiff, 0 );
    self rotateby( var_41e917596d6bf09f, bashtime );
    wait bashtime;
    self.lastpushtime = gettime();
    thread changestate( 6 );
    
    if ( !isdefined( self.useprompt ) )
    {
        self.statecurr = 2;
        
        if ( !scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
        {
            self.trigger sethintstring( %MP/DOOR_USE_CLOSE );
        }
    }
    
    self.bashed = 0;
    var_b492b99eb62e16f2 = randomfloatrange( 3, 5 );
    var_6e09cabeb82b5356 = randomfloatrange( 0.25, 2.5 );
    
    if ( openleft )
    {
        var_6e09cabeb82b5356 *= -1;
    }
    
    self rotateyaw( var_6e09cabeb82b5356, var_b492b99eb62e16f2, 0.5, var_b492b99eb62e16f2 - 0.5 );
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fd4
// Size: 0x35
function bashpresentation( player )
{
    player playrumbleonentity( "grenade_rumble" );
    player earthquakeforplayer( 0.35, 0.5, player.origin, 200 );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4011
// Size: 0x231
function monitordamage()
{
    self endon( "stateChanged" );
    self notify( "monitorDamage" );
    self endon( "monitorDamage" );
    self setcandamage( 1 );
    damage = undefined;
    attacker = undefined;
    direction_vec = undefined;
    meansofdeath = undefined;
    modelname = undefined;
    tagname = undefined;
    partname = undefined;
    idflags = undefined;
    objweapon = undefined;
    origin = undefined;
    angles = undefined;
    normal = undefined;
    inflictor = undefined;
    
    while ( true )
    {
        self waittill( "damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor );
        
        if ( isdefined( meansofdeath ) )
        {
            if ( meansofdeath == "MOD_MELEE" )
            {
                if ( istrue( self.issaloonstyle ) )
                {
                    self.otherdoor thread bashopen( attacker, attacker.origin );
                }
                
                thread bashopen( attacker, attacker.origin );
                continue;
            }
            
            if ( meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE" )
            {
                ismolotov = isdefined( objweapon ) && isdefined( objweapon.basename ) && ( objweapon.basename == "molotov_mp" || objweapon.basename == "thermite_mp" || objweapon.basename == "thermite_ap_mp" || objweapon.basename == "thermite_av_mp" );
                
                if ( damage > 10 && !ismolotov )
                {
                    thread bashopen( inflictor, point );
                }
                
                continue;
            }
            
            if ( isdefined( objweapon ) && objweapon.basename == "pac_sentry_turret_mp" && ( meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH" ) )
            {
                thread bashopen( inflictor, point );
            }
        }
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x424a
// Size: 0x194
function openmonitor()
{
    self endon( "stateChanged" );
    
    if ( self.state == 7 || scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    if ( self.islean || false || true )
    {
        if ( !scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
        {
            self.useprompt sethintstring( %MP/DOOR_USE_OPEN );
        }
    }
    else if ( !scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
    {
        self.useprompt sethintstring( %MP/DOOR_USE_OPEN_DOUBLE );
    }
    
    self.useprompt sethintdisplayrange( 200 );
    
    while ( true )
    {
        self.useprompt waittill( "trigger_progress", player );
        
        if ( player meleebuttonpressed() )
        {
            continue;
        }
        
        if ( player isusingremote() )
        {
            continue;
        }
        
        buttontime = 0;
        
        while ( buttontime < 0.1 )
        {
            if ( !player usebuttonpressed() )
            {
                break;
            }
            
            buttontime += level.framedurationseconds;
            waitframe();
        }
        
        if ( self.state == 7 )
        {
            handletag = self gettagorigin( "tag_door_handle", 1 );
            
            if ( isdefined( handletag ) )
            {
                playsoundatpos( handletag, "door_locked" );
            }
            else
            {
                playsoundatpos( self.origin + ( 0, 0, 42 ), "door_locked" );
            }
            
            continue;
        }
        
        if ( self.islean )
        {
            thread cheapopen( player );
            return;
        }
        
        if ( -1 && player playerads() > 0.9 )
        {
            thread ajar( player );
            return;
        }
        
        thread cheapopen( player );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43e6
// Size: 0x2ac
function cheapopen( player )
{
    thread checktriggeralarm( player );
    origin = self.useprompt.origin;
    angles = self.angles;
    right = anglestoright( angles );
    normal = vectornormalize( player.origin - origin );
    dot = vectordot( right, normal );
    openleft = dot > 0;
    
    if ( isdefined( self.material ) )
    {
        if ( self.material == "metal" )
        {
            playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_heavy_metal_single_open" );
        }
        else if ( self.material == "wood" )
        {
            playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_barn_open" );
        }
    }
    else
    {
        playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_double_open" );
    }
    
    thread changestate( 3 );
    targetyaw = ter_op( openleft, self.max_yaw_left, self.max_yaw_right * -1 );
    openangles = ( self.baseangles[ 0 ], self.baseangles[ 1 ] + targetyaw, self.baseangles[ 2 ] );
    self rotateto( openangles, 0.666, 0, 0.333 );
    
    if ( isdefined( self.otherdoor ) && istrue( self.issaloonstyle ) )
    {
        targetyaw = ter_op( !openleft, self.otherdoor.max_yaw_left, self.otherdoor.max_yaw_right * -1 );
        openangles = ( self.otherdoor.baseangles[ 0 ], self.otherdoor.baseangles[ 1 ] + targetyaw, self.otherdoor.baseangles[ 2 ] );
        self.otherdoor rotateto( openangles, 0.666, 0, 0.333 );
    }
    
    wait 0.666;
    self.lastpushtime = gettime();
    thread changestate( 2 );
    
    if ( isdefined( self.otherdoor ) && istrue( self.issaloonstyle ) )
    {
        self.otherdoor thread changestate( 2 );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x469a
// Size: 0x1eb
function ajar( player )
{
    thread checktriggeralarm( player );
    thread changestate( 6 );
    origin = self.useprompt.origin;
    angles = self.angles;
    right = anglestoright( angles );
    normal = vectornormalize( player.origin - origin );
    dot = vectordot( right, normal );
    openleft = dot > 0;
    time = 0.5;
    yaw_angle = ter_op( openleft, 15, -15 );
    player playrumbleonentity( "damage_heavy" );
    
    if ( isdefined( self.material ) )
    {
        if ( self.material == "metal" )
        {
            playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_heavy_metal_single_start_peek" );
        }
        else if ( self.material == "wood" )
        {
            playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_barn_start_peek" );
        }
    }
    else
    {
        playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_double_start_peek" );
    }
    
    self rotateyaw( yaw_angle, time, time * 0.25, time * 0.75 );
    
    if ( isdefined( self.otherdoor ) && istrue( self.issaloonstyle ) )
    {
        self.otherdoor thread changestate( 6 );
        yaw_angle = ter_op( !openleft, 15, -15 );
        self.otherdoor rotateyaw( yaw_angle, time, time * 0.25, time * 0.75 );
    }
    
    self.lastpushtime = gettime();
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x488d
// Size: 0xeb
function pushmonitor()
{
    if ( self.islean )
    {
        return;
    }
    
    self endon( "stateChanged" );
    self notify( "pushMonitor" );
    self endon( "pushMonitor" );
    wait 0.5;
    
    while ( true )
    {
        players = getplayersinradius( self.origin, 250 );
        
        if ( players.size > 0 )
        {
            foreach ( player in players )
            {
                if ( pushproxcheck( player ) )
                {
                    push( player );
                    self.lastpushtime = gettime();
                    door_destroynavobstacle();
                }
            }
        }
        
        if ( isdefined( self.lastpushtime ) && gettime() > self.lastpushtime + 2000 )
        {
            door_createnavobstacle();
        }
        
        waitframe();
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4980
// Size: 0xdc, Type: bool
function pushproxcheck( player )
{
    self.doorcenter = self.origin + anglestoforward( self.angles ) * self.length * 0.5 + anglestoup( self.angles ) * self.height * 0.5;
    
    if ( player.origin[ 2 ] > self.origin[ 2 ] + self.height || player.origin[ 2 ] + 70 < self.origin[ 2 ] )
    {
        return false;
    }
    
    d = distance2dsquared( player.origin, self.doorcenter );
    range = 900;
    return d < range;
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a65
// Size: 0x272
function push( player )
{
    max_dist = 26;
    min_dist = 0;
    max_push = 25;
    endpoint = self.origin + anglestoforward( self.angles ) * 28;
    dist = distance2d( player.origin, endpoint );
    percent = math::normalize_value( min_dist, max_dist, dist );
    amount = max_push * ( 1 - percent );
    
    if ( amount == 0 )
    {
        return;
    }
    
    origin = self.useprompt.origin;
    angles = self.angles;
    right = anglestoright( angles );
    normal = vectornormalize( player.origin - origin );
    dot = vectordot( right, normal );
    openleft = dot > 0;
    currentyaw = self.angles[ 1 ];
    isright = ter_op( openleft == 1, 1, -1 );
    target_yaw = currentyaw + amount * isright;
    angle_diff = angle_diff( target_yaw, self.baseangles[ 1 ] );
    
    if ( openleft )
    {
        if ( angle_diff > self.max_yaw_left )
        {
            self.debug_activity = "Pushed to max left yaw of " + self.max_yaw_left;
            self.angles = ( self.angles[ 0 ], self.baseangles[ 1 ] + self.max_yaw_left, self.angles[ 2 ] );
            return;
        }
    }
    else if ( angle_diff > self.max_yaw_right )
    {
        self.debug_activity = "Pushed to max right yaw of " + self.max_yaw_right;
        self.angles = ( self.angles[ 0 ], self.baseangles[ 1 ] - self.max_yaw_right, self.angles[ 2 ] );
        return;
    }
    
    /#
        self.debug_activity = "<dev string:x1cf>" + target_yaw;
    #/
    
    self.angles = ( self.angles[ 0 ], target_yaw, self.angles[ 2 ] );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cdf
// Size: 0xa9
function autoclosemonitor()
{
    if ( self.islean )
    {
        return;
    }
    
    self endon( "stateChanged" );
    self notify( "autoCloseMonitor" );
    self endon( "autoCloseMonitor" );
    wait 0.5;
    
    while ( true )
    {
        if ( angle_diff( self.angles[ 1 ], self.baseangles[ 1 ] ) < 40 )
        {
            if ( isdefined( self.lastpushtime ) && gettime() > self.lastpushtime + 3000 )
            {
                players = getplayersinradius( self.origin, 250 );
                
                if ( players.size == 0 )
                {
                    thread closedoor( 1 );
                }
            }
        }
        
        waitframe();
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d90
// Size: 0x2a9
function changestate( newstate )
{
    if ( !isdefined( self.useprompt ) )
    {
        return;
    }
    
    switch ( self.state )
    {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            if ( isdefined( self.useprompt ) )
            {
                self.useprompt sethinticon( "icon_door_unlocked" );
            }
            
            break;
        case 8:
            break;
    }
    
    self.state = newstate;
    self notify( "stateChanged" );
    
    switch ( newstate )
    {
        case 0:
            door_destroynavobstacle();
            door_disableaudioportal();
            thread openmonitor();
            thread bashmonitor();
            thread lockmonitor();
            thread alarmmonitor();
            thread ajarmonitor();
            break;
        case 1:
            door_destroynavobstacle();
            break;
        case 2:
            door_createnavobstacle();
            door_enableaudioportal();
            thread closemonitor();
            thread bashmonitor();
            break;
        case 3:
            door_destroynavobstacle();
            door_enableaudioportal();
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            door_enableaudioportal();
            thread closemonitor();
            thread pushmonitor();
            thread bashmonitor();
            thread autoclosemonitor();
            break;
        case 7:
            if ( isdefined( self.useprompt ) )
            {
                self.useprompt sethintdisplayrange( 300 );
                self.useprompt sethinticon( "icon_door_locked" );
                self.useprompt sethintstring( %MP/DOOR_USE_LOCKED );
            }
            
            thread openmonitor();
            thread breachmonitor();
            break;
        case 8:
            thread openmonitor();
            thread bashmonitor();
            thread removealarmmonitor();
            thread disownalarmmonitor();
            break;
    }
    
    thread updatelockpromptvisibility();
    thread updatealarmpromptvisibility();
    
    if ( isdefined( self.otherdoor ) )
    {
        self.otherdoor thread updatealarmpromptvisibility();
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5041
// Size: 0x9a
function updatestate()
{
    switch ( self.state )
    {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            break;
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50e3
// Size: 0xfa
function closemonitor()
{
    self endon( "stateChanged" );
    
    if ( scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    self.useprompt makeusable();
    
    if ( !scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() )
    {
        self.useprompt sethintstring( %MP/DOOR_USE_CLOSE );
    }
    
    self.useprompt sethintdisplayrange( 200 );
    self.useprompt sethintdisplayfov( 120 );
    self.useprompt setuserange( 125 );
    self.useprompt setusefov( 120 );
    
    while ( true )
    {
        self.useprompt waittill( "trigger_progress", player );
        
        if ( player meleebuttonpressed() )
        {
            continue;
        }
        
        if ( player isusingremote() )
        {
            continue;
        }
        
        buttontime = 0;
        
        while ( buttontime < 0.1 )
        {
            if ( !player usebuttonpressed() )
            {
                break;
            }
            
            buttontime += level.framedurationseconds;
            waitframe();
        }
        
        thread closedoor();
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51e5
// Size: 0x1e9
function closedoor( var_c81f097ebbbed511 )
{
    if ( isdefined( self.material ) )
    {
        if ( self.material == "metal" )
        {
            playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_heavy_metal_single_close" );
        }
        else if ( self.material == "wood" )
        {
            playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_barn_close" );
        }
    }
    else
    {
        playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_double_close" );
    }
    
    thread changestate( 1 );
    closeduration = 0.666;
    
    if ( istrue( var_c81f097ebbbed511 ) )
    {
        closeduration *= 3;
    }
    
    self rotateto( self.baseangles, closeduration, 0, 0.333 );
    
    if ( isdefined( self.otherdoor ) && istrue( self.issaloonstyle ) )
    {
        self.otherdoor rotateto( self.otherdoor.baseangles, closeduration, 0, 0.333 );
    }
    
    wait closeduration;
    waitframe();
    
    if ( angle_diff( self.angles[ 1 ], self.baseangles[ 1 ] ) < 1 )
    {
        thread changestate( 0 );
    }
    else
    {
        thread changestate( 6 );
    }
    
    if ( isdefined( self.otherdoor ) && istrue( self.issaloonstyle ) )
    {
        if ( angle_diff( self.otherdoor.angles[ 1 ], self.otherdoor.baseangles[ 1 ] ) < 1 )
        {
            self.otherdoor thread changestate( 0 );
            return;
        }
        
        self.otherdoor thread changestate( 6 );
    }
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53d6
// Size: 0x26
function angle_diff( value1, value2 )
{
    return 180 - abs( abs( value1 - value2 ) - 180 );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5405
// Size: 0x25d
function amortizeyawtraces()
{
    level.doorphase = 0;
    level.doortracequeue = 0;
    var_cdf4a830ecf21001 = [];
    var_438903624c7ec6c9 = [];
    level.doortracemetrics = spawnstruct();
    level.doortracemetrics.doorcount = level.doors.size;
    level.doortracemetrics.totaltracecount = 0;
    level.doortracemetrics.tracecountbyphase = [];
    level.doortracemetrics.tracetimebyphase = [];
    level.doortracemetrics.totaltime = 0;
    level.doortracemetrics.totalwaitframes = 0;
    level.waitcycles = 0;
    level.doortraces = 0;
    waitframe();
    level.doortracemetrics.totaltime = gettime();
    var_438903624c7ec6c9[ 0 ] = level.doortracemetrics.totaltime;
    
    while ( true )
    {
        if ( level.doortracequeue == 0 )
        {
            currenttime = gettime();
            var_438903624c7ec6c9[ level.doorphase ] = currenttime - var_438903624c7ec6c9[ level.doorphase ];
            var_cdf4a830ecf21001[ level.doorphase ] = level.doortraces;
            level.doortracemetrics.totaltracecount += level.doortraces;
            level.doortraces = 0;
            level.doortracemetrics.totalwaitframes += level.waitcycles;
            level.waitcycles = 0;
            level.doorphase++;
            level notify( "advance_door_trace" );
            
            if ( level.doorphase < 3 )
            {
                var_438903624c7ec6c9[ level.doorphase ] = currenttime;
            }
            else
            {
                break;
            }
        }
        
        waitframe();
    }
    
    level.doortracemetrics.totaltime = gettime() - level.doortracemetrics.totaltime;
    level.doortracemetrics.tracecountbyphase = var_cdf4a830ecf21001;
    level.doortracemetrics.tracetimebyphase = var_438903624c7ec6c9;
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x566a
// Size: 0x15
function get_max_yaws()
{
    thread get_max_yaw( 1 );
    thread get_max_yaw( 0 );
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5687
// Size: 0xf8
function get_max_yaw( left )
{
    if ( left )
    {
        if ( isdefined( self.script_max_left_angle ) )
        {
            self.max_yaw_left = self.script_max_left_angle;
            return;
        }
    }
    else if ( isdefined( self.script_max_right_angle ) )
    {
        self.max_yaw_right = self.script_max_right_angle;
        return;
    }
    
    testyaw = 90;
    testincrement = 10;
    safeyaw = 0;
    
    while ( level.doorphase < 3 )
    {
        safeyaw = get_max_yaw_internal( testyaw, testincrement, left );
        
        if ( left )
        {
            self.max_yaw_left = safeyaw;
        }
        else
        {
            self.max_yaw_right = safeyaw;
        }
        
        if ( safeyaw == 100 )
        {
            break;
        }
        
        testincrement *= 0.5;
        testyaw = safeyaw + testincrement;
        level waittill( "advance_door_trace" );
    }
    
    safeyaw = max( safeyaw, 90 );
    
    if ( left )
    {
        self.max_yaw_left = safeyaw;
        return;
    }
    
    self.max_yaw_right = safeyaw;
}

// Namespace door / scripts\mp\door
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5787
// Size: 0x1a7
function get_max_yaw_internal( test_yaw, increment, left )
{
    if ( !isdefined( self.traces ) )
    {
        self.traces = 0;
    }
    
    if ( !isdefined( level.doortraces ) )
    {
        level.doortraces = 0;
    }
    
    failed_once = 0;
    finished = 0;
    level.doortracequeue++;
    waitframe();
    
    while ( !finished )
    {
        if ( test_yaw > 100 )
        {
            level.currentdoor = undefined;
            level.doortracequeue--;
            return 100;
        }
        
        while ( isdefined( level.currentdoor ) && self != level.currentdoor )
        {
            waitframe();
        }
        
        if ( !isdefined( level.currentdoor ) )
        {
            level.currentdoor = self;
        }
        
        safe_yaw = yaw_collision_check( test_yaw, increment, left );
        
        if ( safe_yaw )
        {
            if ( failed_once )
            {
                finish = 1;
            }
            
            test_yaw += increment;
        }
        else
        {
            if ( !failed_once )
            {
                failed_once = 1;
            }
            
            test_yaw -= increment;
            finished = 1;
        }
        
        self.traces++;
        level.doortraces++;
        currenttime = gettime();
        
        if ( !isdefined( level.doortraceframetime ) || level.doortraceframetime != currenttime )
        {
            level.doortraceframetime = currenttime;
            level.doortracesthisframe = 0;
        }
        
        level.doortracesthisframe++;
        
        if ( level.doortracesthisframe == 3 )
        {
            level.doortracesthisframe = 0;
            level.waitcycles++;
            waitframe();
        }
    }
    
    level.currentdoor = undefined;
    level.doortracequeue--;
    return test_yaw;
}

// Namespace door / scripts\mp\door
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5937
// Size: 0x1ef, Type: bool
function yaw_collision_check( yaw, increment, left )
{
    if ( !left )
    {
        yaw *= -1;
    }
    
    trace_angles = self.baseangles + ( 0, yaw, 0 );
    basestart = self.origin + ( 0, 0, 8 );
    testheight = self.height - 8 * 2;
    doorfwd = anglestoforward( trace_angles );
    doorright = anglestoright( trace_angles );
    
    if ( left )
    {
        doorright *= -1;
    }
    
    start = basestart + doorfwd * self.length * 0.2;
    end = basestart + doorfwd * ( self.length - 2 );
    trace = scripts\engine\trace::capsule_trace( start, end, 2, testheight, trace_angles, ter_op( isdefined( self.clip ), [ self, self.clip ], [ self ] ), level.doorcontentoverride, 0 );
    
    if ( getdvarint( @"hash_6985e82f27803483" ) )
    {
        color = ( 1, 1, 1 );
        
        if ( trace[ "fraction" ] == 1 )
        {
            color = ( 0, 1, 0 );
        }
        else
        {
            color = ( 1, 0, 0 );
        }
        
        thread drawline( start, end, 600, color );
        thread drawline( start + ( 0, 0, testheight ), end + ( 0, 0, testheight ), 600, color );
        thread drawline( start, start + ( 0, 0, testheight ), 600, color );
        thread drawline( end, end + ( 0, 0, testheight ), 600, color );
    }
    
    return trace[ "fraction" ] == 1;
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b2f
// Size: 0x117
function perk_doorsensethink()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        foreach ( door in level.doors )
        {
            if ( door.state != 0 )
            {
                continue;
            }
            
            if ( isdefined( level.playerswithdoorsense ) && level.playerswithdoorsense <= 0 )
            {
                continue;
            }
            
            var_b0aeb7fba823276f = getplayersinradius( door.origin, 128 );
            
            if ( var_b0aeb7fba823276f.size == 0 )
            {
                continue;
            }
            
            foreach ( player in var_b0aeb7fba823276f )
            {
                if ( player _hasperk( "specialty_door_sense" ) )
                {
                    perk_doorsense_outlinedoor( player, var_b0aeb7fba823276f, door );
                }
            }
        }
        
        wait 0.1;
    }
}

// Namespace door / scripts\mp\door
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5c4e
// Size: 0x110
function perk_doorsense_outlinedoor( var_dadbe427bdd6c4d, var_b0aeb7fba823276f, door )
{
    enemies = [];
    
    foreach ( player in var_b0aeb7fba823276f )
    {
        if ( player.team != var_dadbe427bdd6c4d.team )
        {
            enemies[ enemies.size ] = player;
        }
    }
    
    if ( enemies.size == 0 )
    {
        return;
    }
    
    foreach ( enemy in enemies )
    {
        if ( perk_doorsense_othersideofdoorcheck( var_dadbe427bdd6c4d, enemy, door ) )
        {
            outlineid = scripts\mp\utility\outline::outlineenableforplayer( door, var_dadbe427bdd6c4d, "outline_nodepth_orange", "equipment" );
            thread perk_doorsense_trackoutlinedisable( outlineid, door );
        }
    }
}

// Namespace door / scripts\mp\door
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5d66
// Size: 0x10e
function perk_doorsense_outlineenemies( var_dadbe427bdd6c4d, var_b0aeb7fba823276f, door )
{
    enemies = [];
    
    foreach ( player in var_b0aeb7fba823276f )
    {
        if ( player.team != var_dadbe427bdd6c4d.team )
        {
            enemies[ enemies.size ] = player;
        }
    }
    
    if ( enemies.size == 0 )
    {
        return;
    }
    
    foreach ( enemy in enemies )
    {
        if ( perk_doorsense_othersideofdoorcheck( var_dadbe427bdd6c4d, enemy, door ) )
        {
            outlineid = scripts\mp\utility\outline::outlineenableforplayer( enemy, var_dadbe427bdd6c4d, "outline_nodepth_orange", "equipment" );
            thread perk_doorsense_trackoutlinedisable( outlineid, enemy );
        }
    }
}

// Namespace door / scripts\mp\door
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5e7c
// Size: 0xc9, Type: bool
function perk_doorsense_othersideofdoorcheck( player1, player2, door )
{
    var_6555b4d96764d0bb = vectornormalize( anglestoright( door.angles ) );
    var_8711ec2c9d549d05 = vectornormalize( player1.origin - door.origin );
    var_a663fe911064ac1c = vectornormalize( player2.origin - door.origin );
    dotplayer1 = vectordot( var_6555b4d96764d0bb, var_8711ec2c9d549d05 );
    dotplayer2 = vectordot( var_6555b4d96764d0bb, var_a663fe911064ac1c );
    
    if ( dotplayer1 > 0 && dotplayer2 < 0 || dotplayer1 < 0 && dotplayer2 > 0 )
    {
        return true;
    }
    
    return false;
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5f4e
// Size: 0x22
function perk_doorsense_trackoutlinedisable( outlineid, player )
{
    wait 0.2;
    scripts\mp\utility\outline::outlinedisable( outlineid, player );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f78
// Size: 0x56
function onplayerspawned()
{
    var_66ee62bfcef7c9e5 = _hasperk( "specialty_door_breach" ) || getdvarint( @"hash_b75e6afff090e790", 0 ) == 1;
    scripts\mp\door::updatealldoorslockvisibilityforplayer( self, var_66ee62bfcef7c9e5 );
    var_1e635a556969499b = _hasperk( "specialty_door_alarm" );
    scripts\mp\door::updatealldoorsalarmvisibilityforplayer( self, var_1e635a556969499b );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fd6
// Size: 0x9e
function updatelockpromptvisibility()
{
    if ( scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    while ( !isdefined( level.players ) )
    {
        waitframe();
    }
    
    foreach ( player in level.players )
    {
        var_66ee62bfcef7c9e5 = player _hasperk( "specialty_door_breach" ) || getdvarint( @"hash_b75e6afff090e790", 0 ) == 1;
        updatelockpromptvisibilityforplayer( player, var_66ee62bfcef7c9e5 );
    }
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x607c
// Size: 0x69
function updatealldoorslockvisibilityforplayer( player, var_66ee62bfcef7c9e5 )
{
    foreach ( door in level.doors )
    {
        door updatelockpromptvisibilityforplayer( player, var_66ee62bfcef7c9e5 );
    }
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x60ed
// Size: 0x108
function updatelockpromptvisibilityforplayer( player, visibility )
{
    if ( !isdefined( self.lockprompt ) )
    {
        return;
    }
    
    statecheck = self.state == 0 || self.state == 7;
    
    if ( statecheck && isdefined( self.otherdoor ) )
    {
        statecheck = self.otherdoor.state == 0 || self.otherdoor.state == 7;
    }
    
    if ( !istrue( self.breaching ) && statecheck )
    {
        if ( visibility )
        {
            self.lockprompt showtoplayer( player );
            self.lockprompt enableplayeruse( player );
        }
        else
        {
            self.lockprompt hidefromplayer( player );
            self.lockprompt disableplayeruse( player );
        }
        
        return;
    }
    
    self.lockprompt hidefromplayer( player );
    self.lockprompt disableplayeruse( player );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61fd
// Size: 0xd9
function lockmonitor()
{
    if ( !isdefined( self.lockprompt ) || self.islean || scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    self endon( "stateChanged" );
    
    if ( isdefined( self.otherdoor ) )
    {
        while ( self.otherdoor.state != 0 )
        {
            waitframe();
        }
    }
    
    self.lockprompt sethintstring( %MP/DOOR_USE_LOCK );
    self.lockprompt setuseholdduration( "duration_medium" );
    updatelockpromptvisibility();
    
    while ( true )
    {
        self.lockprompt waittill( "trigger", player );
        
        if ( !isreallyalive( player ) )
        {
            continue;
        }
        
        if ( player meleebuttonpressed() )
        {
            continue;
        }
        
        if ( player isusingremote() )
        {
            continue;
        }
        
        thread lockdoor();
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62de
// Size: 0x2c
function lockdoor()
{
    thread changestate( 7 );
    
    if ( isdefined( self.otherdoor ) )
    {
        self.otherdoor thread changestate( 7 );
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6312
// Size: 0x88
function updatealarmpromptvisibility()
{
    if ( scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    while ( !isdefined( level.players ) )
    {
        waitframe();
    }
    
    foreach ( player in level.players )
    {
        var_1e635a556969499b = player _hasperk( "specialty_door_alarm" );
        updatealarmpromptsvisibilityforplayer( player, var_1e635a556969499b );
    }
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x63a2
// Size: 0x69
function updatealldoorsalarmvisibilityforplayer( player, var_1e635a556969499b )
{
    foreach ( door in level.doors )
    {
        door updatealarmpromptsvisibilityforplayer( player, var_1e635a556969499b );
    }
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6413
// Size: 0x128
function updatealarmpromptsvisibilityforplayer( player, canseeprompt )
{
    if ( !isdefined( self.alarmprompts ) )
    {
        return;
    }
    
    foreach ( alarmprompt in self.alarmprompts )
    {
        visiblestate = canseeprompt && self.state == 0 || self.state == 8 && isdefined( self.dooralarmprompt ) && alarmprompt == self.dooralarmprompt;
        
        if ( visiblestate && isdefined( self.otherdoor ) )
        {
            visiblestate = canseeprompt && self.otherdoor.state == 0 || self.state == 8 && alarmprompt == self.dooralarmprompt;
        }
        
        if ( visiblestate )
        {
            alarmprompt showtoplayer( player );
            alarmprompt enableplayeruse( player );
            continue;
        }
        
        alarmprompt hidefromplayer( player );
        alarmprompt disableplayeruse( player );
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6543
// Size: 0xff
function alarmmonitor()
{
    if ( self.islean || scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    self endon( "stateChanged" );
    
    if ( isdefined( self.otherdoor ) )
    {
        while ( self.otherdoor.state != 0 )
        {
            waitframe();
        }
    }
    
    foreach ( alarmprompt in self.alarmprompts )
    {
        alarmprompt sethintstring( %MP/DOOR_USE_ALARM );
        alarmprompt setuseholdduration( "duration_medium" );
    }
    
    updatealarmpromptvisibility();
    
    foreach ( alarmprompt in self.alarmprompts )
    {
        thread _alarmmonitorinternal( alarmprompt );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x664a
// Size: 0x6f
function _alarmmonitorinternal( alarmprompt )
{
    self endon( "stateChanged" );
    
    while ( true )
    {
        alarmprompt waittill( "trigger", player );
        
        if ( self.state != 0 )
        {
            continue;
        }
        
        if ( !isreallyalive( player ) )
        {
            continue;
        }
        
        if ( player meleebuttonpressed() )
        {
            continue;
        }
        
        if ( player isusingremote() )
        {
            continue;
        }
        
        thread alarmdoor( player, alarmprompt );
    }
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66c1
// Size: 0x18a
function alarmdoor( alarmowner, alarmprompt )
{
    doorpos = self gettagorigin( "tag_door_handle" );
    playsoundatpos( alarmprompt.origin, "mp_door_alarm_on" );
    self.dooralarment = spawn( "script_model", alarmprompt.origin );
    self.dooralarment setmodel( "shardball_wm" );
    self.dooralarment.angles = self.angles;
    self.dooralarment linkto( self );
    self.dooralarment setentityowner( alarmowner );
    self.dooralarment setotherent( alarmowner );
    self.dooralarment setscriptablepartstate( "effects", "planted", 0 );
    self.dooralarmowner = alarmowner;
    self.dooralarmprompt = alarmprompt;
    self.dooralarmowner.alarmeddoors = array_add( self.dooralarmowner.alarmeddoors, self );
    
    while ( self.dooralarmowner.alarmeddoors.size > 3 )
    {
        var_3ac146be30c82b22 = self.dooralarmowner.alarmeddoors[ 0 ];
        var_3ac146be30c82b22 removealarmdoor( 0 );
    }
    
    thread changestate( 8 );
    
    if ( isdefined( self.otherdoor ) )
    {
        self.otherdoor thread changestate( 8 );
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6853
// Size: 0x132
function removealarmmonitor()
{
    if ( !isdefined( self.dooralarmprompt ) || self.islean || scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    self endon( "stateChanged" );
    
    if ( isdefined( self.otherdoor ) )
    {
        while ( self.otherdoor.state != 8 )
        {
            waitframe();
        }
    }
    
    self.dooralarmprompt sethintstring( %MP/DOOR_USE_REMOVE_ALARM );
    self.dooralarmprompt setuseholdduration( "duration_medium" );
    self.dooralarmprompt.owner = self.dooralarmowner;
    self.dooralarmprompt.team = self.dooralarmowner.team;
    updatealarmpromptvisibility();
    
    while ( true )
    {
        self.dooralarmprompt waittill( "trigger", player );
        
        if ( self.state != 8 )
        {
            continue;
        }
        
        if ( !isreallyalive( player ) )
        {
            continue;
        }
        
        if ( player meleebuttonpressed() )
        {
            continue;
        }
        
        if ( player isusingremote() )
        {
            continue;
        }
        
        thread removealarmdoor( 1 );
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x698d
// Size: 0x99
function disownalarmmonitor()
{
    if ( !isdefined( self.dooralarmprompt ) || self.islean || scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    self endon( "stateChanged" );
    
    if ( isdefined( self.otherdoor ) )
    {
        while ( self.otherdoor.state != 8 )
        {
            waitframe();
        }
    }
    
    while ( true )
    {
        self.dooralarmowner waittill_any_3( "joined_team", "joined_spectators", "disconnect" );
        
        if ( self.state != 8 )
        {
            return;
        }
        
        thread removealarmdoor( 0 );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a2e
// Size: 0xb3
function removealarmdoor( playsound )
{
    if ( playsound )
    {
        playsoundatpos( self.dooralarment.origin, "mp_door_alarm_off" );
    }
    
    if ( isdefined( self.dooralarmowner ) )
    {
        self.dooralarmowner.alarmeddoors = array_remove( self.dooralarmowner.alarmeddoors, self );
    }
    
    self.dooralarment delete();
    self.dooralarmowner = undefined;
    self.dooralarmprompt = undefined;
    thread changestate( 0 );
    
    if ( isdefined( self.otherdoor ) )
    {
        self.otherdoor thread changestate( 0 );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ae9
// Size: 0x18d
function checktriggeralarm( victim )
{
    if ( self.state != 8 )
    {
        return;
    }
    
    alarmeddoor = self;
    
    if ( !isdefined( self.dooralarment ) && isdefined( self.otherdoor ) )
    {
        alarmeddoor = self.otherdoor;
    }
    
    if ( !isdefined( alarmeddoor.dooralarmowner ) )
    {
        return;
    }
    
    alarment = alarmeddoor.dooralarment;
    alarmowner = alarmeddoor.dooralarmowner;
    alarmeddoor.dooralarmowner.alarmeddoors = array_remove( alarmeddoor.dooralarmowner.alarmeddoors, alarmeddoor );
    alarmeddoor.dooralarment = undefined;
    alarmeddoor.dooralarmowner = undefined;
    alarmeddoor.dooralarmprompt = undefined;
    alarmowner scripts\mp\killstreaks\killstreaks::givescorefortriggeredalarmeddoor();
    
    if ( isdefined( self.otherdoor ) )
    {
        self.otherdoor thread changestate( 0 );
    }
    
    if ( istrue( scripts\cp_mp\utility\player_utility::playersareenemies( victim, alarmowner ) ) )
    {
        alarment playloopsound( "mp_door_alarm_lp" );
        pinglocationenemyteams( self.origin, victim.team );
        alarment setscriptablepartstate( "effects", "triggered", 0 );
        wait 4;
        alarment stoploopsound();
        alarment delete();
        return;
    }
    
    playsoundatpos( alarment.origin, "mp_door_alarm_off" );
    alarment setscriptablepartstate( "effects", "neutral", 0 );
    alarment delete();
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c7e
// Size: 0x69
function ajarmonitor()
{
    if ( self.islean || scripts\mp\utility\game::runleanthreadmode() )
    {
        return;
    }
    
    if ( !istrue( self.issaloonstyle ) )
    {
        return;
    }
    
    self endon( "stateChanged" );
    self notify( "ajarMonitor" );
    self endon( "ajarMonitor" );
    
    while ( true )
    {
        waitframe();
        waittillframeend();
        
        if ( self.otherdoor.state != 0 )
        {
            thread changestate( 6 );
        }
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6cef
// Size: 0x122
function breachmonitor()
{
    self endon( "stateChanged" );
    thread monitorbreachmelee();
    self.lockprompt sethintstring( %MP/DOOR_USE_BREACH );
    self.lockprompt setuseholdduration( "duration_short" );
    updatelockpromptvisibility();
    
    if ( !isdefined( self.otherdoor ) )
    {
        self.doorcenter = self.origin + anglestoforward( self.angles ) * self.length * 0.5 + anglestoup( self.angles ) * self.height * 0.5;
    }
    
    thread updatelocklight( "lockedDoor" );
    
    while ( true )
    {
        self.lockprompt waittill( "trigger", player );
        
        if ( player meleebuttonpressed() )
        {
            continue;
        }
        
        if ( player isusingremote() )
        {
            continue;
        }
        
        if ( player issprinting() || player issprintsliding() )
        {
            continue;
        }
        
        if ( player ismantling() )
        {
            continue;
        }
        
        if ( istrue( self.breaching ) )
        {
            continue;
        }
        
        thread breachdoor( player );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e19
// Size: 0x14
function breachdoor( player )
{
    thread plantbreach( player );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e35
// Size: 0x2a9
function monitorbreachmelee()
{
    self endon( "stateChanged" );
    self notify( "monitorBreachMelee" );
    self endon( "monitorBreachMelee" );
    self.lockedmeleehealth = 150;
    self setcandamage( 1 );
    damage = undefined;
    attacker = undefined;
    direction_vec = undefined;
    meansofdeath = undefined;
    modelname = undefined;
    tagname = undefined;
    partname = undefined;
    idflags = undefined;
    objweapon = undefined;
    origin = undefined;
    angles = undefined;
    normal = undefined;
    inflictor = undefined;
    
    while ( true )
    {
        self waittill( "damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor );
        
        if ( isdefined( meansofdeath ) && !istrue( self.breaching ) )
        {
            if ( meansofdeath == "MOD_MELEE" || meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE" )
            {
                ismolotov = isdefined( objweapon ) && isdefined( objweapon.basename ) && ( objweapon.basename == "molotov_mp" || objweapon.basename == "thermite_mp" || objweapon.basename == "thermite_ap_mp" || objweapon.basename == "thermite_av_mp" );
                
                if ( ismolotov )
                {
                    continue;
                }
                
                self.lockedmeleehealth -= damage;
                
                if ( isdefined( self.otherdoor ) )
                {
                    self.otherdoor.lockedmeleehealth -= damage;
                }
                
                if ( self.lockedmeleehealth < 1 )
                {
                    if ( isdefined( self.otherdoor ) || istrue( self.issaloonstyle ) )
                    {
                        self.otherdoor thread updatelocklight( "off" );
                        self.otherdoor thread bashopen( attacker, attacker.origin );
                    }
                    
                    thread updatelocklight( "off" );
                    thread bashopen( attacker, attacker.origin );
                    continue;
                }
                
                playsoundatpos( self.origin + ( 0, 0, 42 ), "scrpt_door_wood_double_bash" );
            }
        }
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70e6
// Size: 0x3d3
function plantbreach( player )
{
    if ( isdefined( self.otherdoor ) && istrue( self.otherdoor.breaching ) )
    {
        return;
    }
    
    self.breaching = 1;
    thread updatelockpromptvisibility();
    thread watchplayerdeath( player );
    origin = self.origin;
    angles = self.angles;
    right = anglestoright( angles );
    normal = vectornormalize( player.origin - self.origin );
    dot = vectordot( right, normal );
    openleft = dot > 0;
    
    if ( openleft )
    {
        var_c5b5db793ca45dd3 = self.rightplantorg;
        var_8ec84979cf48b441 = self.rightplantang;
    }
    else
    {
        var_c5b5db793ca45dd3 = self.leftplantorg;
        var_8ec84979cf48b441 = self.leftplantang;
    }
    
    player.linktoent = player spawn_tag_origin();
    player playerlinktodelta( player.linktoent, "tag_origin", 1, 0, 0, 0, 0, 0 );
    scenenode = spawn_tag_origin( var_c5b5db793ca45dd3, var_8ec84979cf48b441 );
    player.linktoent moveto( var_c5b5db793ca45dd3, 0.25, 0.1, 0.1 );
    player.linktoent rotateto( var_8ec84979cf48b441, 0.25, 0.1, 0.1 );
    player setstance( "stand" );
    
    if ( !istrue( player givegunless() ) )
    {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
        self.breaching = 0;
        thread updatelockpromptvisibility();
        return 0;
    }
    
    if ( istrue( self.cancelplant ) )
    {
        self.breaching = 0;
        thread updatelockpromptvisibility();
        return 0;
    }
    
    player unlink();
    player.linktoent delete();
    player.linktoent = undefined;
    player setorigin( var_c5b5db793ca45dd3 );
    player setplayerangles( var_8ec84979cf48b441 );
    faction = ter_op( player.team == "allies", "usp1", "afp1" );
    
    if ( level.mapname == "mp_hackney_yard" )
    {
        faction = ter_op( player.team == "allies", "ukp1", "abp1" );
    }
    
    player queuedialogforplayer( "dx_mpp_" + faction + "_breach_plant", "cop_breach_plant", 2 );
    thread create_player_rig( player, "planter" );
    scenenode thread scripts\mp\anim::anim_player_solo( player, player.player_rig, "plant" );
    wm_c4 = spawn( "script_model", var_c5b5db793ca45dd3 );
    wm_c4 setmodel( "offhand_wm_c4" );
    wm_c4.animname = "c4";
    wm_c4 useanimtree( #script_model );
    self.plantedbomb = wm_c4;
    scenenode thread anim_single_solo( wm_c4, "plant" );
    animlength = getanimlength( level.scr_anim[ "planter" ][ "plant" ] );
    armedtimeoffset = 0.5;
    wait animlength - armedtimeoffset;
    
    if ( istrue( self.cancelplant ) )
    {
        self.breaching = 0;
        thread updatelockpromptvisibility();
        return 0;
    }
    
    thread bomb_planted_think( player, openleft );
    givebreachscore( player );
    wait armedtimeoffset;
    
    if ( player isviewmodelanimplaying() )
    {
        player stopviewmodelanim();
    }
    
    player thread takegunless();
    remove_player_rig( player );
    return 1;
}

// Namespace door / scripts\mp\door
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74c2
// Size: 0x34a
function bomb_planted_think( player, openleft )
{
    plantedteam = player.team;
    self.defused = 0;
    
    if ( !isdefined( self.breachindex ) )
    {
        if ( !isdefined( level.breachindex ) )
        {
            level.breachindex = 0;
        }
        else
        {
            level.breachindex++;
        }
        
        self.breachindex = level.breachindex;
    }
    
    bomb_fuse_think( plantedteam );
    
    if ( !self.defused )
    {
        self.doorcenter = self.origin + anglestoforward( self.angles ) * self.length * 0.5 + anglestoup( self.angles ) * self.height * 0.5;
        explosionorigin = self.doorcenter;
        
        if ( openleft )
        {
            explosionang = self.rightplantang;
        }
        else
        {
            explosionang = self.leftplantang;
        }
        
        explosioneffect = spawnfx( level._effect[ "breach_explode" ], explosionorigin, anglestoforward( explosionang ) * -1, ( 0, 0, 1 ) );
        triggerfx( explosioneffect );
        physicsexplosionsphere( explosionorigin, 200, 100, 3 );
        playrumbleonposition( "grenade_rumble", explosionorigin );
        earthquake( 0.5, 1, explosionorigin, 1500 );
        player _launchgrenade( "flash_grenade_mp", self.plantedbomb.origin + anglestoforward( explosionang ) * 100, ( 0, 0, 0 ), 0.05, 1 );
        player _launchgrenade( "concussion_grenade_mp", self.plantedbomb.origin + anglestoforward( explosionang ) * 100, ( 0, 0, 0 ), 0.05, 1 );
        wait 0.1;
        
        if ( isdefined( player ) )
        {
            self.plantedbomb radiusdamage( self.plantedbomb.origin, 50, 10, 5, player, "MOD_EXPLOSIVE", "bomb_site_mp" );
        }
        else
        {
            self.plantedbomb radiusdamage( self.plantedbomb.origin, 100, 50, 5, undefined, "MOD_EXPLOSIVE", "bomb_site_mp" );
        }
        
        thread bashopen( player, self.plantedbomb.origin );
        
        if ( isdefined( self.otherdoor ) )
        {
            self.otherdoor thread bashopen( player, self.plantedbomb.origin );
        }
    }
    
    self.plantedbomb delete();
    self.plantedbomb = undefined;
    setomnvar( "ui_ingame_timer_" + self.breachindex, 0 );
    setomnvar( "ui_ingame_timer_ent_" + self.breachindex, undefined );
    self.breaching = 0;
    thread updatelockpromptvisibility();
    thread updatelocklight( "off" );
    
    if ( isdefined( self.otherdoor ) )
    {
        self.otherdoor thread updatelocklight( "off" );
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7814
// Size: 0x18d
function bomb_fuse_think( team )
{
    self notify( "breach_planted" );
    self.timerobject = spawn( "script_model", self.plantedbomb.origin );
    currenttime = gettime();
    bombendtime = int( currenttime + 1000 );
    setomnvar( "ui_ingame_timer_" + self.breachindex, bombendtime );
    setomnvar( "ui_ingame_timer_ent_" + self.breachindex, self.timerobject );
    var_c301d652d9a73075 = bombendtime - currenttime;
    
    while ( !self.defused && var_c301d652d9a73075 > 0 )
    {
        currenttime = gettime();
        var_c301d652d9a73075 = bombendtime - currenttime;
        
        if ( var_c301d652d9a73075 < 1500 )
        {
            if ( var_c301d652d9a73075 <= 250 )
            {
                self.plantedbomb playsound( "breach_warning_beep_05" );
            }
            else if ( var_c301d652d9a73075 < 500 )
            {
                self.plantedbomb playsound( "breach_warning_beep_04" );
            }
            else if ( var_c301d652d9a73075 < 1500 )
            {
                self.plantedbomb playsound( "breach_warning_beep_03" );
            }
            else
            {
                self.plantedbomb playsound( "breach_warning_beep_02" );
            }
            
            wait 0.25;
        }
        else if ( var_c301d652d9a73075 < 3500 )
        {
            self.plantedbomb playsound( "breach_warning_beep_02" );
            wait 0.5;
        }
        else
        {
            self.plantedbomb playsound( "breach_warning_beep_01" );
            wait 1;
        }
        
        if ( var_c301d652d9a73075 < 0 )
        {
            break;
        }
    }
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79a9
// Size: 0x74
function watchplayerdeath( player )
{
    self endon( "breach_planted" );
    self.cancelplant = 0;
    
    while ( true )
    {
        if ( !isdefined( player ) || !isreallyalive( player ) )
        {
            if ( isdefined( self.plantedbomb ) )
            {
                self.plantedbomb delete();
                self.plantedbomb = undefined;
                self.plantedkey = undefined;
            }
            
            self.cancelplant = 1;
            break;
        }
        
        waitframe();
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a25
// Size: 0x2
function script_model_anims()
{
    
}

// Namespace door / scripts\mp\door
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7a2f
// Size: 0xe8
function create_player_rig( player, animname, rig_model )
{
    if ( !isdefined( player ) || isdefined( player.player_rig ) )
    {
        return;
    }
    
    player.animname = animname;
    
    if ( !isdefined( rig_model ) )
    {
        rig_model = "viewhands_base_iw8";
    }
    
    player.player_rig = spawn( "script_model", player.origin );
    player.player_rig setmodel( rig_model );
    player.player_rig hide();
    player.player_rig.animname = animname;
    player.player_rig useanimtree( #script_model );
    player playerlinktodelta( player.player_rig, "tag_player", 1, 0, 0, 0, 0, 0, 0 );
    player watch_remove_rig();
    remove_player_rig( player );
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b1f
// Size: 0x92
function remove_player_rig( player )
{
    if ( !isdefined( player ) || !isdefined( player.player_rig ) )
    {
        return;
    }
    
    player unlink();
    droppos = player getdroptofloorposition( player.origin );
    
    if ( isdefined( droppos ) )
    {
        player setorigin( droppos );
    }
    else
    {
        player setorigin( player.origin + ( 0, 0, 100 ) );
    }
    
    player.player_rig delete();
    player.player_rig = undefined;
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bb9
// Size: 0x1c
function watch_remove_rig( struct )
{
    waittill_any_2( "remove_rig", "death_or_disconnect" );
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bdd
// Size: 0x46
function givebreachscore( player )
{
    event = #"breach";
    points = scripts\mp\rank::getscoreinfovalue( event );
    player thread scripts\mp\rank::giverankxp( event, points );
    player thread scripts\mp\rank::scoreeventpopup( event );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c2b
// Size: 0x94
function givegunless()
{
    self endon( "death_or_disconnect" );
    gunless = makeweapon( "iw8_gunless" );
    _giveweapon( gunless, undefined, undefined, 1 );
    success = domonitoredweaponswitch( gunless, 0 );
    
    if ( success )
    {
        self.gunnlessweapon = gunless;
        val::set( "gunless", "weapon_switch", 0 );
        val::set( "gunless", "offhand_weapons", 0 );
        val::set( "gunless", "melee", 0 );
    }
    else
    {
        _takeweapon( gunless );
        forcevalidweapon();
    }
    
    return success;
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7cc8
// Size: 0xa8
function takegunless()
{
    self endon( "death_or_disconnect" );
    
    if ( !isdefined( self.gunnlessweapon ) || !self hasweapon( self.gunnlessweapon ) )
    {
        return;
    }
    
    self.takinggunless = 1;
    
    while ( self hasweapon( self.gunnlessweapon ) )
    {
        if ( !iscurrentweapon( self.gunnlessweapon ) )
        {
            abortmonitoredweaponswitch( self.gunnlessweapon );
        }
        else
        {
            _takeweapon( self.gunnlessweapon );
            forcevalidweapon();
        }
        
        waitframe();
    }
    
    self.takinggunless = 0;
    self.gunnlessweapon = undefined;
    val::reset_all( "gunless" );
}

// Namespace door / scripts\mp\door
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d78
// Size: 0x57
function updatelocklight( state )
{
    if ( !isdefined( self.locklight ) )
    {
        return;
    }
    
    self notify( "updateLockLight" );
    self endon( "updateLockLight" );
    
    if ( !scripts\mp\flags::levelflag( "scriptables_ready" ) )
    {
        scripts\mp\flags::levelflagwait( "scriptables_ready" );
    }
    
    self.locklight setscriptablepartstate( "marker", state );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7dd7
// Size: 0x375
function linkdoubledoors()
{
    foreach ( door in level.doors )
    {
        if ( isdefined( door.otherdoor ) )
        {
            continue;
        }
        
        foreach ( otherdoor in level.doors )
        {
            if ( otherdoor == door )
            {
                continue;
            }
            
            doorpos1 = door gettagorigin( "tag_door_handle", 1 );
            doorpos2 = otherdoor gettagorigin( "tag_door_handle", 1 );
            
            if ( !isdefined( doorpos1 ) || !isdefined( doorpos2 ) )
            {
                continue;
            }
            
            distsq = distancesquared( doorpos1, doorpos2 );
            
            if ( distsq < 225 )
            {
                if ( distsq < 100 )
                {
                    door.issaloonstyle = 1;
                    otherdoor.issaloonstyle = 1;
                }
                
                otherdoor.otherdoor = door;
                door.otherdoor = otherdoor;
                
                if ( isdefined( door.lockprompt ) && isdefined( otherdoor.lockprompt ) )
                {
                    otherdoor.lockprompt delete();
                    otherdoor.lockprompt = door.lockprompt;
                    avgpos = ( doorpos1 + doorpos2 ) * 0.5 + ( 0, 0, 15 );
                    door.lockprompt unlink();
                    door.lockprompt.origin = avgpos;
                    door thread changestate( door.state );
                    otherdoor thread changestate( otherdoor.state );
                    door.leftplantorg = ( avgpos[ 0 ], avgpos[ 1 ], door.origin[ 2 ] ) + anglestoright( door.baseangles ) * -24.5;
                    door.leftplantang = ( 0, door.baseangles[ 1 ] - 90, 0 );
                    door.rightplantorg = ( avgpos[ 0 ], avgpos[ 1 ], door.origin[ 2 ] ) + anglestoright( door.baseangles ) * 24.5;
                    door.rightplantang = ( 0, door.baseangles[ 1 ] + 90, 0 );
                    otherdoor.leftplantorg = ( avgpos[ 0 ], avgpos[ 1 ], otherdoor.origin[ 2 ] ) + anglestoright( otherdoor.baseangles ) * -24.5;
                    otherdoor.leftplantang = ( 0, otherdoor.baseangles[ 1 ] - 90, 0 );
                    otherdoor.rightplantorg = ( avgpos[ 0 ], avgpos[ 1 ], otherdoor.origin[ 2 ] ) + anglestoright( otherdoor.baseangles ) * 24.5;
                    otherdoor.rightplantang = ( 0, otherdoor.baseangles[ 1 ] + 90, 0 );
                }
            }
        }
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8154
// Size: 0x35
function door_createnavobstacle()
{
    if ( !isdefined( self.clipent ) )
    {
        return;
    }
    
    if ( isdefined( self.doornavobstacle ) )
    {
        return;
    }
    
    self.doornavobstacle = createnavobstaclebyent( self.clipent );
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8191
// Size: 0x29
function door_destroynavobstacle()
{
    if ( !isdefined( self.doornavobstacle ) )
    {
        return;
    }
    
    destroynavobstacle( self.doornavobstacle );
    self.doornavobstacle = undefined;
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81c2
// Size: 0x20
function door_enableaudioportal()
{
    if ( isdefined( self.audioportalent ) )
    {
        self.audioportalent enableaudioportal( 1 );
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81ea
// Size: 0x7a
function door_disableaudioportal()
{
    if ( isdefined( self.otherdoor ) && self.otherdoor.state != 0 && self.otherdoor.state != 7 && self.otherdoor.state != 8 )
    {
        return;
    }
    
    if ( isdefined( self.audioportalent ) )
    {
        self.audioportalent enableaudioportal( 0 );
    }
}

// Namespace door / scripts\mp\door
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x826c
// Size: 0x1d, Type: bool
function door_can_open_check()
{
    return self.state == 6 || self.state == 0;
}

