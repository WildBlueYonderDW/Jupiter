#using script_cbb0697de4c5728;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace player_utility;

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50c
// Size: 0x8e
function getstancecenter()
{
    if ( self getstance() == "crouch" )
    {
        center = self.origin + 0.5 * ( 0, 0, 48 );
    }
    else if ( self getstance() == "prone" )
    {
        center = self.origin + 0.5 * ( 0, 0, 20 );
    }
    else
    {
        center = self.origin + 0.5 * ( 0, 0, 64 );
    }
    
    return center;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a3
// Size: 0x93
function getstancetop( stanceoverride )
{
    curstance = self getstance();
    
    if ( isdefined( stanceoverride ) )
    {
        curstance = stanceoverride;
    }
    
    if ( curstance == "crouch" )
    {
        top = self.origin + ( 0, 0, 48 );
    }
    else if ( curstance == "prone" )
    {
        top = self.origin + ( 0, 0, 20 );
    }
    else
    {
        top = self.origin + ( 0, 0, 64 );
    }
    
    return top;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x63f
// Size: 0x32, Type: bool
function _isalive()
{
    return isalive( self ) && !isdefined( self.fauxdead ) && !istrue( self.delayedspawnedplayernotify ) && !istrue( self.liveragdoll );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67a
// Size: 0x32
function setusingremote( remotename )
{
    if ( issharedfuncdefined( "player", "setUsingRemote" ) )
    {
        [[ getsharedfunc( "player", "setUsingRemote" ) ]]( remotename );
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b4
// Size: 0x32
function clearusingremote( var_2c111f02d48e2671 )
{
    if ( issharedfuncdefined( "player", "clearUsingRemote" ) )
    {
        [[ getsharedfunc( "player", "clearUsingRemote" ) ]]( var_2c111f02d48e2671 );
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ee
// Size: 0x4f
function function_1e4a0e61fdb00e32( player )
{
    if ( issharedfuncdefined( "player", "isOOB" ) )
    {
        return [[ getsharedfunc( "player", "isOOB" ) ]]( player );
    }
    
    return isdefined( player.oob ) && player.oob > 0;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x746
// Size: 0x85
function isenemy( other )
{
    if ( level.teambased )
    {
        if ( isdefined( other.team ) && isdefined( self.team ) )
        {
            return ( other.team != self.team );
        }
        else
        {
            assertmsg( "<dev string:x1c>" );
            return 1;
        }
        
        return;
    }
    
    if ( isdefined( other.owner ) )
    {
        return ( other.owner != self );
    }
    
    return other != self;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d3
// Size: 0x61, Type: bool
function isinvehicle( includetransitions )
{
    if ( isdefined( self.vehicle ) && isdefined( self.vehicle.vehiclename ) )
    {
        return true;
    }
    
    if ( istrue( includetransitions ) )
    {
        if ( isdefined( self.vehiclereserved ) && isdefined( self.vehiclereserved.vehiclename ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x83d
// Size: 0x31
function getvehicle( var_3fcd58f5bae3bd0 )
{
    if ( isinvehicle() )
    {
        return self.vehicle;
    }
    else if ( istrue( var_3fcd58f5bae3bd0 ) )
    {
        return self.externalvehicle;
    }
    
    return undefined;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x877
// Size: 0x3c, Type: bool
function function_f8789f15330de751( player )
{
    if ( !isdefined( player ) || isbot( player ) || isagent( player ) )
    {
        return false;
    }
    
    return istrue( player isinvehicle( 1 ) ) || isdefined( player getmovingplatformparent() );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8bc
// Size: 0x10b
function getteamarray( team, var_dcc07fcc8a9beb59 )
{
    teamarray = [];
    
    if ( !isdefined( var_dcc07fcc8a9beb59 ) || var_dcc07fcc8a9beb59 )
    {
        foreach ( player in level.characters )
        {
            if ( isdefined( player.team ) && player.team == team )
            {
                teamarray[ teamarray.size ] = player;
            }
        }
    }
    else
    {
        foreach ( player in level.players )
        {
            if ( isdefined( player.team ) && player.team == team )
            {
                teamarray[ teamarray.size ] = player;
            }
        }
    }
    
    return teamarray;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9d0
// Size: 0x44
function _freezecontrols( frozen, force, debug )
{
    if ( issharedfuncdefined( "player", "freezeControls" ) )
    {
        return [[ getsharedfunc( "player", "freezeControls" ) ]]( frozen, force, debug );
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1c
// Size: 0x28
function function_8213d31f7a3c32e2()
{
    if ( issharedfuncdefined( "player", "freezeControlsDebug" ) )
    {
        return [[ getsharedfunc( "player", "freezeControlsDebug" ) ]]();
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa4c
// Size: 0x3b
function _freezelookcontrols( frozen, force )
{
    if ( issharedfuncdefined( "player", "freezeLookControls" ) )
    {
        return [[ getsharedfunc( "player", "freezeLookControls" ) ]]( frozen, force );
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8f
// Size: 0x1b
function function_82f44f5f304ba91a( enabled )
{
    function_f2c3ee9fded6a3df( enabled );
    function_cb6c6cd4245c5551( enabled );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab2
// Size: 0x2f
function function_f2c3ee9fded6a3df( enabled )
{
    self allowmovement( !enabled );
    self allowprone( !enabled );
    self allowjump( !enabled );
    self allowmelee( !enabled );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae9
// Size: 0x1b
function function_cb6c6cd4245c5551( enabled )
{
    self freezecontrols( enabled );
    self freezelookcontrols( enabled );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb0c
// Size: 0x3f
function getplayersuperfaction( player )
{
    playersuperfaction = 0;
    
    if ( isdefined( player.operatorcustomization ) )
    {
        playersuperfaction = player.operatorcustomization.superfaction;
    }
    
    return playersuperfaction;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb54
// Size: 0x4c
function setthermalvision( bool, fstop, focusdistance )
{
    if ( istrue( bool ) )
    {
        self enablephysicaldepthoffieldscripting();
        self setphysicaldepthoffield( fstop, focusdistance, 20, 20 );
        self thermalvisionon();
        return;
    }
    
    self disablephysicaldepthoffieldscripting();
    self thermalvisionoff();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba8
// Size: 0x84
function watchthermalinputchange( inairvehicle )
{
    self notify( "watch_thermal_input_change" );
    self endon( "watch_thermal_input_change" );
    self endon( "disconnect" );
    
    while ( true )
    {
        var_ff8e235b01cd7409 = getthermalswitchplayercommand( inairvehicle );
        self notifyonplayercommand( "switch_thermal_mode", var_ff8e235b01cd7409 );
        returnednotif = waittill_any_return_no_endon_death_2( "input_type_changed", "thermal_handling_ended" );
        self notifyonplayercommandremove( "switch_thermal_mode", var_ff8e235b01cd7409 );
        
        if ( !isdefined( returnednotif ) || returnednotif == "thermal_handling_ended" )
        {
            break;
        }
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc34
// Size: 0xa
function stopwatchingthermalinputchange()
{
    self notify( "thermal_handling_ended" );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc46
// Size: 0x44
function updateinputtypewatcher()
{
    var_51ec07dc533464b5 = is_player_gamepad_enabled();
    
    if ( !isdefined( self.gamepadwasenabled ) || self.gamepadwasenabled != var_51ec07dc533464b5 )
    {
        self notify( "input_type_changed", var_51ec07dc533464b5 );
        self.gamepadwasenabled = var_51ec07dc533464b5;
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc92
// Size: 0x2a
function getthermalswitchplayercommand( inairvehicle )
{
    if ( is_player_gamepad_enabled() )
    {
        if ( istrue( inairvehicle ) )
        {
            return "+stance";
        }
        
        return "+gostand";
    }
    
    return "nightvision";
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc5
// Size: 0x3b
function enabledemeanorsafe()
{
    if ( !isdefined( self.demeanorsafeenabled ) )
    {
        self.demeanorsafeenabled = 0;
    }
    
    self.demeanorsafeenabled++;
    
    if ( self.demeanorsafeenabled == 1 )
    {
        forcedemeanorsafe( 1 );
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd08
// Size: 0x53
function disabledemeanorsafe()
{
    assertex( isdefined( self.demeanorsafeenabled ) && self.demeanorsafeenabled > 0, "<dev string:x5d>" );
    self.demeanorsafeenabled--;
    
    if ( self.demeanorsafeenabled == 0 )
    {
        self.demeanorsafeenabled = undefined;
        forcedemeanorsafe( 0 );
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd63
// Size: 0x49
function forcedemeanorsafe( bool )
{
    if ( bool && self getdemeanorviewmodel() != "safe" )
    {
        thread forcedemeanorsafeinteral( bool );
        return;
    }
    
    if ( !bool && self getdemeanorviewmodel() == "safe" )
    {
        thread forcedemeanorsafeinteral( bool );
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdb4
// Size: 0xb4
function forcedemeanorsafeinteral( bool )
{
    self endon( "death_or_disconnect" );
    self notify( "forceDemeanorSafeInteral" );
    self endon( "forceDemeanorSafeInteral" );
    wassprinting = self issprinting();
    
    if ( !istrue( self.demeanorsprintdisable ) )
    {
        val::set( "forceDemeanor", "sprint", 0 );
        self.demeanorsprintdisable = 1;
    }
    
    if ( wassprinting )
    {
        wait 0.5;
    }
    
    if ( bool )
    {
        self setdemeanorviewmodel( "safe", "iw8_ges_demeanor_safe" );
    }
    else
    {
        self setdemeanorviewmodel( "normal" );
    }
    
    wait 0.5;
    
    if ( istrue( self.demeanorsprintdisable ) )
    {
        val::reset_all( "forceDemeanor" );
        self.demeanorsprintdisable = undefined;
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe70
// Size: 0x16
function cleardemeanorsafe()
{
    self.demeanorsafeenabled = undefined;
    self.demeanorsprintdisable = undefined;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe8e
// Size: 0xe9
function playersareenemies( firstplayer, secondplayer, var_b2b9b3d299fbaeb1 )
{
    if ( !isdefined( firstplayer ) || !isdefined( secondplayer ) )
    {
        return 0;
    }
    
    if ( !isdefined( firstplayer.team ) || !isdefined( secondplayer.team ) )
    {
        return 0;
    }
    
    if ( level.teambased )
    {
        sameteam = firstplayer.team == secondplayer.team;
        
        if ( istrue( var_b2b9b3d299fbaeb1 ) )
        {
            var_a64bc29810299920 = 0;
            
            if ( isdefined( firstplayer.var_b5091efefe8e436b ) && isdefined( secondplayer.var_b5091efefe8e436b ) && firstplayer.var_b5091efefe8e436b != "none" )
            {
                var_a64bc29810299920 = firstplayer.var_b5091efefe8e436b == secondplayer.var_b5091efefe8e436b;
            }
            
            return ( !sameteam && !var_a64bc29810299920 );
        }
        
        return !sameteam;
    }
    
    return firstplayer != secondplayer;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7f
// Size: 0x1c
function getteamindex( teamname )
{
    return level.teamdata[ teamname ][ "index" ];
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa4
// Size: 0x8, Type: bool
function playerbloodrestricted()
{
    return utility::iswegameplatform();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb5
// Size: 0xc
function initdismembermentlist()
{
    level.playerswithoutdismemberment = [];
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc9
// Size: 0x35
function addtodismembermentlist()
{
    assertex( isdefined( level.playerswithoutdismemberment ), "<dev string:x9f>" );
    
    if ( !self isdismembermentenabledforplayer() )
    {
        level.playerswithoutdismemberment[ self getxuid() ] = self;
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1006
// Size: 0x2a
function removefromdismembermentlist()
{
    assertex( isdefined( level.playerswithoutdismemberment ), "<dev string:xde>" );
    level.playerswithoutdismemberment[ self getxuid() ] = undefined;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1038
// Size: 0xb
function getdismembermentlist()
{
    return level.playerswithoutdismemberment;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104c
// Size: 0x38
function _playerhidestack()
{
    if ( !isdefined( self.playerhidden ) )
    {
        self.playerhidden = 0;
    }
    
    if ( self.playerhidden == 0 )
    {
        function_a593971d75d82113();
    }
    
    self.playerhidden++;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108c
// Size: 0x2a
function function_a593971d75d82113( var_1fffb4c6d7b458a3 )
{
    namespace_46e942396566f2da::function_112e56b7dbe18137();
    
    if ( istrue( var_1fffb4c6d7b458a3 ) )
    {
        self playerhide( 1 );
        return;
    }
    
    self playerhide();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10be
// Size: 0x3d
function function_379bb555405c16bb( reason )
{
    if ( getdvarint( @"hash_b5fe5be1cf552f2e", 0 ) == 0 )
    {
        return;
    }
    
    logprint( "PlayerHide(): " + reason );
    println( "<dev string:x122>" + reason );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1103
// Size: 0x61
function _playershowstack()
{
    assertex( isdefined( self.playerhidden ) && self.playerhidden > 0, "<dev string:x134>" );
    
    if ( self.playerhidden == 1 )
    {
        function_6fb380927695ee76();
    }
    
    self.playerhidden--;
    
    if ( self.playerhidden == 0 )
    {
        self.playerhidden = undefined;
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116c
// Size: 0x2a
function function_6fb380927695ee76( var_1fffb4c6d7b458a3 )
{
    if ( istrue( var_1fffb4c6d7b458a3 ) )
    {
        self playershow( 1 );
    }
    else
    {
        self playershow();
    }
    
    namespace_46e942396566f2da::function_33637806fc5ac024();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119e
// Size: 0x3d
function function_985b0973f29da4f8( reason )
{
    if ( getdvarint( @"hash_11b8360f35c60d6f", 0 ) == 0 )
    {
        return;
    }
    
    logprint( "PlayerShow(): " + reason );
    println( "<dev string:x165>" + reason );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e3
// Size: 0x44
function function_c28310e3b33872cb()
{
    self.playerhidden = undefined;
    
    if ( !isdefined( level.var_61a823f67a0cb19f ) )
    {
        level.var_61a823f67a0cb19f = getdvarint( @"hash_e6a081201f8d6465", 0 );
    }
    
    if ( level.var_61a823f67a0cb19f )
    {
        self playershow();
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x122f
// Size: 0x41, Type: bool
function isreallyalive( player )
{
    return isalive( player ) && !isdefined( player.fauxdead ) && !istrue( player.delayedspawnedplayernotify ) && !istrue( player.liveragdoll );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1279
// Size: 0x38
function player_hasperk( perk )
{
    if ( issharedfuncdefined( "perk", "hasPerk" ) )
    {
        return self [[ getsharedfunc( "perk", "hasPerk" ) ]]( perk );
    }
    
    return 0;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b9
// Size: 0x41, Type: bool
function isfemale()
{
    return isdefined( self.operatorcustomization ) && isdefined( self.operatorcustomization.gender ) && self.operatorcustomization.gender == "female";
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1303
// Size: 0x12, Type: bool
function isswimmingunderwater()
{
    return self isswimming() && self isswimunderwater();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x131e
// Size: 0x12, Type: bool
function function_d474b372046544b0()
{
    return self isswimming() && !self isswimunderwater();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1339
// Size: 0x2c
function playplayerandnpcsounds( player, firstpersonsound, thirdpersonsound )
{
    player playlocalsound( firstpersonsound );
    player playsound( thirdpersonsound, player );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x136d
// Size: 0x103
function function_f7348e400b4a608d( player, motionasset, priority, forceon )
{
    if ( !isdefined( player ) || isbot( player ) || isagent( player ) )
    {
        return;
    }
    
    if ( !isdefined( player.var_82b2c97dad24de07 ) )
    {
        player.var_82b2c97dad24de07 = spawnstruct();
        player.var_82b2c97dad24de07.asset = motionasset;
        player.var_82b2c97dad24de07.priority = priority;
    }
    else if ( istrue( forceon ) || !isdefined( player.var_82b2c97dad24de07.priority ) || player.var_82b2c97dad24de07.priority <= priority )
    {
        player.var_82b2c97dad24de07.asset = motionasset;
        player.var_82b2c97dad24de07.priority = priority;
    }
    else
    {
        return;
    }
    
    player setcinematicmotionoverride( motionasset );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1478
// Size: 0x66
function function_56d83cde22535f96( player )
{
    if ( !isdefined( player ) || isbot( player ) || isagent( player ) )
    {
        return;
    }
    
    player clearcinematicmotionoverride();
    
    if ( isdefined( player.var_82b2c97dad24de07 ) )
    {
        player.var_82b2c97dad24de07.asset = undefined;
        player.var_82b2c97dad24de07.priority = undefined;
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14e6
// Size: 0xe3
function printspawnmessage( message )
{
    /#
        if ( getdvarint( @"hash_da3b86849f785e06", 0 ) == 1 )
        {
            println( "<dev string:x177>" + gettime() + "<dev string:x17d>" + self.name + "<dev string:x183>" + message );
            println( "<dev string:x189>" + self.sessionstate );
            println( "<dev string:x19c>" + self.origin );
            
            if ( isdefined( self.forcedspawncameraref ) )
            {
                println( "<dev string:x1b0>" + self.forcedspawncameraref );
            }
            
            if ( isdefined( self.spawncameraent ) )
            {
                println( "<dev string:x1d0>" + self.spawncameraent.origin );
                println( "<dev string:x1f1>" + self.spawncameraent.angles );
            }
        }
    #/
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15d1
// Size: 0x64
function function_7a8a04d15ad052d5()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "spawned" );
    
    if ( level.killcam )
    {
        while ( !isdefined( self.var_7c813e50ff75be27 ) )
        {
            waitframe();
        }
        
        if ( level.killcam && istrue( self.killcam ) )
        {
            waittill_any_3( "killcam_ended", "killcam_canceled", "abort_killcam" );
        }
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163d
// Size: 0x75
function function_fdff38028c016239()
{
    self endon( "disconnect" );
    assert( istrue( self.liveragdoll ) );
    cameraentity = function_6d606d81ea9ab50b( 0, 0 );
    self.var_7c813e50ff75be27 = undefined;
    wait getdvarfloat( @"hash_ac849f1ec300d19c", 1.75 );
    function_7a8a04d15ad052d5();
    self allowspectateteam( self.team, 1 );
    self cameraunlink();
    cameraentity delete();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16ba
// Size: 0xc4
function function_6d606d81ea9ab50b( var_81aa39b3e585cd66, var_d198b30dc157c5cd )
{
    if ( !isdefined( var_81aa39b3e585cd66 ) )
    {
        var_81aa39b3e585cd66 = 0;
    }
    
    cameradata = function_d93211a15c000cd( self, self.attacker, var_d198b30dc157c5cd );
    
    if ( !isdefined( cameradata ) )
    {
        return undefined;
    }
    
    cameraentity = spawn( "script_model", cameradata.origin );
    cameraentity setmodel( "tag_origin" );
    cameraentity.angles = cameradata.angles;
    cameraentity.data = cameradata;
    playermover = self getmovingplatformparent();
    
    if ( isdefined( playermover ) )
    {
        cameraentity linkto( playermover );
    }
    
    self allowspectateallteams( 0 );
    self cameralinkto( cameraentity, "tag_origin", 1, var_81aa39b3e585cd66 );
    return cameraentity;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1787
// Size: 0x278
function function_d93211a15c000cd( victim, attacker, var_d198b30dc157c5cd )
{
    assert( isdefined( victim ) && isent( victim ) );
    assert( isdefined( attacker ) && isent( attacker ) );
    deathpos = undefined;
    
    if ( isdefined( victim.origin ) )
    {
        deathpos = victim.origin;
    }
    else if ( isdefined( victim.lastdeathpos ) )
    {
        deathpos = victim.lastdeathpos;
    }
    
    if ( !isdefined( deathpos ) )
    {
        logstring( "Undefined deathPos for death ragdoll 3rd person camera." );
        return undefined;
    }
    
    if ( victim == attacker )
    {
        forwardvector = anglestoforward( victim.angles );
        forwardvector = vectornormalize2( forwardvector );
    }
    else
    {
        forwardvector = vectornormalize( deathpos - attacker.origin );
    }
    
    baseangles = generateaxisanglesfromforwardvector( forwardvector, ( 0, 0, 1 ) );
    cameraposition = deathpos + ( 0, 0, 12 );
    cameradistance = 200;
    stepangle = 30;
    maxsteps = 360 / stepangle;
    validpositions = [];
    
    for (i = 0; i < maxsteps; i++) {
        stepvector = anglestoforward( baseangles + ( 0, stepangle * i, 0 ) );
        startposition = deathpos + ( 0, 0, 12 );
        endposition = deathpos + stepvector * cameradistance + ( 0, 0, 150 );
        trace = scripts\engine\trace::sphere_trace( startposition, endposition, 2, [ victim, attacker ] );
        
        if ( isdefined( trace ) && trace[ "fraction" ] > 0.99 )
        {
            validpositions[ validpositions.size ] = trace[ "position" ];
            
            if ( !istrue( var_d198b30dc157c5cd ) )
            {
                break;
            }
        }
    }
    
    if ( validpositions.size > 0 )
    {
        cameraposition = validpositions[ 0 ];
    }
    
    victimdirection = vectornormalize( deathpos - cameraposition );
    cameradata = spawnstruct();
    cameradata.origin = cameraposition;
    cameradata.angles = vectortoangles( victimdirection );
    cameradata.distance = cameradistance;
    cameradata.validpositions = validpositions;
    return cameradata;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a08
// Size: 0x1da
function updatesessionstate( sessionstate, statusicon )
{
    assert( sessionstate == "<dev string:x212>" || sessionstate == "<dev string:x21d>" || sessionstate == "<dev string:x225>" || sessionstate == "<dev string:x232>" || sessionstate == "<dev string:x242>" );
    ui_session_state = sessionstate;
    
    if ( istrue( self.liveragdoll ) )
    {
        if ( self.sessionstate == "playing_but_spectating" && ( sessionstate == "dead" || sessionstate == "spectator" ) )
        {
            printspawnmessage( "player::updateSessionState() didn't not update because we are in liveRagdoll" );
            return;
        }
        
        if ( sessionstate == "playing_but_spectating" )
        {
            ui_session_state = "spectator";
            
            if ( getdvarint( @"hash_f47d7bfe207dc431", 1 ) == 0 )
            {
                thread function_fdff38028c016239();
            }
        }
    }
    
    switch ( sessionstate )
    {
        case #"hash_6e223a17d0eb5015":
        case #"hash_7135993aa112803d":
            statusicon = "";
            break;
        case #"hash_9430ae82e6671e2a":
        case #"hash_cf14c509efeb3c87":
            if ( istrue( level.var_286c2c7b34d03b04 ) )
            {
                statusicon = "";
            }
            else if ( istrue( level.numlifelimited ) )
            {
                if ( istrue( self.tagavailable ) )
                {
                    statusicon = "hud_status_dogtag";
                }
                else if ( istrue( self.revivetriggeravailable ) )
                {
                    if ( isdefined( self.statusicon ) && self.statusicon == "hud_status_revive_or" )
                    {
                        statusicon = "hud_status_revive_or";
                    }
                    else
                    {
                        statusicon = "hud_status_revive_wh";
                    }
                }
                else
                {
                    statusicon = "hud_status_dead";
                }
            }
            else
            {
                statusicon = "hud_status_dead";
            }
            
            break;
    }
    
    if ( !isdefined( statusicon ) )
    {
        statusicon = "";
    }
    
    self.sessionstate = sessionstate;
    self.statusicon = statusicon;
    self setclientomnvar( "ui_session_state", ui_session_state );
    printspawnmessage( "player::updateSessionState() " + sessionstate );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bea
// Size: 0x48
function clearkillcamstate()
{
    self.forcespectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.archiveusepotg = 0;
    self.psoffsettime = 0;
    self.spectatekillcam = 0;
    thread function_c5a5b36868d0a68e();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c3a
// Size: 0x5f
function private function_c5a5b36868d0a68e()
{
    self endon( "disconnect" );
    self notify( "reset_killcam_player" );
    self endon( "reset_killcam_player" );
    wait 0.05;
    restorepitch = 0;
    restoreroll = 0;
    var_7500ec3e41c123ab = self getplayerangles();
    restoreyaw = var_7500ec3e41c123ab[ 1 ];
    self setplayerangles( ( restorepitch, restoreyaw, restoreroll ) );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca1
// Size: 0x218
function getplayersinradius( origin, radius, desiredteam, excludeent )
{
    if ( radius <= 0 )
    {
        return [];
    }
    
    excludearray = undefined;
    
    if ( isdefined( excludeent ) )
    {
        if ( isarray( excludeent ) )
        {
            excludearray = excludeent;
        }
        else
        {
            excludearray = [ excludeent ];
        }
    }
    
    results = physics_querypoint( origin, radius, physics_createcontents( [ "physicscontents_characterproxy" ] ), excludearray, "physicsquery_all" );
    filteredresults = [];
    
    if ( !isdefined( desiredteam ) )
    {
        foreach ( result in results )
        {
            e = result[ "entity" ];
            
            if ( isplayer( e ) )
            {
                filteredresults[ filteredresults.size ] = e;
            }
        }
    }
    else
    {
        foreach ( result in results )
        {
            e = result[ "entity" ];
            
            if ( isplayer( e ) && isdefined( e.team ) && e.team == desiredteam )
            {
                filteredresults[ filteredresults.size ] = e;
            }
        }
    }
    
    /#
        if ( getdvarint( @"hash_500c5c1476d28421", 0 ) > 0 )
        {
            debugduration = 60;
            sphere( origin, radius, ( 1, 1, 1 ), 0, debugduration );
            
            foreach ( player in filteredresults )
            {
                sphere( player.origin, 10, ( 1, 0, 0 ), 1, debugduration );
            }
        }
    #/
    
    return filteredresults;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec2
// Size: 0xcc
function getplayerlookatpos( player, ignoreents, contentoverride )
{
    contents = scripts\engine\trace::create_default_contents();
    
    if ( isdefined( contentoverride ) )
    {
        if ( isarray( contentoverride ) )
        {
            contentoverride = physics_createcontents( contentoverride );
        }
        
        contents = contentoverride;
    }
    
    starttrace = player getvieworigin();
    
    if ( player getcamerathirdperson() )
    {
        starttrace = player getcamerathirdpersonorigin();
    }
    
    endtrace = starttrace + anglestoforward( player getplayerangles() ) * 20000;
    trace = scripts\engine\trace::ray_trace( starttrace, endtrace, ignoreents, contentoverride );
    endpos = undefined;
    
    if ( isdefined( trace[ "hittype" ] ) && trace[ "hittype" ] != "hittype_none" )
    {
        endpos = trace[ "position" ];
    }
    
    return endpos;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f97
// Size: 0x7c
function _visionsetnaked( visionset, time )
{
    foreach ( player in level.players )
    {
        if ( !isdefined( player ) )
        {
            continue;
        }
        
        if ( isai( player ) )
        {
            continue;
        }
        
        player visionsetnakedforplayer( visionset, time );
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x201c
// Size: 0x86
function waittillrecoveredhealth( time, interval )
{
    self endon( "death_or_disconnect" );
    fullhealthtime = 0;
    
    if ( !isdefined( interval ) )
    {
        interval = 0.05;
    }
    
    if ( !isdefined( time ) )
    {
        time = 0;
    }
    
    while ( true )
    {
        if ( self.health != self.maxhealth )
        {
            fullhealthtime = 0;
        }
        else
        {
            fullhealthtime += interval;
        }
        
        wait interval;
        
        if ( self.health == self.maxhealth && fullhealthtime >= time )
        {
            break;
        }
    }
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20ab
// Size: 0x3f
function hidehudenable()
{
    if ( !isdefined( self.ui_hudhidden ) )
    {
        self.hidehudenabled = 0;
    }
    
    if ( self.hidehudenabled == 0 )
    {
        self setclientomnvar( "ui_hide_hud", 1 );
    }
    
    self.hidehudenabled++;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20f2
// Size: 0x4f
function hidehuddisable()
{
    assert( isdefined( self.hidehudenabled ) && self.hidehudenabled > 0, "<dev string:x25c>" );
    
    if ( self.hidehudenabled == 1 )
    {
        self setclientomnvar( "ui_hide_hud", 0 );
    }
    
    self.hidehudenabled--;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2149
// Size: 0x19
function hidehudclear()
{
    self.hidehudenabled = undefined;
    self setclientomnvar( "ui_hide_hud", 0 );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x216a
// Size: 0x27, Type: bool
function function_b7869f6d9d4242e3( reviver )
{
    return istrue( reviver.revivingteammate ) && !istrue( reviver.var_383e041e3e341315 );
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x219a
// Size: 0x61, Type: bool
function isfriendly( var_da8cec9bce12f9cb, var_c4b81997f0120a97 )
{
    assertex( isdefined( var_c4b81997f0120a97 ), "<dev string:x28d>" );
    
    if ( !level.teambased )
    {
        return false;
    }
    
    if ( !isplayer( var_c4b81997f0120a97 ) && !isdefined( var_c4b81997f0120a97.team ) )
    {
        return false;
    }
    
    if ( var_da8cec9bce12f9cb != var_c4b81997f0120a97.team )
    {
        return false;
    }
    
    return true;
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2204
// Size: 0x8
function _jumpbuttonpressed()
{
    return self jumpbuttonpressed();
}

// Namespace player_utility / scripts\cp_mp\utility\player_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2215
// Size: 0x8
function function_1551f039785a297d()
{
    return self superbuttonpressed();
}

