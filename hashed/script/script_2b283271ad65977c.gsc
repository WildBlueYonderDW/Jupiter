#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\vehicles\damage_cp.gsc;

#namespace namespace_1de17bdc0b2b9cb9;

// Namespace namespace_1de17bdc0b2b9cb9 / namespace_2ad4bf452456e988
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf1
// Size: 0x8f
function init() {
    scripts\engine\utility::registersharedfunc("hover_jet", "set_vehicle_hit_damage_data", &function_c414d20013783e62);
    scripts\engine\utility::registersharedfunc("hover_jet", "registerSentient", &function_c8ababcac24ad291);
    setdvarifuninitialized(@"hash_66bec5bd52437caf", 60);
    var_e19789ea16c33355 = spawnstruct();
    var_e19789ea16c33355.var_f6f44ae79c7eb44d = "hover_jet_achieve";
    var_e19789ea16c33355.var_cc5128455e1a40d4 = "hover_jet";
    var_e19789ea16c33355.var_6e25c01b88fc2f76 = "hover_jet";
    scripts\cp\utility::function_73ae764f6d95e017("hover_jet", var_e19789ea16c33355);
}

// Namespace namespace_1de17bdc0b2b9cb9 / namespace_2ad4bf452456e988
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x188
// Size: 0x1c
function function_c414d20013783e62(ref, hitstokill) {
    scripts\cp\vehicles\damage_cp::set_vehicle_hit_damage_data(ref, hitstokill);
}

// Namespace namespace_1de17bdc0b2b9cb9 / namespace_2ad4bf452456e988
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac
// Size: 0x2d
function function_c8ababcac24ad291(threatbiasgroup, var_5c00772332ce642c) {
    scripts\cp\utility::make_entity_sentient_cp(var_5c00772332ce642c.team);
    self setthreatbiasgroup(threatbiasgroup);
}

