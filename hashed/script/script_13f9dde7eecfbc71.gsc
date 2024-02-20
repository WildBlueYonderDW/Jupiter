// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_a613c1f6a562f40b;

// Namespace namespace_a613c1f6a562f40b/namespace_c0468fb70a78d525
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9
// Size: 0x3
function function_7c59b9d44aff939b() {
    
}

// Namespace namespace_a613c1f6a562f40b/namespace_c0468fb70a78d525
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3
// Size: 0x24
function function_d7b50d4592cd5421(equipmentref, var_cbb2b3d05e48bd27, variantid) {
    thread function_d985ced7c32c7258();
}

// Namespace namespace_a613c1f6a562f40b/namespace_c0468fb70a78d525
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e
// Size: 0x70
function function_d985ced7c32c7258() {
    self endon("death_or_disconnect");
    self endon("thermal_phone_taken");
    while (1) {
        objweapon = self waittill("grenade_pullback");
        if (isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "thermal_phone_mp") {
            if (isdefined(level.var_668566d171e33358)) {
                [[ level.var_668566d171e33358 ]](self);
            }
        }
    }
}

// Namespace namespace_a613c1f6a562f40b/namespace_c0468fb70a78d525
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185
// Size: 0x1c
function function_e49fa2736f79e04b(equipmentref, var_cbb2b3d05e48bd27) {
    self notify("thermal_phone_taken");
}

// Namespace namespace_a613c1f6a562f40b/namespace_c0468fb70a78d525
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8
// Size: 0x3a
function function_230403b8cf5ea1e8(grenade) {
    if (isdefined(grenade)) {
        grenade delete();
    }
    if (isdefined(level.var_5a712c9d76830012)) {
        [[ level.var_5a712c9d76830012 ]](self);
    }
    self notify("thermal_phone_finished");
}

