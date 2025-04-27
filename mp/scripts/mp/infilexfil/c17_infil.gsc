#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\cp_mp\parachute;
#using scripts\cp_mp\utility\audio_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\anim;
#using scripts\mp\class;
#using scripts\mp\flags;
#using scripts\mp\infilexfil\infilexfil;
#using scripts\mp\utility\infilexfil;
#using scripts\mp\utility\player;
#using scripts\mp\utility\teams;

#namespace c17_infil;

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa52
// Size: 0xa7
function function_2f340eb1a058fd55( subtype )
{
    function_f1aed36ab4598ea( "c17_infil" );
    thread function_725375206755d1c3();
    
    /#
        setdevdvarifuninitialized( @"hash_3dc902e1a71dd25d", 0 );
    #/
    
    var_453e4fc2c649fea4 = [];
    var_453e4fc2c649fea4[ 0 ] = [ 3 ];
    var_453e4fc2c649fea4[ 1 ] = [ 2 ];
    var_453e4fc2c649fea4[ 2 ] = [ 5 ];
    var_453e4fc2c649fea4[ 3 ] = [ 1 ];
    var_453e4fc2c649fea4[ 4 ] = [ 0 ];
    var_453e4fc2c649fea4[ 5 ] = [ 4 ];
    thread infil_add( "infil_c17", subtype, 6, 4, var_453e4fc2c649fea4, &function_d888327084c9f8e, &function_33ceeca5ce1d876a, &function_15c741a7b627d900 );
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb01
// Size: 0x10a
function function_d888327084c9f8e( team, target, subtype, originalsubtype )
{
    initanims( subtype, team, originalsubtype );
    scene_node = getstruct( target, "targetname" );
    postlaunchscenenodecorrection( scene_node, team, subtype, originalsubtype );
    infil = spawn( "script_origin", scene_node.origin );
    infil.angles = scene_node.angles;
    infil.start_node = scene_node;
    
    if ( isdefined( scene_node.target ) )
    {
        infil.introdur = function_33ceeca5ce1d876a( subtype );
        infil.path = scene_node;
        infil.end_node = getstruct( scene_node.target, "targetname" );
    }
    
    infil.subtype = subtype;
    infil.originalsubtype = originalsubtype;
    infil thread infilthink( team, subtype );
    return infil;
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xc14
// Size: 0x23
function postlaunchscenenodecorrection( scene_node, team, subtype, originalsubtype )
{
    
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3f
// Size: 0x7a
function function_33ceeca5ce1d876a( subtype )
{
    animlength = getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_1" ] ) + getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_2" ] ) + getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_3" ] );
    return animlength;
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcc2
// Size: 0x3e6
function function_15c741a7b627d900( infil, spot_index )
{
    self endon( "player_free_spot" );
    
    if ( isplayer( self ) )
    {
        self setclienttriggeraudiozone( "jup_preinfil_generic", 1 );
    }
    
    thread infil_radio_idle( infil );
    thread player_infil_end();
    spawnpos = infil.linktoent gettagorigin( "tag_origin_animate" );
    spawnang = infil.linktoent gettagangles( "tag_origin_animate" );
    
    if ( spot_index == 5 && isdefined( self.operatorcustomization ) && isdefined( self.operatorcustomization.gender ) && self.operatorcustomization.gender == "female" )
    {
        thread infil_player_rig_updated( "slot_" + spot_index + "_female", spawnpos, spawnang );
    }
    else
    {
        thread infil_player_rig_updated( "slot_" + spot_index, spawnpos, spawnang );
    }
    
    self setdemeanorviewmodel( "safe", "iw8_ges_demeanor_safe_heli" );
    self lerpfovbypreset( "80_instant" );
    self lerpfovscalefactor( 0, 0 );
    self visionsetnakedforplayer( "mp_core_infil_2", 0 );
    thread player_disconnect();
    self.player_rig linkto( infil.linktoent, "tag_origin_animate" );
    gameflagwait( "infil_started" );
    self cameraunlink();
    
    if ( isdefined( self.animname ) && !isai( self ) )
    {
        self setclienttriggeraudiozone( "jup_infil_generic" );
        self playlocalsound( "jup_infil_c17_shot_01_lr" );
    }
    
    infil.linktoent anim_first_frame_solo( self.player_rig, "c17_infil" + "_1", "tag_origin_animate" );
    self setcinematicmotionoverride( "disabled" );
    self lerpviewangleclamp( 1, 0.25, 0.25, 40, 40, 15, 5 );
    thread clear_infil_ambient_zone();
    thread scripts\mp\infilexfil\infilexfil::function_d41cba513a03d958( 4 );
    play_xcam( infil.linktoent, "tag_origin_animate", level.scr_xcam[ "camera" ][ "c17_infil" + "_1" ] );
    animlength = getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_1" ] );
    wait animlength;
    thread function_5994f877fc793456( 2 );
    play_xcam( infil.linktoent, "tag_origin_animate", level.scr_xcam[ "camera" ][ "c17_infil" + "_2" ] );
    infil.linktoent thread anim_player_solo( self, self.player_rig, "c17_infil" + "_1", "tag_origin_animate" );
    animlength = getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_2" ] );
    wait animlength;
    thread function_5994f877fc793456( 3 );
    play_xcam( infil.linktoent, "tag_origin_animate", level.scr_xcam[ "camera" ][ "c17_infil" + "_3" ] );
    infil.linktoent thread anim_player_solo( self, self.player_rig, "c17_infil" + "_2", "tag_origin_animate" );
    animlength = getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_3" ] );
    thread scripts\mp\class::unblockclasschange();
    self lerpfovscalefactor( 1, 2 );
    self visionsetnakedforplayer( "", 0.75 );
    self setdemeanorviewmodel( "normal" );
    self clearcinematicmotionoverride();
    self disablephysicaldepthoffieldscripting();
    wait animlength - 0.5;
    scripts\cp_mp\utility\game_utility::function_852712268d005332( self, 1, 0.5 );
    level waittill( "prematch_done" );
    function_36154e36d2455566();
    wait 1;
    scripts\cp_mp\utility\game_utility::function_852712268d005332( self, 0, 1 );
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10b0
// Size: 0x4a
function function_5994f877fc793456( var_ee69967fa93826fc )
{
    if ( var_ee69967fa93826fc == 1 )
    {
        self playlocalsound( "jup_infil_c17_shot_01_lr" );
        return;
    }
    
    if ( var_ee69967fa93826fc == 2 )
    {
        self playlocalsound( "jup_infil_c17_shot_02_lr" );
        return;
    }
    
    if ( var_ee69967fa93826fc == 3 )
    {
        self playlocalsound( "jup_infil_c17_shot_03_lr" );
    }
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1102
// Size: 0xb3
function function_36154e36d2455566()
{
    self stopxcam();
    self unlink();
    self cameradefault();
    deploy_node = getstruct( "deploy_node", "targetname" );
    jumpangles = ( 30, 195, 0 );
    
    if ( isdefined( deploy_node ) )
    {
        var_202c845c343b3cea = getdvarfloat( @"hash_2ad53dff8b4133b3", 256 );
        var_435fa2dd84aa96ea = getrandompointincircle( deploy_node.origin, var_202c845c343b3cea );
        jumpangles = deploy_node.angles;
        self setorigin( var_435fa2dd84aa96ea, 1 );
    }
    
    self setplayerangles( jumpangles );
    self skydive_beginfreefall();
    scripts\cp_mp\parachute::enablemanualpullchute();
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11bd
// Size: 0x51
function getrandompointincircle( origin, radius )
{
    randomangle = randomfloat( 360 );
    offset = ( radius * cos( randomangle ), radius * sin( randomangle ), 0 );
    point = origin + offset;
    return point;
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1217
// Size: 0x3c
function clear_infil_ambient_zone()
{
    self endon( "disconnect" );
    level waittill( "prematch_over" );
    wait 1;
    
    if ( isdefined( self.submix ) )
    {
        self clearsoundsubmix( self.submix, 5 );
    }
    
    self clearclienttriggeraudiozone( 2 );
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125b
// Size: 0x38
function player_infil_end()
{
    self endon( "disconnect" );
    level waittill( "prematch_over" );
    self notify( "remove_rig" );
    self clearclienttriggeraudiozone( 1 );
    self lerpfovbypreset( "default_2seconds" );
    scripts\mp\utility\player::setdof_default();
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x129b
// Size: 0xcd
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
            
            var_9742aa030e46f6c0 = spawn( "script_origin", ( 0, 0, 0 ) );
            var_9742aa030e46f6c0 showonlytoplayer( self );
            radio_sfx = spawn( "script_origin", ( 0, 0, 0 ) );
            radio_sfx showonlytoplayer( self );
            var_9742aa030e46f6c0 playloopsound( "jup_infil_c17_preinfil_lp" );
            radio_sfx playloopsound( "dx_mpo_ukop_radio_chatter" );
            function_7330aa81e1f66e19( "infil_started", "death_or_disconnect" );
            wait 1;
            var_9742aa030e46f6c0 stoploopsound();
            radio_sfx stoploopsound( "dx_mpo_ukop_radio_chatter" );
            var_9742aa030e46f6c0 delete();
            radio_sfx delete();
        }
        
        return;
    }
    
    return;
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1370
// Size: 0x2e
function function_7330aa81e1f66e19( var_8068764aee94f2f4, playerstring )
{
    assert( isdefined( var_8068764aee94f2f4 ) );
    
    if ( isdefined( playerstring ) )
    {
        self endon( playerstring );
    }
    
    gameflagwait( var_8068764aee94f2f4 );
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13a6
// Size: 0x4c
function player_disconnect()
{
    level endon( "prematch_over" );
    self waittill( "death_or_disconnect" );
    
    if ( isdefined( self ) )
    {
        self visionsetnakedforplayer( "" );
        self clearclienttriggeraudiozone( 0 );
        self lerpfovbypreset( "default" );
        self setviewmodeldepthoffield( 0, 0, 18 );
        scripts\mp\utility\player::setdof_default();
    }
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13fa
// Size: 0x135
function infilthink( team, scene_name )
{
    var_e026a614f7467557 = getdvarfloat( @"hash_ea4c44a08cd23d5d", 0.2 );
    
    foreach ( ent in getentarray( "infil_delete", "script_noteworthy" ) )
    {
        ent delete();
    }
    
    thread vehiclethink( team, self.start_node, scene_name );
    thread actorthink();
    gameflagwait( "infil_started" );
    setdvar( @"r_spotlightentityshadows", 1 );
    setdvar( @"hash_ea4c44a08cd23d5d", 1 );
    level notify( "start_scene" );
    level waittill( "prematch_over" );
    setdvar( @"r_spotlightentityshadows", 0 );
    setdvar( @"hash_ea4c44a08cd23d5d", var_e026a614f7467557 );
    
    while ( isdefined( self.linktoent ) || isdefined( self.actors ) )
    {
        waitframe();
    }
    
    level.infilsactive--;
    self delete();
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1537
// Size: 0x1c1
function vehiclethink( team, start_node, scene_name, extra_crew )
{
    self.linktoent = spawninfilvehicle( start_node, team, scene_name );
    self.var_addd3217bc59a7b8 = function_c089e2d730340dd3( scene_name );
    self.linktoent.var_dfecb928163c6c6 = 1;
    gameflagwait( "infil_started" );
    self.linktoent thread anim_single_solo( self.linktoent, "c17_infil" + "_1", "tag_origin_animate" );
    animlength = getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_1" ] );
    wait animlength;
    self.linktoent thread anim_single_solo( self.linktoent, "c17_infil" + "_2", "tag_origin_animate" );
    animlength = getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_2" ] );
    wait animlength;
    self.linktoent thread anim_single_solo( self.linktoent, "c17_infil" + "_3", "tag_origin_animate" );
    animlength = getanimlength( level.scr_anim[ "c_17" ][ "c17_infil" + "_3" ] );
    wait animlength;
    time = distance( self.linktoent.origin, self.end_node.origin ) / 3044;
    self.linktoent thread function_479353a38aa88191( self.end_node, time );
    wait time;
    self.linktoent function_30068db72cedafa7();
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1700
// Size: 0x5e
function function_479353a38aa88191( destination_node, time )
{
    self scriptmodelclearanim();
    destination = destination_node.origin;
    var_12e356abc031b02d = vectortoangles( destination - self.origin );
    self.angles = var_12e356abc031b02d;
    self moveto( destination, time );
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1766
// Size: 0x32
function function_30068db72cedafa7()
{
    self notify( "delete_c17" );
    
    if ( isdefined( self ) )
    {
        if ( isdefined( self.innards ) )
        {
            self.innards delete();
        }
        
        self delete();
    }
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17a0
// Size: 0x284
function actorthink()
{
    level waittill( "match_start_real_countdown" );
    attackers = scripts\mp\utility\teams::getteamdata( game[ "attackers" ], "players" );
    
    if ( attackers.size == 0 )
    {
        return;
    }
    
    if ( !isdefined( self.actors ) )
    {
        self.actors = [];
    }
    
    fillorder = game[ "infil" ][ 0 ][ "infil_c17" ][ self.subtype ][ 5 ];
    var_eeb97c6ecf58b59f = [ "body_c_jup_mp_india", "body_c_jup_mp_bravo", "body_c_jup_mp_delta", "body_c_jup_mp_hotel", "body_c_jup_mp_mike" ];
    var_1e03d15d7802705d = [ "head_c_jup_mp_india", "head_c_jup_mp_bravo", "head_c_jup_mp_delta", "head_c_jup_mp_hotel", "head_c_jup_mp_mike" ];
    
    for (i = attackers.size; i < 6; i++) {
        slotindex = fillorder[ i ][ 0 ];
        var_6302d354f4b42771 = randomint( var_eeb97c6ecf58b59f.size );
        self.actors[ i ] = self.linktoent spawn_anim_model( slotindex, "tag_origin_animate", var_eeb97c6ecf58b59f[ var_6302d354f4b42771 ], var_1e03d15d7802705d[ var_6302d354f4b42771 ] );
        self.actors[ i ].infil = self;
        var_eeb97c6ecf58b59f = array_remove_index( var_eeb97c6ecf58b59f, var_6302d354f4b42771, 0 );
        var_1e03d15d7802705d = array_remove_index( var_1e03d15d7802705d, var_6302d354f4b42771, 0 );
    }
    
    gameflagwait( "infil_started" );
    animlength = getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_1" ] );
    wait animlength;
    self.linktoent thread anim_single( self.actors, "c17_infil" + "_1", "tag_origin_animate" );
    animlength = getxcamlength( level.scr_xcam[ "camera" ][ "c17_infil" + "_2" ] );
    wait animlength;
    self.linktoent thread anim_single( self.actors, "c17_infil" + "_2", "tag_origin_animate" );
    self.linktoent waittill( "delete_c17" );
    
    foreach ( actor in self.actors )
    {
        actor delete();
    }
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2c
// Size: 0x10b
function spawn_anim_model( slotindex, linkto_ent, body, headmodel )
{
    guy = spawn( "script_model", ( 0, 0, 0 ) );
    guy setmodel( body );
    head = spawn( "script_model", ( 0, 0, 0 ) );
    head setmodel( headmodel );
    head linkto( guy, "j_neck", ( -9, 1, 0 ), ( 0, 0, 0 ) );
    
    if ( slotindex == 5 && body == "body_c_jup_mp_bravo" )
    {
        guy.animname = "slot_" + slotindex + "_female";
    }
    else
    {
        guy.animname = "slot_" + slotindex;
    }
    
    guy setanimtree();
    guy linkto( self, linkto_ent, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    return guy;
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1b40
// Size: 0x555
function initanims( subtype, team, originalsubtype )
{
    script_model_alpha_anims( subtype );
    vehicles_anims( subtype, team, originalsubtype );
    addnotetrack_customfunction( "slot_0", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_1", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_2", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_3", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_4", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_5", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_6", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_7", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_8", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_9", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_10", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_11", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_12", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_13", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_14", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_15", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_16", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_17", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_18", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_19", "fov_63_2", &player_fov_default_2 );
    addnotetrack_customfunction( "slot_0", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_1", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_2", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_3", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_4", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_5", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_6", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_7", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_8", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_9", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_10", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_11", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_12", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_13", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_14", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_15", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_16", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_17", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_18", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_19", "player_lock_look_1_second", &player_lock_look_1_second );
    addnotetrack_customfunction( "slot_0", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_1", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_2", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_3", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_4", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_5", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_6", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_7", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_8", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_9", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_10", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_11", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_12", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_13", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_14", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_15", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_16", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_17", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_18", "free_look", &player_free_look );
    addnotetrack_customfunction( "slot_19", "free_look", &player_free_look );
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x209d
// Size: 0x4f8
function script_model_alpha_anims( subtype )
{
    level.scr_animtree[ "slot_0" ] = #script_model;
    level.scr_anim[ "slot_0" ][ "c17_infil" + "_1" ] = script_model#jup_war_skydiving_attacker_infill_guy1_shot020;
    level.scr_eventanim[ "slot_0" ][ "c17_infil" + "_1" ] = %"hash_17e8aef4887288b6";
    level.scr_anim[ "slot_0" ][ "c17_infil" + "_2" ] = script_model#jup_war_skydiving_attacker_infill_guy1_shot030;
    level.scr_eventanim[ "slot_0" ][ "c17_infil" + "_2" ] = %"hash_17e8adf488728703";
    level.scr_animtree[ "slot_1" ] = #script_model;
    level.scr_anim[ "slot_1" ][ "c17_infil" + "_1" ] = script_model#jup_war_skydiving_attacker_infill_guy2_shot020;
    level.scr_eventanim[ "slot_1" ][ "c17_infil" + "_1" ] = %"hash_109999f484b0a307";
    level.scr_anim[ "slot_1" ][ "c17_infil" + "_2" ] = script_model#jup_war_skydiving_attacker_infill_guy2_shot030;
    level.scr_eventanim[ "slot_1" ][ "c17_infil" + "_2" ] = %"hash_10999af484b0a4ba";
    level.scr_animtree[ "slot_2" ] = #script_model;
    level.scr_anim[ "slot_2" ][ "c17_infil" + "_1" ] = script_model#jup_war_skydiving_attacker_infill_guy3_shot020;
    level.scr_eventanim[ "slot_2" ][ "c17_infil" + "_1" ] = %"hash_87160f480368f6c";
    level.scr_anim[ "slot_2" ][ "c17_infil" + "_2" ] = script_model#jup_war_skydiving_attacker_infill_guy3_shot030;
    level.scr_eventanim[ "slot_2" ][ "c17_infil" + "_2" ] = %"hash_87163f480369485";
    level.scr_animtree[ "slot_3" ] = #script_model;
    level.scr_anim[ "slot_3" ][ "c17_infil" + "_1" ] = script_model#jup_war_skydiving_attacker_infill_guy4_shot020;
    level.scr_eventanim[ "slot_3" ][ "c17_infil" + "_1" ] = %"hash_433e83f4a0ffa8a5";
    level.scr_anim[ "slot_3" ][ "c17_infil" + "_2" ] = script_model#jup_war_skydiving_attacker_infill_guy4_shot030;
    level.scr_eventanim[ "slot_3" ][ "c17_infil" + "_2" ] = %"hash_433e80f4a0ffa38c";
    level.scr_animtree[ "slot_4" ] = #script_model;
    level.scr_anim[ "slot_4" ][ "c17_infil" + "_1" ] = script_model#jup_war_skydiving_attacker_infill_guy5_shot020;
    level.scr_eventanim[ "slot_4" ][ "c17_infil" + "_1" ] = %"hash_3befeaf49d3e95aa";
    level.scr_anim[ "slot_4" ][ "c17_infil" + "_2" ] = script_model#jup_war_skydiving_attacker_infill_guy5_shot030;
    level.scr_eventanim[ "slot_4" ][ "c17_infil" + "_2" ] = %"hash_3befe9f49d3e93f7";
    level.scr_animtree[ "slot_5" ] = #script_model;
    level.scr_anim[ "slot_5" ][ "c17_infil" + "_1" ] = script_model#jup_war_skydiving_attacker_infill_guy6_shot020;
    level.scr_eventanim[ "slot_5" ][ "c17_infil" + "_1" ] = %"hash_33c7b5f498c488db";
    level.scr_anim[ "slot_5" ][ "c17_infil" + "_2" ] = script_model#jup_war_skydiving_attacker_infill_guy6_shot030;
    level.scr_eventanim[ "slot_5" ][ "c17_infil" + "_2" ] = %"hash_33c7b6f498c48a8e";
    level.scr_animtree[ "slot_5_female" ] = #script_model;
    level.scr_anim[ "slot_5_female" ][ "c17_infil" + "_1" ] = script_model#jup_war_skydiving_attacker_infill_female6_shot020;
    level.scr_eventanim[ "slot_5_female" ][ "c17_infil" + "_1" ] = %"hash_5d4ea5a3c9f213a4";
    level.scr_anim[ "slot_5_female" ][ "c17_infil" + "_2" ] = script_model#jup_war_skydiving_attacker_infill_guy6_shot030;
    level.scr_eventanim[ "slot_5_female" ][ "c17_infil" + "_2" ] = %"hash_33c7b6f498c48a8e";
    level.scr_xcam[ "camera" ][ "c17_infil" + "_1" ] = "jup_war_skydiving_attacker_infill_xcam_shot010";
    level.scr_xcam[ "camera" ][ "c17_infil" + "_2" ] = "jup_war_skydiving_attacker_infill_xcam_shot020";
    level.scr_xcam[ "camera" ][ "c17_infil" + "_3" ] = "jup_war_skydiving_attacker_infill_xcam_shot030";
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x259d
// Size: 0x8a
function vehicles_anims( subtype, team, originalsubtype )
{
    level.scr_anim[ "c_17" ][ "c17_infil" + "_1" ] = mp_vehicles_always_loaded#jup_war_skydiving_attacker_infill_plan_shot010;
    level.scr_anim[ "c_17" ][ "c17_infil" + "_2" ] = mp_vehicles_always_loaded#jup_war_skydiving_attacker_infill_plan_shot020;
    level.scr_anim[ "c_17" ][ "c17_infil" + "_3" ] = mp_vehicles_always_loaded#jup_war_skydiving_attacker_infill_plan_shot030;
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x262f
// Size: 0x10d
function spawninfilvehicle( start_node, team, scene_name )
{
    spawnpos = start_node.origin;
    spawnang = start_node.angles;
    vehicle = spawn( "script_model", spawnpos );
    vehicle setmodel( "black::veh9_mil_air_cargo_plane_exterior_infil" );
    vehicle.angles = spawnang;
    vehicle.animname = "c_17";
    vehicle.innards = spawn( "script_model", spawnpos );
    vehicle.innards setmodel( "veh9_mil_air_cargo_plane_interior_infil" );
    vehicle.innards linkto( vehicle, "tag_body_animate", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    vehicle.innards.animname = "c_17";
    vehicle.infil = self;
    return vehicle;
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2745
// Size: 0xe4
function function_c089e2d730340dd3( subtype )
{
    var_addd3217bc59a7b8 = spawnstruct();
    var_5e0676140eecdf2d = "c17_" + subtype + "_probe";
    probes = getentarray( var_5e0676140eecdf2d, "script_noteworthy" );
    probe = undefined;
    
    foreach ( ent in probes )
    {
        if ( !isdefined( ent ) || istrue( ent.claimed ) )
        {
            continue;
        }
        
        probe = ent;
        break;
    }
    
    if ( !isdefined( probe ) )
    {
        return undefined;
    }
    
    probe.claimed = 1;
    var_addd3217bc59a7b8.probe = probe;
    function_89a2405953b84136( var_addd3217bc59a7b8, 1 );
    return var_addd3217bc59a7b8;
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2832
// Size: 0x2a
function function_89a2405953b84136( var_addd3217bc59a7b8, override_og )
{
    if ( !isdefined( var_addd3217bc59a7b8 ) )
    {
        return;
    }
    
    var_addd3217bc59a7b8.probe hide();
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2864
// Size: 0x19
function function_725375206755d1c3()
{
    level waittill( "prematch_over" );
    wait 61;
    function_f4e0ff5cb899686d( "c17_infil" );
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2885
// Size: 0x13
function function_6158ef142e9bd640()
{
    wait 27;
    self visionsetnakedforplayer( "mp_core_infil_2", 3 );
}

// Namespace c17_infil / scripts\mp\infilexfil\c17_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x28a0
// Size: 0x67
function play_xcam( entity, tag, xcamasset )
{
    pos = entity get_anim_position( "tag_origin_animate" );
    org = pos[ "origin" ];
    angles = pos[ "angles" ];
    self playxcam( xcamasset, 0, org, angles, 0, 1, 1, 1 );
}

