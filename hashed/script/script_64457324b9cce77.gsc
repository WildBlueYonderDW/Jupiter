// mwiii decomp prototype
#using script_7b2517368c79e5bc;
#using script_3e2f8cc477d57433;
#using script_443d99fe707f1d9f;
#using scripts\engine\utility.gsc;
#using script_6bffae1b97f70547;
#using script_64316dc775e91122;
#using script_2669878cf5a1b6bc;

#namespace namespace_77804604a7f8a031;

// Namespace namespace_77804604a7f8a031/namespace_959f36f069fc65b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca
// Size: 0x3e
function function_e365b9e0c732498c() {
    level.var_202c7fdc43f4a2cd = [];
    level.var_202c7fdc43f4a2cd[0] = "iw9_me_fists_mp";
    function_900f562c61c6a5d6("upgrade", &function_fcd7a671d2b8d5b7, &function_24d050ba31898496, &function_24d050ba31898496, &function_9f3d2876de4f5272);
}

// Namespace namespace_77804604a7f8a031/namespace_959f36f069fc65b1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20f
// Size: 0x37
function function_fcd7a671d2b8d5b7(itembundle, item, var_11648d9cb3869a36) {
    weapon = self getcurrentweapon();
    return function_450e4cf17da1bc5(weapon, itembundle, item, var_11648d9cb3869a36);
}

// Namespace namespace_77804604a7f8a031/namespace_959f36f069fc65b1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e
// Size: 0x3e9
function function_450e4cf17da1bc5(weapon, itembundle, item, var_11648d9cb3869a36) {
    var_5473a133b9d77893 = itembundle.subtype;
    if (var_5473a133b9d77893 == "ammomod") {
        if (isdefined(itembundle.var_509909a6c0371efa)) {
            if (namespace_dc2e59577d3a271f::function_6a22621172a35366(weapon) && !namespace_dc2e59577d3a271f::function_60ade27585bef67(weapon, itembundle.var_509909a6c0371efa)) {
                self playsoundtoplayer("uin_ob_ammomod_used_" + itembundle.var_509909a6c0371efa, self);
                namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(weapon, itembundle.var_509909a6c0371efa);
                if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
                    return (item.count - 1);
                }
            }
        }
    } else if (var_5473a133b9d77893 == "aethertool") {
        var_84bda2c733869e7c = itembundle.rarity;
        rarity = function_75e73212bbe447d9(weapon);
        var_2f76f51a9f8c5231 = 0;
        if (isint(rarity) && rarity < 4) {
            switch (var_84bda2c733869e7c) {
            case 1:
                if (rarity < 1) {
                    var_2f76f51a9f8c5231 = 1;
                }
                break;
            case 2:
                if (rarity < 2) {
                    var_2f76f51a9f8c5231 = 2;
                }
                break;
            case 3:
                if (rarity < 3) {
                    var_2f76f51a9f8c5231 = 3;
                }
                break;
            case 4:
                var_2f76f51a9f8c5231 = 4;
                break;
            }
        }
        if (var_2f76f51a9f8c5231 != 0) {
            self playsoundtoplayer("evt_aetherium_tool_use", self);
            function_3a0412b800f3331d(weapon, var_2f76f51a9f8c5231);
            return (item.count - 1);
        }
    } else if (var_5473a133b9d77893 == "aethercrystal") {
        if (namespace_a4ff02beedc1bce8::function_251fcd097206e347(weapon)) {
            var_91a6795b9c75d0e4 = namespace_a4ff02beedc1bce8::get_pap_level(weapon);
            var_84bda2c733869e7c = itembundle.rarity;
            if (isdefined(var_84bda2c733869e7c)) {
                switch (var_84bda2c733869e7c) {
                case 2:
                    if (var_91a6795b9c75d0e4 == 0) {
                        self playsoundtoplayer("evt_aetherium_crystal_use", self);
                        namespace_a4ff02beedc1bce8::pap_weapon(weapon, var_91a6795b9c75d0e4);
                        return (item.count - 1);
                    }
                    break;
                case 3:
                    if (var_91a6795b9c75d0e4 == 0 || var_91a6795b9c75d0e4 == 1) {
                        var_26a62bdd3e2cd19a = 0;
                        if (var_91a6795b9c75d0e4 == 0) {
                            var_26a62bdd3e2cd19a = 1;
                        }
                        var_91a6795b9c75d0e4 = 1;
                        self playsoundtoplayer("evt_aetherium_crystal_use", self);
                        namespace_a4ff02beedc1bce8::pap_weapon(weapon, var_91a6795b9c75d0e4, undefined, var_26a62bdd3e2cd19a);
                        return (item.count - 1);
                    }
                    break;
                case 4:
                    if (var_91a6795b9c75d0e4 != 3) {
                        var_26a62bdd3e2cd19a = 0;
                        if (var_91a6795b9c75d0e4 == 0) {
                            var_26a62bdd3e2cd19a = 1;
                        }
                        var_91a6795b9c75d0e4 = 2;
                        self playsoundtoplayer("evt_aetherium_crystal_use", self);
                        namespace_a4ff02beedc1bce8::pap_weapon(weapon, var_91a6795b9c75d0e4, undefined, var_26a62bdd3e2cd19a);
                        return (item.count - 1);
                    }
                    break;
                }
            }
        }
    } else if (var_5473a133b9d77893 == "golden_armor_plate") {
        if (issharedfuncdefined("ob_armor", "set_golden_armor")) {
            self function_c664a2459d6f3eaa("sndevent_classified_acquisition_used");
            self [[ getsharedfunc("ob_armor", "set_golden_armor") ]]();
            return (item.count - 1);
        }
    } else if (var_5473a133b9d77893 == "dog_whistle") {
        if (issharedfuncdefined("ob_dog_whistle", "spawn_hellhound_pet")) {
            self function_c664a2459d6f3eaa("sndevent_classified_acquisition_used");
            self [[ getsharedfunc("ob_dog_whistle", "spawn_hellhound_pet") ]]();
            return (item.count - 1);
        }
    } else if (var_5473a133b9d77893 == "golden_ammo") {
        if (issharedfuncdefined("ob_golden_ammo", "set_goldenAmmo")) {
            self function_c664a2459d6f3eaa("sndevent_classified_acquisition_used");
            self [[ getsharedfunc("ob_golden_ammo", "set_goldenAmmo") ]]();
            return (item.count - 1);
        }
    }
    if (!isdefined(item.count)) {
        item.count = 1;
    }
    return item.count;
}

// Namespace namespace_77804604a7f8a031/namespace_959f36f069fc65b1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f
// Size: 0x2c5
function function_24d050ba31898496(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    if (!isplayer(self)) {
        return 0;
    }
    var_5473a133b9d77893 = itembundle.subtype;
    weapon = self getcurrentweapon();
    if (istrue(self.insertingarmorplate) || self isswitchingweapon()) {
        return 0;
    }
    if (istrue(namespace_e0ee43ef2dddadaa::iskillstreakweapon(weapon))) {
        return 0;
    }
    if (var_5473a133b9d77893 == "ammomod") {
        if (weapon == level.weaponnone) {
            return 0;
        }
        if (namespace_dc2e59577d3a271f::function_6a22621172a35366(weapon)) {
            return 1;
        }
    } else if (var_5473a133b9d77893 == "aethertool") {
        if (weapon == level.weaponnone) {
            return 0;
        }
        foreach (weaponname in level.var_202c7fdc43f4a2cd) {
            if (weaponname == weapon.basename) {
                return 0;
            }
        }
        var_84bda2c733869e7c = itembundle.rarity;
        rarity = function_75e73212bbe447d9(weapon);
        if (isint(rarity) && rarity < 4) {
            switch (var_84bda2c733869e7c) {
            case 1:
                if (rarity < 1) {
                    return 1;
                }
                break;
            case 2:
                if (rarity < 2) {
                    return 1;
                }
                break;
            case 3:
                if (rarity < 3) {
                    return 1;
                }
                break;
            case 4:
                if (rarity < 4) {
                    return 1;
                }
                break;
            }
        }
    } else if (var_5473a133b9d77893 == "aethercrystal") {
        if (weapon == level.weaponnone) {
            return 0;
        }
        if (!namespace_a4ff02beedc1bce8::function_251fcd097206e347(weapon)) {
            return 0;
        }
        var_91a6795b9c75d0e4 = namespace_a4ff02beedc1bce8::get_pap_level(weapon);
        var_84bda2c733869e7c = itembundle.rarity;
        if (isdefined(var_84bda2c733869e7c)) {
            switch (var_84bda2c733869e7c) {
            case 2:
                if (var_91a6795b9c75d0e4 == 0) {
                    return 1;
                }
                break;
            case 3:
                if (var_91a6795b9c75d0e4 == 0 || var_91a6795b9c75d0e4 == 1) {
                    return 1;
                }
                break;
            case 4:
                if (var_91a6795b9c75d0e4 != 3) {
                    return 1;
                }
                break;
            }
        }
    } else if (var_5473a133b9d77893 == "golden_armor_plate") {
        if (!istrue(self.var_28c033c3c5b37f1f)) {
            return 1;
        }
    } else if (var_5473a133b9d77893 == "golden_ammo") {
        if (!istrue(self.var_8902b4030fc972fc)) {
            return 1;
        }
    } else if (var_5473a133b9d77893 == "dog_whistle") {
        return 1;
    }
    return 0;
}

// Namespace namespace_77804604a7f8a031/namespace_959f36f069fc65b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c
// Size: 0x26
function function_9f3d2876de4f5272() {
    itembundle = undefined;
    quantity = 0;
    return [0:itembundle, 1:quantity];
}

