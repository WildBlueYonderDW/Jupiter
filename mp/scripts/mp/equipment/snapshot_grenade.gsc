#using script_74b851b7aa1ef32d;
#using scripts\common\ae_utility;
#using scripts\common\utility;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\damagefeedback;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\ent_manager;
#using scripts\cp_mp\killstreaks\recon_drone;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\squad_utility;
#using scripts\cp_mp\utility\train_utility;
#using scripts\engine\utility;
#using scripts\mp\damage;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\movers;
#using scripts\mp\outline;
#using scripts\mp\perks\perks;
#using scripts\mp\pmc_missions;
#using scripts\mp\utility\damage;
#using scripts\mp\utility\equipment;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\script;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\weapon;
#using scripts\mp\weapons;

#namespace snapshot_grenade;

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 2
// Checksum 0x0, Offset: 0x574
// Size: 0x221
function snapshot_grenade_used( grenade, isgl )
{
    grenade thread notifyafterframeend( "death", "end_explode" );
    grenade endon( "end_explode" );
    grenade thread function_d69277b486f06d35();
    scripts\cp_mp\challenges::function_b0f754c8a379154e( "equip_snapshot_grenade", self, undefined, function_e2ff8f4b4e94f723( #"hash_83a2d67994d7e295", #"use" ) );
    
    if ( isgl )
    {
        grenade waittill( "missile_stuck", ent, hitloc, surfacetype, velocity, position );
    }
    else
    {
        grenade setotherent( self );
        grenade thread scripts\mp\damage::monitordamage( 19, "hitequip", &snapshot_grenade_handle_fatal_damage, &snapshot_grenade_handle_damage );
        scripts\cp_mp\emp_debuff::add_emp_ent( grenade );
        grenade scripts\cp_mp\emp_debuff::set_apply_emp_callback( &snapshot_grenade_empapplied );
        
        if ( issharedfuncdefined( "emp", "setEMP_Applied_Callback" ) )
        {
            grenade [[ getsharedfunc( "emp", "setEMP_Applied_Callback" ) ]]( &snapshot_grenade_empapplied );
        }
        
        grenade thread snapshot_grenade_watch_cleanup();
        grenade waittill( "explode", position );
    }
    
    detectionradius = grenade.bundle.detectionradius;
    duration = grenade.bundle.outlineduration;
    
    if ( isdefined( grenade.weapon_object.weaponcustomsettings ) )
    {
        if ( isdefined( grenade.weapon_object.weaponcustomsettings.duration ) )
        {
            duration = grenade.weapon_object.weaponcustomsettings.duration;
        }
        
        if ( isdefined( grenade.weapon_object.weaponcustomsettings.radius ) )
        {
            detectionradius = grenade.weapon_object.weaponcustomsettings.radius;
        }
    }
    
    thread snapshot_grenade_watch_flight( position, grenade.var_37d6f0688aeef75d, detectionradius, duration, grenade.bundle );
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x79d
// Size: 0x52
function private function_d69277b486f06d35()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "missile_stuck" );
    self waittill( "missile_water_impact", var_850fdf3fb1c7eb84, var_53f81081d4e7f40b, var_71c76f81eb0c95ee );
    self.var_37d6f0688aeef75d = 1;
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 3
// Checksum 0x0, Offset: 0x7f7
// Size: 0x104
function snapshot_get_flight_dest( position, direction, ignorelist )
{
    direction = ( 0, 0, 1 );
    caststart = position + direction;
    castend = caststart + direction * 137;
    contents = physics_createcontents( [ "physicscontents_glass", "physicscontents_item", "physicscontents_vehicle", "physicscontents_missileclip" ] );
    castresult = physics_raycast( caststart, castend, contents, ignorelist, 0, "physicsquery_closest", 1 );
    
    if ( isdefined( castresult ) && castresult.size > 0 )
    {
        castend = castresult[ 0 ][ "position" ];
        
        if ( true )
        {
            castdist = vectordot( castend - caststart, direction );
            
            if ( castdist > 0 )
            {
                if ( castdist >= 50 )
                {
                    castdist = min( castdist - 25, 112 );
                }
                else
                {
                    castdist /= 2;
                }
                
                castend = caststart + direction * castdist;
            }
        }
    }
    else
    {
        castend = caststart + direction * 112;
    }
    
    return castend;
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x904
// Size: 0x5c
function entity_movingplatform_update()
{
    self endon( "death" );
    self.velocity = ( 0, 0, 0 );
    
    while ( true )
    {
        old_origin = self.origin;
        wait 0.05;
        self.velocity = 20 * ( self.origin - old_origin );
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 5
// Checksum 0x0, Offset: 0x968
// Size: 0x482
function snapshot_grenade_watch_flight( position, var_800ee321b0d045e5, radius, duration, bundle )
{
    grenade = _launchgrenade( "snapshot_grenade_mp", position, ( 0, 0, 0 ), 100, 1 );
    grenade scripts\cp_mp\ent_manager::registerspawn( 3, &snapshot_grenade_delete );
    grenade setotherent( self );
    grenade setscriptablepartstate( "beacon", "active", 0 );
    grenade setscriptablepartstate( "anims", "deploy", 0 );
    grenade missilehidetrail();
    grenade.equipmentref = "equip_snapshot_grenade";
    grenade.owner = self;
    grenade thread scripts\mp\damage::monitordamage( 19, "hitequip", &snapshot_grenade_handle_fatal_damage, &snapshot_grenade_handle_damage );
    scripts\cp_mp\emp_debuff::add_emp_ent( grenade );
    grenade scripts\cp_mp\emp_debuff::set_apply_emp_callback( &snapshot_grenade_empapplied );
    grenade thread snapshot_grenade_watch_cleanup();
    grenade endon( "death" );
    dangericon = _launchgrenade( "snapshot_grenade_danger_mp", grenade.origin, ( 0, 0, 0 ), 100, 1 );
    dangericon.weapon_name = "snapshot_grenade_danger_mp";
    dangericon linkto( grenade );
    
    if ( isplayer( self ) )
    {
        dangericon hidefromplayer( self );
    }
    
    grenade thread snapshot_grenade_cleanup_danger_icon( dangericon );
    data = spawnstruct();
    data.skipdeath = 1;
    grenade thread scripts\mp\movers::handle_moving_platforms( data );
    mover = spawn( "script_model", grenade.origin );
    mover.angles = grenade.angles;
    mover setmodel( "tag_origin" );
    grenade linkto( mover, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    grenade thread snapshot_grenade_cleanup_mover( mover );
    waitframe();
    ismovingplatformtrain = undefined;
    
    if ( istrue( grenade.touchedmovingplatform ) )
    {
        grenade thread entity_movingplatform_update();
    }
    
    destdir = ( 0, 0, 1 );
    destpos = snapshot_get_flight_dest( position, destdir, [ grenade, dangericon ] );
    destdist = vectordot( destpos - position, destdir );
    destangles = ( 0, 0, 0 );
    
    if ( destdist > 0 )
    {
        destratio = destdist / 112;
        desttime = 0.65 * destratio;
        var_d9936f1afe54db08 = desttime * 0.19;
        var_baa9727310cc90c1 = desttime * 0.6;
        var_b229534034874cef = 0.3 * destratio;
        var_ca262de1cd84def1 = desttime * 0;
        var_b34668c30f214b1c = desttime * 0.35;
        mover rotateto( destangles, var_b229534034874cef, var_ca262de1cd84def1, var_b34668c30f214b1c );
        
        if ( isdefined( grenade.lastmovingplatform ) )
        {
            ismovingplatformtrain = scripts\cp_mp\utility\train_utility::is_moving_platform_train( grenade.lastmovingplatform );
            
            if ( ismovingplatformtrain )
            {
                mover linkto( grenade.lastmovingplatform );
            }
        }
        
        wait 0.3;
        
        if ( istrue( ismovingplatformtrain ) )
        {
            mover unlink();
            destpos += grenade.velocity * desttime;
        }
        
        if ( istrue( var_800ee321b0d045e5 ) )
        {
            grenade setscriptablepartstate( "water", "active", 0 );
        }
        else
        {
            grenade setscriptablepartstate( "dust", "active", 0 );
        }
        
        grenade setscriptablepartstate( "anims", "idle", 0 );
        mover moveto( destpos, desttime, var_d9936f1afe54db08, var_baa9727310cc90c1 );
        grenade childthread scripts\mp\utility\equipment::watch_flight_collision();
        grenade waittill_any_timeout_1( desttime, "collision_with_platform" );
    }
    else
    {
        mover.angles = destangles;
        wait 0.3;
    }
    
    if ( istrue( ismovingplatformtrain ) )
    {
        mover linkto( grenade.lastmovingplatform );
    }
    
    detectiondelay = 0;
    wait detectiondelay;
    grenade setscriptablepartstate( "detect", "active", 0 );
    grenade setscriptablepartstate( "anims", "idle", 0 );
    grenade setscriptablepartstate( "beacon", "neutral", 0 );
    wait 0.5;
    grenade snapshot_grenade_detect( radius, duration, bundle );
    grenade thread snapshot_grenade_destroy();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 3
// Checksum 0x0, Offset: 0xdf2
// Size: 0x23e
function snapshot_grenade_detect( radius, duration, bundle )
{
    owner = self.owner;
    
    if ( !isdefined( owner ) )
    {
        return;
    }
    
    position = self.origin;
    angles = self.angles;
    outlinedata = snapshot_grenade_createoutlinedata( owner, position, bundle );
    function_daf6c5596bb31dff( "decoy_grenade", self.owner, self.origin, 512 );
    raycontents = physics_createcontents( [ "physicscontents_missileclip", "physicscontents_glass", "physicscontents_water", "physicscontents_item", "physicscontents_vehicle" ] );
    detectionradius = ter_op( isdefined( radius ), radius, bundle.detectionradius );
    playertargets = utility::function_2d7fd59d039fa69b( position, detectionradius );
    
    foreach ( player in playertargets )
    {
        if ( !isreallyalive( player ) )
        {
            continue;
        }
        
        if ( !istrue( scripts\cp_mp\utility\player_utility::playersareenemies( owner, player, 1 ) ) )
        {
            continue;
        }
        
        if ( istrue( bundle.requirelos ) )
        {
            caststart = position;
            castend = player geteye();
            castresult = physics_raycast( caststart, castend, raycontents, undefined, 0, "physicsquery_closest", 1 );
            
            if ( isdefined( castresult ) && castresult.size > 0 )
            {
                continue;
            }
        }
        
        scripts\cp_mp\challenges::function_b0f754c8a379154e( "equip_snapshot_grenade", owner, undefined, function_e2ff8f4b4e94f723( #"hash_83a2d67994d7e295", #"hit" ) );
        scripts\mp\pmc_missions::function_5d2504919b717097( owner, player );
        snapshot_grenade_applysnapshot( player, owner, outlinedata, duration, undefined, undefined, bundle );
    }
    
    if ( istrue( bundle.pingenabled ) && isplayer( owner ) && !istrue( owner.ksempd ) )
    {
        triggerportableradarping( position, owner, detectionradius, 500, "specialty_snapshot_immunity" );
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 3
// Checksum 0x0, Offset: 0x1038
// Size: 0x94
function snapshot_grenade_createoutlinedata( owner, position, bundle )
{
    outlinedata = undefined;
    
    if ( isdefined( bundle ) && istrue( bundle.outlineenabled ) )
    {
        outlinedata = spawnstruct();
        outlinedata.owner = owner;
        outlinedata.position = position;
        outlinedata.isalive = 1;
        outlinedata.targets = [];
        outlinedata.endtimes = [];
        outlinedata.outlineids = [];
    }
    
    return outlinedata;
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 7
// Checksum 0x0, Offset: 0x10d5
// Size: 0x44d
function snapshot_grenade_applysnapshot( victim, attacker, outlinedata, duration, var_3a0fd085ff7fb126, skipscoreevents, bundle )
{
    if ( !isdefined( var_3a0fd085ff7fb126 ) )
    {
        var_3a0fd085ff7fb126 = 0;
    }
    
    if ( !isdefined( duration ) )
    {
        duration = bundle.outlineduration;
    }
    
    if ( victim scripts\mp\utility\perk::_hasperk( "specialty_snapshot_immunity" ) )
    {
        attacker updatedamagefeedback( "hittacresist" );
        victim scripts\mp\perks\perks::activateperk( "specialty_tac_resist" );
        return;
    }
    
    if ( victim ent_flag( "snapshot_immunity" ) )
    {
        return;
    }
    
    attacker updatedamagefeedback( "" );
    
    if ( istrue( bundle.outlineenabled ) )
    {
        entnum = victim getentitynumber();
        outlinedata.targets[ entnum ] = victim;
        outlinedata.endtimes[ entnum ] = gettime() + duration;
        
        if ( scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587() )
        {
            victim scripts\mp\outline::hudoutline_add_channel_internal( "equipment", 3, bundle.outlineasset );
        }
        
        if ( !isagent( attacker ) )
        {
            if ( issharedfuncdefined( "snapshot", "override_show_to", 0 ) )
            {
                outlinedata.outlineids[ entnum ] = self [[ getsharedfunc( "snapshot", "override_show_to" ) ]]( victim, attacker.team, bundle.outlineasset, "equipment" );
            }
            else if ( !level.teambased || var_3a0fd085ff7fb126 )
            {
                outlinedata.outlineids[ entnum ] = scripts\mp\utility\outline::outlineenableforplayer( victim, attacker, bundle.outlineasset, "equipment" );
            }
            else if ( shouldmodesetsquads() )
            {
                outlinedata.outlineids[ entnum ] = scripts\mp\utility\outline::outlineenableforsquad( victim, attacker.team, attacker.sessionsquadid, bundle.outlineasset, "equipment" );
            }
            else
            {
                outlinedata.outlineids[ entnum ] = function_6fd4060b24c5926c( victim, attacker.team, bundle.outlineasset, "equipment" );
            }
        }
        else
        {
            outlinedata.outlineids[ entnum ] = function_6fd4060b24c5926c( victim, attacker.team, bundle.outlineasset, "equipment" );
        }
        
        if ( isplayer( victim ) || isbot( victim ) )
        {
            victim scripts\mp\utility\outline::_hudoutlineviewmodelenable( bundle.outlineasset, 0 );
            victim scripts\cp_mp\killstreaks\recon_drone::function_fa08d1d78cf5cb01();
        }
        
        outlinedata thread snapshot_grenade_update_outlines( attacker, bundle );
        
        if ( !istrue( skipscoreevents ) )
        {
            attacker namespace_a850435086c88de3::doonactionscoreevent( 0, "snapshotTag" );
        }
    }
    
    if ( istrue( bundle.markerenabled ) )
    {
        attacker thread snapshot_grenade_create_marker( victim gettagorigin( bundle.markertag ), victim.angles, victim, bundle );
    }
    
    if ( istrue( bundle.var_25de9cd26a8f1e2a ) )
    {
        victim function_f3bb4f4911a1beb2( "perk", "givePerk", "specialty_self_tracked" );
        victim thread function_69b06aec4f713f3c( attacker, duration / 1000 );
    }
    
    victim.lastsnapshotgrenadetime = gettime();
    
    if ( isagent( attacker ) )
    {
        foreach ( agent in utility::function_2d7fd59d039fa69b( victim.origin, 800, 0 ) )
        {
            if ( !isdefined( attacker ) || !isdefined( attacker.team ) )
            {
                continue;
            }
            
            if ( !isdefined( agent ) || !isdefined( agent.team ) )
            {
                continue;
            }
            
            if ( agent.team != attacker.team )
            {
                continue;
            }
            
            if ( isdefined( agent.fnisinstealthcombat ) && istrue( agent [[ agent.fnisinstealthcombat ]]() ) )
            {
                agent getenemyinfo( victim );
                continue;
            }
            
            agent aieventlistenerevent( "player_snapshotted", victim, victim.origin );
        }
        
        return;
    }
    
    if ( !istrue( skipscoreevents ) )
    {
        attacker scripts\mp\damage::combatrecordtacticalstat( "equip_snapshot_grenade" );
        attacker scripts\mp\utility\stats::incpersstat( "snapshotHits", 1 );
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x152a
// Size: 0x82
function snapshot_grenade_destroy()
{
    self setscriptablepartstate( "destroy", "active", 0 );
    self setscriptablepartstate( "beacon", "neutral", 0 );
    self setscriptablepartstate( "dust", "neutral", 0 );
    self setscriptablepartstate( "water", "neutral", 0 );
    self setscriptablepartstate( "detect", "neutral", 0 );
    self setscriptablepartstate( "anims", "neutral", 0 );
    self missilehidetrail();
    thread snapshot_grenade_delete( 0.35 );
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 1
// Checksum 0x0, Offset: 0x15b4
// Size: 0x42
function snapshot_grenade_delete( delay )
{
    self notify( "death" );
    scripts\cp_mp\ent_manager::deregisterspawn();
    self endon( "death" );
    self.exploding = 1;
    self setcandamage( 0 );
    
    if ( isdefined( delay ) )
    {
        wait delay;
    }
    
    self delete();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 1
// Checksum 0x0, Offset: 0x15fe
// Size: 0xcd
function snapshot_grenade_handle_damage( data )
{
    attacker = data.attacker;
    objweapon = data.objweapon;
    meansofdeath = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    
    if ( isbulletdamage( meansofdeath ) )
    {
        if ( isdefined( objweapon ) )
        {
            hits = 1;
            
            if ( damage >= scripts\mp\weapons::minegettwohitthreshold() )
            {
                hits += 1;
            }
            
            if ( scripts\mp\utility\damage::isfmjdamage( objweapon, meansofdeath ) )
            {
                hits *= 2;
            }
            
            damage = hits * 19;
        }
    }
    
    scripts\mp\weapons::equipmenthit( self.owner, attacker, objweapon, meansofdeath );
    return damage;
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 1
// Checksum 0x0, Offset: 0x16d4
// Size: 0x5f
function snapshot_grenade_handle_fatal_damage( data )
{
    attacker = data.attacker;
    
    if ( isdefined( attacker ) && scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, attacker ) )
    {
        attacker notify( "destroyed_equipment" );
        attacker scripts\mp\killstreaks\killstreaks::givescoreforequipment( self, data.objweapon );
    }
    
    thread snapshot_grenade_destroy();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 1
// Checksum 0x0, Offset: 0x173b
// Size: 0x76
function snapshot_grenade_empapplied( data )
{
    if ( !isdefined( self.owner ) )
    {
        return;
    }
    
    attacker = data.attacker;
    
    if ( istrue( scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, attacker ) ) )
    {
        attacker notify( "destroyed_equipment" );
        attacker scripts\mp\killstreaks\killstreaks::givescoreforequipment( self, undefined, 1 );
    }
    
    if ( isplayer( attacker ) )
    {
        attacker updatedamagefeedback( "" );
    }
    
    thread snapshot_grenade_destroy();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x17b9
// Size: 0x1d
function snapshot_grenade_watch_cleanup()
{
    self endon( "death" );
    snapshot_grenade_watch_cleanup_end_early();
    
    if ( isdefined( self ) )
    {
        thread snapshot_grenade_destroy();
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x17de
// Size: 0x3f
function snapshot_grenade_watch_cleanup_end_early()
{
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level endon( "game_ended" );
    
    while ( true )
    {
        waitframe();
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 1
// Checksum 0x0, Offset: 0x1825
// Size: 0x24
function snapshot_grenade_cleanup_mover( mover )
{
    mover endon( "death" );
    self waittill( "death" );
    wait 1;
    mover delete();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 1
// Checksum 0x0, Offset: 0x1851
// Size: 0x21
function snapshot_grenade_cleanup_danger_icon( dangericon )
{
    dangericon endon( "death" );
    self waittill( "death" );
    dangericon delete();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 2
// Checksum 0x0, Offset: 0x187a
// Size: 0x1a4
function snapshot_grenade_update_outlines( attacker, bundle )
{
    self endon( "death" );
    self.owner endon( "death_or_disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level endon( "game_ended" );
    
    if ( !istrue( self.isalive ) )
    {
        return;
    }
    
    self notify( "update" );
    self endon( "update" );
    thread snapshot_grenade_watch_cleanup_outlines();
    
    while ( self.targets.size > 0 )
    {
        foreach ( id, target in self.targets )
        {
            target = self.targets[ id ];
            endtime = self.endtimes[ id ];
            outlineid = self.outlineids[ id ];
            
            if ( isdefined( bundle ) && istrue( bundle.var_49e7043f0c818c3 ) && istrue( target _hasperk( "specialty_snapshot_counter_smoke" ) ) )
            {
                continue;
            }
            
            if ( !isdefined( target ) || !isreallyalive( target ) || gettime() >= endtime || isdefined( attacker ) && istrue( attacker.ksempd ) )
            {
                scripts\mp\utility\outline::outlinedisable( outlineid, target );
                
                if ( isdefined( target ) )
                {
                    target scripts\mp\utility\outline::_hudoutlineviewmodeldisable();
                }
                
                self.targets[ id ] = undefined;
                self.endtimes[ id ] = undefined;
                self.outlineids[ id ] = undefined;
            }
        }
        
        waitframe();
    }
    
    thread snapshot_grenade_clear_outlines();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x1a26
// Size: 0x1f
function snapshot_grenade_watch_cleanup_outlines()
{
    self endon( "death" );
    self endon( "update" );
    snapshot_grenade_watch_cleanup_outlines_end_early();
    thread snapshot_grenade_clear_outlines();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x1a4d
// Size: 0x3f
function snapshot_grenade_watch_cleanup_outlines_end_early()
{
    self.owner endon( "death_or_disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level endon( "game_ended" );
    
    while ( true )
    {
        waitframe();
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x1a94
// Size: 0xac
function snapshot_grenade_clear_outlines()
{
    self notify( "death" );
    self.isalive = 0;
    
    foreach ( id, target in self.targets )
    {
        target = self.targets[ id ];
        outlineid = self.outlineids[ id ];
        scripts\mp\utility\outline::outlinedisable( outlineid, target );
        
        if ( isdefined( target ) && ( isplayer( target ) || isbot( target ) ) )
        {
            target scripts\mp\utility\outline::_hudoutlineviewmodeldisable();
        }
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 4
// Checksum 0x0, Offset: 0x1b48
// Size: 0xed
function function_6fd4060b24c5926c( var_f20913fec7561c5f, var_fa3b23d51c2dc7, hudoutlineassetname, prioritygroup )
{
    ignorelist = [];
    var_49971b20aeea513f = getdvarint( @"hash_10ea538e1c6ce567", 1 );
    
    if ( istrue( var_49971b20aeea513f ) )
    {
        if ( scripts\mp\utility\teams::isgameplayteam( var_fa3b23d51c2dc7 ) )
        {
            playersvisibleto = scripts\mp\utility\teams::getteamdata( var_fa3b23d51c2dc7, "players" );
            
            foreach ( player in playersvisibleto )
            {
                if ( isdefined( player ) && player.sessionstate == "spectator" )
                {
                    ignorelist[ ignorelist.size ] = player;
                    player thread function_3c0efada1f34af5d( var_f20913fec7561c5f );
                }
            }
        }
    }
    
    return scripts\mp\utility\outline::outlineenableforteam( var_f20913fec7561c5f, var_fa3b23d51c2dc7, hudoutlineassetname, prioritygroup, ignorelist );
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 1
// Checksum 0x0, Offset: 0x1c3e
// Size: 0x8c
function function_3c0efada1f34af5d( var_f20913fec7561c5f )
{
    self endon( "disconnect" );
    var_f20913fec7561c5f endon( "disconnect" );
    level endon( "game_ended" );
    var_16877d5609439072 = var_f20913fec7561c5f getentitynumber();
    
    if ( isplayer( var_f20913fec7561c5f ) && !isbot( var_f20913fec7561c5f ) )
    {
        var_16877d5609439072 = var_f20913fec7561c5f getxuid();
    }
    
    self notify( "force_disable_outline_" + var_16877d5609439072 );
    self endon( "force_disable_outline_" + var_16877d5609439072 );
    self waittill( "spawned_player" );
    
    if ( scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587() )
    {
        var_f20913fec7561c5f scripts\mp\outline::function_32dfa50c47325abe( self, "equipment", 1 );
        return;
    }
    
    var_f20913fec7561c5f hudoutlinedisableforclient( self );
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 4
// Checksum 0x0, Offset: 0x1cd2
// Size: 0xd2
function snapshot_grenade_create_marker( position, angles, target, bundle )
{
    marker = spawn( "script_model", position );
    marker.angles = angles;
    
    if ( isdefined( target ) && bundle.liveupdateduration > 0 )
    {
        marker linkto( target );
    }
    
    marker setmodel( bundle.markermodel );
    marker setotherent( self );
    marker setscriptablepartstate( "effects", "active", 0 );
    marker snapshot_grenade_watch_marker_end_early( self, bundle.markerduration, target, bundle.liveupdateduration, bundle );
    level.var_ca9f2990b5bba40 = bundle.markerduration;
    
    if ( isdefined( marker ) )
    {
        marker delete();
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 5
// Checksum 0x0, Offset: 0x1dac
// Size: 0xd3
function snapshot_grenade_watch_marker_end_early( owner, durationms, target, liveupdatedurationms, bundle )
{
    self endon( "death" );
    owner endon( "death_or_disconnect" );
    level endon( "game_ended" );
    endtime = gettime() + durationms;
    liveupdateendtime = ter_op( bundle.liveupdateduration > 0, gettime() + bundle.liveupdateduration, undefined );
    
    while ( endtime > gettime() )
    {
        if ( isdefined( liveupdateendtime ) )
        {
            if ( liveupdateendtime < gettime() )
            {
                self unlink();
                liveupdateendtime = undefined;
            }
            else if ( !isdefined( target ) )
            {
                self unlink();
                liveupdateendtime = undefined;
            }
            else if ( !isreallyalive( target ) )
            {
                self unlink();
                liveupdateendtime = undefined;
            }
        }
        
        waitframe();
    }
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x1e87
// Size: 0x1c
function function_905247d1b30c84f1()
{
    return isdefined( level.var_ca9f2990b5bba40 ) ? level.var_ca9f2990b5bba40 : 0;
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 2
// Checksum 0x0, Offset: 0x1eac
// Size: 0x32
function function_69b06aec4f713f3c( attacker, duration )
{
    self endon( "death" );
    self endon( "update" );
    function_b18acb87cf98dfba( attacker, duration );
    thread function_9adb54275e3a9197();
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 2
// Checksum 0x0, Offset: 0x1ee6
// Size: 0x23
function function_b18acb87cf98dfba( attacker, duration )
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    wait duration;
}

// Namespace snapshot_grenade / scripts\mp\equipment\snapshot_grenade
// Params 0
// Checksum 0x0, Offset: 0x1f11
// Size: 0x18
function function_9adb54275e3a9197()
{
    function_f3bb4f4911a1beb2( "perk", "removePerk", "specialty_self_tracked" );
}

