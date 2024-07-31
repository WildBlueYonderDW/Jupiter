#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace assault_drone_mp;

// Namespace assault_drone_mp / namespace_7b540f1008fe7830
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe9
// Size: 0x13
function function_c260cd16a5c5a2d9() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("assault_drone", &tryusehelperdronefromstruct);
}

