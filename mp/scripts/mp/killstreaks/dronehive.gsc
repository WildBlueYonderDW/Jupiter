#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\hostmigration;
#using scripts\mp\hud_util;
#using scripts\mp\utility\debug;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\player;
#using scripts\mp\utility\print;

#namespace dronehive;

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 0
// Checksum 0x0, Offset: 0x38a
// Size: 0x95
function init()
{
    assertmsg( "<dev string:x1c>" );
    level.dronemissilespawnarray = getentarray( "remoteMissileSpawn", "targetname" );
    
    foreach ( missilespawn in level.dronemissilespawnarray )
    {
        missilespawn.targetent = getent( missilespawn.target, "targetname" );
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x427
// Size: 0xd, Type: bool
function weapongivendronehive( streakinfo )
{
    return true;
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x43d
// Size: 0x4b
function tryusedronehive( streakinfo )
{
    /#
        if ( !isdefined( level.dronemissilespawnarray ) || !level.dronemissilespawnarray.size )
        {
            assertmsg( "<dev string:x7b>" );
        }
    #/
    
    return usedronehive( self, streakinfo.lifeid, streakinfo );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 3
// Checksum 0x0, Offset: 0x491
// Size: 0x9b, Type: bool
function usedronehive( player, lifeid, streakinfo )
{
    if ( isdefined( self.underwater ) && self.underwater )
    {
        return false;
    }
    
    result = player scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweapontabletdeploy( streakinfo );
    
    if ( !result )
    {
        return false;
    }
    
    player val::set( "use_drone_hive", "weapon_switch", 0 );
    level thread monitordisownkillstreaks( player );
    level thread monitorgameend( player );
    level thread monitorobjectivecamera( player );
    level thread rundronehive( player, lifeid, streakinfo.streakname, streakinfo );
    return true;
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x535
// Size: 0x48
function watchhostmigrationstartedinit( player )
{
    player endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "death" );
    
    for ( ;; )
    {
        level waittill( "host_migration_begin" );
        
        if ( isdefined( self ) )
        {
            player thermalvisionon();
            continue;
        }
        
        player setclientomnvar( "ui_predator_missile", 2 );
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x585
// Size: 0x64
function watchhostmigrationfinishedinit( player )
{
    player endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "death" );
    
    for ( ;; )
    {
        level waittill( "host_migration_end" );
        
        if ( isdefined( self ) )
        {
            player setclientomnvar( "ui_predator_missile", 1 );
            player setclientomnvar( "ui_predator_missiles_left", self.missilesleft );
            continue;
        }
        
        player setclientomnvar( "ui_predator_missile", 2 );
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x5f1
// Size: 0xc5
function watchclosetogoal( player )
{
    player endon( "disconnect" );
    level endon( "game_ended" );
    contentoverride = scripts\engine\trace::create_contents( 1, 1, 1, 1, 1, 1, 1 );
    
    while ( isdefined( self ) )
    {
        trace = scripts\engine\trace::ray_trace( self.origin, self.origin - ( 0, 0, 1000 ), level.characters, contentoverride );
        
        if ( isdefined( trace[ "position" ] ) && distancesquared( self.origin, trace[ "position" ] ) < 5000 )
        {
            break;
        }
        
        waitframe();
    }
    
    assertmsg( "<dev string:xa4>" );
    self.streakinfo notify( "killstreak_finished_with_deploy_weapon" );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 4
// Checksum 0x0, Offset: 0x6be
// Size: 0x426
function rundronehive( player, lifeid, streakname, streakinfo )
{
    player endon( "disconnect" );
    level endon( "game_ended" );
    calloutsplash = "used_drone_hive";
    mainweapon = "drone_hive_projectile_mp";
    childweapon = "switch_blade_child_mp";
    level thread teamplayercardsplash( calloutsplash, player );
    player notifyonplayercommand( "missileTargetSet", "+attack" );
    player notifyonplayercommand( "missileTargetSet", "+attack_akimbo_accessible" );
    remotemissilespawn = getbestmissilespawnpoint( player, level.dronemissilespawnarray );
    startpos = remotemissilespawn.origin * ( 1, 1, 0 ) + ( 0, 0, level.mapcenter[ 2 ] + 10000 );
    targetpos = remotemissilespawn.targetent.origin;
    
    /#
        if ( false )
        {
            level thread drawline( startpos, targetpos, 15, ( 1, 0, 0 ) );
        }
    #/
    
    rocket = _magicbullet( makeweapon( mainweapon ), startpos, targetpos, player );
    rocket setcandamage( 1 );
    rocket disablemissileboosting();
    rocket setmissileminimapvisible( 1 );
    rocket.team = player.team;
    rocket.lifeid = lifeid;
    rocket.type = "remote";
    rocket.owner = player;
    rocket.entitynumber = rocket getentitynumber();
    rocket.streakinfo = streakinfo;
    rocket.weapon_name = "drone_hive_projectile_mp";
    level.rockets[ rocket.entitynumber ] = rocket;
    level.remotemissileinprogress = 1;
    level thread monitordeath( rocket, 1 );
    level thread monitorboost( rocket );
    missileeyes( player, rocket );
    player setclientomnvar( "ui_predator_missile", 1 );
    rocket thread watchhostmigrationstartedinit( player );
    rocket thread watchhostmigrationfinishedinit( player );
    rocket thread watchsupertrophynotify( player );
    player utility::trycall( level.matchdata_logkillstreakevent, streakname, rocket.origin );
    missilecount = 0;
    rocket.missilesleft = 2;
    reloadtime = 2;
    player setclientomnvar( "ui_predator_missiles_left", rocket.missilesleft );
    
    while ( true )
    {
        result = rocket waittill_any_return_2( "death", "missileTargetSet" );
        scripts\mp\hostmigration::waittillhostmigrationdone();
        
        if ( result == "death" )
        {
            break;
        }
        
        if ( !isdefined( rocket ) )
        {
            break;
        }
        
        if ( istrue( rocket.unlimitedammo ) )
        {
            if ( istrue( rocket.lasttimefired ) )
            {
                if ( gettime() < rocket.lasttimefired + reloadtime * 1000 && missilecount == 0 )
                {
                    continue;
                }
            }
            
            level thread firerapidmissiles( rocket, missilecount, streakinfo, childweapon );
            missilecount++;
            rocket.lasttimefired = gettime();
            rocket.missilesleft = 2 - missilecount;
            omnvarvalue = rocket.missilesleft;
            
            if ( rocket.missilesleft == 0 )
            {
                omnvarvalue = -1;
            }
            
            player setclientomnvar( "ui_predator_missiles_left", omnvarvalue );
            
            if ( missilecount == 2 )
            {
                missilecount = 0;
                rocket.missilesleft = 2;
                player thread resetmissiles( rocket, reloadtime );
            }
            
            continue;
        }
        
        if ( missilecount < 2 )
        {
            if ( !istrue( rocket.singlefire ) )
            {
                level thread spawnswitchblade( rocket, missilecount, streakinfo, childweapon );
                missilecount++;
                rocket.missilesleft = 2 - missilecount;
                player setclientomnvar( "ui_predator_missiles_left", rocket.missilesleft );
                
                if ( missilecount == 2 )
                {
                    rocket enablemissileboosting();
                }
            }
        }
    }
    
    level thread returnplayer( player );
    printgameaction( "killstreak ended - drone_hive", player );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 4
// Checksum 0x0, Offset: 0xaec
// Size: 0x68
function firerapidmissiles( rocket, missilecount, streakinfo, childweapon )
{
    startingside = missilecount;
    
    for ( i = 0; i < 2 ; i++ )
    {
        level thread spawnswitchblade( rocket, startingside, streakinfo, childweapon );
        startingside++;
        
        if ( startingside > 1 )
        {
            startingside = 0;
        }
        
        wait 0.1;
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 2
// Checksum 0x0, Offset: 0xb5c
// Size: 0x3a
function resetmissiles( rocket, reloadtime )
{
    rocket endon( "death" );
    self endon( "disconnect" );
    wait reloadtime;
    self setclientomnvar( "ui_predator_missiles_left", rocket.missilesleft );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 0
// Checksum 0x0, Offset: 0xb9e
// Size: 0x121
function monitorlockedtarget()
{
    level endon( "game_ended" );
    self endon( "death" );
    enemytargets = [];
    sortedtargets = [];
    
    for ( ;; )
    {
        var_9c999503835471df = [];
        enemytargets = getenemytargets();
        
        foreach ( targ in enemytargets )
        {
            var_def090ecbc180b02 = self.owner worldpointinreticle_circle( targ.origin, 65, 90 );
            
            if ( var_def090ecbc180b02 )
            {
                self.owner thread drawline( self.origin, targ.origin, 10, ( 0, 0, 1 ) );
                var_9c999503835471df[ var_9c999503835471df.size ] = targ;
            }
        }
        
        if ( var_9c999503835471df.size )
        {
            sortedtargets = sortbydistance( var_9c999503835471df, self.origin );
            self.lasttargetlocked = sortedtargets[ 0 ];
            scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( 0.25 );
        }
        
        wait 0.05;
        scripts\mp\hostmigration::waittillhostmigrationdone();
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 4
// Checksum 0x0, Offset: 0xcc7
// Size: 0x22b
function spawnswitchblade( rocket, var_ccfd286d34b473a0, streakinfo, childweapon )
{
    rocket.owner playlocalsound( "ammo_crate_use" );
    playerviewangles = rocket gettagangles( "tag_origin" );
    forwarddir = anglestoforward( playerviewangles );
    rightdir = anglestoright( playerviewangles );
    spawnoffset = ( 100, 100, 100 );
    targetoffset = ( 15000, 15000, 15000 );
    
    if ( var_ccfd286d34b473a0 )
    {
        spawnoffset *= -1;
    }
    
    result = scripts\engine\trace::_bullet_trace( rocket.origin, rocket.origin + forwarddir * targetoffset, 0, rocket );
    targetoffset *= result[ "fraction" ];
    startposition = rocket.origin + rightdir * spawnoffset;
    targetlocation = rocket.origin + forwarddir * targetoffset;
    missile = _magicbullet( makeweapon( childweapon ), startposition, targetlocation, rocket.owner );
    var_1f027877f9775ab8 = rocket getclosesttargetinview( rocket.owner, targetlocation );
    
    if ( isdefined( var_1f027877f9775ab8 ) )
    {
        missile missile_settargetent( var_1f027877f9775ab8 );
    }
    
    missile setcandamage( 1 );
    missile setmissileminimapvisible( 1 );
    missile.team = rocket.team;
    missile.lifeid = rocket.lifeid;
    missile.type = rocket.type;
    missile.owner = rocket.owner;
    missile.entitynumber = missile getentitynumber();
    missile.streakinfo = streakinfo;
    missile.weapon_name = "switch_blade_child_mp";
    level.rockets[ missile.entitynumber ] = missile;
    level thread monitordeath( missile, 0 );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 2
// Checksum 0x0, Offset: 0xefa
// Size: 0x108
function getclosesttargetinview( owner, targetlocation )
{
    targets = getenemytargets( owner );
    closesttarget = undefined;
    lastdistance = undefined;
    
    foreach ( targ in targets )
    {
        if ( !isdefined( targ ) || !isreallyalive( targ ) )
        {
            continue;
        }
        
        if ( istrue( targ.trinityrocketlocked ) )
        {
            continue;
        }
        
        distancecheck = distance2dsquared( targ.origin, targetlocation );
        
        if ( distancecheck < 262144 && istrue( canseetarget( targ ) ) )
        {
            if ( !isdefined( lastdistance ) || distancecheck < lastdistance )
            {
                closesttarget = targ;
                lastdistance = distancecheck;
            }
        }
    }
    
    if ( isdefined( closesttarget ) )
    {
        closesttarget.trinityrocketlocked = 1;
        closesttarget thread watchtarget();
    }
    
    return closesttarget;
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x100b
// Size: 0xa6
function canseetarget( target )
{
    icansee = 0;
    contentoverride = scripts\engine\trace::create_contents( 0, 1, 1, 1, 1, 1, 0 );
    tracepoints = [ target gettagorigin( "j_head" ), target gettagorigin( "j_mainroot" ), target gettagorigin( "tag_origin" ) ];
    
    for ( i = 0; i < tracepoints.size ; i++ )
    {
        if ( !scripts\engine\trace::ray_trace_passed( self.origin, tracepoints[ i ], self, contentoverride ) )
        {
            continue;
        }
        
        icansee = 1;
        break;
    }
    
    return icansee;
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 0
// Checksum 0x0, Offset: 0x10ba
// Size: 0x1b
function watchtarget()
{
    self endon( "disconnect" );
    self waittill( "death" );
    self.trinityrocketlocked = undefined;
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 2
// Checksum 0x0, Offset: 0x10dd
// Size: 0x38
function looptriggeredeffect( effect, missile )
{
    missile endon( "death" );
    level endon( "game_ended" );
    self endon( "death" );
    
    for ( ;; )
    {
        triggerfx( effect );
        wait 0.25;
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x111d
// Size: 0x2e
function getnextmissilespawnindex( oldindex )
{
    index = oldindex + 1;
    
    if ( index == level.dronemissilespawnarray.size )
    {
        index = 0;
    }
    
    return index;
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x1154
// Size: 0x34
function monitorboost( rocket )
{
    rocket endon( "death" );
    
    while ( true )
    {
        rocket.owner waittill( "missileTargetSet" );
        rocket notify( "missileTargetSet" );
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 2
// Checksum 0x0, Offset: 0x1190
// Size: 0x209
function getbestmissilespawnpoint( owner, remotemissilespawnpoints )
{
    validenemies = [];
    
    foreach ( player in level.players )
    {
        if ( !isreallyalive( player ) )
        {
            continue;
        }
        
        if ( player.team == owner.team )
        {
            continue;
        }
        
        if ( player.team == "spectator" )
        {
            continue;
        }
        
        validenemies[ validenemies.size ] = player;
    }
    
    if ( !validenemies.size )
    {
        return remotemissilespawnpoints[ randomint( remotemissilespawnpoints.size ) ];
    }
    
    remotemissilespawnpointsrandomized = array_randomize( remotemissilespawnpoints );
    var_1a2450b2561e9908 = remotemissilespawnpointsrandomized[ 0 ];
    
    foreach ( missilespawn in remotemissilespawnpointsrandomized )
    {
        missilespawn.sightedenemies = 0;
        
        for ( i = 0; i < validenemies.size ; i++ )
        {
            enemy = validenemies[ i ];
            
            if ( !isreallyalive( enemy ) )
            {
                validenemies[ i ] = validenemies[ validenemies.size - 1 ];
                validenemies[ validenemies.size - 1 ] = undefined;
                i--;
                continue;
            }
            
            if ( scripts\engine\trace::_bullet_trace_passed( enemy.origin + ( 0, 0, 32 ), missilespawn.origin, 0, enemy ) )
            {
                missilespawn.sightedenemies += 1;
                return missilespawn;
            }
            
            wait 0.05;
            scripts\mp\hostmigration::waittillhostmigrationdone();
        }
        
        if ( missilespawn.sightedenemies == validenemies.size )
        {
            return missilespawn;
        }
        
        if ( missilespawn.sightedenemies > var_1a2450b2561e9908.sightedenemies )
        {
            var_1a2450b2561e9908 = missilespawn;
        }
    }
    
    return var_1a2450b2561e9908;
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 2
// Checksum 0x0, Offset: 0x13a2
// Size: 0x7d
function missileeyes( player, rocket )
{
    delaytime = 0.5;
    player _freezecontrols( 1 );
    player cameralinkto( rocket, "tag_origin" );
    player controlslinkto( rocket );
    player thermalvisionon();
    player setclientomnvar( "ui_killstreak_health", 1 );
    player setclientomnvar( "ui_killstreak_countdown", gettime() + int( 15000 ) );
    level thread unfreezecontrols( player, delaytime );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 3
// Checksum 0x0, Offset: 0x1427
// Size: 0x39
function unfreezecontrols( player, delaytime, i )
{
    player endon( "disconnect" );
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( delaytime - 0.35 );
    player _freezecontrols( 0 );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x1468
// Size: 0x35
function monitordisownkillstreaks( player )
{
    player endon( "disconnect" );
    player endon( "end_kill_streak" );
    player childthread monitorownerstatus( "joined_team" );
    player childthread monitorownerstatus( "joined_spectators" );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x14a5
// Size: 0x19
function monitorownerstatus( notifymsg )
{
    self waittill( notifymsg );
    level thread returnplayer( self );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x14c6
// Size: 0x3b
function monitorgameend( player )
{
    player endon( "disconnect" );
    player endon( "end_kill_streak" );
    level waittill( "game_ended" );
    gameended = 1;
    level thread returnplayer( player, 0, gameended );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 1
// Checksum 0x0, Offset: 0x1509
// Size: 0x2d
function monitorobjectivecamera( player )
{
    player endon( "end_kill_streak" );
    player endon( "disconnect" );
    level waittill( "objective_cam" );
    level thread returnplayer( player, 1 );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 2
// Checksum 0x0, Offset: 0x153e
// Size: 0x74
function monitordeath( killstreakent, mainmissile )
{
    killstreakent waittill( "death" );
    scripts\mp\hostmigration::waittillhostmigrationdone();
    
    if ( isdefined( killstreakent.targeffect ) )
    {
        killstreakent.targeffect delete();
    }
    
    if ( isdefined( killstreakent.entitynumber ) )
    {
        level.rockets[ killstreakent.entitynumber ] = undefined;
    }
    
    if ( mainmissile )
    {
        level.remotemissileinprogress = undefined;
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 3
// Checksum 0x0, Offset: 0x15ba
// Size: 0x89
function returnplayer( player, instant, gameended )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    if ( !istrue( gameended ) )
    {
        assertmsg( "<dev string:xa4>" );
        self.streakinfo notify( "killstreak_finished_with_deploy_weapon" );
    }
    
    player setclientomnvar( "ui_predator_missile", 2 );
    player notify( "end_kill_streak" );
    player thermalvisionoff();
    player controlsunlink();
    player cameraunlink();
    player setclientomnvar( "ui_predator_missile", 0 );
    player val::reset_all( "use_drone_hive" );
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 2
// Checksum 0x0, Offset: 0x164b
// Size: 0x90
function watchgastrigger( missileowner, weaponname )
{
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "trigger", ent );
        
        if ( !isplayer( ent ) )
        {
            continue;
        }
        
        if ( level.teambased && ent.team == missileowner.team && ent != missileowner )
        {
            continue;
        }
        
        if ( istrue( ent.gettinggassed ) )
        {
            continue;
        }
        
        thread applygasdamageovertime( missileowner, weaponname, ent );
    }
}

// Namespace dronehive / scripts\mp\killstreaks\dronehive
// Params 3
// Checksum 0x0, Offset: 0x16e3
// Size: 0x9a
function applygasdamageovertime( missileowner, missileweapon, victim )
{
    victim endon( "disconnect" );
    victim.gettinggassed = 1;
    
    while ( victim istouching( self ) )
    {
        victim dodamage( 20, self.origin, missileowner, self, "MOD_EXPLOSIVE", missileweapon );
        result = waittill_any_timeout_1( 0.5, "death" );
        
        if ( result == "death" )
        {
            break;
        }
    }
    
    if ( istrue( victim.gettinggassed ) )
    {
        victim.gettinggassed = undefined;
    }
}

