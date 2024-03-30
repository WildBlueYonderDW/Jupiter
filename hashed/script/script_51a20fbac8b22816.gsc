// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_b6e69ac53e6ee66;

#namespace namespace_3e8331f0fc232cf1;

// Namespace namespace_3e8331f0fc232cf1 / namespace_cfea762da482df00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f
// Size: 0x2a
function init() {
    scripts/mp/killstreaks/killstreaks::registerkillstreak("auto_drone", &namespace_d02a28280306d1bc::function_987a0ab2646445e1);
    scripts/engine/utility::registersharedfunc("auto_drone", "attachXRays", &function_76db348491610f8a);
}

// Namespace namespace_3e8331f0fc232cf1 / namespace_cfea762da482df00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140
// Size: 0x21
function function_76db348491610f8a(autodrone) {
    autodrone function_5226227bce83ebe9(3, autodrone.team);
    return autodrone;
}

