// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_7e994e91383c7ba;

#namespace namespace_6d86fa067dd1151d;

// Namespace namespace_6d86fa067dd1151d/namespace_cf330d307304e7fc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb
// Size: 0x2a
function function_f383491974a17b9a() {
    namespace_58a74e7d54b56e8d::registerkillstreak("airdrop_escort", &namespace_33ee5ceeb5f1d380::function_45378f51950e7d1f);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop_escort", "attachXRays", &function_1f3181d1053887e6);
}

// Namespace namespace_6d86fa067dd1151d/namespace_cf330d307304e7fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec
// Size: 0x21
function function_1f3181d1053887e6(escortheli) {
    escortheli function_5226227bce83ebe9(3, escortheli.team);
    return escortheli;
}

