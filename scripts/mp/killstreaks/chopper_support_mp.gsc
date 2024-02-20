// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using scripts\mp\vehicles\damage.gsc;

#namespace namespace_c6b936bb0fc5d54;

// Namespace namespace_c6b936bb0fc5d54/namespace_a199bd32d5c14b0b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c
// Size: 0x2a
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("chopper_support", &namespace_343543689c1d8859::tryusechoppersupportfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("chopper_support", "set_vehicle_hit_damage_data", &chopper_support_set_vehicle_hit_damage_data);
}

// Namespace namespace_c6b936bb0fc5d54/namespace_a199bd32d5c14b0b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d
// Size: 0x1d
function chopper_support_set_vehicle_hit_damage_data(ref, hitstokill) {
    namespace_ad22b9cf6a2b30d::set_vehicle_hit_damage_data(ref, hitstokill);
}

