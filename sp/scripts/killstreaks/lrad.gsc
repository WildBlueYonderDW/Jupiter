#using script_16ea1b94f0f381b3;
#using script_608c50392df8c7d1;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\equipment\haywire;
#using scripts\cp_mp\hostmigration;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\killstreaks\manual_turret;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\utility;
#using scripts\killstreaks\killstreak_shared;

#namespace lrad;

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x70c
// Size: 0x18
function autoexec main()
{
    function_df7ab5b0f898e8bc( function_1823ff50bb28148d( "lrad" ), &init );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x72c
// Size: 0xfe
function private init()
{
    if ( issharedfuncdefined( "killstreak", "registerKillstreak" ) )
    {
        [[ getsharedfunc( "killstreak", "registerKillstreak" ) ]]( "lrad", &function_5dae574697e78d96 );
    }
    
    scripts\engine\utility::registersharedfunc( "lrad", "tryUseKillstreak", &function_5dae574697e78d96 );
    scripts\engine\utility::registersharedfunc( "lrad", "LRAD_Hack", &lrad_hack );
    bundle = level.streakglobals.streakbundles[ "lrad" ];
    function_a41e3a211a9e37a4( "lrad", bundle.deployweapon, #"hash_b76b2215370d2700" );
    function_1212a209876bcd8d();
    function_795e8013831a046a();
    level.var_2d9a7cb2b0831e1e = 0;
    level.var_23bb4defc5121d06 = [];
    level.var_f22117519609ef3b = [];
    
    /#
        if ( game_utility::isbrstylegametype() )
        {
            devgui::function_6e7290c8ee4f558b( "<dev string:x1c>" );
            devgui::add_devgui_command( "<dev string:x37>", "<dev string:x40>" );
            devgui::function_fe953f000498048f();
        }
    #/
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x832
// Size: 0x172
function function_1212a209876bcd8d()
{
    bundle = level.streakglobals.streakbundles[ "lrad" ];
    
    /#
        setdvarifuninitialized( @"hash_80d0084f17797030", 0 );
        setdvarifuninitialized( @"hash_5f9bf6b2e15e5727", 0 );
        setdvarifuninitialized( @"hash_356ad37ca5f6f115", 1000 );
    #/
    
    setdvarifuninitialized( @"hash_98efcf229168a436", bundle.var_3eda8aab19e89979 );
    setdvarifuninitialized( @"hash_1df62822bd2adee0", bundle.maxhealth );
    setdvarifuninitialized( @"hash_d7fd0b0d5f62285c", 0.85 );
    setdvarifuninitialized( @"hash_6aa2e155bf9747", 5 );
    setdvarifuninitialized( @"hash_b4d9a80ce75c617", bundle.var_92418e7f80b9d06e );
    setdvarifuninitialized( @"hash_b27192e0593d2245", bundle.var_904281521b1e0ac8 );
    setdvarifuninitialized( @"hash_791416d97b1899ba", 35 );
    setdvarifuninitialized( @"hash_1676fc44b285c55a", bundle.var_aab9b4935e5811e );
    setdvarifuninitialized( @"hash_2ef1444b14cdcc27", bundle.var_8432cf9eeaab54a3 );
    setdvarifuninitialized( @"hash_4469252783a3ea7d", bundle.var_8bb5c785be632a16 );
    setdvarifuninitialized( @"hash_dd550cefcbd1712", bundle.maxhealth );
    setdvarifuninitialized( @"hash_abec145fdf5e6352", 1 );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ac
// Size: 0x61
function function_795e8013831a046a()
{
    game[ "dialog" ][ "lrad_ause" ] = "ause";
    game[ "dialog" ][ "lrad_euse" ] = "euse";
    game[ "dialog" ][ "lrad_lcra" ] = "lcra";
    game[ "dialog" ][ "lrad_ltim" ] = "ltim";
    game[ "dialog" ][ "lrad_earn" ] = "earn";
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa15
// Size: 0x31d, Type: bool
function function_5dae574697e78d96( streakinfo )
{
    if ( !isdefined( streakinfo ) )
    {
        streakinfo = createstreakinfo( "lrad", self );
    }
    
    if ( isdefined( level.killstreaktriggeredfunc ) )
    {
        if ( !level [[ level.killstreaktriggeredfunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    streakinfo.bundle = level.streakglobals.streakbundles[ "lrad" ];
    level.var_2d9a7cb2b0831e1e++;
    
    if ( !isdefined( level.var_23bb4defc5121d06[ self.team ] ) )
    {
        level.var_23bb4defc5121d06[ self.team ] = 1;
    }
    else
    {
        level.var_23bb4defc5121d06[ self.team ]++;
    }
    
    if ( !function_f3cfedd6f1bbfd6f() )
    {
        if ( issharedfuncdefined( "hud", "showErrorMessage" ) )
        {
            [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/LRAD_COUNT_OVER_LIMIT" );
        }
        
        level.var_2d9a7cb2b0831e1e--;
        level.var_23bb4defc5121d06[ self.team ]--;
        return false;
    }
    
    var_6bec98cb2dcc2450 = function_52132724b2c18dc4( streakinfo );
    thread function_f2b4b6d178b092d9();
    
    if ( !isdefined( var_6bec98cb2dcc2450 ) )
    {
        return false;
    }
    
    var_6bec98cb2dcc2450.streakinfo = streakinfo;
    
    if ( isdefined( level.killstreakbeginusefunc ) )
    {
        if ( !level [[ level.killstreakbeginusefunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    maxhealth = getdvarfloat( @"hash_1df62822bd2adee0" );
    function_9469d528dd1ee44d( "lrad", "destroyed_lrad", "destroyed_lrad", "callout_destroyed_lrad" );
    
    if ( issharedfuncdefined( "damage", "monitorDamage" ) )
    {
        var_6bec98cb2dcc2450 thread [[ getsharedfunc( "damage", "monitorDamage" ) ]]( maxhealth, "hitequip", &function_66a7440055d386c3, &function_5733afc81f25372c, 0 );
    }
    
    var_6bec98cb2dcc2450 function_e12969da21420075();
    var_6bec98cb2dcc2450 function_18633ad410bdfdfa();
    var_6bec98cb2dcc2450 scripts\cp_mp\equipment\haywire::function_172d848d58051fdf( &function_67a2561dc56ecc0b );
    var_6bec98cb2dcc2450 scripts\cp_mp\emp_debuff::set_start_emp_callback( &function_a054c2c62f34ac14 );
    var_6bec98cb2dcc2450 scripts\cp_mp\equipment\haywire::function_aa823a31304ed981( &function_5e06c811fe28148a );
    var_6bec98cb2dcc2450 scripts\cp_mp\emp_debuff::set_clear_emp_callback( &function_43197d230c4d9635 );
    
    if ( issharedfuncdefined( "emp", "setEMP_Applied_Callback" ) )
    {
        var_6bec98cb2dcc2450 [[ getsharedfunc( "emp", "setEMP_Applied_Callback" ) ]]( &function_a054c2c62f34ac14 );
    }
    
    if ( issharedfuncdefined( "emp", "setEMP_Cleared_Callback" ) )
    {
        var_6bec98cb2dcc2450 [[ getsharedfunc( "emp", "setEMP_Cleared_Callback" ) ]]( &function_43197d230c4d9635 );
    }
    
    thread function_5189f677d1332852( var_6bec98cb2dcc2450, streakinfo );
    thread function_9235bfde9b04fc60( var_6bec98cb2dcc2450, var_6bec98cb2dcc2450.useownerobj );
    maxlifetime = getdvarfloat( @"hash_98efcf229168a436" );
    var_6bec98cb2dcc2450 thread function_47b5394a301d8c5( maxlifetime, @"hash_80d0084f17797030", &lrad_timeout );
    
    /#
        var_6bec98cb2dcc2450 thread function_1defeaf387d6e2a9( @"hash_80d0084f17797030" );
    #/
    
    var_6bec98cb2dcc2450 function_63d1a11f8b22244( streakinfo, &function_136ba4565fe17b8, &lrad_destroy );
    self notify( "munitions_used", "lrad" );
    self notify( "lrad_placed" );
    level.var_f22117519609ef3b = array_add( level.var_f22117519609ef3b, var_6bec98cb2dcc2450 );
    
    if ( isdefined( level.var_648cfe8e093ab1e ) )
    {
        level thread [[ level.var_648cfe8e093ab1e ]]( self );
    }
    
    return true;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd3b
// Size: 0x45
function function_f2b4b6d178b092d9( var_6bec98cb2dcc2450 )
{
    self endon( "lrad_placed" );
    
    while ( true )
    {
        if ( !_isalive() )
        {
            level.var_2d9a7cb2b0831e1e--;
            level.var_23bb4defc5121d06[ self.team ]--;
            break;
        }
        
        waitframe();
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd88
// Size: 0x191, Type: bool
function function_f3cfedd6f1bbfd6f()
{
    bundle = level.streakglobals.streakbundles[ "lrad" ];
    
    if ( level.var_f22117519609ef3b.size >= bundle.var_c98e519f70bf4a5f || level.var_f22117519609ef3b.size + level.var_2d9a7cb2b0831e1e > bundle.var_c98e519f70bf4a5f )
    {
        return false;
    }
    
    var_25e613b55682a30c = 0;
    var_175fecc960f5f281 = 0;
    var_b3daaaea66bc9eee = 0;
    
    foreach ( lrad in level.var_f22117519609ef3b )
    {
        if ( distance2d( lrad.origin, self.origin ) <= bundle.var_4c564e3e500a1723 )
        {
            var_b3daaaea66bc9eee++;
        }
        
        if ( lrad.owner == self )
        {
            var_175fecc960f5f281++;
            var_25e613b55682a30c++;
            continue;
        }
        
        if ( lrad.team == self.team )
        {
            var_25e613b55682a30c++;
        }
    }
    
    if ( var_b3daaaea66bc9eee >= bundle.var_6ec1ad14e28e99a1 )
    {
        return false;
    }
    
    if ( var_25e613b55682a30c >= bundle.var_17b7b6fe6675fb64 || var_25e613b55682a30c + level.var_23bb4defc5121d06[ self.team ] > bundle.var_17b7b6fe6675fb64 )
    {
        return false;
    }
    
    if ( var_175fecc960f5f281 >= bundle.var_479d98641f857668 )
    {
        return false;
    }
    
    return true;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf22
// Size: 0xb3
function function_52132724b2c18dc4( streakinfo )
{
    self endon( "death" );
    self endon( "disconnect" );
    endonnotify = "sentry_placement_failed";
    
    if ( issharedfuncdefined( "weapons", "watchForPlacementFireState" ) )
    {
        self thread [[ getsharedfunc( "weapons", "watchForPlacementFireState" ) ]]( streakinfo, endonnotify );
    }
    
    deployresult = streakdeploy_doweaponswitchdeploy( streakinfo, makeweapon( streakinfo.bundle.deployweapon ), 1, undefined, undefined, &function_5a68b8ee35170bf9 );
    
    if ( !istrue( deployresult ) )
    {
        return undefined;
    }
    
    function_8703bc55951530be( 1 );
    var_6bec98cb2dcc2450 = lrad_place( streakinfo );
    function_8703bc55951530be( 0 );
    return var_6bec98cb2dcc2450;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfde
// Size: 0x159
function lrad_place( streakinfo )
{
    marker = function_3c44a60f10088e51( streakinfo, 0, 0.25 );
    var_6bec98cb2dcc2450 = undefined;
    
    if ( isdefined( marker ) )
    {
        var_6bec98cb2dcc2450 = function_cce8da1f44d40890( marker );
        
        if ( isdefined( marker.moving_platform ) )
        {
            var_6bec98cb2dcc2450.moving_platform = marker.moving_platform;
            var_6bec98cb2dcc2450.moving_platform_offset = marker.moving_platform_offset;
            var_6bec98cb2dcc2450.moving_platform_angles_offset = marker.moving_platform_angles_offset;
        }
        
        var_6bec98cb2dcc2450.colmodel show();
        var_6bec98cb2dcc2450.colmodel.angles = var_6bec98cb2dcc2450.angles;
        var_6bec98cb2dcc2450.colmodel.origin = var_6bec98cb2dcc2450.origin;
        var_6bec98cb2dcc2450.colmodel linkto( var_6bec98cb2dcc2450 );
        var_6bec98cb2dcc2450 setscriptablepartstate( "beam", "active", 0 );
        var_6bec98cb2dcc2450 thread function_481e1d72fdaac162();
        var_6bec98cb2dcc2450.vodestroyed = "lrad_teamleader_destroyed";
        
        if ( issharedfuncdefined( "sound", "playKillstreakDeployDialog" ) )
        {
            [[ getsharedfunc( "sound", "playKillstreakDeployDialog" ) ]]( var_6bec98cb2dcc2450.owner, "lrad" );
        }
    }
    
    return var_6bec98cb2dcc2450;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1140
// Size: 0x2c
function function_18633ad410bdfdfa()
{
    self setscriptablepartstate( "beam", "active", 0 );
    thread function_481e1d72fdaac162();
    thread function_d2368d84391b6a68();
    thread function_9c3226ae596454e6();
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1174
// Size: 0x28
function function_6402ac006cab5c40()
{
    self setscriptablepartstate( "beam", "idle", 0 );
    self stoploopsound( "jup_kls_lrad_beam_outside" );
    self notify( "beamStop" );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a4
// Size: 0x48
function function_481e1d72fdaac162()
{
    level endon( "game_ended" );
    self endon( "death" );
    self.owner endon( "disconnected" );
    self endon( "isCarried" );
    
    if ( !isdefined( self.ishaywire ) || !istrue( self.ishaywire ) )
    {
        wait 0.6;
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11f4
// Size: 0x26a
function function_cce8da1f44d40890( marker, var_6bec98cb2dcc2450 )
{
    bundle = level.streakglobals.streakbundles[ "lrad" ];
    verticalspawnoffset = getdvarint( @"hash_6aa2e155bf9747" );
    
    if ( !isdefined( var_6bec98cb2dcc2450 ) )
    {
        var_6bec98cb2dcc2450 = self launchgrenade( bundle.spawnweapon, marker.location + ( 0, 0, verticalspawnoffset ), ( 0, 0, 0 ) );
        
        if ( issharedfuncdefined( "hud", "teamPlayerCardSplash" ) )
        {
            self thread [[ getsharedfunc( "hud", "teamPlayerCardSplash" ) ]]( "used_" + "lrad", self );
        }
    }
    else
    {
        var_6bec98cb2dcc2450.origin = marker.location + ( 0, 0, verticalspawnoffset );
    }
    
    var_6bec98cb2dcc2450.angles = self.angles;
    var_6bec98cb2dcc2450.team = self.team;
    var_6bec98cb2dcc2450.owner = self;
    var_6bec98cb2dcc2450 function_5226227bce83ebe9( 3, var_6bec98cb2dcc2450.team );
    var_6bec98cb2dcc2450 show();
    var_6bec98cb2dcc2450.colmodel = spawn( "script_model", var_6bec98cb2dcc2450.origin );
    var_6bec98cb2dcc2450.colmodel.team = var_6bec98cb2dcc2450.team;
    var_6bec98cb2dcc2450.colmodel.owner = var_6bec98cb2dcc2450.owner;
    var_6bec98cb2dcc2450.colmodel setmodel( "vm_jup_2h_lrad_00_invis_base" );
    var_6bec98cb2dcc2450.colmodel dontinterpolate();
    var_6bec98cb2dcc2450.colmodel hide();
    
    if ( issharedfuncdefined( "killstreak", "addToActiveKillstreakList" ) )
    {
        var_6bec98cb2dcc2450 [[ getsharedfunc( "killstreak", "addToActiveKillstreakList" ) ]]( "lrad", "Killstreak_Ground", self, 0, 1, 55, "isCarried" );
    }
    
    function_f74b0080a679742b( var_6bec98cb2dcc2450 );
    
    if ( issharedfuncdefined( "game", "createObjective" ) )
    {
        var_6bec98cb2dcc2450.minimapid = var_6bec98cb2dcc2450 [[ getsharedfunc( "game", "createObjective" ) ]]( bundle.minimapicon, var_6bec98cb2dcc2450.team, 1, 1, 1 );
    }
    
    var_6bec98cb2dcc2450 setscriptablepartstate( "spawned", "deploy", 0 );
    return var_6bec98cb2dcc2450;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1467
// Size: 0x150
function function_f74b0080a679742b( var_6bec98cb2dcc2450 )
{
    hinttag = "j_mount";
    hintpos = var_6bec98cb2dcc2450 gettagorigin( hinttag );
    
    if ( !isdefined( var_6bec98cb2dcc2450.useownerobj ) )
    {
        if ( issharedfuncdefined( "game", "createHintObject" ) )
        {
            var_6bec98cb2dcc2450.useownerobj = [[ getsharedfunc( "game", "createHintObject" ) ]]( hintpos, "HINT_BUTTON", undefined, %KILLSTREAKS_HINTS/LRAD_USE, undefined, undefined, "show" );
        }
    }
    else
    {
        hintpos = var_6bec98cb2dcc2450 gettagorigin( hinttag );
        var_6bec98cb2dcc2450.useownerobj function_dfb78b3e724ad620( 1 );
        var_6bec98cb2dcc2450.useownerobj dontinterpolate();
        var_6bec98cb2dcc2450.useownerobj.origin = hintpos;
    }
    
    foreach ( player in level.players )
    {
        if ( player != self )
        {
            var_6bec98cb2dcc2450.useownerobj disableplayeruse( player );
            continue;
        }
        
        var_6bec98cb2dcc2450.useownerobj enableplayeruse( player );
    }
    
    var_6bec98cb2dcc2450.useownerobj linkto( var_6bec98cb2dcc2450, hinttag );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15bf
// Size: 0x116
function function_3c44a60f10088e51( streakinfo, ignorecancel, delaytime )
{
    thread function_73b3147446ea5f18( delaytime );
    marker = undefined;
    
    if ( issharedfuncdefined( "killstreak", "getTargetMarker" ) )
    {
        marker = [[ getsharedfunc( "killstreak", "getTargetMarker" ) ]]( streakinfo, ignorecancel );
    }
    
    if ( !isdefined( marker ) || !isdefined( marker.location ) )
    {
        if ( _isalive() )
        {
            function_9f6045ef775e961c( streakinfo.bundle.deployweapon );
        }
        
        return undefined;
    }
    
    if ( isdefined( self ) && _isalive() )
    {
        self freezecontrols( 1 );
    }
    else
    {
        return undefined;
    }
    
    if ( self hasweapon( streakinfo.bundle.deployweapon ) )
    {
        thread function_9f6045ef775e961c( streakinfo.bundle.deployweapon, 1, 1 );
    }
    
    delayspawntime = getdvarfloat( @"hash_d7fd0b0d5f62285c" );
    wait delayspawntime;
    self freezecontrols( 0 );
    return marker;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16de
// Size: 0x50
function function_73b3147446ea5f18( delaytime )
{
    self endon( "death_or_disconnect" );
    self endon( "lrad_placed" );
    level endon( "game_ended" );
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause( delaytime );
    self setclientomnvar( "ui_turret_placement", 1 );
    thread scripts\cp_mp\killstreaks\manual_turret::manualturret_clearplacementinstructions( "death" );
    thread scripts\cp_mp\killstreaks\manual_turret::manualturret_clearplacementinstructions( "lrad_placed" );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1736
// Size: 0xcf
function function_136ba4565fe17b8( callbackparams )
{
    meansofdeath = callbackparams.meansofdeath;
    
    if ( isdefined( self.useownerobj ) )
    {
        self.useownerobj function_dfb78b3e724ad620( 0 );
    }
    
    if ( isdefined( meansofdeath ) && ( meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_GRENADE_SPLASH" ) )
    {
        self setscriptablepartstate( "explode", "violent" );
    }
    else
    {
        self playsound( "sentry_explode_smoke" );
        self setscriptablepartstate( "explode", "regular" );
    }
    
    wait 0.2;
    self setscriptablepartstate( "visibility", "hide" );
    self setscriptablepartstate( "beam", "idle" );
    self hide();
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x180d
// Size: 0x111
function lrad_destroy( delaytime )
{
    if ( isdefined( delaytime ) )
    {
        wait delaytime;
    }
    
    if ( isdefined( self.useownerobj ) )
    {
        self.useownerobj delete();
    }
    
    if ( isdefined( self.colmodel ) )
    {
        self.colmodel delete();
    }
    
    if ( isdefined( self.stuntrigger ) )
    {
        foreach ( player in self.stuntrigger.playersintrigger )
        {
            if ( !isdefined( player ) )
            {
                continue;
            }
            
            self.stuntrigger.playersintrigger[ player getentitynumber() ] = undefined;
            
            if ( isalive( player ) )
            {
                player function_56da58bd9ea3d08d();
            }
        }
        
        self.stuntrigger delete();
    }
    
    level.var_f22117519609ef3b = array_remove( level.var_f22117519609ef3b, self );
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1926
// Size: 0x25
function lrad_timeout( params )
{
    self.owner playkillstreakteamleaderdialog( "lrad", "lrad_teamleader_timeout" );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1953
// Size: 0x8f
function function_9f6045ef775e961c( deployweapon, immediateswitch, optionaltimedelay )
{
    if ( isdefined( optionaltimedelay ) && optionaltimedelay > 0 )
    {
        self endon( "death_or_disconnect" );
        level endon( "game_ended" );
        wait optionaltimedelay;
    }
    
    lastweaponobj = restoreweaponstates( self.lastdroppableweaponobj );
    level.var_2d9a7cb2b0831e1e--;
    level.var_23bb4defc5121d06[ self.team ]--;
    
    if ( istrue( immediateswitch ) )
    {
        _switchtoweaponimmediate( lastweaponobj );
    }
    else
    {
        _switchtoweapon( lastweaponobj );
    }
    
    _takeweapon( deployweapon );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19ea
// Size: 0x28
function function_5a68b8ee35170bf9( streakinfo, switchresult, weaponobj )
{
    if ( !istrue( switchresult ) )
    {
        getridofkillstreakdeployweapon( weaponobj );
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1a
// Size: 0x93
function function_8703bc55951530be( var_5c911c4e7ce59792 )
{
    if ( _isalive() )
    {
        if ( var_5c911c4e7ce59792 )
        {
            val::set( "lrad_placement", "sprint", 0 );
            val::set( "lrad_placement", "weapon_switch", 0 );
            val::set( "lrad_placement", "offhand_weapons", 0 );
            val::set( "lrad_placement", "melee", 0 );
            val::set( "lrad_placement", "execution_attack", 0 );
            val::set( "lrad_placement", "ladder_placement", 0 );
            return;
        }
        
        val::reset_all( "lrad_placement" );
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab5
// Size: 0x5e
function function_9235bfde9b04fc60( var_6bec98cb2dcc2450, useobj )
{
    if ( isdefined( var_6bec98cb2dcc2450 ) )
    {
        var_6bec98cb2dcc2450 endon( "death" );
        var_6bec98cb2dcc2450 endon( "lrad_dying" );
    }
    
    self endon( "disconnect" );
    level endon( "game_ended" );
    self endon( "lrad_hacked" );
    
    while ( true )
    {
        level waittill( "connected", player );
        useobj disableplayeruse( player );
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1b
// Size: 0xa9
function function_5189f677d1332852( var_6bec98cb2dcc2450, streakinfo )
{
    self endon( "disconnect" );
    self endon( "lrad_hacked" );
    var_6bec98cb2dcc2450 endon( "lrad_dying" );
    level endon( "game_ended" );
    
    while ( true )
    {
        var_6bec98cb2dcc2450.useownerobj waittill( "trigger", player );
        
        if ( isdefined( player ) && !function_21550b5260803f0b( player ) )
        {
            continue;
        }
        
        var_6bec98cb2dcc2450.useownerobj function_dfb78b3e724ad620( 0 );
        level.var_2d9a7cb2b0831e1e++;
        level.var_23bb4defc5121d06[ self.team ]++;
        thread function_43adb6908f665a51( var_6bec98cb2dcc2450, streakinfo );
        thread function_883487704e982cda();
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bcc
// Size: 0x75
function function_883487704e982cda()
{
    var_5fec53c49890f027 = self.var_9717afbc6163113;
    
    if ( !isdefined( var_5fec53c49890f027 ) )
    {
        return;
    }
    
    foreach ( ent in var_5fec53c49890f027 )
    {
        if ( isdefined( ent ) && isalive( ent ) )
        {
            ent thread function_56da58bd9ea3d08d();
        }
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c49
// Size: 0x52, Type: bool
function function_21550b5260803f0b( player )
{
    if ( player != self )
    {
        return false;
    }
    
    if ( istrue( player.isjuggernaut ) )
    {
        if ( issharedfuncdefined( "hud", "showErrorMessage" ) )
        {
            player [[ getsharedfunc( "hud", "showErrorMessage" ) ]]( "KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP" );
        }
        
        return false;
    }
    
    return true;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca4
// Size: 0x141
function function_43adb6908f665a51( var_6bec98cb2dcc2450, streakinfo )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    function_c87fe068955bfe05( var_6bec98cb2dcc2450 );
    function_484aa2a4c15a015c( var_6bec98cb2dcc2450 );
    var_6bec98cb2dcc2450 function_2eff4cd94c3243e8();
    function_fa22ff0405c3d06e( var_6bec98cb2dcc2450 );
    self playsound( "jup_kls_lrad_pickup" );
    saveweaponstates();
    endonnotify = "sentry_placement_failed";
    
    if ( issharedfuncdefined( "weapons", "watchForPlacementFireState" ) )
    {
        self thread [[ getsharedfunc( "weapons", "watchForPlacementFireState" ) ]]( streakinfo, endonnotify );
    }
    
    _giveweapon( streakinfo.bundle.deployweapon );
    _switchtoweapon( streakinfo.bundle.deployweapon );
    function_8703bc55951530be( 1 );
    marker = function_3c44a60f10088e51( streakinfo, 1, 0.25 );
    function_8703bc55951530be( 0 );
    
    if ( !isdefined( marker ) )
    {
        return 0;
    }
    
    function_75ba96a892796b34( marker, var_6bec98cb2dcc2450 );
    maxlifetime = getdvarfloat( @"hash_98efcf229168a436" );
    var_6bec98cb2dcc2450 thread function_47b5394a301d8c5( maxlifetime, @"hash_80d0084f17797030" );
    
    /#
        var_6bec98cb2dcc2450 thread function_1defeaf387d6e2a9( @"hash_80d0084f17797030" );
    #/
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ded
// Size: 0x7a
function function_484aa2a4c15a015c( var_6bec98cb2dcc2450 )
{
    linkedchildren = var_6bec98cb2dcc2450 getlinkedchildren();
    
    foreach ( child in linkedchildren )
    {
        if ( isdefined( child ) && child != var_6bec98cb2dcc2450.stuntrigger )
        {
            child unlink();
        }
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6f
// Size: 0x64
function function_fa22ff0405c3d06e( var_6bec98cb2dcc2450 )
{
    var_6bec98cb2dcc2450 hide();
    var_6bec98cb2dcc2450.colmodel unlink();
    var_6bec98cb2dcc2450.colmodel hide();
    var_6bec98cb2dcc2450.stuntrigger hide();
    var_6bec98cb2dcc2450.iscarried = 1;
    var_6bec98cb2dcc2450 notify( "isCarried" );
    var_6bec98cb2dcc2450 allow_emp( 0 );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1edb
// Size: 0xb1
function function_75ba96a892796b34( marker, var_6bec98cb2dcc2450 )
{
    function_cce8da1f44d40890( marker, var_6bec98cb2dcc2450 );
    var_6bec98cb2dcc2450.colmodel show();
    var_6bec98cb2dcc2450.colmodel.angles = var_6bec98cb2dcc2450.angles;
    var_6bec98cb2dcc2450.colmodel.origin = var_6bec98cb2dcc2450.origin;
    var_6bec98cb2dcc2450.colmodel linkto( var_6bec98cb2dcc2450 );
    var_6bec98cb2dcc2450.stuntrigger show();
    var_6bec98cb2dcc2450.iscarried = 0;
    var_6bec98cb2dcc2450 allow_emp( 1 );
    self notify( "lrad_placed" );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f94
// Size: 0x48
function function_c87fe068955bfe05( var_6bec98cb2dcc2450 )
{
    if ( isdefined( var_6bec98cb2dcc2450 ) && isdefined( var_6bec98cb2dcc2450.moving_platform ) )
    {
        var_6bec98cb2dcc2450.moving_platform = undefined;
        var_6bec98cb2dcc2450.moving_platform_offset = undefined;
        var_6bec98cb2dcc2450.moving_platform_angles_offset = undefined;
        var_6bec98cb2dcc2450 unlink();
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe4
// Size: 0x4d, Type: bool
function function_4444ec0cb29ca814( weaponref )
{
    bundle = level.streakglobals.streakbundles[ "lrad" ];
    return weaponref == bundle.spawnweapon || weaponref == bundle.deployweapon;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x203a
// Size: 0x76
function function_67a2561dc56ecc0b( data )
{
    attacker = data.attacker;
    
    if ( !isdefined( self.ishaywire ) || !istrue( self.ishaywire ) )
    {
        if ( istrue( scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, attacker ) ) )
        {
            self.ishaywire = 1;
            thread function_355f8536758cc7c7();
        }
    }
    
    self setscriptablepartstate( "haywire", "active", 0 );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20b8
// Size: 0x75
function function_a054c2c62f34ac14( data )
{
    attacker = data.attacker;
    
    if ( !isdefined( self.ishaywire ) || !istrue( self.ishaywire ) )
    {
        if ( istrue( scripts\cp_mp\utility\player_utility::playersareenemies( self.owner, attacker ) ) )
        {
            self.ishaywire = 1;
            function_6402ac006cab5c40();
        }
    }
    
    self setscriptablepartstate( "haywire", "active", 0 );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2135
// Size: 0x27
function function_5e06c811fe28148a( data )
{
    self.ishaywire = 0;
    self setscriptablepartstate( "haywire", "neutral", 0 );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2164
// Size: 0x2e
function function_43197d230c4d9635( data )
{
    self.ishaywire = 0;
    function_18633ad410bdfdfa();
    self setscriptablepartstate( "haywire", "neutral", 0 );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x219a
// Size: 0x9a
function function_355f8536758cc7c7()
{
    self endon( "death" );
    self.var_bd3a6d82c1789913 = 1;
    
    while ( self.ishaywire )
    {
        if ( istrue( self.var_bd3a6d82c1789913 ) )
        {
            self.var_bd3a6d82c1789913 = 0;
            function_6402ac006cab5c40();
            waittime = randomfloatrange( 0.75, 1.75 );
            wait waittime;
        }
        else
        {
            self.var_bd3a6d82c1789913 = 1;
            function_18633ad410bdfdfa();
            waittime = randomfloatrange( 0.15, 0.35 );
            wait waittime;
        }
        
        waitframe();
    }
    
    if ( !istrue( self.var_bd3a6d82c1789913 ) )
    {
        function_18633ad410bdfdfa();
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223c
// Size: 0xed
function function_e12969da21420075()
{
    trigger_length = getdvarint( @"hash_b4d9a80ce75c617" );
    trigger_radius = getdvarint( @"hash_b27192e0593d2245" );
    height_offset = getdvarint( @"hash_791416d97b1899ba" );
    self.stuntrigger = spawn( "trigger_rotatable_radius", self.origin, 0, trigger_radius, trigger_length );
    self.stuntrigger.angles = self.angles + ( 90, 0, 0 );
    self.stuntrigger.origin = self.origin + ( 0, 0, height_offset );
    self.stuntrigger.playersintrigger = [];
    self.stuntrigger enablelinkto();
    self.stuntrigger linkto( self );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2331
// Size: 0x1dc
function function_d2368d84391b6a68()
{
    self endon( "death" );
    self endon( "disconnected" );
    self endon( "beamStop" );
    
    while ( true )
    {
        self.stuntrigger waittill( "trigger" );
        entities_players = level.players;
        entities_ai = getaiarray();
        allentities = array_combine_unique( entities_players, entities_ai );
        var_f4fc390187305987 = self.stuntrigger getistouchingentities( allentities );
        self.owner.var_9717afbc6163113 = var_f4fc390187305987;
        
        foreach ( ent in var_f4fc390187305987 )
        {
            var_18d1eaac8a573748 = 0;
            
            /#
                debugactive = getdvarint( @"hash_80d0084f17797030" );
                
                if ( debugactive > 0 )
                {
                    iprintlnbold( ent.name + "<dev string:x7a>" );
                    var_18d1eaac8a573748 = getdvarint( @"hash_5f9bf6b2e15e5727" );
                }
            #/
            
            if ( function_f636f503f2312823( ent, var_18d1eaac8a573748 ) )
            {
                var_97db5d48f2509e02 = function_5dcb36314d1abe55( ent );
                
                if ( var_97db5d48f2509e02.size == 0 )
                {
                    stuntime = getdvarfloat( @"hash_2ef1444b14cdcc27" );
                    ent function_bb2a979de475a65( stuntime, self );
                    self.stuntrigger.playersintrigger[ ent getentitynumber() ] = ent;
                }
                else if ( function_7fbe85f0fd784b4c( var_97db5d48f2509e02 ) )
                {
                    stuntime = getdvarfloat( @"hash_4469252783a3ea7d" );
                    ent function_bb2a979de475a65( stuntime, self );
                }
            }
            
            waitframe();
        }
        
        var_d72b86407ed6514b = getdvarfloat( @"hash_1676fc44b285c55a" );
        wait var_d72b86407ed6514b;
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2515
// Size: 0xe2
function function_9c3226ae596454e6()
{
    self endon( "death" );
    self endon( "beamStop" );
    
    while ( true )
    {
        foreach ( id, player in self.stuntrigger.playersintrigger )
        {
            if ( !isdefined( player ) )
            {
                self.stuntrigger.playersintrigger[ id ] = undefined;
                continue;
            }
            
            if ( !player scripts\cp_mp\utility\player_utility::_isalive() )
            {
                self.stuntrigger.playersintrigger[ id ] = undefined;
                continue;
            }
            
            if ( player istouching( self.stuntrigger ) )
            {
                continue;
            }
            
            self.stuntrigger.playersintrigger[ player getentitynumber() ] = undefined;
            player function_56da58bd9ea3d08d();
        }
        
        waitframe();
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25ff
// Size: 0x85, Type: bool
function function_f636f503f2312823( ent, var_18d1eaac8a573748 )
{
    playercheck = 0;
    
    if ( isplayer( ent ) || isai( ent ) )
    {
        playercheck = 1;
    }
    
    return playercheck && isalive( ent ) && ( var_18d1eaac8a573748 || ent.team != self.owner.team ) && !istrue( self.iscarried ) && !istrue( self.issmoking );
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x268d
// Size: 0x155
function function_5dcb36314d1abe55( target )
{
    var_68e6f05a4ee24dee = physics_createcontents( [ "physicscontents_ainoshoot", "physicscontents_ainosight", "physicscontents_explosionclip", "physicscontents_vehicle" ] );
    raycaststart = self.origin + ( 0, 0, 50 );
    raycastend = target geteye();
    var_97db5d48f2509e02 = physics_raycast( raycaststart, raycastend, var_68e6f05a4ee24dee, undefined, 0, "physicsquery_all" );
    
    /#
        debugactive = getdvarint( @"hash_80d0084f17797030" );
        
        if ( debugactive > 0 )
        {
            duration = getdvarint( @"hash_356ad37ca5f6f115" );
            line( raycaststart, raycastend, ( 0, 0, 100 ), 1, 0, duration );
            drawcolor = ( 0, 255, 0 );
            
            foreach ( result in var_97db5d48f2509e02 )
            {
                sphere( result[ "<dev string:x8b>" ], 5, drawcolor, 0, duration );
            }
        }
    #/
    
    return var_97db5d48f2509e02;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27eb
// Size: 0x82
function function_7fbe85f0fd784b4c( var_97db5d48f2509e02 )
{
    var_c8af87991ff22645 = 1;
    
    foreach ( result in var_97db5d48f2509e02 )
    {
        if ( !isdefined( result[ "entity" ] ) || !isdefined( result[ "entity" ].vehiclemodel ) )
        {
            var_c8af87991ff22645 = 0;
            break;
        }
    }
    
    return var_c8af87991ff22645;
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2876
// Size: 0x213
function function_bb2a979de475a65( stuntime, var_ef9733a4a88c2f67 )
{
    if ( !player_hasperk( "specialty_stun_resistance" ) )
    {
        self.var_c4c1555acea960b5 = 1;
        
        if ( isai( self ) )
        {
            if ( !isdefined( self.subclass ) )
            {
                utility::setplayerstunned();
            }
            else if ( self.subclass == "zombie_base" )
            {
                if ( issharedfuncdefined( "zombie", "stunZombie" ) )
                {
                    self [[ getsharedfunc( "zombie", "stunZombie" ) ]]( 10000 );
                }
            }
            else
            {
                self notify( "flashbang", self.origin, 1, undefined, var_ef9733a4a88c2f67.owner, var_ef9733a4a88c2f67.owner.team, undefined );
            }
        }
        else
        {
            utility::setplayerstunned();
        }
        
        if ( issharedfuncdefined( "damage", "fx_stun_damage" ) )
        {
            self thread [[ getsharedfunc( "damage", "fx_stun_damage" ) ]]( self, var_ef9733a4a88c2f67.owner );
        }
        
        _shellshock( "lrad_mp", "gas", stuntime, 1 );
        
        if ( issharedfuncdefined( "sound", "CodcasterSetPlayerStatusEffect" ) )
        {
            self [[ getsharedfunc( "sound", "CodcasterSetPlayerStatusEffect" ) ]]( "stun", stuntime );
        }
        
        if ( issharedfuncdefined( "damage", "updateDamageFeedback" ) )
        {
            var_ef9733a4a88c2f67.owner [[ getsharedfunc( "damage", "updateDamageFeedback" ) ]]( "hitsoundveil" );
        }
        
        if ( getdvarint( @"hash_abec145fdf5e6352" ) == 1 )
        {
            if ( !isai( self ) )
            {
                if ( isplayer( self ) )
                {
                    utility::hidehudenable();
                }
            }
        }
    }
    
    /#
        debugactive = getdvarint( @"hash_80d0084f17797030" );
        
        if ( debugactive > 0 )
        {
            fullstuntime = getdvarfloat( @"hash_2ef1444b14cdcc27" );
            
            if ( stuntime == fullstuntime )
            {
                iprintlnbold( self.name + "<dev string:x94>" );
                return;
            }
            
            iprintlnbold( self.name + "<dev string:xab>" );
        }
    #/
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a91
// Size: 0xc5
function function_56da58bd9ea3d08d()
{
    if ( istrue( self.var_c4c1555acea960b5 ) )
    {
        self.var_c4c1555acea960b5 = undefined;
        
        if ( getdvarint( @"hash_abec145fdf5e6352" ) == 1 )
        {
            if ( !isai( self ) )
            {
                if ( isplayer( self ) )
                {
                    if ( isdefined( self.hidehudenabled ) && self.hidehudenabled > 0 )
                    {
                        utility::hidehuddisable();
                    }
                }
            }
        }
        
        if ( isai( self ) )
        {
            if ( !isdefined( self.subclass ) )
            {
                utility::setplayerstunned();
            }
            else if ( self.subclass == "zombie_base" )
            {
                if ( issharedfuncdefined( "zombie", "clearStunZombie" ) )
                {
                    self [[ getsharedfunc( "zombie", "clearStunZombie" ) ]]();
                }
            }
            
            return;
        }
        
        utility::setplayerstunned();
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b5e
// Size: 0x12e
function lrad_hack( newowner )
{
    self notify( "lrad_hacked" );
    self.owner = newowner;
    self.team = newowner.team;
    self.ownerid = newowner getxuid();
    self setentityowner( newowner );
    self setotherent( newowner );
    
    if ( level.teambased )
    {
        self filteroutplayermarks( newowner.team );
    }
    else
    {
        self filteroutplayermarks( newowner );
    }
    
    if ( issharedfuncdefined( "killstreak", "giveScoreForHack" ) )
    {
        newowner [[ getsharedfunc( "killstreak", "giveScoreForHack" ) ]]();
    }
    
    self.owner function_f74b0080a679742b( self );
    self.owner thread function_5189f677d1332852( self, self.streakinfo );
    function_2eff4cd94c3243e8();
    
    if ( issharedfuncdefined( "game", "createObjective" ) )
    {
        self.minimapid = self [[ getsharedfunc( "game", "createObjective" ) ]]( self.streakinfo.bundle.minimapicon, self.team, 1, 1, 1 );
    }
}

// Namespace lrad / scripts\killstreaks\lrad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c94
// Size: 0x8e
function function_5733afc81f25372c( data )
{
    if ( !isdefined( self.totaldamagetaken ) )
    {
        self.totaldamagetaken = 0;
    }
    
    modifieddamage = function_7bdb3610d602438d( data );
    self.totaldamagetaken += modifieddamage;
    
    if ( self.totaldamagetaken >= self.maxhealth * 0.5 )
    {
        self setscriptablepartstate( "damage", "on" );
        self notify( "lrad_dying" );
        self.useownerobj function_dfb78b3e724ad620( 0 );
    }
    
    return modifieddamage;
}

/#

    // Namespace lrad / scripts\killstreaks\lrad
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2d2b
    // Size: 0x174, Type: dev
    function function_1defeaf387d6e2a9( var_bb3f35f040f4f38b )
    {
        level endon( "<dev string:xc5>" );
        self endon( "<dev string:xd0>" );
        self.owner endon( "<dev string:xd6>" );
        self endon( "<dev string:xe3>" );
        debugactive = getdvarint( var_bb3f35f040f4f38b );
        
        while ( true )
        {
            if ( debugactive > 0 )
            {
                healthremaining = self.maxhealth - self.damagetaken;
                print3d( self.origin + ( 0, 0, 20 ), "<dev string:xed>" + healthremaining, ( 0, 1, 0 ), 1, 0.5, 1 );
                trigger_length = getdvarint( @"hash_b4d9a80ce75c617" );
                trigger_radius = getdvarint( @"hash_b27192e0593d2245" );
                lifetime = getdvarint( @"hash_98efcf229168a436" );
                duration = 100;
                startpoint = self.stuntrigger.origin;
                endpoint = self.stuntrigger.origin + anglestoup( self.stuntrigger.angles ) * trigger_length;
                cylinder( startpoint, endpoint, trigger_radius, ( 0, 1, 0 ), 0, duration );
            }
            
            waitframe();
        }
    }

#/
