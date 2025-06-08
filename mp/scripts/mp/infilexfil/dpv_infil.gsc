#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\cp_mp\utility\audio_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\anim;
#using scripts\mp\class;
#using scripts\mp\flags;
#using scripts\mp\infilexfil\infilexfil;
#using scripts\mp\music_and_dialog;
#using scripts\mp\utility\infilexfil;
#using scripts\mp\utility\player;

#namespace dpv_infil;

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 1
// Checksum 0x0, Offset: 0x5a1
// Size: 0x9d
function function_3d9bf5e0adbc2910( subtype )
{
    function_f1aed36ab4598ea( "dpv_infil" );
    thread function_e5ac12d9519a54c2();
    
    /#
        setdevdvarifuninitialized( @"hash_3dc902e1a71dd25d", 0 );
    #/
    
    initanims( subtype );
    var_453e4fc2c649fea4 = [];
    var_453e4fc2c649fea4[ 0 ] = [ 0 ];
    var_453e4fc2c649fea4[ 1 ] = [ 1 ];
    var_453e4fc2c649fea4[ 2 ] = [ 2, 3, 4, 5 ];
    thread infil_add( "infil_dpv", subtype, 6, 4, var_453e4fc2c649fea4, &function_9f74024feae9f401, &function_e4578a3964ad56e3, &function_958a84b80a7fe077 );
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 4
// Checksum 0x0, Offset: 0x646
// Size: 0xb2
function function_9f74024feae9f401( team, target, subtype, originalsubtype )
{
    scene_node = getstruct( target, "targetname" );
    infil = spawn( "script_origin", scene_node.origin );
    
    if ( !isdefined( scene_node.angles ) )
    {
        scene_node.angles = ( 0, 0, 0 );
    }
    
    infil.angles = scene_node.angles;
    infil.scene_node = scene_node;
    infil thread infilthink( team, subtype );
    return infil;
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 1
// Checksum 0x0, Offset: 0x701
// Size: 0x32
function function_e4578a3964ad56e3( subtype )
{
    animlength = getanimlength( level.scr_anim[ "slot_0" ][ "dpv_infil" ] );
    return animlength;
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 2
// Checksum 0x0, Offset: 0x73c
// Size: 0x34a
function function_958a84b80a7fe077( infil, spot_index )
{
    self endon( "player_free_spot" );
    thread player_infil_end();
    
    if ( isplayer( self ) )
    {
        self setclienttriggeraudiozone( "jup_preinfil_generic", 1 );
    }
    
    thread infil_radio_idle( infil );
    
    switch ( spot_index )
    {
        case 0:
            infil.linktoent = infil.dpv1;
            break;
        case 1:
            infil.linktoent = infil.dpv2;
            break;
        case 2:
        case 4:
            infil.linktoent = infil.dpv1;
            break;
        case 3:
        case 5:
            infil.linktoent = infil.dpv2;
            break;
    }
    
    spawnpos = infil.linktoent gettagorigin( "tag_body_animate" );
    spawnang = infil.linktoent gettagangles( "tag_body_animate" );
    thread infil_player_rig_updated( "slot_" + spot_index, spawnpos, spawnang );
    self.player_rig linkto( infil.linktoent, "tag_body_animate" );
    self setdemeanorviewmodel( "safe", "iw8_ges_demeanor_safe_van" );
    
    if ( isdefined( level.var_e05f516fd742e815 ) )
    {
        self visionsetnakedforplayer( level.var_baff91a2ae7e9259, 0 );
    }
    else
    {
        self visionsetnakedforplayer( "mp_core_infil_2", 0 );
    }
    
    self function_451319f93d30ebe5( %"hash_4887aa19270bf8c4" );
    self.player_rig.weapon_state_func = &handleweaponstatenotetrack;
    thread player_disconnect();
    level waittill( "start_scene" );
    
    if ( isplayer( self ) )
    {
        self setclienttriggeraudiozone( "jup_infil_generic" );
    }
    
    thread scripts\mp\music_and_dialog::function_3aa69e0e6827ce5( "jup_mp_infil" );
    self lerpfov( 65, 0 );
    self setcinematicmotionoverride( "disabled" );
    self lerpviewangleclamp( 1, 0.25, 0.25, 15, 15, 30, 5 );
    self lerpfovscalefactor( 0, 0 );
    thread resetfov();
    infil.linktoent anim_player_solo( self, self.player_rig, "dpv_infil", "tag_body_animate" );
    scripts\mp\class::unblockclasschange();
    
    if ( isdefined( level.scr_viewmodelanim[ self.animname ] ) && isdefined( level.scr_viewmodelanim[ self.animname ][ "dpv_infil" + "_" + infil.subtype + "_intro" ] ) )
    {
        setdvar( @"hash_7eb1641737ab83b7", 0 );
    }
    
    thread clear_infil_ambient_zone();
    
    if ( isdefined( self.player_rig ) && self.player_rig islinked() )
    {
        self.player_rig unlink();
    }
    
    self visionsetnakedforplayer( "", 0.75 );
    self function_df8fad503896462( %"hash_4887aa19270bf8c4" );
    self setdemeanorviewmodel( "normal" );
    self clearcinematicmotionoverride();
    self disablephysicaldepthoffieldscripting();
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 0
// Checksum 0x0, Offset: 0xa8e
// Size: 0x27
function resetfov()
{
    level waittill( "infil_countdown_show" );
    wait 2;
    self lerpfovbypreset( "default_2seconds" );
    self lerpfovscalefactor( 1, 2 );
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 0
// Checksum 0x0, Offset: 0xabd
// Size: 0x3c
function clear_infil_ambient_zone()
{
    self endon( "disconnect" );
    level waittill( "prematch_over" );
    wait 1;
    
    if ( isdefined( self.submix ) )
    {
        self clearsoundsubmix( self.submix, 2 );
    }
    
    self clearclienttriggeraudiozone( 2 );
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 0
// Checksum 0x0, Offset: 0xb01
// Size: 0x53
function player_infil_end()
{
    self endon( "disconnect" );
    level waittill( "prematch_over" );
    self notify( "remove_rig" );
    self clearclienttriggeraudiozone( 1 );
    self lerpfovbypreset( "default_2seconds" );
    self lerpfovscalefactor( 1, 2 );
    scripts\mp\utility\player::setdof_default();
    setdvar( @"hash_7eb1641737ab83b7", 0 );
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 0
// Checksum 0x0, Offset: 0xb5c
// Size: 0x4c
function player_disconnect()
{
    level endon( "prematch_over" );
    self waittill( "disconnect" );
    
    if ( isdefined( self ) )
    {
        self visionsetnakedforplayer( "" );
        self clearclienttriggeraudiozone( 0 );
        self lerpfovbypreset( "default" );
        self setviewmodeldepthoffield( 0, 0, 18 );
        scripts\mp\utility\player::setdof_default();
    }
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 2
// Checksum 0x0, Offset: 0xbb0
// Size: 0xda
function infilthink( team, scene_name )
{
    foreach ( ent in getentarray( "infil_delete", "script_noteworthy" ) )
    {
        ent delete();
    }
    
    thread vehiclethink( team, self.scene_node, scene_name );
    level waittill( "infil_started" );
    setdvar( @"r_spotlightentityshadows", 1 );
    level notify( "start_scene" );
    level waittill( "prematch_over" );
    setdvar( @"r_spotlightentityshadows", 0 );
    
    while ( isdefined( self.actors ) )
    {
        waitframe();
    }
    
    level.infilsactive--;
    self delete();
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 4
// Checksum 0x0, Offset: 0xc92
// Size: 0x135
function vehiclethink( team, scene_node, scene_name, extra_crew )
{
    dpv1 = function_bac3cccc0e6c67a6( scene_node, team, scene_name, "veh_jup_mil_buggy_orav_infil_igc", "dpv1" );
    dpv2 = function_bac3cccc0e6c67a6( scene_node, team, scene_name, "veh_jup_mil_buggy_orav_infil_igc", "dpv2" );
    self.dpv1 = dpv1;
    self.dpv2 = dpv2;
    self.dpv1 vehicle_turnengineoff();
    self.dpv2 vehicle_turnengineoff();
    self.dpv1 thread function_f4c5ce4b428ef494();
    self.dpv2 thread function_8608efd234142efa();
    level waittill( "infil_started" );
    
    if ( !isdefined( self.path ) )
    {
        anim_first_frame_solo( dpv1, "dpv_infil" );
        anim_first_frame_solo( dpv2, "dpv_infil" );
    }
    
    thread anim_single_solo( dpv1, "dpv_infil" );
    thread anim_single_solo( dpv2, "dpv_infil" );
    thread function_51293c8505f2ea4e( scene_node, dpv1, dpv2, getanimlength( level.scr_anim[ "dpv1" ][ "dpv_infil" ] ), "dpv1", "dpv_infil" );
    level waittill( "prematch_over" );
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 1
// Checksum 0x0, Offset: 0xdcf
// Size: 0x285
function initanims( subtype )
{
    script_model_anims( subtype );
    vehicles_anims( subtype );
    addnotetrack_customfunction( "slot_0", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_1", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_2", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_3", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_4", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_5", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_0", "free_look", &player_free_look, "dpv_infil" );
    addnotetrack_customfunction( "slot_1", "free_look", &player_free_look, "dpv_infil" );
    addnotetrack_customfunction( "slot_2", "free_look", &player_free_look, "dpv_infil" );
    addnotetrack_customfunction( "slot_3", "free_look", &player_free_look, "dpv_infil" );
    addnotetrack_customfunction( "slot_4", "free_look", &player_free_look, "dpv_infil" );
    addnotetrack_customfunction( "slot_5", "free_look", &player_free_look, "dpv_infil" );
    addnotetrack_customfunction( "slot_0", "shake_on", &rumble_low, "dpv_infil" );
    addnotetrack_customfunction( "slot_1", "shake_on", &rumble_low, "dpv_infil" );
    addnotetrack_customfunction( "slot_2", "shake_on", &rumble_low, "dpv_infil" );
    addnotetrack_customfunction( "slot_3", "shake_on", &rumble_low, "dpv_infil" );
    addnotetrack_customfunction( "slot_4", "shake_on", &rumble_low, "dpv_infil" );
    addnotetrack_customfunction( "slot_5", "shake_on", &rumble_low, "dpv_infil" );
    addnotetrack_customfunction( "slot_0", "shake_running", &cam_shake_running, "dpv_infil" );
    addnotetrack_customfunction( "slot_1", "shake_running", &cam_shake_running, "dpv_infil" );
    addnotetrack_customfunction( "slot_2", "shake_running", &cam_shake_running, "dpv_infil" );
    addnotetrack_customfunction( "slot_3", "shake_running", &cam_shake_running, "dpv_infil" );
    addnotetrack_customfunction( "slot_4", "shake_running", &cam_shake_running, "dpv_infil" );
    addnotetrack_customfunction( "slot_5", "shake_running", &cam_shake_running, "dpv_infil" );
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 1
// Checksum 0x0, Offset: 0x105c
// Size: 0x3ef
function script_model_anims( subtype )
{
    switch ( subtype )
    {
        case #"hash_6829ee5abc10c38b":
            level.scr_animtree[ "slot_0" ] = #script_model;
            level.scr_anim[ "slot_0" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_0;
            level.scr_eventanim[ "slot_0" ][ "dpv_infil" ] = %"hash_69adc9d1d851b0c3";
            level.scr_animtree[ "slot_1" ] = #script_model;
            level.scr_anim[ "slot_1" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_1;
            level.scr_eventanim[ "slot_1" ][ "dpv_infil" ] = %"hash_69adcad1d851b276";
            level.scr_animtree[ "slot_2" ] = #script_model;
            level.scr_anim[ "slot_2" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_2;
            level.scr_eventanim[ "slot_2" ][ "dpv_infil" ] = %"hash_69adcbd1d851b429";
            level.scr_animtree[ "slot_3" ] = #script_model;
            level.scr_anim[ "slot_3" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_3;
            level.scr_eventanim[ "slot_3" ][ "dpv_infil" ] = %"hash_69adccd1d851b5dc";
            level.scr_animtree[ "slot_4" ] = #script_model;
            level.scr_anim[ "slot_4" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_4;
            level.scr_eventanim[ "slot_4" ][ "dpv_infil" ] = %"hash_69adcdd1d851b78f";
            level.scr_animtree[ "slot_5" ] = #script_model;
            level.scr_anim[ "slot_5" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_5;
            level.scr_eventanim[ "slot_5" ][ "dpv_infil" ] = %"hash_69adced1d851b942";
        case #"hash_1cc79b02710cab23":
            level.scr_animtree[ "slot_0" ] = #script_model;
            level.scr_anim[ "slot_0" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_0;
            level.scr_eventanim[ "slot_0" ][ "dpv_infil" ] = %"hash_69adc9d1d851b0c3";
            level.scr_animtree[ "slot_1" ] = #script_model;
            level.scr_anim[ "slot_1" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_1;
            level.scr_eventanim[ "slot_1" ][ "dpv_infil" ] = %"hash_69adcad1d851b276";
            level.scr_animtree[ "slot_2" ] = #script_model;
            level.scr_anim[ "slot_2" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_2;
            level.scr_eventanim[ "slot_2" ][ "dpv_infil" ] = %"hash_69adcbd1d851b429";
            level.scr_animtree[ "slot_3" ] = #script_model;
            level.scr_anim[ "slot_3" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_3;
            level.scr_eventanim[ "slot_3" ][ "dpv_infil" ] = %"hash_69adccd1d851b5dc";
            level.scr_animtree[ "slot_4" ] = #script_model;
            level.scr_anim[ "slot_4" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_4;
            level.scr_eventanim[ "slot_4" ][ "dpv_infil" ] = %"hash_69adcdd1d851b78f";
            level.scr_animtree[ "slot_5" ] = #script_model;
            level.scr_anim[ "slot_5" ][ "dpv_infil" ] = script_model#jup_mp_infil_afghan_guy_5;
            level.scr_eventanim[ "slot_5" ][ "dpv_infil" ] = %"hash_69adced1d851b942";
            break;
    }
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 1
// Checksum 0x0, Offset: 0x1453
// Size: 0x91
function vehicles_anims( subtype )
{
    switch ( subtype )
    {
        case #"hash_1cc79b02710cab23":
        case #"hash_6829ee5abc10c38b":
            level.scr_animtree[ "dpv1" ] = #mp_vehicles_always_loaded;
            level.scr_anim[ "dpv1" ][ "dpv_infil" ] = mp_vehicles_always_loaded#jup_mp_infil_afghan_vehicle_01;
            level.scr_animtree[ "dpv2" ] = #mp_vehicles_always_loaded;
            level.scr_anim[ "dpv2" ][ "dpv_infil" ] = mp_vehicles_always_loaded#jup_mp_infil_afghan_vehicle_02;
            break;
    }
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 6
// Checksum 0x0, Offset: 0x14ec
// Size: 0x152
function function_bac3cccc0e6c67a6( scene_node, team, scene_name, model, animname, vehicle )
{
    spawnpos = scene_node.origin;
    spawnang = scene_node.angles;
    
    if ( isdefined( self.path ) )
    {
        spawnpos = self.path.origin;
        spawnang = self.path.angles;
    }
    
    var_ab5cd311f5dc80a6 = "veh_jup_mil_lnd_buggy_orav_physics_mp";
    vehicle = spawnvehicle( "veh_jup_mil_buggy_orav_infil_igc", scene_name, var_ab5cd311f5dc80a6, spawnpos, spawnang );
    vehicle setvehicleteam( team );
    vehicle setcandamage( 0 );
    
    if ( vehicle vehicle_isphysveh() )
    {
        vehicle function_247ad6a91f6a4ffe( 1 );
        vehicle vehphys_forcekeyframedmotion();
    }
    else
    {
        vehicle notsolid();
    }
    
    origin_angles = vehicle gettagangles( "tag_origin" );
    animate_angles = vehicle gettagangles( "tag_body_animate" );
    vehicle.animname = animname;
    self.linktoent = vehicle;
    vehicle.infil = self;
    vehicle vehicle_turnengineoff();
    vehicle function_97e11a84480635bc( 1 );
    vehicle vehicleshowonminimap( 0 );
    return vehicle;
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 1
// Checksum 0x0, Offset: 0x1647
// Size: 0xde
function infil_radio_idle( infil )
{
    if ( !flag( "infil_started" ) )
    {
        if ( isplayer( self ) )
        {
            if ( !isdefined( self ) )
            {
                return;
            }
            
            radio_sfx = spawn( "script_origin", ( 0, 0, 0 ) );
            radio_sfx showonlytoplayer( self );
            var_9742aa030e46f6c0 = spawn( "script_origin", ( 0, 0, 0 ) );
            var_9742aa030e46f6c0 showonlytoplayer( self );
            radio_sfx playloopsound( "dx_mpo_ukop_radio_chatter" );
            var_9742aa030e46f6c0 playsound( "jup_infil_dpv_preinfil_start" );
            var_9742aa030e46f6c0 playloopsound( "jup_infil_dpv_preinfil_lp" );
            function_7330aa81e1f66e19( "infil_started", "death_or_disconnect" );
            wait 1;
            radio_sfx stoploopsound( "dx_mpo_ukop_radio_chatter" );
            var_9742aa030e46f6c0 stoploopsound( "jup_infil_dpv_preinfil_lp" );
            var_9742aa030e46f6c0 delete();
            radio_sfx delete();
        }
        
        return;
    }
    
    return;
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 2
// Checksum 0x0, Offset: 0x172d
// Size: 0x2a
function function_7330aa81e1f66e19( var_8068764aee94f2f4, playerstring )
{
    assert( isdefined( var_8068764aee94f2f4 ) );
    
    if ( isdefined( playerstring ) )
    {
        self endon( playerstring );
    }
    
    level waittill( var_8068764aee94f2f4 );
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 0
// Checksum 0x0, Offset: 0x175f
// Size: 0x19
function function_e5ac12d9519a54c2()
{
    level waittill( "prematch_over" );
    wait 51;
    function_f4e0ff5cb899686d( "dpv_infil" );
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 0
// Checksum 0x0, Offset: 0x1780
// Size: 0x8d
function function_f4c5ce4b428ef494()
{
    self endon( "death_or_disconnect" );
    var_d03b2a7d8e76d839 = spawn( "script_model", ( 0, 0, 0 ) );
    level waittill( "infil_started" );
    waitframe();
    var_d03b2a7d8e76d839 linkto( self, "tag_origin", ( 0, 0, 15 ), ( 0, 0, 0 ) );
    waitframe();
    var_d03b2a7d8e76d839 playsoundonmovingent( "jup_infil_dpv_vehicle_01_engine" );
    wait 9.4;
    var_d03b2a7d8e76d839 playsound( "jup_infil_dpv_vehicle_01_brake" );
    level waittill( "prematch_over" );
    wait 1;
    var_d03b2a7d8e76d839 delete();
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 0
// Checksum 0x0, Offset: 0x1815
// Size: 0x8d
function function_8608efd234142efa()
{
    self endon( "death_or_disconnect" );
    var_739b446e1e725905 = spawn( "script_model", ( 0, 0, 0 ) );
    level waittill( "infil_started" );
    waitframe();
    var_739b446e1e725905 linkto( self, "tag_origin", ( 0, 0, 15 ), ( 0, 0, 0 ) );
    waitframe();
    var_739b446e1e725905 playsoundonmovingent( "jup_infil_dpv_vehicle_02_engine" );
    wait 9.4;
    var_739b446e1e725905 playsound( "jup_infil_dpv_vehicle_02_brake" );
    level waittill( "prematch_over" );
    wait 1;
    var_739b446e1e725905 delete();
}

// Namespace dpv_infil / scripts\mp\infilexfil\dpv_infil
// Params 0
// Checksum 0x0, Offset: 0x18aa
// Size: 0x13
function function_6158ef142e9bd640()
{
    wait 27;
    self visionsetnakedforplayer( "mp_core_infil_2", 3 );
}

