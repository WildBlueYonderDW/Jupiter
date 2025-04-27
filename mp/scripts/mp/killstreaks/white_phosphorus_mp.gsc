#using scripts\common\utility;
#using scripts\cp_mp\killstreaks\white_phosphorus;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\hud_util;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\killstreaks\mapselect;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\print;
#using scripts\mp\utility\script;
#using scripts\mp\utility\weapon;

#namespace white_phosphorus_mp;

// Namespace white_phosphorus_mp / scripts\mp\killstreaks\white_phosphorus_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b
// Size: 0x3f
function init()
{
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "white_phosphorus", &scripts\cp_mp\killstreaks\white_phosphorus::tryusewpfromstruct );
    scripts\engine\utility::registersharedfunc( "white_phosphorus", "startMapSelectSequence", &white_phosphorus_startmapselectsequence );
    scripts\engine\utility::registersharedfunc( "white_phosphorus", "getSelectMapPoint", &white_phosphorus_getmapselectpoint );
}

// Namespace white_phosphorus_mp / scripts\mp\killstreaks\white_phosphorus_mp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x192
// Size: 0x41
function white_phosphorus_startmapselectsequence( navmesh, directionalselection, directionaltype, selectortype )
{
    assertex( isplayer( self ), "<dev string:x1c>" );
    scripts\mp\killstreaks\mapselect::function_90f093ca8576232f( navmesh, directionalselection, directionaltype );
}

// Namespace white_phosphorus_mp / scripts\mp\killstreaks\white_phosphorus_mp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1db
// Size: 0x38
function white_phosphorus_getmapselectpoint( streakinfo, selectnum, directionalselection )
{
    assertex( isplayer( self ), "<dev string:x1c>" );
    return scripts\mp\killstreaks\mapselect::function_a5839924b6723eac( streakinfo, selectnum, directionalselection );
}

