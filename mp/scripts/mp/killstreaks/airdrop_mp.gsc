#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\entityheadicons;
#using scripts\cp_mp\killstreaks\airdrop;
#using scripts\cp_mp\killstreaks\airdrop_escort;
#using scripts\cp_mp\killstreaks\airdrop_multiple;
#using scripts\cp_mp\killstreaks\juggernaut;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\killstreaks\juggernaut_recon;
#using scripts\mp\analyticslog;
#using scripts\mp\gameobjects;
#using scripts\mp\gametypes\common;
#using scripts\mp\hud_message;
#using scripts\mp\hud_util;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\killstreaks\target_marker;
#using scripts\mp\matchdata;
#using scripts\mp\movers;
#using scripts\mp\rank;
#using scripts\mp\utility\entity;
#using scripts\mp\utility\game;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\print;
#using scripts\mp\utility\script;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\weapon;

#namespace airdrop_mp;

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 0
// Checksum 0x0, Offset: 0x52e
// Size: 0x189
function init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "airdrop", &scripts\cp_mp\killstreaks\airdrop::tryuseairdropmarkerfromstruct );
    scripts\engine\utility::registersharedfunc( "airdrop", "airdropMultipleInit", &airdrop_airdropmultipleinit );
    scripts\engine\utility::registersharedfunc( "airdrop", "airdropEscortInit", &function_563387bd27d5b942 );
    scripts\engine\utility::registersharedfunc( "airdrop", "registerScoreInfo", &airdrop_registerscoreinfo );
    scripts\engine\utility::registersharedfunc( "airdrop", "registerActionSet", &airdrop_registeractionset );
    scripts\engine\utility::registersharedfunc( "airdrop", "updateUIProgress", &airdrop_updateuiprogress );
    scripts\engine\utility::registersharedfunc( "airdrop", "allowActionSet", &airdrop_allowactionset );
    scripts\engine\utility::registersharedfunc( "airdrop", "unresolvedCollisionNearestNode", &airdrop_unresolvedcollisionnearestnode );
    scripts\engine\utility::registersharedfunc( "airdrop", "awardKillstreak", &airdrop_awardkillstreak );
    scripts\engine\utility::registersharedfunc( "airdrop", "showKillstreakSplash", &airdrop_showkillstreaksplash );
    scripts\engine\utility::registersharedfunc( "airdrop", "getTargetMarker", &airdrop_gettargetmarker );
    scripts\engine\utility::registersharedfunc( "airdrop", "airdropMultipleDropCrates", &airdrop_airdropmultipledropcrates );
    scripts\engine\utility::registersharedfunc( "airdrop", "airdropEscortDropCrates", &function_bb8fa277bef21a11 );
    scripts\engine\utility::registersharedfunc( "airdrop", "outlineDisable", &airdrop_outlinedisable );
    scripts\engine\utility::registersharedfunc( "airdrop", "captureLootCacheCallback", &airdrop_capturelootcachecallback );
    scripts\engine\utility::registersharedfunc( "airdrop", "applyImmediateJuggernaut", &airdrop_applyimmediatejuggernaut );
    scripts\engine\utility::registersharedfunc( "airdrop", "airdropSelectLoadout", &function_3fbfee87ee058fe1 );
    scripts\engine\utility::registersharedfunc( "airdrop", "attachXRays", &function_bc67641e1dcc58b3 );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 0
// Checksum 0x0, Offset: 0x6bf
// Size: 0x9
function airdrop_airdropmultipleinit()
{
    scripts\cp_mp\killstreaks\airdrop_multiple::airdrop_multiple_init();
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 0
// Checksum 0x0, Offset: 0x6d0
// Size: 0x9
function function_563387bd27d5b942()
{
    scripts\cp_mp\killstreaks\airdrop_escort::function_f383491974a17b9a();
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 0
// Checksum 0x0, Offset: 0x6e1
// Size: 0x1d
function airdrop_registerscoreinfo()
{
    scripts\mp\rank::registerscoreinfo( #"little_bird", #"value", 200 );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 0
// Checksum 0x0, Offset: 0x706
// Size: 0x151
function airdrop_registeractionset()
{
    var_5e8f3dee82c118cf = getdvarint( @"hash_d15c22f57683add1", 1 );
    
    if ( var_5e8f3dee82c118cf )
    {
        val::group_register( "crateUse", [ "offhand_weapons", "fire", "melee", "weapon_switch", "killstreaks", "supers", "sprint", "allow_jump", "mantle", "slide", "allow_movement" ] );
        val::group_register( "juggCrateUse", [ "offhand_weapons", "weapon", "killstreaks", "supers", "sprint", "allow_jump", "mantle", "slide", "allow_movement" ] );
        return;
    }
    
    val::group_register( "crateUse", [ "offhand_weapons", "weapon", "killstreaks", "supers", "sprint", "allow_jump", "mantle", "slide", "allow_movement" ] );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 2
// Checksum 0x0, Offset: 0x85f
// Size: 0x1c
function airdrop_updateuiprogress( object, bool )
{
    scripts\mp\gameobjects::updateuiprogress( object, bool );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 2
// Checksum 0x0, Offset: 0x883
// Size: 0x2c
function airdrop_allowactionset( name, allow )
{
    if ( istrue( allow ) )
    {
        val::group_reset( name );
        return;
    }
    
    val::group_set( name, allow );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 3
// Checksum 0x0, Offset: 0x8b7
// Size: 0x26
function airdrop_unresolvedcollisionnearestnode( player, var_4258fb168fb20ba6, mover )
{
    childthread scripts\mp\movers::unresolved_collision_nearest_node( player, var_4258fb168fb20ba6, mover );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 3
// Checksum 0x0, Offset: 0x8e5
// Size: 0x118
function airdrop_awardkillstreak( streakname, owner, crate )
{
    if ( level.gametype == "grnd" || scripts\cp_mp\utility\game_utility::isinfectedgametype() || level.gametype == "ob" || level.gametype == "training_course" || level.gametype == "wm" || scripts\mp\gametypes\common::function_89d441b8cca6251d() )
    {
        overridelifeid = 0;
        var_722764086bd2150d = 0;
        overrideowner = owner;
    }
    else
    {
        overridelifeid = crate.streakinfo.mpstreaksysteminfo.streaklifeid;
        var_722764086bd2150d = crate.streakinfo.mpstreaksysteminfo.streakmatchlifeid;
        overrideowner = crate.streakinfo.owner;
    }
    
    thread scripts\mp\killstreaks\killstreaks::awardkillstreak( streakname, "carepackage", overridelifeid, var_722764086bd2150d, overrideowner );
    scripts\mp\utility\stats::incpersstat( "carepackagesCaptured", 1 );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 3
// Checksum 0x0, Offset: 0xa05
// Size: 0x25
function airdrop_showkillstreaksplash( splashref, streakval, fromcarepackage )
{
    scripts\mp\hud_message::showkillstreaksplash( splashref, streakval, fromcarepackage );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 1
// Checksum 0x0, Offset: 0xa32
// Size: 0x12
function airdrop_gettargetmarker( streakinfo )
{
    return scripts\mp\killstreaks\target_marker::gettargetmarker( streakinfo );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 7
// Checksum 0x0, Offset: 0xa4d
// Size: 0x49
function airdrop_airdropmultipledropcrates( owner, team, position, angles, destination, reservevehicle, streakinfo )
{
    return scripts\cp_mp\killstreaks\airdrop_multiple::airdrop_multiple_dropcrates( owner, team, position, angles, destination, reservevehicle, streakinfo );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 6
// Checksum 0x0, Offset: 0xa9f
// Size: 0x41
function function_bb8fa277bef21a11( owner, team, position, angles, destination, streakinfo )
{
    return scripts\cp_mp\killstreaks\airdrop_escort::function_5867a72a727ced43( owner, position, "crate", streakinfo );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 2
// Checksum 0x0, Offset: 0xae9
// Size: 0x1c
function airdrop_outlinedisable( id, var_420a996e67989dc4 )
{
    scripts\mp\utility\outline::outlinedisable( id, var_420a996e67989dc4 );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 1
// Checksum 0x0, Offset: 0xb0d
// Size: 0x20
function airdrop_capturelootcachecallback( player )
{
    player notify( "opened_cache", self );
    player playlocalsound( "ammo_crate_use" );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 2
// Checksum 0x0, Offset: 0xb35
// Size: 0x13e
function airdrop_applyimmediatejuggernaut( useimmediate, isrecon )
{
    streakname = "juggernaut";
    
    if ( istrue( isrecon ) )
    {
        streakname = "juggernaut_recon";
    }
    
    streakitem = scripts\mp\killstreaks\killstreaks::createstreakitemstruct( streakname );
    streakitem.madeavailabletime = scripts\mp\matchdata::gettimefrommatchstart( gettime() );
    streakitem.streaklifeid = self.lifeid;
    streakitem.streakmatchlifeid = self.matchdatalifeindex;
    streakitem.owner = self;
    streakitem.ownerxuid = self getxuid();
    streakitem.activatedtime = scripts\mp\matchdata::gettimefrommatchstart( gettime() );
    scripts\mp\analyticslog::logevent_killstreakactivated( self, streakitem.streaklifeid, streakitem.streakname, streakitem.isgimme, streakitem.activatedtime, self.origin );
    scripts\mp\killstreaks\killstreaks::combatrecordkillstreakuse( streakname );
    scripts\cp_mp\utility\killstreak_utility::playkillstreakusedialog( streakname );
    streakinfo = createstreakinfo( streakname, self );
    streakinfo.mpstreaksysteminfo = streakitem;
    
    if ( istrue( isrecon ) )
    {
        scripts\killstreaks\juggernaut_recon::function_2e34ff8caa82d72d( streakinfo, useimmediate );
        return;
    }
    
    scripts\cp_mp\killstreaks\juggernaut::tryusejuggernautfromstruct( streakinfo, useimmediate );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 1
// Checksum 0x0, Offset: 0xc7b
// Size: 0x19d
function function_3fbfee87ee058fe1( crate )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    
    if ( istrue( level.gameended ) )
    {
        return;
    }
    
    self freezecontrols( 1 );
    self.instantclassswapallowed = 1;
    println( "<dev string:x1c>" );
    println( "<dev string:x46>" );
    self setclientomnvar( "ui_options_menu", 0 );
    println( "<dev string:x77>" );
    wait 0.1;
    println( "<dev string:xa6>" );
    self setclientomnvar( "ui_loadout_drop_use", 1 );
    self setclientomnvar( "ui_options_menu", 2 );
    println( "<dev string:xe7>" );
    thread function_91993094d8aade48( "death" );
    thread function_91993094d8aade48( "last_stand_start" );
    thread function_91993094d8aade48( "luinotifyserver" );
    crate thread function_f3ff35367b5981a0( self );
    self waittill( "exit_airdrop_loadout", result );
    self.instantclassswapallowed = 0;
    self freezecontrols( 0 );
    self setclientomnvar( "ui_loadout_drop_use", 0 );
    println( "<dev string:x11f>" );
    
    if ( istrue( result ) && isdefined( crate ) )
    {
        crate scripts\cp_mp\killstreaks\airdrop::loadoutcratepostcapture();
        scripts\cp_mp\entityheadicons::setheadicon_removeclientfrommask( crate.headiconid, self );
        return;
    }
    
    if ( isdefined( crate ) && isdefined( crate.playerscaptured[ self getentitynumber() ] ) )
    {
        if ( crate.playerscaptured[ self getentitynumber() ] == self )
        {
            crate.playerscaptured = array_remove( crate.playerscaptured, self );
        }
    }
    
    return;
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 1
// Checksum 0x0, Offset: 0xe20
// Size: 0x2a
function function_f3ff35367b5981a0( var_28f54410c9ffeb40 )
{
    var_28f54410c9ffeb40 endon( "death_or_disconnect" );
    self endon( "exit_airdrop_loadout" );
    self waittill( "death" );
    var_28f54410c9ffeb40 notify( "exit_airdrop_loadout", 0 );
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 1
// Checksum 0x0, Offset: 0xe52
// Size: 0x7c
function function_91993094d8aade48( actionnotify )
{
    self endon( "exit_airdrop_loadout" );
    selectedloadout = 0;
    
    while ( true )
    {
        self waittill( actionnotify, param1, param2 );
        
        if ( actionnotify == "luinotifyserver" )
        {
            if ( param1 != "class_select" )
            {
                if ( param1 == "class_menu_closed" )
                {
                    self notify( "exit_airdrop_loadout", selectedloadout );
                    break;
                }
                
                continue;
            }
            
            selectedloadout = 1;
        }
        
        self notify( "exit_airdrop_loadout", selectedloadout );
        break;
    }
}

// Namespace airdrop_mp / scripts\mp\killstreaks\airdrop_mp
// Params 1
// Checksum 0x0, Offset: 0xed6
// Size: 0x2f
function function_bc67641e1dcc58b3( crate )
{
    if ( isdefined( crate.team ) )
    {
        crate function_5226227bce83ebe9( 3, crate.team );
    }
    
    return crate;
}

