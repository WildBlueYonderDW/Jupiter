#using script_64acb6ce534155b7;
#using scripts\common\utility;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\dialog_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\killstreaks\killstreaks;

#namespace circle_peek;

// Namespace circle_peek / scripts\mp\killstreaks\circle_peek
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf
// Size: 0x27
function init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "circle_peek", &function_b1e60c0ec801b93b, undefined );
    game[ "dialog" ][ "use_circle_peek" ] = "4sit_grav_klls";
}

// Namespace circle_peek / scripts\mp\killstreaks\circle_peek
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe
// Size: 0xd, Type: bool
function weapongivenchoppergunner( streakinfo )
{
    return true;
}

// Namespace circle_peek / scripts\mp\killstreaks\circle_peek
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x214
// Size: 0x21
function function_36d2eb075443f6ca()
{
    streakinfo = createstreakinfo( "circle_peek", self );
    return function_b1e60c0ec801b93b( streakinfo );
}

// Namespace circle_peek / scripts\mp\killstreaks\circle_peek
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23e
// Size: 0x31
function function_7023d0a9e3e7c419()
{
    streakinfo = createstreakinfo( "circle_peek", self );
    streakinfo.skipequippedstreakcheck = 1;
    return function_b1e60c0ec801b93b( streakinfo, 1 );
}

// Namespace circle_peek / scripts\mp\killstreaks\circle_peek
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x278
// Size: 0x141
function function_b1e60c0ec801b93b( streakinfo, directuse )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    
    if ( isdefined( level.killstreaktriggeredfunc ) )
    {
        if ( !level [[ level.killstreaktriggeredfunc ]]( streakinfo ) )
        {
            return 0;
        }
    }
    
    if ( !istrue( directuse ) )
    {
        deployweaponobj = makeweapon( "ks_gesture_phone_mp" );
        deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dogesturedeploy( streakinfo, deployweaponobj );
        
        if ( !istrue( deployresult ) )
        {
            return 0;
        }
    }
    
    if ( isdefined( level.killstreakbeginusefunc ) )
    {
        if ( !level [[ level.killstreakbeginusefunc ]]( streakinfo ) )
        {
            return 0;
        }
    }
    
    result = function_f93df988a9f72f5c( streakinfo );
    
    if ( !istrue( result ) )
    {
        return result;
    }
    
    if ( issharedfuncdefined( "killstreak", "logKillstreakEvent" ) )
    {
        self [[ getsharedfunc( "killstreak", "logKillstreakEvent" ) ]]( streakinfo.streakname, self.origin );
    }
    
    if ( issharedfuncdefined( "hud", "teamPlayerCardSplash" ) )
    {
        self thread [[ getsharedfunc( "hud", "teamPlayerCardSplash" ) ]]( "used_" + streakinfo.streakname, self );
    }
    
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam( "use_circle_peek", self.team, 0, undefined, undefined, "dx_br_brdm_" );
    return 1;
}

// Namespace circle_peek / scripts\mp\killstreaks\circle_peek
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c2
// Size: 0xed, Type: bool
function function_f93df988a9f72f5c( streakinfo )
{
    if ( !isdefined( level.teamswithcirclepeek ) )
    {
        /#
            self iprintlnbold( "<dev string:x1c>" );
        #/
        
        return false;
    }
    
    if ( !isdefined( level.br_circle.circleindex ) )
    {
        /#
            self iprintlnbold( "<dev string:x63>" );
        #/
        
        return false;
    }
    
    if ( !isdefined( level.teamswithcirclepeek[ self.team ] ) )
    {
        level.teamswithcirclepeek[ self.team ] = 0;
    }
    
    var_2c18d9be706d7ad7 = level.teamswithcirclepeek[ self.team ] + level.br_circle.circleindex + 1;
    thread function_f062c14846f2807b();
    
    for (i = var_2c18d9be706d7ad7; i < level.circlepeeks.size; i++) {
        namespace_1eb3c4e0e28fac71::questrewardcirclepeek( self.team );
    }
    
    return true;
}

// Namespace circle_peek / scripts\mp\killstreaks\circle_peek
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8
// Size: 0x23
function function_f062c14846f2807b()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    wait 0.45;
    setomnvar( "ui_minimap_pulse", 2 );
}

