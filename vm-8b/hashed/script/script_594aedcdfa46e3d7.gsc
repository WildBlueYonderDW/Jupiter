#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_509a782dd5b89cf1;

#namespace namespace_4661781de8850ae4;

// Namespace namespace_4661781de8850ae4 / namespace_9e7b04da80a97ce9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd
// Size: 0x13
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("uav_bigmap", &namespace_2c99f682179581bf::function_e5931b9f76ed6cda);
}

