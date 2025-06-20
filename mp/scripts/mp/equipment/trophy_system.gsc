#using script_13865ca76df87ea;
#using script_16ea1b94f0f381b3;
#using scripts\common\ae_utility;
#using scripts\common\elevators;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\damagefeedback;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\ent_manager;
#using scripts\cp_mp\entityheadicons;
#using scripts\cp_mp\equipment\haywire;
#using scripts\cp_mp\supers\supers;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\cp_mp\weapon;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\analyticslog;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\damage;
#using scripts\mp\equipment;
#using scripts\mp\equipment\snapshot_grenade;
#using scripts\mp\equipment\trophy_system;
#using scripts\mp\equipment_interact;
#using scripts\mp\gamelogic;
#using scripts\mp\gametypes\br_pickups;
#using scripts\mp\hostmigration;
#using scripts\mp\hud_message;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\perks\perk_equipmentping;
#using scripts\mp\sentientpoolmanager;
#using scripts\mp\supers;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\print;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\weapon;
#using scripts\mp\weapons;

#namespace trophy_system;

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x9cd
// Size: 0x15d
function trophy_init()
{
    levelstruct = spawnstruct();
    levelstruct.var_89c25693a4a496ff = [];
    trophybundle = scripts\cp_mp\supers\supers::function_bf9c7e9dd30180e3( "super_trophy" );
    
    if ( !isdefined( trophybundle ) )
    {
        trophybundle = spawnstruct();
    }
    
    if ( isdefined( trophybundle.var_79d1530167958e93 ) && trophybundle.var_79d1530167958e93.size > 0 )
    {
        foreach ( idx, barrel in trophybundle.var_79d1530167958e93 )
        {
            levelstruct.var_89c25693a4a496ff[ idx ] = barrel;
        }
    }
    else
    {
        for ( idx = 0; idx < 3 ; idx++ )
        {
            barrel = spawnstruct();
            barrel.tag = "tag_barrel_" + idx + 1;
            barrel.part = "barrel" + idx + 1;
            levelstruct.var_89c25693a4a496ff[ idx ] = barrel;
        }
    }
    
    levelstruct.timeout = getdvarfloat( @"hash_d9b119233df13ac1", 45 );
    levelstruct.explosionxmodel = default_to( trophybundle.var_328d916a2837b8b1, "trophy_system_mp_explode" );
    level.trophy = levelstruct;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 3
// Checksum 0x0, Offset: 0xb32
// Size: 0x29
function trophy_set( equipmentref, slot, variantid )
{
    trophy_clearstored();
    trophy_populatestored();
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0xb63
// Size: 0x2
function trophy_onsuperset()
{
    
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 2
// Checksum 0x0, Offset: 0xb6d
// Size: 0x1a
function trophy_unset( equipmentref, slot )
{
    trophy_clearstored();
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb8f
// Size: 0x50
function private function_1d2418d7aa544534()
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "missile_stuck" );
    self waittill( "missile_water_impact", var_850fdf3fb1c7eb84, var_53f81081d4e7f40b, var_71c76f81eb0c95ee );
    thread function_74c86105e1bfe367( var_53f81081d4e7f40b );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xbe7
// Size: 0x79
function private function_74c86105e1bfe367( var_53f81081d4e7f40b )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    self endon( "missile_stuck" );
    currentdepth = 0;
    
    while ( currentdepth < 20 )
    {
        currentdepth = abs( var_53f81081d4e7f40b[ 2 ] - self.origin[ 2 ] );
        
        if ( currentdepth > 20 )
        {
            self.owner thread function_90dfe835641ca526();
            thread trophy_shutdownanddestroy( 0 );
        }
        
        waitframe();
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0xc68
// Size: 0x26
function function_90dfe835641ca526()
{
    if ( scripts\cp_mp\utility\game_utility::isbrstylegametype() )
    {
        delaythread( 2.5, &function_ffb7ecaf8fce4a9a );
        return;
    }
    
    scripts\mp\supers::refundsuper();
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0xc96
// Size: 0x8d
function function_ffb7ecaf8fce4a9a()
{
    fakepickup = spawnstruct();
    fakepickup.scriptablename = "brloot_offhand_trophysystem";
    fakepickup.origin = self.origin;
    fakepickup.count = 1;
    fakepickup.var_8598d3d3bc3d9ceb = 1;
    forcebackpack = 0;
    
    if ( isdefined( self.super ) && istrue( self.var_1066fbd86c88a6df ) )
    {
        forcebackpack = 1;
    }
    
    scripts\mp\gametypes\br_pickups::function_b5f5576a0017c089( fakepickup, undefined, self, undefined, undefined, undefined, forcebackpack );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0xd2b
// Size: 0x154
function function_857afda0a870989f( grenade )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    grenade endon( "death" );
    relaunchvelocity = getdvarint( @"hash_d57482b850330a6", 150 );
    grenade childthread function_1d2418d7aa544534();
    
    while ( true )
    {
        grenade childthread trophy_watch_flight( self );
        grenade waittill( "missile_stuck", var_82d5e3b42d0191c9, hitentpart, surfacetype, velocity, position, hitnormal );
        var_cb4d3248c7f2eadf = 0;
        
        if ( isdefined( var_82d5e3b42d0191c9 ) )
        {
            if ( var_82d5e3b42d0191c9 scripts\cp_mp\vehicles\vehicle::isvehicle() )
            {
                if ( isdefined( hitentpart ) )
                {
                    hitentpart = scripts\common\vehicle::function_8ed0ffa3f8be7c75( hitentpart );
                    iswheel = issubstr( hitentpart, "wheel" );
                    
                    if ( iswheel )
                    {
                        var_cb4d3248c7f2eadf = 1;
                    }
                }
            }
        }
        
        if ( var_cb4d3248c7f2eadf )
        {
            grenade unlink();
            offsetvec = hitnormal + self gettagorigin( "j_spineupper" ) - grenade.origin;
            neworigin = grenade.origin + vectornormalize( offsetvec ) * 10;
            grenade = scripts\mp\utility\weapon::_launchgrenade( "trophy_mp", neworigin, hitnormal * relaunchvelocity, undefined, 1, grenade );
            continue;
        }
        
        break;
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0xe88
// Size: 0x504
function trophy_used( grenade )
{
    grenade endon( "death" );
    self endon( "disconnect" );
    printgameaction( "trophy spawned", self );
    grenade.bundle = scripts\cp_mp\supers\supers::function_bf9c7e9dd30180e3( "super_trophy" );
    grenade scripts\cp_mp\ent_manager::registerspawn( 2, &sweeptrophy );
    superinfo = undefined;
    superbundle = undefined;
    model_name = undefined;
    
    if ( utility::issharedfuncdefined( "player", "getCurrentSuper" ) )
    {
        superinfo = self [[ utility::getsharedfunc( "player", "getCurrentSuper" ) ]]();
        superbundle = superinfo.staticdata.bundle;
    }
    
    if ( isdefined( superbundle ) && level.allowsupers )
    {
        var_9b32d1936831f5aa = function_71efed8bf57f1d39( superbundle, superinfo.blueprintindex );
        grenade function_f88fb16414b87f60( var_9b32d1936831f5aa, #"projectilemodel" );
    }
    
    thread scripts\mp\weapons::monitordisownedgrenade( self, grenade );
    grenade thread function_1d2418d7aa544534();
    grenade thread trophy_hideandshowaftertime();
    function_857afda0a870989f( grenade );
    
    if ( isdefined( level.var_ca4e08767cbdae12 ) )
    {
        canplant = grenade [[ level.var_ca4e08767cbdae12 ]]();
        
        if ( !canplant )
        {
            scripts\mp\supers::refundsuper();
            scripts\mp\hud_message::showerrormessage( "EQUIPMENT/PLANT_FAILED" );
            grenade delete();
            return;
        }
    }
    
    grenade setotherent( self );
    grenade setnodeploy( 1 );
    grenade.issuper = isdefined( self.super ) && self.super.staticdata.ref == "super_trophy";
    grenade.superid = level.superglobals.staticsuperdata[ "super_trophy" ].id;
    grenade.usedcount = 0;
    grenade.deployingplayer = self;
    var_307667d0142f2035 = _hasperk( "specialty_rugged_eqp" );
    
    if ( var_307667d0142f2035 )
    {
        grenade.hasruggedeqp = 1;
    }
    
    if ( !istrue( grenade.issuper ) )
    {
        grenade.ammo = trophy_removestored();
        
        if ( !isdefined( grenade.ammo ) )
        {
            grenade.ammo = 3;
        }
        
        /#
            if ( getdvarint( @"hash_20d714b15057681f", 0 ) == 1 )
            {
                grenade.ammo = 3;
            }
        #/
        
        grenade thread makeexplosiveusabletag( "tag_use", 1 );
    }
    else
    {
        maxammo = isdefined( grenade.bundle ) && isdefined( grenade.bundle.var_d3e2a33f25aa34f8 ) ? grenade.bundle.var_d3e2a33f25aa34f8 : 3;
        grenade.ammo = maxammo;
    }
    
    onequipmentplanted( grenade, "equip_trophy", &trophy_shutdownanddestroy );
    thread monitordisownedequipment( self, grenade );
    grenade scripts\mp\sentientpoolmanager::registersentient( "Tactical_Static", self );
    grenade.explosion = trophy_createexplosion( grenade );
    trophymaxhealth = default_to( grenade.bundle.var_f96f1b8352a4d4e9, 100 );
    var_e2fd764179de2d27 = default_to( grenade.bundle.var_d37a7103c63003c4, 200 );
    maxhealth = ter_op( var_307667d0142f2035, var_e2fd764179de2d27, trophymaxhealth );
    damagefeedback = "hitequip";
    grenade thread scripts\mp\damage::monitordamage( maxhealth, damagefeedback, &trophy_handlefataldamage, &trophy_handledamage, 0 );
    grenade function_641996b5e113c5c6( grenade, &trophy_applyempcallback );
    
    if ( issharedfuncdefined( "emp", "setEMP_Applied_Callback" ) )
    {
        grenade [[ getsharedfunc( "emp", "setEMP_Applied_Callback" ) ]]( &trophy_disable );
    }
    
    if ( issharedfuncdefined( "emp", "setEMP_Cleared_Callback" ) )
    {
        grenade [[ getsharedfunc( "emp", "setEMP_Cleared_Callback" ) ]]( &trophy_enable );
    }
    
    grenade scripts\cp_mp\equipment\haywire::function_172d848d58051fdf( &function_fa497ea83e7adc8c );
    grenade function_49197cd063a740ea( &trophy_destroy );
    
    if ( isdefined( level.elevators ) )
    {
        foreach ( elevators in level.elevators )
        {
            if ( !isdefined( elevators ) )
            {
                continue;
            }
            
            elevators thread scripts\common\elevators::isentitytouchingdoortrigger( grenade );
        }
    }
    
    if ( issharedfuncdefined( #"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672" ) )
    {
        grenade [[ getsharedfunc( #"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672" ) ]]( grenade );
    }
    
    grenade setscriptablepartstate( "visibility", "show", 0 );
    grenade thread trophy_deploy();
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x1394
// Size: 0x128
function trophy_watch_flight( player )
{
    self endon( "death" );
    self endon( "missile_stuck" );
    player endon( "disconnect" );
    msg = waittill_any_timeout_1( 2, "touching_platform" );
    
    if ( msg == "timeout" )
    {
        return;
    }
    
    groundentity = undefined;
    ignoreents = vehicle_getarrayinradius( self.origin, 500, 500 );
    ignoreents[ ignoreents.size ] = self;
    tracecontents = scripts\engine\trace::create_contents( 0, 1, 1, 1, 0, 1, 1, 0, 1 );
    tracestart = self.origin;
    var_3a7f0173b03f5767 = -2000;
    traceend = self.origin + ( 0, 0, var_3a7f0173b03f5767 );
    traceresults = scripts\engine\trace::ray_trace( tracestart, traceend, ignoreents, tracecontents );
    
    if ( traceresults[ "fraction" ] < 1 )
    {
        groundentity = traceresults[ "entity" ];
        
        if ( isdefined( groundentity ) )
        {
            if ( is_train_ent( groundentity ) )
            {
                self.origin = player.origin;
            }
        }
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x14c4
// Size: 0x9e, Type: bool
function is_train_ent( hitent )
{
    if ( isdefined( level.wztrain_info ) )
    {
        foreach ( ent in level.wztrain_info.train_array )
        {
            if ( ent == hitent )
            {
                return true;
            }
            
            if ( isdefined( ent.linked_model ) && ent.linked_model == hitent )
            {
                return true;
            }
        }
    }
    
    return false;
}

/#

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 1
    // Checksum 0x0, Offset: 0x156b
    // Size: 0xe, Type: dev
    function function_da07fdc88865707a( target )
    {
        
    }

#/

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x1581
// Size: 0x123
function trophy_deploy()
{
    self endon( "death" );
    self setscriptablepartstate( "effects", "activeLand" );
    wait 0.1;
    thread trophy_deployanimation();
    wait 0.2;
    self.headiconid = scripts\cp_mp\entityheadicons::setheadicon_factionimage( 0, 25, undefined, undefined, undefined, undefined, 1 );
    thread outlineequipmentforowner( self );
    
    if ( getdvarint( @"scr_trophy_use_entity_grid", 0 ) != 0 )
    {
        /#
            if ( getdvarint( @"hash_2fb6b2a16c2792d0", 0 ) != 0 )
            {
                thread function_281b0f9d6b4c66ad( 45, 325, &function_9f13cc66529c6e8f, &function_da07fdc88865707a, 1 );
            }
        #/
        
        thread function_281b0f9d6b4c66ad( 45, 325, &function_9f13cc66529c6e8f, &function_509f8c901a3ae35, 0 );
    }
    else
    {
        thread trophy_watchprotection( 45, 105625, &function_9f13cc66529c6e8f, &function_509f8c901a3ae35 );
    }
    
    thread trophy_watchtimeoutorgameended();
    thread scripts\mp\equipment_interact::remoteinteractsetup( &trophy_remote_destroy, 1, 1 );
    thread scripts\mp\perks\perk_equipmentping::runequipmentping();
    self.owner scripts\cp_mp\challenges::function_d997435895422ecc( "super_trophy", function_e2ff8f4b4e94f723( #"hash_83a2d67994d7e295", #"use" ) );
    
    /#
        if ( false )
        {
            function_b96541d92295c9ca();
        }
    #/
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x16ac
// Size: 0x32
function trophy_deployanimation()
{
    self endon( "death" );
    self setscriptablepartstate( "effects", "activeDeployStart" );
    wait trophy_getdeployanimtime();
    self setscriptablepartstate( "effects", "activeDeployEnd" );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x16e6
// Size: 0x51
function trophy_hideandshowaftertime()
{
    self endon( "death" );
    self endon( "missile_stuck" );
    hideduration = getdvarfloat( @"hash_64483ec1fd3d3c77", 0 );
    self setscriptablepartstate( "visibility", "hide", 0 );
    wait hideduration;
    self setscriptablepartstate( "visibility", "show", 0 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x173f
// Size: 0x14
function trophy_remote_destroy( player )
{
    trophy_destroy( 1 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x175b
// Size: 0x1d
function sweeptrophy()
{
    thread trophy_delete( 0 );
    self setscriptablepartstate( "effects", "activeDestroyEnd", 0 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x1780
// Size: 0x2b
function trophy_destroy( wasdestroyed )
{
    thread trophy_delete( 0.1, wasdestroyed );
    self setscriptablepartstate( "effects", "activeDestroyEnd", 0 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x17b3
// Size: 0x4a
function trophy_shutdownanddestroy( wasdestroyed )
{
    level endon( "game_ended" );
    thread trophy_delete( 2.6, wasdestroyed );
    self setscriptablepartstate( "effects", "activeDestroyStart", 0 );
    wait 2.5;
    self setscriptablepartstate( "effects", "activeDestroyEnd", 0 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 2
// Checksum 0x0, Offset: 0x1805
// Size: 0x167
function trophy_delete( deletiondelay, wasdestroyed )
{
    self notify( "death" );
    self setscriptablepartstate( "hack_usable", "off" );
    self.owner scripts\cp_mp\challenges::function_d997435895422ecc( "super_trophy", function_e2ff8f4b4e94f723( #"hash_83a2d67994d7e295", #"end" ), self.usedcount );
    scripts\mp\analyticslog::logevent_fieldupgradeexpired( self.owner, self.superid, self.usedcount, istrue( wasdestroyed ) );
    level.mines[ self getentitynumber() ] = undefined;
    self setcandamage( 0 );
    
    if ( !istrue( self.issuper ) )
    {
        self makeunusable();
        makeexplosiveunusuabletag();
    }
    
    scripts\cp_mp\entityheadicons::setheadicon_deleteicon( self.headiconid );
    self.headiconid = undefined;
    self.exploding = 1;
    
    if ( isdefined( self.owner ) )
    {
        self.owner notify( "trophy_update", 0 );
        self.owner removeequip( self );
    }
    
    if ( issharedfuncdefined( #"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d" ) )
    {
        self [[ getsharedfunc( #"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d" ) ]]( self );
    }
    
    function_83cebe0ae5318a7f( self );
    
    if ( isdefined( deletiondelay ) )
    {
        wait deletiondelay;
    }
    
    scripts\cp_mp\ent_manager::deregisterspawn();
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 4
// Checksum 0x0, Offset: 0x1974
// Size: 0x229
function function_d614b6efd4de7093( trophy_castcontents, castorigin, protectiondistsqr, var_d0b9c256ce9d59f4 )
{
    scripts\cp_mp\utility\game_utility::createprojectilepartition();
    
    foreach ( targetarray in level.projectilepartition function_df633f460888a47( self.origin ) )
    {
        foreach ( trophytarget in targetarray )
        {
            if ( !isdefined( trophytarget ) )
            {
                continue;
            }
            
            if ( istrue( trophytarget.exploding ) )
            {
                continue;
            }
            
            if ( trophytarget == self )
            {
                continue;
            }
            
            if ( trophy_checkignorelist( trophytarget ) )
            {
                continue;
            }
            
            trophytargetowner = trophytarget.owner;
            
            if ( !isdefined( trophytargetowner ) && isdefined( trophytarget.vehicle ) )
            {
                trophytargetowner = trophytarget.vehicle.owner;
            }
            
            if ( !isdefined( trophytargetowner ) && isdefined( trophytarget.weapon_name ) && weaponclass( trophytarget.weapon_name ) == "grenade" )
            {
                trophytargetowner = getmissileowner( trophytarget );
            }
            
            var_f31940d93afc41db = 1;
            
            /#
                if ( getdvarint( @"hash_3c6c485214ca7673", 0 ) == 1 )
                {
                    var_f31940d93afc41db = 0;
                }
            #/
            
            if ( var_f31940d93afc41db )
            {
                if ( isdefined( trophytargetowner ) && !istrue( scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, trophytargetowner ) ) )
                {
                    continue;
                }
            }
            
            if ( distancesquared( trophytarget.origin, self.origin ) > trophy_modifiedprotectiondistsqr( trophytarget, protectiondistsqr ) )
            {
                continue;
            }
            
            castresults = physics_raycast( castorigin, trophytarget.origin, trophy_castcontents, [ self, trophytarget ], 0, "physicsquery_closest" );
            
            if ( isdefined( castresults ) && castresults.size > 0 )
            {
                continue;
            }
            
            self [[ var_d0b9c256ce9d59f4 ]]( trophytarget );
        }
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 4
// Checksum 0x0, Offset: 0x1ba5
// Size: 0x81
function trophy_watchprotection( protectionoffset, protectiondistsqr, var_b701d494f3ae184f, var_d0b9c256ce9d59f4 )
{
    self endon( "death" );
    trophy_castcontents = trophy_castcontents();
    
    while ( [[ var_b701d494f3ae184f ]]() )
    {
        if ( istrue( self.isdisabled ) || istrue( self.isjammed ) )
        {
            waitframe();
            continue;
        }
        
        castorigin = trophy_castorigin( protectionoffset );
        function_d614b6efd4de7093( trophy_castcontents, castorigin, protectiondistsqr, var_d0b9c256ce9d59f4 );
        waitframe();
    }
}

/#

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 2
    // Checksum 0x0, Offset: 0x1c2e
    // Size: 0xbe, Type: dev
    function function_1b7a7b44f46c24df( ents, var_cf0b868d38a1e6c3 )
    {
        println( "<dev string:x1c>" );
        
        foreach ( entnum, e in ents )
        {
            println( entnum );
        }
        
        println( "<dev string:x2a>" );
        
        foreach ( entnum, e in var_cf0b868d38a1e6c3 )
        {
            println( entnum );
        }
        
        assertmsg( "<dev string:x3d>" );
    }

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 1
    // Checksum 0x0, Offset: 0x1cf4
    // Size: 0x144, Type: dev
    function function_15592e4d9e958065( ents )
    {
        var_cf0b868d38a1e6c3 = [];
        scripts\cp_mp\utility\game_utility::createprojectilepartition();
        
        foreach ( targetarray in level.projectilepartition function_df633f460888a47( self.origin ) )
        {
            foreach ( trophytarget in targetarray )
            {
                var_cf0b868d38a1e6c3[ trophytarget getentitynumber() ] = trophytarget;
            }
        }
        
        if ( ents.size != var_cf0b868d38a1e6c3.size )
        {
            function_1b7a7b44f46c24df( ents, var_cf0b868d38a1e6c3 );
        }
        
        foreach ( e in ents )
        {
            entnum = e getentitynumber();
            
            if ( !isdefined( var_cf0b868d38a1e6c3[ entnum ] ) )
            {
                function_1b7a7b44f46c24df( ents, var_cf0b868d38a1e6c3 );
            }
        }
    }

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 1
    // Checksum 0x0, Offset: 0x1e40
    // Size: 0x21, Type: dev
    function function_4f556f0dda3cc79d( trophytarget )
    {
        level.var_28e720832f5f98a6[ trophytarget getentitynumber() ] = 1;
    }

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 4
    // Checksum 0x0, Offset: 0x1e69
    // Size: 0xc8, Type: dev
    function function_6a0da54618dea55c( ents, trophy_castcontents, castorigin, protectiondistsqr )
    {
        level.var_28e720832f5f98a6 = [];
        function_d614b6efd4de7093( trophy_castcontents, castorigin, protectiondistsqr, &function_4f556f0dda3cc79d );
        
        if ( ents.size != level.var_28e720832f5f98a6.size )
        {
            function_1b7a7b44f46c24df( ents, level.var_28e720832f5f98a6 );
        }
        
        foreach ( entnum, e in ents )
        {
            if ( !isdefined( level.var_28e720832f5f98a6[ entnum ] ) )
            {
                function_1b7a7b44f46c24df( ents, level.var_28e720832f5f98a6 );
            }
        }
    }

#/

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 5
// Checksum 0x0, Offset: 0x1f39
// Size: 0x2b2
function function_281b0f9d6b4c66ad( protectionoffset, protectiondist, var_b701d494f3ae184f, var_d0b9c256ce9d59f4, gridvalidation )
{
    self endon( "death" );
    trophy_castcontents = trophy_castcontents();
    typemask = function_869ccb4e3451b8c6( [ "etype_missile", "etype_vehicle" ] );
    protectiondistsqr = protectiondist * protectiondist;
    
    /#
        validationents = [];
    #/
    
    while ( [[ var_b701d494f3ae184f ]]() )
    {
        if ( istrue( self.isdisabled ) || istrue( self.isjammed ) )
        {
            waitframe();
            continue;
        }
        
        /#
            if ( gridvalidation )
            {
                validationents = [];
            }
        #/
        
        castorigin = trophy_castorigin( protectionoffset );
        ents = function_b1eef70090b5b7b5( self.origin, 500, typemask, [ self ] );
        
        foreach ( trophytarget in ents )
        {
            if ( !isdefined( trophytarget ) )
            {
                continue;
            }
            
            if ( istrue( trophytarget.exploding ) )
            {
                continue;
            }
            
            if ( trophy_checkignorelist( trophytarget ) )
            {
                continue;
            }
            
            trophytargetowner = trophytarget.owner;
            
            if ( !isdefined( trophytargetowner ) && isdefined( trophytarget.vehicle ) )
            {
                trophytargetowner = trophytarget.vehicle.owner;
            }
            
            if ( !isdefined( trophytargetowner ) && isdefined( trophytarget.weapon_name ) && weaponclass( trophytarget.weapon_name ) == "grenade" )
            {
                trophytargetowner = getmissileowner( trophytarget );
            }
            
            var_f31940d93afc41db = 1;
            
            /#
                if ( getdvarint( @"hash_3c6c485214ca7673", 0 ) == 1 )
                {
                    var_f31940d93afc41db = 0;
                }
            #/
            
            if ( var_f31940d93afc41db )
            {
                if ( isdefined( trophytargetowner ) && !istrue( scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, trophytargetowner ) ) )
                {
                    continue;
                }
            }
            
            if ( distancesquared( trophytarget.origin, self.origin ) > trophy_modifiedprotectiondistsqr( trophytarget, protectiondistsqr ) )
            {
                continue;
            }
            
            castresults = physics_raycast( castorigin, trophytarget.origin, trophy_castcontents, [ self, trophytarget ], 0, "physicsquery_closest" );
            
            if ( isdefined( castresults ) && castresults.size > 0 )
            {
                continue;
            }
            
            /#
                if ( gridvalidation )
                {
                    validationents[ trophytarget getentitynumber() ] = 1;
                }
            #/
            
            self [[ var_d0b9c256ce9d59f4 ]]( trophytarget );
        }
        
        /#
            if ( gridvalidation )
            {
                function_6a0da54618dea55c( validationents, trophy_castcontents, castorigin, protectiondistsqr );
            }
        #/
        
        waitframe();
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x21f3
// Size: 0xc, Type: bool
function function_9f13cc66529c6e8f()
{
    return isdefined( self.owner );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2208
// Size: 0x14
function function_509f8c901a3ae35( trophytarget )
{
    thread function_df73a01c76de4b5c( trophytarget );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2224
// Size: 0x58
function private function_ba83e8dc816c34b( trophytarget )
{
    outnum = 1;
    
    if ( !isdefined( trophytarget ) )
    {
        return outnum;
    }
    
    if ( !isdefined( trophytarget.weapon_name ) )
    {
        return outnum;
    }
    
    switch ( trophytarget.weapon_name )
    {
        case #"hash_5c272c0617caebf0":
            outnum = 3;
            break;
    }
    
    return outnum;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2285
// Size: 0x133
function private function_df73a01c76de4b5c( trophytarget )
{
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_end" );
    self.owner thread scripts\mp\gamelogic::threadedsetweaponstatbyname( "trophy_mp", 1, "hits" );
    self.owner scripts\mp\utility\stats::incpersstat( "trophySystemHits", 1 );
    self.owner scripts\mp\supers::combatrecordsupermisc( "super_trophy" );
    self.usedcount++;
    
    /#
        if ( false )
        {
            scripts\mp\equipment\trophy_system::function_1e892f6dd85d5b9c( trophytarget );
        }
    #/
    
    var_edad871174aa4c18 = trophytarget.origin;
    var_4f60747b7042e21f = trophy_modifiedprotectiondistsqr( trophytarget, 105625 );
    var_72638b7e8b50d411 = trophytarget.spawnpos;
    numshots = function_ba83e8dc816c34b( trophytarget );
    
    if ( self.ammo >= numshots )
    {
        function_477783276ea16601( trophytarget );
        self.owner scripts\mp\killstreaks\killstreaks::givescorefortrophyblocks();
        logtrophysuccesful( trophytarget );
    }
    
    for ( i = 0; i < numshots ; i++ )
    {
        childthread function_363a32a7a77c9fe0( var_edad871174aa4c18, i, var_4f60747b7042e21f );
        wait 0.2;
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x23c0
// Size: 0x1a8
function private function_363a32a7a77c9fe0( trophytargetpos, shotnum, rangesquared )
{
    if ( self.ammo <= 0 )
    {
        thread trophy_shutdownanddestroy( 0 );
        return 0;
    }
    
    explorigin = trophytargetpos;
    var_c96a7e0d1ec7bc53 = function_ef4a284b37373510( explorigin, rangesquared );
    
    if ( var_c96a7e0d1ec7bc53 )
    {
        explorigin = function_514a12868913d9b7( explorigin );
    }
    
    if ( shotnum > 1 )
    {
        explorigin = function_b2e78337c5df1c34( explorigin );
    }
    
    barrel = function_bf727b4b45ca91de( explorigin );
    tag = barrel.tag;
    part = barrel.part;
    self setscriptablepartstate( part, "active", 0 );
    var_1331aefd6d9a100 = vectortoangles( self gettagorigin( tag ) - explorigin );
    var_cc29543de9737588 = combineangles( var_1331aefd6d9a100, ( -90, 0, 0 ) );
    self.explosion thread trophy_explode( explorigin, var_cc29543de9737588 );
    self setscriptablepartstate( "sfx_" + part, "fire", 0 );
    self.ammo--;
    
    /#
        if ( getdvarint( @"hash_20d714b15057681f", 0 ) == 1 )
        {
            maxammo = isdefined( self.bundle ) && isdefined( self.bundle.var_d3e2a33f25aa34f8 ) ? self.bundle.var_d3e2a33f25aa34f8 : 3;
            self.ammo = maxammo;
        }
    #/
    
    if ( self.ammo <= 0 )
    {
        thread trophy_shutdownanddestroy( 0 );
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2570
// Size: 0x24, Type: bool
function private function_ef4a284b37373510( inpoint, rangesquared )
{
    return distancesquared( inpoint, self.origin ) < rangesquared;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x259d
// Size: 0x52
function private function_514a12868913d9b7( explorigin )
{
    var_cf6ccb76c65463e3 = explorigin;
    lerpfraction = min( 1 - 24 / length( self.origin - explorigin ), 1 );
    var_cf6ccb76c65463e3 = vectorlerp( self.origin, var_cf6ccb76c65463e3, lerpfraction );
    return var_cf6ccb76c65463e3;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x25f8
// Size: 0x106
function private function_b2e78337c5df1c34( var_5c1a8852fefebef5 )
{
    var_f95c4b9d1740f23b = 0.05;
    x_scatter = randomfloatrange( 0.9, 1.1 );
    y_scatter = randomfloatrange( 0.9, 1.1 );
    z_scatter = randomfloatrange( 0.8, 1.2 );
    x = var_5c1a8852fefebef5[ 0 ];
    y = var_5c1a8852fefebef5[ 1 ];
    z = var_5c1a8852fefebef5[ 2 ];
    x_delta = x * x_scatter;
    y_delta = y * y_scatter;
    z_delta = z * z_scatter;
    
    if ( abs( x - x_delta ) < x * var_f95c4b9d1740f23b )
    {
        x_delta += x_delta * var_f95c4b9d1740f23b;
    }
    
    if ( abs( y - y_delta ) < y * var_f95c4b9d1740f23b )
    {
        y_delta += y_delta * var_f95c4b9d1740f23b;
    }
    
    if ( abs( z - z_delta ) < z * var_f95c4b9d1740f23b )
    {
        z_delta += z_delta * var_f95c4b9d1740f23b;
    }
    
    return ( x_delta, y_delta, z_delta );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2707
// Size: 0x5d
function function_477783276ea16601( trophytarget )
{
    trophytarget setcandamage( 0 );
    trophytarget stopsounds();
    trophy_notifytrophytargetowner( trophytarget, "trophy_mp", self.owner );
    trophy_tryreflectsnapshot( trophytarget, trophytarget.owner, self.owner );
    
    if ( !trophytarget scripts\mp\equipment::ondestroyedbytrophy() )
    {
        trophytarget delete();
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 3
// Checksum 0x0, Offset: 0x276c
// Size: 0xbe
function trophy_tryreflectsnapshot( trophytarget, victim, attacker )
{
    if ( !isdefined( trophytarget.equipmentref ) || trophytarget.equipmentref != "equip_snapshot_grenade" )
    {
        return;
    }
    
    if ( !isdefined( trophytarget.owner ) || !isdefined( self.owner ) )
    {
        return;
    }
    
    if ( !isreallyalive( victim ) )
    {
        return;
    }
    
    owner = attacker;
    position = victim.origin;
    outlinedata = scripts\mp\equipment\snapshot_grenade::snapshot_grenade_createoutlinedata( owner, position, self.bundle );
    scripts\mp\equipment\snapshot_grenade::snapshot_grenade_applysnapshot( victim, attacker, outlinedata, undefined, undefined, undefined, self.bundle );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x2832
// Size: 0x19
function trophy_watchtimeoutorgameended()
{
    self endon( "death" );
    trophy_watchtimeoutorgameendedinternal();
    thread trophy_shutdownanddestroy( 0 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x2853
// Size: 0x3c
function trophy_watchtimeoutorgameendedinternal()
{
    level endon( "game_ended" );
    timeout = level.trophy.timeout;
    
    if ( !isdefined( timeout ) )
    {
        timeout = 45;
    }
    
    scripts\mp\hostmigration::waitlongdurationwithhostmigrationpause( timeout );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2897
// Size: 0x97
function trophy_handledamage( data )
{
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    modifieddamage = damage;
    modifieddamage = utility::handlemeleedamage( objweapon, type, modifieddamage );
    modifieddamage = scripts\mp\damage::handleapdamage( objweapon, type, modifieddamage, attacker );
    scripts\mp\weapons::equipmenthit( self.owner, attacker, objweapon, type );
    return modifieddamage;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2937
// Size: 0x50
function trophy_handlefataldamage( data )
{
    self notify( "enemy_destroyed_equipment", data.attacker );
    data.victim trophy_givepointsfordeath( data.attacker );
    data.victim thread trophy_destroy( 1 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x298f
// Size: 0x33
function trophy_applyempcallback( data )
{
    self notify( "enemy_destroyed_equipment", data.attacker );
    data.victim thread trophy_destroy( 1 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x29ca
// Size: 0x3d
function function_fa497ea83e7adc8c( data )
{
    data.victim trophy_givepointsfordeath( data.attacker );
    data.victim thread trophy_destroy( 1 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2a0f
// Size: 0x4c
function trophy_disable( data )
{
    self endon( "death" );
    self.isdisabled = 1;
    self setscriptablepartstate( "empd", "active", 0 );
    
    if ( !isdefined( data.ksemp ) )
    {
        wait 6;
        trophy_enable( data );
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2a63
// Size: 0x2e
function trophy_enable( data )
{
    self endon( "death" );
    self.isdisabled = 0;
    self setscriptablepartstate( "empd", "neutral", 0 );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x2a99
// Size: 0x32
function trophy_pickup()
{
    if ( self.owner scripts\mp\equipment::hasequipment( "equip_trophy" ) )
    {
        self.owner trophy_addstored( self.ammo );
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2ad3
// Size: 0xf1
function trophy_createexplosion( trophy )
{
    explosion = spawn( "script_model", trophy.origin );
    explosion.killcament = trophy;
    explosion.owner = trophy.owner;
    explosion.team = trophy.team;
    explosion.equipmentref = trophy.equipmentref;
    explosion.weapon_name = trophy.weapon_name;
    explosion setotherent( explosion.owner );
    explosion setentityowner( explosion.owner );
    explosion setmodel( level.trophy.explosionxmodel );
    explosion.explode1available = 1;
    explosion thread trophy_cleanuponparentdeath( trophy, 0.1 );
    return explosion;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 2
// Checksum 0x0, Offset: 0x2bcd
// Size: 0x77
function trophy_explode( position, angles )
{
    self dontinterpolate();
    self.origin = position;
    self.angles = angles;
    
    if ( istrue( self.explode1available ) )
    {
        self setscriptablepartstate( "explode1", "activeDirectional", 0 );
        self.explode1available = 0;
        return;
    }
    
    self setscriptablepartstate( "explode2", "activeDirectional", 0 );
    self.explode1available = 1;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2c4c
// Size: 0x25
function trophy_castorigin( protectionoffset )
{
    return self.origin + anglestoup( self.angles ) * protectionoffset;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x2c7a
// Size: 0x35
function trophy_castcontents()
{
    return physics_createcontents( [ "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water", "physicscontents_item" ] );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 2
// Checksum 0x0, Offset: 0x2cb8
// Size: 0xe3
function trophy_modifiedprotectiondistsqr( trophytarget, protectiondistsqr )
{
    if ( !isdefined( trophytarget ) )
    {
        return protectiondistsqr;
    }
    
    if ( isdefined( trophytarget.weapon_name ) )
    {
        switch ( trophytarget.weapon_name )
        {
            case #"hash_c500a77b6bb7c5d0":
                if ( 105625 * 1.2 > protectiondistsqr )
                {
                    protectiondistsqr = 105625 * 1.2;
                }
                
                break;
        }
    }
    
    if ( isdefined( trophytarget.classname ) )
    {
        switch ( trophytarget.classname )
        {
            case #"hash_4af55147c6098215":
                if ( 105625 * 2 > protectiondistsqr )
                {
                    protectiondistsqr = 105625 * 2;
                }
                
                break;
            case #"hash_8b48887639da2db5":
                if ( 105625 * 1.2 > protectiondistsqr )
                {
                    protectiondistsqr = 105625 * 1.2;
                }
                
                break;
        }
    }
    
    return protectiondistsqr;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x2da4
// Size: 0x297, Type: bool
function trophy_checkignorelist( trophytarget )
{
    bundle = trophytarget.bundle;
    
    if ( isdefined( bundle ) && istrue( bundle.var_c3333778ec49a2c ) )
    {
        return true;
    }
    
    weaponname = trophytarget.weapon_name;
    
    if ( !isdefined( weaponname ) )
    {
        weapon_object = trophytarget.weapon_object;
        
        if ( isdefined( weapon_object ) )
        {
            weaponname = weapon_object.basename;
        }
    }
    
    if ( isdefined( trophytarget.streakname ) )
    {
        switch ( trophytarget.streakname )
        {
            case #"hash_6362d6aae3e5a62e":
            case #"hash_7a687f6a4d685110":
                return true;
        }
    }
    else if ( isdefined( trophytarget.streakinfo ) )
    {
        switch ( trophytarget.streakinfo.streakname )
        {
            case #"hash_9e36e3bd3a9dd00d":
                return true;
        }
    }
    
    if ( isdefined( weaponname ) )
    {
        if ( iskillstreakweapon( weaponname ) && weaponname != "chopper_gunner_proj_mp" && !issubstr( weaponname, "missile_turret_proj" ) && !issubstr( weaponname, "switchblade_drone" ) && !issubstr( weaponname, "drone_swarm_drone" ) )
        {
            return true;
        }
        
        if ( isaxeweapon( weaponname ) )
        {
            return true;
        }
        
        weapon_object = trophytarget.weapon_object;
        
        if ( isdefined( weapon_object ) && weapon::iswonderweapon( weapon_object ) )
        {
            return true;
        }
        
        switch ( weaponname )
        {
            case #"hash_5e3fa526a48eaaa5":
                if ( isplantedequipment( trophytarget ) )
                {
                    return true;
                }
                
                break;
            case #"hash_1a30d3a1753a5b6":
            case #"hash_22f1c67a16accbe":
            case #"hash_34f28162f0f54c6e":
            case #"hash_51a6d4a5612754d2":
            case #"hash_523f0c8fe1ead306":
            case #"hash_53d34fb712dd4235":
            case #"hash_571e95536d9682a1":
            case #"hash_5907ae753546a1e8":
            case #"hash_5be4c94863c15240":
            case #"hash_5cc52f4b3d579bc3":
            case #"hash_617feab345ee4f01":
            case #"hash_829141045b36cf1c":
            case #"hash_83ef591efa62a73b":
            case #"hash_badacfdae124cc01":
            case #"hash_c4b9b21ecac2ced4":
            case #"hash_cce14c95e4764532":
            case #"hash_e4aed4089cbf3bc9":
            case #"hash_ef5768c3c9f00e10":
            case #"hash_ffdabdde3cb352ca":
                return true;
        }
    }
    
    if ( trophytarget scripts\common\vehicle::isvehicle() && !istrue( trophytarget.isprojectilekillstreak ) )
    {
        return true;
    }
    
    return false;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 3
// Checksum 0x0, Offset: 0x3044
// Size: 0xd5
function trophy_notifytrophytargetowner( trophytarget, trophyweaponname, trophyowner )
{
    if ( !isdefined( trophytarget.owner ) || !isplayer( trophytarget.owner ) )
    {
        return;
    }
    
    trophytarget.owner updatedamagefeedback( "hittrophysystem" );
    
    if ( isdefined( trophytarget.weapon_name ) )
    {
        switch ( trophytarget.weapon_name )
        {
            case #"hash_5b1e7be1304d43db":
            case #"hash_94c7880dca9ccc3f":
            case #"hash_b23a0686850cd666":
                trophytarget.owner notify( "destroyed_by_trophy", trophyowner, trophyweaponname, trophytarget.weapon_name, trophytarget.origin, trophytarget.angles );
                break;
        }
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x3121
// Size: 0xfb
function function_bf727b4b45ca91de( position )
{
    var_89c25693a4a496ff = level.trophy.var_89c25693a4a496ff;
    bestdot = undefined;
    bestbarrel = undefined;
    
    foreach ( id, barrel in var_89c25693a4a496ff )
    {
        tag = barrel.tag;
        origin = self gettagorigin( tag );
        angles = self gettagangles( tag );
        forward = anglestoforward( angles );
        dot = vectordot( vectornormalize( position - origin ), forward );
        
        if ( id == 0 || dot > bestdot )
        {
            bestdot = dot;
            bestbarrel = barrel;
        }
    }
    
    return bestbarrel;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x3225
// Size: 0x4b
function trophy_givepointsfordeath( attacker )
{
    if ( istrue( scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, attacker ) ) )
    {
        attacker notify( "destroyed_equipment" );
        attacker thread doscoreevent( #"destroyed_equipment" );
        attacker thread scripts\mp\battlechatter_mp::onfieldupgradedestroy( #"bc_fieldupgrade_killfirm_trophy" );
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x3278
// Size: 0x10
function trophy_getdeployanimtime()
{
    return getanimlength( scriptables#wm_trophy_system_deploy );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x3291
// Size: 0x42
function trophy_givedamagefeedback( attacker )
{
    damagefeedback = "";
    
    if ( istrue( self.hasruggedeqp ) )
    {
        damagefeedback = "hitequip";
    }
    
    if ( isplayer( attacker ) )
    {
        attacker updatedamagefeedback( damagefeedback );
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x32db
// Size: 0x55
function trophy_addstored( ammo )
{
    if ( !isdefined( self.trophies ) )
    {
        self.trophies = [];
    }
    
    if ( self.trophies.size < trophy_maxstored() )
    {
        if ( !isdefined( ammo ) )
        {
            ammo = 3;
        }
        
        self.trophies[ self.trophies.size ] = ammo;
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x3338
// Size: 0x5c
function trophy_removestored()
{
    if ( isdefined( self.trophies ) && self.trophies.size > 0 )
    {
        trophy = self.trophies[ self.trophies.size - 1 ];
        self.trophies[ self.trophies.size - 1 ] = undefined;
        return trophy;
    }
    
    return undefined;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x339d
// Size: 0xc
function trophy_clearstored()
{
    self.trophies = undefined;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x33b1
// Size: 0x37
function trophy_populatestored()
{
    maxcharges = scripts\mp\equipment::getequipmentmaxammo( "equip_trophy" );
    
    for ( i = 0; i < maxcharges ; i++ )
    {
        trophy_addstored();
    }
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 0
// Checksum 0x0, Offset: 0x33f0
// Size: 0xd
function trophy_maxstored()
{
    return scripts\mp\equipment::getequipmentmaxammo( "equip_trophy" );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 5
// Checksum 0x0, Offset: 0x3406
// Size: 0xe0
function trophy_modifieddamage( attacker, victim, sweapon, damage, damageadd )
{
    if ( !isdefined( sweapon ) )
    {
        return [ damage, damageadd ];
    }
    
    if ( damage == 0 )
    {
        return [ damage, damageadd ];
    }
    
    damageclamp = undefined;
    
    if ( scripts\cp_mp\utility\game_utility::function_21322da268e71c19() )
    {
        switch ( sweapon )
        {
            case #"hash_5e3fa526a48eaaa5":
            case #"hash_6f08e94ea93bfaf9":
            case #"hash_f085b57dce639767":
                maxhealth = getdvarint( @"scr_player_maxhealth", 150 );
                damageclamp = 0.66 * maxhealth;
                break;
        }
    }
    
    var_b85ff186894ba31e = damageadd;
    
    if ( isdefined( damageclamp ) )
    {
        var_b85ff186894ba31e = damageclamp - damage;
    }
    
    var_b85ff186894ba31e = min( var_b85ff186894ba31e, damageadd );
    return [ damage, var_b85ff186894ba31e ];
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 2
// Checksum 0x0, Offset: 0x34ef
// Size: 0x2b
function trophy_cleanuponparentdeath( parent, delay )
{
    self endon( "death" );
    parent waittill( "death" );
    wait delay;
    self delete();
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x3522
// Size: 0xc1
function logtrophysuccesful( trophytarget )
{
    if ( !isdefined( trophytarget ) )
    {
        return;
    }
    
    if ( !isdefined( self.deployingplayer ) )
    {
        return;
    }
    
    if ( isdefined( trophytarget.owner ) && !isplayer( trophytarget.owner ) )
    {
        return;
    }
    
    if ( isdefined( trophytarget.weapon_object ) )
    {
        weaponname = getweaponrootname( trophytarget.weapon_object );
    }
    else
    {
        return;
    }
    
    if ( !isdefined( weaponname ) )
    {
        return;
    }
    
    dlog_recordevent( "dlog_event_trophy_successful", [ "deploying_player", self.deployingplayer, "grenade_owner", trophytarget.owner, "negated_target", weaponname ] );
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x35eb
// Size: 0x15
function function_49197cd063a740ea( callbackfunction )
{
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x3608
// Size: 0x5a
function function_fc792b373d83f8d4( weaponname )
{
    isignored = undefined;
    
    if ( iskillstreakweapon( weaponname ) )
    {
        isignored = 1;
        
        switch ( weaponname )
        {
            case #"hash_841e4cad9f0e242e":
            case #"hash_c5c19fe9ae40cd0c":
            case #"hash_f4d2562ef860c1c0":
                isignored = 0;
                break;
        }
    }
    
    return isignored;
}

// Namespace trophy_system / scripts\mp\equipment\trophy_system
// Params 1
// Checksum 0x0, Offset: 0x366b
// Size: 0x77
function function_d70f6fa2c37c1230( oldowner )
{
    self setscriptablepartstate( "hacked", "active", 0 );
    sentientpool = self.sentientpool;
    scripts\mp\sentientpoolmanager::unregistersentient( self.sentientpool, self.sentientpoolindex );
    scripts\mp\sentientpoolmanager::registersentient( sentientpool, self.owner );
    thread monitordisownedequipment( self.owner, self );
    thread outlineequipmentforowner( self );
}

/#

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 0
    // Checksum 0x0, Offset: 0x36ea
    // Size: 0x15, Type: dev
    function function_b96541d92295c9ca()
    {
        thread function_d146ac9c9d0a4f24();
        thread function_a649727b9944afc2();
    }

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 0
    // Checksum 0x0, Offset: 0x3707
    // Size: 0xd, Type: dev
    function function_194a2d4a0c7509ea()
    {
        self notify( "<dev string:x77>" );
    }

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 0
    // Checksum 0x0, Offset: 0x371c
    // Size: 0x112, Type: dev
    function function_d146ac9c9d0a4f24()
    {
        level endon( "<dev string:x8c>" );
        self endon( "<dev string:x98>" );
        self.owner endon( "<dev string:xa1>" );
        self endon( "<dev string:x77>" );
        baserange = 105625;
        var_6e0ae1d28b9e917d = 105625 * 1.2;
        var_6e0aded28b9e8ae4 = 105625 * 2;
        baserange = sqrt( baserange );
        var_6e0ae1d28b9e917d = sqrt( var_6e0ae1d28b9e917d );
        var_6e0aded28b9e8ae4 = sqrt( var_6e0aded28b9e8ae4 );
        ranges = [];
        ranges[ 0 ] = baserange;
        ranges[ 1 ] = var_6e0ae1d28b9e917d;
        ranges[ 2 ] = var_6e0aded28b9e8ae4;
        spherecolor = ( 1, 0, 0 );
        
        while ( true )
        {
            foreach ( range in ranges )
            {
                sphere( self.origin, range, spherecolor, 0, 1 );
            }
            
            waitframe();
        }
    }

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 0
    // Checksum 0x0, Offset: 0x3836
    // Size: 0xac, Type: dev
    function function_a649727b9944afc2()
    {
        level endon( "<dev string:x8c>" );
        self endon( "<dev string:x98>" );
        self.owner endon( "<dev string:xa1>" );
        self endon( "<dev string:x77>" );
        self.var_5fddd5317487c6c3 = [];
        spherecolor = ( 0, 1, 0 );
        
        while ( true )
        {
            foreach ( var_8950dc21de5cc6e8 in self.var_5fddd5317487c6c3 )
            {
                sphere( var_8950dc21de5cc6e8, 5, spherecolor, 0, 1 );
            }
            
            waitframe();
        }
    }

    // Namespace trophy_system / scripts\mp\equipment\trophy_system
    // Params 1
    // Checksum 0x0, Offset: 0x38ea
    // Size: 0x68, Type: dev
    function function_1e892f6dd85d5b9c( inent )
    {
        if ( isdefined( self.var_5fddd5317487c6c3 ) )
        {
            self.var_5fddd5317487c6c3[ self.var_5fddd5317487c6c3.size ] = inent.origin;
            return;
        }
        
        self.var_5fddd5317487c6c3 = [];
        self.var_5fddd5317487c6c3[ self.var_5fddd5317487c6c3.size ] = inent.origin;
    }

#/
