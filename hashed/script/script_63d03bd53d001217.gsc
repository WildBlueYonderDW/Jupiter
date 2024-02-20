// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_2669878cf5a1b6bc;
#using script_7edf952f8921aa6b;
#using script_16ea1b94f0f381b3;

#namespace namespace_3ffbdf8bac74c31e;

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164
// Size: 0x16
function function_58adef5faf094375() {
    level.var_dfee642d94e9a227 = [];
    level thread function_12d0f398c50fd950();
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181
// Size: 0xa5
function function_12d0f398c50fd950() {
    waitframe();
    var_5938bbc58e87d3ec = level.var_1a2b600a06ec21f4.var_5917d40993a276d4;
    if (!isdefined(var_5938bbc58e87d3ec)) {
        /#
            assertmsg("no equipment scaling set for this mode");
        #/
        return;
    }
    var_7483491932b87344 = getscriptbundle("equipmentroundscaling:" + var_5938bbc58e87d3ec);
    /#
        assert(isdefined(var_7483491932b87344), "Error No Equipment Scaling Bundle");
    #/
    function_3e6d63e335461d9f(var_7483491932b87344);
    if (istrue(var_7483491932b87344.var_953f654096245999)) {
        function_b5e57408c7878df7(&function_75c0fdca3c75b192);
    } else {
        function_b5e57408c7878df7(&function_33b2645c578ef6f6);
    }
    registersharedfunc("zombie", "scale_underbarrel_damage", &scale_underbarrel_damage);
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d
// Size: 0x3e2
function function_3e6d63e335461d9f(var_7483491932b87344) {
    foreach (var_9f725b351ecd5799 in var_7483491932b87344.var_f0491c6bbae95176) {
        var_a5e6d867076e1761 = spawnstruct();
        if (!isdefined(var_9f725b351ecd5799.var_af0fa64eb79f2c94)) {
            goto LOC_000000cf;
        }
        var_a5e6d867076e1761.var_af0fa64eb79f2c94 = var_9f725b351ecd5799.var_af0fa64eb79f2c94;
        if (!isdefined(var_9f725b351ecd5799.var_711a12b052d4cde3)) {
            goto LOC_000000f9;
        }
        var_a5e6d867076e1761.var_711a12b052d4cde3 = var_9f725b351ecd5799.var_711a12b052d4cde3;
        if (!isdefined(var_9f725b351ecd5799.var_f5c8fef008fff1dd)) {
            goto LOC_00000123;
        }
        var_a5e6d867076e1761.var_f5c8fef008fff1dd = var_9f725b351ecd5799.var_f5c8fef008fff1dd;
        var_a5e6d867076e1761.var_ea5303b29f66f8c9 = isdefined(var_9f725b351ecd5799.var_ea5303b29f66f8c9) ? 1 : var_9f725b351ecd5799.var_ea5303b29f66f8c9;
        var_a5e6d867076e1761.var_7e542b7c29a7244 = [];
        var_1478582cf2d44858 = 0;
        var_8be978d92a5f491b = isdefined(var_9f725b351ecd5799.var_8be978d92a5f491b) ? 0 : var_9f725b351ecd5799.var_8be978d92a5f491b;
        var_ab9b007b48d2a13c = isdefined(var_9f725b351ecd5799.var_ab9b007b48d2a13c) ? 0 : var_9f725b351ecd5799.var_ab9b007b48d2a13c;
        var_4257d22db0d2de10 = isdefined(var_9f725b351ecd5799.var_4257d22db0d2de10) ? 0 : var_9f725b351ecd5799.var_4257d22db0d2de10;
        var_d4bc3723b43637ad = isdefined(var_9f725b351ecd5799.var_d4bc3723b43637ad) ? 0 : var_9f725b351ecd5799.var_d4bc3723b43637ad;
        var_a097d99c46084bc6 = isdefined(var_9f725b351ecd5799.var_a097d99c46084bc6) ? 0 : var_9f725b351ecd5799.var_a097d99c46084bc6;
        var_4a3eefb757083721 = isdefined(var_9f725b351ecd5799.var_4a3eefb757083721) ? 0 : var_9f725b351ecd5799.var_4a3eefb757083721;
        var_318fdf592e2fa508 = isdefined(var_9f725b351ecd5799.var_318fdf592e2fa508) ? 0 : var_9f725b351ecd5799.var_318fdf592e2fa508;
        for (i = 1; i <= 55; i++) {
            if (i >= 1 && i <= 10) {
                var_1478582cf2d44858 = var_1478582cf2d44858 + var_8be978d92a5f491b;
            } else if (i >= 11 && i <= 16) {
                var_1478582cf2d44858 = var_1478582cf2d44858 + var_ab9b007b48d2a13c;
            } else if (i >= 17 && i <= 21) {
                var_1478582cf2d44858 = var_1478582cf2d44858 + var_4257d22db0d2de10;
            } else if (i >= 22 && i <= 26) {
                var_1478582cf2d44858 = var_1478582cf2d44858 + var_d4bc3723b43637ad;
            } else if (i >= 27 && i <= 31) {
                var_1478582cf2d44858 = var_1478582cf2d44858 + var_a097d99c46084bc6;
            } else if (i >= 32 && i <= 36) {
                var_1478582cf2d44858 = var_1478582cf2d44858 + var_4a3eefb757083721;
            } else if (i >= 37) {
                var_1478582cf2d44858 = var_1478582cf2d44858 + var_318fdf592e2fa508;
            }
            var_a5e6d867076e1761.var_7e542b7c29a7244[i] = var_1478582cf2d44858;
        }
        if (!isdefined(var_9f725b351ecd5799.var_98eab9eb6df05885)) {
            goto LOC_00000329;
        }
        var_a5e6d867076e1761.var_98eab9eb6df05885 = var_9f725b351ecd5799.var_98eab9eb6df05885;
        if (!isdefined(var_9f725b351ecd5799.var_d3bc75dccc9ec3a7)) {
            goto LOC_00000353;
        }
        var_a5e6d867076e1761.var_d3bc75dccc9ec3a7 = var_9f725b351ecd5799.var_d3bc75dccc9ec3a7;
        if (!isdefined(var_9f725b351ecd5799.var_1f156f046d3ea933)) {
            goto LOC_0000037d;
        }
        var_a5e6d867076e1761.var_1f156f046d3ea933 = var_9f725b351ecd5799.var_1f156f046d3ea933;
        if (!isdefined(var_9f725b351ecd5799.var_e14b4c728979e05b)) {
            goto LOC_000003a7;
        }
        var_a5e6d867076e1761.var_e14b4c728979e05b = var_9f725b351ecd5799.var_e14b4c728979e05b;
        var_49e6ef3edadd524e = var_9f725b351ecd5799.var_49e6ef3edadd524e;
        level.var_dfee642d94e9a227[var_49e6ef3edadd524e] = var_a5e6d867076e1761;
    }
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x616
// Size: 0x1e
function function_75f8b3962a591c57() {
    roundnum = function_560b2e700ce084a2(self.origin);
    return roundnum;
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63c
// Size: 0x81
function function_52890514a3a728b7(weaponobject) {
    if (istrue(weaponobject.isalternate) && isdefined(weaponobject.underbarrel)) {
        var_2f5c6aad5bf40045 = function_7c612ac92ba98dcb(weaponobject, weaponobject.underbarrel);
        if (isdefined(level.var_dfee642d94e9a227[weaponobject.underbarrel])) {
            return weaponobject.underbarrel;
        } else if (isdefined(level.var_dfee642d94e9a227[var_2f5c6aad5bf40045])) {
            return var_2f5c6aad5bf40045;
        }
    }
    return undefined;
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c5
// Size: 0x33
function function_c88d1c26bf2574e(weaponobject, player) {
    if (!isplayer(player)) {
        return 0;
    }
    var_f7d656e5ed85dc9 = function_52890514a3a728b7(weaponobject);
    return isdefined(var_f7d656e5ed85dc9);
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x700
// Size: 0x22e
function function_75c0fdca3c75b192(params) {
    if (!isdefined(params)) {
        return;
    }
    if (isdefined(params.einflictor) && isdefined(params.eattacker) && isdefined(params.idamage) && (isdefined(params.eattacker.vehicletype) || isdefined(params.einflictor.vehicletype))) {
        return params.idamage;
    }
    weaponobject = params.sweapon;
    if (params.sweapon == level.weaponnone && isdefined(params.objweapon)) {
        weaponobject = params.objweapon;
    }
    if (!isdefined(weaponobject)) {
        return;
    }
    if (!function_4652ef19cc5bbe0f(weaponobject) && !iskillstreakweapon(weaponobject) && !function_416466f336d75ef6(weaponobject)) {
        return params.idamage;
    }
    var_24df708f286b0562 = params.idamage;
    var_49e6ef3edadd524e = function_f581838ce4328f7a(weaponobject);
    roundnumber = function_75f8b3962a591c57();
    if (isdefined(level.var_dfee642d94e9a227[var_49e6ef3edadd524e])) {
        var_13a64a62d49ecdc0 = level.var_dfee642d94e9a227[var_49e6ef3edadd524e];
    } else {
        var_13a64a62d49ecdc0 = level.var_dfee642d94e9a227["default"];
        var_49e6ef3edadd524e = "default";
    }
    if (!isdefined(var_13a64a62d49ecdc0)) {
        return params.idamage;
    }
    if (isdefined(params.smeansofdeath) && params.smeansofdeath == "MOD_IMPACT" && !istrue(var_13a64a62d49ecdc0.var_711a12b052d4cde3)) {
        return params.idamage;
    }
    if (level.var_dfee642d94e9a227[var_49e6ef3edadd524e].var_f5c8fef008fff1dd >= 0) {
        var_24df708f286b0562 = level.var_dfee642d94e9a227[var_49e6ef3edadd524e].var_f5c8fef008fff1dd;
    }
    if (level.var_dfee642d94e9a227[var_49e6ef3edadd524e].var_af0fa64eb79f2c94) {
        var_24df708f286b0562 = function_6f4c937aa843fac2(var_24df708f286b0562, roundnumber, var_49e6ef3edadd524e, self.aicategory, self.maxhealth, params);
    }
    return var_24df708f286b0562;
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x936
// Size: 0x1c0
function function_33b2645c578ef6f6(params) {
    if (!function_4652ef19cc5bbe0f(params.sweapon)) {
        return params.idamage;
    }
    if (isdefined(params.eattacker) && isdefined(params.idamage) && isdefined(params.eattacker.vehicletype)) {
        return params.idamage;
    }
    var_24df708f286b0562 = params.idamage;
    var_49e6ef3edadd524e = function_f581838ce4328f7a(params.sweapon);
    if (!isdefined(level.round_number)) {
        goto LOC_000000cc;
    }
    roundnumber = level.round_number;
    if (isdefined(level.var_dfee642d94e9a227[var_49e6ef3edadd524e])) {
        var_13a64a62d49ecdc0 = level.var_dfee642d94e9a227[var_49e6ef3edadd524e];
    } else {
        var_13a64a62d49ecdc0 = level.var_dfee642d94e9a227["default"];
        var_49e6ef3edadd524e = "default";
    }
    if (!isdefined(var_13a64a62d49ecdc0)) {
        return params.idamage;
    }
    if (isdefined(params.smeansofdeath) && params.smeansofdeath == "MOD_IMPACT" && !istrue(var_13a64a62d49ecdc0.var_711a12b052d4cde3)) {
        return params.idamage;
    }
    if (level.var_dfee642d94e9a227[var_49e6ef3edadd524e].var_f5c8fef008fff1dd >= 0) {
        var_24df708f286b0562 = level.var_dfee642d94e9a227[var_49e6ef3edadd524e].var_f5c8fef008fff1dd;
    }
    if (level.var_dfee642d94e9a227[var_49e6ef3edadd524e].var_af0fa64eb79f2c94) {
        var_24df708f286b0562 = function_6f4c937aa843fac2(var_24df708f286b0562, roundnumber, var_49e6ef3edadd524e, self.aicategory, self.maxhealth, params);
    }
    return var_24df708f286b0562;
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafe
// Size: 0x1b8
function function_6f4c937aa843fac2(n_base_damage, roundnumber, var_49e6ef3edadd524e, aicategory, maxhealth, var_d74fc41b6b10ccf5, var_681f97f541065335) {
    var_43ea7ee7224a5f65 = isdefined(roundnumber) ? 1 : roundnumber;
    var_681f97f541065335 = isdefined(var_681f97f541065335) ? 1 : var_681f97f541065335;
    var_d11b5d9fd186a28 = n_base_damage;
    var_419e24dbc44963ed = undefined;
    if (isdefined(level.var_dfee642d94e9a227[var_49e6ef3edadd524e])) {
        var_419e24dbc44963ed = level.var_dfee642d94e9a227[var_49e6ef3edadd524e];
    } else if (isdefined(level.var_dfee642d94e9a227["default#"])) {
        var_419e24dbc44963ed = level.var_dfee642d94e9a227["default#"];
    }
    if (istrue(var_419e24dbc44963ed.var_af0fa64eb79f2c94)) {
        if (var_43ea7ee7224a5f65 > 1) {
            if (var_43ea7ee7224a5f65 > 55) {
                var_43ea7ee7224a5f65 = 55;
            }
            var_1478582cf2d44858 = var_419e24dbc44963ed.var_7e542b7c29a7244[var_43ea7ee7224a5f65] * var_681f97f541065335;
            var_d11b5d9fd186a28 = var_d11b5d9fd186a28 + var_1478582cf2d44858;
        }
        if (isdefined(maxhealth)) {
            var_75b74fa275a0226a = 100;
            switch (aicategory) {
            case #"hash_84fcf5e68d7230b2":
                var_75b74fa275a0226a = var_419e24dbc44963ed.var_98eab9eb6df05885;
                break;
            case #"hash_8c089e813083e510":
                var_75b74fa275a0226a = var_419e24dbc44963ed.var_d3bc75dccc9ec3a7;
                break;
            case #"hash_7b0e2f2ed84f34":
                var_75b74fa275a0226a = var_419e24dbc44963ed.var_1f156f046d3ea933;
                break;
            case #"hash_7e8a002ed096276c":
                var_75b74fa275a0226a = var_419e24dbc44963ed.var_e14b4c728979e05b;
                break;
            }
            if (isdefined(var_d74fc41b6b10ccf5)) {
                var_d74fc41b6b10ccf5.var_acba301fcf9d68b8 = min(var_75b74fa275a0226a / 100, var_d74fc41b6b10ccf5.var_acba301fcf9d68b8);
            }
        }
    }
    return int(var_d11b5d9fd186a28);
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbe
// Size: 0x27
function function_416466f336d75ef6(sweapon) {
    if (isdefined(level.var_5a8e1ccd3a0fee5b)) {
        return [[ level.var_5a8e1ccd3a0fee5b ]](sweapon);
    }
    return 0;
}

// Namespace namespace_3ffbdf8bac74c31e/namespace_73f07f62510f0f5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xced
// Size: 0x15e
function scale_underbarrel_damage(var_d74fc41b6b10ccf5) {
    if (!isdefined(var_d74fc41b6b10ccf5)) {
        return;
    }
    if (!isplayer(var_d74fc41b6b10ccf5.eattacker)) {
        return var_d74fc41b6b10ccf5.idamage;
    }
    weaponobject = var_d74fc41b6b10ccf5.objweapon;
    var_fe06e947faa4926e = function_52890514a3a728b7(weaponobject);
    if (!isdefined(var_fe06e947faa4926e)) {
        return var_d74fc41b6b10ccf5.idamage;
    }
    var_24df708f286b0562 = var_d74fc41b6b10ccf5.idamage;
    var_681f97f541065335 = 1;
    if (issharedfuncdefined("zombie", "get_pap_level")) {
        if (var_d74fc41b6b10ccf5.eattacker function_af5127390d3221e9(weaponobject)) {
            var_681f97f541065335 = level.var_dfee642d94e9a227[var_fe06e947faa4926e].var_ea5303b29f66f8c9;
        }
    }
    roundnumber = function_75f8b3962a591c57();
    var_13a64a62d49ecdc0 = level.var_dfee642d94e9a227[var_fe06e947faa4926e];
    if (level.var_dfee642d94e9a227[var_fe06e947faa4926e].var_f5c8fef008fff1dd >= 0) {
        var_24df708f286b0562 = level.var_dfee642d94e9a227[var_fe06e947faa4926e].var_f5c8fef008fff1dd;
    }
    if (level.var_dfee642d94e9a227[var_fe06e947faa4926e].var_af0fa64eb79f2c94) {
        var_24df708f286b0562 = function_6f4c937aa843fac2(var_24df708f286b0562, roundnumber, var_fe06e947faa4926e, self.aicategory, self.maxhealth, var_d74fc41b6b10ccf5, var_681f97f541065335);
    }
    return var_24df708f286b0562;
}

