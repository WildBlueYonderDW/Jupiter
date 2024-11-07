#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\cp_hud_message.gsc;
#using script_7c40fa80892a721;
#using script_6e09a830fab9468f;
#using script_18c9036dc9a4081;
#using script_3bcaa2cbaf54abdd;

#namespace namespace_1eb38c7058edf8e0;

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c
// Size: 0x9a
function function_9de497922ea1a6bf() {
    level.var_b3cbb613d49ff5a3 = [];
    level.var_e23f2a9c37c8597c = [];
    function_b3c5ba25a66d7ce9("perk_pack_speedy", &function_fa0bb7d172f87c23, &function_494742bebd999d7a);
    function_b3c5ba25a66d7ce9("perk_pack_buff", &function_b206a39197180c92, &function_9f0bac6bdea9712f);
    function_b3c5ba25a66d7ce9("perk_pack_mule", &function_581e926068ad6972, &function_e772d952ad274643);
    function_b3c5ba25a66d7ce9("perk_pack_medic", &function_a7ac939f2c1d839, &function_ed6749412e69fe02);
    function_b3c5ba25a66d7ce9("perk_pack_ammo_buff", &function_f4e87426380be51, &function_54f94ddcc1f58996);
    function_b3c5ba25a66d7ce9("perk_pack_armor_buff", &function_448cea0f7c6fbf36, &function_77eb1d81d0f5e81f);
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee
// Size: 0x2b
function function_645eb4e3639de90d() {
    if (!isdefined(self.var_1eb38c7058edf8e0)) {
        self.var_1eb38c7058edf8e0 = [];
        self.var_c50870864fd5fa67 = 4;
        function_10be613f34ff473a();
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x421
// Size: 0x7e
function function_b3c5ba25a66d7ce9(var_42695dc3bf559617, setfunc, unsetfunc) {
    assert(isdefined(var_42695dc3bf559617));
    assert(isdefined(setfunc));
    assert(isdefined(unsetfunc));
    if (isdefined(setfunc)) {
        assert(isfunction(setfunc));
        level.var_b3cbb613d49ff5a3[var_42695dc3bf559617] = setfunc;
    }
    if (isdefined(unsetfunc)) {
        assert(isfunction(unsetfunc));
        level.var_e23f2a9c37c8597c[var_42695dc3bf559617] = unsetfunc;
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a7
// Size: 0x5f
function function_10be613f34ff473a() {
    for (i = 1; i < 5; i++) {
        self.var_1eb38c7058edf8e0[i] = spawnstruct();
        self.var_1eb38c7058edf8e0[i].var_e0250163954de501 = 0;
        self.var_1eb38c7058edf8e0[i].var_7de943e918bc4562 = "none";
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50e
// Size: 0x47
function function_eb542c381f315290() {
    for (i = 1; i < self.var_c50870864fd5fa67 + 1; i++) {
        if (self.var_1eb38c7058edf8e0[i].var_7de943e918bc4562 == "none") {
            return i;
        }
    }
    return 0;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x55e
// Size: 0x2f
function function_e752c81048e56e3c(slot, var_e0250163954de501) {
    if (isdefined(var_e0250163954de501)) {
        self.var_1eb38c7058edf8e0[slot].var_e0250163954de501 = var_e0250163954de501;
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x595
// Size: 0x6e
function function_dfceffb521d7d4cb(perkname) {
    switch (perkname) {
    case #"hash_4666fbb263cf581b":
        return "perk_pack_mule";
    case #"hash_5d3f25d7f9aa109":
        return "perk_pack_medic";
    case #"hash_46e6f0dbb1fb728c":
        return "perk_pack_buff";
    case #"hash_de9b5c91d811f203":
        return "perk_pack_mule";
    default:
        return "perk_pack_speed";
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x60b
// Size: 0x92
function function_7184b43950d947ea(perk_pack, slot, var_e0250163954de501) {
    var_5dc06b0667135c87 = "ui_spawn_perk_";
    var_d861f893072a477e = slot - 1;
    omnvar = var_5dc06b0667135c87 + var_d861f893072a477e;
    if (perk_pack != "none") {
        if (isdefined(omnvar)) {
            var_24db96216c5f6124 = int(tablelookup("cp/perk_pack_table.csv", 1, perk_pack, 0));
            if (isdefined(var_24db96216c5f6124)) {
                self setclientomnvar(omnvar, var_24db96216c5f6124);
            }
        }
        return;
    }
    self setclientomnvar(omnvar, -1);
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a5
// Size: 0x60
function function_74320e884b9a3fd8(var_7de943e918bc4562) {
    for (i = 1; i < self.var_c50870864fd5fa67 + 1; i++) {
        if (self.var_1eb38c7058edf8e0[i].var_7de943e918bc4562 == var_7de943e918bc4562) {
            return self.var_1eb38c7058edf8e0[i].var_e0250163954de501;
        }
    }
    return 0;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70e
// Size: 0x4d
function function_8f03acc557e2b610(var_7de943e918bc4562) {
    for (i = 1; i < self.var_c50870864fd5fa67 + 1; i++) {
        if (self.var_1eb38c7058edf8e0[i].var_7de943e918bc4562 == var_7de943e918bc4562) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x764
// Size: 0x48
function function_f82e41138806e225() {
    for (i = 1; i < self.var_c50870864fd5fa67 + 1; i++) {
        if (self.var_1eb38c7058edf8e0[i].var_7de943e918bc4562 == "none") {
            return false;
        }
    }
    return true;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b5
// Size: 0x4c
function function_de2c47c49e185540(var_7de943e918bc4562) {
    for (i = 1; i < self.var_c50870864fd5fa67 + 1; i++) {
        if (self.var_1eb38c7058edf8e0[i].var_7de943e918bc4562 == var_7de943e918bc4562) {
            return i;
        }
    }
    return 0;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80a
// Size: 0x54
function function_9ab372b1dc1a8e3() {
    slot = 0;
    for (i = 1; i < self.var_c50870864fd5fa67 + 1; i++) {
        if (self.var_1eb38c7058edf8e0[i].var_7de943e918bc4562 == "none") {
            slot = i;
        }
    }
    return slot;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x867
// Size: 0x20
function function_7f62b61fc20b6540(var_b8237431c9aa7e36) {
    return self.var_1eb38c7058edf8e0[var_b8237431c9aa7e36].var_7de943e918bc4562;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x890
// Size: 0x37
function function_47ae9e67fafc2fc4(var_b8237431c9aa7e36, var_d1fc596f54becc5a) {
    var_efbe3cb0d8d22512 = function_7f62b61fc20b6540(var_b8237431c9aa7e36);
    function_7175c0fbce3fed06(var_efbe3cb0d8d22512);
    function_9dfbc3169c4fb507(var_d1fc596f54becc5a, 3);
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8cf
// Size: 0x4d
function function_6906dab2c6805a25(var_7de943e918bc4562, var_e0250163954de501) {
    slot = function_de2c47c49e185540(var_7de943e918bc4562);
    if (slot > 0) {
        var_8ff4765eac369993 = function_74320e884b9a3fd8(var_7de943e918bc4562);
        if (var_8ff4765eac369993 < 2) {
            function_e752c81048e56e3c(slot, var_e0250163954de501);
        }
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x924
// Size: 0x64
function function_9dfbc3169c4fb507(var_7de943e918bc4562, var_e0250163954de501) {
    slot = function_eb542c381f315290();
    if (slot != 0) {
        self.var_1eb38c7058edf8e0[slot].var_7de943e918bc4562 = var_7de943e918bc4562;
        function_e752c81048e56e3c(slot, var_e0250163954de501);
        function_7184b43950d947ea(var_7de943e918bc4562, slot, var_e0250163954de501);
        self [[ level.var_b3cbb613d49ff5a3[var_7de943e918bc4562] ]](var_e0250163954de501);
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x990
// Size: 0x39
function function_83829cdb2347c8f() {
    function_7175c0fbce3fed06("perk_pack_speedy");
    function_7175c0fbce3fed06("perk_pack_buff");
    function_7175c0fbce3fed06("perk_pack_medic");
    function_7175c0fbce3fed06("perk_pack_mule");
    function_a201dbdaec933ae6();
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9d1
// Size: 0x99
function function_7175c0fbce3fed06(var_7de943e918bc4562) {
    for (slot = 1; slot < self.var_c50870864fd5fa67 + 1; slot++) {
        if (self.var_1eb38c7058edf8e0[slot].var_7de943e918bc4562 == var_7de943e918bc4562) {
            self.var_1eb38c7058edf8e0[slot].var_7de943e918bc4562 = "none";
            self.var_1eb38c7058edf8e0[slot].var_e0250163954de501 = 0;
            function_7184b43950d947ea("none", slot, 0);
            self [[ level.var_e23f2a9c37c8597c[var_7de943e918bc4562] ]](0);
        }
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa72
// Size: 0xd
function function_ed49c972daeb7575() {
    self.var_c50870864fd5fa67 = 2;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa87
// Size: 0xd
function function_a201dbdaec933ae6() {
    self.var_c50870864fd5fa67 = 4;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9c
// Size: 0x15
function function_3cf76f4dab9dc93c() {
    if (self.var_c50870864fd5fa67 == 2) {
        return true;
    }
    return false;
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaba
// Size: 0x53
function function_fa0bb7d172f87c23(var_e0250163954de501) {
    giveperk("specialty_hustle");
    giveperk("specialty_fastcrouchmovement");
    giveperk("specialty_stalker");
    giveperk("specialty_fastreload");
    giveperk("specialty_tactical_recon");
    giveperk("specialty_warhead");
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb15
// Size: 0x53
function function_494742bebd999d7a(var_e0250163954de501) {
    takeperk("specialty_hustle");
    takeperk("specialty_fastcrouchmovement");
    takeperk("specialty_stalker");
    takeperk("specialty_fastreload");
    takeperk("specialty_tactical_recon");
    takeperk("specialty_warhead");
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb70
// Size: 0x23
function function_a7ac939f2c1d839(var_e0250163954de501) {
    giveperk("specialty_fast_health_regen");
    giveperk("specialty_quick_revive");
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb9b
// Size: 0x23
function function_ed6749412e69fe02(var_e0250163954de501) {
    takeperk("specialty_fast_health_regen");
    takeperk("specialty_quick_revive");
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbc6
// Size: 0x42
function function_f4e87426380be51(var_e0250163954de501) {
    splash = "cp_super_ammo_used";
    scripts\cp\cp_hud_message::showsplash(splash, undefined, self);
    self setclientomnvar("ui_ammo_class_power_on", gettime());
    giveperk("specialty_bulletdamage");
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc10
// Size: 0x28
function function_54f94ddcc1f58996(var_e0250163954de501) {
    takeperk("specialty_bulletdamage");
    self setclientomnvar("ui_ammo_class_power_off", gettime());
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc40
// Size: 0x78
function function_448cea0f7c6fbf36(var_e0250163954de501) {
    splash = "cp_super_armor_used";
    var_c791ead1f39669f4 = self.var_4cb4a6ebd0885ffd;
    namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(var_c791ead1f39669f4);
    self.old_armor_scalar = namespace_c4cab616edf9b2b9::get_perk("enemy_damage_to_player_armor_scalar");
    namespace_c4cab616edf9b2b9::set_perk("enemy_damage_to_player_armor_scalar", self.old_armor_scalar * 1.5);
    self.var_c99db8962a6b36bb = 1;
    namespace_6eb2bf1007397723::function_e0d47de3df5f23ea();
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc0
// Size: 0x31
function function_77eb1d81d0f5e81f(var_e0250163954de501) {
    namespace_c4cab616edf9b2b9::set_perk("enemy_damage_to_player_armor_scalar", self.old_armor_scalar);
    self.var_c99db8962a6b36bb = 0;
    namespace_6eb2bf1007397723::function_e0d47de3df5f23ea();
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf9
// Size: 0x34
function function_b206a39197180c92(var_e0250163954de501) {
    giveperk("specialty_extra_armor");
    namespace_6eb2bf1007397723::function_8ce284d6441202b8(var_e0250163954de501);
    function_79287cc290242a2(self, var_e0250163954de501);
    giveperk("specialty_eod");
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd35
// Size: 0x34
function function_9f0bac6bdea9712f(var_e0250163954de501) {
    takeperk("specialty_extra_armor");
    namespace_6eb2bf1007397723::function_8ce284d6441202b8(0);
    function_79287cc290242a2(self, 0);
    takeperk("specialty_eod");
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd71
// Size: 0x37
function function_79287cc290242a2(player, var_e0250163954de501) {
    entity_num = player getentitynumber();
    namespace_6c67e93a4c487d83::setcoopplayerdata_for_everyone("EoGPlayer", entity_num, "hivesdestroyed", var_e0250163954de501);
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdb0
// Size: 0x3d
function function_581e926068ad6972(var_e0250163954de501) {
    giveperk("specialty_extra_weapon");
    giveperk("specialty_armor_satchel");
    self setclientomnvar("ui_br_has_plate_pouch", 1);
    giveperk("specialty_extra_shrapnel");
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdf5
// Size: 0x43
function function_e772d952ad274643(var_e0250163954de501) {
    takeperk("specialty_extra_weapon");
    takeperk("specialty_armor_satchel");
    self setclientomnvar("ui_br_has_plate_pouch", 0);
    takeperk("specialty_extra_shrapnel");
    function_3e9ce650ebb5cee();
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe40
// Size: 0xbf
function function_3e9ce650ebb5cee() {
    primaries = self getweaponslistprimaries();
    var_388f7437f9b4ba85 = 0;
    self.var_419b06083e47444d = [];
    foreach (weapon in primaries) {
        if (weapon.inventorytype == "primary") {
            self.var_419b06083e47444d[var_388f7437f9b4ba85] = weapon;
            var_388f7437f9b4ba85 += 1;
        }
    }
    if (var_388f7437f9b4ba85 >= 3) {
        var_cca6009e1acb40ed = random(self.var_419b06083e47444d);
        if (isdefined(var_cca6009e1acb40ed)) {
            self takeweapon(var_cca6009e1acb40ed);
        }
    }
}

// Namespace namespace_1eb38c7058edf8e0 / namespace_1c2d0ab93cca3a61
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf07
// Size: 0x29
function function_e5ea666722be9cd0(num) {
    if (!isdefined(num)) {
        num = 4;
    }
    if (_hasperk("specialty_extra_shrapnel")) {
        num += 2;
    }
    return num;
}

