#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using script_2669878cf5a1b6bc;
#using script_7edf952f8921aa6b;
#using script_16ea1b94f0f381b3;

#namespace namespace_3ffbdf8bac74c31e;

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c
// Size: 0x15
function function_58adef5faf094375() {
    level.var_dfee642d94e9a227 = [];
    level thread function_12d0f398c50fd950();
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x179
// Size: 0xa4
function function_12d0f398c50fd950() {
    waitframe();
    var_5938bbc58e87d3ec = level.gamemodebundle.equipmentscaling;
    if (!isdefined(var_5938bbc58e87d3ec)) {
        assertmsg("<dev string:x1c>");
        return;
    }
    var_7483491932b87344 = getscriptbundle("equipmentroundscaling:" + var_5938bbc58e87d3ec);
    assert(isdefined(var_7483491932b87344), "<dev string:x46>");
    function_3e6d63e335461d9f(var_7483491932b87344);
    if (istrue(var_7483491932b87344.var_953f654096245999)) {
        function_b5e57408c7878df7(&function_75c0fdca3c75b192);
    } else {
        function_b5e57408c7878df7(&function_33b2645c578ef6f6);
    }
    registersharedfunc("zombie", "scale_underbarrel_damage", &scale_underbarrel_damage);
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x3d5
function function_3e6d63e335461d9f(var_7483491932b87344) {
    foreach (weaponscale in var_7483491932b87344.var_f0491c6bbae95176) {
        var_a5e6d867076e1761 = spawnstruct();
        var_a5e6d867076e1761.shouldscale = isdefined(weaponscale.shouldscale) ? weaponscale.shouldscale : 0;
        var_a5e6d867076e1761.var_711a12b052d4cde3 = isdefined(weaponscale.var_711a12b052d4cde3) ? weaponscale.var_711a12b052d4cde3 : 0;
        var_a5e6d867076e1761.basedamage = isdefined(weaponscale.basedamage) ? weaponscale.basedamage : 0;
        var_a5e6d867076e1761.var_ea5303b29f66f8c9 = isdefined(weaponscale.var_ea5303b29f66f8c9) ? weaponscale.var_ea5303b29f66f8c9 : 1;
        var_a5e6d867076e1761.var_7e542b7c29a7244 = [];
        bonus_damage = 0;
        var_8be978d92a5f491b = isdefined(weaponscale.var_8be978d92a5f491b) ? weaponscale.var_8be978d92a5f491b : 0;
        var_ab9b007b48d2a13c = isdefined(weaponscale.var_ab9b007b48d2a13c) ? weaponscale.var_ab9b007b48d2a13c : 0;
        var_4257d22db0d2de10 = isdefined(weaponscale.var_4257d22db0d2de10) ? weaponscale.var_4257d22db0d2de10 : 0;
        var_d4bc3723b43637ad = isdefined(weaponscale.var_d4bc3723b43637ad) ? weaponscale.var_d4bc3723b43637ad : 0;
        var_a097d99c46084bc6 = isdefined(weaponscale.var_a097d99c46084bc6) ? weaponscale.var_a097d99c46084bc6 : 0;
        var_4a3eefb757083721 = isdefined(weaponscale.var_4a3eefb757083721) ? weaponscale.var_4a3eefb757083721 : 0;
        var_318fdf592e2fa508 = isdefined(weaponscale.var_318fdf592e2fa508) ? weaponscale.var_318fdf592e2fa508 : 0;
        for (i = 1; i <= 55; i++) {
            if (i >= 1 && i <= 10) {
                bonus_damage += var_8be978d92a5f491b;
            } else if (i >= 11 && i <= 16) {
                bonus_damage += var_ab9b007b48d2a13c;
            } else if (i >= 17 && i <= 21) {
                bonus_damage += var_4257d22db0d2de10;
            } else if (i >= 22 && i <= 26) {
                bonus_damage += var_d4bc3723b43637ad;
            } else if (i >= 27 && i <= 31) {
                bonus_damage += var_a097d99c46084bc6;
            } else if (i >= 32 && i <= 36) {
                bonus_damage += var_4a3eefb757083721;
            } else if (i >= 37) {
                bonus_damage += var_318fdf592e2fa508;
            }
            var_a5e6d867076e1761.var_7e542b7c29a7244[i] = bonus_damage;
        }
        var_a5e6d867076e1761.var_98eab9eb6df05885 = isdefined(weaponscale.var_98eab9eb6df05885) ? weaponscale.var_98eab9eb6df05885 : 0;
        var_a5e6d867076e1761.var_d3bc75dccc9ec3a7 = isdefined(weaponscale.var_d3bc75dccc9ec3a7) ? weaponscale.var_d3bc75dccc9ec3a7 : 0;
        var_a5e6d867076e1761.var_1f156f046d3ea933 = isdefined(weaponscale.var_1f156f046d3ea933) ? weaponscale.var_1f156f046d3ea933 : 0;
        var_a5e6d867076e1761.var_e14b4c728979e05b = isdefined(weaponscale.var_e14b4c728979e05b) ? weaponscale.var_e14b4c728979e05b : 0;
        var_49e6ef3edadd524e = weaponscale.var_49e6ef3edadd524e;
        level.var_dfee642d94e9a227[var_49e6ef3edadd524e] = var_a5e6d867076e1761;
    }
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x602
// Size: 0x1e
function function_75f8b3962a591c57() {
    roundnum = function_560b2e700ce084a2(self.origin);
    return roundnum;
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x629
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

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6b3
// Size: 0x33
function function_c88d1c26bf2574e(weaponobject, player) {
    if (!isplayer(player)) {
        return false;
    }
    underbarrelweapon = function_52890514a3a728b7(weaponobject);
    return isdefined(underbarrelweapon);
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ef
// Size: 0x22a
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
    if (!isweaponequipment(weaponobject) && !iskillstreakweapon(weaponobject) && !function_416466f336d75ef6(weaponobject)) {
        return params.idamage;
    }
    scaleddamage = params.idamage;
    var_49e6ef3edadd524e = function_f581838ce4328f7a(weaponobject);
    roundnumber = function_75f8b3962a591c57();
    if (isdefined(level.var_dfee642d94e9a227[var_49e6ef3edadd524e])) {
        scalestruct = level.var_dfee642d94e9a227[var_49e6ef3edadd524e];
    } else {
        scalestruct = level.var_dfee642d94e9a227["default"];
        var_49e6ef3edadd524e = "default";
    }
    if (!isdefined(scalestruct)) {
        return params.idamage;
    }
    if (isdefined(params.smeansofdeath) && params.smeansofdeath == "MOD_IMPACT" && !istrue(scalestruct.var_711a12b052d4cde3)) {
        return params.idamage;
    }
    if (level.var_dfee642d94e9a227[var_49e6ef3edadd524e].basedamage >= 0) {
        scaleddamage = level.var_dfee642d94e9a227[var_49e6ef3edadd524e].basedamage;
    }
    if (level.var_dfee642d94e9a227[var_49e6ef3edadd524e].shouldscale) {
        scaleddamage = function_6f4c937aa843fac2(scaleddamage, roundnumber, var_49e6ef3edadd524e, self.aicategory, self.maxhealth, params);
    }
    return scaleddamage;
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x922
// Size: 0x1bd
function function_33b2645c578ef6f6(params) {
    if (!isweaponequipment(params.sweapon)) {
        return params.idamage;
    }
    if (isdefined(params.eattacker) && isdefined(params.idamage) && isdefined(params.eattacker.vehicletype)) {
        return params.idamage;
    }
    scaleddamage = params.idamage;
    var_49e6ef3edadd524e = function_f581838ce4328f7a(params.sweapon);
    roundnumber = isdefined(level.round_number) ? level.round_number : 1;
    if (isdefined(level.var_dfee642d94e9a227[var_49e6ef3edadd524e])) {
        scalestruct = level.var_dfee642d94e9a227[var_49e6ef3edadd524e];
    } else {
        scalestruct = level.var_dfee642d94e9a227["default"];
        var_49e6ef3edadd524e = "default";
    }
    if (!isdefined(scalestruct)) {
        return params.idamage;
    }
    if (isdefined(params.smeansofdeath) && params.smeansofdeath == "MOD_IMPACT" && !istrue(scalestruct.var_711a12b052d4cde3)) {
        return params.idamage;
    }
    if (level.var_dfee642d94e9a227[var_49e6ef3edadd524e].basedamage >= 0) {
        scaleddamage = level.var_dfee642d94e9a227[var_49e6ef3edadd524e].basedamage;
    }
    if (level.var_dfee642d94e9a227[var_49e6ef3edadd524e].shouldscale) {
        scaleddamage = function_6f4c937aa843fac2(scaleddamage, roundnumber, var_49e6ef3edadd524e, self.aicategory, self.maxhealth, params);
    }
    return scaleddamage;
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xae8
// Size: 0x1b4
function function_6f4c937aa843fac2(n_base_damage, roundnumber, var_49e6ef3edadd524e, aicategory, maxhealth, dmg_struct, packdamagescalar) {
    var_43ea7ee7224a5f65 = isdefined(roundnumber) ? roundnumber : 1;
    packdamagescalar = isdefined(packdamagescalar) ? packdamagescalar : 1;
    var_d11b5d9fd186a28 = n_base_damage;
    damagestruct = undefined;
    if (isdefined(level.var_dfee642d94e9a227[var_49e6ef3edadd524e])) {
        damagestruct = level.var_dfee642d94e9a227[var_49e6ef3edadd524e];
    } else if (isdefined(level.var_dfee642d94e9a227["default#"])) {
        damagestruct = level.var_dfee642d94e9a227["default#"];
    }
    if (istrue(damagestruct.shouldscale)) {
        if (var_43ea7ee7224a5f65 > 1) {
            if (var_43ea7ee7224a5f65 > 55) {
                var_43ea7ee7224a5f65 = 55;
            }
            bonus_damage = damagestruct.var_7e542b7c29a7244[var_43ea7ee7224a5f65] * packdamagescalar;
            var_d11b5d9fd186a28 += bonus_damage;
        }
        if (isdefined(maxhealth)) {
            maxpercent = 100;
            switch (aicategory) {
            case #"hash_84fcf5e68d7230b2":
                maxpercent = damagestruct.var_98eab9eb6df05885;
                break;
            case #"hash_8c089e813083e510":
                maxpercent = damagestruct.var_d3bc75dccc9ec3a7;
                break;
            case #"hash_7b0e2f2ed84f34":
                maxpercent = damagestruct.var_1f156f046d3ea933;
                break;
            case #"hash_7e8a002ed096276c":
                maxpercent = damagestruct.var_e14b4c728979e05b;
                break;
            }
            if (isdefined(dmg_struct)) {
                dmg_struct.damagemaxhealthcap = min(maxpercent / 100, dmg_struct.damagemaxhealthcap);
            }
        }
    }
    return int(var_d11b5d9fd186a28);
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca5
// Size: 0x26
function function_416466f336d75ef6(sweapon) {
    if (isdefined(level.var_5a8e1ccd3a0fee5b)) {
        return [[ level.var_5a8e1ccd3a0fee5b ]](sweapon);
    }
    return 0;
}

// Namespace namespace_3ffbdf8bac74c31e / namespace_73f07f62510f0f5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcd4
// Size: 0x159
function scale_underbarrel_damage(dmg_struct) {
    if (!isdefined(dmg_struct)) {
        return;
    }
    if (!isplayer(dmg_struct.eattacker)) {
        return dmg_struct.idamage;
    }
    weaponobject = dmg_struct.objweapon;
    var_fe06e947faa4926e = function_52890514a3a728b7(weaponobject);
    if (!isdefined(var_fe06e947faa4926e)) {
        return dmg_struct.idamage;
    }
    scaleddamage = dmg_struct.idamage;
    packdamagescalar = 1;
    if (issharedfuncdefined("zombie", "get_pap_level")) {
        if (dmg_struct.eattacker function_af5127390d3221e9(weaponobject)) {
            packdamagescalar = level.var_dfee642d94e9a227[var_fe06e947faa4926e].var_ea5303b29f66f8c9;
        }
    }
    roundnumber = function_75f8b3962a591c57();
    scalestruct = level.var_dfee642d94e9a227[var_fe06e947faa4926e];
    if (level.var_dfee642d94e9a227[var_fe06e947faa4926e].basedamage >= 0) {
        scaleddamage = level.var_dfee642d94e9a227[var_fe06e947faa4926e].basedamage;
    }
    if (level.var_dfee642d94e9a227[var_fe06e947faa4926e].shouldscale) {
        scaleddamage = function_6f4c937aa843fac2(scaleddamage, roundnumber, var_fe06e947faa4926e, self.aicategory, self.maxhealth, dmg_struct, packdamagescalar);
    }
    return scaleddamage;
}

