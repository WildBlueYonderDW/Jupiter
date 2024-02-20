// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_5323b44ee395058;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_1eddec53abf6e24c;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\mp\sentientpoolmanager.gsc;

#namespace namespace_1e1e8fdc0b6e3977;

// Namespace namespace_1e1e8fdc0b6e3977/namespace_3f6c2ec2b6aeead8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f
// Size: 0x40
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("hover_jet", &namespace_e70862d8d2eb291c::tryusehoverjetfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("hover_jet", "set_vehicle_hit_damage_data", &function_c414d20013783e62);
    namespace_3c37cb17ade254d::registersharedfunc("hover_jet", "registerSentient", &function_c8ababcac24ad291);
}

// Namespace namespace_1e1e8fdc0b6e3977/namespace_3f6c2ec2b6aeead8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x1d
function function_c414d20013783e62(ref, hitstokill) {
    namespace_ad22b9cf6a2b30d::set_vehicle_hit_damage_data(ref, hitstokill);
}

// Namespace namespace_1e1e8fdc0b6e3977/namespace_3f6c2ec2b6aeead8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a
// Size: 0x1d
function function_c8ababcac24ad291(threatbiasgroup, var_5c00772332ce642c) {
    namespace_6d9917c3dc05dbe9::registersentient(threatbiasgroup, var_5c00772332ce642c);
}

