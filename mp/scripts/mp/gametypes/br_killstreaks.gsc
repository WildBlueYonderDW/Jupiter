#using scripts\common\utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\hud_util;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\utility\game;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\player;
#using scripts\mp\utility\weapon;

#namespace br_killstreaks;

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 0
// Checksum 0x0, Offset: 0x302
// Size: 0x1b
function init()
{
    level.var_6e488f8ea3d98872 = getdvarint( @"hash_b59ab75a606e3255", 1 );
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 0
// Checksum 0x0, Offset: 0x325
// Size: 0xd, Type: bool
function playercanpickupkillstreak()
{
    return !isdefined( self.brkillstreak );
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 1
// Checksum 0x0, Offset: 0x33b
// Size: 0x58
function takekillstreakpickup( pickupent )
{
    gamestring = level.br_pickups.br_equipname[ pickupent.scriptablename ];
    self.brkillstreak = gamestring;
    playerkillstreakhud( gamestring );
    playergivetriggerweapon();
    thread playerhandlekillstreak( gamestring );
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 1
// Checksum 0x0, Offset: 0x39b
// Size: 0xe2
function playerkillstreakhud( streakname )
{
    self.brkillstreakhudlabel = scripts\mp\hud_util::createfontstring( "default", 0.75 );
    self.brkillstreakhudlabel scripts\mp\hud_util::setpoint( "CENTER", "BOTTOM LEFT", 270, -70 );
    self.brkillstreakhudlabel.label = %MP/BR_ACTIVATE_KILLSTREAK;
    bundle = level.streakglobals.streakbundles[ streakname ];
    icon = ter_op( isdefined( bundle ) && isdefined( bundle.hudicon ), bundle.var_80437c37a4e0aa29, "" );
    self.brkillstreakhudicon = scripts\mp\hud_util::createicon( icon, 30, 30 );
    self.brkillstreakhudicon scripts\mp\hud_util::setpoint( "CENTER", "BOTTOM LEFT", 270, -45 );
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 0
// Checksum 0x0, Offset: 0x485
// Size: 0x28
function playergivetriggerweapon()
{
    self giveweapon( "super_default_mp" );
    self setweaponammoclip( "super_default_mp", 1 );
    self assignweaponoffhandspecial( "super_default_mp" );
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 1
// Checksum 0x0, Offset: 0x4b5
// Size: 0x62
function playerhandlekillstreak( gamestring )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    
    while ( true )
    {
        self waittill( "special_weapon_fired", objweapon );
        result = playertriggerkillstreak();
        
        if ( result )
        {
            playerremovekillstreak();
            return;
        }
        
        self setweaponammoclip( "super_default_mp", 1 );
    }
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 0
// Checksum 0x0, Offset: 0x51f
// Size: 0x3b, Type: bool
function playertriggerkillstreak()
{
    if ( !isalive( self ) )
    {
        return false;
    }
    
    struct = scripts\mp\killstreaks\killstreaks::createstreakitemstruct( self.brkillstreak );
    result = scripts\mp\killstreaks\killstreaks::triggerkillstreak( struct );
    return istrue( result );
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 0
// Checksum 0x0, Offset: 0x563
// Size: 0x50
function playerremovekillstreak()
{
    self takeweapon( "super_default_mp" );
    self.brkillstreak = undefined;
    
    if ( isdefined( self.brkillstreakhudlabel ) )
    {
        self.brkillstreakhudlabel destroy();
    }
    
    if ( isdefined( self.brkillstreakhudicon ) )
    {
        self.brkillstreakhudicon destroy();
    }
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 3
// Checksum 0x0, Offset: 0x5bb
// Size: 0x7a
function function_90e0f83e97306bff( players, notifytype, timeoutoverride )
{
    if ( !isarray( players ) )
    {
        players = [ players ];
    }
    
    foreach ( player in players )
    {
        dangernotifyplayer( player, notifytype, timeoutoverride );
    }
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 4
// Checksum 0x0, Offset: 0x63d
// Size: 0x1b4
function dangernotifyplayer( player, notifytype, timeoutoverride, isfriendlyplayer )
{
    notifynumber = 0;
    
    switch ( notifytype )
    {
        case #"hash_b4ac3581c343a029":
            notifynumber = 1;
            break;
        case #"hash_8c766d6477287bb6":
            notifynumber = 2;
            break;
        case #"hash_256bff2a9cc092c8":
            notifynumber = 3;
            break;
        case #"hash_6f819beef2080ba9":
            notifynumber = 4;
            break;
        case #"hash_13b68af513c903e8":
            notifynumber = 5;
            break;
        case #"hash_80c5f88142053bf4":
            notifynumber = 6;
            break;
        case #"hash_72237571b4515421":
            notifynumber = 7;
            break;
        case #"hash_6cf2279b8aabef9f":
            notifynumber = 8;
            break;
        case #"hash_e71cf650b470aa20":
            notifynumber = 9;
            break;
        case #"hash_422614db7b615a5b":
            notifynumber = 10;
            break;
        case #"hash_eaa69e667c221114":
            notifynumber = 11;
            break;
        case #"hash_e5ede0f09328ea53":
            notifynumber = 12;
            break;
        case #"hash_ca1da21e366e13f":
        case #"hash_634b246c3da5c56f":
        case #"hash_e171e5b86ef0a4cc":
            notifynumber = 13;
            break;
        default:
            break;
    }
    
    if ( notifynumber == 12 )
    {
        dialogalias = "uav_use_enemy_br";
        
        if ( istrue( isfriendlyplayer ) )
        {
            dialogalias = "uav_use_friendly_br";
        }
        
        level thread scripts\mp\gametypes\br_public::brleaderdialogplayer( dialogalias, player, 1, 0, 2 );
    }
    else
    {
        scripts\cp_mp\utility\killstreak_utility::function_7585eeda84603d89( player, notifytype );
    }
    
    if ( notifynumber > 0 )
    {
        player setclientomnvar( "ui_br_danger_warning", notifynumber );
        dangernotifyresetforplayer( player, timeoutoverride );
    }
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 2
// Checksum 0x0, Offset: 0x7f9
// Size: 0x55
function dangernotifyresetforplayer( player, timeoutoverride )
{
    playerid = player getxuid();
    
    if ( !isdefined( timeoutoverride ) )
    {
        timeoutoverride = 4;
    }
    
    level notify( "danger_notify_start_" + playerid );
    level thread watchdangerresetaction( player, playerid, "death_or_disconnect" );
    level thread watchdangerresetaction( player, playerid, undefined, timeoutoverride );
}

// Namespace br_killstreaks / scripts\mp\gametypes\br_killstreaks
// Params 4
// Checksum 0x0, Offset: 0x856
// Size: 0x6b
function watchdangerresetaction( player, playerid, action, timeout )
{
    level endon( "danger_notify_start_" + playerid );
    level endon( "danger_notify_finished_" + playerid );
    level endon( "game_ended" );
    
    if ( isdefined( action ) )
    {
        player waittill( action );
    }
    else if ( isdefined( timeout ) )
    {
        wait timeout;
    }
    
    if ( isdefined( player ) )
    {
        player setclientomnvar( "ui_br_danger_warning", 0 );
    }
    
    level notify( "danger_notify_finished_" + playerid );
}

