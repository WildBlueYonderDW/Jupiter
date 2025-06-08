#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\ent_manager;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\scriptable;
#using scripts\engine\utility;
#using scripts\mp\anim;
#using scripts\mp\utility\infilexfil;
#using scripts\mp\utility\lower_message;

#namespace auto_ascender;

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x7ee
// Size: 0x133
function init()
{
    setdvarifuninitialized( @"hash_1726c98446555f2", 360 );
    setdvarifuninitialized( @"hash_89e4c06f52246b50", 460 );
    setdvarifuninitialized( @"hash_23ed39c8f9324ffe", 540 );
    level.ascendstarts = getstructarray( "ascend_begin", "script_noteworthy" );
    level.descendstarts = getstructarray( "descend_begin", "script_noteworthy" );
    level.ascendstructs = [];
    
    foreach ( a in level.ascendstarts )
    {
        markupascenderstruct( a, 1 );
    }
    
    foreach ( a in level.descendstarts )
    {
        markupascenderstruct( a, 0 );
    }
    
    initanimtree();
    scripts\engine\scriptable::scriptable_addusedcallbackbypart( "ascender", &ascenderscriptableused );
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x929
// Size: 0x7
function function_68fe08d119bbd54f()
{
    return 360;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x939
// Size: 0x7
function function_9412c45e2bc1218b()
{
    return 460;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x949
// Size: 0x7
function function_f3c35aacfbe68158()
{
    return 540;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x959
// Size: 0x7
function function_99e7d00e9d903c57()
{
    return 0.4;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x969
// Size: 0x7
function function_ca18084bdcc82ea8()
{
    return 0.15;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x979
// Size: 0x5
function function_211b63898ba23e96()
{
    return 12100;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x987
// Size: 0x4
function function_9bb960f8f80f543f()
{
    return 72;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x994
// Size: 0x494
function initanimtree()
{
    level.scr_animtree[ "player" ] = #script_model;
    level.scr_anim[ "player" ][ "ascender_up_in" ] = script_model#vm_eq_ascender_up_get_on_plr;
    level.scr_eventanim[ "player" ][ "ascender_up_in" ] = %"ascender_up_in";
    level.scr_anim[ "player" ][ "ascender_up_loop" ] = script_model#vm_eq_ascender_up_loop_plr;
    level.scr_eventanim[ "player" ][ "ascender_up_loop" ] = %"ascender_up_loop";
    level.scr_anim[ "player" ][ "ascender_up_out" ] = script_model#vm_eq_ascender_up_get_off_plr;
    level.scr_eventanim[ "player" ][ "ascender_up_out" ] = %"ascender_up_out";
    level.scr_anim[ "player" ][ "ascender_down_in" ] = script_model#vm_eq_ascender_down_get_on_plr;
    level.scr_eventanim[ "player" ][ "ascender_down_in" ] = %"ascender_down_in";
    level.scr_anim[ "player" ][ "ascender_down_loop" ] = script_model#vm_eq_ascender_down_loop_plr;
    level.scr_eventanim[ "player" ][ "ascender_down_loop" ] = %"ascender_down_loop";
    level.scr_anim[ "player" ][ "ascender_down_out" ] = script_model#vm_eq_ascender_down_get_off_plr;
    level.scr_eventanim[ "player" ][ "ascender_down_out" ] = %"ascender_down_out";
    level.scr_animtree[ "device" ] = #script_model;
    level.scr_anim[ "device" ][ "ascender_up_in" ] = script_model#vm_eq_ascender_up_get_on_ascender;
    level.scr_eventanim[ "device" ][ "ascender_up_in" ] = %"ascender_up_in";
    level.scr_anim[ "device" ][ "ascender_up_loop" ] = script_model#vm_eq_ascender_up_loop_ascender;
    level.scr_eventanim[ "device" ][ "ascender_up_loop" ] = %"ascender_up_loop";
    level.scr_anim[ "device" ][ "ascender_up_out" ] = script_model#vm_eq_ascender_up_get_off_ascender;
    level.scr_eventanim[ "device" ][ "ascender_up_out" ] = %"ascender_up_out";
    level.scr_anim[ "device" ][ "ascender_down_in" ] = script_model#vm_eq_ascender_down_get_on_ascender;
    level.scr_eventanim[ "device" ][ "ascender_down_in" ] = %"ascender_down_in";
    level.scr_anim[ "device" ][ "ascender_down_loop" ] = script_model#vm_eq_ascender_down_loop_ascender;
    level.scr_eventanim[ "device" ][ "ascender_down_loop" ] = %"ascender_down_loop";
    level.scr_anim[ "device" ][ "ascender_down_out" ] = script_model#vm_eq_ascender_down_get_off_ascender;
    level.scr_eventanim[ "device" ][ "ascender_down_out" ] = %"ascender_down_out";
    level.scr_animtree[ "device" ] = #script_model;
    level.scr_anim[ "device" ][ "ascender_up_in_wm" ] = script_model#wm_eq_ascender_up_get_on_ascender;
    level.scr_eventanim[ "device" ][ "ascender_up_in_wm" ] = %"ascender_up_in";
    level.scr_anim[ "device" ][ "ascender_up_loop_wm" ] = script_model#wm_eq_ascender_up_loop_ascender;
    level.scr_eventanim[ "device" ][ "ascender_up_loop_wm" ] = %"ascender_up_loop";
    level.scr_anim[ "device" ][ "ascender_up_out_wm" ] = script_model#wm_eq_ascender_up_get_off_ascender;
    level.scr_eventanim[ "device" ][ "ascender_up_out_wm" ] = %"ascender_up_out";
    level.scr_anim[ "device" ][ "ascender_down_in_wm" ] = script_model#wm_eq_ascender_down_get_on_ascender;
    level.scr_eventanim[ "device" ][ "ascender_down_in_wm" ] = %"ascender_down_in";
    level.scr_anim[ "device" ][ "ascender_down_loop_wm" ] = script_model#wm_eq_ascender_down_loop_ascender;
    level.scr_eventanim[ "device" ][ "ascender_down_loop_wm" ] = %"ascender_down_loop";
    level.scr_anim[ "device" ][ "ascender_down_out_wm" ] = script_model#wm_eq_ascender_down_get_off_ascender;
    level.scr_eventanim[ "device" ][ "ascender_down_out_wm" ] = %"ascender_down_out";
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 2
// Checksum 0x0, Offset: 0xe30
// Size: 0x1d9
function markupascenderstruct( struct, dir )
{
    if ( !isdefined( struct.targetname ) )
    {
        msg = "auto_ascender.gsc::markupAscenderStruct() passed struct with no targetname at pos " + " x:" + struct.origin[ 0 ] + " y:" + struct.origin[ 1 ] + " z:" + struct.origin[ 2 ];
        error( msg );
        return;
    }
    
    endstruct = getstruct( struct.target, "targetname" );
    var_edd7dfcccad431f8 = getstruct( endstruct.target, "targetname" );
    level.ascendstructs[ struct.targetname ] = struct;
    struct.ascendstructend = endstruct;
    struct.ascendstructout = var_edd7dfcccad431f8;
    struct.inuse = 0;
    struct.exitangle = struct.angles + ( 0, 180, 0 );
    struct.startangle = struct.angles;
    struct.dir = dir;
    
    if ( struct.targetname == "pf57045_auto38" || struct.targetname == "pf57045_auto41" )
    {
        struct.origin += ( 0, 0, 8 );
        endstruct.origin += ( 0, 0, 8 );
        var_edd7dfcccad431f8.origin += ( 0, 0, 8 );
    }
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 6
// Checksum 0x0, Offset: 0x1011
// Size: 0x67
function ascenderscriptableused( instance, part, state, player, var_a5b2c541413aa895, usestring )
{
    assert( part == "<dev string:x1c>" );
    
    if ( state == "on" )
    {
        if ( istrue( player.usingascender ) )
        {
            return;
        }
        
        thread ascenderuse( instance, player );
    }
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x1080
// Size: 0x6b
function function_3af132aed5f667c5()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "denyAscendMessage" );
    self endon( "denyAscendMessage" );
    self playsoundtoplayer( "ui_select_purchase_deny", self );
    
    if ( isdefined( level.ascendermsgfunc ) )
    {
        self [[ level.ascendermsgfunc ]]( "ascender_blocked_generic", 4 );
        return;
    }
    
    setlowermessageomnvar( "ascender_blocked_generic" );
    wait 4;
    setlowermessageomnvar( "clear_lower_msg" );
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x10f3
// Size: 0x6b
function denyascendmessagelaststand()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "denyAscendMessageLastStand" );
    self endon( "denyAscendMessageLastStand" );
    self playsoundtoplayer( "ui_select_purchase_deny", self );
    
    if ( isdefined( level.ascendermsgfunc ) )
    {
        self [[ level.ascendermsgfunc ]]( "ascender_blocked_laststand", 4 );
        return;
    }
    
    setlowermessageomnvar( "ascender_blocked_laststand" );
    wait 4;
    setlowermessageomnvar( "clear_lower_msg" );
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x1166
// Size: 0x6b
function denyascendmessage()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self notify( "denyAscendMessage" );
    self endon( "denyAscendMessage" );
    self playsoundtoplayer( "ui_select_purchase_deny", self );
    
    if ( isdefined( level.ascendermsgfunc ) )
    {
        self [[ level.ascendermsgfunc ]]( "ascender_blocked", 4 );
        return;
    }
    
    setlowermessageomnvar( "ascender_blocked" );
    wait 4;
    setlowermessageomnvar( "clear_lower_msg" );
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 1
// Checksum 0x0, Offset: 0x11d9
// Size: 0x4d
function ascenddeathlistener( ascendstart )
{
    level endon( "game_ended" );
    self endon( "ascend_complete" );
    self endon( "ascend_solo_complete" );
    self endon( "ascender_cancel" );
    scripts\engine\utility::waittill_any_2( "death_or_disconnect", "last_stand_start" );
    
    if ( isdefined( self ) )
    {
        self stopanimscriptsceneevent();
    }
    
    ascendstart cleanupascenduse( self );
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 4
// Checksum 0x0, Offset: 0x122e
// Size: 0x74
function endascenderanim( player, dir, ascendermodelview, ascendermodelworld )
{
    player endon( "death_or_disconnect" );
    player endon( "ascender_cancel" );
    
    if ( dir )
    {
        var_45ae85538855919b = "ascender_up_out";
    }
    else
    {
        var_45ae85538855919b = "ascender_down_out";
    }
    
    thread scripts\mp\anim::anim_player_solo( player, player.player_rig, var_45ae85538855919b );
    scripts\common\anim::anim_single_solo( ascendermodelworld, var_45ae85538855919b + "_wm" );
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 4
// Checksum 0x0, Offset: 0x12aa
// Size: 0x2fb
function startascenderanim( player, dir, ascendermodelview, ascendermodelworld )
{
    player endon( "death_or_disconnect" );
    player endon( "ascender_cancel" );
    player thread scripts\mp\utility\infilexfil::infil_player_rig_updated( "player", player.origin, player.angles );
    ascendermodelview.animname = "device";
    ascendermodelview scripts\common\anim::setanimtree();
    ascendermodelworld.animname = "device";
    ascendermodelworld scripts\common\anim::setanimtree();
    ascendermodelworld hide();
    var_a08d86a9e7aafc47 = ( 1, 0, 0 );
    
    if ( dir )
    {
        var_9150bc085d41f530 = "TAG_ACCESSORY_RIGHT";
        var_298ee9614ae698ae = "ascender_up_in";
        var_a08d86a9e7aafc47 = rotatevector( ( -40.9464, 22.9807, 0 ), self.angles );
    }
    else
    {
        var_9150bc085d41f530 = "TAG_ACCESSORY_LEFT";
        var_298ee9614ae698ae = "ascender_down_in";
        var_a08d86a9e7aafc47 = rotatevector( ( -42.2388, -23.4915, 0 ), self.angles );
    }
    
    player.player_rig moveto( self.origin + var_a08d86a9e7aafc47, 0.4, 0.1, 0.1 );
    fwd = vectornormalize( var_a08d86a9e7aafc47 * -1 );
    goalangles = vectortoanglessafe( fwd, ( 0, 0, 1 ) );
    player.player_rig rotateto( goalangles, 0.4, 0.1, 0.1 );
    var_cd9982adb17761a8 = gettime();
    player scripts\cp_mp\utility\inventory_utility::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = 0.4 - ( var_698cc218e4ade75f - var_cd9982adb17761a8 ) / 1000;
    waittime = max( 0, var_218f64cb035d54be );
    wait waittime;
    ascendermodelworld show();
    ascendermodelworld hidefromplayer( player );
    player.player_rig linkto( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    ascendermodelview linkto( player.player_rig, var_9150bc085d41f530, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    ascendermodelworld linkto( self, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    player.player_rig showonlytoplayer( player );
    scripts\common\anim::anim_first_frame_solo( player.player_rig, var_298ee9614ae698ae );
    thread scripts\mp\anim::anim_player_solo( player, player.player_rig, var_298ee9614ae698ae );
    thread scripts\common\anim::anim_single_solo( ascendermodelworld, var_298ee9614ae698ae + "_wm" );
    var_5018a9a0d40ed758 = getanimlength( level.scr_anim[ "player" ][ var_298ee9614ae698ae ] );
    wait var_5018a9a0d40ed758;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 4
// Checksum 0x0, Offset: 0x15ad
// Size: 0xbd
function loopwaitanim( scenenode, ascendermodelview, ascendermodelworld, dir )
{
    self endon( "death_or_disconnect" );
    self endon( "ascender_loop_done" );
    self endon( "ascender_cancel" );
    
    if ( dir )
    {
        var_b164ebced1cbe96c = "ascender_up_loop";
    }
    else
    {
        var_b164ebced1cbe96c = "ascender_down_loop";
    }
    
    animlength = getanimlength( level.scr_anim[ "player" ][ var_b164ebced1cbe96c ] );
    
    while ( true )
    {
        if ( !isdefined( self ) )
        {
            break;
        }
        
        scenenode thread scripts\mp\anim::anim_player_solo( self, self.player_rig, var_b164ebced1cbe96c );
        scenenode scripts\common\anim::anim_single_solo( ascendermodelworld, var_b164ebced1cbe96c + "_wm" );
        
        if ( !isdefined( animlength ) || animlength == 0 )
        {
            break;
        }
        
        wait animlength;
    }
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 2
// Checksum 0x0, Offset: 0x1672
// Size: 0x11d, Type: bool
function function_3070aab95202a0e6( instance, player )
{
    if ( player isswitchingweapon() )
    {
        player thread function_3af132aed5f667c5();
        return false;
    }
    
    if ( player scripts\cp_mp\utility\player_utility::isinvehicle() )
    {
        player thread function_3af132aed5f667c5();
        return false;
    }
    
    if ( istrue( player.insertingarmorplate ) )
    {
        player thread function_3af132aed5f667c5();
        return false;
    }
    
    if ( istrue( player.inlaststand ) )
    {
        player thread denyascendmessagelaststand();
        return false;
    }
    
    if ( istrue( player.isreviving ) )
    {
        return false;
    }
    
    if ( !player val::get( "ascender_use" ) )
    {
        player thread function_3af132aed5f667c5();
        return false;
    }
    
    if ( player isskydiving() )
    {
        return false;
    }
    
    ascendstart = level.ascendstructs[ instance.target ];
    
    if ( !isdefined( ascendstart ) )
    {
        return false;
    }
    
    if ( ascendstart.inuse )
    {
        player thread denyascendmessage();
        return false;
    }
    
    if ( isdefined( ascendstart.sololink ) && istrue( ascendstart.sololink.inuse ) )
    {
        player thread denyascendmessage();
        return false;
    }
    
    return true;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 2
// Checksum 0x0, Offset: 0x1798
// Size: 0x4a3
function ascenderuse( instance, player )
{
    level endon( "game_ended" );
    player endon( "death_or_disconnect" );
    player endon( "ascender_cancel" );
    
    if ( getdvarint( @"hash_a24172489f2b8a69", 0 ) > 0 )
    {
        player endon( "last_stand" );
    }
    
    if ( !function_3070aab95202a0e6( instance, player ) )
    {
        return;
    }
    
    ascendstart = level.ascendstructs[ instance.target ];
    
    if ( getdvarint( @"hash_a24172489f2b8a69", 0 ) <= 0 )
    {
        player.shouldskiplaststand = 1;
    }
    
    ascendstart.ascender = spawn( "script_model", ascendstart.origin );
    ascendstart.ascender setmodel( "tag_origin" );
    ascendstart.scriptable = instance;
    
    if ( player getstance() != "stand" )
    {
        player setstance( "stand" );
    }
    
    player val::set( "ascender", "melee", 0 );
    player val::set( "ascender", "ads", 0 );
    player val::set( "ascender", "fire", 0 );
    
    if ( istrue( player.isjuggernaut ) )
    {
        if ( issharedfuncdefined( "juggernaut", "canUseWeaponPickups" ) )
        {
            canuseweaponpickups = player [[ getsharedfunc( "juggernaut", "canUseWeaponPickups" ) ]]();
            
            if ( istrue( canuseweaponpickups ) )
            {
                player val::set( "ascender", "weapon_switch", 0 );
            }
        }
    }
    else
    {
        player val::set( "ascender", "offhand_weapons", 0 );
        player val::set( "ascender", "killstreaks", 0 );
        player val::set( "ascender", "weapon_switch", 0 );
    }
    
    ascendstart.ascender scripts\cp_mp\ent_manager::registerspawncount( 2 );
    ascendstart.inuse = 1;
    player.usingascender = 1;
    player val::set( "ascender", "usability", 0 );
    ascendend = ascendstart.ascendstructend;
    ascendout = ascendstart.ascendstructout;
    ascendstart.ascender dontinterpolate();
    ascendstart.ascender.origin = ascendstart.origin;
    ascendstart.ascender.angles = ascendstart.angles;
    ascendermodelview = spawn( "script_model", ascendstart.origin );
    ascendermodelview setmodel( "misc_wm_ascender" );
    ascendermodelview showonlytoplayer( player );
    ascendermodelworld = spawn( "script_model", ascendstart.origin );
    ascendermodelworld setmodel( "misc_wm_ascender" );
    ascendermodelworld hidefromplayer( player );
    player.ascenderstart = ascendstart;
    player.ascendermodelview = ascendermodelview;
    player.ascendermodelworld = ascendermodelworld;
    player function_75bceb766d71dd0a( 1 );
    player thread ascenddeathlistener( ascendstart );
    ascendstart.ascender startascenderanim( player, ascendstart.dir, ascendermodelview, ascendermodelworld );
    player thread loopwaitanim( ascendstart.ascender, ascendermodelview, ascendermodelworld, ascendstart.dir );
    var_6c29ccc8d58c68e3 = distance( ascendend.origin, ascendstart.origin );
    
    if ( !ascendstart.dir )
    {
        if ( utility::iscp() )
        {
            ascendspeed = getdvarfloat( @"hash_23ed39c8f9324ffe", function_f3c35aacfbe68158() );
        }
        else
        {
            ascendspeed = getdvarfloat( @"hash_89e4c06f52246b50", function_9412c45e2bc1218b() );
        }
    }
    else
    {
        ascendspeed = getdvarfloat( @"hash_1726c98446555f2", function_68fe08d119bbd54f() );
    }
    
    ascendtime = var_6c29ccc8d58c68e3 / ascendspeed;
    var_e1085fbf185d9d57 = function_99e7d00e9d903c57() * ascendtime;
    ascenddeceltime = function_ca18084bdcc82ea8() * ascendtime;
    ascendstart.ascender moveto( ascendend.origin, ascendtime, var_e1085fbf185d9d57, ascenddeceltime );
    wait ascendtime;
    player notify( "ascender_loop_done" );
    ascendstart.ascender endascenderanim( player, ascendstart.dir, ascendermodelview, ascendermodelworld );
    ascendstart cleanupascenduse( player );
    player notify( "ascend_complete" );
    player function_75bceb766d71dd0a( 0 );
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 1
// Checksum 0x0, Offset: 0x1c43
// Size: 0x1e3
function cleanupascenduse( player )
{
    self.inuse = 0;
    
    if ( isdefined( player ) )
    {
        player.usingascender = 0;
        player.lastascenderusetime = gettime();
        player val::reset_all( "ascender" );
        
        if ( getdvarint( @"hash_a24172489f2b8a69", 0 ) <= 0 )
        {
            player.shouldskiplaststand = undefined;
        }
        
        if ( isdefined( player.ascendermodelview ) )
        {
            player.ascendermodelview unlink();
            player.ascendermodelview delete();
        }
        
        if ( isdefined( player.ascendermodelworld ) )
        {
            player.ascendermodelworld unlink();
            player.ascendermodelworld delete();
        }
    }
    
    self.ascender.angles = self.startangle;
    self.ascender scripts\cp_mp\ent_manager::deregisterspawn();
    self.ascender delete();
    
    if ( isdefined( player ) )
    {
        if ( isdefined( player.ascenderstart.sololink ) )
        {
            self.scriptable setscriptablepartstate( "ascender_solo", "on" );
        }
        else
        {
            self.scriptable setscriptablepartstate( "ascender", "on" );
        }
        
        player.ascenderstart = undefined;
        player.ascendermodelview = undefined;
        player.ascendermodelworld = undefined;
        player.player_rig unlink();
    }
    else if ( isdefined( self.sololink ) )
    {
        self.scriptable setscriptablepartstate( "ascender_solo", "on" );
    }
    else
    {
        self.scriptable setscriptablepartstate( "ascender", "on" );
    }
    
    waitframe();
    
    if ( isdefined( player ) )
    {
        player thread scripts\cp_mp\utility\inventory_utility::function_9897d143c3feee05();
        player notify( "remove_rig" );
    }
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 0
// Checksum 0x0, Offset: 0x1e2e
// Size: 0xbc
function ascenderinstantstop()
{
    player = self;
    
    if ( !istrue( player.usingascender ) )
    {
        assertmsg( "<dev string:x28>" );
        return;
    }
    
    startorigin = player.ascenderstart.ascendstructout.origin;
    startangles = player.ascenderstart.ascendstructout.angles;
    player.ascenderstart cleanupascenduse( player );
    player setorigin( startorigin );
    player setplayerangles( startangles );
    player notify( "ascender_cancel" );
    player notify( "ascender_solo_cancel" );
    player stopanimscriptsceneevent();
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 2
// Checksum 0x0, Offset: 0x1ef2
// Size: 0x42
function vectortoanglessafe( forward, up )
{
    right = vectorcross( forward, up );
    up = vectorcross( right, forward );
    angles = axistoangles( forward, right, up );
    return angles;
}

// Namespace auto_ascender / scripts\cp_mp\auto_ascender
// Params 1
// Checksum 0x0, Offset: 0x1f3d
// Size: 0x98, Type: bool
function function_ff57f9acf27bbc3c( point )
{
    foreach ( a in level.ascendstructs )
    {
        if ( distance2dsquared( a.origin, point ) < function_211b63898ba23e96() )
        {
            if ( abs( point[ 2 ] - a.origin[ 2 ] ) < function_9bb960f8f80f543f() )
            {
                return true;
            }
        }
    }
    
    return false;
}

