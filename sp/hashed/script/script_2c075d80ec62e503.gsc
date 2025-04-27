#using script_2c075d80ec62e503;
#using scripts\common\utility;
#using scripts\cp\coop_personal_ents;
#using scripts\cp\cp_snakecam;
#using scripts\cp\interaction;
#using scripts\cp\utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_c9c9780506580f5a;

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3
// Size: 0x8c
function function_53ab5dd012d67963()
{
    level.var_5f4060aac4473ec4 = getentarray( "enemy_cam", "targetname" );
    
    if ( isdefined( level.var_5f4060aac4473ec4 ) && level.var_5f4060aac4473ec4.size > 0 )
    {
        array_thread_amortized( level.var_5f4060aac4473ec4, &rotate_camera, 0.1 );
        array_thread_amortized( level.var_5f4060aac4473ec4, &function_a159676f4a7d4782, 0.1 );
        array_thread_amortized( level.var_5f4060aac4473ec4, &function_6a99e314e438fe9, 0.1 );
        namespace_ae34222dcb9dda53::function_db25531fe9ac9980();
    }
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x247
// Size: 0x49
function function_db25531fe9ac9980()
{
    scripts\cp\interaction::registerinteraction( "enemy_cam_disable", &cam_hint_func, &function_cd9c16ff4b5a2d18, &cam_init_func, 0 );
    scripts\cp\coop_personal_ents::registerpentparams( "enemy_cam_disable", "HINT_BUTTON", undefined, %SNAKECAM/USE, undefined, "duration_long", "hide", 400, 65, 110, 65 );
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x298
// Size: 0xa7
function cam_init_func( interaction_array )
{
    level endon( "game_ended" );
    precacheshader( "nightvision_overlay_goggles_grain" );
    precacherumble( "cp_wheelson_rumble" );
    level.pentskipfov[ "enemy_cam_disable" ] = 1;
    
    foreach ( interaction_struct in interaction_array )
    {
        interaction_struct.p_ent_skip_fov = 1;
        interaction_struct.benabled = 1;
        scripts\cp\interaction::remove_from_current_interaction_list( interaction_struct );
        scripts\cp\coop_personal_ents::addtopersonalinteractionlist( interaction_struct );
    }
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x347
// Size: 0x18
function cam_hint_func( interaction_struct, player )
{
    return %SNAKECAM/USE;
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x368
// Size: 0x3d
function function_cd9c16ff4b5a2d18( interaction_struct, player )
{
    player endon( "disconnect" );
    
    if ( !istrue( interaction_struct.benabled ) )
    {
        return;
    }
    
    interaction_struct.benabled = undefined;
    level notify( "trigger_cam_disable" );
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ad
// Size: 0x85
function function_a159676f4a7d4782()
{
    level endon( "cameras_disabled" );
    level endon( "death" );
    
    while ( true )
    {
        foreach ( player in level.players )
        {
            if ( player sightconetrace( self.origin, self ) )
            {
                iprintln( " CAMERA SPOTTED A PLAYER!! " );
            }
        }
        
        wait 0.5;
    }
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x43a
// Size: 0xa6, Type: bool
function function_c625ac772b755445( start, dot, dot_only, ignore_ent )
{
    self endon( "death" );
    
    if ( !isdefined( dot ) )
    {
        dot = 0.8;
    }
    
    end = self.origin + anglestoforward( self.angles ) * 1024;
    thread draw_line_for_time( start, end, 1, 0, 0, 5 );
    results = scripts\engine\trace::ray_trace_detail( start, end, ignore_ent, scripts\engine\trace::create_character_contents() );
    
    if ( isdefined( results[ "entity" ] ) && isplayer( results[ "entity" ] ) )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e9
// Size: 0x23
function function_6a99e314e438fe9()
{
    level endon( "death" );
    level endon( "cameras_disabled" );
    level waittill( "trigger_cam_disable" );
    wait 2;
    level notify( "cameras_disabled" );
}

// Namespace namespace_c9c9780506580f5a / namespace_ae34222dcb9dda53
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x514
// Size: 0x4b6
function rotate_camera()
{
    level endon( "cameras_disabled" );
    level endon( "death" );
    og_angles = self.angles;
    minpitch = -90;
    maxpitch = 90;
    var_cb6680317be1e374 = 90;
    var_aae6a37f78b5674 = 90;
    minyaw = og_angles[ 1 ] - var_cb6680317be1e374;
    maxyaw = og_angles[ 1 ] + var_cb6680317be1e374;
    minroll = og_angles[ 2 ] - var_aae6a37f78b5674;
    maxroll = og_angles[ 2 ] + var_aae6a37f78b5674;
    var_827abacd5ca8f6b3 = 20;
    dmaxroll = 90;
    var_440ebeeb83bd05a8 = 0.6;
    var_75eb1524afeb7f2b = 0.8;
    dmaxangle = 10;
    dyaw = 4;
    dpitch = 1.2;
    var_d296b0eaf4a6b00f = [ 0, 0 ];
    var_d5e6310914396ac3 = 0.2;
    var_848e35f763ce65b0 = 0.2;
    rumble_playing = 0;
    self hudoutlineenable( "outlinefill_depth_cyan" );
    
    while ( true )
    {
        currentangles = og_angles;
        var_b4f55166f66361e9 = self.angles;
        input = [ -1, 1 ];
        multiplier = 0;
        normalinput = ( input[ 0 ], input[ 1 ], 0 );
        normalinput = length( normalinput );
        var_5eb5724f78d37c4c = math::factor_value( var_848e35f763ce65b0, var_d5e6310914396ac3, normalinput );
        var_d296b0eaf4a6b00f[ 0 ] = math::lerp( var_d296b0eaf4a6b00f[ 0 ], input[ 0 ], var_5eb5724f78d37c4c );
        var_d296b0eaf4a6b00f[ 1 ] = math::lerp( var_d296b0eaf4a6b00f[ 1 ], input[ 1 ], var_5eb5724f78d37c4c );
        
        if ( currentangles[ 0 ] > 0 && var_d296b0eaf4a6b00f[ 0 ] < 0 )
        {
            var_13a3fd6ddfa8548f = 1 - math::normalize_value( maxpitch * var_440ebeeb83bd05a8, maxpitch, currentangles[ 0 ] );
        }
        else if ( currentangles[ 0 ] < 0 && var_d296b0eaf4a6b00f[ 0 ] > 0 )
        {
            var_13a3fd6ddfa8548f = math::normalize_value( minpitch, minpitch * var_440ebeeb83bd05a8, currentangles[ 0 ] );
        }
        else
        {
            var_13a3fd6ddfa8548f = 1;
        }
        
        if ( currentangles[ 1 ] > og_angles[ 1 ] && var_d296b0eaf4a6b00f[ 1 ] < 0 )
        {
            var_8366082d034c6132 = 1 - math::normalize_value( maxyaw - var_cb6680317be1e374 * var_75eb1524afeb7f2b, maxyaw, currentangles[ 1 ] );
        }
        else if ( currentangles[ 1 ] < og_angles[ 1 ] && var_d296b0eaf4a6b00f[ 1 ] > 0 )
        {
            var_8366082d034c6132 = math::normalize_value( minyaw, minyaw + var_cb6680317be1e374 * var_75eb1524afeb7f2b, currentangles[ 1 ] );
        }
        else
        {
            var_8366082d034c6132 = 1;
        }
        
        inputyaw = var_d296b0eaf4a6b00f[ 1 ] * -1;
        nextyaw = currentangles[ 1 ] + dyaw * inputyaw * var_8366082d034c6132;
        
        if ( nextyaw > og_angles[ 1 ] )
        {
            multiplier = math::normalized_float_smooth_out( math::normalize_value( og_angles[ 1 ], maxyaw, nextyaw ) ) * -1;
        }
        
        if ( nextyaw < og_angles[ 1 ] )
        {
            multiplier = 1 - math::normalized_float_smooth_in( math::normalize_value( minyaw, og_angles[ 1 ], nextyaw ) );
        }
        
        inputroll = input[ 1 ];
        nextroll = og_angles[ 2 ] + dmaxroll * multiplier;
        maxroll *= multiplier;
        nextyaw = clamp( nextyaw, minyaw, maxyaw );
        inputpitch = var_d296b0eaf4a6b00f[ 0 ] * -1;
        nextpitch = currentangles[ 0 ] + dpitch * inputpitch * var_13a3fd6ddfa8548f;
        var_bc4b977758b3324e = minpitch;
        maxpitchclamp = maxpitch;
        nextpitch = clamp( nextpitch, var_bc4b977758b3324e, maxpitchclamp );
        var_6612315290576b0f = ( nextpitch, nextyaw, nextroll );
        movementfactor = length( var_6612315290576b0f - self.angles );
        movementfactor = math::normalize_value( 0, 1.5, movementfactor );
        quake = math::factor_value( 0, 0.105, movementfactor );
        rumble = math::factor_value( 0, 0.08, movementfactor );
        volume = math::factor_value( 0, 0.2, movementfactor );
        height = 1 - rumble;
        height *= 1000;
        self rotateto( var_6612315290576b0f, 2 );
        nudge_spot = self.origin + anglestoforward( self.angles ) * 12 + anglestoup( self.angles ) * -55 + ( 0, 0, 3 );
        wait 2;
    }
}

