// mwiii decomp prototype
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

#namespace namespace_c3bdbc6bfbfa4d94;

// Namespace namespace_c3bdbc6bfbfa4d94/namespace_220ed8fa6c43602d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115
// Size: 0x55
function helper_drone_init() {
    namespace_9bdcf9f3e8428ce0::function_98a4e2a877ef7bb1();
    namespace_7b540f1008fe7830::function_c260cd16a5c5a2d9();
    namespace_58a74e7d54b56e8d::registerkillstreak("radar_drone_overwatch", &tryusehelperdronefromstruct);
    namespace_58a74e7d54b56e8d::registerkillstreak("scrambler_drone_guard", &tryusehelperdronefromstruct);
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&helperdrone_updateheadicononjointeam);
    namespace_3c37cb17ade254d::registersharedfunc("helper_drone", "attachXRays", &function_3e5187005523c45c);
}

// Namespace namespace_c3bdbc6bfbfa4d94/namespace_220ed8fa6c43602d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171
// Size: 0xc
function helperdrone_updateheadicononjointeam(player) {
    
}

// Namespace namespace_c3bdbc6bfbfa4d94/namespace_220ed8fa6c43602d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184
// Size: 0x21
function function_3e5187005523c45c(helperdrone) {
    helperdrone function_5226227bce83ebe9(3, helperdrone.team);
    return helperdrone;
}

