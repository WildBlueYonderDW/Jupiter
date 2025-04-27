#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle_build;
#using scripts\cp\cp_agent_utils;
#using scripts\cp\cp_hostmigration;
#using scripts\cp\cp_hud_message;
#using scripts\cp\cp_weapons;
#using scripts\cp\utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace cp_remote_tank;

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5fd
// Size: 0x52
function main( model, type, classname )
{
    build_template( "veh_pac_sentry_ground_mp", model, type, classname );
    build_localinit( &init_local );
    build_life( 1500, 1499, 1500 );
    build_team( "axis" );
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x657
// Size: 0x2
function init_local()
{
    
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x661
// Size: 0x2ba
function init_remote_tank()
{
    level._effect[ "wheelson_light" ] = loadfx( "vfx/iw8_cp/level/cp_lab/vfx_wheelson_spotlight_14.vfx" );
    level._effect[ "remote_tank_explode" ] = loadfx( "vfx/iw8_cp/level/cp_lab/vfx_wheelson_death_exp_no_model.vfx" );
    
    if ( !isdefined( level.tanksettings ) )
    {
        level.tanksettings = [];
    }
    
    level.tanksettings[ "remote_tank" ] = spawnstruct();
    level.tanksettings[ "remote_tank" ].timeout = 60;
    level.tanksettings[ "remote_tank" ].maxhealth = 500;
    level.tanksettings[ "remote_tank" ].hitstokill = 5;
    level.tanksettings[ "remote_tank" ].streakname = "pac_sentry";
    level.tanksettings[ "remote_tank" ].modelbase = "veh8_mil_lnd_whotel";
    level.tanksettings[ "remote_tank" ].modeldestroyed = "veh8_mil_lnd_whotel";
    level.tanksettings[ "remote_tank" ].mgturretmodelbase = "veh8_mil_lnd_whotel_turret";
    level.tanksettings[ "remote_tank" ].mgturretinfo = "pac_sentry_turret_cp";
    level.tanksettings[ "remote_tank" ].sentrymodeon = "sentry";
    level.tanksettings[ "remote_tank" ].sentrymodeoff = "sentry_offline";
    level.tanksettings[ "remote_tank" ].vehicleinfo = "veh_pac_sentry_mp_cp";
    level.tanksettings[ "remote_tank" ].stringcannotplace = %KILLSTREAKS_HINT_CANNOT_CALL_IN;
    level.tanksettings[ "remote_tank" ].scorepopup = "destroyed_pac_sentry";
    level.tanksettings[ "remote_tank" ].vodestroyed = "destroyed_pac_sentry";
    level.tanksettings[ "remote_tank" ].destoyedsplash = "callout_destroyed_pac_sentry";
    level.tanksettings[ "remote_tank" ].premoddamagefunc = undefined;
    level.tanksettings[ "remote_tank" ].lifetime = 600;
    level.remote_tank_armor_bulletdamage = 0.5;
    setdvarifuninitialized( @"hash_8e0e41d9572ba691", 0 );
    setdvarifuninitialized( @"hash_d429fa03fd7003ad", level.tanksettings[ "remote_tank" ].timeout );
    setdvarifuninitialized( @"hash_7134bb48e844228", 0 );
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x923
// Size: 0x2d4
function spawn_remote_tank( spawn_node, name, var_353c9e261ac35aac )
{
    var_a84cfd847dc1f677 = level.tanksettings[ "remote_tank" ];
    
    if ( isdefined( var_353c9e261ac35aac ) )
    {
        var_a84cfd847dc1f677 = var_353c9e261ac35aac;
    }
    
    spawn_pos = spawn_node.origin;
    spawn_angles = spawn_node.angles;
    
    if ( !isdefined( spawn_angles ) )
    {
        spawn_angles = ( 0, 0, 0 );
    }
    
    remotetank = spawnvehicle( var_a84cfd847dc1f677.modelbase, "veh_pac_sentry_mp_cp", var_a84cfd847dc1f677.vehicleinfo, spawn_pos, spawn_angles );
    
    if ( !isdefined( remotetank ) )
    {
        return undefined;
    }
    
    remotetank.team = "axis";
    remotetank.tanktype = "remote_tank";
    remotetank.streakname = "pac_sentry";
    remotetank.config = var_a84cfd847dc1f677;
    remotetank.maxhealth = var_a84cfd847dc1f677.maxhealth;
    remotetank.health = remotetank.maxhealth;
    remotetank.lifetime = var_a84cfd847dc1f677.lifetime;
    entnumber = remotetank getentitynumber();
    remotetank addtoassaultdronelist( entnumber );
    remotetank thread removefromassaultdronelistondeath( entnumber );
    var_6ec4c83e2ded9d38 = remotetank gettagorigin( "tag_turret" );
    mgturret = spawnturret( "misc_turret", var_6ec4c83e2ded9d38, var_a84cfd847dc1f677.mgturretinfo, 0 );
    mgturret linkto( remotetank, "tag_turret", ( 0, 0, 0 ), ( 0, 0, 0 ) );
    mgturret setmodel( level.tanksettings[ "remote_tank" ].mgturretmodelbase );
    mgturret.angles = remotetank.angles;
    mgturret.tank = remotetank;
    mgturret setmode( "manual" );
    mgturret setturretteam( "axis" );
    mgturret setdefaultdroppitch( 0 );
    mgturret setleftarc( 360 );
    mgturret setrightarc( 360 );
    mgturret settoparc( 45 );
    mgturret setbottomarc( 45 );
    mgturret setconvergencetime( 0.05, "yaw" );
    mgturret setconvergencetime( 0.05, "pitch" );
    remotetank.mgturret = mgturret;
    remotetank.spawn_node = spawn_node;
    remotetank.repulsor = createnavrepulsor( "tank_repulsor", 0, remotetank, 128, 1 );
    
    if ( isdefined( name ) )
    {
        if ( !isdefined( level.remote_tanks ) )
        {
            level.remote_tanks = [];
        }
        
        level.remote_tanks[ name ] = remotetank;
    }
    
    remotetank thread remotetank_rumble();
    return remotetank;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc00
// Size: 0x2b
function remotetank_rumble()
{
    self endon( "death" );
    
    while ( true )
    {
        playrumbleonposition( "cp_wheelson_rumble", self.origin );
        wait 0.25;
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc33
// Size: 0x30
function use_remote_tank( tank )
{
    result = playremotesequence( "remotetank", 1 );
    
    if ( result )
    {
        tank_finishdropoffsequence( self, tank );
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc6b
// Size: 0x2f
function addtoassaultdronelist( entnumber )
{
    if ( !isdefined( level.assaultdrones ) )
    {
        level.assaultdrones = [];
    }
    
    level.assaultdrones[ entnumber ] = self;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca2
// Size: 0x1e
function removefromassaultdronelistondeath( entnumber )
{
    self waittill( "death" );
    level.assaultdrones[ entnumber ] = undefined;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcc8
// Size: 0x146
function tank_finishdropoffsequence( owner, tank )
{
    var_3ecc13deffde644f = tank.origin + ( 0, 0, 200 );
    var_5ed295ac87f32df1 = tank.angles;
    var_a930350f718ef15 = var_3ecc13deffde644f - anglestoforward( var_5ed295ac87f32df1 ) * 100;
    var_76f164f8c60c8101 = var_5ed295ac87f32df1;
    on_state = "on";
    
    if ( isdefined( self.config.turretlightsonstate ) )
    {
        on_state = self.config.turretlightsonstate;
    }
    
    tank.mgturret setscriptablepartstate( "lights", on_state );
    tank.mgturret laseron();
    owner val::set( "tank_camera_transition", "fire", 0 );
    tank.owner = owner;
    tank.mgturret maketurretoperable();
    tank tank_playercameratransition( var_3ecc13deffde644f, var_5ed295ac87f32df1, var_a930350f718ef15, var_76f164f8c60c8101 );
    owner val::reset_all( "tank_camera_transition" );
    owner thread startusingtank( tank );
    tank thread tank_watchfortimeoutdisowned();
    tank thread tank_handleairburst();
    tank thread tank_handlewheeldustfx();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe16
// Size: 0x149
function tank_playercameratransition( var_3ecc13deffde644f, var_5ed295ac87f32df1, var_2fa874eef0a932b5, var_a9edec246432de8b )
{
    level endon( "game_ended" );
    self.owner unlink();
    var_abd8070797a8de25 = spawn( "script_model", var_3ecc13deffde644f );
    var_abd8070797a8de25 setmodel( "tag_player" );
    var_abd8070797a8de25.owner = self.owner;
    var_abd8070797a8de25.angles = var_5ed295ac87f32df1;
    self.owner playerlinkweaponviewtodelta( var_abd8070797a8de25, "tag_player", 1, 0, 0, 0, 0, 1 );
    self.owner playerlinkedsetviewznear( 0 );
    level notify( "vision_set_change_request", "tac_ops_slamzoom", self.owner, 0.2 );
    var_2fa874eef0a932b5 += ( 0, 0, 20 );
    var_a9edec246432de8b = vectortoangles( var_3ecc13deffde644f - var_2fa874eef0a932b5 );
    var_abd8070797a8de25 moveto( var_2fa874eef0a932b5, 0.5 );
    var_abd8070797a8de25 rotateto( var_a9edec246432de8b, 0.5 );
    self.owner thread tank_startfadetransition();
    scripts\cp\cp_hostmigration::waitlongdurationwithhostmigrationpause( 0.5 );
    level notify( "vision_set_change_request", undefined, self.owner, 0.2, "tac_ops_slamzoom" );
    self.owner unlink();
    var_abd8070797a8de25 delete();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf67
// Size: 0x36
function tank_startfadetransition()
{
    self endon( "disconnect" );
    level notify( "vision_set_change_request", "tac_ops_slamzoom", self, 0.5 );
    wait 0.5;
    level notify( "vision_set_change_request", undefined, self, 0.5, "tac_ops_slamzoom" );
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfa5
// Size: 0x130
function startusingtank( remotetank )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self.isusingremotetank = 1;
    remotetank.mgturret setcandamage( 1 );
    remotetank setcandamage( 1 );
    data = spawnstruct();
    data.deathoverridecallback = &tank_override_moving_platform_death;
    remotetank setotherent( self );
    remotetank setentityowner( self );
    remotetank.driver = self;
    self controlslinkto( remotetank );
    self remotecontrolturret( remotetank.mgturret );
    self painvisionoff();
    self setclientomnvar( "ui_hide_hud", 1 );
    self setclientomnvar( "ui_pac_sentry_controls", 1 );
    self setclientomnvar( "ui_pac_sentry_speed", 0 );
    self setclientomnvar( "ui_killstreak_countdown", gettime() + int( remotetank.lifetime * 1000 ) );
    self setclientomnvar( "ui_killstreak_health", remotetank.health / remotetank.maxhealth );
    remotetank thread tank_earthquake();
    remotetank thread allowridekillstreakplayerexit( "death" );
    _freezecontrols( 0 );
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10dd
// Size: 0x9
function tank_handlehelidamage()
{
    self endon( "death" );
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ee
// Size: 0x86
function tank_modifyhelidamage( data )
{
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    return modifieddamage;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x117d
// Size: 0x9d
function tank_handlehelideathdamage( data )
{
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    
    if ( isdefined( self.intromodel ) )
    {
        self.intromodel delete();
    }
    
    self notify( "death" );
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1222
// Size: 0x42, Type: bool
function tank_modifydamageresponse( data )
{
    thread tank_modifydamagestate( data );
    damage = data.damage;
    type = data.meansofdeath;
    return true;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x126d
// Size: 0x37, Type: bool
function tank_modifydamagestate( data )
{
    damage = data.damage;
    self.currenthealth = self.health - damage;
    return true;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ad
// Size: 0x13
function tank_override_moving_platform_death( data )
{
    thread tank_destroy();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12c8
// Size: 0x18
function tank_watchfortimeoutdisowned()
{
    self endon( "death" );
    tank_watchfortimeoutdisownedendearly();
    thread tank_destroy();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e8
// Size: 0x4d
function tank_watchfortimeoutdisownedendearly()
{
    self endon( "killstreakExit" );
    self.owner endon( "disconnect" );
    self.owner endon( "joined_team" );
    self.owner endon( "joined_spectators" );
    level endon( "game_ended" );
    scripts\cp\cp_hostmigration::waitlongdurationwithhostmigrationpause( self.lifetime );
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x133d
// Size: 0xc9
function tank_destroy( attacker )
{
    if ( istrue( self.destroyed ) )
    {
        return;
    }
    else
    {
        self.destroyed = 1;
    }
    
    level.remote_tanks = array_remove( level.remote_tanks, self );
    self notify( "death" );
    self.mgturret notify( "death" );
    
    if ( !isdefined( attacker ) )
    {
        attacker = self.owner;
    }
    
    if ( isdefined( self.driver ) )
    {
        thread tank_driverexit( self.driver );
    }
    
    if ( isdefined( self.useobj ) )
    {
        self.useobj delete();
    }
    
    self.health = 0;
    self setcandamage( 0 );
    self.mgturret setmode( "sentry_offline" );
    waitframe();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x140e
// Size: 0x1f, Type: bool
function tank_destroycallback( data )
{
    thread tank_destroy( data.attacker );
    return false;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1436
// Size: 0xc8
function tank_driverexit( driver )
{
    self waittill( "killstreakExit" );
    self notify( "end_remote" );
    self.driver = undefined;
    driver.isusingremotetank = undefined;
    driver controlsunlink();
    
    if ( isdefined( self.mgturret ) )
    {
        driver remotecontrolturretoff( self.mgturret );
    }
    
    if ( isdefined( driver.restoreangles ) )
    {
        driver setplayerangles( driver.restoreangles );
        driver.restoreangles = undefined;
    }
    
    driver setclientomnvar( "ui_pac_sentry_controls", 0 );
    driver thread stopremotesequence( 1 );
    self setotherent( undefined );
    self setentityowner( undefined );
    self.owner = undefined;
    self.mgturret maketurretinoperable();
    driver painvisionon();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1506
// Size: 0x9a
function tank_handleairburst()
{
    self endon( "death" );
    
    while ( true )
    {
        self.mgturret waittill( "missile_fire", projectile );
        explosionfx = spawn( "script_model", projectile.origin );
        explosionfx setmodel( "ks_pac_sentry_mp" );
        explosionfx.angles = projectile.angles;
        explosionfx linkto( projectile );
        explosionfx setentityowner( self.owner );
        thread tank_watchprojectiledeath( projectile, explosionfx );
        thread tank_findclosestairbursttarget( projectile );
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15a8
// Size: 0x7d
function tank_watchprojectiledeath( projectile, explosionfxent )
{
    explosionfxent endon( "death" );
    result = projectile waittill_any_return_2( "death", "perform_airburst" );
    
    if ( isdefined( result ) && result == "perform_airburst" )
    {
        explosionfxent setscriptablepartstate( "airburst", "airExpl" );
        explosionfxent unlink();
        explosionfxent thread tank_delayairburstscriptabledeath();
        
        if ( isdefined( projectile ) )
        {
            projectile delete();
        }
        
        return;
    }
    
    explosionfxent delete();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162d
// Size: 0x19
function tank_delayairburstscriptabledeath()
{
    self endon( "death" );
    scripts\cp\cp_hostmigration::waitlongdurationwithhostmigrationpause( 2 );
    self delete();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x164e
// Size: 0x125
function tank_findclosestairbursttarget( var_ee356ed81b5cb7f4 )
{
    var_ee356ed81b5cb7f4 endon( "death" );
    self endon( "death" );
    
    while ( true )
    {
        closestdist = undefined;
        var_f777afd0b830d8f3 = undefined;
        all_enemies = scripts\cp\cp_agent_utils::getaliveagentsofteam( "axis" );
        closestenemies = get_array_of_closest( var_ee356ed81b5cb7f4.origin, all_enemies, undefined, 10, 100 );
        
        foreach ( enemy in closestenemies )
        {
            if ( !isdefined( enemy ) || !should_be_affected_by_trap( enemy, 1 ) )
            {
                continue;
            }
            
            if ( level.teambased && enemy.team == self.owner.team )
            {
                continue;
            }
            
            if ( !var_ee356ed81b5cb7f4 tank_canseetarget( enemy ) )
            {
                continue;
            }
            
            var_f777afd0b830d8f3 = enemy;
            break;
        }
        
        if ( isdefined( var_f777afd0b830d8f3 ) )
        {
            var_ee356ed81b5cb7f4 notify( "perform_airburst" );
            break;
        }
        
        waitframe();
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x177b
// Size: 0xb7
function tank_handlewheeldustfx()
{
    self endon( "death" );
    var_2bdc3e3680df74eb = 0;
    
    if ( istrue( level.wet_level ) )
    {
        return;
    }
    
    while ( isdefined( self.owner ) )
    {
        currentvehiclespeed = self vehicle_getspeed();
        var_46c9a177682cfdd2 = currentvehiclespeed * 1.60934;
        
        if ( currentvehiclespeed > 3 && !istrue( var_2bdc3e3680df74eb ) )
        {
            var_2bdc3e3680df74eb = 1;
            self setscriptablepartstate( "dust", "on" );
        }
        else if ( currentvehiclespeed <= 3 && istrue( var_2bdc3e3680df74eb ) )
        {
            var_2bdc3e3680df74eb = 0;
            self setscriptablepartstate( "dust", "off" );
        }
        
        self.owner setclientomnvar( "ui_pac_sentry_speed", int( var_46c9a177682cfdd2 ) );
        waitframe();
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x183a
// Size: 0x67
function tank_empgrenaded()
{
    self notify( "tank_EMPGrenaded" );
    self endon( "tank_EMPGrenaded" );
    self endon( "death" );
    self.owner endon( "disconnect" );
    level endon( "game_ended" );
    self.empgrenaded = 1;
    self.mgturret turretfiredisable();
    wait 3.5;
    self.empgrenaded = 0;
    self.mgturret turretfireenable();
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18a9
// Size: 0xd1
function tank_watchfiring( remotetank )
{
    self endon( "disconnect" );
    self endon( "end_remote" );
    remotetank endon( "death" );
    var_7c326413a1e419ae = 50;
    var_6c9f573716fd0f4c = var_7c326413a1e419ae;
    firetime = weaponfiretime( level.tanksettings[ remotetank.tanktype ].mgturretinfo );
    
    while ( true )
    {
        if ( remotetank.mgturret isfiringvehicleturret() )
        {
            var_6c9f573716fd0f4c--;
            
            if ( var_6c9f573716fd0f4c <= 0 )
            {
                remotetank.mgturret turretfiredisable();
                wait 2.5;
                remotetank playsound( "talon_reload" );
                self playlocalsound( "talon_reload_plr" );
                var_6c9f573716fd0f4c = var_7c326413a1e419ae;
                remotetank.mgturret turretfireenable();
            }
        }
        
        wait firetime;
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1982
// Size: 0x64
function tank_earthquake()
{
    self endon( "death" );
    self.owner endon( "end_remote" );
    self.owner endon( "disconnect" );
    
    while ( isdefined( self.owner ) )
    {
        self.owner earthquakeforplayer( 0.07, 0.25, self gettagorigin( "tag_body" ), 500 );
        wait 0.25;
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19ee
// Size: 0xc8
function tank_canseetarget( target, offset )
{
    if ( !isdefined( offset ) )
    {
        offset = ( 0, 0, 0 );
    }
    
    icansee = 0;
    contents = scripts\engine\trace::create_contents( 0, 1, 1, 1, 1, 1, 0, 1 );
    tracepoints = [ target gettagorigin( "j_head" ), target gettagorigin( "j_mainroot" ), target gettagorigin( "tag_origin" ) ];
    
    for (i = 0; i < tracepoints.size; i++) {
        if ( !scripts\engine\trace::ray_trace_passed( self.origin + offset, tracepoints[ i ], self, contents ) )
        {
            continue;
        }
        
        icansee = 1;
        break;
    }
    
    return icansee;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1abf
// Size: 0x96
function stopremotesequence( var_3cff035c1ecbd186 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "stop_remote_sequence" );
    
    if ( scripts\cp_mp\utility\player_utility::_isalive() )
    {
        remoteweapon = "ks_remote_device_mp";
        
        if ( istrue( var_3cff035c1ecbd186 ) )
        {
            wait 0.1;
            self notify( "finished_with_manual_weapon_" + remoteweapon );
        }
        else
        {
            self notify( "killstreak_finished_with_weapon_" + remoteweapon );
        }
        
        self takeweapon( remoteweapon );
    }
    
    clearusingremote();
    waittill_any_timeout_1( 1.3, "death" );
    self setclientomnvar( "ui_remote_control_sequence", 0 );
    self setclientomnvar( "ui_hide_hud", 0 );
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b5d
// Size: 0x177, Type: bool
function playremotesequence( streakinfo, var_3cff035c1ecbd186 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    
    if ( isusingremote() )
    {
        return false;
    }
    
    if ( !scripts\cp_mp\utility\player_utility::_isalive() )
    {
        return false;
    }
    
    self notify( "play_remote_sequence" );
    self playlocalsound( "mp_killstreak_tablet_gear" );
    remoteweapon = undefined;
    
    if ( istrue( var_3cff035c1ecbd186 ) )
    {
        if ( self isonladder() || self ismantling() || !self isonground() )
        {
            scripts\cp\cp_hud_message::showerrormessage( "KILLSTREAKS/UNAVAILABLE" );
            return false;
        }
        
        remoteweapon = "ks_remote_device_mp";
        _giveweapon( remoteweapon, 0, 0, 1 );
        self setclientomnvar( "ui_remote_control_sequence", 1 );
        switchresult = switchtoweaponreliable( remoteweapon );
        
        if ( !istrue( switchresult ) )
        {
            return false;
        }
    }
    
    setusingremote( "remotetank" );
    _freezecontrols( 1 );
    thread unfreezeonroundend();
    thread startfadetransition( 1.8 );
    result = waittill_any_timeout_1( 1.8, "death" );
    self notify( "ks_freeze_end" );
    
    if ( !isdefined( result ) || result != "timeout" )
    {
        self setclientomnvar( "ui_remote_control_sequence", 0 );
        _freezecontrols( 0 );
        clearusingremote();
        
        if ( isdefined( remoteweapon ) )
        {
            self notify( "finished_with_manual_weapon_" + remoteweapon );
        }
        
        self stoplocalsound( "mp_killstreak_tablet_gear" );
        self notify( "cancel_remote_sequence" );
        return false;
    }
    
    _freezecontrols( 0 );
    self setclientomnvar( "ui_remote_control_sequence", 0 );
    return true;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cdd
// Size: 0x3f4
function fire_on_nearby_players( var_b026d19bc14d8ad0 )
{
    self endon( "death" );
    level endon( "wheelsons_deactivated" );
    self.targetent = spawn( "script_origin", self.origin );
    lights_on = 0;
    time_before_shoot = 0.75;
    
    if ( isdefined( self.time_before_shoot ) )
    {
        time_before_shoot = self.time_before_shoot;
    }
    
    time_after_shoot = 0.5;
    
    if ( isdefined( self.time_after_shoot ) )
    {
        time_after_shoot = self.time_after_shoot;
    }
    
    if ( !isdefined( self.max_detection_sq ) )
    {
        self.max_detection_sq = 54289;
    }
    
    thread flicker_tank_lights();
    target_offset = ( 0, 0, 50 );
    
    while ( true )
    {
        while ( !isdefined( self.owner ) )
        {
            valid_player = undefined;
            
            foreach ( player in level.players )
            {
                if ( distancesquared( self.mgturret.origin, player.origin ) > self.max_detection_sq )
                {
                    continue;
                }
                
                if ( isdefined( self.last_attacker ) && gettime() <= self.last_attack_time + 5000 )
                {
                }
                else if ( isdefined( var_b026d19bc14d8ad0 ) )
                {
                    fov = var_b026d19bc14d8ad0;
                    
                    if ( !math::within_fov_2d( self.mgturret.origin, self.mgturret.angles, player.origin, fov ) )
                    {
                        continue;
                    }
                }
                
                target_offset = get_offset_from_stance( valid_player );
                
                if ( !tank_canseetarget( player, target_offset ) )
                {
                    continue;
                }
                
                if ( !isdefined( self.last_target ) || player != self.last_target )
                {
                    self.last_target = undefined;
                }
                
                valid_player = player;
                break;
            }
            
            if ( !isdefined( valid_player ) )
            {
                wait 0.5;
                self.mgturret cleartargetentity();
                
                if ( lights_on )
                {
                    self.mgturret laseroff();
                    lights_on = 0;
                }
                
                self.last_target = undefined;
                continue;
            }
            else
            {
                if ( !lights_on )
                {
                    self.mgturret laseron();
                    thread flicker_tank_lights();
                    lights_on = 1;
                }
                
                target_offset = get_offset_from_stance( valid_player );
                self.mgturret settargetentity( valid_player, target_offset );
                self.mgturret waittill_any_timeout_1( 5, "turret_on_target" );
                
                if ( !valid_player is_valid_player() || !tank_canseetarget( valid_player, target_offset ) )
                {
                    wait 0.5;
                    
                    if ( lights_on )
                    {
                        self.mgturret laseroff();
                        lights_on = 0;
                    }
                    
                    self.last_target = undefined;
                    continue;
                }
                
                if ( valid_player is_valid_player() )
                {
                    if ( !isdefined( self.last_target ) )
                    {
                        self.last_target = valid_player;
                        valid_player playlocalsound( "canister_warning" );
                    }
                }
                
                wait time_before_shoot;
                target_offset = get_offset_from_stance( valid_player );
                
                if ( !valid_player is_valid_player() || !tank_canseetarget( valid_player, target_offset ) || distancesquared( self.mgturret.origin, valid_player.origin ) > self.max_detection_sq )
                {
                    if ( lights_on )
                    {
                        self.mgturret laseroff();
                        lights_on = 0;
                    }
                    
                    continue;
                }
                
                if ( isdefined( self.config.turretoverridefunc ) )
                {
                    [[ self.config.turretoverridefunc ]]( valid_player );
                }
                else
                {
                    self.mgturret shootturret();
                }
                
                thread notify_nearby_enemies();
                valid_player thread damage_nearby_dynolights();
                wait time_after_shoot;
            }
            
            wait 0.5;
        }
        
        wait 0.1;
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20d9
// Size: 0xae
function notify_nearby_enemies()
{
    level notify( "enemy_spotted", self );
    enemies = scripts\cp\cp_agent_utils::getaliveagentsofteam( "axis" );
    enemy_notify_range = 1000;
    
    if ( isdefined( self.enemy_notify_range ) )
    {
        enemy_notify_range = self.enemy_notify_range;
    }
    
    closest_enemies = get_array_of_closest( self.origin, enemies, undefined, undefined, enemy_notify_range );
    
    foreach ( enemy in closest_enemies )
    {
        enemy notify( "bulletwhizby" );
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x218f
// Size: 0xa1
function get_offset_from_stance( valid_player )
{
    target_offset = ( 0, 0, 50 );
    
    if ( isplayer( valid_player ) )
    {
        stance = valid_player getstance();
        
        switch ( stance )
        {
            case #"hash_3fed0cbd303639eb":
                target_offset = ( 0, 0, 25 );
                break;
            case #"hash_d91940431ed7c605":
                target_offset = ( 0, 0, 0 );
                break;
            default:
                target_offset = ( 0, 0, 50 );
                break;
        }
    }
    
    return target_offset;
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2239
// Size: 0x9b
function damage_nearby_dynolights()
{
    if ( !is_valid_player() )
    {
        return;
    }
    
    var_88724d62de58751f = getentarray( "office_light_destructible", "script_noteworthy" );
    near_lights = get_array_of_closest( self.origin, var_88724d62de58751f, undefined, 2, 350 );
    
    if ( near_lights.size == 0 )
    {
        return;
    }
    
    foreach ( light in near_lights )
    {
        light notify( "damage", 1000 );
    }
}

// Namespace cp_remote_tank / scripts\cp\cp_remote_tank
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22dc
// Size: 0x79
function flicker_tank_lights()
{
    self endon( "death" );
    on_state = "on";
    
    if ( isdefined( self.config.turretlightsonstate ) )
    {
        on_state = self.config.turretlightsonstate;
    }
    
    self.mgturret setscriptablepartstate( "lights", "off" );
    wait 0.5;
    self.mgturret setscriptablepartstate( "lights", on_state );
}

