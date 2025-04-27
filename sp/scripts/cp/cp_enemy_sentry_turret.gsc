#using scripts\common\utility;
#using scripts\cp\agent_damage;
#using scripts\cp\damagefeedback;
#using scripts\cp\interaction;
#using scripts\cp\rank;
#using scripts\cp\utility;
#using scripts\cp_mp\emp_debuff;
#using scripts\engine\utility;

#namespace cp_enemy_sentry_turret;

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x220
// Size: 0x2b3
function setup_enemy_sentry( var_804269875f5062f1, turret_model )
{
    sentrytype = "sentry_turret";
    config = level.sentrysettings[ sentrytype ];
    turret = spawnturret( "misc_turret", var_804269875f5062f1.origin, level.sentrysettings[ sentrytype ].weaponinfo );
    turret.team = "axis";
    
    if ( !isdefined( var_804269875f5062f1.angles ) )
    {
        var_804269875f5062f1.angles = ( 0, 0, 0 );
    }
    
    turret.angles = var_804269875f5062f1.angles;
    turret.health = config.maxhealth;
    turret.maxhealth = config.maxhealth;
    turret.sentrytype = sentrytype;
    turret.momentum = 0;
    turret.heatlevel = 0;
    turret.overheated = 0;
    turret.cooldownwaittime = 2;
    turret.turrettype = "sentry_turret";
    
    if ( !isdefined( turret_model ) )
    {
        turret_model = "";
    }
    
    turret setmodel( turret_model );
    turret setturretteam( "axis" );
    turret makeunusable();
    turret setnodeploy( 1 );
    turret setdefaultdroppitch( 0 );
    turret setautorotationdelay( 0.2 );
    turret maketurretinoperable();
    turret setleftarc( 80 );
    turret setrightarc( 80 );
    turret setbottomarc( 50 );
    turret settoparc( 60 );
    turret setconvergencetime( 0.6, "pitch" );
    turret setconvergencetime( 0.6, "yaw" );
    turret setconvergenceheightpercent( 0.65 );
    turret setdefaultdroppitch( -89 );
    turret setturretmodechangewait( 1 );
    turret solid();
    turret scripts\cp_mp\emp_debuff::set_start_emp_callback( &sentryturret_empstarted );
    turret scripts\cp_mp\emp_debuff::set_clear_emp_callback( &sentryturret_empcleared );
    turret scripts\cp_mp\emp_debuff::allow_emp( 0 );
    var_804269875f5062f1.turret = turret;
    
    if ( !isdefined( level.killstreak_additional_targets ) )
    {
        level.killstreak_additional_targets = [];
    }
    
    level.killstreak_additional_targets = array_add( level.killstreak_additional_targets, turret );
    wait 1;
    turret setmode( "auto_nonai" );
    turret scripts\cp_mp\emp_debuff::allow_emp( 1 );
    turret sentryturret_empupdate();
    turret thread damage_feedback_watch();
    turret thread sentry_attacktargets();
    turret thread sentry_handledeath();
    
    /#
        if ( getdvarint( @"hash_69de6d4d9ba136d1", 0 ) )
        {
            turret thread enemy_sentry_debug();
        }
    #/
    
    return turret;
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4dc
// Size: 0x12
function sentryturret_empstarted( data )
{
    sentryturret_empupdate();
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f6
// Size: 0x17
function sentryturret_empcleared( isdeath )
{
    if ( isdeath )
    {
        return;
    }
    
    sentryturret_empupdate();
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x515
// Size: 0x53
function sentryturret_empupdate()
{
    if ( scripts\cp_mp\emp_debuff::is_empd() )
    {
        self turretfiredisable();
        self setmode( level.sentrysettings[ self.turrettype ].sentrymodeoff );
        self laseroff();
        return;
    }
    
    self turretfireenable();
    self setmode( "auto_nonai" );
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x570
// Size: 0xd1
function enemy_sentry_debug()
{
    self endon( "death" );
    self endon( "kill_turret" );
    level endon( "game_ended" );
    org = self.origin;
    interval = 0.05;
    frames = int( interval * 20 );
    
    while ( true )
    {
        /#
            print3d( org, "<dev string:x1c>" + self.health + "<dev string:x21>" + self.maxhealth, ( 1, 1, 1 ), 1, 1, frames, 1 );
        #/
        
        /#
            print3d( org + ( 0, 0, 10 ), "<dev string:x23>" + self.heatlevel, ( 1, 1, 1 ), 1, 1, frames, 1 );
        #/
        
        wait interval;
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x649
// Size: 0x23c
function damage_feedback_watch()
{
    self endon( "death" );
    self endon( "kill_turret" );
    level endon( "game_ended" );
    self setcandamage( 1 );
    
    while ( true )
    {
        self waittill( "damage", idamage, eattacker, vdir, vpoint, smeansofdeath, smodelname, stagname, spartname, idflags, objweapon, origin, angles, normal, einflictor, eventid );
        
        if ( !isdefined( eattacker ) || !isplayer( eattacker ) && ( !isdefined( eattacker.owner ) || !isplayer( eattacker.owner ) ) )
        {
            continue;
        }
        
        if ( isdefined( objweapon.basename ) )
        {
            if ( issubstr( objweapon.basename, "emp_drone" ) )
            {
            }
        }
        
        isplayerdamage = isdefined( eattacker ) && isplayer( eattacker );
        var_7543d4fe49c53684 = isdefined( eattacker.owner ) && isplayer( eattacker.owner );
        var_b4a897b1262ea17c = isdefined( eattacker.classname ) && eattacker.classname == "script_vehicle" && isdefined( eattacker.owner ) && isplayer( eattacker.owner );
        var_f3b5d704ca2a9b3d = var_b4a897b1262ea17c && smeansofdeath == "MOD_CRUSH";
        
        if ( isplayerdamage || var_7543d4fe49c53684 || var_f3b5d704ca2a9b3d )
        {
            if ( !is_specops_gametype() )
            {
                if ( var_7543d4fe49c53684 )
                {
                    eattacker = eattacker.owner;
                }
                
                scripts\cp\agent_damage::addattacker( self, eattacker, einflictor, objweapon, idamage, vpoint, vdir, undefined, undefined, smeansofdeath );
            }
        }
        
        scripts\cp\damagefeedback::process_damage_feedback( einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vdir, vdir, spartname, undefined, self );
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88d
// Size: 0x7b
function sentry_attacktargets()
{
    self endon( "death" );
    level endon( "game_ended" );
    self.momentum = 0;
    self.heatlevel = 0;
    self.overheated = 0;
    thread sentry_heatmonitor();
    
    for ( ;; )
    {
        waittill_either( "turretstatechange", "cooled" );
        
        if ( self isfiringturret() )
        {
            self laseron();
            thread sentry_burstfirestart();
            continue;
        }
        
        self laseroff();
        sentry_spindown();
        thread sentry_burstfirestop();
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x910
// Size: 0x39
function sentry_targetlocksound()
{
    self endon( "death" );
    self playsound( "sentry_gun_beep" );
    wait 0.1;
    self playsound( "sentry_gun_beep" );
    wait 0.1;
    self playsound( "sentry_gun_beep" );
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x951
// Size: 0x55
function sentry_spinup()
{
    thread sentry_targetlocksound();
    
    while ( self.momentum < level.sentrysettings[ self.sentrytype ].spinuptime )
    {
        self.momentum += 0.1;
        wait 0.1;
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ae
// Size: 0xc
function sentry_spindown()
{
    self.momentum = 0;
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c2
// Size: 0x163
function sentry_burstfirestart()
{
    self endon( "death" );
    self endon( "stop_shooting" );
    level endon( "game_ended" );
    sentry_spinup();
    firetime = weaponfiretime( level.sentrysettings[ self.sentrytype ].weaponinfo );
    minshots = level.sentrysettings[ self.sentrytype ].burstmin;
    maxshots = level.sentrysettings[ self.sentrytype ].burstmax;
    minpause = level.sentrysettings[ self.sentrytype ].pausemin;
    maxpause = level.sentrysettings[ self.sentrytype ].pausemax;
    
    for ( ;; )
    {
        numshots = randomintrange( minshots, maxshots + 1 );
        
        for (i = 0; i < numshots && !self.overheated; i++) {
            if ( !sentry_shouldshoot() )
            {
                break;
            }
            
            self shootturret();
            self notify( "bullet_fired" );
            self.heatlevel += firetime;
            wait firetime;
        }
        
        wait randomfloatrange( minpause, maxpause );
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2d
// Size: 0x3e, Type: bool
function sentry_shouldshoot()
{
    if ( istrue( self.dont_shoot_parachutes ) )
    {
        target = self getturrettarget( 0 );
        
        if ( isdefined( target ) && isplayer( target ) && target isparachuting() )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb74
// Size: 0xa
function sentry_burstfirestop()
{
    self notify( "stop_shooting" );
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb86
// Size: 0x153
function sentry_heatmonitor()
{
    if ( istrue( self.skip_overheat ) )
    {
        return;
    }
    
    self endon( "death" );
    firetime = weaponfiretime( level.sentrysettings[ self.sentrytype ].weaponinfo );
    var_c81d1ae9575cd803 = 0;
    var_6d613d4ed09f7ca = 0;
    overheattime = level.sentrysettings[ self.sentrytype ].overheattime;
    overheatcooldown = level.sentrysettings[ self.sentrytype ].cooldowntime;
    
    for ( ;; )
    {
        if ( self.heatlevel != var_c81d1ae9575cd803 )
        {
            wait firetime;
        }
        else
        {
            self.heatlevel = max( 0, self.heatlevel - 0.05 );
        }
        
        if ( self.heatlevel > overheattime )
        {
            self.overheated = 1;
            thread playheatfx();
            
            while ( self.heatlevel )
            {
                self.heatlevel = max( 0, self.heatlevel - overheatcooldown );
                wait 0.1;
            }
            
            self.overheated = 0;
            self notify( "not_overheated" );
        }
        
        var_c81d1ae9575cd803 = self.heatlevel;
        wait 0.05;
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce1
// Size: 0x5e
function playheatfx()
{
    self endon( "death" );
    self endon( "not_overheated" );
    level endon( "game_ended" );
    self notify( "playing_heat_fx" );
    self endon( "playing_heat_fx" );
    
    for ( ;; )
    {
        playfxontag( getfx( "sentry_overheat_mp" ), self, "tag_flash" );
        wait level.sentrysettings[ self.sentrytype ].fxtime;
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd47
// Size: 0x32
function sentry_beepsounds()
{
    self endon( "death" );
    level endon( "game_ended" );
    
    for ( ;; )
    {
        wait 3;
        
        if ( !isdefined( self.carriedby ) )
        {
            self playsound( "sentry_gun_beep" );
        }
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd81
// Size: 0x186
function sentry_handledeath()
{
    self waittill( "death" );
    level.killstreak_additional_targets = array_remove( level.killstreak_additional_targets, self );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self setmode( "sentry_offline" );
    self setscriptablepartstate( "explode", "violent" );
    
    if ( isdefined( self.attackerdata ) )
    {
        foreach ( player in level.players )
        {
            bonusmagnitude = 0;
            
            if ( isdefined( self.attackerdata[ player.guid ] ) && isdefined( self.attackerdata[ player.guid ].damage ) )
            {
                if ( self.attackerdata[ player.guid ].damage >= self.maxhealth * 0.1 )
                {
                    bonusmagnitude = 1;
                }
                
                if ( self.attackerdata[ player.guid ].damage >= self.maxhealth * 0.2 )
                {
                    bonusmagnitude = 2;
                }
                
                if ( bonusmagnitude >= 1 )
                {
                    player thread scripts\cp\rank::giverankxp( #"destroyed_sentry_gun", scripts\cp\rank::getscoreinfovalue( #"destroyed_sentry_gun" ) );
                }
            }
        }
    }
    
    if ( isdefined( self ) )
    {
        thread sentry_deleteturret();
    }
}

// Namespace cp_enemy_sentry_turret / scripts\cp\cp_enemy_sentry_turret
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf0f
// Size: 0x6b
function sentry_deleteturret()
{
    self notify( "sentry_delete_turret" );
    self endon( "sentry_delete_turret" );
    wait 1.5;
    playfxontag( getfx( "sentry_explode_mp" ), self, "tag_aim" );
    playfxontag( getfx( "sentry_smoke_mp" ), self, "tag_aim" );
    self playsound( "sentry_explode_smoke" );
    wait 0.1;
    self notify( "deleting" );
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

