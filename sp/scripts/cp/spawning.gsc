#using script_17ca3af80f14ce7e;
#using script_78ee1f1787a2e6a4;
#using scripts\anim\squadmanager;
#using scripts\anim\utility_common;
#using scripts\asm\asm_bb;
#using scripts\common\ai;
#using scripts\common\utility;
#using scripts\common\vehicle_aianim;
#using scripts\cp\agent_drops;
#using scripts\cp\aitypes;
#using scripts\cp\coop_stealth;
#using scripts\cp\cp_agent_utils;
#using scripts\cp\cp_challenge;
#using scripts\cp\cp_escalation;
#using scripts\cp\cp_hud_message;
#using scripts\cp\cp_outline;
#using scripts\cp\cp_skits;
#using scripts\cp\cp_spawning_util;
#using scripts\cp\cp_wave_spawning;
#using scripts\cp\drone\scout_drone;
#using scripts\cp\nvg_ai;
#using scripts\cp\spawner_scoring;
#using scripts\cp\utility;
#using scripts\cp\vehicles;
#using scripts\cp\vo;
#using scripts\cp\weapon;
#using scripts\cp_mp\agents\agent_utils;
#using scripts\cp_mp\vehicles\vehicle_tracking;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\mp_agent;
#using scripts\stealth\callbacks;

#namespace spawning;

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d70
// Size: 0xc4
function spawning_init()
{
    /#
        setdvarifuninitialized( @"hash_38a088b03f78dca1", "<dev string:x1c>" );
    #/
    
    function_d744b74e99ce310e();
    init_spawn_vars_and_pointers();
    level thread scripts\cp\cp_skits::setup_spawn_skits();
    scripts\cp\aitypes::aitypes_init();
    level thread scripts\cp\cp_escalation::main();
    scripts\cp\cp_wave_spawning::init_wave_spawning();
    scripts\cp\coop_stealth::coop_stealth_init();
    level thread init_trigger_spawn_groups();
    
    if ( !threatbiasgroupexists( "axis" ) )
    {
        createthreatbiasgroup( "axis" );
    }
    
    if ( !threatbiasgroupexists( "allies" ) )
    {
        createthreatbiasgroup( "allies" );
    }
    
    if ( !threatbiasgroupexists( "civilian" ) )
    {
        createthreatbiasgroup( "civilian" );
    }
    
    modular_spawning_debug_init();
    
    if ( getdvarint( @"hash_5a01142d62d08a10", 1 ) == 1 )
    {
        function_401d0838f4f47c3e( 1 );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3c
// Size: 0x1a
function function_d744b74e99ce310e()
{
    flag_init( "disable_vehicle_spawning" );
    flag_init( "cover_spawners_initialized" );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5e
// Size: 0x16c
function init_spawn_vars_and_pointers()
{
    level.ignoredbycheck = &isentignoredbyme;
    level.spawn_queue = 0;
    level.active_spawn_modules = [];
    level.spawn_module_structs_memory = [];
    level.module_group_id = 0;
    level.spawnloopupdatefunc = &update_spawn_data_on_death;
    level.enemy_monitor_func = &enemy_monitor;
    level.modular_spawning_vehicles = [];
    level.ambientgroups = [];
    level.current_num_spawned_enemies = 0;
    level.current_num_spawned_soldiers = 0;
    level.current_num_spawned_juggernauts = 0;
    level.reserved_spawn_slots = [];
    level.delayed_spawn_slots = 0;
    level.spawned_enemies = [];
    level.spawned_allies = [];
    level.spawned_ai = [];
    level.active_spawn_module_structs = [];
    level.spawner_script_funcs = [];
    level.requested_spawns_groups = [];
    level.valid_air_vehicle_spawn_points = [];
    level.all_spawned_vehicles = [];
    level.cluster_spawners = [];
    level.grouped_modules = [];
    level.spawn_scoring_pois = [];
    level.aitype_override = [];
    level.aitype_override_weights = [];
    level.aitype_override_cumulative_weight = 0;
    level.can_kill_off_list = [];
    level.combined_counters_groups = [];
    level.show_active_modules = 0;
    level.ignore_spawn_scoring_pois = [];
    level.spawner_poison_structs = [];
    level.skip_player_pos_memory = 0;
    level.lastspawnvocallouttimes = [];
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fd2
// Size: 0x91
function isentignoredbyme( var_3f9432bb52855fcc, var_d620ff0c955ac649 )
{
    if ( !isagent( var_3f9432bb52855fcc ) )
    {
        return 0;
    }
    
    if ( istrue( var_d620ff0c955ac649.ignoreme ) )
    {
        return 1;
    }
    
    var_b597609d6bc61fb8 = var_3f9432bb52855fcc getthreatbiasgroup();
    var_b597639d6bc62651 = var_d620ff0c955ac649 getthreatbiasgroup();
    
    if ( isdefined( level.ignoremegroups ) && isdefined( level.ignoremegroups[ var_b597639d6bc62651 ] ) )
    {
        if ( array_contains( level.ignoremegroups[ var_b597639d6bc62651 ], var_b597609d6bc61fb8 ) )
        {
            return 1;
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x206b
// Size: 0x9d
function function_7736c252ad19c782( module_struct, spawnpoint_override, spawn_parameter_array, var_3a308e048fa5cec7 )
{
    if ( isdefined( spawnpoint_override ) )
    {
        spawnpoint = spawnpoint_override;
        spawnpoint spawner_init();
    }
    else
    {
        spawnpoint = choose_spawnpoint( module_struct );
    }
    
    if ( isdefined( module_struct ) )
    {
        module_struct.respawning = undefined;
    }
    
    if ( !isdefined( spawnpoint ) )
    {
        change_module_status( module_struct, "No Spawner" );
        return 0;
    }
    
    if ( isdefined( module_struct ) && istrue( module_struct.skip_soldier_spawn ) )
    {
        change_module_status( module_struct, "Skipped Spawning" );
        return 1;
    }
    
    return function_4441d2c30537ec6b( module_struct, spawnpoint, 0, undefined, spawn_parameter_array, var_3a308e048fa5cec7 );
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2111
// Size: 0x1d0
function choose_spawnpoint( group, respawn, respawn_ent )
{
    if ( isdefined( group.vehicle ) )
    {
        return group.vehicle.spawn_point find_spawn_loc_from_vehicle_spawner( group );
    }
    
    if ( istrue( respawn ) )
    {
        group.respawning = 1;
    }
    
    var_7d259462d1a09376 = group.spawn_points;
    
    if ( istrue( respawn ) && isdefined( level.var_432e8d8d2b997226 ) && isdefined( level.var_432e8d8d2b997226[ group.group_name ] ) )
    {
        var_7d259462d1a09376 = [[ level.var_432e8d8d2b997226[ group.group_name ] ]]();
    }
    
    spawner_array = group process_module_var( group, var_7d259462d1a09376 );
    spawn_point = group scripts\cp\spawner_scoring::score_ai_spawns( spawner_array, respawn, undefined, respawn_ent );
    group.position_ref = undefined;
    
    if ( istrue( respawn ) )
    {
    }
    
    group scripts\cp\spawner_scoring::print_spawner_score_for_factor( spawn_point );
    
    if ( !isdefined( spawn_point ) )
    {
        return undefined;
    }
    
    if ( istrue( spawn_point scripts\cp\vehicles::is_vehicle_spawnpoint() ) )
    {
        return spawn_point find_spawn_loc_from_vehicle_spawner( group );
    }
    else if ( isdefined( spawn_point.script_reuse_max ) )
    {
        spawn_point.script_reuse_max = int( spawn_point.script_reuse_max );
        
        if ( !isdefined( spawn_point.count ) )
        {
            spawn_point.count = 1;
        }
        else
        {
            spawn_point.count = int( spawn_point.count );
            spawn_point.count++;
        }
        
        if ( spawn_point.count >= spawn_point.script_reuse_max )
        {
            spawn_point.used_recently = 1;
            spawn_point thread reset_spawn_vars();
        }
    }
    else
    {
        spawn_point.used_recently = 1;
    }
    
    return spawn_point;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ea
// Size: 0x17
function reset_spawn_vars()
{
    self notify( "reset_spawn_vars" );
    self endon( "reset_spawn_vars" );
    wait 0.1;
}

// Namespace spawning / scripts\cp\spawning
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2309
// Size: 0x3d7
function function_4441d2c30537ec6b( module_struct, spawnpoint, is_debug, spec_override, spawn_parameter_array, var_3a308e048fa5cec7 )
{
    spec = undefined;
    spawnpoint_override = undefined;
    angle_override = undefined;
    spec_override = undefined;
    
    if ( isdefined( spawnpoint.pos_override_struct ) )
    {
        spawnpoint_override = spawnpoint.pos_override_struct.origin;
        angle_override = spawnpoint.pos_override_struct.angles;
    }
    else if ( isdefined( spawnpoint.vehicle_position ) )
    {
        spawnpoint_override = spawnpoint.origin;
        angle_override = spawnpoint.angles;
    }
    
    if ( isdefined( spawnpoint.specs ) )
    {
        if ( !isarray( spawnpoint.specs ) )
        {
            spawnpoint.specs = [ spawnpoint.specs ];
        }
        
        spec_override = random( spawnpoint.specs );
        spec = spec_override;
    }
    
    var_7208fc96ea182f6 = 0;
    
    if ( !isdefined( spawnpoint.count ) )
    {
        spawnpoint.count = 1;
    }
    
    if ( isdefined( spawnpoint.script_suspend ) )
    {
        var_7208fc96ea182f6 = spawnpoint namespace_1fdb557af4bcd29e::prespawn_suspended_ai();
        
        if ( spawnpoint.count == 0 && !var_7208fc96ea182f6 )
        {
            return undefined;
        }
    }
    
    if ( !istrue( level.var_61198536443ad7ec ) )
    {
        function_f982e82bbd03d707();
    }
    
    soldier = spawnpoint spawn_ai( spawnpoint_override, angle_override, spec_override, module_struct );
    
    if ( isdefined( soldier ) )
    {
        soldier.suspended_ai = spawnpoint.suspended_ai;
        soldier.script_suspend = spawnpoint.script_suspend;
        soldier.script_suspend_group = spawnpoint.script_suspend_group;
        soldier.spawner = spawnpoint;
        change_module_status( module_struct, "Found Agent" );
        spawnpoint notify( "spawn_success" );
        level notify( "spawned_group_soldier", soldier );
        level notify( "ai_spawn_successful", soldier, spawnpoint, spawnpoint.origin, module_struct );
        return run_ai_post_spawn_init( module_struct, soldier, spawnpoint, spawn_parameter_array, spec, is_debug, var_3a308e048fa5cec7 );
    }
    
    if ( var_7208fc96ea182f6 )
    {
        self.count--;
        
        if ( !isdefined( self.try_og_origin ) )
        {
            /#
                if ( getunarchiveddebugdvar( @"hash_38a088b03f78dca1" ) == "<dev string:x1e>" )
                {
                    print3d( self.origin, "<dev string:x20>", ( 0.8, 0.8, 0.2 ), 1, 0.5, 200 );
                    line( self.origin, self.origin + ( 0, 0, 1000 ), ( 0.8, 0.8, 0.2 ), 1, 0, 200 );
                }
            #/
            
            self.try_og_origin = 1;
            spawned = spawn_ai();
            return spawned;
        }
        else
        {
            self.try_og_origin = undefined;
        }
    }
    
    /#
        if ( getunarchiveddebugdvar( @"hash_38a088b03f78dca1" ) == "<dev string:x1e>" )
        {
            aiarray = getaispeciesarray( "<dev string:x42>", "<dev string:x42>" );
            print3d( self.origin, "<dev string:x46>" + aiarray.size + "<dev string:x55>", ( 0.8, 0.2, 0.2 ), 1, 0.8, 200 );
            line( self.origin, self.origin + ( 0, 0, 1000 ), ( 0.8, 0.2, 0.2 ), 1, 0, 200 );
        }
    #/
    
    change_module_status( module_struct, "No Free Agent" );
    spawnpoint notify( "spawn_failed", spawnpoint );
    spawnpoint.aitype = undefined;
    
    if ( istrue( var_3a308e048fa5cec7 ) )
    {
        return undefined;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26e8
// Size: 0x13
function function_f982e82bbd03d707()
{
    while ( !istrue( level.var_61198536443ad7ec ) )
    {
        waitframe();
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2703
// Size: 0x552
function run_ai_post_spawn_init( module_struct, soldier, spawnpoint, spawn_parameter_array, spec, is_debug, var_3a308e048fa5cec7 )
{
    soldier endon( "death" );
    soldier function_1329b355d73712f( undefined, spawnpoint, spawn_parameter_array, module_struct );
    
    /#
        if ( getdvarint( @"hash_9bcca58e56e4c178", 0 ) )
        {
            scripts\cp\cp_outline::enable_outline_for_players( soldier, level.players, "<dev string:x5d>", "<dev string:x74>" );
        }
    #/
    
    soldier ai::spawner_fields( spawnpoint );
    soldier function_bcd664c7997b7469( spawnpoint );
    soldier node_fields_pre_goal( spawnpoint );
    
    if ( isdefined( module_struct ) && module_struct module_disables_spawners_until_owner_death() )
    {
        soldier thread disable_spawner_until_owner_death( spawnpoint );
    }
    
    if ( !soldier is_specified_unittype( "civilian" ) )
    {
        soldier thread scripts\anim\squadmanager::addtosquad();
    }
    
    soldier function_bf4bcf8dc0d42597( spawnpoint, spawn_parameter_array, module_struct );
    spawnpoint function_ec648f2c89ea1c91();
    soldier function_389fff85c076f49e();
    
    if ( isdefined( soldier.suspended_ai ) )
    {
        soldier namespace_1fdb557af4bcd29e::postspawn_suspended_ai();
    }
    
    spawnpoint function_9d9d82f0160fbb53( module_struct );
    soldier function_b395044780aac4();
    soldier function_b34ed4eafa93c760();
    
    if ( isdefined( spawnpoint.specs ) && isdefined( spec ) )
    {
        if ( array_contains( spawnpoint.specs, spec ) )
        {
            spawnpoint.specs = array_remove( spawnpoint.specs, spec );
            
            if ( spawnpoint.specs.size < 1 )
            {
                spawnpoint.specs = undefined;
            }
        }
    }
    
    var_dd1921916c4e99c7 = undefined;
    
    if ( isdefined( spawnpoint.script_animation_type ) )
    {
        if ( !isdefined( module_struct ) || !module_struct ent_flag( "weapons_free" ) )
        {
            var_4b7479ae0df07570 = strtok( spawnpoint.script_animation_type, "," );
            var_dd1921916c4e99c7 = random( var_4b7479ae0df07570 );
        }
    }
    
    if ( isdefined( spawnpoint.script_function ) )
    {
        if ( isdefined( level.spawner_script_funcs[ spawnpoint.script_function ] ) && isdefined( spawnpoint.ai_infil_type ) )
        {
            soldier [[ level.spawner_script_funcs[ spawnpoint.script_function ].script_function ]]( module_struct, spawnpoint, spawnpoint.ai_infil_type );
        }
    }
    else if ( isdefined( var_dd1921916c4e99c7 ) && isdefined( level.spawn_skits[ var_dd1921916c4e99c7 ] ) )
    {
        soldier thread enter_combat_after_stealth();
        soldier thread [[ level.spawn_skits[ var_dd1921916c4e99c7 ].skit_func ]]();
        
        if ( isdefined( level.var_45d5787af040313a ) )
        {
            soldier [[ level.var_45d5787af040313a ]]( level.spawn_skits[ var_dd1921916c4e99c7 ] );
        }
    }
    else
    {
        delaythread( 5, &unset_used_recently, spawnpoint );
        
        if ( soldier is_patroller() || soldier is_pacifist() )
        {
            if ( !isdefined( module_struct ) || module_struct ent_flag_exist( "weapons_free" ) && !module_struct ent_flag( "weapons_free" ) )
            {
                if ( !isdefined( spawnpoint.script_demeanor ) )
                {
                    if ( is_specified_unittype( "civilian" ) )
                    {
                        soldier set_demeanor_from_unittype( "panic" );
                    }
                    else if ( is_specified_unittype( "juggernaut" ) )
                    {
                        if ( soldier.spawnpoint spawnflags_check( 512 ) )
                        {
                            soldier disable_juggernaut_move_behavior( module_struct );
                        }
                    }
                    else if ( isnullweapon( soldier.primaryweapon ) )
                    {
                        soldier set_demeanor_from_unittype( "patrol" );
                    }
                    else
                    {
                        soldier set_demeanor_from_unittype( "patrol" );
                    }
                }
                
                soldier thread start_patrol();
            }
            else
            {
                soldier thread enter_combat();
            }
        }
        else if ( isdefined( spawnpoint.target ) )
        {
            soldier thread enter_combat_after_go_to_node( spawnpoint );
        }
        else
        {
            soldier thread enter_combat();
        }
    }
    
    if ( soldier isjuggernaut() )
    {
        scripts\cp_mp\agents\agent_utils::function_e43f4000cac35ba2( soldier );
    }
    
    tier = "tier1";
    aitype = soldier function_2ee1dc768d1a4703( spawnpoint );
    
    if ( issubstr( aitype, "_t1_" ) || issubstr( aitype, "_tier1_" ) )
    {
        scripts\cp_mp\agents\agent_utils::overridetier1( soldier );
    }
    else if ( issubstr( aitype, "_t2_" ) || issubstr( aitype, "_tier2_" ) )
    {
        tier = "tier2";
        scripts\cp_mp\agents\agent_utils::overridetier2( soldier );
    }
    else if ( issubstr( aitype, "_t3_" ) || issubstr( aitype, "_tier3_" ) )
    {
        tier = "tier3";
        scripts\cp_mp\agents\agent_utils::overridetier3( soldier );
    }
    
    [ tok ] = strtok( aitype, "_" );
    
    if ( isdefined( level.var_9f0b40fbeb9cdde2 ) && isdefined( level.var_9f0b40fbeb9cdde2[ tok ] ) )
    {
        var_64c6ced6d550cd33 = level.var_9f0b40fbeb9cdde2[ tok ];
        soldier scripts\cp_mp\agents\agent_utils::function_77b8b5af85f319d8( var_64c6ced6d550cd33 );
    }
    
    soldier scripts\mp\mp_agent::set_agent_health( scripts\cp_mp\agents\agent_utils::gethealthmax( tier ) );
    
    if ( isdefined( level.gameskillmisstimefrombehindoverride ) )
    {
        soldier.gameskillmisstimefrombehindoverride = level.gameskillmisstimefrombehindoverride;
    }
    
    if ( istrue( var_3a308e048fa5cec7 ) )
    {
        return soldier;
    }
    
    return 1;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c5d
// Size: 0x7c
function function_2ee1dc768d1a4703( spawnpoint )
{
    if ( isdefined( self.aitype ) )
    {
        return self.aitype;
    }
    
    if ( isdefined( spawnpoint.script_aitype ) && spawnpoint.script_aitype != "default" )
    {
        return spawnpoint.script_aitype;
    }
    
    if ( isdefined( spawnpoint.script_noteworthy ) )
    {
        return spawnpoint.script_noteworthy;
    }
    
    return "";
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce1
// Size: 0x11a
function function_1329b355d73712f( trigger, spawnpoint, spawn_parameter_array, group )
{
    if ( isdefined( trigger ) && isdefined( trigger.groupname ) )
    {
        self.groupname = trigger.groupname;
    }
    
    function_2cae33f77b1f866c( spawnpoint );
    function_242733bd4dbb1979( spawnpoint );
    function_78225857c662ebb4();
    self.qsetgoalpos = 1;
    self.var_7c968c5609aded2 = 0;
    function_8029849997321123();
    function_a3c8440bb465635( spawnpoint );
    
    if ( isdefined( spawnpoint.var_72772fa651ecbe2b ) )
    {
        funcs = strtok( spawnpoint.var_72772fa651ecbe2b, "+" );
        
        foreach ( func in funcs )
        {
            if ( isdefined( level.var_a8dc22c62ba69b88[ func ] ) )
            {
                self thread [[ level.var_a8dc22c62ba69b88[ func ] ]]();
            }
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e03
// Size: 0x85
function function_b34ed4eafa93c760()
{
    if ( isdefined( self.aitype ) && isdefined( level.aitypes[ self.aitype ] ) && isdefined( level.aitypes[ self.aitype ].spawn_func ) )
    {
        self thread [[ level.aitypes[ self.aitype ].spawn_func ]]();
    }
    
    if ( function_2a3b21963254b2f6() )
    {
        thread function_eca783af648f13b1( self.aitype );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e90
// Size: 0x89, Type: bool
function function_2a3b21963254b2f6()
{
    var_547fb533f1244631 = istrue( self.pacifist ) || istrue( self.ignoreme ) || istrue( self.ignoreall ) || isdefined( level.global_stealth_broken ) && !istrue( level.global_stealth_broken ) || istrue( level.announcer_vo_playing ) || istrue( level.spawn_vo_playing ) || istrue( level.isteamvoplaying ) || istrue( level.suppress_spawn_vo );
    return !var_547fb533f1244631;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f22
// Size: 0xf7
function function_eca783af648f13b1( aitype )
{
    if ( !getdvarint( @"hash_f316d290504414c4", 0 ) )
    {
        return;
    }
    
    if ( !isdefined( aitype ) )
    {
        assertmsg( "<dev string:x79>" );
        return;
    }
    
    if ( level.lastspawnvocallouttimes[ aitype ] + 60000 > gettime() )
    {
        return;
    }
    
    if ( isdefined( level.aitypes[ aitype ] ) && isdefined( level.aitypes[ aitype ].spawn_vo_lines ) )
    {
        lines = level.aitypes[ aitype ].spawn_vo_lines;
        level.spawn_vo_playing = 1;
        
        if ( isarray( lines ) )
        {
            var_f2af0f8e96b032e7 = random( lines );
            level scripts\cp\vo::try_to_play_vo_on_team( var_f2af0f8e96b032e7, "allies" );
        }
        else
        {
            level scripts\cp\vo::try_to_play_vo_on_team( lines, "allies" );
        }
        
        level.lastspawnvocallouttimes[ aitype ] = gettime();
        level.spawn_vo_playing = 0;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3021
// Size: 0x63
function set_character_models( bodymodelname, headmodelname, viewmodelname )
{
    if ( isdefined( self.headmodel ) )
    {
        self detach( self.headmodel );
    }
    
    if ( isdefined( bodymodelname ) )
    {
        self setmodel( bodymodelname );
    }
    
    if ( isdefined( headmodelname ) )
    {
        self attach( headmodelname, "", 1 );
        self.headmodel = headmodelname;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x308c
// Size: 0xc4
function ai_watchforbadpath()
{
    level endon( "game_ended" );
    self endon( "death" );
    self notify( "ai_watchForBadPath" );
    self endon( "ai_watchForBadPath" );
    var_29d65c2e0b18c7f6 = 0;
    var_b3bffc9a15155a83 = 0;
    wait 5;
    
    while ( true )
    {
        self waittill( "bad_path", var_772edbdcfe906c73 );
        
        if ( getdvarint( @"hash_9758cec587280b4a", 0 ) )
        {
            break;
        }
        
        if ( !has_never_kill_off_flag() )
        {
            time = gettime();
            
            if ( time - var_b3bffc9a15155a83 > 5000 )
            {
                var_29d65c2e0b18c7f6 = 0;
                var_b3bffc9a15155a83 = time;
                continue;
            }
            
            var_29d65c2e0b18c7f6++;
            var_b3bffc9a15155a83 = time;
            
            if ( var_29d65c2e0b18c7f6 >= 10 )
            {
                if ( passed_kill_off_time_checks( gettime() ) )
                {
                    teleport_to_nearby_spawner( "Bad Path", var_772edbdcfe906c73 );
                }
            }
            
            wait 0.5;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3158
// Size: 0x2a
function function_bcd664c7997b7469( spawnpoint )
{
    if ( !istrue( spawnpoint scripts\cp\vehicles::is_vehicle_spawnpoint() ) )
    {
        self.target = spawnpoint.target;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x318a
// Size: 0xbb
function function_bf4bcf8dc0d42597( spawnpoint, spawn_parameter_array, module_struct )
{
    self endon( "death" );
    
    if ( !istrue( level.var_d9b24dfd45b657cb ) )
    {
        thread ai_watchforbadpath();
    }
    
    if ( isdefined( module_struct ) )
    {
        function_cbf9338e97cdb9f7( module_struct );
    }
    
    function_b8177f07a65aa246();
    
    if ( isdefined( level.enemy_monitor_func ) )
    {
        self thread [[ level.enemy_monitor_func ]]( self.unittype );
    }
    
    if ( istrue( self.var_9e5f6ca242b92628 ) || istrue( spawnpoint.var_9e5f6ca242b92628 ) || isdefined( spawnpoint.spawnflags ) && spawnpoint.spawnflags & 4 )
    {
        thread scripts\cp\coop_stealth::run_common_functions( self, 1, 1 );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x324d
// Size: 0x1b
function unset_used_recently( spawnpoint )
{
    if ( isdefined( spawnpoint ) )
    {
        spawnpoint.used_recently = undefined;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3270
// Size: 0x169
function find_spawn_loc_from_vehicle_spawner( group )
{
    /#
        assertex( isdefined( self.script_function ), "<dev string:xb5>" + self.origin + "<dev string:xcd>" );
        assertex( isdefined( level.ai_spawn_vehicle_func[ self.script_function ] ), "<dev string:xb5>" + self.origin + "<dev string:xf7>" + self.script_function + "<dev string:x110>" );
        assertex( isdefined( level.ai_spawn_vehicle_func[ self.script_function ].vehicle_spawn_func ), "<dev string:xb5>" + self.origin + "<dev string:xf7>" + self.script_function + "<dev string:x12f>" );
    #/
    
    if ( !isdefined( self.vehicle ) )
    {
        if ( !spawn_vehicle_at_vehicle_spawner( group ) )
        {
            return undefined;
        }
    }
    
    if ( isdefined( self.vehicle ) && self.vehicle scripts\common\vehicle_aianim::vehicle_hasavailablespots() )
    {
        level notify( "vehicle_spawned", group, self.vehicle );
        group notify( "vehicle_spawned", group, self.vehicle );
        
        if ( isdefined( self.veh_spawn_point ) && isdefined( self.veh_spawn_point.script_vehiclegroup ) )
        {
            return get_near_vehicle_spawner();
        }
        else
        {
            self.pos_override_struct = self.vehicle;
            return self;
        }
        
        return;
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33e1
// Size: 0x87
function get_near_vehicle_spawner()
{
    target_array = getstructarray( self.veh_spawn_point.script_vehiclegroup, "targetname" );
    
    for (i = 0; i < target_array.size; i++) {
        if ( target_array[ i ] == self.veh_spawn_point )
        {
            continue;
        }
        
        if ( !istrue( target_array[ i ].disabled ) )
        {
            self.pos_override_struct = target_array[ i ];
            target_array[ i ].disabled = 1;
            return self;
        }
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3471
// Size: 0xda
function spawn_vehicle_at_vehicle_spawner( group )
{
    if ( !isdefined( self.script_function ) )
    {
        return 0;
    }
    
    if ( has_vehicle_type_exceeded_module_cap( group, self.script_function ) )
    {
        return 0;
    }
    
    if ( [[ level.ai_spawn_vehicle_func[ self.script_function ].vehicle_spawn_func ]]( group, self, self.script_function ) )
    {
        if ( isdefined( group ) )
        {
            group.vehicle vehicle_register_on_level( group.vehicle );
            group.vehicle thread vehicle_deregister_on_death( group.vehicle );
        }
        else
        {
            self.vehicle vehicle_register_on_level( self.vehicle );
            self.vehicle thread vehicle_deregister_on_death( self.vehicle );
        }
        
        return 1;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3553
// Size: 0x1d
function vehicle_register_on_level( vehicle )
{
    level.modular_spawning_vehicles[ vehicle getentitynumber() ] = vehicle;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3578
// Size: 0x4d
function vehicle_deregister_on_death( vehicle )
{
    level endon( "game_ended" );
    ent_num = vehicle getentitynumber();
    vehicle waittill( "death" );
    
    if ( isdefined( vehicle.vehiclename ) )
    {
        scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_deregisterinstance( vehicle );
    }
    
    level.modular_spawning_vehicles[ ent_num ] = undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x35cd
// Size: 0x69
function disable_spawn_point( spawn_point, timeout, group )
{
    if ( isdefined( timeout ) && timeout > 0 )
    {
        spawn_point disable_spawner();
        
        if ( isdefined( group ) )
        {
            group.longer_spawn_delay = 1;
        }
        
        wait timeout;
        
        if ( isdefined( group ) )
        {
            group.longer_spawn_delay = 0;
        }
        
        spawn_point enable_spawner();
        return;
    }
    
    spawn_point disable_spawner();
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x363e
// Size: 0x188
function spawn_is_vehicle_spawn( spawn_point )
{
    if ( !isnode( spawn_point ) && isdefined( spawn_point.spawnflags ) )
    {
        spawnflags = int( spawn_point.spawnflags );
        var_dad5b086d6059445 = 16;
        var_29e2f295acb987f2 = 8;
        var_4206edaaaff1f4b0 = 512;
        
        if ( spawnflags & var_dad5b086d6059445 )
        {
            spawn_point define_spawner( "vehicle_spawner" );
            spawn_point remove_from_spawner_flags( 8 );
            spawn_point add_to_spawner_flags( 16 );
            
            if ( !isdefined( spawn_point.script_function ) )
            {
                spawn_point.script_function = "random_ground_vehicle_spawn";
            }
        }
        
        if ( spawnflags & var_29e2f295acb987f2 )
        {
            spawn_point define_spawner( "vehicle_spawner" );
            spawn_point add_to_spawner_flags( 8 );
            spawn_point remove_from_spawner_flags( 16 );
            spawn_point.script_goalyaw = 1;
            
            if ( !isdefined( spawn_point.script_function ) )
            {
                spawn_point.script_function = "random_air_vehicle_spawn";
            }
            
            level.valid_air_vehicle_spawn_points[ level.valid_air_vehicle_spawn_points.size ] = spawn_point;
            
            if ( !( spawnflags & 32 ) )
            {
                spawn_point.heli_path_func = &scripts\cp\vehicles::create_heli_path;
            }
        }
        
        if ( ( spawn_point spawner_flags_check( 16 ) || spawn_point spawner_flags_check( 8 ) ) && spawnflags & var_4206edaaaff1f4b0 )
        {
            spawn_point.veh_model_spawner = 1;
            spawn_point.dontgetonpath = 1;
        }
        
        if ( spawnflags & var_29e2f295acb987f2 || spawnflags & var_dad5b086d6059445 )
        {
            return 1;
        }
        else
        {
            return undefined;
        }
        
        return;
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37ce
// Size: 0x40
function define_spawner( spawner_type )
{
    switch ( spawner_type )
    {
        case #"hash_abe4b0e0b6ed2786":
            define_as_cluster_spawner();
            break;
        case #"hash_89eb9062c8daa874":
            define_as_vehicle_spawner();
            break;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3816
// Size: 0x24, Type: bool
function spawnflags_check( var_27ed3d4f53af6b75 )
{
    return isdefined( self.spawnflags ) && self.spawnflags & var_27ed3d4f53af6b75;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3843
// Size: 0x24, Type: bool
function spawner_flags_check( var_27ed3d4f53af6b75 )
{
    return isdefined( self.spawner_flags ) && self.spawner_flags & var_27ed3d4f53af6b75;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3870
// Size: 0x43
function add_to_spawner_flags( var_1f160f711155c0f6 )
{
    if ( isdefined( self.spawner_flags ) )
    {
        if ( !spawner_flags_check( var_1f160f711155c0f6 ) )
        {
            self.spawner_flags += var_1f160f711155c0f6;
        }
        
        return;
    }
    
    self.spawner_flags = var_1f160f711155c0f6;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38bb
// Size: 0x3b
function remove_from_spawner_flags( var_16a0b3fb97c3a2e7 )
{
    if ( isdefined( self.spawner_flags ) && self.spawner_flags & var_16a0b3fb97c3a2e7 )
    {
        self.spawner_flags -= var_16a0b3fb97c3a2e7;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38fe
// Size: 0x3d
function define_as_cluster_spawner()
{
    if ( isdefined( self.spawner_flags ) )
    {
        if ( !spawner_flags_check( 4 ) )
        {
            self.spawner_flags += 4;
        }
        
        return;
    }
    
    self.spawner_flags = 4;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3943
// Size: 0x3d
function define_as_vehicle_spawner()
{
    if ( isdefined( self.spawner_flags ) )
    {
        if ( !spawner_flags_check( 2 ) )
        {
            self.spawner_flags += 2;
        }
        
        return;
    }
    
    self.spawner_flags = 2;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3988
// Size: 0x17
function returnzeroifundefined( param1 )
{
    if ( isdefined( param1 ) )
    {
        return param1;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39a7
// Size: 0x1b
function returnblankfuncifundefined( param1 )
{
    if ( isdefined( param1 ) )
    {
        return param1;
    }
    
    return &blankmodulefunc;
}

// Namespace spawning / scripts\cp\spawning
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x39ca
// Size: 0x33
function blankmodulefunc( param1, param2, param3, param4, param5, param6 )
{
    
}

// Namespace spawning / scripts\cp\spawning
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x3a05
// Size: 0x3cf
function registerambientgroup( var_dfb0fea7209c8a32, var_a3bb67fb64b35b06, var_c79f045aadae6882, var_2139dc3011d8d4de, var_fcf1d4c447a55e88, var_68f77eb370a10612, var_ff243cc31753ecff, var_730f6140263562ad, var_3f114d8f300f41b2, timeout_action )
{
    struct = spawnstruct();
    group_toks = strtok( var_dfb0fea7209c8a32, "/" );
    
    if ( group_toks.size > 1 )
    {
        struct.group_name = group_toks[ 1 ];
    }
    else
    {
        struct.group_name = var_dfb0fea7209c8a32;
    }
    
    struct.min_size = returnzeroifundefined( var_a3bb67fb64b35b06 );
    struct.max_size = returnzeroifundefined( var_c79f045aadae6882 );
    struct.time_between_spawns = returnzeroifundefined( var_fcf1d4c447a55e88 );
    struct.post_module_delay = returnzeroifundefined( var_68f77eb370a10612 );
    struct.activecount = 0;
    struct.spawn_count = 0;
    struct.ai_spawned = [];
    struct.module_vehicles = [];
    struct.module_vehicles_count = 0;
    struct.total_killed = 0;
    struct.cqb_module = 0;
    struct.debug_struct = struct create_module_debug_struct();
    
    if ( isdefined( var_ff243cc31753ecff ) )
    {
        struct.var_ff243cc31753ecff = var_ff243cc31753ecff;
        struct thread function_c17d56cb0b41476d();
    }
    
    struct.totalspawns = returnzeroifundefined( var_2139dc3011d8d4de );
    struct.start_func = returnblankfuncifundefined( var_730f6140263562ad );
    struct.nextgroup = var_3f114d8f300f41b2;
    struct.timeout_action = timeout_action;
    struct.currentmodulekills = 0;
    struct.currentmoduledeaths = 0;
    
    if ( isdefined( level.ambientgroups[ struct.group_name ] ) )
    {
        if ( isarray( level.ambientgroups[ struct.group_name ] ) )
        {
            newarray = [];
            
            foreach ( entry in level.ambientgroups[ struct.group_name ] )
            {
                newarray = array_add( newarray, entry );
            }
            
            newarray = array_add( newarray, struct );
            level.ambientgroups[ struct.group_name ] = newarray;
        }
        else
        {
            var_c9dc2e68415b7f57 = level.ambientgroups[ struct.group_name ];
            level.ambientgroups[ struct.group_name ] = [ struct, var_c9dc2e68415b7f57 ];
        }
        
        struct.moduleid = level.module_group_id;
        level.module_group_id++;
    }
    else
    {
        struct.moduleid = level.module_group_id;
        level.module_group_id++;
        level.ambientgroups[ struct.group_name ] = struct;
    }
    
    if ( !istrue( level.old_aitype ) )
    {
        var_5198162136305e6e = ":0/" + var_dfb0fea7209c8a32 + ":" + level.ambientgroups.size;
        cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning:3 / Start Module" + var_5198162136305e6e + "\" \"set scr_debug_spawning spawn_module_change &" + struct.group_name + "\" \n";
        addentrytodevgui( cmd );
        cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning:3 / Stop Module" + var_5198162136305e6e + "\" \"set scr_debug_spawning stop_module_change &" + struct.group_name + "\" \n";
        addentrytodevgui( cmd );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ddc
// Size: 0x19f
function function_c17d56cb0b41476d()
{
    flag_wait( "level_ready_for_script" );
    
    if ( isfunction( self.var_ff243cc31753ecff ) )
    {
        self.spawn_points = self.var_ff243cc31753ecff;
        return;
    }
    
    if ( isarray( self.var_ff243cc31753ecff ) )
    {
        var_ff43fad72861489c = 0;
        
        foreach ( var_d92716d4a2e1f895 in self.var_ff243cc31753ecff )
        {
            if ( isstruct( var_d92716d4a2e1f895 ) )
            {
                self.spawn_points = function_6d6af8144a5131f1( self.spawn_points, var_d92716d4a2e1f895 );
                var_ff43fad72861489c = 1;
                continue;
            }
            
            if ( isstring( var_d92716d4a2e1f895 ) )
            {
                self.spawn_points = array_combine( self.spawn_points, getstructarray( var_d92716d4a2e1f895, "targetname" ) );
            }
        }
        
        for (i = 0; i < self.spawn_points.size; i++) {
            spawn_point = self.spawn_points[ i ];
            spawn_point thread spawner_init();
        }
        
        if ( !var_ff43fad72861489c )
        {
            self.spawn_points = [ &return_spawners_by_targetname, self.var_ff243cc31753ecff ];
        }
        
        return;
    }
    
    self.spawn_points = getstructarray( self.var_ff243cc31753ecff, "targetname" );
    
    for (i = 0; i < self.spawn_points.size; i++) {
        self.spawn_points[ i ] thread spawner_init();
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f83
// Size: 0x8b
function return_spawners_by_targetname( group, spawner_targetnames )
{
    if ( !isarray( spawner_targetnames ) )
    {
        spawner_targetnames = [ spawner_targetnames ];
    }
    else
    {
        temp_array = [];
        
        for (i = 0; i < spawner_targetnames.size; i++) {
            temp_array[ temp_array.size ] = spawner_targetnames[ i ];
        }
        
        spawner_targetnames = temp_array;
    }
    
    return_array = [];
    
    for (i = 0; i < spawner_targetnames.size; i++) {
        return_array = array_combine( return_array, getstructarray( spawner_targetnames[ i ], "targetname" ) );
    }
    
    return return_array;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4017
// Size: 0x51
function delay_start_specified_module()
{
    if ( getdvar( @"hash_3ed315459bea5889", "" ) != "" )
    {
        flag_wait( "level_ready_for_script" );
        wait 2;
        module_struct = run_spawn_module( getdvar( @"hash_3ed315459bea5889", "" ) );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4070
// Size: 0x1e9
function return_cover_spawners( group )
{
    if ( istrue( group.use_only_veh_spawners ) )
    {
        return [];
    }
    
    if ( isdefined( group.cover_node_spawners_override ) && group.cover_node_spawners_override.size > 0 )
    {
        temp_array = [];
        k = getarraykeys( group.cover_node_spawners_override );
        
        for (i = 0; i < group.cover_node_spawners_override.size; i++) {
            temp_array = array_combine( temp_array, group.cover_node_spawners_override[ k[ i ] ] );
        }
        
        if ( temp_array.size > 0 )
        {
            return temp_array;
        }
    }
    else if ( isdefined( group.wave_spawner_overrides ) && group.wave_spawner_overrides.size > 0 )
    {
        temp_array = [];
        
        for (i = 0; i < group.wave_spawner_overrides.size; i++) {
            spawners = getstructarray( group.wave_spawner_overrides[ i ], "targetname" );
            temp_array = array_combine( temp_array, spawners );
        }
        
        if ( temp_array.size > 0 )
        {
            return temp_array;
        }
    }
    else if ( isdefined( group.requested_spawners ) && group.requested_spawners.size > 0 )
    {
        temp_array = [];
        
        for (i = 0; i < group.requested_spawners.size; i++) {
            spawners = getstructarray( group.requested_spawners[ i ], "targetname" );
            temp_array = array_combine( temp_array, spawners );
        }
        
        if ( temp_array.size > 0 )
        {
            if ( isdefined( level.cover_node_spawners ) )
            {
                return array_combine( level.cover_node_spawners, temp_array );
            }
            else
            {
                return temp_array;
            }
        }
        else if ( isdefined( level.cover_node_spawners ) )
        {
            return level.cover_node_spawners;
        }
        else
        {
            return [];
        }
    }
    
    if ( isdefined( level.cover_node_spawners ) )
    {
        return level.cover_node_spawners;
    }
    
    return [];
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4261
// Size: 0x18
function setup_wave_vars( group )
{
    group.spawn_aitype_counts = [];
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4281
// Size: 0x5bf
function split_array_into_quadrants( starting_array )
{
    if ( isdefined( starting_array ) && starting_array.size < 1 )
    {
        return [];
    }
    
    center_point = get_center_point_of_array( starting_array );
    center_struct = spawnstruct();
    center_struct.origin = center_point;
    center_struct.angles = ( 0, 0, 0 );
    front_right = [];
    front_left = [];
    back_right = [];
    back_left = [];
    parent_structs = [];
    parent_arrays = [];
    var_b9136fe80f16de8b = [];
    var_97ca37190a8be9ad = [];
    var_e5b8f0d2cf9e0daf = [];
    var_f316cbef6615fc99 = [];
    
    for (i = 0; i < starting_array.size; i++) {
        point = starting_array[ i ];
        in_front = center_struct cp_is_point_in_front( point.origin );
        on_right = center_struct cp_is_point_on_right( point.origin );
        
        if ( in_front && on_right )
        {
            front_right[ front_right.size ] = point;
            continue;
        }
        
        if ( !in_front && !on_right )
        {
            back_left[ back_left.size ] = point;
            continue;
        }
        
        if ( !in_front && on_right )
        {
            back_right[ back_right.size ] = point;
            continue;
        }
        
        if ( in_front && !on_right )
        {
            front_left[ front_left.size ] = point;
        }
    }
    
    if ( isdefined( front_right ) )
    {
        if ( front_right.size > 64 )
        {
            var_b9136fe80f16de8b = split_array_into_quadrants( front_right );
            
            for (i = 0; i < var_b9136fe80f16de8b.size; i++) {
                parent_struct = var_b9136fe80f16de8b[ i ];
                
                if ( isdefined( parent_struct.child_spawners ) && parent_struct.child_spawners.size > 0 )
                {
                    parent_struct.origin = get_center_point_of_array( parent_struct.child_spawners );
                    parent_struct.angles = ( 0, 0, 0 );
                    parent_structs[ parent_structs.size ] = parent_struct;
                }
            }
        }
        else
        {
            parent_struct = spawnstruct();
            parent_struct.child_spawners = front_right;
            
            if ( isdefined( parent_struct.child_spawners ) && parent_struct.child_spawners.size > 0 )
            {
                parent_struct.origin = get_center_point_of_array( parent_struct.child_spawners );
                parent_struct.angles = ( 0, 0, 0 );
                parent_structs[ parent_structs.size ] = parent_struct;
            }
        }
    }
    
    if ( isdefined( front_left ) )
    {
        if ( front_left.size > 64 )
        {
            var_97ca37190a8be9ad = split_array_into_quadrants( front_left );
            
            for (i = 0; i < var_97ca37190a8be9ad.size; i++) {
                parent_struct = var_97ca37190a8be9ad[ i ];
                
                if ( isdefined( parent_struct.child_spawners ) && parent_struct.child_spawners.size > 0 )
                {
                    parent_struct.origin = get_center_point_of_array( parent_struct.child_spawners );
                    parent_struct.angles = ( 0, 0, 0 );
                    parent_structs[ parent_structs.size ] = parent_struct;
                }
            }
        }
        else
        {
            parent_struct = spawnstruct();
            parent_struct.child_spawners = front_left;
            
            if ( isdefined( parent_struct.child_spawners ) && parent_struct.child_spawners.size > 0 )
            {
                parent_struct.origin = get_center_point_of_array( parent_struct.child_spawners );
                parent_struct.angles = ( 0, 0, 0 );
                parent_structs[ parent_structs.size ] = parent_struct;
            }
        }
    }
    
    if ( isdefined( back_right ) )
    {
        if ( back_right.size > 64 )
        {
            var_e5b8f0d2cf9e0daf = split_array_into_quadrants( back_right );
            
            for (i = 0; i < var_e5b8f0d2cf9e0daf.size; i++) {
                parent_struct = var_e5b8f0d2cf9e0daf[ i ];
                
                if ( isdefined( parent_struct.child_spawners ) && parent_struct.child_spawners.size > 0 )
                {
                    parent_struct.origin = get_center_point_of_array( parent_struct.child_spawners );
                    parent_struct.angles = ( 0, 0, 0 );
                    parent_structs[ parent_structs.size ] = parent_struct;
                }
            }
        }
        else
        {
            parent_struct = spawnstruct();
            parent_struct.child_spawners = back_right;
            
            if ( isdefined( parent_struct.child_spawners ) && parent_struct.child_spawners.size > 0 )
            {
                parent_struct.origin = get_center_point_of_array( parent_struct.child_spawners );
                parent_struct.angles = ( 0, 0, 0 );
                parent_structs[ parent_structs.size ] = parent_struct;
            }
        }
    }
    
    if ( isdefined( back_left ) )
    {
        if ( back_left.size > 64 )
        {
            var_f316cbef6615fc99 = split_array_into_quadrants( back_left );
            
            for (i = 0; i < var_f316cbef6615fc99.size; i++) {
                parent_struct = var_f316cbef6615fc99[ i ];
                
                if ( isdefined( parent_struct.child_spawners ) && parent_struct.child_spawners.size > 0 )
                {
                    parent_struct.origin = get_center_point_of_array( parent_struct.child_spawners );
                    parent_struct.angles = ( 0, 0, 0 );
                    parent_structs[ parent_structs.size ] = parent_struct;
                }
            }
        }
        else
        {
            parent_struct = spawnstruct();
            parent_struct.child_spawners = back_left;
            
            if ( isdefined( parent_struct.child_spawners ) && parent_struct.child_spawners.size > 0 )
            {
                parent_struct.origin = get_center_point_of_array( parent_struct.child_spawners );
                parent_struct.angles = ( 0, 0, 0 );
                parent_structs[ parent_structs.size ] = parent_struct;
            }
        }
    }
    
    front_right = undefined;
    front_left = undefined;
    back_right = undefined;
    back_left = undefined;
    parent_arrays = undefined;
    var_b9136fe80f16de8b = undefined;
    var_97ca37190a8be9ad = undefined;
    var_e5b8f0d2cf9e0daf = undefined;
    var_f316cbef6615fc99 = undefined;
    return parent_structs;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4849
// Size: 0x85
function register_module_as_passive( group_name )
{
    if ( isdefined( level.ambientgroups[ group_name ] ) )
    {
        if ( isarray( level.ambientgroups[ group_name ] ) )
        {
            for (i = 0; i < level.ambientgroups[ group_name ].size; i++) {
                level.ambientgroups[ group_name ][ i ].is_passive = 1;
            }
            
            return;
        }
        
        level.ambientgroups[ group_name ].is_passive = 1;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x48d6
// Size: 0x11f
function register_module_ai_spawn_func( group_name, func )
{
    if ( isdefined( level.ambientgroups[ group_name ] ) )
    {
        if ( isarray( level.ambientgroups[ group_name ] ) )
        {
            for (i = 0; i < level.ambientgroups[ group_name ].size; i++) {
                if ( !isdefined( level.ambientgroups[ group_name ][ i ].ai_spawn_func ) )
                {
                    level.ambientgroups[ group_name ][ i ].ai_spawn_func = [];
                }
                
                level.ambientgroups[ group_name ][ i ].ai_spawn_func[ level.ambientgroups[ group_name ][ i ].ai_spawn_func.size ] = func;
            }
            
            return;
        }
        
        if ( !isdefined( level.ambientgroups[ group_name ].ai_spawn_func ) )
        {
            level.ambientgroups[ group_name ].ai_spawn_func = [];
        }
        
        level.ambientgroups[ group_name ].ai_spawn_func[ level.ambientgroups[ group_name ].ai_spawn_func.size ] = func;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x49fd
// Size: 0x11f
function register_module_weapons_free_func( group_name, func )
{
    if ( isdefined( level.ambientgroups[ group_name ] ) )
    {
        if ( isarray( level.ambientgroups[ group_name ] ) )
        {
            for (i = 0; i < level.ambientgroups[ group_name ].size; i++) {
                if ( !isdefined( level.ambientgroups[ group_name ][ i ].fn_weapons_free ) )
                {
                    level.ambientgroups[ group_name ][ i ].fn_weapons_free = [];
                }
                
                level.ambientgroups[ group_name ][ i ].fn_weapons_free[ level.ambientgroups[ group_name ][ i ].fn_weapons_free.size ] = func;
            }
            
            return;
        }
        
        if ( !isdefined( level.ambientgroups[ group_name ].fn_weapons_free ) )
        {
            level.ambientgroups[ group_name ].fn_weapons_free = [];
        }
        
        level.ambientgroups[ group_name ].fn_weapons_free[ level.ambientgroups[ group_name ].fn_weapons_free.size ] = func;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b24
// Size: 0x11f
function register_module_ai_death_func( group_name, func )
{
    if ( isdefined( level.ambientgroups[ group_name ] ) )
    {
        if ( isarray( level.ambientgroups[ group_name ] ) )
        {
            for (i = 0; i < level.ambientgroups[ group_name ].size; i++) {
                if ( !isdefined( level.ambientgroups[ group_name ][ i ].ai_death_func ) )
                {
                    level.ambientgroups[ group_name ][ i ].ai_death_func = [];
                }
                
                level.ambientgroups[ group_name ][ i ].ai_death_func[ level.ambientgroups[ group_name ][ i ].ai_death_func.size ] = func;
            }
            
            return;
        }
        
        if ( !isdefined( level.ambientgroups[ group_name ].ai_death_func ) )
        {
            level.ambientgroups[ group_name ].ai_death_func = [];
        }
        
        level.ambientgroups[ group_name ].ai_death_func[ level.ambientgroups[ group_name ].ai_death_func.size ] = func;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c4b
// Size: 0x5a
function module_run_func_after_notify()
{
    if ( isdefined( self.funcs_after_notifies ) )
    {
        self endon( "all_group_spawns_dead" );
        waittill_strings = getarraykeys( self.funcs_after_notifies );
        
        while ( true )
        {
            result = level waittill_any_in_array_return( waittill_strings );
            self thread [[ self.funcs_after_notifies[ result ] ]]();
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4cad
// Size: 0x111
function set_spawn_scoring_params_for_group( group_name, close_dist, far_dist, too_far_dist, far_score, game_modes )
{
    if ( isdefined( game_modes ) )
    {
        gametype = level.gametype;
        toks = strtok( game_modes, " " );
        
        for (i = 0; i < toks.size; i++) {
            if ( toks[ i ] == gametype )
            {
                break;
            }
        }
        
        return;
    }
    
    if ( isdefined( level.ambientgroups[ group_name ] ) )
    {
        if ( isarray( level.ambientgroups[ group_name ] ) )
        {
            for (i = 0; i < level.ambientgroups[ group_name ].size; i++) {
                level.ambientgroups[ group_name ][ i ].spawn_scoring_overrides = create_spawn_scoring_struct( close_dist, far_dist, too_far_dist, far_score );
            }
            
            return;
        }
        
        level.ambientgroups[ group_name ].spawn_scoring_overrides = create_spawn_scoring_struct( close_dist, far_dist, too_far_dist, far_score );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4dc6
// Size: 0x151
function create_spawn_scoring_struct( close_dist, far_dist, too_far_dist, far_score )
{
    struct = spawnstruct();
    
    if ( isdefined( close_dist ) )
    {
        struct.close_dist = int( close_dist );
    }
    else
    {
        struct.close_dist = 1024;
    }
    
    struct.close_dist_sq = struct.close_dist * struct.close_dist;
    
    if ( isdefined( far_dist ) )
    {
        struct.far_dist = int( far_dist );
    }
    else
    {
        struct.far_dist = 2048;
    }
    
    struct.far_dist_sq = struct.far_dist * struct.far_dist;
    
    if ( isdefined( too_far_dist ) )
    {
        struct.too_far_dist = int( too_far_dist );
        struct.too_far_dist_sq = struct.too_far_dist * struct.too_far_dist;
    }
    else
    {
        struct.too_far_dist = 4096;
        struct.too_far_dist_sq = 16777216;
    }
    
    if ( isdefined( far_score ) )
    {
        struct.far_score = int( far_score );
    }
    else
    {
        struct.far_score = 20;
    }
    
    return struct;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f20
// Size: 0xea
function get_spawned_ai_from_group_struct( group_name )
{
    temp_array = [];
    
    if ( isstruct( self ) )
    {
        if ( isarray( self ) )
        {
            for (i = 0; i < self.size; i++) {
                temp_array = array_combine( temp_array, self[ i ].ai_spawned );
            }
        }
        else
        {
            temp_array = self.ai_spawned;
        }
    }
    else if ( isdefined( level.active_spawn_module_structs[ group_name ] ) )
    {
        module = level.active_spawn_module_structs[ group_name ];
        
        if ( isarray( module ) )
        {
            for (j = 0; j < module.size; j++) {
                group = module[ j ];
                temp_array = array_combine( temp_array, group.ai_spawned );
            }
        }
        else
        {
            temp_array = array_combine( temp_array, module.ai_spawned );
        }
    }
    
    return temp_array;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5013
// Size: 0xc9
function get_ai_by_groupname( group_name )
{
    group_structs = get_module_structs_by_groupname( group_name );
    guys = [];
    
    foreach ( group_struct in group_structs )
    {
        ai_array = get_spawned_ai_from_group_struct( group_name );
        
        foreach ( enemy in ai_array )
        {
            guys[ guys.size ] = enemy;
        }
    }
    
    return guys;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50e5
// Size: 0x49
function get_module_struct_from_level( var_dfb0fea7209c8a32 )
{
    if ( isdefined( level.ambientgroups ) && isdefined( level.ambientgroups[ var_dfb0fea7209c8a32 ] ) )
    {
        return level.ambientgroups[ var_dfb0fea7209c8a32 ];
    }
    
    /#
        iprintlnbold( var_dfb0fea7209c8a32 + "<dev string:x156>" );
    #/
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5136
// Size: 0xbe, Type: bool
function isambientspawningpaused( unused )
{
    self endon( "death" );
    
    if ( !flag( "level_ready_for_script" ) )
    {
        flag_wait( "level_ready_for_scrip" );
        return true;
    }
    
    if ( ent_flag_exist( "pause_group" ) && ent_flag( "pause_group" ) )
    {
        ent_flag_waitopen( "pause_group" );
        return true;
    }
    
    if ( istrue( level.spawnpoint_debug ) )
    {
        level waittill( "end_spawnpoint_debug" );
    }
    
    if ( istrue( level.ambient_spawning_paused ) )
    {
        wait 0.25;
        return true;
    }
    
    /#
        if ( getdvarint( @"hash_76ec06326708e615", 0 ) )
        {
            wait 0.25;
            return true;
        }
    #/
    
    /#
        if ( istrue( level.var_7224695f5b50e0db ) )
        {
            wait 0.25;
            return true;
        }
    #/
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x51fd
// Size: 0x248
function allowed_to_spawn_agent( group, var_87722f7bf4b569cd, num_requested, string_id )
{
    var_d15fdf9b8f04f587 = get_total_reserved_slot_count();
    var_60c216ade254641f = get_max_agent_count();
    var_92069f281c4b24d9 = var_60c216ade254641f - var_d15fdf9b8f04f587;
    var_4079da1f2a53f312 = level.spawned_ai.size - level.delayed_spawn_slots;
    var_a68ecdd462f84180 = var_92069f281c4b24d9 - var_4079da1f2a53f312;
    
    if ( isdefined( group ) )
    {
        var_6916e693f017e62a = group get_comp_count();
        
        if ( !isdefined( var_6916e693f017e62a ) )
        {
            return 0;
        }
        
        var_1df77ec96cc8eca2 = var_6916e693f017e62a - group get_activecount_from_group( 1 );
        var_bd24aa52dbde4aa5 = get_reserved_slot_count_by_string_id( string_id );
        var_92069f281c4b24d9 = var_60c216ade254641f - var_d15fdf9b8f04f587 + var_bd24aa52dbde4aa5;
        
        if ( !istrue( group.kill_off_enemies ) )
        {
            if ( var_1df77ec96cc8eca2 > 0 && var_a68ecdd462f84180 > 0 )
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
        else if ( var_1df77ec96cc8eca2 > 0 && var_a68ecdd462f84180 > 0 )
        {
            return 1;
        }
        else
        {
            if ( !istrue( group.min_spawn_requested ) )
            {
                group.min_spawn_requested = 1;
                group increase_reserved_spawn_slots( 1, group.moduleid, group );
            }
            
            var_249a41496ae927ef = 0;
            
            if ( !istrue( group.disable_kill_off ) )
            {
                slots_requested = int( abs( var_a68ecdd462f84180 ) );
                var_249a41496ae927ef = kill_off_enemies( group, int( clamp( slots_requested, 1, var_92069f281c4b24d9 ) ), istrue( group.kill_off_enemies ) || istrue( var_87722f7bf4b569cd ) );
            }
            
            if ( var_249a41496ae927ef > 0 )
            {
                wait 0.1;
            }
            
            var_e560eb1a794ef6a9 = level.spawned_ai.size - level.delayed_spawn_slots;
            var_9c5475d0eb9bfecd = var_92069f281c4b24d9 - var_e560eb1a794ef6a9;
            return var_9c5475d0eb9bfecd;
        }
        
        return;
    }
    
    if ( var_a68ecdd462f84180 < 1 )
    {
        slots_requested = int( abs( var_a68ecdd462f84180 ) );
        var_249a41496ae927ef = kill_off_enemies( undefined, int( clamp( slots_requested, 1, var_92069f281c4b24d9 ) ), istrue( var_87722f7bf4b569cd ) );
        
        if ( var_249a41496ae927ef > 0 )
        {
            wait 0.1;
        }
        
        var_e560eb1a794ef6a9 = level.spawned_ai.size - level.delayed_spawn_slots;
        var_9c5475d0eb9bfecd = var_92069f281c4b24d9 - var_e560eb1a794ef6a9;
        return var_9c5475d0eb9bfecd;
    }
    
    return var_a68ecdd462f84180;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x544d
// Size: 0x67
function get_max_agent_count( group )
{
    max = getdvarint( @"hash_279375a0bfb2862f", 48 );
    min = 32;
    var_b83e5284e2f19975 = getdvarint( @"hash_14357440ef0e5dd2", max );
    
    if ( min > max )
    {
        return int( min );
    }
    
    return int( clamp( var_b83e5284e2f19975, min, max ) );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x54bd
// Size: 0x3a, Type: bool
function get_dist_to_closest_player( a, b )
{
    dist_a = a get_closest_player_dist();
    dist_b = b get_closest_player_dist();
    return dist_a > dist_b;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5500
// Size: 0x38
function sort_wave_spawning_ai()
{
    if ( isdefined( self.group ) )
    {
        if ( self.group.group_name != "wave_spawning" )
        {
            return 1;
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5540
// Size: 0xaa
function get_closest_player_dist()
{
    var_7296729673615c7 = 1073741824;
    closest_player = undefined;
    
    foreach ( player in level.players )
    {
        dist_sqr = distancesquared( self.origin, player.origin );
        
        /#
            self.var_5d106065e917a253 = sqrt( dist_sqr );
        #/
        
        if ( dist_sqr < var_7296729673615c7 )
        {
            closest_player = player;
            var_7296729673615c7 = dist_sqr;
        }
    }
    
    return var_7296729673615c7;
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x55f3
// Size: 0x203
function kill_off_enemies( group, var_d4f430c74063ffa9, var_5c7e9e0ce5db8290, unused )
{
    var_40f38a94c6993104 = 0;
    ntime = gettime();
    
    if ( isdefined( group ) )
    {
        level.compare_group_name = group.group_name;
    }
    
    if ( istrue( var_5c7e9e0ce5db8290 ) && var_d4f430c74063ffa9 > var_40f38a94c6993104 )
    {
        ai = getaiarray( "axis" );
        sorted_guys = array_sort_with_func( ai, &get_dist_to_closest_player );
        sorted_guys = array_sort_by_handler( sorted_guys, &sort_wave_spawning_ai );
        
        for (i = 0; i < sorted_guys.size; i++) {
            if ( sorted_guys[ i ] passive_kill_off_ai( 1 ) )
            {
                var_40f38a94c6993104++;
                
                if ( var_d4f430c74063ffa9 <= var_40f38a94c6993104 )
                {
                    return var_40f38a94c6993104;
                }
            }
        }
        
        sorted_guys = array_removedead( sorted_guys );
        
        for (i = 0; i < sorted_guys.size; i++) {
            eagent = sorted_guys[ i ];
            
            if ( eagent has_never_kill_off_flag() )
            {
                continue;
            }
            
            if ( istrue( script_func( "ai_is_carrying_hvt", eagent ) ) )
            {
                continue;
            }
            
            if ( !isdefined( eagent ) || !isalive( eagent ) || eagent.health <= 0 )
            {
                continue;
            }
            
            if ( isdefined( eagent.team ) && eagent.team == "allies" )
            {
                continue;
            }
            
            /#
                if ( getdvar( @"hash_ec275bc7427144de", "<dev string:x177>" ) != "<dev string:x177>" )
                {
                    thread draw_line_for_time( eagent.origin, eagent.origin + ( 0, 0, 128 ), 1, 0, 0, 10 );
                }
            #/
            
            if ( isdefined( group ) && is_equal( eagent.enemy_group, group.group_name ) )
            {
                eagent thread teleport_to_nearby_spawner( "Forced Kill-Off" );
                continue;
            }
            
            eagent script_kill_ai();
            var_40f38a94c6993104++;
            
            if ( var_d4f430c74063ffa9 <= var_40f38a94c6993104 )
            {
                return var_40f38a94c6993104;
            }
        }
    }
    
    return var_40f38a94c6993104;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57ff
// Size: 0x2f
function passed_kill_off_time_checks( ntime )
{
    if ( isdefined( self.killofftime ) && ntime <= self.killofftime )
    {
        return 0;
    }
    
    return 1;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5836
// Size: 0x7d
function get_see_recently_time_overrides()
{
    if ( isdefined( self.see_recently_override ) )
    {
        return self.see_recently_override;
    }
    
    if ( isdefined( self.group ) )
    {
        if ( isdefined( self.group.last_seen_time_override ) )
        {
            return self.group.last_seen_time_override;
        }
        else if ( istrue( self.group.cqb_module ) )
        {
            return 2;
        }
        else
        {
            return 6;
        }
        
        return;
    }
    
    return 6;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x58bb
// Size: 0xb1
function watch_for_all_groups_dead( module_struct, modulename )
{
    level endon( "group_" + modulename + "_ended" );
    count = 0;
    notify_array = [];
    
    foreach ( group in module_struct )
    {
        thread notify_when_group_ends( group, modulename, count );
        notify_array[ notify_array.size ] = modulename + count + "_completed";
        count++;
    }
    
    level waittill_all_in_array( notify_array );
    level notify( "module_group " + modulename + " completed" );
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5974
// Size: 0x3e
function notify_when_group_ends( group, modulename, count )
{
    level endon( "group_" + modulename + "_ended" );
    group waittill( "group_spawning_completed" );
    level notify( modulename + count + "_completed" );
}

// Namespace spawning / scripts\cp\spawning
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x59ba
// Size: 0x1c5
function run_spawn_module( modulename, var_1af409de0a7ca644, group, var_946a6bb4c1f4ff6a, kill_off_enemies )
{
    level endon( "game_ended" );
    flag_wait( "level_ready_for_script" );
    
    if ( getdvarint( @"hash_35dec012c752370d", 0 ) )
    {
        if ( isdefined( level.ambientgroups[ modulename ] ) && !istrue( level.ambientgroups[ modulename ].is_passive ) )
        {
            return;
        }
    }
    
    level notify( "new_spawn_module_requested_" + modulename );
    level.active_spawn_modules[ level.active_spawn_modules.size ] = modulename;
    
    if ( !isdefined( level.active_spawn_module_structs[ modulename ] ) )
    {
        level.active_spawn_module_structs[ modulename ] = [];
    }
    
    if ( !isdefined( level.spawn_module_structs_memory[ modulename ] ) )
    {
        level.spawn_module_structs_memory[ modulename ] = [];
    }
    
    /#
        if ( !istrue( level.focus_test_mode ) )
        {
            iprintlnbold( modulename );
        }
    #/
    
    module_struct = create_module_struct( modulename );
    
    if ( isdefined( module_struct ) )
    {
        if ( isarray( module_struct ) )
        {
            module_struct thread watch_for_all_groups_dead( module_struct, modulename );
            
            foreach ( group in module_struct )
            {
                level thread add_and_watch_group( group, modulename );
            }
            
            foreach ( group in module_struct )
            {
                level thread run_current_spawn_group( group, 1 );
            }
        }
        else
        {
            level thread add_and_watch_group( module_struct, modulename );
            level thread run_current_spawn_group( module_struct, 0 );
        }
        
        return module_struct;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b87
// Size: 0x1dc
function add_and_watch_group( group, modulename )
{
    level endon( "game_ended" );
    level.active_spawn_module_structs[ modulename ][ level.active_spawn_module_structs[ modulename ].size ] = group;
    level.spawn_module_structs_memory[ modulename ][ level.spawn_module_structs_memory[ modulename ].size ] = group;
    group waittill( "death" );
    
    /#
        if ( isdefined( group.spawner_debug_model ) )
        {
            for (i = 0; i < group.spawner_debug_model.size; i++) {
                if ( isdefined( group.spawner_debug_model[ i ] ) )
                {
                    group.spawner_debug_model[ i ] delete();
                }
            }
        }
    #/
    
    if ( group get_activecount_from_group( 1 ) < 1 )
    {
        remove_group_from_combined_module_counters( group );
        
        if ( isdefined( level.spawn_module_structs_memory[ group.group_name ] ) && array_contains( level.spawn_module_structs_memory[ group.group_name ], group ) )
        {
            level.spawn_module_structs_memory[ group.group_name ] = array_remove( level.spawn_module_structs_memory[ group.group_name ], group );
            
            if ( isdefined( level.spawn_module_structs_memory[ group.group_name ] ) && level.spawn_module_structs_memory[ group.group_name ].size < 1 )
            {
                level.spawn_module_structs_memory[ group.group_name ] = undefined;
            }
        }
    }
    
    if ( array_contains( level.active_spawn_module_structs[ modulename ], group ) )
    {
        level.active_spawn_module_structs[ modulename ] = array_remove( level.active_spawn_module_structs[ modulename ], group );
        
        if ( isdefined( level.active_spawn_module_structs[ modulename ] ) && level.active_spawn_module_structs[ modulename ].size < 1 )
        {
            level.active_spawn_module_structs[ modulename ] = undefined;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d6b
// Size: 0xa5
function create_module_struct( modulename )
{
    level_struct = get_module_struct_from_level( modulename );
    
    if ( isdefined( level_struct ) )
    {
        if ( isarray( level_struct ) )
        {
            temp_array = [];
            
            foreach ( entry in level_struct )
            {
                struct = copy_from_level_struct( entry );
                temp_array = array_add( temp_array, struct );
            }
            
            return temp_array;
        }
        
        struct = copy_from_level_struct( level_struct );
        return struct;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e18
// Size: 0x3a6
function copy_from_level_struct( entry )
{
    struct = spawnstruct();
    struct.group_name = entry.group_name;
    struct.min_size = entry.min_size;
    struct.max_size = entry.max_size;
    struct.time_between_spawns = entry.time_between_spawns;
    struct.post_module_delay = entry.post_module_delay;
    struct.activecount = entry.activecount;
    struct.spawn_count = entry.spawn_count;
    struct.ai_spawned = entry.ai_spawned;
    struct.spawn_points = entry.spawn_points;
    struct.totalspawns = entry.totalspawns;
    struct.start_func = entry.start_func;
    struct.nextgroup = entry.nextgroup;
    struct.timeout_action = entry.timeout_action;
    struct.currentmodulekills = entry.currentmodulekills;
    struct.currentmoduledeaths = entry.currentmoduledeaths;
    struct.moduleid = entry.moduleid;
    struct.ai_spawn_func = entry.ai_spawn_func;
    struct.ai_death_func = entry.ai_death_func;
    struct.fn_weapons_free = entry.fn_weapons_free;
    struct.cqb_module = entry.cqb_module;
    struct.always_attempt_killoff = entry.always_attempt_killoff;
    struct.status = entry.status;
    struct.spawn_scoring_overrides = entry.spawn_scoring_overrides;
    struct.aievent_funcs = entry.aievent_funcs;
    struct.is_passive = entry.is_passive;
    struct.module_vehicles = entry.module_vehicles;
    struct.module_vehicles_count = entry.module_vehicles_count;
    struct.disable_spawners_until_owner_death = entry.disable_spawners_until_owner_death;
    struct.combined_counters = entry.combined_counters;
    struct.vehicle_invalid_seats = entry.vehicle_invalid_seats;
    struct.debug_data = entry.debug_data;
    struct.total_killed = entry.total_killed;
    struct.grenade_types = entry.grenade_types;
    struct.grenade_chances = entry.grenade_chances;
    struct.died_poorly_funcs = entry.died_poorly_funcs;
    struct.spawn_aitype_counts = entry.spawn_aitype_counts;
    struct.level_module_struct = entry;
    
    /#
        struct.score_message = [];
    #/
    
    level.requested_spawns_groups[ struct.moduleid ] = 0;
    struct ent_flag_init( "pause_group" );
    struct ent_flag_init( "weapons_free" );
    return struct;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61c7
// Size: 0xa0
function add_to_module_vehicles_list( module_struct, infil_name )
{
    if ( isdefined( infil_name ) )
    {
        if ( !isdefined( module_struct.vehicle_caps_counter ) )
        {
            module_struct.vehicle_caps_counter = [];
        }
        
        if ( !isdefined( module_struct.vehicle_caps_counter[ infil_name ] ) )
        {
            module_struct.vehicle_caps_counter[ infil_name ] = 1;
        }
        else
        {
            module_struct.vehicle_caps_counter[ infil_name ]++;
        }
    }
    
    module_struct.module_vehicles_count++;
    module_struct.module_vehicles[ module_struct.module_vehicles.size ] = self;
    thread thread_on_notify_no_endon_death( "death", &remove_from_module_vehicles_list, module_struct, infil_name );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x626f
// Size: 0x82, Type: bool
function has_vehicle_type_exceeded_module_cap( module_struct, infil_name )
{
    if ( !isdefined( module_struct ) )
    {
        return false;
    }
    
    if ( !isdefined( module_struct.vehicle_caps ) )
    {
        return false;
    }
    
    if ( isdefined( module_struct.vehicle_caps[ infil_name ] ) )
    {
        if ( !isdefined( module_struct.vehicle_caps_counter ) )
        {
            return false;
        }
        
        if ( !isdefined( module_struct.vehicle_caps_counter[ infil_name ] ) )
        {
            return false;
        }
        
        if ( module_struct.vehicle_caps_counter[ infil_name ] >= module_struct.vehicle_caps[ infil_name ] )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x62fa
// Size: 0xa2
function remove_from_module_vehicles_list( module_struct, infil_name )
{
    if ( isdefined( infil_name ) )
    {
        if ( isdefined( module_struct.vehicle_caps_counter ) )
        {
            if ( isdefined( module_struct.vehicle_caps_counter[ infil_name ] ) )
            {
                module_struct.vehicle_caps_counter[ infil_name ]--;
                
                if ( module_struct.vehicle_caps_counter[ infil_name ] < 0 )
                {
                    module_struct.vehicle_caps_counter[ infil_name ] = 0;
                }
            }
        }
    }
    
    if ( array_contains( module_struct.module_vehicles, self ) )
    {
        module_struct.module_vehicles = array_remove( module_struct.module_vehicles, self );
    }
    
    module_struct notify( "vehicle_removed_from_group" );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63a4
// Size: 0x81
function timeout_group_after_duration()
{
    self endon( "death" );
    level notify( "timeout_group_after_duration_" + self.moduleid );
    level endon( "timeout_group_after_duration_" + self.moduleid );
    level endon( "group_" + self.group_name + "_ended" );
    timetowait = process_module_var( self, self.timeout_action );
    
    if ( isdefined( timetowait ) && isnumber( timetowait ) )
    {
        wait timetowait;
    }
    
    level notify( "spawnModuleTimedOut_" + self.moduleid );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x642d
// Size: 0x115
function run_current_spawn_group( module_struct, var_7108b91fa6ac216b )
{
    level notify( "run_current_spawn_group" + module_struct.moduleid );
    level endon( "game_ended" );
    module_struct endon( "death" );
    module_struct thread watch_for_module_endons();
    module_struct thread run_post_module_actions();
    module_struct thread module_run_func_after_notify();
    
    if ( isdefined( module_struct.timeout_action ) )
    {
        module_struct thread timeout_group_after_duration();
    }
    
    change_module_status( module_struct, "Init Funcs" );
    module_struct run_module_init_funcs_on_module_struct();
    
    if ( isdefined( module_struct.start_func ) )
    {
        change_module_status( module_struct, "Start Func" );
        process_module_var( module_struct, module_struct.start_func );
    }
    
    module_struct thread run_weapons_free_funcs();
    
    if ( getdvar( @"hash_b0f661a58f72bca5", "" ) != "" && getdvar( @"hash_b0f661a58f72bca5", "" ) == module_struct.group_name )
    {
        level thread runspawnmodule_isolated( module_struct, var_7108b91fa6ac216b );
    }
    else
    {
        level thread runspawnmodule( module_struct, var_7108b91fa6ac216b );
    }
    
    module_struct waittill( "death" );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x654a
// Size: 0x50
function run_weapons_free_funcs()
{
    if ( isdefined( self.fn_weapons_free ) )
    {
        ent_flag_wait( "weapons_free" );
        
        for (i = 0; i < self.fn_weapons_free.size; i++) {
            thread process_module_var( self, self.fn_weapons_free[ i ] );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65a2
// Size: 0x6a
function run_died_poorly_funcs()
{
    if ( isdefined( self.group.died_poorly_funcs ) )
    {
        for (i = 0; i < self.group.died_poorly_funcs.size; i++) {
            thread process_module_var( self.group, self.group.died_poorly_funcs[ i ] );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6614
// Size: 0x125
function run_post_module_actions()
{
    level endon( "game_ended" );
    self endon( "death" );
    result = level waittill_any_return_2( "spawn_module_" + self.moduleid + "_completed", "spawnModuleTimedOut_" + self.moduleid );
    
    if ( isdefined( self.post_module_delay ) )
    {
        post_module_delay = process_module_var( self, self.post_module_delay );
        
        if ( isdefined( post_module_delay ) && isnumberandgreaterthanzero( post_module_delay ) )
        {
            level waittill_any_timeout_1( post_module_delay, "new_module_requested" );
        }
        
        level notify( "group_" + self.group_name + "_post_module_complete" );
    }
    
    if ( isdefined( self.nextgroup ) )
    {
        next_group = process_module_var( self, self.nextgroup );
        
        if ( isdefined( next_group ) && isstring( next_group ) )
        {
            level thread run_spawn_module( next_group, undefined, self );
        }
    }
    
    if ( isdefined( level.var_48ea085692abdacf ) && isfunction( level.var_48ea085692abdacf ) )
    {
        level thread [[ level.var_48ea085692abdacf ]]( self.group_name );
    }
    
    self notify( "death" );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6741
// Size: 0x16
function remove_pacifist_from_guy()
{
    self.pacifist = 0;
    self.script_pacifist = undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x675f
// Size: 0x66
function watch_for_module_endons()
{
    level endon( "game_ended" );
    self endon( "death" );
    endon_array = [ "run_current_spawn_group" + self.moduleid, "end_spawn_module_" + self.moduleid, "end_spawn_module_" + self.group_name ];
    level waittill_any_in_array_return( endon_array );
    self notify( "death" );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67cd
// Size: 0x29
function isnumberandgreaterthanzero( param1 )
{
    if ( isdefined( param1 ) && isnumber( param1 ) && param1 > 0 )
    {
        return 1;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67fe
// Size: 0x1bf
function runspawnmodule( module_struct, var_7108b91fa6ac216b )
{
    level endon( "game_ended" );
    level notify( "runSpawnModule_" + module_struct.moduleid );
    level endon( "runSpawnModule_" + module_struct.moduleid );
    module_struct endon( "death" );
    module_struct thread resetgroupvariables();
    waittillframeend();
    
    while ( true )
    {
        if ( module_struct isambientspawningpaused() )
        {
            change_module_status( module_struct, "Module Paused" );
            continue;
        }
        
        totalspawns = process_module_var( module_struct, module_struct.totalspawns );
        module_struct.debug_data.totalspawns = totalspawns;
        
        if ( totalspawns > 0 && module_struct get_activecount_from_group( 1 ) + module_struct.currentmodulekills >= totalspawns )
        {
            level notify( "spawn_module_" + module_struct.moduleid + "_completed" );
            return;
        }
        
        totalspawns = process_module_var( module_struct, module_struct.totalspawns );
        module_struct.debug_data.totalspawns = totalspawns;
        comp_count = module_struct get_comp_count();
        var_51736aadd2fae346 = module_struct get_comp_count( 0 );
        result = allowed_to_spawn_agent( module_struct );
        
        if ( result )
        {
            if ( isdefined( comp_count ) && isdefined( var_51736aadd2fae346 ) && module_struct get_activecount_from_group( 1 ) < comp_count && module_struct get_activecount_from_group() < var_51736aadd2fae346 )
            {
                module_struct function_7736c252ad19c782( module_struct );
            }
            
            time_between_spawns = process_module_var( module_struct, module_struct.time_between_spawns );
            
            if ( isnumberandgreaterthanzero( time_between_spawns ) )
            {
                wait time_between_spawns;
            }
            else
            {
                waitframe();
            }
            
            continue;
        }
        
        wait 0.1;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x69c5
// Size: 0x1db
function runspawnmodule_isolated( module_struct, var_7108b91fa6ac216b )
{
    level endon( "game_ended" );
    level notify( "runSpawnModule_" + module_struct.moduleid );
    level endon( "runSpawnModule_" + module_struct.moduleid );
    module_struct endon( "death" );
    module_struct thread resetgroupvariables();
    
    while ( true )
    {
        if ( module_struct isambientspawningpaused() )
        {
            change_module_status( module_struct, "Module Paused" );
            continue;
        }
        
        /#
            if ( module_struct isambientspawningpaused( 1 ) )
            {
                change_module_status( module_struct, "<dev string:x178>" );
                continue;
            }
        #/
        
        totalspawns = process_module_var( module_struct, module_struct.totalspawns );
        module_struct.debug_data.totalspawns = totalspawns;
        
        if ( totalspawns > 0 && module_struct get_activecount_from_group( 1 ) + module_struct.currentmodulekills >= totalspawns )
        {
            level notify( "spawn_module_" + module_struct.moduleid + "_completed" );
            return;
        }
        
        totalspawns = process_module_var( module_struct, module_struct.totalspawns );
        module_struct.debug_data.totalspawns = totalspawns;
        comp_count = module_struct get_comp_count();
        var_51736aadd2fae346 = module_struct get_comp_count( 0 );
        result = allowed_to_spawn_agent( module_struct );
        
        if ( result )
        {
            if ( isdefined( comp_count ) && isdefined( var_51736aadd2fae346 ) && module_struct get_activecount_from_group( 1 ) < comp_count && module_struct get_activecount_from_group() < var_51736aadd2fae346 )
            {
                module_struct function_7736c252ad19c782( module_struct );
            }
            
            time_between_spawns = process_module_var( module_struct, module_struct.time_between_spawns );
            
            if ( isnumberandgreaterthanzero( time_between_spawns ) )
            {
                wait time_between_spawns;
            }
            
            continue;
        }
        
        wait 0.1;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ba8
// Size: 0xde
function get_comp_count( var_c7e4dd697f9b264e )
{
    minspawns = process_module_var( self, self.min_size );
    self.debug_data.min_size = minspawns;
    self.kill_off_enemies = undefined;
    var_c7e4dd697f9b264e = define_var_if_undefined( var_c7e4dd697f9b264e, 1 );
    
    if ( isdefined( minspawns ) && get_activecount_from_group( var_c7e4dd697f9b264e ) < minspawns )
    {
        self.kill_off_enemies = 1;
        level.requested_spawns_groups[ self.moduleid ] = minspawns;
        return minspawns;
    }
    
    maxspawns = process_module_var( self, self.max_size );
    self.debug_data.max_size = maxspawns;
    
    if ( isdefined( maxspawns ) && get_activecount_from_group( var_c7e4dd697f9b264e ) < maxspawns )
    {
        level.requested_spawns_groups[ self.moduleid ] = maxspawns;
        return maxspawns;
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c8f
// Size: 0xe1
function run_func_on_group_by_groupname( group_name, var_88c4a89e97cb6e1c )
{
    foreach ( module in level.active_spawn_module_structs )
    {
        if ( isarray( module ) )
        {
            foreach ( struct in module )
            {
                if ( struct.group_name == group_name )
                {
                    struct process_module_var( struct, var_88c4a89e97cb6e1c );
                }
            }
            
            continue;
        }
        
        if ( module.group_name == group_name )
        {
            module process_module_var( module, var_88c4a89e97cb6e1c );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6d78
// Size: 0x12f
function pause_all_other_groups( group_name )
{
    foreach ( module in level.active_spawn_module_structs )
    {
        if ( isarray( module ) )
        {
            foreach ( struct in module )
            {
                if ( struct.group_name != group_name )
                {
                    if ( getdvarint( @"hash_8dfd6bdd237ff1ab", 0 ) )
                    {
                        announcement( struct.group_name + " ^1Paused" );
                    }
                    
                    struct ent_flag_set( "pause_group" );
                }
            }
            
            continue;
        }
        
        if ( module.group_name != group_name )
        {
            if ( getdvarint( @"hash_8dfd6bdd237ff1ab", 0 ) )
            {
                announcement( module.group_name + " ^1Paused" );
            }
            
            module ent_flag_set( "pause_group" );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6eaf
// Size: 0x12f
function unpause_all_other_groups( group_name )
{
    foreach ( module in level.active_spawn_module_structs )
    {
        if ( isarray( module ) )
        {
            foreach ( struct in module )
            {
                if ( struct.group_name != group_name )
                {
                    if ( getdvarint( @"hash_8dfd6bdd237ff1ab", 0 ) )
                    {
                        announcement( struct.group_name + " ^3Unpaused" );
                    }
                    
                    struct ent_flag_clear( "pause_group" );
                }
            }
            
            continue;
        }
        
        if ( module.group_name != group_name )
        {
            if ( getdvarint( @"hash_8dfd6bdd237ff1ab", 0 ) )
            {
                announcement( module.group_name + " ^3Unpaused" );
            }
            
            module ent_flag_clear( "pause_group" );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fe6
// Size: 0x13f
function pause_group_by_group_name( group_name )
{
    foreach ( module in level.active_spawn_module_structs )
    {
        if ( isarray( module ) )
        {
            foreach ( struct in module )
            {
                if ( struct.group_name == group_name )
                {
                    if ( getdvarint( @"hash_8dfd6bdd237ff1ab", 0 ) )
                    {
                        announcement( struct.group_name + " ^1Paused" );
                    }
                    
                    struct run_module_pause_funcs();
                    struct ent_flag_set( "pause_group" );
                }
            }
            
            continue;
        }
        
        if ( module.group_name == group_name )
        {
            if ( getdvarint( @"hash_8dfd6bdd237ff1ab", 0 ) )
            {
                announcement( module.group_name + " ^1Paused" );
            }
            
            module run_module_pause_funcs();
            module ent_flag_set( "pause_group" );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x712d
// Size: 0x13f
function unpause_group_by_group_name( group_name )
{
    foreach ( module in level.active_spawn_module_structs )
    {
        if ( isarray( module ) )
        {
            foreach ( struct in module )
            {
                if ( struct.group_name == group_name )
                {
                    if ( getdvarint( @"hash_8dfd6bdd237ff1ab", 0 ) )
                    {
                        announcement( module.group_name + " ^3Unpaused" );
                    }
                    
                    struct run_module_unpause_funcs();
                    struct ent_flag_clear( "pause_group" );
                }
            }
            
            continue;
        }
        
        if ( module.group_name == group_name )
        {
            if ( getdvarint( @"hash_8dfd6bdd237ff1ab", 0 ) )
            {
                announcement( module.group_name + " ^3Unpaused" );
            }
            
            module run_module_unpause_funcs();
            module ent_flag_clear( "pause_group" );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7274
// Size: 0x3e
function stop_all_groups()
{
    keys = getarraykeys( level.active_spawn_module_structs );
    
    for (i = 0; i < keys.size; i++) {
        stop_module_by_groupname( keys[ i ] );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72ba
// Size: 0x15
function stop_module_by_id( id )
{
    level notify( "end_spawn_module_" + id );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x72d7
// Size: 0xd9
function stop_module_by_groupname( group_name, finish_processing )
{
    if ( isdefined( level.active_spawn_module_structs[ group_name ] ) )
    {
        module = level.active_spawn_module_structs[ group_name ];
        
        if ( isarray( module ) )
        {
            foreach ( struct in module )
            {
                if ( istrue( finish_processing ) )
                {
                    level notify( "spawn_module_" + struct.moduleid + "_completed" );
                    continue;
                }
                
                struct notify( "death" );
            }
            
            return;
        }
        
        if ( istrue( finish_processing ) )
        {
            level notify( "spawn_module_" + module.moduleid + "_completed" );
            return;
        }
        
        module notify( "death" );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x73b8
// Size: 0x124
function process_module_var( group, var, is_param, keep_self )
{
    level endon( "game_ended" );
    group endon( "death" );
    self endon( "var_param_race_timeout" );
    
    if ( !isdefined( var ) )
    {
        return "empty";
    }
    
    return_var = var;
    
    if ( isstring( var ) )
    {
        return var;
    }
    else if ( isnumberandgreaterthanzero( var ) )
    {
        return var;
    }
    else if ( isarray( var ) )
    {
        if ( isarray( var[ 0 ] ) )
        {
            for (i = 0; i < var.size; i++) {
                return_var = process_module_var( group, var[ i ], is_param );
            }
        }
        else if ( isfunction( var[ 0 ] ) )
        {
            func = var[ 0 ];
            var_params = [];
            param_struct = process_module_params( group, var );
            return_var = group run_modular_spawning_func( func, param_struct, keep_self );
        }
        else
        {
            return_var = var;
        }
    }
    else if ( isfunction( var ) )
    {
        if ( istrue( is_param ) )
        {
            return var;
        }
        else
        {
            return_var = [[ var ]]( group );
        }
    }
    
    return return_var;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74e5
// Size: 0xb0
function process_module_params( group, var )
{
    var_params = [];
    
    if ( var.size < 2 )
    {
        return var_params;
    }
    else
    {
        param_struct = spawnstruct();
        param_struct.var_params = [];
        var_bae8297148c7f7e8 = min( var.size, 9 );
        
        for (i = 1; i < var_bae8297148c7f7e8; i++) {
            var_param = var[ i ];
            param_struct thread send_notify_after_frame_end( "var_param_race_timeout" );
            param_struct.var_params[ i - 1 ] = param_struct process_module_var( group, var_param, 1 );
        }
    }
    
    return param_struct;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x759e
// Size: 0x17
function send_notify_after_frame_end( var_7239f8830ef22b43 )
{
    self endon( "death" );
    waittillframeend();
    self notify( var_7239f8830ef22b43 );
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x75bd
// Size: 0x3ec
function run_modular_spawning_func( func, params, keep_self )
{
    if ( isdefined( keep_self ) )
    {
        var_84dae085357e37ad = keep_self;
    }
    else
    {
        var_84dae085357e37ad = self;
    }
    
    if ( !isdefined( params.var_params ) )
    {
        return var_84dae085357e37ad [[ func ]]( self );
    }
    
    if ( params.var_params.size == 1 )
    {
        return var_84dae085357e37ad [[ func ]]( self, return_undefined_param_if_empty( params.var_params[ 0 ] ) );
    }
    
    if ( params.var_params.size == 2 )
    {
        return var_84dae085357e37ad [[ func ]]( self, return_undefined_param_if_empty( params.var_params[ 0 ] ), return_undefined_param_if_empty( params.var_params[ 1 ] ) );
    }
    
    if ( params.var_params.size == 3 )
    {
        return var_84dae085357e37ad [[ func ]]( self, return_undefined_param_if_empty( params.var_params[ 0 ] ), return_undefined_param_if_empty( params.var_params[ 1 ] ), return_undefined_param_if_empty( params.var_params[ 2 ] ) );
    }
    
    if ( params.var_params.size == 4 )
    {
        return var_84dae085357e37ad [[ func ]]( self, return_undefined_param_if_empty( params.var_params[ 0 ] ), return_undefined_param_if_empty( params.var_params[ 1 ] ), return_undefined_param_if_empty( params.var_params[ 2 ] ), return_undefined_param_if_empty( params.var_params[ 3 ] ) );
    }
    
    if ( params.var_params.size == 5 )
    {
        return var_84dae085357e37ad [[ func ]]( self, return_undefined_param_if_empty( params.var_params[ 0 ] ), return_undefined_param_if_empty( params.var_params[ 1 ] ), return_undefined_param_if_empty( params.var_params[ 2 ] ), return_undefined_param_if_empty( params.var_params[ 3 ] ), return_undefined_param_if_empty( params.var_params[ 4 ] ) );
    }
    
    if ( params.var_params.size == 6 )
    {
        return var_84dae085357e37ad [[ func ]]( self, return_undefined_param_if_empty( params.var_params[ 0 ] ), return_undefined_param_if_empty( params.var_params[ 1 ] ), return_undefined_param_if_empty( params.var_params[ 2 ] ), return_undefined_param_if_empty( params.var_params[ 3 ] ), return_undefined_param_if_empty( params.var_params[ 4 ] ), return_undefined_param_if_empty( params.var_params[ 5 ] ) );
    }
    
    if ( params.var_params.size == 7 )
    {
        return var_84dae085357e37ad [[ func ]]( self, return_undefined_param_if_empty( params.var_params[ 0 ] ), return_undefined_param_if_empty( params.var_params[ 1 ] ), return_undefined_param_if_empty( params.var_params[ 2 ] ), return_undefined_param_if_empty( params.var_params[ 3 ] ), return_undefined_param_if_empty( params.var_params[ 4 ] ), return_undefined_param_if_empty( params.var_params[ 5 ] ), return_undefined_param_if_empty( params.var_params[ 6 ] ) );
    }
    
    if ( params.var_params.size == 8 )
    {
        return var_84dae085357e37ad [[ func ]]( self, return_undefined_param_if_empty( params.var_params[ 0 ] ), return_undefined_param_if_empty( params.var_params[ 1 ] ), return_undefined_param_if_empty( params.var_params[ 2 ] ), return_undefined_param_if_empty( params.var_params[ 3 ] ), return_undefined_param_if_empty( params.var_params[ 4 ] ), return_undefined_param_if_empty( params.var_params[ 5 ] ), return_undefined_param_if_empty( params.var_params[ 6 ] ), return_undefined_param_if_empty( params.var_params[ 7 ] ) );
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79b1
// Size: 0x30
function return_undefined_param_if_empty( var )
{
    if ( isdefined( var ) )
    {
        if ( isstring( var ) && var == "empty" )
        {
            return undefined;
        }
        else
        {
            return var;
        }
        
        return;
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79e9
// Size: 0x2e
function resetgroupvariables()
{
    level endon( "game_ended" );
    self waittill( "death" );
    self.currentmodulekills = 0;
    level.requested_spawns_groups[ self.moduleid ] = undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7a1f
// Size: 0x49e
function spawn_ai( location_override, angle_override, var_2b3fe0e3fb0cd248, module_struct, team_override )
{
    change_module_status( module_struct, "attempt spawn_ai" );
    spawnpos = self.origin;
    spawnangles = self.angles;
    
    if ( isdefined( location_override ) )
    {
        spawnpos = location_override;
    }
    
    if ( isdefined( angle_override ) )
    {
        spawnangles = ( 0, angle_override[ 1 ], 0 );
    }
    
    aitype = undefined;
    agent_type = undefined;
    
    /#
    #/
    
    if ( isdefined( module_struct ) && isdefined( module_struct.spawn_aitype_counts ) && module_struct.spawn_aitype_counts.size > 0 )
    {
        aitype = module_struct choose_and_decrement_from_aitype_list();
        agent_type = level.aitypes[ aitype ].agent_type;
    }
    else if ( isdefined( module_struct ) && isdefined( module_struct.aitype_override ) && module_struct.aitype_override.size && !isdefined( self.vehicle ) )
    {
        var_1bbe1e86bf2144d6 = weighted_array_randomize( module_struct.aitype_override, module_struct.aitype_override_weights );
        agent_type = level.aitypes[ var_1bbe1e86bf2144d6 ].agent_type;
        aitype = var_1bbe1e86bf2144d6;
        println( aitype );
    }
    else if ( isdefined( level.aitype_override ) && level.aitype_override.size && !isdefined( self.vehicle ) )
    {
        var_1bbe1e86bf2144d6 = weighted_array_randomize( level.aitype_override, level.aitype_override_weights );
        agent_type = level.aitypes[ var_1bbe1e86bf2144d6 ].agent_type;
        aitype = var_1bbe1e86bf2144d6;
        println( aitype );
    }
    else if ( isdefined( var_2b3fe0e3fb0cd248 ) )
    {
        agent_type = level.aitypes[ var_2b3fe0e3fb0cd248 ].agent_type;
        aitype = var_2b3fe0e3fb0cd248;
    }
    else
    {
        ai_types = get_aitypes_from_spawner();
        var_1bbe1e86bf2144d6 = random( ai_types );
        agent_type = level.aitypes[ var_1bbe1e86bf2144d6 ].agent_type;
        aitype = var_1bbe1e86bf2144d6;
    }
    
    if ( isdefined( level.forced_aitypes ) )
    {
        var_1bbe1e86bf2144d6 = random( level.forced_aitypes );
        
        if ( isdefined( level.aitypes[ var_1bbe1e86bf2144d6 ] ) && isdefined( level.aitypes[ var_1bbe1e86bf2144d6 ].agent_type ) )
        {
            agent_type = level.aitypes[ var_1bbe1e86bf2144d6 ].agent_type;
            aitype = var_1bbe1e86bf2144d6;
        }
    }
    
    equip_armor = undefined;
    
    if ( istrue( level.forced_aitype_armored ) || is_armored() )
    {
        if ( isdefined( level.aitypes[ aitype + "_heavy" ] ) && isdefined( level.aitypes[ aitype + "_heavy" ].agent_type ) )
        {
            agent_type = level.aitypes[ aitype + "_heavy" ].agent_type;
            aitype += "_heavy";
            equip_armor = 1;
        }
    }
    
    if ( !isdefined( agent_type ) )
    {
        println( "<dev string:x195>" + self.origin );
        var_1bbe1e86bf2144d6 = random( level.random_aitype_list );
        agent_type = level.aitypes[ var_1bbe1e86bf2144d6 ].agent_type;
        aitype = var_1bbe1e86bf2144d6;
    }
    
    valid_aitype = agent_type;
    thread function_fad3572108152baf( self, module_struct, valid_aitype );
    change_module_status( module_struct, "Chose agent_type" );
    
    /#
    #/
    
    /#
        if ( getdvarint( @"hash_1a1d72de65f6faf8", 0 ) )
        {
            return undefined;
        }
    #/
    
    change_module_status( module_struct, "In Spawn Queue" );
    enter_spawn_queue();
    self.aitype = aitype;
    self.agent_type = agent_type;
    
    if ( isdefined( module_struct ) && istrue( module_struct.min_spawn_requested ) )
    {
        soldier = undefined;
        change_module_status( module_struct, "Force Spawn Loop" );
        
        while ( true )
        {
            /#
            #/
            
            soldier = scripts\mp\mp_agent::spawnnewagentaitype( valid_aitype, spawnpos, spawnangles, team_override );
            
            /#
            #/
            
            if ( isdefined( soldier ) )
            {
                break;
            }
            
            waitframe();
        }
        
        module_struct.min_spawn_requested = undefined;
        
        if ( get_reserved_slot_count_by_string_id( module_struct.moduleid ) > 0 )
        {
            decrease_reserved_spawn_slots( 1, module_struct.moduleid );
        }
    }
    else
    {
        /#
        #/
        
        change_module_status( module_struct, "Spawn Attempt" );
        soldier = scripts\mp\mp_agent::spawnnewagentaitype( valid_aitype, spawnpos, spawnangles, team_override );
        
        /#
        #/
    }
    
    if ( isdefined( soldier ) && istrue( equip_armor ) )
    {
        soldier.equip_armor = 1;
    }
    
    if ( isdefined( soldier ) )
    {
        soldier setthreatbiasgroup( "axis" );
    }
    
    return soldier;
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7ec6
// Size: 0x44
function function_fad3572108152baf( spawnpoint, module_struct, selected_aitype )
{
    if ( scripts\engine\utility::issharedfuncdefined( "defender", "aitype_type_validation" ) )
    {
        [[ scripts\engine\utility::getsharedfunc( "defender", "aitype_type_validation" ) ]]( spawnpoint, module_struct, selected_aitype );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f12
// Size: 0xfa
function get_aitypes_from_spawner()
{
    temp_array = [];
    
    if ( !isdefined( self.script_aitypes ) && !isdefined( self.script_aitype ) && !isdefined( self.script_noteworthy ) )
    {
        return level.random_aitype_list;
    }
    
    if ( isdefined( self.script_aitypes ) )
    {
        toks = strtok( self.script_aitypes, " " );
    }
    else if ( isdefined( self.script_aitype ) )
    {
        toks = [ self.script_aitype ];
    }
    else
    {
        toks = strtok( self.script_noteworthy, " " );
    }
    
    for (i = 0; i < toks.size; i++) {
        tok = toks[ i ];
        
        if ( isdefined( level.aitypes[ tok ] ) )
        {
            temp_array[ temp_array.size ] = tok;
        }
    }
    
    if ( temp_array.size > 0 )
    {
        return temp_array;
    }
    
    return level.random_aitype_list;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8014
// Size: 0x15d
function choose_and_decrement_from_aitype_list()
{
    keys = getarraykeys( self.spawn_aitype_counts );
    
    foreach ( key in keys )
    {
        if ( isdefined( self.spawn_aitype_counts[ key ] ) && isint( self.spawn_aitype_counts[ key ] ) && self.spawn_aitype_counts[ key ] >= 1 )
        {
            for (i = 0; i < level.spawn_module_structs_memory[ self.group_name ].size; i++) {
                sub_module = level.spawn_module_structs_memory[ self.group_name ][ i ];
                
                if ( isdefined( sub_module.spawn_aitype_counts[ key ] ) )
                {
                    sub_module.spawn_aitype_counts[ key ]--;
                    
                    if ( sub_module.spawn_aitype_counts[ key ] <= 0 )
                    {
                        sub_module.spawn_aitype_counts[ key ] = undefined;
                    }
                }
            }
            
            agent_type = level.aitypes[ key ].agent_type;
            aitype = key;
            println( aitype );
            return aitype;
        }
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x817a
// Size: 0x8b
function weighted_array_randomize( array, weights )
{
    assert( array.size == weights.size );
    cumulative_weight = 0;
    
    for (i = 0; i < weights.size; i++) {
        cumulative_weight += weights[ i ];
    }
    
    random_weight = randomfloat( cumulative_weight );
    running_total = 0;
    
    for (i = 0; i < array.size; i++) {
        running_total += weights[ i ];
        
        if ( running_total >= random_weight )
        {
            return array[ i ];
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x820d
// Size: 0x3c
function enter_spawn_queue()
{
    level endon( "game_ended" );
    level.spawn_queue++;
    
    if ( level.spawn_queue > 1 )
    {
        wait level.spawn_queue * 0.05;
    }
    
    level.spawn_queue--;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8251
// Size: 0xa8
function start_patrol()
{
    self endon( "death" );
    self notify( "start_patrol" );
    self endon( "start_patrol" );
    self endon( "enter_combat" );
    level endon( "game_ended" );
    
    if ( isdefined( self.script_linkto ) )
    {
        thread go_to_node( get_next_node_array() );
        return;
    }
    
    if ( isdefined( self.spawnpoint.target ) || isdefined( self.spawnpoint.script_linkto ) && !is_door_spawn() )
    {
        thread go_to_node( self.spawnpoint get_next_node_array() );
        return;
    }
    
    if ( should_roam() )
    {
        thread patrol_using_cover_nodes();
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8301
// Size: 0x299
function patrol_using_cover_nodes()
{
    self endon( "enter_combat" );
    self endon( "death" );
    
    if ( !isdefined( self.dot_override ) )
    {
        self.dot_override = 0;
    }
    
    if ( self.goalradius < 256 )
    {
        max_radius = 1024;
    }
    else
    {
        max_radius = self.goalradius;
    }
    
    set_goal_radius( 64 );
    min_radius = 64;
    max_height = 256;
    last_node = undefined;
    behind_node = undefined;
    
    if ( isdefined( self.script_goalheight ) )
    {
        max_height = int( self.script_goalheight );
    }
    
    while ( true )
    {
        if ( isdefined( self.script_origin_other ) )
        {
            search_pos = self.script_origin_other;
        }
        else
        {
            search_pos = self.origin;
        }
        
        if ( istrue( self.find_new_patrol ) )
        {
            wait 0.25;
            continue;
        }
        
        best_dot = -1;
        behind_node = undefined;
        next_node = undefined;
        next_nodes = getnodesinradiussorted( search_pos, max_radius, min_radius, max_height, "all" );
        forward_nodes = [];
        
        if ( isdefined( next_nodes ) && next_nodes.size > 0 )
        {
            for (i = 0; i < next_nodes.size; i++) {
                if ( isdefined( last_node ) && next_nodes[ i ] == last_node )
                {
                    continue;
                }
                
                if ( isdefined( getnodeowner( next_nodes[ i ] ) ) )
                {
                    continue;
                }
                
                if ( isdefined( self.dot_override ) )
                {
                    var_157b4cca8e1adb67 = self.angles + ( 0, self.dot_override, 0 );
                }
                else
                {
                    var_157b4cca8e1adb67 = self.angles;
                }
                
                dot = math::get_dot( self.origin, var_157b4cca8e1adb67, next_nodes[ i ].origin );
                
                if ( dot < 0.3 )
                {
                    if ( dot > best_dot )
                    {
                        behind_node = next_nodes[ i ];
                        best_dot = dot;
                    }
                    
                    continue;
                }
                
                forward_nodes[ forward_nodes.size ] = next_nodes[ i ];
            }
        }
        
        if ( forward_nodes.size > 0 )
        {
            next_node = get_least_used_from_array( forward_nodes );
        }
        
        time = gettime();
        
        if ( isdefined( next_node ) )
        {
            self.dot_override = undefined;
            last_node = next_node;
            go_to_node( next_node );
            new_time = gettime();
            
            if ( new_time <= time )
            {
                waitframe();
            }
            
            continue;
        }
        
        if ( isdefined( behind_node ) )
        {
            self.dot_override = undefined;
            last_node = behind_node;
            go_to_node( behind_node );
            new_time = gettime();
            
            if ( new_time <= time )
            {
                waitframe();
            }
            
            continue;
        }
        
        wait 1;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x85a2
// Size: 0x1a6
function enter_combat_after_stealth( group )
{
    if ( scripts\cp\coop_stealth::should_run_sp_stealth() )
    {
        return;
    }
    
    self notify( "enter_combat_after_stealth" );
    self endon( "enter_combat_after_stealth" );
    self endon( "death" );
    self endon( "enter_combat" );
    waittill_array = [];
    waittill_ents = [];
    result = undefined;
    
    if ( isdefined( self.team ) )
    {
        if ( isdefined( self.group ) && self.group ent_flag_exist( "weapons_free" ) && !self.group ent_flag( "weapons_free" ) )
        {
            if ( self.team == "allies" )
            {
                waittill_ents = [ self, level ];
                waittill_any_ents_array( waittill_ents, "damage", "stealth_combat", "stealth_over", "weapons_free", "bulletwhizby" );
            }
            else if ( istrue( self.aggressive ) )
            {
                return;
            }
            else if ( is_pacifist() )
            {
                waittill_ents = [ self, self.group, level ];
                waittill_any_ents_array( waittill_ents, "weapons_free", "saw_death" );
            }
            else
            {
                waittill_ents = [ self, self.group, level ];
                result = waittill_any_ents_return( level, "weapons_free", self.group, "weapons_free", self, "saw_death", self, "known_event" );
            }
        }
    }
    
    if ( isdefined( level.enter_combat_flag ) && !flag( level.enter_combat_flag ) )
    {
        flag_set( level.enter_combat_flag );
    }
    
    thread enter_combat();
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8750
// Size: 0x10
function function_ec648f2c89ea1c91()
{
    self.lastspawntime = gettime();
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8768
// Size: 0xaf
function function_242733bd4dbb1979( spawnpoint )
{
    if ( isdefined( spawnpoint.script_goalradius ) )
    {
        set_goal_radius( spawnpoint.script_goalradius );
    }
    else if ( isdefined( spawnpoint.script_radius ) )
    {
        set_goal_radius( spawnpoint.script_radius );
    }
    else if ( isdefined( self.script_goalradius ) )
    {
        set_goal_radius( self.script_goalradius );
    }
    else if ( isdefined( self.script_radius ) )
    {
        set_goal_radius( self.script_radius );
    }
    else
    {
        set_goal_radius( 2048 );
    }
    
    self.og_goalradius = self.goalradius;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x881f
// Size: 0x80
function function_78225857c662ebb4( spawnpoint )
{
    if ( isdefined( self.spawnpoint.script_goalheight ) )
    {
        self.goalheight = self.spawnpoint.script_goalheight;
    }
    else if ( isdefined( self.script_goalheight ) )
    {
        self.goalheight = self.script_goalheight;
    }
    else
    {
        self.goalheight = 80;
    }
    
    self.og_goalheight = self.goalheight;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x88a7
// Size: 0x14c
function function_a3c8440bb465635( spawnpoint )
{
    if ( getdvarint( @"hash_e297fed388da8211", 0 ) > 0 || !isdefined( spawnpoint ) )
    {
        return;
    }
    
    switch ( spawnpoint.aitype )
    {
        case #"hash_fa18d2f6bd57925a":
            self setengagementmindist( 256, 0 );
            self setengagementmaxdist( 768, 2048 );
            self function_9215ce6fc83759b9( 2048 );
            break;
        case #"hash_900cb96c552c5e8e":
            self setengagementmindist( 256, 0 );
            self setengagementmaxdist( 768, 1024 );
            self function_9215ce6fc83759b9( 2048 );
            break;
        case #"hash_23209741b93850b5":
            self setengagementmindist( 256, 0 );
            self setengagementmaxdist( 768, 1024 );
            self function_9215ce6fc83759b9( 1024 );
            break;
        case #"hash_6191aaef9f922f96":
            self setengagementmindist( 512, 0 );
            self setengagementmaxdist( 768, 4096 );
            self function_9215ce6fc83759b9( 4096 );
            break;
        case #"hash_2f2d546c2247838f":
            self setengagementmindist( 256, 0 );
            self setengagementmaxdist( 768, 3000 );
            self function_9215ce6fc83759b9( 3000 );
            break;
        case #"hash_4ad475e6e15635bd":
            break;
        default:
            break;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x89fb
// Size: 0x15
function function_2cae33f77b1f866c( spawnpoint )
{
    self.spawnpoint = spawnpoint;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a18
// Size: 0x9a
function function_c2c72ba14cdf8889()
{
    if ( istrue( self.equip_helmet ) || is_juggernaut_aitype() )
    {
        give_soldier_helmet();
    }
    
    if ( is_armored() || is_juggernaut_aitype() )
    {
        give_soldier_armor();
        
        if ( !isdefined( self.armor_health ) && !is_juggernaut_aitype() )
        {
            self.allowpain = 0;
            self.armor_health = 420;
            
            /#
                if ( getdvarint( @"hash_8de63a2e6037a1f9", 420 ) != 420 )
                {
                    self.armor_health = getdvarint( @"hash_8de63a2e6037a1f9" );
                }
            #/
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8aba
// Size: 0x2e
function give_soldier_helmet()
{
    if ( !issubstr( self.agent_type, "_helmet" ) && !is_juggernaut_aitype() )
    {
    }
    
    self.wearing_helmet = 1;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8af0
// Size: 0x39
function give_soldier_armor()
{
    if ( !issubstr( self.agent_type, "_armor" ) && !is_juggernaut_aitype() )
    {
    }
    
    self.wearing_armor = 1;
    self.armor_health = 150;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b31
// Size: 0x1f4
function function_9426d24dfb73528d( var_580837ba9de8f3d4 )
{
    if ( isdefined( self.aitype ) && issubstr( self.aitype, "bomber" ) )
    {
        return;
    }
    
    oldweapon = self.weapon;
    
    if ( !isdefined( oldweapon ) )
    {
        return;
    }
    
    agent = self;
    var_631eb7a15a695766 = [ "iw9_lm_foxtrot_mp", "iw9_ar_mike16_mp", "iw9_ar_mike4_mp" ];
    var_effb4ae1788a8b10 = "";
    
    if ( array_contains( var_631eb7a15a695766, oldweapon.basename ) )
    {
        var_effb4ae1788a8b10 = "laserbox_hip01_p01";
    }
    else
    {
        switch ( oldweapon.classname )
        {
            case #"hash_6191aaef9f922f96":
            case #"hash_8cdaf2e4ecfe5b51":
                var_effb4ae1788a8b10 = "laserbox_hip01";
                break;
            case #"hash_fa24dff6bd60a12d":
                var_effb4ae1788a8b10 = "laserbox_hip01";
                break;
            case #"hash_719417cb1de832b6":
                var_effb4ae1788a8b10 = "laserpstl_hip01";
                break;
            case #"hash_900cb96c552c5e8e":
                var_effb4ae1788a8b10 = "laserbox_hip01";
                break;
            case #"hash_690c0d6a821b42e":
                var_effb4ae1788a8b10 = "lasercyl_hip01";
                break;
            default:
                break;
        }
    }
    
    if ( isdefined( var_580837ba9de8f3d4 ) )
    {
        var_effb4ae1788a8b10 = var_580837ba9de8f3d4;
    }
    
    if ( !isdefined( var_effb4ae1788a8b10 ) || var_effb4ae1788a8b10 == "" )
    {
        return;
    }
    
    newweapon = oldweapon withattachment( var_effb4ae1788a8b10 );
    
    if ( isdefined( self.weapon ) )
    {
        self takeweapon( self.weapon );
    }
    
    self.weapon = newweapon;
    utility::initweapon( self.weapon );
    self giveweapon( self.weapon );
    self setspawnweapon( self.weapon );
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.primaryweapon = self.weapon;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d2d
// Size: 0x148
function function_b8177f07a65aa246()
{
    if ( isdefined( level.global_ai_func_array ) && level.global_ai_func_array.size > 0 )
    {
        if ( isdefined( self.team ) && self.team == "axis" )
        {
            team = self.team;
            
            for (i = 0; i < level.global_ai_func_array[ team ].size; i++) {
                func = level.global_ai_func_array[ team ][ i ];
                
                if ( isdefined( func[ "param4" ] ) )
                {
                    self thread [[ func[ "function" ] ]]( func[ "param1" ], func[ "param2" ], func[ "param3" ], func[ "param4" ] );
                    continue;
                }
                
                if ( isdefined( func[ "param3" ] ) )
                {
                    self thread [[ func[ "function" ] ]]( func[ "param1" ], func[ "param2" ], func[ "param3" ] );
                    continue;
                }
                
                if ( isdefined( func[ "param2" ] ) )
                {
                    self thread [[ func[ "function" ] ]]( func[ "param1" ], func[ "param2" ] );
                    continue;
                }
                
                if ( isdefined( func[ "param1" ] ) )
                {
                    self thread [[ func[ "function" ] ]]( func[ "param1" ] );
                    continue;
                }
                
                self thread [[ func[ "function" ] ]]();
            }
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e7d
// Size: 0x46
function function_389fff85c076f49e()
{
    if ( isdefined( level.var_317452953c148027 ) )
    {
        var_b3b6f03743200be1 = self [[ level.var_317452953c148027 ]]();
    }
    
    if ( istrue( var_b3b6f03743200be1 ) )
    {
        return;
    }
    
    if ( function_240f7f4e57340e8f() )
    {
        function_36bee4151f858043();
        return;
    }
    
    function_1cf32c35bf7956e3();
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ecb
// Size: 0x175
function function_1cf32c35bf7956e3()
{
    scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_armor_plate" );
    scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_powerup_equipment" );
    scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "cash_drop_100" );
    
    if ( getdvarint( @"hash_e2eb41c1190b2fc2", 0 ) )
    {
        scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_powerup_ammo" );
        return;
    }
    
    if ( getdvarint( @"hash_df9bf139fd731025", 0 ) )
    {
        if ( isdefined( self.aitype ) )
        {
            if ( issubstr( self.aitype, "smg" ) )
            {
                scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_ammo_919" );
            }
            else if ( issubstr( self.aitype, "ar" ) )
            {
                scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_ammo_762" );
            }
            else if ( issubstr( self.aitype, "sniper" ) )
            {
                scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_ammo_50cal" );
            }
            else if ( issubstr( self.aitype, "juggernaut" ) )
            {
                scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_ammo_762" );
            }
            else if ( issubstr( self.aitype, "shotgun" ) )
            {
                scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_ammo_12g" );
            }
            else if ( issubstr( self.aitype, "lmg" ) )
            {
                scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_ammo_762" );
            }
            else if ( issubstr( self.aitype, "rpg" ) )
            {
                scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_ammo_rocket" );
            }
        }
        
        return;
    }
    
    scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "drop_random_ammo_types" );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9048
// Size: 0xe
function function_36bee4151f858043()
{
    scripts\cp\agent_drops::function_6fdbf71c8217cfc5( "brloot_armor_plate" );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x905e
// Size: 0x7d
function function_8029849997321123()
{
    function_5f612da1f12cc6e5( 1 );
    
    if ( !isdefined( self.sidearm ) )
    {
        self.sidearm = nullweapon();
    }
    
    utility::initweapon( self.primaryweapon );
    utility::initweapon( self.sidearm );
    var_7f6bfe0bf3cf84e8 = "primary";
    
    if ( function_a1a803521137f145() )
    {
        var_7f6bfe0bf3cf84e8 = "right";
    }
    
    if ( !is_specified_unittype( "civilian" ) )
    {
        utility::set_battlechatter( 1 );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90e3
// Size: 0x2f1, Type: bool
function function_a1a803521137f145()
{
    if ( !isdefined( level.var_4a2590c2dfe94983 ) && !isdefined( level.arweapons ) && !isdefined( level.var_f121b39847bca5e8 ) && !isdefined( level.var_f0525567bc0ffa6a ) )
    {
        return false;
    }
    
    if ( !isdefined( self.agent_type ) )
    {
        return false;
    }
    
    attachments = undefined;
    
    if ( isdefined( level.var_121443dfd453e6a3 ) )
    {
        if ( scripts\engine\utility::percent_chance( 30 ) )
        {
            attachments = [];
            attachments[ attachments.size ] = random( level.var_121443dfd453e6a3 );
            attachments[ attachments.size ] = random( level.var_121443dfd453e6a3 );
        }
    }
    
    if ( issubstr( self.agent_type, "_ar" ) )
    {
        if ( isdefined( self.weapon ) )
        {
            self takeallweapons();
        }
        
        var_72672cd81ec1093d = random( level.arweapons );
        newprimary = scripts\cp\weapon::function_768c9a047aed19f4( var_72672cd81ec1093d );
        newprimary = newprimary scripts\cp\weapon::function_dcb52bcbbcb80b00( attachments );
        self.weapon = newprimary;
        initweapon( self.weapon );
        self giveweapon( self.weapon );
        self setspawnweapon( self.weapon );
        self.primaryweapon = self.weapon;
        return true;
    }
    
    if ( issubstr( self.agent_type, "_smg" ) )
    {
        if ( isdefined( self.weapon ) )
        {
            self takeallweapons();
        }
        
        var_72672cd81ec1093d = random( level.var_4a2590c2dfe94983 );
        newprimary = scripts\cp\weapon::function_768c9a047aed19f4( var_72672cd81ec1093d );
        newprimary = newprimary scripts\cp\weapon::function_dcb52bcbbcb80b00( attachments );
        self.weapon = newprimary;
        initweapon( self.weapon );
        self giveweapon( self.weapon );
        self setspawnweapon( newprimary );
        self.primaryweapon = newprimary;
        return true;
    }
    
    if ( issubstr( self.agent_type, "_shotgun" ) )
    {
        if ( isdefined( self.weapon ) )
        {
            self takeallweapons();
        }
        
        var_72672cd81ec1093d = random( level.var_f0525567bc0ffa6a );
        newprimary = scripts\cp\weapon::function_768c9a047aed19f4( var_72672cd81ec1093d );
        newprimary = newprimary scripts\cp\weapon::function_dcb52bcbbcb80b00( attachments );
        self.weapon = newprimary;
        initweapon( self.weapon );
        self giveweapon( self.weapon );
        self setspawnweapon( newprimary );
        self.primaryweapon = newprimary;
        return true;
    }
    
    if ( issubstr( self.agent_type, "_lmg" ) )
    {
        if ( isdefined( self.weapon ) )
        {
            self takeallweapons();
        }
        
        var_72672cd81ec1093d = random( level.var_f121b39847bca5e8 );
        newprimary = scripts\cp\weapon::function_768c9a047aed19f4( var_72672cd81ec1093d );
        newprimary = newprimary scripts\cp\weapon::function_dcb52bcbbcb80b00( attachments );
        self.weapon = newprimary;
        initweapon( self.weapon );
        self giveweapon( self.weapon );
        self setspawnweapon( newprimary );
        self.primaryweapon = newprimary;
        return true;
    }
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93dd
// Size: 0x3b
function function_5f612da1f12cc6e5( shoulddrop )
{
    if ( !getdvarint( @"hash_26524832a07cf602", 1 ) )
    {
        self.dropweapon = 0;
        return;
    }
    
    if ( !isdefined( shoulddrop ) )
    {
        shoulddrop = 0;
    }
    
    self.dropweapon = shoulddrop;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9420
// Size: 0x150
function set_kill_off_time( override )
{
    if ( istrue( level.var_f57b5db263860330 ) )
    {
        return;
    }
    
    if ( isdefined( override ) )
    {
        var_bbc66ad67526db08 = override * 1000;
    }
    else if ( isdefined( self.group ) && isdefined( self.group.kill_off_time_override ) )
    {
        var_bbc66ad67526db08 = self.group.kill_off_time_override * 1000;
    }
    else if ( isdefined( self.spawnpoint ) && isdefined( self.spawnpoint.script_timer ) )
    {
        var_bbc66ad67526db08 = self.spawnpoint.script_timer * 1000;
    }
    else if ( isdefined( self.group ) && istrue( self.group.cqb_module ) )
    {
        var_bbc66ad67526db08 = 2500000;
    }
    else
    {
        var_bbc66ad67526db08 = 20000;
    }
    
    new_time = gettime() + var_bbc66ad67526db08;
    
    if ( !isdefined( self.killofftime ) || new_time > self.killofftime )
    {
        self.killofftime = new_time;
    }
    
    if ( istrue( self.entered_combat ) )
    {
        wait_time = var_bbc66ad67526db08 / 1000;
        thread add_to_kill_off_list( wait_time );
        return;
    }
    
    remove_from_kill_off_list();
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9578
// Size: 0x7a
function add_to_kill_off_list( wait_time )
{
    self notify( "add_to_kill_off_list" );
    self endon( "add_to_kill_off_list" );
    self endon( "death" );
    remove_from_kill_off_list();
    wait wait_time;
    
    if ( isdefined( self.entity_number ) )
    {
        level.can_kill_off_list[ self.entity_number ] = self;
    }
    else
    {
        level.can_kill_off_list[ self getentitynumber() ] = self;
    }
    
    if ( level.can_kill_off_list.size == 1 )
    {
        level thread passive_kill_off_loop();
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95fa
// Size: 0xc3
function passive_kill_off_loop()
{
    level notify( "stop_kill_off_loop" );
    level endon( "stop_kill_off_loop" );
    level endon( "game_ended" );
    var_6582dc596556cf2e = level.frameduration / 1000;
    
    while ( true )
    {
        waittime = 1;
        keys = getarraykeys( level.can_kill_off_list );
        
        for (i = 0; i < keys.size; i++) {
            if ( !isdefined( level.can_kill_off_list[ keys[ i ] ] ) )
            {
                continue;
            }
            
            var_7edbb385819f8e7f = level.can_kill_off_list[ keys[ i ] ] thread passive_kill_off_ai();
            
            if ( !isdefined( var_7edbb385819f8e7f ) || var_7edbb385819f8e7f )
            {
                if ( waittime > var_6582dc596556cf2e )
                {
                    waittime -= var_6582dc596556cf2e;
                }
                
                waitframe();
            }
        }
        
        wait waittime;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x96c5
// Size: 0x1b2, Type: bool
function passive_kill_off_ai( var_21b3206d7afb1536 )
{
    if ( !isalive( self ) )
    {
        return false;
    }
    
    if ( self.health < 1 )
    {
        return false;
    }
    
    if ( has_dont_kill_off_flag() )
    {
        return false;
    }
    
    if ( istrue( script_func( "ai_is_carrying_hvt", self ) ) )
    {
        return false;
    }
    
    if ( istrue( self.attempting_teleport ) )
    {
        return false;
    }
    
    if ( istrue( self.playing_skit ) )
    {
        return false;
    }
    
    if ( is_specified_unittype( "juggernaut" ) )
    {
        return false;
    }
    
    if ( istrue( self.is_kidnapping_player ) )
    {
        set_kill_off_time( 20 );
        return false;
    }
    
    if ( !istrue( self.forced_kill_off ) )
    {
        if ( is_riding_vehicle() )
        {
            return false;
        }
        
        if ( isdefined( self.enemy ) && self canshootenemy() )
        {
            return false;
        }
    }
    
    if ( isdefined( self.birthtime ) && self.birthtime >= gettime() )
    {
        return false;
    }
    
    var_934f2bd9f0e5c04b = get_see_recently_time_overrides();
    
    if ( isdefined( self.group ) && istrue( self.group.cqb_module ) )
    {
        var_99189c9718781c5d = 2250000;
    }
    else
    {
        var_99189c9718781c5d = 25000000;
    }
    
    for (i = 0; i < level.players.size; i++) {
        eplayer = level.players[ i ];
        
        if ( distancesquared( eplayer.origin, self.origin ) < var_99189c9718781c5d )
        {
            return false;
        }
        
        if ( self seerecently( eplayer, var_934f2bd9f0e5c04b ) )
        {
            return false;
        }
    }
    
    if ( !killoff_vis_passed() )
    {
        if ( !istrue( var_21b3206d7afb1536 ) )
        {
            return true;
        }
    }
    
    teleport_to_nearby_spawner( "Passive Kill-Off", undefined, 0 );
    return true;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9880
// Size: 0xd3, Type: bool
function killoff_vis_passed()
{
    for (i = 0; i < level.players.size; i++) {
        eplayer = level.players[ i ];
        
        if ( self hastacvis( eplayer, 0, 64, 1 ) )
        {
            return false;
        }
        
        if ( eplayer hastacvis( self, 0, 64, 1 ) )
        {
            return false;
        }
    }
    
    contents = scripts\engine\trace::create_contents( 0, 1, 0, 0, 0, 1 );
    myeyepos = self getapproxeyepos();
    
    for (i = 0; i < level.players.size; i++) {
        player = level.players[ i ];
        
        if ( scripts\engine\trace::ray_trace_passed( player geteye(), myeyepos, [ player, self ], contents ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x995c
// Size: 0xc, Type: bool
function is_riding_vehicle()
{
    return isdefined( self.ridingvehicle );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9971
// Size: 0x24, Type: bool
function function_5bb77addd9f02498( team )
{
    return isdefined( self.team ) && self.team == team;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x999e
// Size: 0x24, Type: bool
function is_specified_unittype( unittype )
{
    return isdefined( self.unittype ) && self.unittype == unittype;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99cb
// Size: 0x1f, Type: bool
function is_juggernaut_aitype()
{
    return isdefined( self.unittype ) && self.unittype == "juggernaut";
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x99f3
// Size: 0x6d
function function_9d9d82f0160fbb53( group )
{
    if ( isdefined( group ) && isdefined( self.post_spawn_spawner_funcs ) )
    {
        foreach ( func in self.post_spawn_spawner_funcs )
        {
            self [[ func ]]( group );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a68
// Size: 0x71
function function_b395044780aac4()
{
    if ( isdefined( self.spawnpoint.post_spawn_ai_funcs ) )
    {
        foreach ( func in self.spawnpoint.post_spawn_ai_funcs )
        {
            self [[ func ]]();
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ae1
// Size: 0xf4
function function_cbf9338e97cdb9f7( module_struct )
{
    self.enemy_group = module_struct.group_name;
    self.moduleid = module_struct.moduleid;
    self.group = module_struct;
    self.group.activecount++;
    self.group.spawn_count++;
    module_struct.ai_spawned[ module_struct.ai_spawned.size ] = self;
    module_struct notify( "spawned_group_soldier" );
    
    if ( isdefined( module_struct.threatbiasoverride ) )
    {
        self.threatbiasoverride = module_struct.threatbiasoverride;
    }
    
    if ( isdefined( module_struct.ai_spawn_func ) )
    {
        for (i = 0; i < module_struct.ai_spawn_func.size; i++) {
            thread process_module_var( module_struct, module_struct.ai_spawn_func[ i ], undefined, self );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bdd
// Size: 0xb
function set_spawner_init_flag()
{
    add_to_spawner_flags( 1 );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9bf0
// Size: 0x1c, Type: bool
function is_spawner_initialized()
{
    return isdefined( self.spawner_flags ) && self.spawner_flags & 1;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c15
// Size: 0x209
function spawner_init()
{
    level endon( "game_ended" );
    
    if ( is_spawner_initialized() )
    {
        return;
    }
    
    set_spawner_init_flag();
    remove_default_kvps();
    set_spawner_type();
    
    if ( !is_spawner_position_valid() )
    {
        remove_from_spawner_flags( 4 );
        remove_from_spawner_flags( 2 );
        return;
    }
    
    spawn_is_vehicle_spawn( self );
    self.lastspawntime = 0;
    
    if ( isstruct( self ) && isdefined( self.spawnflags ) )
    {
        self.spawnflags = int( self.spawnflags );
    }
    
    if ( isdefined( self.script_parent ) )
    {
        all_spawners = getstructarray( self.script_parent, "targetname" );
        
        if ( all_spawners.size > 0 )
        {
            self.child_spawners = [];
            self.child_spawners = all_spawners;
            init_cluster_parent();
            array_thread( all_spawners, &spawner_init );
        }
        
        return;
    }
    
    var_7a922f0fa8af7c0a = 2;
    is_on_platform = 64;
    is_patroller = 128;
    is_pacifist = 256;
    
    if ( !isnode( self ) && isdefined( self.spawnflags ) )
    {
        if ( !isint( self.spawnflags ) )
        {
            self.spawnflags = int( self.spawnflags );
        }
        
        if ( self.spawnflags & var_7a922f0fa8af7c0a )
        {
            self.equip_armor = 1;
        }
        
        if ( self.spawnflags & is_on_platform )
        {
            add_to_spawner_flags( 512 );
            self.is_on_platform = 1;
        }
        
        if ( !istrue( scripts\cp\vehicles::is_vehicle_spawnpoint() ) )
        {
            var_746593e9cd54d86e = 8;
            
            if ( self.spawnflags & var_746593e9cd54d86e )
            {
                self.dont_enter_combat = 1;
            }
        }
    }
    
    if ( isdefined( self.script_count ) || isdefined( self.script_timeout ) )
    {
        self.post_spawn_spawner_funcs = [];
        self.post_spawn_spawner_funcs[ self.post_spawn_spawner_funcs.size ] = &spawner_disable_after_count;
    }
    
    get_aitype_settings();
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e26
// Size: 0x29
function get_aitype_settings()
{
    spawnfunc = undefined;
    
    if ( isdefined( spawnfunc ) )
    {
        self.post_spawn_ai_funcs[ self.post_spawn_ai_funcs.size ] = spawnfunc;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e57
// Size: 0xd
function enable_traversals_for_bombers()
{
    level.bomber_shouldusetraversals = 1;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e6c
// Size: 0x309, Type: bool
function is_spawner_position_valid()
{
    white = "^0";
    red = "^1";
    green = "^2";
    yellow = "^3";
    blue = "^4";
    teal = "^5";
    purple = "^6";
    d_red = "^7";
    d_green = "^8";
    d_blue = "^9";
    spawner_disabled = red + "SPAWNER DISABLED: ";
    
    if ( isdefined( self.targetname ) )
    {
        targetname = white + "targetname = (" + self.targetname + ")";
    }
    else
    {
        targetname = "";
    }
    
    type = ter_op( isstruct( self ), white + "(struct) " + targetname + yellow + "spawner", white + "(node)" + targetname + yellow + " spawner" );
    
    if ( isdefined( self.script_difficulty ) && level.gameskill <= 1 && is_equal( self.script_difficulty, "hard" ) )
    {
        println( "<dev string:x1eb>" + spawner_disabled + "<dev string:x1f9>" + type + yellow + "<dev string:x206>" + self.script_difficulty + "<dev string:x23a>" + self.origin );
        disable_spawner();
        return false;
    }
    
    vehicle_spawnpoint = scripts\cp\vehicles::is_vehicle_spawnpoint();
    
    if ( !spawner_flags_check( 4 ) )
    {
        if ( isdefined( self.origin ) )
        {
            ref_pos = getgroundposition( self.origin, 1, 100, 16 );
            
            if ( vehicle_spawnpoint )
            {
                if ( !isdefined( self.skip_navmesh_check ) && !ispointonnavmesh( ref_pos ) )
                {
                    disable_spawner();
                    println( "<dev string:x242>" + spawner_disabled + "<dev string:x242>" + type + yellow + "<dev string:x24f>" + teal + self.origin );
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                ref_pos = self.origin;
            }
            
            new_pos = getclosestpointonnavmesh( ref_pos );
            
            if ( isdefined( new_pos ) )
            {
                if ( distance2dsquared( new_pos, self.origin ) <= 4096 )
                {
                    if ( isstruct( self ) )
                    {
                        self.origin = new_pos;
                    }
                }
                else
                {
                    disable_spawner();
                    println( "<dev string:x242>" + spawner_disabled + "<dev string:x242>" + type + yellow + "<dev string:x266>" + teal + self.origin );
                    return false;
                }
            }
        }
        else
        {
            disable_spawner();
            println( "<dev string:x28e>" + spawner_disabled + "<dev string:x28e>" + type + yellow + "<dev string:x29b>" + teal + self.origin );
            return false;
        }
    }
    
    return true;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa17e
// Size: 0xc
function disable_spawner()
{
    add_to_spawner_flags( 1024 );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa192
// Size: 0xc
function enable_spawner()
{
    remove_from_spawner_flags( 1024 );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1a6
// Size: 0xaf
function set_spawner_type()
{
    if ( isdefined( self.spawnflags ) && !isnode( self ) )
    {
        spawnflags = int( self.spawnflags );
        var_dad5b086d6059445 = 16;
        var_29e2f295acb987f2 = 8;
        
        if ( spawnflags & var_dad5b086d6059445 )
        {
            define_spawner( "vehicle_spawner" );
        }
        
        if ( spawnflags & var_29e2f295acb987f2 )
        {
            define_spawner( "vehicle_spawner" );
        }
    }
    
    if ( isdefined( self.script_parent ) )
    {
        all_spawners = getstructarray( self.script_parent, "targetname" );
        
        if ( all_spawners.size > 0 )
        {
            define_spawner( "cluster_spawner" );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa25d
// Size: 0x24c
function remove_default_kvps()
{
    if ( is_equal( self.target, "default" ) )
    {
        self.target = undefined;
    }
    
    if ( is_equal( self.script_noteworthy, "default" ) )
    {
        self.script_noteworthy = undefined;
    }
    
    if ( is_equal( self.script_forcespawn, 0 ) )
    {
        self.script_forcespawn = undefined;
    }
    
    if ( is_equal( self.script_team, "axis" ) )
    {
        self.script_team = undefined;
    }
    
    if ( is_equal( self.script_radius, 0 ) )
    {
        self.script_radius = undefined;
    }
    
    if ( is_equal( self.script_goalheight, 0 ) )
    {
        self.script_goalheight = undefined;
    }
    
    if ( is_equal( self.script_origin_other, ( 0, 0, 0 ) ) )
    {
        self.script_origin_other = undefined;
    }
    
    if ( is_equal( self.script_count, 0 ) )
    {
        self.script_count = undefined;
    }
    
    if ( is_equal( self.script_timeout, 0 ) )
    {
        self.script_timeout = undefined;
    }
    
    if ( is_equal( self.script_dot, 0 ) )
    {
        self.script_dot = undefined;
    }
    
    if ( is_equal( self.script_dist_only, 0 ) )
    {
        self.script_dist_only = undefined;
    }
    
    if ( is_equal( self.script_demeanor, "default" ) )
    {
        self.script_demeanor = undefined;
    }
    
    if ( is_equal( self.script_speed, 0 ) )
    {
        self.script_speed = undefined;
    }
    
    if ( is_equal( self.script_linkto, "default" ) )
    {
        self.script_linkto = undefined;
    }
    
    if ( is_equal( self.script_linkname, "default" ) )
    {
        self.script_linkname = undefined;
    }
    
    if ( isdefined( self.script_unload ) )
    {
        if ( isstring( self.script_unload ) && is_equal( self.script_unload, "-1" ) )
        {
            self.script_unload = undefined;
            return;
        }
        
        if ( isint( self.script_unload ) && is_equal( self.script_unload, -1 ) )
        {
            self.script_unload = undefined;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa4b1
// Size: 0x492
function is_door_spawn()
{
    is_door_spawn = 32;
    
    if ( isdefined( self.spawnpoint ) )
    {
        if ( istrue( self.spawnpoint.door_spawner ) )
        {
            return 1;
        }
        else if ( !isnode( self.spawnpoint ) && isdefined( self.spawnpoint.spawnflags ) )
        {
            if ( self.spawnpoint.spawnflags & is_door_spawn && !( self.spawnpoint.spawnflags & 8 ) )
            {
                if ( isdefined( self.spawnpoint.script_linkto ) )
                {
                    potential_doors = getentarray( self.spawnpoint.script_linkto, "script_linkname" );
                    
                    if ( !isdefined( potential_doors ) || potential_doors.size < 1 )
                    {
                        potential_doors = getstructarray( self.spawnpoint.script_linkto, "script_linkname" );
                    }
                    
                    if ( isdefined( potential_doors ) && potential_doors.size > 0 )
                    {
                        for (i = 0; i < potential_doors.size; i++) {
                            potential_door = potential_doors[ i ];
                            
                            if ( isdefined( potential_door.targetname ) && potential_door.targetname == "ai_spawn_doors" )
                            {
                                if ( !isdefined( self.spawnpoint.doors ) )
                                {
                                    self.spawnpoint.doors = [ potential_door ];
                                }
                                else
                                {
                                    self.spawnpoint.doors[ self.spawnpoint.doors.size ] = potential_door;
                                }
                                
                                continue;
                            }
                            
                            if ( isdefined( potential_doors[ 0 ].script_noteworthy ) && potential_doors[ 0 ].script_noteworthy == "spawn_door_single" )
                            {
                                if ( !isdefined( self.spawnpoint.doors ) )
                                {
                                    self.spawnpoint.doors = [ potential_door ];
                                    continue;
                                }
                                
                                self.spawnpoint.doors[ self.spawnpoint.doors.size ] = potential_door;
                            }
                        }
                        
                        if ( isdefined( self.spawnpoint.doors ) && self.spawnpoint.doors > 0 )
                        {
                            self.spawnpoint.door_spawner = 1;
                            return 1;
                        }
                        else
                        {
                            return 0;
                        }
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }
        else if ( isdefined( self.spawnpoint.script_linkto ) )
        {
            potential_doors = getentarray( self.spawnpoint.script_linkto, "script_linkname" );
            
            if ( !isdefined( potential_doors ) || potential_doors.size < 1 )
            {
                potential_doors = getstructarray( self.spawnpoint.script_linkto, "script_linkname" );
            }
            
            if ( isdefined( potential_doors ) && potential_doors.size > 0 )
            {
                for (i = 0; i < potential_doors.size; i++) {
                    potential_door = potential_doors[ i ];
                    
                    if ( isdefined( potential_door.targetname ) && potential_door.targetname == "ai_spawn_doors" )
                    {
                        if ( !isdefined( self.spawnpoint.doors ) )
                        {
                            self.spawnpoint.doors = [ potential_door ];
                        }
                        else
                        {
                            self.spawnpoint.doors[ self.spawnpoint.doors.size ] = potential_door;
                        }
                        
                        continue;
                    }
                    
                    if ( isdefined( potential_doors[ 0 ].script_noteworthy ) && potential_doors[ 0 ].script_noteworthy == "spawn_door_single" )
                    {
                        if ( !isdefined( self.spawnpoint.doors ) )
                        {
                            self.spawnpoint.doors = [ potential_door ];
                            continue;
                        }
                        
                        self.spawnpoint.doors[ self.spawnpoint.doors.size ] = potential_door;
                    }
                }
                
                if ( isdefined( self.spawnpoint.doors ) && self.spawnpoint.doors.size > 0 )
                {
                    self.spawnpoint.door_spawner = 1;
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa94b
// Size: 0x89
function is_armored()
{
    if ( isdefined( self.spawnpoint ) )
    {
        if ( istrue( self.wearing_armor ) )
        {
            return 1;
        }
        else if ( istrue( self.equip_armor ) )
        {
            return 1;
        }
        else if ( !isnode( self.spawnpoint ) && isdefined( self.spawnpoint.spawnflags ) )
        {
            return ( self.spawnpoint.spawnflags & 2 );
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return istrue( self.equip_armor );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9dc
// Size: 0x63
function is_patroller()
{
    if ( isdefined( self.spawnpoint ) )
    {
        if ( !isnode( self.spawnpoint ) && isdefined( self.spawnpoint.spawnflags ) )
        {
            return ( self.spawnpoint.spawnflags & 128 );
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return istrue( self.script_patroller );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa47
// Size: 0x77
function is_pacifist()
{
    if ( istrue( self.pacifist_override ) )
    {
        return 1;
    }
    
    if ( isdefined( self.spawnpoint ) )
    {
        if ( !isnode( self.spawnpoint ) && isdefined( self.spawnpoint.spawnflags ) )
        {
            return ( self.spawnpoint.spawnflags & 256 );
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return istrue( self.script_pacifist );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaac6
// Size: 0xaf
function has_dont_kill_off_flag()
{
    if ( isdefined( self.birthtime ) && self.birthtime >= gettime() )
    {
        return 1;
    }
    
    if ( has_never_kill_off_flag() )
    {
        return 1;
    }
    
    if ( istrue( self.skip_dko_check ) )
    {
        return 0;
    }
    
    if ( istrue( self.dontkilloff ) )
    {
        return 1;
    }
    
    if ( isdefined( self.spawnpoint ) )
    {
        if ( !isnode( self.spawnpoint ) && isdefined( self.spawnpoint.spawnflags ) )
        {
            return ( self.spawnpoint.spawnflags & 1024 );
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab7d
// Size: 0x91
function has_never_kill_off_flag()
{
    if ( isdefined( self.birthtime ) && self.birthtime >= gettime() )
    {
        return 1;
    }
    
    if ( istrue( self.never_kill_off ) )
    {
        return 1;
    }
    
    if ( isdefined( self.spawnpoint ) )
    {
        if ( !isnode( self.spawnpoint ) && isdefined( self.spawnpoint.spawnflags ) )
        {
            return ( self.spawnpoint.spawnflags & 2048 );
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac16
// Size: 0x8a
function should_roam()
{
    if ( istrue( level.var_3abdb45e8244ce30 ) )
    {
        return 0;
    }
    
    if ( isdefined( self.spawnpoint ) && !istrue( spawn_is_vehicle_spawn( self.spawnpoint ) ) )
    {
        if ( !isnode( self.spawnpoint ) && isdefined( self.spawnpoint.spawnflags ) )
        {
            if ( self.spawnpoint.spawnflags & 512 )
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        else
        {
            return 1;
        }
        
        return;
    }
    
    return 1;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaca8
// Size: 0xb8
function parent_spawner_disable_after_count( group, spawn_point )
{
    group endon( "death" );
    self notify( "parent_spawner_disable_after_count" );
    self endon( "parent_spawner_disable_after_count" );
    spawn_point endon( "spawn_failed" );
    spawn_point waittill( "spawn_success" );
    
    if ( isdefined( self.script_count ) )
    {
        self.script_count--;
        
        if ( self.script_count < 1 )
        {
            thread disable_spawn_point( self, self.script_timeout, group );
        }
        
        return;
    }
    
    if ( isdefined( self.script_timeout ) )
    {
        if ( !isdefined( self.lastspawntime ) )
        {
            self.lastspawntime = 0;
        }
        
        self.lastspawntime = gettime() + self.script_timeout * 1000 + 10000;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xad68
// Size: 0x84
function spawner_disable_after_count( group )
{
    if ( isdefined( self.script_count ) )
    {
        self.script_count--;
        
        if ( self.script_count < 1 )
        {
            thread disable_spawn_point( self, self.script_timeout, group );
        }
        
        return;
    }
    
    if ( isdefined( self.script_timeout ) )
    {
        if ( !isdefined( self.lastspawntime ) )
        {
            spawner_init();
        }
        
        self.lastspawntime = gettime() + self.script_timeout * 1000;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xadf4
// Size: 0xe
function init_cluster_parent()
{
    define_spawner( "cluster_spawner" );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xae0a
// Size: 0x3f
function enemy_monitor( enemy_type, spec )
{
    level endon( "game_ended" );
    update_spawn_data_on_spawn( enemy_type, spec );
    
    if ( getdvarint( @"hash_e170eded9289133e", 0 ) != 0 )
    {
        thread kill_agent_when_in_water();
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae51
// Size: 0xa1
function kill_agent_when_in_water()
{
    self endon( "death" );
    
    while ( true )
    {
        trace = scripts\engine\trace::_bullet_trace( self.origin + ( 0, 0, 10 ), self.origin + ( 0, 0, -10 ), 0, self );
        self.hit_water = trace[ "surfacetype" ] == "surftype_water";
        
        if ( istrue( self.hit_water ) )
        {
            if ( istrue( level.bshockactive ) )
            {
                if ( isdefined( level.soldiershockfunc ) )
                {
                    self [[ level.soldiershockfunc ]]( 2 );
                }
            }
        }
        
        wait 1;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaefa
// Size: 0x10f
function update_spawn_data_on_spawn( enemy_type, spec )
{
    var_ebc9b6ae903f9c28 = 1;
    
    if ( isdefined( self.team ) )
    {
        if ( self.team == "axis" )
        {
            level.spawned_enemies[ level.spawned_enemies.size ] = self;
            level.current_num_spawned_enemies += var_ebc9b6ae903f9c28;
        }
        else if ( self.team == "allies" )
        {
            level.spawned_allies[ level.spawned_allies.size ] = self;
        }
    }
    
    level.spawned_ai[ level.spawned_ai.size ] = self;
    
    if ( isdefined( enemy_type ) )
    {
        if ( enemy_type == "juggernaut" )
        {
            if ( !isdefined( level.spawned_juggernauts ) )
            {
                level.spawned_juggernauts = [];
            }
            
            level.spawned_juggernauts[ level.spawned_juggernauts.size ] = self;
        }
        
        if ( enemy_type == "soldier_agent" || enemy_type == "soldier" )
        {
            level.current_num_spawned_soldiers += var_ebc9b6ae903f9c28;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb011
// Size: 0x86
function remove_from_kill_off_list()
{
    if ( isdefined( level.can_kill_off_list ) )
    {
        if ( isdefined( self.entity_number ) && isdefined( level.can_kill_off_list[ self.entity_number ] ) )
        {
            level.can_kill_off_list[ self.entity_number ] = undefined;
        }
        else if ( isdefined( level.can_kill_off_list[ self getentitynumber() ] ) )
        {
            level.can_kill_off_list[ self getentitynumber() ] = undefined;
        }
        
        if ( level.can_kill_off_list.size < 1 )
        {
            level notify( "stop_kill_off_loop" );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb09f
// Size: 0x8c3
function update_spawn_data_on_death( eattacker, sweapon )
{
    self notify( "update_spawn_data_on_death" );
    self endon( "update_spawn_data_on_death" );
    level endon( "game_ended" );
    thread remove_from_kill_off_list();
    
    if ( !isdefined( self.group ) )
    {
        level notify( "no group defined" );
    }
    
    var_ebc9b6ae903f9c28 = 1;
    
    if ( isdefined( self.team ) )
    {
        if ( self.team == "axis" )
        {
            if ( array_contains( level.spawned_enemies, self ) )
            {
                level.spawned_enemies = array_remove( level.spawned_enemies, self );
                level.current_num_spawned_enemies -= var_ebc9b6ae903f9c28;
            }
        }
        else if ( self.team == "allies" )
        {
            if ( array_contains( level.spawned_allies, self ) )
            {
                level.spawned_allies = array_remove( level.spawned_allies, self );
            }
        }
    }
    
    remove_from_enemy_list();
    
    if ( isdefined( self.ridingvehicle ) )
    {
        self.ridingvehicle thread add_to_notify_queue( "passenger_died" );
    }
    
    if ( array_contains( level.spawned_ai, self ) )
    {
        level.spawned_ai = array_remove( level.spawned_ai, self );
    }
    
    if ( isdefined( self.group ) )
    {
        is_group_active = is_my_group_an_active_module();
        
        if ( self.group get_activecount_from_group() - var_ebc9b6ae903f9c28 >= 1 )
        {
            self.group.activecount = int( clamp( self.group.activecount - var_ebc9b6ae903f9c28, 0, self.group.activecount - var_ebc9b6ae903f9c28 ) );
        }
        else
        {
            self.group.activecount = 0;
        }
        
        self.group.ai_spawned = array_remove( self.group.ai_spawned, self );
        
        if ( is_group_active )
        {
            if ( !istrue( self.died_poorly ) )
            {
                self.group.currentmodulekills += var_ebc9b6ae903f9c28;
            }
        }
        else
        {
            self.group.currentmodulekills += var_ebc9b6ae903f9c28;
        }
        
        totalspawns = process_module_var( self.group, self.group.totalspawns );
        
        if ( isdefined( totalspawns ) && totalspawns > 0 )
        {
            if ( is_group_active && self.group.currentmodulekills >= totalspawns )
            {
                self.group notify( "spawn_module_" + self.group.moduleid + "_completed" );
                self.group notify( "group_spawning_completed" );
                self.group notify( "reached_total_spawns" );
                level notify( "group_spawning_completed" );
                
                if ( self.group get_activecount_from_group( 1 ) < 1 )
                {
                    remove_group_from_combined_module_counters( self.group );
                    self.group notify( "all_group_spawns_dead" );
                    
                    if ( array_contains( level.spawn_module_structs_memory[ self.group.group_name ], self.group ) )
                    {
                        level.spawn_module_structs_memory[ self.group.group_name ] = array_remove( level.spawn_module_structs_memory[ self.group.group_name ], self.group );
                        
                        if ( isdefined( level.spawn_module_structs_memory[ self.group.group_name ] ) && level.spawn_module_structs_memory[ self.group.group_name ].size < 1 )
                        {
                            level.spawn_module_structs_memory[ self.group.group_name ] = undefined;
                        }
                    }
                }
            }
            else if ( !is_group_active && self.group get_activecount_from_group( 1 ) < 1 )
            {
                remove_group_from_combined_module_counters( self.group );
                self.group notify( "all_group_spawns_dead" );
                
                if ( isdefined( level.spawn_module_structs_memory[ self.group.group_name ] ) && array_contains( level.spawn_module_structs_memory[ self.group.group_name ], self.group ) )
                {
                    level.spawn_module_structs_memory[ self.group.group_name ] = array_remove( level.spawn_module_structs_memory[ self.group.group_name ], self.group );
                    
                    if ( isdefined( level.spawn_module_structs_memory[ self.group.group_name ] ) && level.spawn_module_structs_memory[ self.group.group_name ].size < 1 )
                    {
                        level.spawn_module_structs_memory[ self.group.group_name ] = undefined;
                    }
                }
            }
            else if ( is_group_active && self.group get_activecount_from_group( 1 ) < 1 )
            {
                self.group notify( "active_all_group_spawns_dead" );
            }
        }
        else if ( !is_group_active && self.group get_activecount_from_group( 1 ) < 1 )
        {
            remove_group_from_combined_module_counters( self.group );
            self.group notify( "all_group_spawns_dead" );
            
            if ( isdefined( level.spawn_module_structs_memory[ self.group.group_name ] ) && array_contains( level.spawn_module_structs_memory[ self.group.group_name ], self.group ) )
            {
                level.spawn_module_structs_memory[ self.group.group_name ] = array_remove( level.spawn_module_structs_memory[ self.group.group_name ], self.group );
                
                if ( isdefined( level.spawn_module_structs_memory[ self.group.group_name ] ) && level.spawn_module_structs_memory[ self.group.group_name ].size < 1 )
                {
                    level.spawn_module_structs_memory[ self.group.group_name ] = undefined;
                }
            }
        }
        else if ( is_group_active && self.group get_activecount_from_group( 1 ) < 1 )
        {
            self.group notify( "active_all_group_spawns_dead" );
        }
        
        if ( !istrue( self.died_poorly ) )
        {
            thread run_group_death_funcs();
        }
        else
        {
            thread run_died_poorly_funcs();
        }
        
        if ( group_has_combined_counters( self.group.group_name ) )
        {
            combined_alias = self.group get_has_combined_counters_alias();
            
            if ( isdefined( combined_alias ) )
            {
                module_structs = level.combined_counters_groups[ combined_alias ];
                
                if ( isdefined( module_structs ) && module_structs.size > 0 )
                {
                    for (i = 0; i < module_structs.size; i++) {
                        level thread send_notify_to_groups_from_groupname( module_structs[ i ].group_name, "activeCount_changed", module_structs[ i ] get_activecount_from_group() );
                    }
                }
                else
                {
                    level thread send_notify_to_groups_from_groupname( self.group.group_name, "activeCount_changed", self.group get_activecount_from_group() );
                }
            }
            else
            {
                level thread send_notify_to_groups_from_groupname( self.group.group_name, "activeCount_changed", self.group get_activecount_from_group() );
            }
        }
        else
        {
            level thread send_notify_to_groups_from_groupname( self.group.group_name, "activeCount_changed", self.group get_activecount_from_group() );
        }
    }
    
    if ( isdefined( self.unittype ) )
    {
        if ( isdefined( self.unittype ) && self.unittype == "juggernaut" )
        {
            level.current_num_spawned_juggernauts -= var_ebc9b6ae903f9c28;
        }
        
        if ( self.unittype == "soldier" )
        {
            level.current_num_spawned_soldiers -= var_ebc9b6ae903f9c28;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb96a
// Size: 0x94
function toggle_force_stop_wave_from_groupname( group_name, bool, module_status )
{
    if ( isdefined( level.spawn_module_structs_memory[ group_name ] ) )
    {
        for (i = 0; i < level.spawn_module_structs_memory[ group_name ].size; i++) {
            level.spawn_module_structs_memory[ group_name ][ i ].stop_wave_spawning = bool;
            
            if ( !istrue( bool ) )
            {
                level.spawn_module_structs_memory[ group_name ][ i ] notify( "wave_spawn" );
            }
            
            change_module_status( level.spawn_module_structs_memory[ group_name ][ i ], module_status );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba06
// Size: 0x80
function get_spawn_count_from_groupname( group_name )
{
    return_count = 0;
    
    if ( isdefined( level.spawn_module_structs_memory[ group_name ] ) )
    {
        for (i = 0; i < level.spawn_module_structs_memory[ group_name ].size; i++) {
            if ( isdefined( level.spawn_module_structs_memory[ group_name ][ i ].spawn_count ) )
            {
                return_count += level.spawn_module_structs_memory[ group_name ][ i ].spawn_count;
            }
        }
    }
    
    return return_count;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba8f
// Size: 0x17
function subtract_from_spawn_count_from_group( module_struct )
{
    module_struct.spawn_count--;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbaae
// Size: 0x71
function reset_spawn_count_from_groupname( group_name )
{
    if ( isdefined( level.spawn_module_structs_memory[ group_name ] ) )
    {
        for (i = 0; i < level.spawn_module_structs_memory[ group_name ].size; i++) {
            if ( isdefined( level.spawn_module_structs_memory[ group_name ][ i ].spawn_count ) )
            {
                level.spawn_module_structs_memory[ group_name ][ i ].spawn_count = 0;
            }
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbb27
// Size: 0x78
function send_notify_to_groups_from_groupname( group_name, var_ff5ccede2521cb13, param1, param2 )
{
    if ( isdefined( level.spawn_module_structs_memory[ group_name ] ) )
    {
        for (i = 0; i < level.spawn_module_structs_memory[ group_name ].size; i++) {
            group = level.spawn_module_structs_memory[ group_name ][ i ];
            group thread add_to_notify_queue( var_ff5ccede2521cb13, param1 );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbba7
// Size: 0xc5
function get_activecount_from_group( var_c0ad69e25377169f )
{
    if ( istrue( self.skip_soldier_spawn ) )
    {
        return self.module_vehicles_count;
    }
    
    return_count = 0;
    
    if ( !istrue( var_c0ad69e25377169f ) && isdefined( self.combined_alias ) )
    {
        module_structs = level.combined_counters_groups[ self.combined_alias ];
        
        for (i = 0; i < module_structs.size; i++) {
            module = module_structs[ i ];
            
            if ( isdefined( module.activecount ) )
            {
                return_count += module.activecount;
            }
        }
    }
    else if ( isdefined( self.activecount ) )
    {
        return_count = self.activecount;
    }
    
    return return_count;
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbc74
// Size: 0x94
function set_wave_settings_for_all_with_groupname( group_name, wave_reference, last_wave_ref, last_wave_num )
{
    if ( isdefined( level.active_spawn_module_structs[ group_name ] ) )
    {
        for (i = 0; i < level.active_spawn_module_structs[ group_name ].size; i++) {
            group = level.active_spawn_module_structs[ group_name ][ i ];
            group.wave_reference = wave_reference;
            group.last_wave_ref = last_wave_ref;
            group.last_wave_num = last_wave_num;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbd10
// Size: 0x20
function toggle_kamikaze_for_group( group, bool )
{
    group.kamikaze = bool;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbd38
// Size: 0x10f
function equip_random_grenade()
{
    grenade_types = [ "frag_grenade_mp", "molotov_mp", "semtex_mp", "flash_grenade_mp", "concussion_grenade_mp", "smoke_grenade_mp", "gas_mp" ];
    grenade_chances = [ 0.5, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1 ];
    grenade_total = array_sum( grenade_chances );
    grenade_choice = randomfloatrange( 0, grenade_total );
    var_8d4edd505adf2c5d = 0;
    
    for (var_ad78e2d0efc05af6 = 0; var_ad78e2d0efc05af6 < grenade_types.size; var_ad78e2d0efc05af6++) {
        var_8d4edd505adf2c5d += grenade_chances[ var_ad78e2d0efc05af6 ];
        
        if ( var_8d4edd505adf2c5d >= grenade_choice )
        {
            self.grenadeweapon = makeweapon( grenade_types[ var_ad78e2d0efc05af6 ] );
            self.grenadeammo = 2;
            return;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe4f
// Size: 0x78
function wave_go_kamikaze( group )
{
    level endon( "game_ended" );
    
    if ( isdefined( group ) )
    {
        group notify( "wave_go_kamikaze" );
        group endon( "wave_go_kamikaze" );
        group endon( "death" );
        
        if ( isdefined( group.timeout_after_min_count ) && group.timeout_after_min_count > 0 )
        {
            update_enemies_remaining( 0, group );
            group thread timeout_wave( group.timeout_after_min_count );
        }
    }
    
    wait 1.5;
    level notify( "wave_ending" );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbecf
// Size: 0xce
function wave_failsafe_end( group )
{
    level endon( "game_ended" );
    level endon( "timeout_wave" );
    level notify( "wave_failsafe_end" );
    level endon( "wave_failsafe_end" );
    
    if ( !is_wave_gametype() )
    {
        return;
    }
    
    var_307ff213be4e59bb = 0;
    maxtimes = 45;
    var_d49b6c890b68be84 = int( maxtimes / 2 );
    
    while ( true )
    {
        guys = scripts\cp\cp_agent_utils::getaliveagentsofteam( "axis" );
        
        if ( guys.size == 0 )
        {
            var_307ff213be4e59bb++;
        }
        
        /#
            if ( var_307ff213be4e59bb > var_d49b6c890b68be84 )
            {
                announcement( "<dev string:x2b0>" + var_307ff213be4e59bb + "<dev string:x2c5>" + maxtimes );
            }
        #/
        
        if ( var_307ff213be4e59bb >= maxtimes )
        {
            break;
        }
        
        wait 1;
    }
    
    update_enemies_remaining( 0, group );
    group thread timeout_wave( group.timeout_after_min_count );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbfa5
// Size: 0x194
function timeout_wave( wait_time )
{
    level endon( "game_ended" );
    level notify( "timeout_wave" );
    level endon( "timeout_wave" );
    self endon( "death" );
    setomnvar( "cp_countdown_color", 0 );
    
    if ( getdvarint( @"hash_f51cca1f5c183719", -1 ) != -1 )
    {
        wait_time = getdvarint( @"hash_f51cca1f5c183719", -1 );
    }
    
    notify_all_groups_in_module( self.group_name, "threshold_timeout" );
    toggle_force_stop_wave_from_groupname( self.group_name, 1, "wave_delay" );
    toggle_force_stop_wave_from_groupname( "wave_paratroopers", 1, "wave_delay" );
    wave_cooldown_time( wait_time );
    update_enemies_remaining( 0, self );
    
    if ( !istrue( self.disable_wave_hud ) )
    {
        wait 0.1;
        
        for (i = 0; i < level.players.size; i++) {
            level.players[ i ] thread scripts\cp\cp_hud_message::showsplash( "cp_wave_ended", level.display_wave_num, undefined );
            level.players[ i ] thread scripts\cp\cp_challenge::onplant();
        }
    }
    
    wait wait_time - 10;
    
    for (i = 0; i < 10; i++) {
        setomnvar( "cp_countdown_color", 2 );
        wait 1;
    }
    
    setomnvar( "cp_wave_timer", 0 );
    scripts\cp\cp_wave_spawning::increase_wave_num();
    run_func_on_group_by_groupname( self.group_name, [ &toggle_kamikaze_for_group, undefined ] );
    toggle_force_stop_wave_from_groupname( self.group_name, undefined, "new_wave_starting" );
    toggle_force_stop_wave_from_groupname( "wave_paratroopers", undefined, "new_wave_starting" );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc141
// Size: 0x55
function notify_all_groups_in_module( group_name, var_ff5ccede2521cb13 )
{
    if ( isdefined( level.spawn_module_structs_memory[ group_name ] ) )
    {
        for (i = 0; i < level.spawn_module_structs_memory[ group_name ].size; i++) {
            level.spawn_module_structs_memory[ group_name ][ i ] notify( var_ff5ccede2521cb13 );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc19e
// Size: 0x6f
function group_wait_for_activecount_notify( waittill_count )
{
    self endon( "death" );
    self endon( "threshold_timeout" );
    
    while ( true )
    {
        self waittill( "activeCount_changed", new_activecount );
        
        if ( getdvarfloat( @"hash_4f27a8ab9bae330a", 0 ) != 0 )
        {
            childthread start_threshold_timeout( getdvarfloat( @"hash_4f27a8ab9bae330a" ) );
        }
        
        if ( new_activecount <= waittill_count )
        {
            self notify( "start_threshold_timeout" );
            break;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc215
// Size: 0x24
function start_threshold_timeout( timeout )
{
    self notify( "start_threshold_timeout" );
    self endon( "start_threshold_timeout" );
    wait timeout;
    self notify( "threshold_timeout" );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc241
// Size: 0x6c
function run_group_death_funcs()
{
    if ( isdefined( self.group ) && isdefined( self.group.ai_death_func ) )
    {
        for (i = 0; i < self.group.ai_death_func.size; i++) {
            self thread [[ self.group.ai_death_func[ i ] ]]();
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc2b5
// Size: 0x96, Type: bool
function is_my_group_an_active_module()
{
    keys = getarraykeys( level.active_spawn_module_structs );
    
    for (i = 0; i < keys.size; i++) {
        group = level.active_spawn_module_structs[ keys[ i ] ];
        
        if ( isarray( group ) )
        {
            for (j = 0; j < group.size; j++) {
                if ( group[ j ] == self.group )
                {
                    return true;
                }
            }
            
            continue;
        }
        
        if ( group == self.group )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc354
// Size: 0x5d
function get_total_reserved_slot_count()
{
    count = 0;
    
    foreach ( slot in level.reserved_spawn_slots )
    {
        count += slot;
    }
    
    return count;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3ba
// Size: 0x31
function get_reserved_slot_count_by_string_id( string_id )
{
    if ( isdefined( string_id ) && isdefined( level.reserved_spawn_slots[ string_id ] ) )
    {
        return level.reserved_spawn_slots[ string_id ];
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc3f3
// Size: 0x75
function increase_reserved_spawn_slots( num, string_id, group )
{
    if ( isdefined( string_id ) )
    {
        if ( !isdefined( level.reserved_spawn_slots[ string_id ] ) )
        {
            level.reserved_spawn_slots[ string_id ] = 0;
        }
    }
    else
    {
        string_id = "default";
    }
    
    level.reserved_spawn_slots[ string_id ] += num;
    allowed_to_spawn_agent( group, 1, level.reserved_spawn_slots[ string_id ], string_id );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc470
// Size: 0xfb
function decrease_reserved_spawn_slots( num, string_id )
{
    if ( isdefined( string_id ) )
    {
        if ( isdefined( level.reserved_spawn_slots[ string_id ] ) )
        {
            current_count = level.reserved_spawn_slots[ string_id ];
            level.reserved_spawn_slots[ string_id ] = int( clamp( current_count - num, 0, current_count - num ) );
            
            if ( level.reserved_spawn_slots[ string_id ] < 1 )
            {
                level.reserved_spawn_slots[ string_id ] = undefined;
            }
        }
        else
        {
            assertmsg( "Tried to decrease reserved spawn count for an ID that was never created: " + string_id );
        }
        
        return;
    }
    
    string_id = "default";
    
    if ( isdefined( level.reserved_spawn_slots[ string_id ] ) )
    {
        current_count = level.reserved_spawn_slots[ string_id ];
        level.reserved_spawn_slots[ string_id ] = int( clamp( current_count - num, 0, current_count - num ) );
        
        if ( level.reserved_spawn_slots[ string_id ] < 1 )
        {
            level.reserved_spawn_slots[ string_id ] = undefined;
        }
        
        return;
    }
    
    assertmsg( "Tried to decrease reserved spawn count for an ID that was never created: " + string_id );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc573
// Size: 0x148
function enter_combat( unused )
{
    if ( istrue( level.var_a4977696d3393dd8 ) || istrue( self.aggressive ) || istrue( self.dont_enter_combat ) )
    {
        return;
    }
    
    if ( scripts\cp\coop_stealth::should_run_sp_stealth() )
    {
        return;
    }
    
    self notify( "alerted" );
    self notify( "enter_combat" );
    self notify( "stop_going_to_node" );
    self endon( "death" );
    level endon( "game_ended" );
    set_kill_off_time();
    set_demeanor_from_unittype( "combat" );
    
    if ( getdvarint( @"hash_9bcca58e56e4c178", 0 ) )
    {
        scripts\cp\cp_outline::enable_outline_for_players( self, level.players, "outline_nodepth_green", "high" );
    }
    
    self.pacifist_override = undefined;
    self.scripted_mode = 0;
    self.entered_combat = 1;
    self.script_pacifist = undefined;
    self.pacifist = 0;
    self.currentnode = undefined;
    
    if ( !is_specified_unittype( "juggernaut" ) )
    {
        random_speed = randomintrange( 180, 220 );
        set_movement_speed( random_speed );
    }
    
    if ( !is_specified_unittype( "suicidebomber" ) && !is_specified_unittype( "civilian" ) && !function_5bb77addd9f02498( "allies" ) )
    {
        thread get_enemy_info_loop();
    }
    
    run_combat_func();
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc6c3
// Size: 0xd7
function run_combat_func( param1, param2 )
{
    if ( isdefined( self.combat_func_override ) )
    {
        var_44a76d6f2a335572 = self.combat_func_override;
    }
    else
    {
        var_44a76d6f2a335572 = self.aitype;
    }
    
    if ( isdefined( var_44a76d6f2a335572 ) )
    {
        if ( isdefined( level.aitypes[ var_44a76d6f2a335572 ] ) && isdefined( level.aitypes[ var_44a76d6f2a335572 ].combat_func ) )
        {
            if ( isdefined( param1 ) && isdefined( param2 ) )
            {
                self thread [[ level.aitypes[ var_44a76d6f2a335572 ].combat_func ]]( param1, param2 );
                return;
            }
            
            if ( isdefined( param1 ) )
            {
                self thread [[ level.aitypes[ var_44a76d6f2a335572 ].combat_func ]]( param1 );
                return;
            }
            
            self thread [[ level.aitypes[ var_44a76d6f2a335572 ].combat_func ]]();
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7a2
// Size: 0x4a6
function get_enemy_info_loop( tickrate )
{
    level endon( "game_ended" );
    self notify( "get_enemy_info_loop" );
    self endon( "get_enemy_info_loop" );
    self endon( "death" );
    
    if ( istrue( self.attempting_teleport ) )
    {
        self.ignoreall = 0;
        self.is_on_platform = undefined;
        self.attempting_teleport = undefined;
        self show();
        set_kill_off_time( 20 );
    }
    
    if ( !isdefined( tickrate ) )
    {
        tickrate = 2;
    }
    
    var_eeeaa28f8fa549d1 = 0;
    first_loop = 1;
    comp_dist = get_comp_dist_for_info_loop();
    var_b9b21f015277470b = &get_all_players_enemy_info_new;
    var_9145d185f89cf357 = &get_closest_available_player_new;
    
    /#
        if ( !getdvarint( @"hash_6cdc395f7da6defb", 1 ) )
        {
            var_b9b21f015277470b = &get_all_players_enemy_info;
            var_9145d185f89cf357 = &get_closest_available_player;
            known_players = undefined;
        }
    #/
    
    while ( true )
    {
        if ( should_skip_info_loop() )
        {
            var_eeeaa28f8fa549d1 = 0;
            self.target_enemy = undefined;
        }
        else
        {
            var_6dff1fc88ca160af = comp_dist;
            
            if ( first_loop )
            {
                var_6dff1fc88ca160af = undefined;
            }
            
            known_players = self [[ var_b9b21f015277470b ]]( var_6dff1fc88ca160af );
            
            /#
                if ( !getdvarint( @"hash_6cdc395f7da6defb", 1 ) )
                {
                    known_players = undefined;
                }
            #/
            
            target_player = self [[ var_9145d185f89cf357 ]]( var_6dff1fc88ca160af, known_players );
            
            if ( isdefined( target_player ) )
            {
                first_loop = 0;
                
                if ( isdefined( self.script_origin_other ) )
                {
                    target_pos = self.script_origin_other;
                }
                else
                {
                    target_pos = target_player.origin;
                }
                
                if ( is_wave_gametype() )
                {
                    set_goal_pos_check_for_offset( target_player.origin );
                }
                else if ( !has_dont_kill_off_flag() && z_is_excessive( target_pos ) )
                {
                    if ( passed_kill_off_time_checks( gettime() ) )
                    {
                        teleport_to_nearby_spawner( "Too Far From Target", target_pos );
                    }
                }
                else
                {
                    set_kill_off_time( tickrate );
                    set_demeanor_from_unittype( "combat" );
                    
                    if ( isdefined( self.goal_pos_override ) && !isdefined( self.last_set_goalent ) )
                    {
                        self.goal_pos_override = undefined;
                        set_goal_radius( self.last_goalradius );
                    }
                    
                    update_target_player( target_player );
                    
                    if ( isdefined( self.group ) )
                    {
                        self.group ent_flag_set( "weapons_free" );
                    }
                    
                    if ( isdefined( self.script_goalvolume ) )
                    {
                        self setgoalvolumeauto( self.script_goalvolume );
                    }
                    else
                    {
                        self cleargoalvolume();
                        
                        if ( !istrue( self.combat_func_active ) )
                        {
                            if ( !istrue( self.is_on_platform ) && isdefined( self.engagemaxdist ) )
                            {
                                var_934f2bd9f0e5c04b = 6;
                                
                                /#
                                    if ( getdvarfloat( @"hash_514492028bbf5964", 0 ) > 0 )
                                    {
                                        var_934f2bd9f0e5c04b = getdvarfloat( @"hash_514492028bbf5964" );
                                    }
                                #/
                                
                                if ( self seerecently( target_player, var_934f2bd9f0e5c04b ) )
                                {
                                    var_3a1644f2929823d8 = distancesquared( target_pos, self.origin );
                                    dist_valid = var_3a1644f2929823d8 <= self.engagemaxdist * self.engagemaxdist;
                                    
                                    if ( istrue( var_eeeaa28f8fa549d1 ) && dist_valid || isdefined( target_player.vehicle_riding_on ) )
                                    {
                                        var_eeeaa28f8fa549d1 = 0;
                                        set_goal_pos_check_for_offset( self.origin );
                                    }
                                    else if ( !istrue( var_eeeaa28f8fa549d1 ) && !dist_valid )
                                    {
                                        var_eeeaa28f8fa549d1 = 1;
                                        set_goal_pos_check_for_offset( target_player.origin );
                                    }
                                }
                                else
                                {
                                    var_eeeaa28f8fa549d1 = 1;
                                    set_goal_pos_check_for_offset( target_player.origin );
                                }
                            }
                            else
                            {
                                self.goal_pos_override = undefined;
                                set_goal_pos_check_for_offset( self.origin );
                            }
                        }
                    }
                }
            }
            else if ( !istrue( self.combat_func_active ) )
            {
                var_eeeaa28f8fa549d1 = 0;
                self.target_enemy = undefined;
                self.goal_pos_override = undefined;
                
                if ( isdefined( self.script_origin_other ) )
                {
                    set_goal_pos_check_for_offset( self.script_origin_other );
                }
                else if ( istrue( self.is_on_platform ) )
                {
                    set_goal_pos_check_for_offset( self.origin );
                }
                else if ( isdefined( self.script_goalvolume ) )
                {
                    self setgoalvolumeauto( self.script_goalvolume );
                }
                else if ( !has_dont_kill_off_flag() )
                {
                    if ( passed_kill_off_time_checks( gettime() ) )
                    {
                        teleport_to_nearby_spawner( "No Target Found", self.origin );
                    }
                    else
                    {
                        set_goal_pos_check_for_offset( self.origin );
                        set_demeanor_from_unittype( "cqb" );
                    }
                }
                else
                {
                    set_goal_pos_check_for_offset( self.origin );
                    set_demeanor_from_unittype( "cqb" );
                }
            }
        }
        
        wait tickrate;
        
        if ( istrue( self.var_4b3eda62dd53f00b ) )
        {
            return;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc50
// Size: 0xb3
function get_comp_dist_for_info_loop()
{
    if ( isdefined( self.group ) )
    {
        if ( isdefined( self.group.spawn_scoring_overrides ) )
        {
            comp_dist = self.group.spawn_scoring_overrides.too_far_dist;
        }
        else if ( istrue( self.group.cqb_module ) )
        {
            comp_dist = 2333;
        }
        else
        {
            comp_dist = 4096;
        }
    }
    else if ( istrue( level.spawn_scoring_overrides ) )
    {
        comp_dist = level.spawn_scoring_overrides.too_far_dist;
    }
    else
    {
        comp_dist = 4096;
    }
    
    comp_dist = int( min( comp_dist, 2500 ) );
    return comp_dist;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd0c
// Size: 0x33
function should_skip_info_loop()
{
    if ( istrue( self.ignoreall ) || istrue( self.scripted_mode ) || istrue( self.var_894d1167ace5b58c ) )
    {
        return 1;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd47
// Size: 0x35
function get_all_players_enemy_info()
{
    for (i = 0; i < level.players.size; i++) {
        self getenemyinfo( level.players[ i ] );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcd84
// Size: 0x8d
function get_all_players_enemy_info_new( unused )
{
    self notify( "get_all_players_enemy_info_new" );
    self endon( "get_all_players_enemy_info_new" );
    return_array = [];
    
    if ( !is_equal( self.demeanoroverride, "combat" ) )
    {
        self endon( "death" );
        wait 5;
    }
    
    for (i = 0; i < level.players.size; i++) {
        if ( get_player_info_proc( level.players[ i ] ) )
        {
            return_array[ return_array.size ] = level.players[ i ];
        }
    }
    
    return return_array;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xce1a
// Size: 0x139, Type: bool
function get_player_info_proc( player )
{
    if ( is_wave_gametype() )
    {
        player.lastseentime = gettime();
        self getenemyinfo( player );
        return true;
    }
    
    var_934f2bd9f0e5c04b = 5;
    var_2ab4eb5f9bf4dd77 = 5;
    
    /#
        if ( getdvarfloat( @"hash_c39932314d687d48", 0 ) > 0 )
        {
            var_934f2bd9f0e5c04b = getdvarfloat( @"hash_c39932314d687d48" );
        }
        
        if ( getdvarfloat( @"hash_f5c00cbc60277e7d", 0 ) > 0 )
        {
            var_2ab4eb5f9bf4dd77 = getdvarfloat( @"hash_f5c00cbc60277e7d" );
        }
    #/
    
    if ( self seerecently( player, var_934f2bd9f0e5c04b ) )
    {
        player.lastseentime = gettime();
        self getenemyinfo( player );
        return true;
    }
    else if ( isdefined( player.lastseentime ) && gettime() < player.lastseentime + var_2ab4eb5f9bf4dd77 * 1000 )
    {
        self getenemyinfo( player );
        return true;
    }
    else if ( isdefined( self.pathgoalpos ) && distancesquared( self.pathgoalpos, player.origin ) < 262144 && self pathdisttogoal() < 2048 )
    {
        return true;
    }
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf5c
// Size: 0xcb, Type: bool
function z_is_excessive( override_position )
{
    start_pos = self.origin;
    max_z = 256;
    
    if ( self function_e8ca4080d02a0bb4() )
    {
        max_z = 512;
    }
    
    comp_z = undefined;
    
    if ( isdefined( override_position ) )
    {
        comp_z = override_position[ 2 ];
    }
    
    for (i = 0; i < level.players.size; i++) {
        if ( !isdefined( override_position ) )
        {
            comp_z = level.players[ i ].origin[ 2 ];
        }
        
        if ( int( abs( start_pos[ 2 ] - comp_z ) ) >= max_z && !spawnsighttrace( undefined, level.players[ i ].origin, start_pos ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd030
// Size: 0xa8
function set_goal_pos_to_center_of_nearby_ai()
{
    self endon( "death" );
    
    if ( !isdefined( self.goal_pos_override ) )
    {
        set_goal_radius( 1024 );
    }
    
    all_ai = level.spawned_enemies;
    ai_array = get_array_of_closest( self.origin, all_ai, undefined, 10 );
    center_point = get_center_point_of_array( ai_array );
    
    if ( !isdefined( self.goal_pos_override ) || distance2dsquared( self.goal_pos_override, center_point ) >= 262144 )
    {
        self.goal_pos_override = center_point;
        set_goal_pos( self.goal_pos_override );
    }
    
    wait 5;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd0e0
// Size: 0x73
function has_seen_any_player_recently_watcher()
{
    self endon( "death" );
    cycle = 10;
    var_5471f9fe1d572b7 = gettime() / level.frameduration % cycle;
    myidx = self getentitynumber() % cycle;
    
    if ( var_5471f9fe1d572b7 != myidx )
    {
        wait ( myidx + cycle - var_5471f9fe1d572b7 ) % cycle * level.frameduration / 1000;
    }
    
    while ( has_seen_any_player_recently() )
    {
        wait 0.5;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd15b
// Size: 0x7c, Type: bool
function has_seen_any_player_recently()
{
    var_934f2bd9f0e5c04b = 3;
    
    /#
        if ( getdvarfloat( @"hash_67cfee3012846125", 0 ) > 0 )
        {
            var_934f2bd9f0e5c04b = getdvarfloat( @"hash_c39932314d687d48" );
        }
    #/
    
    for (i = 0; i < level.players.size; i++) {
        if ( self seerecently( level.players[ i ], var_934f2bd9f0e5c04b ) )
        {
            return true;
        }
    }
    
    if ( !killoff_vis_passed() )
    {
        return true;
    }
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd1e0
// Size: 0x4d3
function teleport_to_nearby_spawner( reason, additional_pos, var_8ffce7d21396afe0 )
{
    if ( is_wave_gametype() || istrue( level.var_f57b5db263860330 ) )
    {
        return;
    }
    
    /#
        if ( isdefined( reason ) )
        {
            self.var_79ac1e927ea0b01e = reason;
        }
    #/
    
    if ( istrue( self.marked_for_death ) || istrue( self.attempting_teleport ) )
    {
        return;
    }
    
    if ( has_never_kill_off_flag() )
    {
        if ( isdefined( reason ) )
        {
            /#
                self.var_79ac1e927ea0b01e = reason;
            #/
            
            if ( getdvarint( @"hash_9e9513e7705385bd", 0 ) )
            {
                var_ccc48d184751e941 = 1;
                
                if ( isdefined( additional_pos ) )
                {
                    println( "<dev string:x2c7>" + self.origin + "<dev string:x2d7>" + reason + "<dev string:x2f5>" + additional_pos + "<dev string:x2f8>" );
                    
                    if ( var_ccc48d184751e941 )
                    {
                        announcement( "(NKO)Agent at: " + self.origin + " attempted teleport because: " + reason );
                    }
                    
                    return;
                }
                
                println( "<dev string:x2c7>" + self.origin + "<dev string:x2d7>" + reason );
                
                if ( var_ccc48d184751e941 )
                {
                    announcement( "(NKO)Agent at: " + self.origin + " attempted teleport because: " + reason );
                }
            }
        }
        
        return;
    }
    
    if ( istrue( self.forced_kill_off ) || !isdefined( self.group ) )
    {
        script_kill_ai();
        return;
    }
    
    self endon( "death" );
    self notify( "teleport_to_nearby_spawner" );
    self endon( "teleport_to_nearby_spawner" );
    
    if ( getdvarint( @"hash_9e9513e7705385bd", 0 ) )
    {
        self hudoutlineenable( "outline_cp_teleport_debug" );
    }
    
    if ( getdvarint( @"hash_b7f5396996295942", 0 ) )
    {
        self notify( "get_enemy_info_loop" );
        self.ignoreall = 1;
        self.ignoreme = 1;
        self.marked_for_death = 1;
        set_goal_pos( self.origin );
        self waittill( "forever" );
    }
    
    if ( !isdefined( var_8ffce7d21396afe0 ) )
    {
        var_8ffce7d21396afe0 = 1;
    }
    
    if ( var_8ffce7d21396afe0 )
    {
        has_seen_any_player_recently_watcher();
    }
    
    if ( istrue( self.playing_skit ) )
    {
        script_kill_ai( 1 );
        return;
    }
    
    if ( is_riding_vehicle() )
    {
        script_kill_ai();
        return;
    }
    
    spawnpoint = choose_spawnpoint( self.group, 1, self );
    
    if ( isdefined( spawnpoint ) )
    {
        if ( isdefined( reason ) )
        {
            /#
                self.var_79ac1e927ea0b01e = reason;
            #/
            
            if ( getdvarint( @"hash_9e9513e7705385bd", 0 ) )
            {
                var_ccc48d184751e941 = 1;
                
                if ( isdefined( additional_pos ) )
                {
                    println( "<dev string:x2fa>" + self.origin + "<dev string:x305>" + reason + "<dev string:x2f5>" + additional_pos + "<dev string:x2f8>" );
                    
                    if ( var_ccc48d184751e941 )
                    {
                        announcement( "Agent at: " + self.origin + " teleported because: " + reason );
                    }
                }
                else
                {
                    println( "<dev string:x2fa>" + self.origin + "<dev string:x305>" + reason );
                    
                    if ( var_ccc48d184751e941 )
                    {
                        announcement( "Agent at: " + self.origin + " teleported because: " + reason );
                    }
                }
            }
        }
        
        spawnpoint notify( "spawn_success", spawnpoint );
        self endon( "death" );
        self.combat_func_active = undefined;
        self.attempting_teleport = 1;
        self.ignoreall = 1;
        set_kill_off_time( 20 );
        self hide();
        spawnpoint function_ec648f2c89ea1c91();
        wait 0.1;
        self dontinterpolate();
        spawnpoint_angles = ( 0, 0, 0 );
        
        if ( isdefined( spawnpoint.angles ) )
        {
            spawnpoint_angles = spawnpoint.angles;
        }
        
        self forceteleport( spawnpoint.origin, spawnpoint_angles, 10000, 1 );
        self.goal_pos_override = undefined;
        set_goal_pos( self.origin );
        wait 0.1;
        self.ignoreall = 0;
        self.is_on_platform = undefined;
        self.attempting_teleport = undefined;
        self show();
        set_kill_off_time( 20 );
        target_player = get_closest_available_player();
        update_target_player( target_player );
        return;
    }
    
    if ( isdefined( reason ) )
    {
        if ( reason == "Bad Path" )
        {
            println( "<dev string:x2fa>" + self.origin + "<dev string:x31b>" + additional_pos + "<dev string:x32d>" );
        }
        else if ( reason == "Too Far From Target" )
        {
            /#
                if ( isdefined( additional_pos ) )
                {
                    println( "<dev string:x2fa>" + self.origin + "<dev string:x345>" + reason + "<dev string:x2f5>" + additional_pos + "<dev string:x2f8>" );
                }
                else
                {
                    println( "<dev string:x2fa>" + self.origin + "<dev string:x345>" + reason );
                }
            #/
            
            set_goal_pos_to_center_of_nearby_ai();
        }
        else
        {
            script_kill_ai();
        }
        
        return;
    }
    
    script_kill_ai();
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd6bb
// Size: 0x119
function script_kill_ai( leave_corpse )
{
    remove_from_kill_off_list();
    
    /#
        if ( !isdefined( self.group ) )
        {
            assertex( self.birthtime < gettime(), "<dev string:x370>", "<dev string:x3a1>", self.origin );
        }
        else
        {
            assertex( self.birthtime < gettime(), "<dev string:x3a3>" + self.group.group_name, "<dev string:x3a1>", self.origin );
        }
    #/
    
    if ( self.birthtime >= gettime() )
    {
        waitframe();
    }
    
    self.marked_for_death = 1;
    
    if ( !istrue( leave_corpse ) )
    {
        self.nocorpse = 1;
    }
    
    self.died_poorly = 1;
    self.died_poorly_health = self.health;
    
    if ( istrue( self.wave_spawn ) )
    {
        if ( isdefined( level.var_f09a19ac00f88108 ) )
        {
            level.var_f09a19ac00f88108[ level.var_f09a19ac00f88108.size ] = self.aitype;
        }
    }
    
    self kill();
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd7dc
// Size: 0x62
function remove_from_enemy_list( target_player )
{
    if ( !isdefined( target_player ) && isdefined( self.target_enemy ) )
    {
        target_player = self.target_enemy;
    }
    
    if ( isdefined( target_player ) )
    {
        if ( array_contains( target_player.enemy_list, self ) )
        {
            target_player.enemy_list = array_remove( target_player.enemy_list, self );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd846
// Size: 0xf9
function get_closest_available_player( comp_dist )
{
    best_player = undefined;
    
    if ( isdefined( comp_dist ) )
    {
        players = utility::playersnear( self.origin, comp_dist );
    }
    else
    {
        players = get_array_of_valid_players();
    }
    
    players = sortbydistance( players, self.origin );
    best_dist = comp_dist;
    
    if ( players.size > 0 )
    {
        best_player = players[ 0 ];
        
        for (i = 0; i < players.size; i++) {
            player = players[ i ];
            
            if ( istrue( player.ignoreme ) )
            {
                continue;
            }
            
            if ( !player is_valid_player( 1, 1 ) )
            {
                continue;
            }
            
            if ( isdefined( self.enemy ) && player == self.enemy )
            {
                return player;
            }
            
            if ( cp_is_point_in_front( player.origin ) )
            {
                best_player = player;
                break;
            }
        }
    }
    
    if ( isdefined( best_player ) )
    {
        return best_player;
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd947
// Size: 0x10e
function get_closest_available_player_new( comp_dist, known_players )
{
    best_player = undefined;
    
    if ( isdefined( comp_dist ) && !is_wave_gametype() )
    {
        players = playersnearcustom( self.origin, comp_dist, known_players );
    }
    else
    {
        players = get_array_of_valid_players();
    }
    
    players = sortbydistance( players, self.origin );
    best_dist = comp_dist;
    
    if ( players.size > 0 )
    {
        best_player = players[ 0 ];
        
        for (i = 0; i < players.size; i++) {
            player = players[ i ];
            
            if ( istrue( player.ignoreme ) )
            {
                continue;
            }
            
            if ( !player is_valid_player( 1, 1 ) )
            {
                continue;
            }
            
            if ( isdefined( self.enemy ) && player == self.enemy )
            {
                return player;
            }
            
            if ( player cp_is_point_in_front( self.origin ) )
            {
                best_player = player;
                break;
            }
        }
    }
    
    if ( isdefined( best_player ) )
    {
        return best_player;
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xda5d
// Size: 0xc5
function playersnearcustom( point, distance, known_players )
{
    playercontents = physics_createcontents( [ "physicscontents_characterproxy" ] );
    radiusvector = ( distance, distance, distance );
    aabbmin = point - radiusvector;
    aabbmax = point + radiusvector;
    return_array = [];
    hits = physics_aabbbroadphasequery( aabbmin, aabbmax, playercontents, [] );
    
    for (i = 0; i < hits.size; i++) {
        if ( isplayer( hits[ i ] ) )
        {
            if ( array_contains( known_players, hits[ i ] ) )
            {
                return_array = array_add( return_array, hits[ i ] );
            }
        }
    }
    
    return return_array;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdb2b
// Size: 0x6b
function update_target_player( target_player )
{
    if ( isdefined( target_player ) )
    {
        if ( !isdefined( target_player.enemy_list ) )
        {
            target_player.enemy_list = [];
        }
        
        if ( !isdefined( self.target_enemy ) || self.target_enemy != target_player )
        {
            self notify( "changed_target" );
            remove_from_enemy_list( target_player );
        }
        
        run_combat_func( target_player );
    }
    
    self.target_enemy = target_player;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdb9e
// Size: 0x13
function trigger_choose_func_from_list( trigger, player )
{
    
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdbb9
// Size: 0x3e
function trigger_run_module_once( trigger, player )
{
    level endon( "game_ended" );
    group = run_spawn_module( trigger.target );
    trigger notify( "disable_trigger" );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdbff
// Size: 0x43
function trigger_run_spawn_module( trigger, player )
{
    level endon( "game_ended" );
    group = run_spawn_module( trigger.target );
    
    if ( isdefined( group ) )
    {
        wait_for_all_group_dead( group );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xdc4a
// Size: 0x41
function wait_for_all_group_dead( group, ntimeout, param1, param2 )
{
    if ( isdefined( ntimeout ) )
    {
        group waittill_any_timeout_1( ntimeout, "group_spawning_completed" );
        return;
    }
    
    group waittill( "group_spawning_completed" );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdc93
// Size: 0x53
function group_reset_goalradius( group, new_goalradius )
{
    if ( !isdefined( new_goalradius ) )
    {
        new_goalradius = 2048;
    }
    
    spawned_ai = group get_spawned_ai_from_group_struct();
    
    for (i = 0; i < spawned_ai.size; i++) {
        spawned_ai[ i ] set_goal_radius( new_goalradius );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdcee
// Size: 0x60
function wave_cooldown_time( timer )
{
    if ( !istrue( level.wave_cooldown_active ) )
    {
        level thread monitor_wave_cooldown( timer );
        level thread wave_cooldown_sounds( timer );
        
        if ( !istrue( self.disable_wave_hud ) )
        {
            wave_timer = gettime() + timer * 1000;
            setomnvar( "cp_wave_timer", int( wave_timer ) );
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdd56
// Size: 0x29
function monitor_wave_cooldown( timer )
{
    level endon( "game_ended" );
    level.wave_cooldown_active = 1;
    wait timer;
    level.wave_cooldown_active = undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdd87
// Size: 0x103
function wave_cooldown_sounds( timer )
{
    level endon( "game_ended" );
    level endon( "wave_starting" );
    level endon( "stop_wave_sounds" );
    
    if ( !is_wave_gametype() )
    {
        return;
    }
    
    if ( isdefined( level.wavesv_finite_max ) && level.wavesv_finite_max <= level.display_wave_num )
    {
        return;
    }
    
    timeleft = timer;
    
    while ( timeleft > 0 )
    {
        timeleft--;
        var_d5adbc626ea67b4d = scripts\cp\utility::getclocksoundaliasfortimeleft( timeleft );
        
        foreach ( player in level.players )
        {
            player playlocalsound( var_d5adbc626ea67b4d );
        }
        
        if ( timeleft == 30 || timeleft == 10 )
        {
            vo_ref = scripts\cp\utility::getoverlordaliasfortimeleft( timeleft );
            
            if ( isdefined( vo_ref ) )
            {
                level thread scripts\cp\vo::try_to_play_vo_on_team( vo_ref, "allies" );
            }
        }
        
        wait 1;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xde92
// Size: 0xad
function set_count_based_on_grouped_modules( group, unique_string, cumulative_count, return_var )
{
    if ( !isdefined( level.grouped_modules[ unique_string ] ) )
    {
        level.grouped_modules[ unique_string ] = [];
    }
    
    if ( !array_contains( level.grouped_modules[ unique_string ], group ) )
    {
        level.grouped_modules[ unique_string ][ level.grouped_modules[ unique_string ].size ] = group;
    }
    
    active = group.activecount;
    var_82e8765288a4eafb = get_active_from_grouped_modules( level.grouped_modules[ unique_string ] );
    
    if ( var_82e8765288a4eafb < cumulative_count )
    {
        return return_var;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdf47
// Size: 0x42
function get_active_from_grouped_modules( grouped_modules )
{
    count = 0;
    
    for (i = 0; i < grouped_modules.size; i++) {
        count += grouped_modules[ i ].activecount;
    }
    
    return count;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdf92
// Size: 0x2f
function define_var_if_undefined( variable, new_variable )
{
    if ( !isdefined( variable ) )
    {
        if ( isfunction( new_variable ) )
        {
            return [[ new_variable ]]();
        }
        else
        {
            return new_variable;
        }
        
        return;
    }
    
    return variable;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdfc9
// Size: 0x23
function disable_spawn_window( timer )
{
    self.spawn_window_open = undefined;
    self.last_wave_time = gettime();
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xdff4
// Size: 0xe6
function go_to_node( nodes, optional_arrived_at_node_func, var_5e38f20c9628ae25, var_686ec37f85316247 )
{
    if ( !isdefined( nodes ) || isarray( nodes ) && nodes.size < 1 )
    {
        nodes = self.spawnpoint get_next_node_array();
        
        if ( nodes.size == 0 )
        {
            self notify( "reached_path_end" );
            
            if ( isdefined( optional_arrived_at_node_func ) )
            {
                [[ optional_arrived_at_node_func ]]();
            }
            
            return;
        }
    }
    else if ( !isarray( nodes ) )
    {
        nodes = [ nodes ];
    }
    
    for (i = 0; i < nodes.size; i++) {
        if ( isvector( nodes[ i ] ) )
        {
            struct = spawnstruct();
            struct.origin = nodes[ i ];
            struct.angles = ( 0, 0, 0 );
            nodes[ i ] = struct;
        }
    }
    
    go_to_node_internal( nodes, optional_arrived_at_node_func, var_5e38f20c9628ae25, var_686ec37f85316247 );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0e2
// Size: 0x3a
function get_next_node_array()
{
    path_array = get_linkto_goals();
    
    if ( path_array.size < 1 )
    {
        if ( isdefined( self.target ) )
        {
            path_array = get_target_goals( self.target );
        }
    }
    
    return path_array;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe125
// Size: 0xc1
function get_target_goals( target )
{
    goals = getnodearray( target, "targetname" );
    new_goals = getstructarray( target, "targetname" );
    
    foreach ( new in new_goals )
    {
        goals[ goals.size ] = new;
    }
    
    new_goals = getentarray( target, "targetname" );
    
    for (i = 0; i < new_goals.size; i++) {
        new = new_goals[ i ];
        
        if ( !is_target_goal_valid( new ) )
        {
            continue;
        }
        
        goals[ goals.size ] = new;
    }
    
    return goals;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1ef
// Size: 0x5a
function get_linkto_goals()
{
    goals = [];
    
    if ( isdefined( self.script_linkto ) )
    {
        linked_ents = get_linked_ents();
        linked_structs = get_linked_structs();
        linked_nodes = get_linked_nodes();
        goals = array_combine( linked_ents, linked_structs, linked_nodes );
    }
    
    return goals;
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe252
// Size: 0x292
function go_to_node_internal( node, optional_arrived_at_node_func, var_5e38f20c9628ae25, var_686ec37f85316247 )
{
    self notify( "stop_going_to_node" );
    self endon( "stop_going_to_node" );
    self endon( "death" );
    level endon( "game_ended" );
    
    if ( !isarray( node ) )
    {
        node = [ node ];
    }
    
    thread go_to_node_end();
    var_a749ce9b52022669 = 0;
    patharrayindex = 0;
    patharray = undefined;
    
    if ( isdefined( var_686ec37f85316247 ) )
    {
        startnode = var_686ec37f85316247;
    }
    else
    {
        startnode = node[ 0 ];
    }
    
    for ( ;; )
    {
        if ( !var_a749ce9b52022669 )
        {
            node = get_least_used_from_array( node );
            self.var_a2bac30a03260051 = startnode;
            patharray = get_path_array( node, startnode );
            
            if ( patharray.size > 1 )
            {
                var_a749ce9b52022669 = 1;
            }
        }
        
        self.currentnode = node;
        
        if ( var_a749ce9b52022669 )
        {
            node = patharray[ patharray.size - 1 ];
            go_through_patharray( patharray, optional_arrived_at_node_func, var_5e38f20c9628ae25 );
            patharray = undefined;
            var_a749ce9b52022669 = 0;
        }
        else
        {
            node_fields_pre_goal( node );
            
            if ( isdefined( self.stealth ) )
            {
                scripts\stealth\callbacks::stealth_call( "go_to_node_wait", &go_to_node_set_goal, node );
            }
            else
            {
                go_to_node_set_goal( node );
                self waittill( "goal" );
            }
        }
        
        node notify( "trigger", self );
        node_fields_after_goal( node, optional_arrived_at_node_func );
        node_fields_after_goal_skit( node );
        interactionid = self function_92435c7a6ae85c3c();
        
        if ( isdefined( interactionid ) )
        {
            self waittill( "bseq_user_deleted" );
        }
        else if ( !function_8b93290be06b5b7f( node ) || istrue( node.script_onlyidle ) && self.var_e31ee88092e41cc8 )
        {
            node script_delay();
        }
        
        if ( isdefined( node.script_flag_wait ) )
        {
            flag_wait( node.script_flag_wait );
        }
        
        if ( isdefined( node.script_ent_flag_wait ) )
        {
            ent_flag_wait( node.script_ent_flag_wait );
        }
        
        node script_wait();
        node_fields_after_goal_and_wait( node, var_5e38f20c9628ae25 );
        
        if ( !isdefined( node.target ) && !isdefined( node.script_linkto ) )
        {
            break;
        }
        
        nextnode_array = node get_next_node_array();
        
        if ( !nextnode_array.size )
        {
            break;
        }
        
        if ( isdefined( self.interactionplayed ) )
        {
            self.interactionplayed = undefined;
        }
        
        node = nextnode_array;
    }
    
    self notify( "reached_path_end" );
    
    if ( isdefined( self.script_forcegoal ) )
    {
        return;
    }
    
    volume = self getgoalvolume();
    
    if ( isdefined( volume ) )
    {
        self setgoalvolumeauto( volume, volume get_cover_volume_forward() );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe4ec
// Size: 0x37, Type: bool
function function_8b93290be06b5b7f( node )
{
    if ( !isdefined( node ) )
    {
        return false;
    }
    
    if ( isdefined( node.interactionid ) )
    {
        return true;
    }
    
    if ( isdefined( node.interaction ) )
    {
        return true;
    }
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe52c
// Size: 0xbc
function get_least_used_from_array( array )
{
    if ( array.size == 1 )
    {
        return array[ 0 ];
    }
    
    array = array_randomize( array );
    least_used = array[ 0 ];
    
    if ( !isdefined( least_used.used_time ) )
    {
        least_used.used_time = 0;
    }
    
    for (i = 0; i < array.size; i++) {
        node = array[ i ];
        
        if ( !isdefined( node.used_time ) )
        {
            node.used_time = 0;
        }
        
        if ( node.used_time < least_used.used_time )
        {
            least_used = node;
        }
    }
    
    least_used.used_time = gettime();
    return least_used;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe5f1
// Size: 0xeb
function get_path_array( node, startnode )
{
    array = [];
    count = 0;
    
    while ( true )
    {
        array[ array.size ] = node;
        count++;
        
        if ( count == 16 )
        {
            break;
        }
        
        if ( go_to_node_should_stop( node ) )
        {
            break;
        }
        
        if ( !istrue( node.var_97c8a15d77788e5a ) )
        {
            if ( isdefined( node.target ) )
            {
                node.interactionid = function_5d6132045b29baf5( node.target );
            }
            
            node.var_97c8a15d77788e5a = 1;
        }
        
        if ( !isdefined( node.target ) && !isdefined( node.script_linkto ) )
        {
            break;
        }
        
        nextnode_array = node get_next_node_array();
        
        if ( !nextnode_array.size )
        {
            break;
        }
        
        node = get_least_used_from_array( nextnode_array );
        
        if ( node == startnode )
        {
            break;
        }
    }
    
    return array;
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe6e5
// Size: 0xb4
function go_through_patharray( patharray, optional_arrived_at_node_func, var_5e38f20c9628ae25 )
{
    self setgoalpath( patharray );
    
    for (i = 0; i < patharray.size; i++) {
        index = i;
        tempnode = patharray[ i ];
        self.currentnode = tempnode;
        node_fields_pre_goal( tempnode );
        patharrayindex = waittill_subgoal();
        
        if ( index == patharray.size - 1 )
        {
            self waittill( "goal" );
            break;
        }
        
        tempnode notify( "trigger", self );
        function_b8caa11a38862f1c( tempnode, optional_arrived_at_node_func );
        node_fields_after_goal_skit( tempnode );
        node_fields_after_goal_and_wait( tempnode, var_5e38f20c9628ae25 );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe7a1
// Size: 0x2b4
function node_fields_pre_goal( node )
{
    if ( isdefined( node.script_goalradius ) )
    {
        set_goal_radius( node.script_goalradius );
    }
    else if ( isdefined( node.radius ) )
    {
        set_goal_radius( node.radius );
    }
    else if ( isdefined( node.script_radius ) )
    {
        self.script_radius = node.script_radius;
        set_goal_radius( node.script_radius );
    }
    
    if ( isdefined( node.script_goalheight ) )
    {
        self.goalheight = node.script_goalheight;
    }
    else if ( isdefined( node.height ) )
    {
        self.goalheight = node.height;
    }
    
    if ( isdefined( node.script_demeanor ) )
    {
        set_demeanor_from_unittype( node.script_demeanor );
    }
    
    if ( istrue( node.script_pacifist ) || isdefined( node.spawnflags ) && node.spawnflags & 256 )
    {
        self.pacifist = 1;
    }
    
    if ( isdefined( node.script_ignoreall ) )
    {
        self.ignoreall = node.script_ignoreall;
    }
    
    if ( isdefined( node.script_ignoreme ) )
    {
        self.ignoreme = node.script_ignoreme;
    }
    
    if ( isdefined( node.script_flag_wait ) && !flag_exist( node.script_flag_wait ) )
    {
        flag_init( node.script_flag_wait );
    }
    
    if ( isdefined( node.script_flag_set ) && !flag_exist( node.script_flag_set ) )
    {
        flag_init( node.script_flag_set );
    }
    
    if ( isdefined( node.script_flag ) && !flag_exist( node.script_flag ) )
    {
        flag_init( node.script_flag );
    }
    
    if ( isdefined( node.script_deathflag ) )
    {
        if ( !flag_exist( node.script_deathflag ) )
        {
            flag_init( node.script_deathflag );
        }
        
        delay = 5;
        
        if ( isdefined( node.var_3de4f31275c86745 ) )
        {
            delay = node.var_3de4f31275c86745;
        }
        
        thread thread_on_notify_no_endon_death( "death", &flag_set_delayed, node.script_deathflag, delay );
    }
    
    if ( isdefined( node.script_speed ) )
    {
        set_movement_speed( node.script_speed );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xea5d
// Size: 0x1e
function function_b8caa11a38862f1c( node, optional_arrived_at_node_func )
{
    node_fields_after_goal( node, optional_arrived_at_node_func, 1 );
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xea83
// Size: 0xfa
function node_fields_after_goal( node, optional_arrived_at_node_func, var_8c99244d1e6128b0 )
{
    if ( isdefined( self.stealth ) )
    {
        scripts\stealth\callbacks::stealth_call( "go_to_node_arrive", &go_to_node_set_goal, node );
    }
    
    if ( !istrue( var_8c99244d1e6128b0 ) )
    {
        if ( isdefined( node.target ) && ( isdefined( node.interactionid ) || isdefined( node.interaction ) ) )
        {
            scripts\common\ai::function_8cb35add373dee8a( &go_to_node_set_goal, node );
        }
        else
        {
            go_to_node_set_goal();
            self waittill( "goal" );
        }
    }
    
    if ( isdefined( optional_arrived_at_node_func ) )
    {
        [[ optional_arrived_at_node_func ]]( node );
    }
    
    if ( isdefined( node.script_flag_set ) )
    {
        flag_set( node.script_flag_set );
    }
    
    if ( isdefined( node.script_ent_flag_set ) )
    {
        ent_flag_set( node.script_ent_flag_set );
    }
    
    if ( isdefined( node.script_flag_clear ) )
    {
        flag_clear( node.script_flag_clear );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb85
// Size: 0x123
function node_fields_after_goal_skit( node )
{
    level endon( "game_ended" );
    self endon( "death" );
    
    if ( !istrue( level.global_stealth_broken ) && !istrue( self.entered_combat ) && isdefined( node.script_animation_type ) )
    {
        var_dd1921916c4e99c7 = undefined;
        var_4b7479ae0df07570 = strtok( node.script_animation_type, "," );
        var_dd1921916c4e99c7 = random( var_4b7479ae0df07570 );
        
        if ( isdefined( var_dd1921916c4e99c7 ) )
        {
            if ( !istrue( node.script_looping ) )
            {
                self.single_loop = 1;
            }
            else
            {
                self.single_loop = undefined;
            }
            
            /#
                print3d( self.origin + ( 0, 0, 64 ), "<dev string:x3d5>" + node.script_animation_type, ( 1, 1, 0 ), 1, 0.5, 60, 1 );
            #/
            
            self.playing_skit = 1;
            play_skit_and_watch_for_endons( node, var_dd1921916c4e99c7 );
            self.playing_skit = undefined;
            
            while ( istrue( self.playing_skit ) )
            {
                wait 0.05;
            }
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xecb0
// Size: 0x78
function play_skit_and_watch_for_endons( node, var_dd1921916c4e99c7 )
{
    self endon( "death" );
    
    if ( istrue( self.single_loop ) )
    {
        self endon( "patrol_" + var_dd1921916c4e99c7 + "_loop" );
    }
    
    set_goal_pos( node.origin );
    self thread [[ level.spawn_skits[ var_dd1921916c4e99c7 ].skit_func ]]();
    
    while ( istrue( self.playing_skit ) )
    {
        wait 0.05;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed30
// Size: 0x17d
function node_fields_after_goal_and_wait( node, var_5e38f20c9628ae25 )
{
    if ( isdefined( self.stealth ) )
    {
        scripts\stealth\callbacks::stealth_call( "go_to_node_post_wait", &go_to_node_set_goal, node );
    }
    
    if ( isdefined( node.script_soundalias ) )
    {
        if ( soundexists( node.script_soundalias ) )
        {
            self playsound( node.script_soundalias );
        }
    }
    
    if ( isdefined( node.script_forcegoal ) )
    {
        set_goal_radius( node.script_forcegoal );
    }
    
    if ( isdefined( self.post_wait_func ) )
    {
        [[ self.post_wait_func ]]();
    }
    
    if ( isdefined( node.script_delay_post ) )
    {
        wait node.script_delay_post;
    }
    
    while ( isdefined( node.script_requires_player ) )
    {
        node.script_requires_player = 0;
        
        if ( go_to_node_wait_for_player( node, &get_next_node_array ) )
        {
            node.script_requires_player = 1;
            node notify( "script_requires_player" );
            break;
        }
        
        wait 0.25;
    }
    
    if ( isdefined( node.script_demeanor_post ) )
    {
        set_demeanor_from_unittype( node.script_demeanor_post );
    }
    
    if ( isdefined( var_5e38f20c9628ae25 ) )
    {
        [[ var_5e38f20c9628ae25 ]]( node );
    }
    
    if ( isdefined( node.script_death ) && node.script_death )
    {
        script_kill_ai();
    }
    
    if ( isdefined( node.script_delete ) && node.script_delete )
    {
        self delete();
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeeb5
// Size: 0x219
function go_to_node_wait_for_player( node, get_target_func )
{
    for (i = 0; i < level.players.size; i++) {
        player = level.players[ i ];
        
        if ( distancesquared( player.origin, node.origin ) < distancesquared( self.origin, node.origin ) )
        {
            return 1;
        }
        
        if ( !isdefined( node.script_dist_only ) )
        {
            vec = anglestoforward( self.angles );
            
            if ( isdefined( node.target ) )
            {
                temp = node [[ get_target_func ]]( node.target );
                
                if ( temp.size == 1 )
                {
                    vec = vectornormalize( temp[ 0 ].origin - node.origin );
                }
                else if ( isdefined( node.angles ) )
                {
                    vec = anglestoforward( node.angles );
                }
            }
            else if ( isdefined( node.angles ) )
            {
                vec = anglestoforward( node.angles );
            }
            
            vec2 = [];
            vec2[ vec2.size ] = vectornormalize( player.origin - self.origin );
            
            foreach ( value in vec2 )
            {
                if ( vectordot( vec, value ) > 0 )
                {
                    return 1;
                }
            }
        }
        
        dist = 300;
        
        if ( node.script_requires_player > dist )
        {
            dist = node.script_requires_player;
        }
        
        if ( distancesquared( player.origin, self.origin ) < squared( dist ) )
        {
            return 1;
        }
        
        return 0;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf0d6
// Size: 0x1d
function waittill_subgoal()
{
    self endon( "goal" );
    self waittill( "subgoal", index );
    return index;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf0fc
// Size: 0x122, Type: bool
function go_to_node_should_stop( arrivaltarget )
{
    if ( !isdefined( arrivaltarget ) )
    {
        return true;
    }
    
    if ( !isdefined( arrivaltarget.target ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_delay ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_delay_min ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_delay_max ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_wait ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_wait_add ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_wait_min ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_wait_max ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_flag_wait ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_ent_flag_wait ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_delay_post ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_requires_player ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_idle ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.script_stopnode ) )
    {
        return true;
    }
    
    if ( isdefined( arrivaltarget.interaction ) )
    {
        return true;
    }
    
    return false;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf227
// Size: 0x26
function get_cover_volume_forward()
{
    if ( isdefined( self.goalvolumecoveryaw ) )
    {
        return anglestoforward( ( 0, self.goalvolumecoveryaw, 0 ) );
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf255
// Size: 0x6a
function go_to_node_set_goal( ent )
{
    if ( isnode( ent ) )
    {
        go_to_node_set_goal_node( ent );
    }
    else if ( isstruct( ent ) )
    {
        go_to_node_set_goal_pos( ent );
    }
    else if ( isent( ent ) )
    {
        go_to_node_set_goal_ent( ent );
    }
    
    if ( isstruct( ent ) || isnode( ent ) )
    {
        ent.patrol_stop = go_to_node_should_stop( ent );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf2c7
// Size: 0x3f
function go_to_node_set_goal_ent( ent )
{
    if ( ent.code_classname == "info_volume" )
    {
        self setgoalvolumeauto( ent, ent get_cover_volume_forward() );
        self notify( "go_to_node_new_goal" );
        return;
    }
    
    go_to_node_set_goal_pos( ent );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf30e
// Size: 0x1b
function go_to_node_set_goal_pos( ent )
{
    set_goal_ent( ent );
    self notify( "go_to_node_new_goal" );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf331
// Size: 0x47
function enter_combat_after_go_to_node( spawnpoint )
{
    level endon( "game_ended" );
    self endon( "death" );
    spawnpoint script_wait();
    thread scripts\cp\nvg_ai::function_de97882d0a7e1bef();
    go_to_node( self.spawnpoint get_next_node_array() );
    thread enter_combat();
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf380
// Size: 0x51
function set_goal_ent( target )
{
    set_goal_pos( target.origin );
    self.last_set_goalent = target;
    
    if ( isstruct( target ) && !isdefined( target.type ) )
    {
        target.type = "struct";
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf3d9
// Size: 0x5a
function set_goal_pos( origin )
{
    if ( istrue( self.fixednode ) )
    {
        return;
    }
    
    if ( istrue( self.var_1bd24c17aee24dce ) )
    {
        return;
    }
    
    self.last_set_goalnode = undefined;
    self.last_set_goalpos = origin;
    self.last_set_goalent = undefined;
    self setgoalpos( getclosestpointonnavmesh( origin ) );
    self notify( "new_goal_pos" );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf43b
// Size: 0x1b
function go_to_node_set_goal_node( node )
{
    set_goal_node( node );
    self notify( "go_to_node_new_goal" );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf45e
// Size: 0x31
function set_goal_node( node )
{
    self.last_set_goalnode = node;
    self.last_set_goalpos = undefined;
    self.last_set_goalent = undefined;
    self setgoalnode( node );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf497
// Size: 0x6b
function go_to_node_end()
{
    self notify( "go_to_node_end" );
    self endon( "go_to_node_end" );
    self endon( "death" );
    level endon( "game_ended" );
    self.using_goto_node = 1;
    result = waittill_any_return_2( "reached_path_end", "stop_going_to_node" );
    self.using_goto_node = undefined;
    self.patharray = undefined;
    self.patharrayindex = undefined;
    thread function_480f99299b4cbc38();
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf50a
// Size: 0xa9
function function_480f99299b4cbc38()
{
    self endon( "death" );
    
    if ( isdefined( self.currentnode ) && isdefined( self.currentnode.interactionid ) && isdefined( self.currentnode.interaction ) )
    {
        if ( isdefined( self function_92435c7a6ae85c3c() ) )
        {
            self waittill( "bseq_user_deleted" );
        }
        
        if ( isdefined( self.currentnode ) && isdefined( self.currentnode.interactionid ) )
        {
            despawninteraction( self.currentnode.interactionid );
            self.currentnode.interactionid = undefined;
        }
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf5bb
// Size: 0x5d, Type: bool
function is_target_goal_valid( object )
{
    if ( isspawner( object ) )
    {
        return false;
    }
    
    switch ( object.code_classname )
    {
        case #"hash_1b79c5d9e0f9886a":
        case #"hash_5e0756fcd4e0adcd":
        case #"hash_8040aa10d9cac1e8":
        case #"hash_81903cb95a447b8c":
            return false;
    }
    
    return true;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf621
// Size: 0x55
function set_goal_radius( goal_radius )
{
    if ( istrue( self.var_42dd56e19557f95a ) )
    {
        return;
    }
    
    if ( !isdefined( goal_radius ) )
    {
        goal_radius = 2048;
    }
    
    goal_radius = getdvarint( @"hash_321cacfb0dba94e2", goal_radius );
    self.last_goalradius = self.goalradius;
    self.goalradius = int( goal_radius );
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf67e
// Size: 0x1f
function return_to_last_goalradius()
{
    if ( isdefined( self.last_goalradius ) )
    {
        set_goal_radius( self.last_goalradius );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf6a5
// Size: 0x2b
function set_goal_pos_check_for_offset( origin )
{
    if ( isdefined( self.script_origin_other ) )
    {
        origin = self.script_origin_other;
    }
    
    set_goal_pos( origin );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf6d8
// Size: 0x1b
function module_set_goal_radius( module_struct, goal_radius )
{
    set_goal_radius( goal_radius );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf6fb
// Size: 0x1d
function module_set_goal_height( module_struct, goalheight )
{
    self.goalheight = goalheight;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf720
// Size: 0x15
function set_script_origin_other_on_ai( origin )
{
    self.script_origin_other = origin;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf73d
// Size: 0x15
function clear_script_origin_other_on_ai( origin )
{
    self.script_origin_other = undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf75a
// Size: 0x397
function modular_spawning_debug_init()
{
    delay_start_specified_module();
    setdvar( @"hash_b3b5329386b31bfc", 0 );
    setdvarifuninitialized( @"hash_76ec06326708e615", 0 );
    setdvarifuninitialized( @"hash_9758cec587280b4a", 0 );
    setdvarifuninitialized( @"hash_9bcca58e56e4c178", 0 );
    setdvarifuninitialized( @"hash_67846a0d7aa3030a", 0 );
    setdvarifuninitialized( @"hash_3ed315459bea5889", "" );
    setdvarifuninitialized( @"hash_8cc57893708670ea", 0 );
    setdvarifuninitialized( @"hash_d056b8028ae7261e", 0 );
    setdvarifuninitialized( @"hash_35dec012c752370d", 0 );
    setdvarifuninitialized( @"hash_9e9513e7705385bd", 0 );
    setdvarifuninitialized( @"hash_b7f5396996295942", 0 );
    setdvarifuninitialized( @"hash_628de91efb80cf77", 0 );
    setdvarifuninitialized( @"hash_3d7b446d7722d59f", -1 );
    setdvarifuninitialized( @"hash_41847a5466c0369b", -1 );
    setdvarifuninitialized( @"hash_d01a3f44be125516", -1 );
    setdvarifuninitialized( @"hash_dd0ff23757667151", -1 );
    setdvarifuninitialized( @"hash_a70fa5936c87d3ff", -1 );
    setdvarifuninitialized( @"hash_348079ac80b6fbf5", "" );
    setdvarifuninitialized( @"hash_6e280cadce9d4064", 0 );
    setdvarifuninitialized( @"hash_4f27a8ab9bae330a", 0 );
    setdvarifuninitialized( @"hash_1c1590adaf373606", 1 );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Show Agent Stats:1 / Disable:0\" \"togglep scr_show_agent_stats 0\" \n";
    addentrytodevgui( cmd );
    
    for (i = 4; i < 4 + get_max_agent_count(); i++) {
        cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Show Agent Stats:1 / e" + i + ":" + i + "\" \"togglep scr_show_agent_stats " + i + "\" \n";
        addentrytodevgui( cmd );
    }
    
    cmd = "devgui_cmd \"CP Debug:2 / Debug / Print Dialogue Aliases\" \"togglep scr_print_dialogue_alias 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Print Spawner Disables:2\" \"togglep scr_print_spawner_disables 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Show Cleanup Stats:2\" \"togglep scr_show_kill_off_stats 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Pause Spawning:0\" \"togglep scr_pause_spawning 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Print Spec Info\" \"togglep scr_show_spawn_spec_info 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Toggle Ambient Spawning\" \"togglep scr_always_on_always 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Disable badpath cleanup:3\" \"togglep scr_disable_bad_path_cleanup 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Show Teleport Reasons:3\" \"togglep scr_show_teleport_reason 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Use Wave Spawning\" \"togglep scr_wave_spawning 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Init Nodes As Spawners\" \"togglep scr_init_cover_node_spawners 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Use Cover Node Spawning\" \"togglep scr_cover_node_spawning 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Only Use Passive Spawning\" \"togglep scr_only_passive_spawning 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / AI Outline Debug:4\" \"togglep scr_ai_outline_debug 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Cleanup Vehicles:4\" \"set scr_debug_spawning cleanup_vehicles\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Stop All Groups:4\" \"set scr_debug_spawning stop_all_groups\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / whyAmINotShooting\" \"togglep ai_whyaminotshooting 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / whyAmINotMoving\" \"togglep ai_whyaminotmoving 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / Stealth / Debug\" \"togglep debug_stealth 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / Stealth / Chat\" \"togglep debug_stealth_chat 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / Stealth / fov\" \"togglep debug_stealth_fov 0 1\" \n";
    addentrytodevgui( cmd );
    level.spawnpoint_debug = 0;
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Spawnpoint Debug / Toggle:4\" \"set scr_debug_spawning spawnpoint_debug\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Show Spawnpoint Selection\" \"togglep scr_show_spawn_selection 0 1\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Spawnpoint Debug / Add Proxy Player At Loc:4\" \"set scr_debug_spawning proxy_add_player\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Spawnpoint Debug / Delete All Proxy Players:4\" \"set scr_debug_spawning proxy_delete_all\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Spawnpoint Debug / Delete Selected Proxy Player:4\" \"set scr_debug_spawning proxy_delete_selected\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning / Show Active Spawn Modules\" \"set scr_debug_spawning show_active_spawn_modules\" \n";
    addentrytodevgui( cmd );
    cmd = "devgui_cmd \"CP Debug:2 / CP Module Spawning:3 / Convert Nodes To Spawners\" \"set scr_debug_spawning convert_nodes\" \n";
    addentrytodevgui( cmd );
    
    /#
        level thread debug_activation( @"hash_d2e6ec97acd89e26", &function_d57824acdf37e763 );
        level thread function_d3a46ebba0eb3257( @"hash_b3b5329386b31bfc", &function_11c4a16bf89cbd9a );
    #/
}

/#

    // Namespace spawning / scripts\cp\spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xfaf9
    // Size: 0xc4, Type: dev
    function function_11c4a16bf89cbd9a( itemref )
    {
        items = strtok( itemref, "<dev string:x3dc>" );
        playertoks = strtok( itemref, "<dev string:x3de>" );
        params = strtok( itemref, "<dev string:x3e0>" );
        player = undefined;
        
        if ( playertoks.size > 1 )
        {
            playerint = int( playertoks[ 0 ] );
            player = level.players[ playerint ];
        }
        
        if ( int( items[ 0 ] ) > 0 )
        {
            level thread function_3db09d3af7506ceb( items[ 0 ] );
            return;
        }
        
        if ( isdefined( level.var_a4ee6dcdb3823dc8 ) )
        {
            level.var_a4ee6dcdb3823dc8 hudoutlinedisable();
        }
        
        level notify( "<dev string:x3e2>" );
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xfbc5
    // Size: 0x6a0, Type: dev
    function function_3db09d3af7506ceb( ent_ref )
    {
        level notify( "<dev string:x3e2>" );
        level endon( "<dev string:x3e2>" );
        level endon( "<dev string:x3f3>" );
        
        if ( isdefined( level.var_a4ee6dcdb3823dc8 ) )
        {
            level.var_a4ee6dcdb3823dc8 hudoutlinedisable();
        }
        
        while ( true )
        {
            ent = getentbynum( int( ent_ref ) );
            
            if ( isdefined( ent ) && isalive( ent ) )
            {
                level.var_a4ee6dcdb3823dc8 = ent;
                level.var_a4ee6dcdb3823dc8 hudoutlineenable( "<dev string:x3fe>" );
                center = 750;
                v_spacing = 150;
                msg = "<dev string:x414>" + ent_ref;
                
                if ( isdefined( ent.unittype ) )
                {
                    center = 700;
                    msg = msg + "<dev string:x3a1>" + ent.unittype;
                }
                
                if ( isdefined( ent.enemy_group ) )
                {
                    center = 650;
                    msg = msg + "<dev string:x3a1>" + ent.enemy_group;
                }
                
                if ( isdefined( ent.demeanoroverride ) )
                {
                    center = 600;
                    msg = msg + "<dev string:x3a1>" + ent.demeanoroverride;
                }
                else if ( isdefined( ent._blackboard ) && isdefined( ent._blackboard.civstate ) )
                {
                    center = 600;
                    msg = msg + "<dev string:x3a1>" + ent._blackboard.civstate;
                }
                
                if ( isdefined( ent.health ) )
                {
                    center = 525;
                    msg = msg + "<dev string:x3a1>" + ent.health;
                    
                    if ( isdefined( ent.maxhealth ) )
                    {
                        msg = msg + "<dev string:x2c5>" + ent.maxhealth;
                    }
                }
                
                printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                v_spacing += 25;
                
                if ( isdefined( ent.goalpos ) )
                {
                    level thread draw_line_for_time( ent.goalpos, ent.goalpos + ( 0, 0, 512 ), 0, 1, 0, 0.05 );
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x422>" + ent.goalpos;
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( isdefined( ent.spawnpoint ) )
                {
                    level thread draw_line_for_time( ent.spawnpoint.origin, ent.spawnpoint.origin + ( 0, 0, 512 ), 0, 0, 1, 0.05 );
                }
                
                if ( ent scripts\anim\utility_common::recentlysawenemy() )
                {
                    msg = "<dev string:x42e>";
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                else
                {
                    msg = "<dev string:x443>";
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( isdefined( ent.goalradius ) )
                {
                    if ( isdefined( ent.goalheight ) )
                    {
                        msg = "<dev string:x420>" + ent_ref + "<dev string:x458>" + ent.goalheight;
                        printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                        v_spacing += 25;
                        half = ent.goalheight / 2;
                        level thread draw_circle( ent.origin + ( 0, 0, half ), ent.goalradius, ( 0, 1, 0 ), 1, 0, 1 );
                        level thread draw_circle( ent.origin - ( 0, 0, half ), ent.goalradius, ( 1, 0, 0 ), 1, 0, 1 );
                    }
                    else
                    {
                        level thread draw_circle( ent.origin, ent.goalradius, ( 0, 1, 0 ), 1, 0, 1 );
                    }
                    
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x467>" + ent.goalradius;
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( istrue( ent.ignoreall ) )
                {
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x476>" + ent.ignoreall;
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( istrue( ent.ignoreme ) )
                {
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x484>" + ent.ignoreme;
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( isdefined( ent.target ) )
                {
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x491>" + ent.target;
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( isdefined( ent.targetname ) )
                {
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x49c>" + ent.targetname;
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( istrue( ent.pacifist ) )
                {
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x4ab>" + ent.pacifist;
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( istrue( ent is_patroller() ) )
                {
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x4b8>";
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
                
                if ( isdefined( ent.var_79ac1e927ea0b01e ) )
                {
                    msg = "<dev string:x420>" + ent_ref + "<dev string:x4ce>" + ent.var_79ac1e927ea0b01e;
                    printtoscreen2d( center, v_spacing, msg, ( 1, 1, 1 ), 2 );
                    v_spacing += 25;
                }
            }
            else
            {
                v_spacing = 150;
                msg = "<dev string:x414>" + ent_ref + "<dev string:x4e7>";
                printtoscreen2d( 750, v_spacing, msg, ( 1, 1, 1 ), 2 );
                v_spacing += 25;
                
                if ( isdefined( level.var_a4ee6dcdb3823dc8 ) )
                {
                    level.var_a4ee6dcdb3823dc8 hudoutlinedisable();
                }
            }
            
            waitframe();
        }
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1026d
    // Size: 0x394, Type: dev
    function function_d57824acdf37e763( itemref )
    {
        flag_wait( "<dev string:x4f0>" );
        items = strtok( itemref, "<dev string:x3dc>" );
        playertoks = strtok( itemref, "<dev string:x3de>" );
        params = strtok( itemref, "<dev string:x3e0>" );
        player = undefined;
        
        if ( playertoks.size > 1 )
        {
            playerint = int( playertoks[ 0 ] );
            player = level.players[ playerint ];
        }
        
        switch ( items[ 0 ] )
        {
            case #"hash_2f0df464ce79b158":
                level.players[ 0 ] thread scripts\cp\drone\scout_drone::deploy_scout_drone( level.players[ 0 ] );
                break;
            case #"hash_d8d450431ea1c53b":
                switch ( items[ 1 ] )
                {
                    case #"hash_c61546c10a51754":
                        function_4162fdd181359f0b();
                        break;
                    case #"hash_897c0184865c23aa":
                        switch ( items[ 2 ] )
                        {
                            case #"hash_1e6848c3005d68d4":
                                for (i = 0; i < level.players.size; i++) {
                                    if ( isdefined( level.players[ i ].var_76c9881d12ce4d41 ) )
                                    {
                                        level.players[ i ].var_76c9881d12ce4d41 function_dc58b610c20332ab();
                                    }
                                }
                                
                                break;
                            case #"hash_c482c6c109150a4":
                            default:
                                var_623cf0cd1551bd05 = level.var_d9821974c80a684a;
                                
                                for (i = 0; i < var_623cf0cd1551bd05.size; i++) {
                                    var_623cf0cd1551bd05[ i ] function_dc58b610c20332ab();
                                }
                                
                                break;
                        }
                        
                        break;
                }
                
                break;
            case #"hash_1cc2ba0282c0c6ee":
                if ( !level.spawnpoint_debug )
                {
                    pause_all_other_groups( "<dev string:x534>" );
                    kill_off_enemies( undefined, 100, 1 );
                    level thread function_f8d1a6915a832f68();
                }
                else
                {
                    unpause_all_other_groups( "<dev string:x534>" );
                    level notify( "<dev string:x53c>" );
                }
                
                level.spawnpoint_debug = !level.spawnpoint_debug;
                break;
            case #"hash_23d3b48a2fabf145":
                if ( isdefined( items[ 1 ] ) && items[ 1 ] == "<dev string:x556>" )
                {
                    stop_module_by_groupname( params[ 1 ] );
                }
                else
                {
                    stop_all_groups();
                }
                
                break;
            case #"hash_afeffb83784fa493":
                if ( isdefined( level.active_spawn_module_structs ) && level.active_spawn_module_structs.size > 0 )
                {
                    keys = getarraykeys( level.active_spawn_module_structs );
                    
                    for (i = 0; i < keys.size; i++) {
                        key = keys[ i ];
                        module = level.active_spawn_module_structs[ key ];
                        
                        for (j = 0; j < module.size; j++) {
                            if ( isdefined( module[ j ].module_vehicles ) )
                            {
                                for (k = 0; k < module[ j ].module_vehicles.size; k++) {
                                    module[ j ].module_vehicles[ k ] delete();
                                }
                            }
                        }
                    }
                }
                
                break;
            case #"hash_ca51c18a00a0a89c":
                if ( !level.show_active_modules )
                {
                    level thread print_active_modules_to_screen();
                }
                else
                {
                    level notify( "<dev string:x56a>" );
                }
                
                break;
            case #"hash_819aac6f5ae2fb78":
                run_spawn_module( params[ 1 ] );
                break;
        }
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10609
    // Size: 0x62, Type: dev
    function function_dc58b610c20332ab()
    {
        self delete();
        level.var_d9821974c80a684a = array_removeundefined( level.var_d9821974c80a684a );
        level.spawn_scoring_array = level.var_d9821974c80a684a;
        
        if ( level.var_d9821974c80a684a.size < 1 )
        {
            level.var_d9821974c80a684a = undefined;
            level.spawn_scoring_array = undefined;
            level notify( "<dev string:x58f>" );
        }
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10673
    // Size: 0xc8, Type: dev
    function function_4162fdd181359f0b()
    {
        level endon( "<dev string:x58f>" );
        
        if ( !isdefined( level.var_d9821974c80a684a ) )
        {
            level.var_d9821974c80a684a = [];
        }
        
        proxy = spawn( "<dev string:x5a7>", level.players[ 0 ].origin );
        proxy setmodel( level.players[ 0 ].model );
        proxy.angles = level.players[ 0 ].angles;
        proxy hudoutlineenable( "<dev string:x3fe>" );
        proxy thread function_9d73466f225c814e( proxy );
        level.var_d9821974c80a684a[ level.var_d9821974c80a684a.size ] = proxy;
        level.spawn_scoring_array = level.var_d9821974c80a684a;
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x10743
    // Size: 0x98, Type: dev
    function function_9d73466f225c814e( usable_ent )
    {
        usable_ent endon( "<dev string:x5b4>" );
        level endon( "<dev string:x58f>" );
        usable_ent.use_func = &function_95226d233e6b6288;
        usable_ent makeusable();
        usable_ent sethinttag( "<dev string:x5ba>" );
        usable_ent setuseprioritymax();
        usable_ent setcursorhint( "<dev string:x5c1>" );
        usable_ent sethintdisplayrange( 148 );
        usable_ent sethintdisplayfov( 90 );
        usable_ent setuserange( 72 );
        usable_ent setusefov( 45 );
        usable_ent sethintonobstruction( "<dev string:x565>" );
        usable_ent setuseholdduration( "<dev string:x5cd>" );
        usable_ent thread function_c018c31154e6fb57();
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x107e3
    // Size: 0x50, Type: dev
    function function_c018c31154e6fb57()
    {
        self endon( "<dev string:x5b4>" );
        
        while ( true )
        {
            self waittill( "<dev string:x5db>", player );
            
            if ( !player is_valid_player() )
            {
                continue;
            }
            
            if ( isdefined( self.use_func ) )
            {
                self thread [[ self.use_func ]]( player );
            }
        }
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1083b
    // Size: 0xc3, Type: dev
    function function_95226d233e6b6288( player )
    {
        self notify( "<dev string:x5e3>" );
        self endon( "<dev string:x5e3>" );
        level endon( "<dev string:x58f>" );
        self endon( "<dev string:x5b4>" );
        self endon( "<dev string:x5db>" );
        self.use_func = &function_2645c338eab1bc53;
        player.var_76c9881d12ce4d41 = self;
        
        while ( true )
        {
            angles = player getplayerangles();
            forward = anglestoforward( angles ) * 64;
            new_pos = drop_to_ground( player.origin + forward, 100, -1000 );
            self.angles = player.angles;
            self dontinterpolate();
            self.origin = new_pos;
            waitframe();
        }
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x10906
    // Size: 0x2f, Type: dev
    function function_2645c338eab1bc53( player )
    {
        self notify( "<dev string:x5e3>" );
        player.var_76c9881d12ce4d41 = undefined;
        self.use_func = &function_95226d233e6b6288;
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1093d
    // Size: 0x13e, Type: dev
    function function_f8d1a6915a832f68()
    {
        level notify( "<dev string:x608>" );
        level endon( "<dev string:x608>" );
        level endon( "<dev string:x53c>" );
        level.spawner_models = [];
        level.var_2e35b31b262b1d57 = 0;
        level childthread function_a3b3d7a7305978f3();
        
        while ( true )
        {
            level notify( "<dev string:x61d>" );
            keys = getarraykeys( level.active_spawn_module_structs );
            spawnpoints = [];
            
            for (i = 0; i < level.active_spawn_module_structs.size; i++) {
                module = level.active_spawn_module_structs[ keys[ i ] ];
                
                if ( isarray( module ) )
                {
                    for (j = 0; j < module.size; j++) {
                        group = module[ j ];
                        spawnpoints = array_combine( spawnpoints, group get_module_spawn_points() );
                    }
                    
                    continue;
                }
                
                spawnpoints = array_combine( spawnpoints, module get_module_spawn_points() );
            }
            
            if ( spawnpoints.size > 0 )
            {
                spawnpoints = array_remove_duplicates( spawnpoints );
                struct = level.players[ 0 ] scripts\cp\spawner_scoring::score_ai_spawns( spawnpoints );
                level.players[ 0 ].position_ref = undefined;
            }
            
            wait 1;
        }
    }

    // Namespace spawning / scripts\cp\spawning
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10a83
    // Size: 0x190, Type: dev
    function function_a3b3d7a7305978f3()
    {
        for ( ;; )
        {
            for (i = 0; i < level.spawner_models.size; i++) {
                if ( isdefined( level.spawner_models[ i ].spawnpoint ) && isdefined( level.spawner_models[ i ].spawnpoint.totalscore ) )
                {
                    spawn_scoring_type = level.spawner_models[ i ].spawnpoint scripts\cp\spawner_scoring::get_spawn_scoring_type();
                    
                    if ( level.spawner_models[ i ].spawnpoint.totalscore >= 950 )
                    {
                        scripts\cp\cp_outline::enable_outline_for_players( level.spawner_models[ i ], level.players, "<dev string:x3fe>" );
                        continue;
                    }
                    
                    if ( level.spawner_models[ i ].spawnpoint.totalscore >= 800 )
                    {
                        scripts\cp\cp_outline::enable_outline_for_players( level.spawner_models[ i ], level.players, "<dev string:x637>" );
                        continue;
                    }
                    
                    if ( level.spawner_models[ i ].spawnpoint.totalscore >= 500 )
                    {
                        scripts\cp\cp_outline::enable_outline_for_players( level.spawner_models[ i ], level.players, "<dev string:x5d>" );
                        continue;
                    }
                    
                    scripts\cp\cp_outline::enable_outline_for_players( level.spawner_models[ i ], level.players, "<dev string:x64c>" );
                }
            }
            
            wait 1;
        }
    }

#/

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10c1b
// Size: 0x34a
function print_active_modules_to_screen()
{
    level notify( "print_active_modules_to_screen" );
    level endon( "print_active_modules_to_screen" );
    level.show_active_modules = !level.show_active_modules;
    
    if ( !level.show_active_modules )
    {
        if ( isdefined( level.menu_background ) )
        {
            level.menu_background destroy();
        }
        
        return;
    }
    
    create_background();
    
    while ( true )
    {
        v_spacing = 150;
        max_string = "                                                                           ";
        sur_msg = "|Active| Min  | Max  |Deaths| Total";
        msg = "Active Modules| Spawn Count: " + level.spawned_ai.size + "/" + get_max_agent_count();
        msg = msg + getsubstr( max_string, 0, max_string.size - msg.size + sur_msg.size ) + sur_msg;
        
        /#
            printtoscreen2d( 100, v_spacing, msg, ( 1, 1, 1 ), 1.25 );
        #/
        
        v_spacing += 15;
        var_162e534872ea0677 = "       ";
        var_3f436db8d4b31c3f = getsubstr( max_string, 0, max_string.size - var_162e534872ea0677.size * 5 - 4 );
        
        if ( isdefined( level.spawn_module_structs_memory ) && level.spawn_module_structs_memory.size > 0 )
        {
            keys = getarraykeys( level.spawn_module_structs_memory );
            
            for (i = 0; i < keys.size; i++) {
                key = keys[ i ];
                module = level.spawn_module_structs_memory[ key ];
                
                for (j = 0; j < module.size; j++) {
                    group = module[ j ];
                    
                    if ( key == "wave_spawning" )
                    {
                        search_term = group scripts\cp\cp_wave_spawning::get_current_wave_ref();
                        key = "wave: " + search_term;
                    }
                    
                    data = group get_module_debug_data();
                    
                    if ( isdefined( level.active_spawn_module_structs ) && group is_group_active() )
                    {
                        color = ( 1, 1, 1 );
                    }
                    else
                    {
                        color = ( 1, 1, 0 );
                    }
                    
                    active = add_space_to_string( "| A:" + group get_activecount_from_group( 1 ), var_162e534872ea0677 );
                    min = add_space_to_string( "| m:" + data.min_size, var_162e534872ea0677 );
                    max = add_space_to_string( "| M:" + data.max_size, var_162e534872ea0677 );
                    total = add_space_to_string( "| T:" + data.totalspawns, var_162e534872ea0677 );
                    deaths = add_space_to_string( "| D:" + group.currentmodulekills, var_162e534872ea0677 );
                    msg = add_space_to_string( data.status + "|" + key, var_3f436db8d4b31c3f ) + "[" + j + "] " + active + min + max + deaths + total;
                    
                    /#
                        printtoscreen2d( 100, v_spacing, msg, color, 1.25 );
                    #/
                    
                    v_spacing += 15;
                }
            }
        }
        
        waitframe();
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f6d
// Size: 0x7a
function create_background()
{
    level.menu_background = create_hudelem();
    level.menu_background setshader( "black", 350, 110 );
    level.menu_background.color = ( 0.2, 0.2, 0.2 );
    level.menu_background.alpha = 0.1;
    level.menu_background.sort = -20;
}

// Namespace spawning / scripts\cp\spawning
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x10fef
// Size: 0x17a
function create_hudelem( text, x, y, scale, alpha, sort )
{
    if ( !isdefined( alpha ) )
    {
        alpha = 1;
    }
    
    if ( !isdefined( scale ) )
    {
        scale = 1;
    }
    
    if ( !isdefined( sort ) )
    {
        sort = 20;
    }
    
    hud = newhudelem();
    hud.location = 0;
    hud.alignx = "left";
    hud.aligny = "middle";
    hud.vertalign = "top";
    hud.horzalign = "left";
    hud.foreground = 1;
    hud.fontscale = 1;
    hud.sort = define_var_if_undefined( sort, 1 );
    hud.alpha = define_var_if_undefined( alpha, 0.1 );
    hud.x = define_var_if_undefined( x, 0 );
    hud.y = define_var_if_undefined( y, 85 );
    hud.og_scale = 1;
    hud.archived = 0;
    
    if ( isdefined( text ) )
    {
        hud.text = text;
        
        if ( isnumber( text ) )
        {
            hud setvalue( text );
        }
        else
        {
            /#
                hud setdevtext( text );
            #/
            
            hud clearalltextafterhudelem();
        }
    }
    
    return hud;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11172
// Size: 0x55
function add_space_to_string( return_string, space_string )
{
    if ( return_string.size > space_string.size )
    {
        return getsubstr( return_string, 0, space_string.size );
    }
    
    var_46205307b7b3c8fe = getsubstr( space_string, 0, space_string.size - return_string.size );
    
    if ( isdefined( var_46205307b7b3c8fe ) && var_46205307b7b3c8fe.size > 0 )
    {
        return ( return_string + var_46205307b7b3c8fe );
    }
    
    return return_string;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x111cf
// Size: 0x86
function is_group_active()
{
    if ( isdefined( level.active_spawn_module_structs ) && level.active_spawn_module_structs.size > 0 )
    {
        keys = getarraykeys( level.active_spawn_module_structs );
        
        for (i = 0; i < level.active_spawn_module_structs.size; i++) {
            key = keys[ i ];
            
            if ( array_contains( level.active_spawn_module_structs[ key ], self ) )
            {
                return 1;
            }
        }
        
        return 0;
    }
    
    return 0;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1125d
// Size: 0x54
function create_module_debug_struct()
{
    struct = spawnstruct();
    struct.status = "running";
    struct.min_size = 0;
    struct.max_size = 0;
    struct.totalspawns = 0;
    self.debug_data = struct;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x112b9
// Size: 0x32
function change_module_status( module_struct, new_status )
{
    /#
        if ( isdefined( module_struct ) )
        {
            module_struct.debug_data.status = new_status;
        }
    #/
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112f3
// Size: 0xb
function get_module_debug_data()
{
    return self.debug_data;
}

// Namespace spawning / scripts\cp\spawning
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x11307
// Size: 0xbd
function add_global_spawn_function( team, function, param1, param2, param3, param4 )
{
    if ( !isdefined( level.global_ai_func_array ) )
    {
        level.global_ai_func_array = [];
    }
    
    if ( !isdefined( level.global_ai_func_array[ team ] ) )
    {
        level.global_ai_func_array[ team ] = [];
    }
    
    func = [];
    func[ "function" ] = function;
    func[ "param1" ] = param1;
    func[ "param2" ] = param2;
    func[ "param3" ] = param3;
    func[ "param4" ] = param4;
    level.global_ai_func_array[ team ][ level.global_ai_func_array[ team ].size ] = func;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x113cc
// Size: 0x91
function remove_global_spawn_function( team, function )
{
    assertex( isdefined( level.global_ai_func_array ), "Tried to add_global_spawn_function before level.global_ai_func_array was initialized" );
    array = [];
    
    for (i = 0; i < level.global_ai_func_array[ team ].size; i++) {
        if ( level.global_ai_func_array[ team ][ i ][ "function" ] != function )
        {
            array[ array.size ] = level.global_ai_func_array[ team ][ i ];
        }
    }
    
    level.global_ai_func_array[ team ] = array;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11465
// Size: 0x84
function get_passive_wave_high_threshold( group, high_threshold )
{
    if ( getdvarint( @"hash_3d7b446d7722d59f", -1 ) != -1 )
    {
        return getdvarint( @"hash_3d7b446d7722d59f" );
    }
    
    if ( isdefined( self.passive_wave_settings ) && isdefined( self.passive_wave_settings.high_threshold ) )
    {
        return self.passive_wave_settings.high_threshold;
    }
    
    if ( isdefined( high_threshold ) )
    {
        return process_module_var( group, high_threshold );
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x114f1
// Size: 0x84
function get_passive_wave_low_threshold( group, low_threshold )
{
    if ( getdvarint( @"hash_41847a5466c0369b", -1 ) != -1 )
    {
        return getdvarint( @"hash_41847a5466c0369b" );
    }
    
    if ( isdefined( self.passive_wave_settings ) && isdefined( self.passive_wave_settings.low_threshold ) )
    {
        return self.passive_wave_settings.low_threshold;
    }
    
    if ( isdefined( low_threshold ) )
    {
        return process_module_var( group, low_threshold );
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1157d
// Size: 0x6d
function get_passive_spawn_window_time( group )
{
    if ( getdvarint( @"hash_413ded1333e47085", 0 ) != 0 )
    {
        return getdvarint( @"hash_413ded1333e47085" );
    }
    
    if ( isdefined( self.passive_wave_settings ) && isdefined( self.passive_wave_settings.spawn_window_time ) )
    {
        return self.passive_wave_settings.spawn_window_time;
    }
    
    return 5;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x115f2
// Size: 0x86
function get_passive_wave_spawn_time( group )
{
    if ( getdvarint( @"hash_d01a3f44be125516", -1 ) != -1 )
    {
        return getdvarint( @"hash_d01a3f44be125516" );
    }
    
    if ( isdefined( self.timeout_after_min_count ) )
    {
        return self.timeout_after_min_count;
    }
    
    if ( isdefined( self.passive_wave_settings ) && isdefined( self.passive_wave_settings.wave_spawn_time ) )
    {
        return self.passive_wave_settings.wave_spawn_time;
    }
    
    return 15;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11680
// Size: 0x7d
function set_wave_ref_override( wave_ref_override )
{
    if ( is_module_active( "wave_spawning" ) )
    {
        run_func_on_group_by_groupname( "wave_spawning", [ &add_wave_overrides_to_module, wave_ref_override ] );
        var_18e4128165dbee65 = get_module_structs_by_groupname( "wave_spawning" );
        
        if ( isdefined( var_18e4128165dbee65 ) && var_18e4128165dbee65.size > 0 )
        {
            var_18e4128165dbee65[ 0 ] thread scripts\cp\cp_wave_spawning::start_wave();
        }
    }
    else
    {
        level.first_wave_override = wave_ref_override;
        var_18e4128165dbee65 = run_spawn_module( "wave_spawning" );
    }
    
    return var_18e4128165dbee65;
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11706
// Size: 0xa7
function add_wave_overrides_to_module( group, wave_ref_override )
{
    level notify( "timeout_wave" );
    group notify( "wave_spawn" );
    group notify( "wave_go_kamikaze" );
    toggle_force_stop_wave_from_groupname( "wave_spawning", undefined, "new_wave_starting" );
    toggle_force_stop_wave_from_groupname( "wave_paratroopers", undefined, "new_wave_starting" );
    run_func_on_group_by_groupname( "wave_spawning", [ &toggle_kamikaze_for_group, undefined ] );
    set_wave_settings_for_all_with_groupname( "wave_spawning", wave_ref_override, group.wave_reference, group.last_wave_num );
    group.next_wave = wave_ref_override;
    group.wave_reference_override = wave_ref_override;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x117b5
// Size: 0x17, Type: bool
function is_module_active( group_name )
{
    return isdefined( level.active_spawn_module_structs[ group_name ] );
}

// Namespace spawning / scripts\cp\spawning
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x117d5
// Size: 0x13e
function get_module_structs_by_groupname( group_name, var_39b6d9b1ea445b43 )
{
    return_array = [];
    
    if ( !isarray( group_name ) )
    {
        group_name = [ group_name ];
    }
    
    if ( istrue( var_39b6d9b1ea445b43 ) )
    {
        keys = getarraykeys( level.spawn_module_structs_memory );
        array = level.spawn_module_structs_memory;
    }
    else
    {
        keys = getarraykeys( level.active_spawn_module_structs );
        array = level.active_spawn_module_structs;
    }
    
    for (i = 0; i < array.size; i++) {
        module = array[ keys[ i ] ];
        
        if ( isarray( module ) )
        {
            for (j = 0; j < module.size; j++) {
                group = module[ j ];
                
                for (k = 0; k < group_name.size; k++) {
                    if ( group.group_name == group_name[ k ] )
                    {
                        return_array[ return_array.size ] = group;
                    }
                }
            }
            
            continue;
        }
        
        for (k = 0; k < group_name.size; k++) {
            if ( module.group_name == group_name[ k ] )
            {
                return_array[ return_array.size ] = module;
            }
        }
    }
    
    return return_array;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1191c
// Size: 0xea
function get_allowed_vehicle_types_from_spawnpoint( allowed_vehicles )
{
    return_array = [];
    
    if ( isdefined( self.script_type ) && isdefined( allowed_vehicles ) && isarray( allowed_vehicles ) && allowed_vehicles.size > 0 )
    {
        if ( !isarray( self.script_type ) )
        {
            toks = strtok( self.script_type, "," );
            self.script_type = [];
            
            for (i = 0; i < toks.size; i++) {
                self.script_type[ self.script_type.size ] = toks[ i ];
            }
        }
        
        for (i = 0; i < self.script_type.size; i++) {
            if ( array_contains( allowed_vehicles, self.script_type[ i ] ) )
            {
                return_array[ return_array.size ] = self.script_type[ i ];
            }
        }
        
        return return_array;
    }
    
    return allowed_vehicles;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a0e
// Size: 0x68
function get_allowed_vehicle_types_from_wave()
{
    temp_array = [];
    keys = getarraykeys( self.valid_vehicles );
    
    for (i = 0; i < keys.size; i++) {
        if ( self.valid_vehicles[ keys[ i ] ] > 0 )
        {
            temp_array[ temp_array.size ] = keys[ i ];
        }
    }
    
    if ( temp_array.size > 0 )
    {
        return temp_array;
    }
    
    return undefined;
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a7e
// Size: 0xc8
function remove_invalid_aitypes()
{
    keys = getarraykeys( self.spawn_aitype_counts );
    
    for (i = 0; i < level.spawn_module_structs_memory[ self.group_name ].size; i++) {
        module = level.spawn_module_structs_memory[ self.group_name ][ i ];
        
        for (j = 0; j < keys.size; j++) {
            key = keys[ j ];
            
            if ( isdefined( module.spawn_aitype_counts[ key ] ) && module.spawn_aitype_counts[ key ] < 1 )
            {
                module.spawn_aitype_counts[ key ] = undefined;
            }
        }
    }
    
    return self.spawn_aitype_counts;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b4f
// Size: 0x43
function set_demeanor_from_unittype( demeanor )
{
    demeanor = validate_demeanor( demeanor );
    
    if ( is_specified_unittype( "civilian" ) )
    {
        scripts\asm\asm_bb::bb_setcivilianstate( demeanor );
        return;
    }
    
    if ( !is_specified_unittype( "juggernaut" ) )
    {
        utility::demeanor_override( demeanor );
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11b9a
// Size: 0x40
function validate_demeanor( demeanor )
{
    switch ( demeanor )
    {
        case #"hash_46fdaf04e9be63e4":
        case #"hash_d320ccf96c495f71":
            return "patrol";
        default:
            return demeanor;
    }
}

// Namespace spawning / scripts\cp\spawning
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11be2
// Size: 0x135
function init_trigger_spawn_groups()
{
    level endon( "game_ended" );
    register_trigger_func( "run_spawn_module", &trigger_run_spawn_module, &register_triggered_module );
    register_trigger_func( "run_spawn_module_looping", &trigger_run_module_once, &register_triggered_looping_module );
    register_trigger_func( "run_spawn_module_infinite", &trigger_run_module_once, &register_triggered_infinite_module );
    register_trigger_func( "run_spawn_module_timeout_loop", &trigger_run_module_once, &register_triggered_timeout_module );
    register_trigger_func( "run_spawn_module_list", &trigger_choose_func_from_list, &register_triggered_timeout_module );
    flag_wait( "level_ready_for_script" );
    var_26cd5fad08ecb98e = getentarray( "trigger_spawner", "targetname" );
    
    foreach ( trigger in var_26cd5fad08ecb98e )
    {
        if ( isdefined( trigger.target ) && isdefined( trigger.script_function ) )
        {
            [[ run_triggered_module_registration( trigger.script_function ) ]]( trigger );
            trigger thread run_script_func_when_triggered( trigger );
            
            /#
                trigger thread function_64b61158328bca1c( ( 1, 1, 1 ) );
            #/
        }
    }
}

/#

    // Namespace spawning / scripts\cp\spawning
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x11d1f
    // Size: 0x2e1, Type: dev
    function function_64b61158328bca1c( color )
    {
        level endon( "<dev string:x3f3>" );
        
        while ( true )
        {
            if ( getdvar( @"hash_ec179f7878942f06" ) != "<dev string:x1e>" )
            {
                wait 1;
                continue;
            }
            
            if ( self.struct.angles == ( 0, 0, 0 ) )
            {
                sphere( self.struct.origin, self.struct.radius, color, 1, 50 );
            }
            else
            {
                up = anglestoup( self.struct.angles ) * self.struct.radius;
                left = anglestoleft( self.struct.angles ) * self.struct.radius;
                right = anglestoright( self.struct.angles ) * self.struct.radius;
                line( self.struct.origin - up + left, self.struct.origin - up + left + anglestoforward( self.struct.angles ) * self.struct.height / 2, color, 1, 1, 50 );
                line( self.struct.origin - up + right, self.struct.origin - up + right + anglestoforward( self.struct.angles ) * self.struct.height / 2, color, 1, 1, 50 );
                line( self.struct.origin + left, self.struct.origin + left + anglestoforward( self.struct.angles ) * self.struct.height / 2, color, 1, 1, 50 );
                line( self.struct.origin + right, self.struct.origin + right + anglestoforward( self.struct.angles ) * self.struct.height / 2, color, 1, 1, 50 );
            }
            
            wait 2.5;
        }
    }

#/

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12008
// Size: 0x2f
function run_triggered_module_registration( ref )
{
    if ( isdefined( level.trigger_spawn_module_func[ ref ] ) )
    {
        return level.trigger_spawn_module_func[ ref ];
    }
    
    return &register_triggered_module;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1203f
// Size: 0x128
function register_triggered_timeout_module( trigger )
{
    var_aae412daadfc9729 = getstructarray( trigger.target, "targetname" );
    total_spawns = ter_op( isdefined( trigger.script_count ), int( trigger.script_count ), undefined );
    min_spawns = ter_op( isdefined( trigger.script_count_min ), int( trigger.script_count_min ), 0 );
    max_spawns = ter_op( isdefined( trigger.script_count_max ), int( trigger.script_count_max ), var_aae412daadfc9729.size );
    registerambientgroup( trigger.target, min_spawns, max_spawns, total_spawns, [ &wait_time_from_active_count, 0.25, 5, 0.8 ], undefined, trigger.target, undefined, trigger.target, 30 );
    set_spawn_scoring_params_for_group( trigger.target, undefined, undefined, trigger.script_maxdist, undefined );
}

// Namespace spawning / scripts\cp\spawning
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1216f
// Size: 0x65
function wait_time_from_active_count( group, min_time, max_time, max_ratio )
{
    active_count = group.activecount;
    max_count = process_module_var( group, group.max_size );
    
    if ( active_count / max_count >= max_ratio )
    {
        return max_time;
    }
    
    return min_time;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x121dc
// Size: 0x76
function register_triggered_infinite_module( trigger )
{
    var_aae412daadfc9729 = getstructarray( trigger.target, "targetname" );
    registerambientgroup( trigger.target, 0, var_aae412daadfc9729.size, undefined, 0.25, undefined, trigger.target, undefined, undefined, undefined );
    set_spawn_scoring_params_for_group( trigger.target, undefined, undefined, trigger.script_maxdist, undefined );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1225a
// Size: 0x85
function register_triggered_looping_module( trigger )
{
    var_aae412daadfc9729 = getstructarray( trigger.target, "targetname" );
    registerambientgroup( trigger.target, 0, var_aae412daadfc9729.size, var_aae412daadfc9729.size, 0.25, &wait_for_all_group_dead, trigger.target, undefined, trigger.target, undefined );
    set_spawn_scoring_params_for_group( trigger.target, undefined, undefined, trigger.script_maxdist, undefined );
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x122e7
// Size: 0x77
function register_triggered_module( trigger )
{
    var_aae412daadfc9729 = getstructarray( trigger.target, "targetname" );
    registerambientgroup( trigger.target, 0, var_aae412daadfc9729.size, var_aae412daadfc9729.size, 0.25, undefined, trigger.target, undefined, undefined, undefined );
    set_spawn_scoring_params_for_group( trigger.target, undefined, undefined, trigger.script_maxdist, undefined );
}

// Namespace spawning / scripts\cp\spawning
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12366
// Size: 0x63
function register_trigger_func( ref, trigger_func, module_func )
{
    if ( !isdefined( level.trigger_spawn_func ) )
    {
        level.trigger_spawn_func = [];
    }
    
    if ( !isdefined( level.trigger_spawn_module_func ) )
    {
        level.trigger_spawn_module_func = [];
    }
    
    level.trigger_spawn_func[ ref ] = trigger_func;
    level.trigger_spawn_module_func[ ref ] = module_func;
}

// Namespace spawning / scripts\cp\spawning
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x123d1
// Size: 0xbc
function run_script_func_when_triggered( trigger )
{
    trigger notify( "run_script_func_when_triggered" );
    trigger endon( "run_script_func_when_triggered" );
    trigger endon( "death" );
    level endon( "game_ended" );
    trigger thread_on_notify( "disable_trigger", &trigger_off );
    
    if ( !isdefined( level.trigger_spawn_func ) )
    {
        trigger notify( "disable_trigger" );
        return;
    }
    
    if ( !isdefined( level.trigger_spawn_func[ trigger.script_function ] ) )
    {
        trigger notify( "disable_trigger" );
        return;
    }
    
    func = level.trigger_spawn_func[ trigger.script_function ];
    
    while ( true )
    {
        trigger waittill( "trigger", triggering_ent );
        
        if ( isplayer( triggering_ent ) )
        {
            [[ func ]]( trigger, triggering_ent );
        }
    }
}

