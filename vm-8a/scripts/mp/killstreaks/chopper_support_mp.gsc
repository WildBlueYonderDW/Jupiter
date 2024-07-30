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

// Namespace namespace_c6b936bb0fc5d54 / scripts\mp\killstreaks\chopper_support_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c
// Size: 0x29
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("chopper_support", &scripts\cp_mp\killstreaks\chopper_support::tryusechoppersupportfromstruct);
    scripts\engine\utility::registersharedfunc("chopper_support", "set_vehicle_hit_damage_data", &chopper_support_set_vehicle_hit_damage_data);
}

// Namespace namespace_c6b936bb0fc5d54 / scripts\mp\killstreaks\chopper_support_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d
// Size: 0x1c
function chopper_support_set_vehicle_hit_damage_data(ref, hitstokill) {
    scripts\mp\vehicles\damage::set_vehicle_hit_damage_data(ref, hitstokill);
}

