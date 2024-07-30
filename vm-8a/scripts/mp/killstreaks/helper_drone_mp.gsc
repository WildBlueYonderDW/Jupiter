#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using script_41297c155fdee34;
#using script_295b6cc01b40780c;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;

#namespace helper_drone_mp;

// Namespace helper_drone_mp / scripts\mp\killstreaks\helper_drone_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115
// Size: 0x54
function helper_drone_init() {
    namespace_9bdcf9f3e8428ce0::recondrone_init();
    namespace_7b540f1008fe7830::function_c260cd16a5c5a2d9();
    scripts\mp\killstreaks\killstreaks::registerkillstreak("radar_drone_overwatch", &tryusehelperdronefromstruct);
    scripts\mp\killstreaks\killstreaks::registerkillstreak("scrambler_drone_guard", &tryusehelperdronefromstruct);
    scripts\mp\utility\join_team_aggregator::registeronplayerjointeamcallback(&helperdrone_updateheadicononjointeam);
    scripts\engine\utility::registersharedfunc("helper_drone", "attachXRays", &function_3e5187005523c45c);
}

// Namespace helper_drone_mp / scripts\mp\killstreaks\helper_drone_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171
// Size: 0xb
function helperdrone_updateheadicononjointeam(player) {
    
}

// Namespace helper_drone_mp / scripts\mp\killstreaks\helper_drone_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184
// Size: 0x20
function function_3e5187005523c45c(helperdrone) {
    helperdrone function_5226227bce83ebe9(3, helperdrone.team);
    return helperdrone;
}

