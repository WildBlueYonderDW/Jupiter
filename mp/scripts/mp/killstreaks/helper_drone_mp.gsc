#using scripts\common\utility;
#using scripts\cp_mp\killstreaks\helper_drone;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\killstreaks\assault_drone_mp;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\killstreaks\recon_drone_mp;
#using scripts\mp\utility\game;
#using scripts\mp\utility\join_team_aggregator;

#namespace helper_drone_mp;

// Namespace helper_drone_mp / scripts\mp\killstreaks\helper_drone_mp
// Params 0
// Checksum 0x0, Offset: 0x141
// Size: 0x54
function helper_drone_init()
{
    scripts\mp\killstreaks\recon_drone_mp::recondrone_init();
    scripts\mp\killstreaks\assault_drone_mp::function_c260cd16a5c5a2d9();
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "radar_drone_overwatch", &tryusehelperdronefromstruct );
    scripts\mp\killstreaks\killstreaks::registerkillstreak( "scrambler_drone_guard", &tryusehelperdronefromstruct );
    scripts\mp\utility\join_team_aggregator::registeronplayerjointeamcallback( &helperdrone_updateheadicononjointeam );
    scripts\engine\utility::registersharedfunc( "helper_drone", "attachXRays", &function_3e5187005523c45c );
}

// Namespace helper_drone_mp / scripts\mp\killstreaks\helper_drone_mp
// Params 1
// Checksum 0x0, Offset: 0x19d
// Size: 0xb
function helperdrone_updateheadicononjointeam( player )
{
    
}

// Namespace helper_drone_mp / scripts\mp\killstreaks\helper_drone_mp
// Params 1
// Checksum 0x0, Offset: 0x1b0
// Size: 0x20
function function_3e5187005523c45c( helperdrone )
{
    helperdrone function_5226227bce83ebe9( 3, helperdrone.team );
    return helperdrone;
}

