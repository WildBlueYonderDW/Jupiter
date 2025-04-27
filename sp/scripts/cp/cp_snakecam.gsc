#using script_2c075d80ec62e503;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp\cp_anim;
#using scripts\cp\cp_outline;
#using scripts\cp\cp_puzzles_core;
#using scripts\cp\cp_snakecam;
#using scripts\cp\equipment;
#using scripts\cp\laststand;
#using scripts\cp\pickups;
#using scripts\cp\utility;
#using scripts\cp\utility\player;
#using scripts\cp_mp\anim_scene;
#using scripts\cp_mp\hostmigration;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\scriptable_door_utility;
#using scripts\engine\math;
#using scripts\engine\scriptable;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace cp_snakecam;

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb08
// Size: 0x9
function init()
{
    namespace_ae34222dcb9dda53::function_53ab5dd012d67963();
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb19
// Size: 0x38
function init_camera_interaction()
{
    script_model_anims();
    
    if ( !isdefined( level.var_248dba4332a49ad3 ) )
    {
        level.var_248dba4332a49ad3 = &function_248dba4332a49ad3;
    }
    
    thread function_5f077055eee53d8c();
    scripts\engine\scriptable::scriptable_addusedcallback( &function_216a48e2dbec763f );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb59
// Size: 0x34
function function_248dba4332a49ad3()
{
    self endon( "disconnect" );
    player = self;
    
    if ( istrue( player.enteredcamera ) )
    {
        remove_player_from_cam( player );
        return 1;
    }
    
    return 0;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb95
// Size: 0x28
function function_85adc29814a88d9d()
{
    level endon( "game_ended" );
    self endon( "completed_snakecam_exit" );
    
    while ( true )
    {
        self waittill( "death" );
        remove_player_from_cam( self );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc5
// Size: 0x38
function poke_the_player_after_faux_death()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "laststand" );
    self waittill( "completed_snakecam_exit" );
    wait 0.1;
    
    if ( !self.inlaststand )
    {
        self suicide();
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc05
// Size: 0x95
function function_216a48e2dbec763f( instance, part, state, player, var_a5b2c541413aa895, usestring )
{
    if ( isdefined( instance ) )
    {
        if ( instance.type == "snakecam_interaction" )
        {
            if ( !istrue( instance.isinuse ) )
            {
                instance.isinuse = 1;
                function_19d3f246d4fed2fe( instance );
                thread function_d25799279ec14c4c( instance );
                snakecam_activate_func( instance.interaction_struct, player );
                function_8ca93624ea5f3c01( instance );
            }
        }
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca2
// Size: 0x5c
function function_8ca93624ea5f3c01( instance )
{
    foreach ( player in level.players )
    {
        instance enablescriptableplayeruse( player );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd06
// Size: 0x5c
function function_19d3f246d4fed2fe( instance )
{
    foreach ( player in level.players )
    {
        instance disablescriptableplayeruse( player );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd6a
// Size: 0x36
function function_3ccf13603ac68e58( waittime )
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    wait waittime;
    
    if ( !istrue( self.isjuggernaut ) )
    {
        self setclientomnvar( "ui_snakecam", 1 );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xda8
// Size: 0x18
function snakecam_hint_func( interaction_struct, player )
{
    return %SNAKECAM/USE;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdc9
// Size: 0x5bf
function snakecam_activate_func( interaction_struct, player )
{
    if ( !isplayer( player ) || istrue( interaction_struct.isinuse ) )
    {
        return;
    }
    
    interaction_struct.isinuse = 1;
    
    if ( istrue( interaction_struct.disabled ) )
    {
        return;
    }
    
    if ( istrue( player.tablet_out ) )
    {
        return;
    }
    
    player endon( "disconnect" );
    player thread scripts\cp\cp_snakecam::function_7f4e0ffc4558b72f( 3 );
    assertex( isdefined( interaction_struct.target ), "No snakecam target set" );
    interaction_struct.target_obj = getstruct( interaction_struct.target, "targetname" );
    
    if ( !isdefined( interaction_struct.target_obj.angles ) )
    {
        interaction_struct.target_obj.angles = ( 0, 0, 0 );
    }
    
    isthirdperson = player getcamerathirdperson();
    playerstance = player getstance();
    tag = spawn( "script_model", player.origin );
    tag setmodel( "tag_player" );
    tag.origin = interaction_struct.target_obj.origin;
    tag.angles = interaction_struct.target_obj.angles;
    animtag = spawn( "script_model", tag.origin );
    var_6e155dc8c2fa9e2e = scripts\cp\utility::get_point_in_local_ent_space( tag, ( -10, 0, 0 ) );
    animtag.origin = drop_to_ground( var_6e155dc8c2fa9e2e, 64 );
    animtag.angles = tag.angles;
    player waittill_any_timeout_1( 0.3, "swapped_to_gunless" );
    player playlocalsound( "cp_ui_snakecam_in_foly_plr" );
    var_1ee766cf65cd6b47 = 0.5;
    
    if ( player getstance() == "prone" )
    {
        var_1ee766cf65cd6b47 = 0.4;
    }
    else if ( player getstance() == "crouch" )
    {
        var_1ee766cf65cd6b47 = 0.5;
    }
    
    player thread function_3ccf13603ac68e58( var_1ee766cf65cd6b47 );
    thread function_fb9891f994d3178( player, animtag, isthirdperson, playerstance );
    player waittill( "entered_snakecam_anim" );
    waitframe();
    player thread function_85adc29814a88d9d();
    player.enteredcamera = 1;
    player.nvg_was_on = 0;
    player.disable_map_tablet = 1;
    player notify( "enter_cam" );
    player.og_origin = player.origin;
    player.og_angles = player getplayerangles();
    player.og_stance = player getstance();
    fwd = anglestoforward( interaction_struct.target_obj.angles );
    to_camera = vectornormalize( interaction_struct.target_obj.origin - player getorigin() );
    dot = vectordot( fwd, to_camera );
    put_player_on_cam( tag, player, interaction_struct );
    level notify( "snakecam_used", player );
    player playlocalsound( "cp_ui_snakecam_in_plr" );
    player thread snake_cam_control( tag );
    var_dc1abbab0bc304f5 = "embassy_cctv_01";
    
    if ( isdefined( level.var_5e3f92c109670a2e ) )
    {
        var_dc1abbab0bc304f5 = level.var_5e3f92c109670a2e;
    }
    
    if ( isdefined( interaction_struct.script_parameters ) && interaction_struct.script_parameters != "default" )
    {
        var_dc1abbab0bc304f5 = interaction_struct.script_parameters;
    }
    
    interaction_struct.cam_hud = snake_door_cam_hud( player, var_dc1abbab0bc304f5 );
    var_379b46b62fa2c9a3 = 0;
    timeout_time = 90;
    interaction_struct thread waittill_player_exits_cam( player );
    interaction_struct waittill_any_timeout_1( timeout_time, "player_left_cam" );
    nudge_spot = tag.origin + anglestoforward( tag.angles ) * -20;
    player.enteredcamera = undefined;
    player.disable_map_tablet = 0;
    wait 0.25;
    player notify( "leave_cam" );
    
    foreach ( thing in interaction_struct.cam_hud )
    {
        thing destroy();
    }
    
    level thread scripts\cp\cp_puzzles_core::static_burst( 0.55, player );
    player stoprumble( "steady_rumble" );
    player playlocalsound( "cp_ui_snakecam_out_plr" );
    level add_wait( &waittill_msg, "static_faded_in" );
    do_wait_any();
    outline_fade_alpha_for_index( 6, 0.8, 0.5 );
    level notify( "vision_set_change_request", undefined, player, 0.05, var_dc1abbab0bc304f5 );
    wait 0.1;
    remove_player_from_cam( player );
    
    if ( !istrue( player.isjuggernaut ) )
    {
        player setclientomnvar( "ui_snakecam", 0 );
    }
    
    outline_fade_alpha_for_index( 6, 0, 9 );
    player notify( "completed_snakecam_exit" );
    animtag waittill_any_timeout_1( 5, "exit_anim_done" );
    player thread takegunless();
    tag delete();
    animtag delete();
    interaction_struct.isinuse = 0;
    interaction_struct.scriptable.isinuse = 0;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1390
// Size: 0x15
function function_d63c50e6896930ea( newvisionset )
{
    level.var_5e3f92c109670a2e = newvisionset;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13ad
// Size: 0x6a
function function_9eb975a126bfe444( var_fa9bfa35a863fa9, var_e99be672bc67aeb0, loopanim )
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    wait var_fa9bfa35a863fa9;
    self.var_ea741c5b7b9eda80 show();
    wait var_e99be672bc67aeb0;
    self.var_24c22d4aeab7ef2f show();
    self.var_24c22d4aeab7ef2f scriptmodelclearanim();
    self.var_24c22d4aeab7ef2f scriptmodelplayanim( loopanim );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x141f
// Size: 0x458
function function_fb9891f994d3178( player, var_c7ddd9229f6512a3, var_dd1d08b0c203d5ce, playerstance )
{
    level endon( "game_ended" );
    player endon( "death" );
    player endon( "disconnect" );
    
    if ( !isdefined( var_dd1d08b0c203d5ce ) )
    {
        var_dd1d08b0c203d5ce = player getcamerathirdperson();
    }
    
    if ( !isdefined( playerstance ) )
    {
        playerstance = player getstance();
    }
    
    animalias = undefined;
    
    switch ( playerstance )
    {
        case #"hash_c6775c88e38f7803":
        default:
            animalias = "stand_enter";
            loopanim = script_model#iw9_mp_equip_snakecam_loop;
            exitanim = "stand_exit";
            break;
        case #"hash_3fed0cbd303639eb":
            animalias = "crouch_enter";
            loopanim = script_model#iw9_mp_equip_snakecam_loop;
            exitanim = "crouch_exit";
            break;
        case #"hash_d91940431ed7c605":
            player.anim_scene_stance_override = "prone";
            animalias = "prone_enter";
            loopanim = script_model#iw9_mp_equip_snakecam_loop_prone;
            exitanim = "prone_exit";
            break;
    }
    
    anim_array = [];
    
    if ( isdefined( player ) )
    {
        actorplayer = scripts\cp_mp\anim_scene::anim_scene_create_actor( player, "snakecam", 1 );
        actorplayer scripts\cp_mp\anim_scene::anim_scene_set_actor_interruptable( 1, "snakecam", 1 );
        anim_array[ anim_array.size ] = actorplayer;
    }
    
    cam = spawn( "script_model", player gettagorigin( "tag_weapon_right" ) );
    cam hide();
    cam.angles = player gettagangles( "tag_weapon_right" );
    cam dontinterpolate();
    cam linkto( player, "tag_weapon_right", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    cam setmodel( "misc_vm_snakecam_v0" );
    tablet = spawn( "script_model", player gettagorigin( "tag_accessory_left" ) );
    tablet hide();
    tablet.angles = player gettagangles( "tag_accessory_left" );
    tablet linkto( player, "tag_accessory_left", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    tablet setmodel( "offhand2h_tablet_static_v0" );
    player.var_24c22d4aeab7ef2f = cam;
    player.var_ea741c5b7b9eda80 = tablet;
    
    if ( anim_array.size > 0 )
    {
        player thread function_9eb975a126bfe444( 1, 0.1, loopanim );
        result = var_c7ddd9229f6512a3 scripts\cp_mp\anim_scene::anim_scene( anim_array, animalias, 1, 1, undefined, 0, 0.5 );
    }
    
    player notify( "entered_snakecam_anim" );
    waitframe();
    
    if ( !isdefined( player.model ) || !isdefined( player.headmodel ) )
    {
        return;
    }
    
    body = spawn( "script_model", player.origin );
    body.angles = player.angles;
    body setmodel( player getcustomizationbody() );
    head = spawn( "script_model", player.origin );
    head.angles = player.angles;
    head setmodel( player getcustomizationhead() );
    head linkto( body, "j_neck", ( -9, 1, 0 ), ( 0, 0, 0 ) );
    body.head = head;
    
    if ( !istrue( var_dd1d08b0c203d5ce ) )
    {
        foreach ( otherplayer in level.players )
        {
            if ( otherplayer == player )
            {
                body hidefromplayer( otherplayer );
                head hidefromplayer( otherplayer );
                continue;
            }
            
            body showtoplayer( otherplayer );
            head showtoplayer( otherplayer );
        }
    }
    
    if ( !function_240f7f4e57340e8f() )
    {
        player scripts\cp_mp\utility\player_utility::function_a593971d75d82113();
    }
    
    player setsolid( 0 );
    thread function_2fe064dfefd94529( player, body, var_c7ddd9229f6512a3, loopanim );
    player waittill_any_2( "leave_cam", "completed_snakecam_exit" );
    thread function_ddc7967c675a6d0f( player, body, var_c7ddd9229f6512a3, exitanim );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x187f
// Size: 0xd0
function function_2fe064dfefd94529( player, body, var_c7ddd9229f6512a3, loopanim )
{
    level endon( "game_ended" );
    player endon( "death" );
    player endon( "disconnect" );
    player endon( "leave_cam" );
    player endon( "completed_snakecam_exit" );
    body endon( "death" );
    player.var_ea741c5b7b9eda80 unlink();
    player.var_ea741c5b7b9eda80 linkto( body, "tag_accessory_left", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    
    while ( true )
    {
        body scriptmodelclearanim();
        body scriptmodelplayanim( loopanim );
        player.var_24c22d4aeab7ef2f scriptmodelclearanim();
        player.var_24c22d4aeab7ef2f scriptmodelplayanim( loopanim );
        wait getanimlength( loopanim );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1957
// Size: 0x189
function function_ddc7967c675a6d0f( player, body, var_c7ddd9229f6512a3, exitanim )
{
    level endon( "game_ended" );
    player endon( "death" );
    player endon( "disconnect" );
    anim_array = [];
    
    if ( isdefined( player ) )
    {
        actorplayer = scripts\cp_mp\anim_scene::anim_scene_create_actor( player, "snakecam", 1 );
        actorplayer scripts\cp_mp\anim_scene::anim_scene_set_actor_interruptable( 1, "snakecam", 1 );
        anim_array[ anim_array.size ] = actorplayer;
    }
    
    player.var_ea741c5b7b9eda80 unlink();
    player.var_ea741c5b7b9eda80 linkto( player, "tag_accessory_left", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    body.head delete();
    body delete();
    
    if ( !function_240f7f4e57340e8f() )
    {
        player scripts\cp_mp\utility\player_utility::function_6fb380927695ee76();
    }
    
    player setsolid( 1 );
    
    if ( anim_array.size > 0 )
    {
        player.var_24c22d4aeab7ef2f scriptmodelclearanim();
        player.var_24c22d4aeab7ef2f scriptmodelplayanim( "iw9_mp_equip_snakecam_out_stand" );
        result = var_c7ddd9229f6512a3 scripts\cp_mp\anim_scene::anim_scene( anim_array, exitanim );
    }
    
    player.anim_scene_stance_override = undefined;
    
    if ( isdefined( player.var_24c22d4aeab7ef2f ) )
    {
        player.var_24c22d4aeab7ef2f delete();
    }
    
    if ( isdefined( player.var_ea741c5b7b9eda80 ) )
    {
        player.var_ea741c5b7b9eda80 delete();
    }
    
    var_c7ddd9229f6512a3 notify( "exit_anim_done" );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae8
// Size: 0xa4
function function_78db7bbcc9b65fb3( player, var_c7ddd9229f6512a3, anim_alias, optional_endon )
{
    level endon( "game_ended" );
    player endon( "death" );
    player endon( "disconnect" );
    
    if ( isdefined( optional_endon ) )
    {
        level endon( optional_endon );
    }
    
    anim_array = [];
    
    if ( isdefined( player ) )
    {
        actorplayer = scripts\cp_mp\anim_scene::anim_scene_create_actor( player, "snakecam", 1 );
        actorplayer scripts\cp_mp\anim_scene::anim_scene_set_actor_interruptable( 1, "snakecam", 1 );
        anim_array[ anim_array.size ] = actorplayer;
    }
    
    if ( anim_array.size > 0 )
    {
        result = var_c7ddd9229f6512a3 scripts\cp_mp\anim_scene::anim_scene( anim_array, "snakecam_in" );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b94
// Size: 0x13
function function_92df319ccfcac315( streakinfo )
{
    self waittill( "completed_snakecam_exit" );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1baf
// Size: 0x4c
function function_d78527c235e0c208()
{
    level endon( "game_ended" );
    self endon( "death" );
    gunless = makeweapon( "iw9_gunless_quickdrop_mp" );
    scripts\cp_mp\utility\inventory_utility::_giveweapon( gunless, undefined, undefined, 1 );
    scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch( gunless, 0 );
    self.gunnlessweapon = gunless;
    self notify( "swapped_to_gunless" );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c03
// Size: 0x3e
function takegunless()
{
    level endon( "game_ended" );
    self endon( "death" );
    
    if ( isdefined( self.gunnlessweapon ) )
    {
        scripts\cp_mp\utility\inventory_utility::_takeweapon( self.gunnlessweapon );
        scripts\cp_mp\utility\inventory_utility::forcevalidweapon();
        self.gunnlessweapon = undefined;
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c49
// Size: 0x1b
function function_db2fc31c8b3c4ec1()
{
    self.var_d05d227b98586982 = self.primaryweapons;
    scripts\cp\pickups::takeweaponsdefaultfunc();
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6c
// Size: 0x15a
function restoreweaponsdefaultfunc()
{
    self clearaccessory();
    
    if ( isdefined( self.primaryweaponobj ) )
    {
        scripts\cp_mp\utility\inventory_utility::_giveweapon( self.primaryweaponobj, undefined, undefined, 0 );
        
        if ( isdefined( self.primaryweaponclipammo ) )
        {
            self setweaponammoclip( self.primaryweaponobj, self.primaryweaponclipammo );
            scripts\cp\pickups::function_4906c10c3ffdd4ca( self.primaryweaponobj, self.primaryweaponstockammo );
        }
    }
    
    if ( isdefined( self.secondaryweaponobj ) )
    {
        scripts\cp_mp\utility\inventory_utility::_giveweapon( self.secondaryweaponobj, undefined, undefined, 1 );
        
        if ( isdefined( self.secondaryweaponclipammo ) )
        {
            scripts\cp\pickups::function_4906c10c3ffdd4ca( self.secondaryweaponobj, self.secondaryweaponstockammo );
        }
    }
    
    self.weaponlist = self.var_d05d227b98586982;
    
    if ( isdefined( self.weaponlist[ 0 ] ) )
    {
        scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch( self.weaponlist[ 0 ] );
    }
    
    if ( isdefined( self.weaponlist ) && isdefined( self.weaponlist[ 0 ] ) )
    {
        self.primaryweaponobj = self.weaponlist[ 0 ];
    }
    
    if ( isdefined( self.weaponlist ) && isdefined( self.weaponlist[ 1 ] ) )
    {
        self.secondaryweaponobj = self.weaponlist[ 1 ];
    }
    
    if ( isdefined( self.gunnlessweapon ) )
    {
        scripts\cp_mp\utility\inventory_utility::function_9897d143c3feee05();
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dce
// Size: 0x36
function snakecam_delay_visionsetchange()
{
    wait 0.05;
    level notify( "vision_set_change_request", undefined, self, 0.05, "cp_lab_zero" );
    wait 1.45;
    level notify( "vision_set_change_request", undefined, self, 0.05, "cp_lab_zero" );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0c
// Size: 0x13a
function function_5f077055eee53d8c()
{
    precacheshader( "nightvision_overlay_goggles_grain" );
    precacherumble( "cp_wheelson_rumble" );
    interaction_array = getstructarray( "snakecam_interaction", "script_noteworthy" );
    
    foreach ( interaction_struct in interaction_array )
    {
        interaction_struct.p_ent_skip_fov = 1;
        var_aa8ac5c98f3a9029 = getstruct( interaction_struct.target, "targetname" );
        var_aa8ac5c98f3a9029.script_noteworthy = interaction_struct.script_noteworthy;
        interaction_struct.scriptable = spawnscriptable( "snakecam_interaction", interaction_struct.origin, interaction_struct.angles );
        interaction_struct.scriptable.interaction_struct = interaction_struct;
        interaction_struct.scriptable.var_aa8ac5c98f3a9029 = var_aa8ac5c98f3a9029;
        interaction_struct.scriptable.var_aa8ac5c98f3a9029 thread function_94d8d166d09b75a5();
        var_aa8ac5c98f3a9029 thread function_62d9aee42ffdfcec();
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f4e
// Size: 0x12f
function snakecam_init_func( interaction_array )
{
    level endon( "game_ended" );
    precacheshader( "nightvision_overlay_goggles_grain" );
    precacherumble( "cp_wheelson_rumble" );
    
    foreach ( interaction_struct in interaction_array )
    {
        interaction_struct.p_ent_skip_fov = 1;
        var_aa8ac5c98f3a9029 = getstruct( interaction_struct.target, "targetname" );
        var_aa8ac5c98f3a9029.script_noteworthy = interaction_struct.script_noteworthy;
        interaction_struct.scriptable = spawnscriptable( "snakecam_interaction", interaction_struct.origin, interaction_struct.angles );
        interaction_struct.scriptable.interaction_struct = interaction_struct;
        interaction_struct.scriptable.var_aa8ac5c98f3a9029 = var_aa8ac5c98f3a9029;
        interaction_struct.scriptable.var_aa8ac5c98f3a9029 thread function_94d8d166d09b75a5();
        var_aa8ac5c98f3a9029 thread function_62d9aee42ffdfcec();
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2085
// Size: 0x93
function function_62d9aee42ffdfcec()
{
    if ( !flag_exist( "create_script_initialized" ) )
    {
        flag_init( "create_script_initialized" );
    }
    
    flag_wait( "create_script_initialized" );
    wait 10;
    
    if ( getdvarint( @"hash_acd3891a0644e00", 0 ) != 0 )
    {
        return;
    }
    
    foreach ( player in level.players )
    {
        player thread show_snakecam_hint( self );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2120
// Size: 0x21c
function show_snakecam_hint( ent )
{
    self endon( "disconnect" );
    self endon( "end_hints" );
    self notify( "show_snakecam_hint" );
    self endon( "show_snakecam_hint" );
    player = self;
    
    if ( !isdefined( level.var_9c4c07601ea6b6cd ) )
    {
        level.var_9c4c07601ea6b6cd = 1;
    }
    
    ent.counter = "snakecam_" + level.var_9c4c07601ea6b6cd;
    self notify( "show_snakecam_hint" + ent.counter );
    self endon( "show_snakecam_hint" + ent.counter );
    
    if ( !isdefined( level.showhint ) )
    {
        level.showhint = [];
    }
    
    level.showhint[ ent.counter ] = 0;
    level.var_9c4c07601ea6b6cd++;
    player.var_f7bb0a7e41cb6e5 = 0;
    
    while ( true )
    {
        if ( function_eac0cd99c9c6d8ee() == "spotted" )
        {
            wait 2;
            continue;
        }
        
        var_f25430617ab002f8 = distance2dsquared( player.origin, ent.origin );
        
        if ( isdefined( var_f25430617ab002f8 ) && var_f25430617ab002f8 <= 262144 )
        {
            if ( istrue( player.isusingcamera ) )
            {
                wait 3;
                continue;
            }
            
            if ( istrue( player.var_4935c7889506b68c ) )
            {
                wait 3;
                continue;
            }
            
            if ( player.var_f7bb0a7e41cb6e5 >= 2 )
            {
                return;
            }
            
            if ( !istrue( level.showhint[ ent.counter ] ) )
            {
                level.showhint[ ent.counter ] = 1;
                num = randomintrange( 1, 8 );
                player.var_4935c7889506b68c = 1;
                player.var_f7bb0a7e41cb6e5++;
                self sethudtutorialmessage( %SNAKECAM/USE_SNAKECAM_HINT_1, 1 );
                ent thread function_d522dbaebcb26e26( 16 * player.var_f7bb0a7e41cb6e5, self );
            }
        }
        else if ( istrue( level.showhint[ ent.counter ] ) )
        {
            level.showhint[ ent.counter ] = 0;
        }
        
        wait 3;
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2344
// Size: 0x42
function function_d522dbaebcb26e26( delay, player )
{
    wait delay / 3;
    player clearhudtutorialmessage();
    wait delay / 6;
    player.var_4935c7889506b68c = undefined;
    level.showhint[ self.counter ] = undefined;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x238e
// Size: 0x23
function p_ent_snake_cam( ent, struct, same_state, player )
{
    
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23b9
// Size: 0x2b
function function_7f4e0ffc4558b72f( delaytime )
{
    self endon( "death_or_disconnect" );
    self freezecontrols( 1 );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( delaytime );
    self freezecontrols( 0 );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x23ec
// Size: 0x184
function put_player_on_cam( tag, player, interaction_struct )
{
    nudge_spot = tag.origin + anglestoforward( tag.angles ) * 12 - ( 0, 0, 55 );
    player.cam_ent = tag;
    player.isusingcamera = 1;
    player.currentcamera = interaction_struct.target_obj;
    player.cameratarget = interaction_struct.target_obj.targetname;
    player notify( "end_hints" );
    player val::set( "cam", "fire", 0 );
    player cameraunlink();
    player cameralinkto( player.cam_ent, "tag_player", 1 );
    player playerlinkweaponviewtodelta( player.cam_ent, "tag_player", 1, 75, 75, 24, 0 );
    player setviewangleresistance( 90, 90, 130, 10 );
    player playerlinkedsetviewznear( 0 );
    player setplayerangles( tag.angles );
    player val::set( "cam", "weapon", 0 );
    player val::set( "cam", "stand", 0 );
    player val::set( "cam", "crouch", 0 );
    player val::set( "cam", "usability", 0 );
    player setclientomnvar( "ui_snakecam", 1 );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2578
// Size: 0x7a
function remove_player_from_cam( player )
{
    player unlink();
    player cameraunlink();
    player controlsunlink();
    player setstance( player.og_stance );
    player val::reset_all( "cam" );
    player.isusingcamera = 0;
    player.cameraused = undefined;
    player.cameratarget = undefined;
    player.var_c1617124d4ee7e97 = undefined;
    player setclientomnvar( "ui_snakecam", 0 );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25fa
// Size: 0x186
function snake_door_cam_hud( player, vision_type )
{
    crosshair = newclienthudelem( player );
    crosshair.archived = 0;
    crosshair.location = 0;
    crosshair.alignx = "center";
    crosshair.aligny = "middle";
    crosshair.foreground = 1;
    crosshair.fontscale = 1;
    crosshair.sort = 20;
    crosshair.alpha = 0.7;
    crosshair.y = 233;
    crosshair settext( %SNAKECAM/CROSSHAIR );
    overlay = newclienthudelem( player );
    overlay.x = 292;
    overlay.y = 60;
    overlay.alignx = "center";
    overlay.aligny = "middle";
    overlay.font = "hudsmall";
    overlay.fontscale = 0.75;
    overlay settext( %SNAKECAM/CONTROLS );
    goggles = create_client_overlay( "nightvision_overlay_goggles_grain", 1, player );
    
    if ( !isdefined( vision_type ) )
    {
        level notify( "vision_set_change_request", "embassy_cctv_01", player, 0.05 );
    }
    else
    {
        level notify( "vision_set_change_request", vision_type, player, 0.05 );
    }
    
    return [ crosshair, goggles, overlay ];
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2789
// Size: 0x25a
function snake_cam_control( cam_struct, var_f55fe461499f0e19 )
{
    self endon( "leave_cam" );
    og_angles = cam_struct.angles;
    minpitch = -24;
    maxpitch = 0;
    var_cb6680317be1e374 = 55;
    minyaw = og_angles[ 1 ] - var_cb6680317be1e374;
    maxyaw = og_angles[ 1 ] + var_cb6680317be1e374;
    minroll = og_angles[ 2 ] - 15;
    maxroll = og_angles[ 2 ] + 15;
    var_827abacd5ca8f6b3 = 20;
    dmaxroll = 10;
    var_440ebeeb83bd05a8 = 0.6;
    var_75eb1524afeb7f2b = 0.8;
    dmaxangle = 10;
    dyaw = 4;
    dpitch = 1.2;
    var_d296b0eaf4a6b00f = [ 0, 0 ];
    var_d5e6310914396ac3 = 0.2;
    var_848e35f763ce65b0 = 0.2;
    rumble_playing = 0;
    currentangles = self.angles;
    
    while ( istrue( self.isusingcamera ) )
    {
        var_b4f55166f66361e9 = cam_struct.angles + ( 0, -90, 0 );
        input = self getplayerangles();
        multiplier = 0;
        var_fed6e82d22bb75e = length( currentangles - input );
        currentangles = input;
        quake = math::factor_value( 0, 0.165, var_fed6e82d22bb75e );
        rumble = math::factor_value( 0, 0.08, var_fed6e82d22bb75e );
        
        if ( quake > 0.165 )
        {
            quake = 0.165;
        }
        
        if ( quake > 0.005 )
        {
            self earthquakeforplayer( quake, 0.07, self.origin, 2000 );
        }
        
        if ( rumble > 0.0001 )
        {
            thread play_cam_rumble_once();
        }
        
        height = 1 - rumble;
        height *= 1000;
        wait 0.05;
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29eb
// Size: 0x54
function play_cam_rumble_once()
{
    if ( !istrue( self.playing_rumble ) )
    {
        self.playing_rumble = 1;
        self playrumblelooponentity( "cp_wheelson_rumble" );
        self playlocalsound( "cp_ui_snakecam_move_plr" );
        wait 0.1;
        self stoprumble( "cp_wheelson_rumble" );
        wait 0.1;
        self.playing_rumble = undefined;
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a47
// Size: 0xa6
function waittill_player_exits_cam( player )
{
    player endon( "disconnect" );
    wait 2;
    
    while ( true )
    {
        if ( player_is_trying_to_exit_camera( player ) )
        {
            break;
        }
        
        if ( !istrue( player.enteredcamera ) )
        {
            break;
        }
        
        if ( istrue( self.var_e05e65264655b8c0 ) )
        {
            break;
        }
        
        if ( istrue( self.disabled ) )
        {
            break;
        }
        
        if ( scripts\cp\laststand::player_in_laststand( player ) )
        {
            break;
        }
        
        if ( !player scripts\cp_mp\utility\player_utility::_isalive() )
        {
            break;
        }
        
        if ( istrue( player.var_c1617124d4ee7e97 ) )
        {
            break;
        }
        
        waitframe();
    }
    
    self notify( "player_left_cam" );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2af5
// Size: 0x7a, Type: bool
function player_is_trying_to_exit_camera( player )
{
    return player buttonpressed( "C" ) || player buttonpressed( "LCTRL" ) || player fragbuttonpressed() || player stancebuttonpressed() || player meleebuttonpressed() || player buttonpressed( "BUTTON_B" ) || player jumpbuttonpressed() || player buttonpressed( "BUTTON_LSTICK" ) || player buttonpressed( "BUTTON_RSTICK" );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b78
// Size: 0x2a
function get_snakecam_interactions_by_target( input_target )
{
    if ( isdefined( input_target ) )
    {
        targetstructs = getstructarray( input_target, "target" );
        return targetstructs;
    }
    
    return undefined;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bab
// Size: 0x9e
function disable_snakecams_by_target( input_target )
{
    interactions = get_snakecam_interactions_by_target( input_target );
    
    foreach ( interaction in interactions )
    {
        if ( istrue( interaction.disabled ) )
        {
            continue;
        }
        
        interaction.disabled = 1;
        
        if ( isdefined( interaction.fxtoplay ) )
        {
            interaction.fxtoplay delete();
        }
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c51
// Size: 0x6b
function enable_snakecams_by_target( input_target )
{
    interactions = get_snakecam_interactions_by_target( input_target );
    
    foreach ( interaction in interactions )
    {
        interaction.disabled = 0;
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc4
// Size: 0xa0
function refresh_nearby_playerhints( nearby_dist )
{
    if ( !isdefined( nearby_dist ) )
    {
        nearby_dist = 150;
    }
    
    nearby_dist *= nearby_dist;
    
    foreach ( player in level.players )
    {
        if ( distance2dsquared( player.origin, self.origin ) <= nearby_dist )
        {
            if ( isdefined( player.isusingcamera ) )
            {
                player.last_interaction_point = undefined;
            }
        }
        
        wait 0.05;
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d6c
// Size: 0x1e, Type: bool
function is_player_using_snakecam( player )
{
    if ( istrue( player.isusingcamera ) )
    {
        return true;
    }
    
    return false;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d93
// Size: 0x5e
function toggle_dynamically_from_doors( var_707e36dd51ff2144 )
{
    wait 2;
    
    foreach ( door in var_707e36dd51ff2144 )
    {
        door thread snakecam_toggle_waittill();
        wait 0.05;
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2df9
// Size: 0x160
function snakecam_toggle_waittill()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    var_e53595ed1321c340 = getstructarray( "snakecam_interaction", "script_noteworthy" );
    maxdist = 200;
    maxdistsq = maxdist * maxdist;
    var_6db508a257162414 = 2;
    self.nearbysnakecams = [];
    
    foreach ( snakecam in var_e53595ed1321c340 )
    {
        if ( distance2dsquared( snakecam.origin, self.origin ) <= maxdistsq )
        {
            self.nearbysnakecams[ self.nearbysnakecams.size ] = snakecam;
        }
    }
    
    if ( self.nearbysnakecams.size == 0 )
    {
        return;
    }
    
    wait 2;
    
    while ( true )
    {
        self waittill( "door_toggled" );
        
        foreach ( snakecam in self.nearbysnakecams )
        {
            if ( istrue( snakecam.disabled ) )
            {
                snakecam thread snakecam_toggle_enable_on_delay( var_6db508a257162414, 1 );
                continue;
            }
            
            snakecam thread snakecam_toggle_enable_on_delay( var_6db508a257162414, 0 );
        }
        
        wait 0.05;
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f61
// Size: 0x55
function snakecam_toggle_enable_on_delay( in_delay, toggle )
{
    if ( istrue( self.disable_delay ) )
    {
        return;
    }
    
    self.disable_delay = 1;
    
    if ( istrue( toggle ) )
    {
        self.disabled = 0;
    }
    else
    {
        self.disabled = 1;
    }
    
    wait in_delay;
    self.disable_delay = 0;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbe
// Size: 0x6a
function enable_snake_cams()
{
    wait 5;
    var_49c15445fdcb75ee = scripts\engine\utility::getstructarray( "snakecam_interaction", "script_noteworthy" );
    
    foreach ( var_aa8ac5c98f3a9029 in var_49c15445fdcb75ee )
    {
        var_aa8ac5c98f3a9029 thread function_94d8d166d09b75a5();
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3030
// Size: 0xac
function function_627b6c50a3e708a5()
{
    door_names = [ "scriptable_door_metal_04_flat_painted_mp_tan", "scriptable_door_metal_panel_03_right_mp", "door_wooden_hollow_mp_01_rnd", "scriptable_door_wooden_panel_03_painted_mp", "scriptable_door_metal_panel_03_left_mp", "scriptable_door_wooden_panel_mp_01_white", "scriptable_construction_doors_metal_b_02_mp", "scriptable_door_wooden_office_01_mp", "scriptable_door_metal_single_b_02_grey", "scriptable_door_wooden_hollow_mp_01", "scriptable_door_wooden_panel_mp_01", "scriptable_door_wooden_panel_03_painted_mp_tint", "scriptable_door_wood_ornate_01_green_double_r", "scriptable_door_wood_ornate_01_green_double_l" ];
    var_8c73c4add30bb4b2 = [];
    var_8c73c4add30bb4b2 = scripts\cp_mp\utility\scriptable_door_utility::scriptable_door_get_in_radius( self.origin, 100 );
    return var_8c73c4add30bb4b2;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30e5
// Size: 0xd0
function function_d25799279ec14c4c( var_aa8ac5c98f3a9029 )
{
    var_8c73c4add30bb4b2 = var_aa8ac5c98f3a9029 function_627b6c50a3e708a5();
    
    foreach ( escriptable in var_8c73c4add30bb4b2 )
    {
        if ( escriptable scriptableisdoor() )
        {
            escriptable scriptabledoorfreeze( 1 );
        }
    }
    
    wait 2.5;
    
    foreach ( escriptable in var_8c73c4add30bb4b2 )
    {
        if ( escriptable scriptableisdoor() && !istrue( escriptable.var_7b4b93daa27c204e ) )
        {
            escriptable scriptabledoorfreeze( 0 );
        }
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31bd
// Size: 0x25
function function_94d8d166d09b75a5()
{
    var_8c73c4add30bb4b2 = function_627b6c50a3e708a5();
    self.var_8c73c4add30bb4b2 = var_8c73c4add30bb4b2;
    thread disable_nearby_snake_cam_after_open();
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31ea
// Size: 0x212
function disable_nearby_snake_cam_after_open()
{
    self notify( "single_disable_nearby_snake_cam_after_open" );
    self endon( "single_disable_nearby_snake_cam_after_open" );
    var_6905e1cf687a2fd9 = 0;
    var_2c2ce74038f7c6cc = undefined;
    
    while ( !istrue( var_6905e1cf687a2fd9 ) )
    {
        var_6905e1cf687a2fd9 = 0;
        
        foreach ( door in self.var_8c73c4add30bb4b2 )
        {
            if ( !door scriptabledoorisclosed() )
            {
                var_6905e1cf687a2fd9 = 1;
                var_2c2ce74038f7c6cc = door;
            }
        }
        
        waitframe();
    }
    
    if ( !isdefined( var_2c2ce74038f7c6cc ) )
    {
        var_2c2ce74038f7c6cc = self.var_8c73c4add30bb4b2[ 0 ];
    }
    
    nearbyplayer = give_closest_player_nearby( var_2c2ce74038f7c6cc.origin, 14400 );
    
    if ( isdefined( nearbyplayer ) )
    {
        level notify( "door_event", var_2c2ce74038f7c6cc.origin, nearbyplayer );
    }
    else
    {
        level notify( "door_event", var_2c2ce74038f7c6cc.origin );
    }
    
    var_be00c97a9ae50349 = scripts\engine\utility::get_array_of_closest( var_2c2ce74038f7c6cc.origin, scripts\engine\utility::getstructarray( "snakecam_interaction", "script_noteworthy" ), [], 8, 256 );
    
    if ( isdefined( var_be00c97a9ae50349 ) )
    {
        foreach ( var_1d4d2fd74b4d40e0 in var_be00c97a9ae50349 )
        {
            var_1d4d2fd74b4d40e0.var_e05e65264655b8c0 = 1;
        }
    }
    
    var_cb5d60a767db7015 = getentitylessscriptablearray( "snakecam_interaction", undefined, self.origin, 128 );
    
    foreach ( snakecam in var_cb5d60a767db7015 )
    {
        snakecam.interaction_struct.var_e05e65264655b8c0 = 1;
        function_9f2b37dde1eda465( snakecam );
    }
    
    thread function_896fbddf3c463b8b( self.var_8c73c4add30bb4b2 );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3404
// Size: 0x1df
function function_896fbddf3c463b8b( var_b8d92ae3e433b054 )
{
    self notify( "single_watch_for_door_closed" );
    self endon( "single_watch_for_door_closed" );
    var_7e7b1ef3e4957761 = 0;
    
    while ( !istrue( var_7e7b1ef3e4957761 ) )
    {
        var_7e7b1ef3e4957761 = 1;
        
        foreach ( door in var_b8d92ae3e433b054 )
        {
            if ( !door scriptabledoorisclosed() )
            {
                var_7e7b1ef3e4957761 = 0;
            }
        }
        
        wait 0.5;
    }
    
    nearbyplayer = give_closest_player_nearby( self.origin, 17689 );
    
    if ( isdefined( nearbyplayer ) )
    {
        level notify( "door_event", self.origin, nearbyplayer );
    }
    else
    {
        level notify( "door_event", self.origin );
    }
    
    var_be00c97a9ae50349 = scripts\engine\utility::get_array_of_closest( self.origin, scripts\engine\utility::getstructarray( "snakecam_interaction", "script_noteworthy" ), [], 8, 256 );
    
    if ( isdefined( var_be00c97a9ae50349 ) )
    {
        foreach ( var_1d4d2fd74b4d40e0 in var_be00c97a9ae50349 )
        {
            var_1d4d2fd74b4d40e0.var_e05e65264655b8c0 = undefined;
        }
    }
    
    var_cb5d60a767db7015 = getentitylessscriptablearray( "snakecam_interaction", undefined, self.origin, 128 );
    
    foreach ( snakecam in var_cb5d60a767db7015 )
    {
        snakecam.interaction_struct.var_e05e65264655b8c0 = undefined;
        function_8cbc97ce93bb87f8( snakecam );
    }
    
    thread disable_nearby_snake_cam_after_open();
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35eb
// Size: 0x5e, Type: bool
function function_4697c6c047891c62( var_b3ba2d13fc1d315c )
{
    self endon( "death" );
    interactduration = 2000;
    var_b8cf204dd62d457f = gettime() + interactduration;
    
    while ( var_b8cf204dd62d457f > gettime() )
    {
        if ( !scripts\cp\utility::is_valid_player() )
        {
            continue;
        }
        
        if ( !self usebuttonpressed() )
        {
            return false;
        }
        
        wait 0.05;
    }
    
    return true;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3652
// Size: 0x2f, Type: bool
function _ontabletgiven( streakinfo, switchresult )
{
    _toggletabletallows( 1 );
    thread scripts\cp\equipment::_cleanuptabletallows();
    thread scripts\cp\equipment::_cancelputawayonuseend( streakinfo );
    return true;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x368a
// Size: 0xb
function _ontabletputaway( streakinfo )
{
    
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x369d
// Size: 0x75
function _waituntilinteractfinished( streakinfo )
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    interactstate = streakinfo.interactstate;
    
    if ( interactstate.state != 0 )
    {
        return;
    }
    
    self waittill( "interact_finished" );
    
    if ( interactstate.state == 2 )
    {
        successtime = 2;
        wait successtime;
    }
    
    self setclientomnvar( "ui_tablet_usb", 0 );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x371a
// Size: 0x93
function _toggletabletallows( var_da3010af8f6be463 )
{
    if ( isalive( self ) )
    {
        if ( var_da3010af8f6be463 )
        {
            val::set( "tablet", "allow_movement", 0 );
            val::set( "tablet", "allow_jump", 0 );
            val::set( "tablet", "usability", 0 );
            val::set( "tablet", "melee", 0 );
            val::set( "tablet", "offhand_weapons", 0 );
            val::set( "tablet", "killstreaks", 0 );
            return;
        }
        
        val::reset_all( "tablet" );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37b5
// Size: 0x5c
function function_9f2b37dde1eda465( snakecam )
{
    foreach ( player in level.players )
    {
        snakecam disablescriptableplayeruse( player );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3819
// Size: 0x5c
function function_8cbc97ce93bb87f8( snakecam )
{
    foreach ( player in level.players )
    {
        snakecam enablescriptableplayeruse( player );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x387d
// Size: 0x1a2, Type: bool
function function_45da058b481f8049( streakinfo, weapongivencallback, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, var_f6a32dcc4b19aad9, var_67a06b4ea269058e, waittime )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    weaponbasename = "ks_remote_device_mp";
    
    if ( isdefined( var_f6a32dcc4b19aad9 ) )
    {
        weaponbasename = var_f6a32dcc4b19aad9;
    }
    
    weaponobj = makeweapon( weaponbasename );
    deployanim = script_model#vm_ks_tablet_tap_raise;
    tabletanimlength = getanimlength( deployanim ) - 1.5;
    
    if ( isdefined( waittime ) )
    {
        tabletanimlength = waittime;
    }
    
    ondeploystart( streakinfo );
    val::set( "snakecam", "allow_movement", 0 );
    val::set( "snakecam", "allow_jump", 0 );
    val::set( "snakecam", "usability", 0 );
    val::set( "snakecam", "melee", 0 );
    val::set( "snakecam", "offhand_weapons", 0 );
    val::set( "snakecam", "killstreaks", 0 );
    switchresult = switchtodeployweapon( weaponobj, streakinfo, &function_67f13db1409ec06d, weapongivencallback, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b );
    
    if ( isdefined( self ) && scripts\cp_mp\utility\player_utility::_isalive() )
    {
        val::reset_all( "snakecam" );
    }
    
    if ( !istrue( switchresult ) )
    {
        ondeployfinished( streakinfo );
        
        if ( isdefined( self ) )
        {
            function_18288294b05cfd9f( 0, 1 );
        }
        
        return false;
    }
    
    animresult = function_2fe0097fb626c353( streakinfo, tabletanimlength, var_67a06b4ea269058e );
    ondeployfinished( streakinfo );
    return istrue( animresult );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a28
// Size: 0x3b
function function_97bb37170a0ac241( streakname, dofstartdelay )
{
    self playlocalsound( "iw9_snakecam_tablet" );
    self setclientomnvar( "ui_snakecam", 1 );
    
    if ( isdefined( dofstartdelay ) )
    {
        thread tabletdofset( dofstartdelay );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6b
// Size: 0x2b
function function_18288294b05cfd9f( var_375181444841ad, var_137355b56d092b3b )
{
    self setclientomnvar( "ui_snakecam", 0 );
    thread tabletdofset( var_375181444841ad, 1 );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9e
// Size: 0xf9, Type: bool
function function_2fe0097fb626c353( streakinfo, animlength, var_67a06b4ea269058e )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( !isdefined( var_67a06b4ea269058e ) )
    {
        var_67a06b4ea269058e = 1;
    }
    
    _freezecontrols( 1, undefined, "killstreakDeploy" );
    thread watchweapontabletstop( streakinfo );
    thread watchweapontabletcallinpos();
    function_97bb37170a0ac241( streakinfo.streakname, 0.75 );
    result = waittill_any_timeout_3( animlength, "death", "weapon_change", "cancel_all_killstreak_deployments" );
    function_18288294b05cfd9f( 0.325 );
    self notify( "ks_freeze_end" );
    _freezecontrols( 0, undefined, "killstreakDeploy" );
    
    if ( !isdefined( result ) || result != "timeout" || !self isonground() || self isonladder() )
    {
        streakinfo notify( "killstreak_finished_with_deploy_weapon" );
        self stoplocalsound( "mp_killstreak_tablet_gear" );
        self notify( "cancel_remote_sequence" );
        return false;
    }
    
    self notify( "deploy_weapon_anim_successful" );
    return true;
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3ba0
// Size: 0x77
function function_d81a74d075fe9a18( timedelay )
{
    self endon( "disconnect" );
    result = waittill_any_timeout_1( timedelay, "cancel_remote_sequence" );
    
    if ( !isdefined( result ) || result == "cancel_remote_sequence" )
    {
        return;
    }
    
    if ( scripts\cp_mp\utility\player_utility::_isalive() )
    {
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer( self, 1, 0.3 );
        result = waittill_any_timeout_1( 0.7, "death" );
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer( self, 0, 0.3 );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c1f
// Size: 0x30e
function script_model_anims()
{
    level.scr_animtree[ "snakecam" ] = #script_model;
    level.scr_animtree[ "snakecam_prop" ] = #script_model;
    level.scr_anim[ "snakecam_prop" ][ "stand_enter" ] = script_model#iw9_mp_equip_snakecam_in_stand;
    level.scr_anim[ "snakecam_prop" ][ "stand_exit" ] = script_model#iw9_mp_equip_snakecam_out_stand;
    level.scr_anim[ "snakecam_prop" ][ "crouch_enter" ] = script_model#iw9_mp_equip_snakecam_in_crouch;
    level.scr_anim[ "snakecam_prop" ][ "crouch_exit" ] = script_model#iw9_mp_equip_snakecam_out_crouch;
    level.scr_anim[ "snakecam_prop" ][ "prone_enter" ] = script_model#iw9_mp_equip_snakecam_in_prone;
    level.scr_anim[ "snakecam_prop" ][ "prone_exit" ] = script_model#iw9_mp_equip_snakecam_out_prone;
    level.scr_anim[ "snakecam_prop" ][ "crouch_idle" ] = script_model#iw9_mp_equip_snakecam_loop;
    level.scr_anim[ "snakecam_prop" ][ "prone_idle" ] = script_model#iw9_mp_equip_snakecam_loop_prone;
    level.scr_anim[ "snakecam" ][ "stand_enter" ] = script_model#iw9_mp_equip_snakecam_in_stand;
    level.scr_eventanim[ "snakecam" ][ "stand_enter" ] = %"hash_7283c8c30ec9aee7";
    level.scr_anim[ "snakecam" ][ "stand_exit" ] = script_model#iw9_mp_equip_snakecam_out_stand;
    level.scr_eventanim[ "snakecam" ][ "stand_exit" ] = %"hash_5d94e132bbb50443";
    level.scr_anim[ "snakecam" ][ "crouch_enter" ] = script_model#iw9_mp_equip_snakecam_in_crouch;
    level.scr_eventanim[ "snakecam" ][ "crouch_enter" ] = %"hash_4162f1e08be91a85";
    level.scr_anim[ "snakecam" ][ "crouch_exit" ] = script_model#iw9_mp_equip_snakecam_out_crouch;
    level.scr_eventanim[ "snakecam" ][ "crouch_exit" ] = %"hash_3a12e1a57d8a783d";
    level.scr_anim[ "snakecam" ][ "prone_enter" ] = script_model#iw9_mp_equip_snakecam_in_prone;
    level.scr_eventanim[ "snakecam" ][ "prone_enter" ] = %"hash_7553c7aaecab38bd";
    level.scr_anim[ "snakecam" ][ "prone_exit" ] = script_model#iw9_mp_equip_snakecam_out_prone;
    level.scr_eventanim[ "snakecam" ][ "prone_exit" ] = %"hash_5dcfb66baa4d4695";
    level.scr_anim[ "snakecam" ][ "crouch_idle" ] = script_model#iw9_mp_equip_snakecam_loop;
    level.scr_eventanim[ "snakecam" ][ "crouch_idle" ] = %"hash_4f734887963b1b2b";
    level.scr_anim[ "snakecam" ][ "prone_idle" ] = script_model#iw9_mp_equip_snakecam_loop_prone;
    level.scr_eventanim[ "snakecam" ][ "prone_idle" ] = %"hash_2ad5add102a9be03";
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f35
// Size: 0x32
function function_37b3487e37675cda( player )
{
    player endon( "death_or_disconnect" );
    player endon( "interact_interrupt" );
    player scripts\cp\cp_anim::anim_player_solo( player, player.player_rig, "snakecam_start" );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f6f
// Size: 0x4e
function function_d6b74bdc3c9e74f( player, instance )
{
    player endon( "death_or_disconnect" );
    player endon( "interact_begin_exit" );
    player endon( "interact_cancelled" );
    
    while ( scripts\cp\utility\player::isreallyalive( player ) )
    {
        player scripts\cp\cp_anim::anim_player_solo( player, player.player_rig, "snakecam_idle" );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fc5
// Size: 0x3c
function function_35eaf8086190479a( player )
{
    player endon( "death_or_disconnect" );
    player endon( "interact_interrupt" );
    
    if ( scripts\cp\utility\player::isreallyalive( player ) )
    {
        player scripts\cp\cp_anim::anim_player_solo( player, player.player_rig, "snakecam_exit" );
    }
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4009
// Size: 0x7e
function watchplayerdeathordisconnect( player )
{
    player endon( "interact_cancelled" );
    player endon( "interact_finished" );
    player scripts\engine\utility::waittill_any_2( "death_or_disconnect", "last_stand_start" );
    player notify( "interact_interrupt" );
    player stopanimscriptsceneevent();
    
    if ( isdefined( player.linktoent ) )
    {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
    }
    
    player notify( "remove_rig" );
    player function_f7cdc23e1c9c520f( 1 );
}

// Namespace cp_snakecam / scripts\cp\cp_snakecam
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x408f
// Size: 0x104
function function_f7cdc23e1c9c520f( isallowed )
{
    if ( !isallowed )
    {
        val::set( "snakecam", "allow_jump", 0 );
        val::set( "snakecam", "gesture", 0 );
        val::set( "snakecam", "melee", 0 );
        val::set( "snakecam", "mantle", 0 );
        val::set( "snakecam", "offhand_weapons", 0 );
        val::set( "snakecam", "allow_movement", 0 );
        val::set( "snakecam", "sprint", 0 );
        val::set( "snakecam", "fire", 0 );
        val::set( "snakecam", "reload", 0 );
        val::set( "snakecam", "weapon_pickup", 0 );
        val::set( "snakecam", "weapon_switch", 0 );
        scripts\common\values::set( "snakecam", "offhand_weapons", 0 );
        self function_35501b42058d4de9();
        return;
    }
    
    val::reset_all( "typing" );
    self function_bb04491d50d9e43e();
}

