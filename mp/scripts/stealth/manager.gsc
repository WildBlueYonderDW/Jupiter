#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\utility;
#using scripts\smartobjects\hunt_checkin;
#using scripts\smartobjects\hunt_point;
#using scripts\smartobjects\utility;
#using scripts\stealth\callbacks;
#using scripts\stealth\corpse;
#using scripts\stealth\debug;
#using scripts\stealth\enemy;
#using scripts\stealth\event;
#using scripts\stealth\group;
#using scripts\stealth\threat_sight;
#using scripts\stealth\utility;

#namespace manager;

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46d
// Size: 0x2b
function main()
{
    if ( isdefined( level.stealth ) )
    {
        return;
    }
    
    init();
    level thread teams_thread();
    
    /#
        thread debug_manager();
    #/
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a0
// Size: 0x2e6
function init()
{
    flag_set( "stealth_enabled" );
    level.stealth = spawnstruct();
    level.stealth.fov = spawnstruct();
    level.stealth.save = spawnstruct();
    level.stealth.var_19a752c76729adea = "DuringStealth";
    
    if ( !isdefined( level.var_a56341078ed3d3c9 ) )
    {
        function_cadea9f6440479c0( level.gamemodebundle.stealthbundle );
    }
    
    /#
        level.stealth.debug = spawnstruct();
        level.stealth.debug.screen = [];
    #/
    
    level.stealth.funcs = [];
    function_ab26892d96278702( "hidden" );
    scripts\stealth\corpse::corpse_init_level();
    scripts\stealth\event::event_init_level();
    level.stealth.next_sound_wait = 3000;
    level.stealth.head_shot_dist = 8;
    level.stealth.var_e012fd4f27172998 = 5;
    level.stealth.group = spawnstruct();
    level.stealth.group.flags = [];
    level.stealth.group.groups = [];
    level.stealth.group.ally_groups = [];
    level.stealth.group.death_alert_timeout = [];
    level.stealth.hunting_groups = [];
    set_default_settings();
    init_stealth_volumes();
    scripts\smartobjects\utility::init_smartobjects();
    init_save();
    level.stealth.min_alert_level_duration = 1;
    level.stealth.var_3495e2e91301febd = [];
    level.stealth.var_3495e2e91301febd[ "idle" ] = "mp_stealth";
    level.stealth.var_3495e2e91301febd[ "investigate" ] = "mp_stealth";
    level.stealth.var_3495e2e91301febd[ "hunt" ] = "mp_stealth";
    setup_stealth_funcs();
    
    if ( !isdefined( anim.smartobjects[ "hunt_point" ] ) )
    {
        scripts\smartobjects\hunt_point::main();
    }
    
    if ( !isdefined( anim.smartobjects[ "hunt_checkin" ] ) )
    {
        scripts\smartobjects\hunt_checkin::main();
    }
    
    level.bseq = spawnstruct();
    level.bseq.instancedata = [];
}

// Namespace manager / scripts\stealth\manager
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78e
// Size: 0x75
function function_cadea9f6440479c0( stealthbundlename )
{
    /#
        if ( getdvarint( @"hash_e6afce2cf5cf7515" ) )
        {
            return;
        }
    #/
    
    if ( !isstring( stealthbundlename ) || stealthbundlename == "" )
    {
        return;
    }
    
    stealthbundle = getscriptbundle( "stealthbundle:" + stealthbundlename );
    
    if ( isdefined( stealthbundle ) )
    {
        thread set_stealth_bundle_internal( stealthbundle );
        return;
    }
    
    assertmsg( "<dev string:x1c>" + stealthbundlename + "<dev string:x30>" );
}

// Namespace manager / scripts\stealth\manager
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x80b
// Size: 0x40d
function private set_stealth_bundle_internal( stealthbundle )
{
    self notify( "set_stealth_bundle_internal" );
    self endon( "set_stealth_bundle_internal" );
    level.var_a56341078ed3d3c9 = stealthbundle;
    flag_wait( "stealth_enabled" );
    level.var_a56341078ed3d3c9 = undefined;
    set_default_settings();
    level.stealth.var_b164de1a339a2b06 = stealthbundle.var_b164de1a339a2b06;
    level.stealth.var_bd826e05d26d86a2 = stealthbundle.var_bd826e05d26d86a2;
    level.stealth.var_8ebeefcb86e27a0f = stealthbundle.var_8ebeefcb86e27a0f;
    level.stealth.stealth_spotted_delay = stealthbundle.var_a8b82b34f9faf5b8;
    function_d5823c94e8131ea6( istrue( stealthbundle.var_fedfd5365ad1c962 ) );
    function_531194f673a06de5( istrue( stealthbundle.var_99e4d558378f458a ) );
    level.stealth.huntmode = default_to( stealthbundle.hunttype, "Global" );
    
    switch ( level.stealth.huntmode )
    {
        case #"hash_c24b16fb9788caee":
            function_3875866b3a6d349( 0 );
            function_aa9fa9c5a97d0f6e( 0 );
            break;
        case #"hash_4f2154ac90348b6a":
            function_3875866b3a6d349( 1 );
            function_aa9fa9c5a97d0f6e( 0 );
            break;
        case #"hash_ad8f23b9b8103745":
            function_3875866b3a6d349( 0 );
            function_aa9fa9c5a97d0f6e( 1 );
            break;
    }
    
    foreach ( player in level.players )
    {
        function_5513b6097fa0b730( player, istrue( stealthbundle.var_2aa1112e46b4cf64 ) );
        function_ed9b1ddd2ec82dab( player, istrue( stealthbundle.var_dafc0463036e0af7 ) );
        
        if ( isdefined( level.var_971169afd6488423 ) )
        {
            player [[ level.var_971169afd6488423 ]]( istrue( stealthbundle.socialstealth ) );
        }
    }
    
    setomnvar( "ai_fulllight", default_to( stealthbundle.var_9a18ffde7eb7a303, 0.01 ) );
    setomnvar( "ai_nolight", default_to( stealthbundle.var_1943001a76b00ef0, 0 ) );
    
    if ( isdefined( stealthbundle.eventlist ) )
    {
        level.valstruct val::set( "stealthmanager", "ai_eventlist", stealthbundle.eventlist );
    }
    else
    {
        level.valstruct val::reset( "stealthmanager", "ai_eventlist" );
    }
    
    corpseranges = [];
    corpseranges[ "sight_dist" ] = default_to( stealthbundle.var_2d26f9b2c2952b73, 600 );
    corpseranges[ "detect_dist" ] = default_to( stealthbundle.var_8a3160eb6a9599b1, 300 );
    corpseranges[ "found_dist" ] = default_to( stealthbundle.var_f3c241170db7c2a2, 100 );
    corpseranges[ "shadow_dist" ] = default_to( stealthbundle.var_83aa945aa7193936, 100 );
    scripts\stealth\corpse::set_corpse_ranges( corpseranges );
    level.stealth.var_19a752c76729adea = default_to( stealthbundle.var_19a752c76729adea, "DuringStealth" );
    
    switch ( level.stealth.var_19a752c76729adea )
    {
        case #"hash_1d7966a2fa479e24":
            setsaveddvar( @"ai_corpsesynch", 1 );
            break;
        case #"hash_616703241319aec9":
            setsaveddvar( @"ai_corpsesynch", 0 );
            break;
    }
    
    stealth_hidden = [];
    stealth_hidden[ "prone" ] = 9999;
    stealth_hidden[ "crouch" ] = 9999;
    stealth_hidden[ "stand" ] = 9999;
    stealth_spotted = [];
    stealth_spotted[ "prone" ] = 9999;
    stealth_spotted[ "crouch" ] = 9999;
    stealth_spotted[ "stand" ] = 9999;
    scripts\stealth\utility::set_detect_ranges( stealth_hidden, stealth_spotted );
}

// Namespace manager / scripts\stealth\manager
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc20
// Size: 0xeb
function function_dc19ea08106ca928( state )
{
    if ( !isdefined( self.stealth ) )
    {
        return;
    }
    
    if ( isdefined( self.stealth.var_3495e2e91301febd ) && isdefined( self.stealth.var_3495e2e91301febd[ state ] ) )
    {
        return self.stealth.var_3495e2e91301febd[ state ];
    }
    
    if ( isdefined( level.stealth.var_3495e2e91301febd ) && isdefined( level.stealth.var_3495e2e91301febd[ state ] ) )
    {
        return level.stealth.var_3495e2e91301febd[ state ];
    }
    
    defaults = [];
    defaults[ "idle" ] = "mp_stealth";
    defaults[ "investigate" ] = "mp_stealth";
    defaults[ "hunt" ] = "mp_stealth";
    defaults[ "combat" ] = "default";
    return defaults[ state ];
}

// Namespace manager / scripts\stealth\manager
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd14
// Size: 0x64
function function_ef72c03cbcb43194( state, var_b8f2440e43198535 )
{
    if ( !isdefined( self.stealth ) )
    {
        return;
    }
    
    if ( !isdefined( self.stealth.var_3495e2e91301febd ) )
    {
        self.stealth.var_3495e2e91301febd = [];
    }
    
    self.stealth.var_3495e2e91301febd[ state ] = var_b8f2440e43198535;
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd80
// Size: 0x60
function setup_stealth_funcs()
{
    level scripts\stealth\utility::set_stealth_func( "do_stealth", &scripts\stealth\utility::do_stealth );
    scripts\stealth\enemy::set_default_stealth_funcs();
    level.stealth.fngroupspottedflag = &scripts\stealth\utility::group_spotted_flag;
    level.stealth.fninitenemygame = undefined;
    level.stealth.var_e376d807bb8ce93b = &scripts\stealth\callbacks::stealth_call_thread;
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde8
// Size: 0x47e
function set_default_settings()
{
    stealth_hidden = [];
    stealth_hidden[ "prone" ] = 1000;
    stealth_hidden[ "crouch" ] = 1800;
    stealth_hidden[ "stand" ] = 2800;
    stealth_spotted = [];
    stealth_spotted[ "prone" ] = 1800;
    stealth_spotted[ "crouch" ] = 2500;
    stealth_spotted[ "stand" ] = 4000;
    scripts\stealth\utility::set_detect_ranges( stealth_hidden, stealth_spotted );
    var_ca02517e3aeb3b5c = [];
    var_ca02517e3aeb3b5c[ "prone" ] = 130;
    var_ca02517e3aeb3b5c[ "crouch" ] = 215;
    var_ca02517e3aeb3b5c[ "stand" ] = 300;
    var_42470406ae5786dd = [];
    var_42470406ae5786dd[ "prone" ] = 300;
    var_42470406ae5786dd[ "crouch" ] = 375;
    var_42470406ae5786dd[ "stand" ] = 450;
    scripts\stealth\utility::set_min_detect_range_darkness( var_ca02517e3aeb3b5c, var_42470406ae5786dd );
    var_c53b4c55bd88f6d5 = [];
    var_c53b4c55bd88f6d5[ "prone" ] = 130;
    var_c53b4c55bd88f6d5[ "crouch" ] = 215;
    var_c53b4c55bd88f6d5[ "stand" ] = 300;
    var_fa836dfcdbed1fa6 = [];
    var_fa836dfcdbed1fa6[ "prone" ] = 300;
    var_fa836dfcdbed1fa6[ "crouch" ] = 375;
    var_fa836dfcdbed1fa6[ "stand" ] = 450;
    scripts\stealth\utility::function_f3883fe06a11269( var_ca02517e3aeb3b5c, var_42470406ae5786dd );
    level.stealth.fov.cosine[ "blind" ] = 0.98;
    level.stealth.fov.cosinebusy[ "blind" ] = 0.98;
    level.stealth.fov.cosinez[ "blind" ] = 0;
    level.stealth.fov.ground[ "blind" ] = 0;
    level.stealth.fov.cosine[ "hidden" ] = 0.7;
    level.stealth.fov.cosinebusy[ "hidden" ] = 0.86;
    level.stealth.fov.cosinez[ "hidden" ] = 0.97;
    level.stealth.fov.ground[ "hidden" ] = 1;
    level.stealth.fov.cosine[ "investigate" ] = 0.7;
    level.stealth.fov.cosinebusy[ "investigate" ] = 0.86;
    level.stealth.fov.cosinez[ "investigate" ] = 0.97;
    level.stealth.fov.ground[ "investigate" ] = 1;
    level.stealth.fov.cosine[ "combat_hunt" ] = 0.7;
    level.stealth.fov.cosinebusy[ "combat_hunt" ] = 0.86;
    level.stealth.fov.cosinez[ "combat_hunt" ] = 0.97;
    level.stealth.fov.ground[ "combat_hunt" ] = 1;
    level.stealth.fov.cosine[ "spotted" ] = 0.01;
    level.stealth.fov.cosinebusy[ "spotted" ] = 0.574;
    level.stealth.fov.cosinez[ "spotted" ] = 0;
    level.stealth.fov.ground[ "spotted" ] = 0;
    scripts\stealth\corpse::set_corpse_ranges_default();
    
    if ( !isdefined( level.gamemodebundle ) || istrue( level.gamemodebundle.var_f8c2703e1020ada0 ) )
    {
        init_event_distances();
    }
    
    event_change( "hidden" );
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x126e
// Size: 0x1f3
function init_event_distances()
{
    array[ "spotted" ][ "death" ] = function_9d30fd63965bafa9( "death" );
    array[ "hidden" ][ "death" ] = 512;
    array[ "spotted" ][ "pain" ] = function_9d30fd63965bafa9( "pain" );
    array[ "hidden" ][ "pain" ] = 256;
    array[ "spotted" ][ "explosion" ] = function_9d30fd63965bafa9( "explosion" );
    array[ "hidden" ][ "explosion" ] = 2048;
    array[ "spotted" ][ "bullet" ] = function_9d30fd63965bafa9( "bullet" );
    array[ "hidden" ][ "bullet" ] = 64;
    array[ "spotted" ][ "footstep_walk" ] = function_9d30fd63965bafa9( "footstep_walk" );
    array[ "hidden" ][ "footstep_walk" ] = 50;
    array[ "spotted" ][ "footstep" ] = function_9d30fd63965bafa9( "footstep" );
    array[ "hidden" ][ "footstep" ] = 100;
    array[ "spotted" ][ "footstep_sprint" ] = function_9d30fd63965bafa9( "footstep_sprint" );
    array[ "hidden" ][ "footstep_sprint" ] = 400;
    array[ "spotted" ][ "gunshot" ] = function_9d30fd63965bafa9( "gunshot" );
    array[ "hidden" ][ "gunshot" ] = 1500;
    array[ "spotted" ][ "silenced_shot" ] = function_9d30fd63965bafa9( "silenced_shot" );
    array[ "hidden" ][ "silenced_shot" ] = 180;
    array[ "spotted" ][ "glass_destroyed" ] = function_9d30fd63965bafa9( "glass_destroyed" );
    array[ "hidden" ][ "glass_destroyed" ] = 384;
    array[ "spotted" ][ "gunshot_teammate" ] = function_9d30fd63965bafa9( "gunshot_teammate" );
    array[ "hidden" ][ "gunshot_teammate" ] = 1500;
    array[ "spotted" ][ "new_enemy" ] = 128;
    array[ "hidden" ][ "new_enemy" ] = 128;
    set_event_distances( array );
}

// Namespace manager / scripts\stealth\manager
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1469
// Size: 0xd5
function set_event_distances( array )
{
    foreach ( state, state_array in array )
    {
        assertex( state == "<dev string:x41>" || state == "<dev string:x4b>", "<dev string:x56>" );
        
        foreach ( event, value in state_array )
        {
            function_20d5809a5332448f( state, event, value );
            
            if ( function_eac0cd99c9c6d8ee() == state )
            {
                function_7afb89fc511bf315( event, value );
                function_1a3dd0fbfe26893f( event, value );
            }
        }
    }
}

// Namespace manager / scripts\stealth\manager
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1546
// Size: 0x13
function set_custom_distances( array )
{
    set_event_distances( array );
}

// Namespace manager / scripts\stealth\manager
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1561
// Size: 0x172
function set_detect_ranges_internal( hidden, spotted, var_8f3f480583606401 )
{
    var_4beaf1e22c2142f6 = 0.25;
    
    if ( isdefined( hidden ) )
    {
        function_3c1c3f98cd23089e( "hidden", "prone", hidden[ "prone" ] );
        function_3c1c3f98cd23089e( "hidden", "crouch", hidden[ "crouch" ] );
        function_3c1c3f98cd23089e( "hidden", "stand", hidden[ "stand" ] );
        
        if ( !isdefined( hidden[ "shadow" ] ) )
        {
            hidden[ "shadow" ] = var_4beaf1e22c2142f6;
        }
        
        function_3c1c3f98cd23089e( "hidden", "shadow", hidden[ "shadow" ] );
    }
    
    if ( isdefined( spotted ) )
    {
        function_3c1c3f98cd23089e( "spotted", "prone", spotted[ "prone" ] );
        function_3c1c3f98cd23089e( "spotted", "crouch", spotted[ "crouch" ] );
        function_3c1c3f98cd23089e( "spotted", "stand", spotted[ "stand" ] );
        
        if ( !isdefined( spotted[ "shadow" ] ) )
        {
            spotted[ "shadow" ] = var_4beaf1e22c2142f6;
        }
        
        function_3c1c3f98cd23089e( "spotted", "shadow", spotted[ "shadow" ] );
    }
    
    if ( isdefined( var_8f3f480583606401 ) )
    {
        if ( isdefined( var_8f3f480583606401[ "prone" ] ) )
        {
            function_c98df02c041adccb( "prone", var_8f3f480583606401[ "prone" ] );
        }
        
        if ( isdefined( var_8f3f480583606401[ "crouch" ] ) )
        {
            function_c98df02c041adccb( "crouch", var_8f3f480583606401[ "crouch" ] );
        }
        
        if ( isdefined( var_8f3f480583606401[ "stand" ] ) )
        {
            function_c98df02c041adccb( "stand", var_8f3f480583606401[ "stand" ] );
        }
    }
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16db
// Size: 0xe1
function manager_thread()
{
    while ( true )
    {
        flag_wait( "stealth_enabled" );
        scripts\stealth\threat_sight::threat_sight_set_dvar( 1 );
        
        if ( !playerlootenabled() && level.stealth.var_19a752c76729adea == "DuringStealth" )
        {
            setsaveddvar( @"ai_corpsesynch", 1 );
        }
        
        flag_wait( "stealth_spotted" );
        
        if ( !playerlootenabled() && level.stealth.var_19a752c76729adea == "DuringStealth" )
        {
            setsaveddvar( @"ai_corpsesynch", 0 );
        }
        
        if ( !flag( "stealth_enabled" ) )
        {
            continue;
        }
        
        event_change( "spotted" );
        flag_waitopen( "stealth_spotted" );
        
        if ( !flag( "stealth_enabled" ) )
        {
            continue;
        }
        
        event_change( "hidden" );
        waittillframeend();
    }
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c4
// Size: 0xae, Type: bool
function anyone_in_combat()
{
    if ( !isdefined( level.stealth ) )
    {
        return false;
    }
    
    if ( function_1bb1470f934a81eb() )
    {
        return true;
    }
    
    ais = getaiunittypearray( "bad_guys", "all" );
    
    foreach ( guy in ais )
    {
        if ( !isdefined( guy.stealth ) && isdefined( guy.enemy ) && guy.enemy == self )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x187b
// Size: 0x91, Type: bool
function function_6c78f7f002b9d507()
{
    if ( isdefined( level.stealth.groupdata ) )
    {
        foreach ( group in level.stealth.groupdata.groups )
        {
            if ( scripts\stealth\group::function_624f57a99242f017( group.name ) )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1915
// Size: 0x3, Type: bool
function anyone_in_hunt()
{
    return false;
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1921
// Size: 0x10e
function update_stealth_spotted_thread()
{
    waitframe();
    wasspotted = 0;
    
    while ( true )
    {
        bspotted = anyone_in_combat();
        
        if ( bspotted )
        {
            if ( !wasspotted && isdefined( level.stealth.stealth_spotted_delay ) && level.stealth.stealth_spotted_delay > 0 )
            {
                wait level.stealth.stealth_spotted_delay;
                
                if ( !anyone_in_combat() )
                {
                    waitframe();
                    continue;
                }
            }
            
            if ( !flag( "stealth_spotted" ) )
            {
                flag_set( "stealth_spotted" );
                
                if ( isdefined( self.stealth ) )
                {
                    var_f950051ecb0cd613 = scripts\stealth\utility::get_group_flagname( "stealth_spotted" );
                    flag_set( var_f950051ecb0cd613 );
                }
            }
        }
        else if ( flag( "stealth_spotted" ) )
        {
            flag_clear( "stealth_spotted" );
            
            if ( isdefined( self.stealth ) )
            {
                var_f950051ecb0cd613 = scripts\stealth\utility::get_group_flagname( "stealth_spotted" );
                flag_clear( var_f950051ecb0cd613 );
            }
        }
        
        wasspotted = bspotted;
        waitframe();
    }
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a37
// Size: 0x99
function teams_thread()
{
    level.stealth.enemies[ "axis" ] = [];
    level.stealth.enemies[ "allies" ] = [];
    
    while ( true )
    {
        flag_wait( "stealth_enabled" );
        level.stealth.enemies[ "axis" ] = level.players;
        level.stealth.enemies[ "allies" ] = getaiarray( "axis" );
        wait 0.05;
    }
}

// Namespace manager / scripts\stealth\manager
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad8
// Size: 0xc0
function event_change( name )
{
    function_ab26892d96278702( name );
    ai_event = function_373416b9ec7dd155();
    
    foreach ( state, state_array in ai_event )
    {
        if ( state == name )
        {
            foreach ( key, event in state_array )
            {
                function_7afb89fc511bf315( key, event );
                function_1a3dd0fbfe26893f( key, event );
            }
        }
    }
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba0
// Size: 0x4c
function init_save()
{
    flag_init( "stealth_player_nade" );
    level.stealth.save.player_nades = 0;
    
    if ( !issp() )
    {
        return;
    }
    
    array_thread( level.players, &player_grenade_check );
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf4
// Size: 0x3b
function player_grenade_check()
{
    while ( true )
    {
        self waittill( "grenade_pullback" );
        flag_set( "stealth_player_nade" );
        self waittill( "grenade_fire", grenade );
        thread player_grenade_check_dieout( grenade );
    }
}

// Namespace manager / scripts\stealth\manager
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c37
// Size: 0x83
function player_grenade_check_dieout( grenade )
{
    level.stealth.save.player_nades++;
    grenade waittill_notify_or_timeout( "death", 10 );
    level.stealth.save.player_nades--;
    waittillframeend();
    
    if ( !level.stealth.save.player_nades )
    {
        flag_clear( "stealth_player_nade" );
    }
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc2
// Size: 0x60d
function init_stealth_volumes()
{
    level.stealth.combat_volumes = [];
    level.stealth.hunt_volumes = [];
    level.stealth.investigate_volumes = [];
    allvolumes = getentarray( "info_volume_stealth_all", "classname" );
    volumes = getentarray( "info_volume_stealth_combat", "classname" );
    volumes = array_combine( volumes, allvolumes );
    
    if ( isdefined( volumes ) )
    {
        foreach ( vol in volumes )
        {
            if ( isdefined( vol.script_stealthgroup ) && vol.script_stealthgroup != "-1" )
            {
                assertex( isdefined( vol.script_stealthgroup ), "<dev string:xa2>" + vol.origin );
                assertex( vol.script_stealthgroup != "<dev string:xd2>" && vol.script_stealthgroup != "<dev string:xd8>", "<dev string:xdc>" + vol.origin );
                groups = strtok( vol.script_stealthgroup, " " );
                
                foreach ( group in groups )
                {
                    /#
                        if ( istrue( level.var_eb4bce9b222e36ac ) && ( group == "<dev string:x122>" || group == "<dev string:x145>" ) )
                        {
                            vol.var_8f311e6e8157487c = 1;
                        }
                        
                        if ( isdefined( level.stealth.combat_volumes[ group ] ) && !istrue( vol.var_8f311e6e8157487c ) )
                        {
                            assertmsg( "<dev string:x168>" + group + "<dev string:x17a>" + vol.origin + "<dev string:x1a7>" + level.stealth.combat_volumes[ group ].origin );
                        }
                    #/
                    
                    level.stealth.combat_volumes[ group ] = vol;
                }
            }
        }
    }
    
    volumes = getentarray( "info_volume_stealth_hunt", "classname" );
    volumes = array_combine( volumes, allvolumes );
    
    if ( isdefined( volumes ) )
    {
        foreach ( vol in volumes )
        {
            if ( isdefined( vol.script_stealthgroup ) && vol.script_stealthgroup != "-1" )
            {
                assertex( isdefined( vol.script_stealthgroup ), "<dev string:x1ac>" + vol.origin );
                assertex( vol.script_stealthgroup != "<dev string:xd2>" && vol.script_stealthgroup != "<dev string:xd8>", "<dev string:x1da>" + vol.origin );
                groups = strtok( vol.script_stealthgroup, " " );
                
                foreach ( group in groups )
                {
                    /#
                        if ( isdefined( level.stealth.hunt_volumes[ group ] ) && !istrue( vol.var_8f311e6e8157487c ) )
                        {
                            assertmsg( "<dev string:x168>" + group + "<dev string:x21e>" + vol.origin + "<dev string:x1a7>" + level.stealth.hunt_volumes[ group ].origin );
                        }
                    #/
                    
                    level.stealth.hunt_volumes[ group ] = vol;
                }
            }
        }
    }
    
    volumes = getentarray( "info_volume_stealth_investigate", "classname" );
    volumes = array_combine( volumes, allvolumes );
    
    if ( isdefined( volumes ) )
    {
        foreach ( vol in volumes )
        {
            if ( isdefined( vol.script_stealthgroup ) && vol.script_stealthgroup != "-1" )
            {
                assertex( isdefined( vol.script_stealthgroup ), "<dev string:x249>" + vol.origin );
                assertex( vol.script_stealthgroup != "<dev string:xd2>" && vol.script_stealthgroup != "<dev string:xd8>", "<dev string:x27e>" + vol.origin );
                groups = strtok( vol.script_stealthgroup, " " );
                
                foreach ( group in groups )
                {
                    /#
                        if ( isdefined( level.stealth.investigate_volumes[ group ] ) && !istrue( vol.var_8f311e6e8157487c ) )
                        {
                            assertmsg( "<dev string:x168>" + group + "<dev string:x2c9>" + vol.origin + "<dev string:x1a7>" + level.stealth.investigate_volumes[ group ].origin );
                        }
                    #/
                    
                    level.stealth.investigate_volumes[ group ] = vol;
                }
            }
        }
    }
}

// Namespace manager / scripts\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d7
// Size: 0x3e
function playerlootenabled()
{
    if ( isdefined( level.stealth ) && isdefined( level.stealth.fnplayerlootenabled ) )
    {
        return [[ level.stealth.fnplayerlootenabled ]]();
    }
    
    return 0;
}

