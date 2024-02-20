// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_429c2a03090c1ea1;
#using script_73926eaf280b0b75;
#using script_554830d27078277d;
#using script_58682e6578ce0515;
#using script_686729055b66c6e4;
#using script_5a4a5d9ba343ff8f;
#using scripts\common\vehicle.gsc;

#namespace zombie_damage;

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x42f
// Size: 0x121
function autoexec init() {
    utility::registersharedfunc("zombie_damage", "buildDamageStruct", &function_4361b33933cb779d);
    utility::registersharedfunc("zombie_damage", "shouldSkipDamage", &function_b8fd1823ea584538);
    utility::registersharedfunc("zombie_damage", "checkDamagedArmor", &function_6b8e5b333b2b3e43);
    utility::registersharedfunc("zombie_damage", "checkArmorHitmarker", &function_5c8a92a87ae9751b);
    utility::registersharedfunc("zombie_damage", "checkArmorBreakHitmarker", &function_45500125495e46a6);
    utility::registersharedfunc("zombie_damage", "adjustDamageExposedHead", &function_63e1cb89f73d0ad8);
    utility::registersharedfunc("zombie_damage", "adjustDamageArmor", &function_10a52a9d2dcaf262);
    utility::registersharedfunc("zombie_damage", "adjustDamageUnderbarrel", &function_942afcb4f4e24091);
    utility::registersharedfunc("zombie_damage", "adjustDamageRarity", &function_89cc24cfc33e2693);
    utility::registersharedfunc("zombie_damage", "adjustDamageSpecific", &function_ba2823ac0204930c);
    utility::registersharedfunc("zombie_damage", "adjustDamageMercs", &function_f9c444fcf6bb992b);
    utility::registersharedfunc("zombie_damage", "adjustDamageKillCallbacks", &function_4948d7eacb9f12be);
    utility::registersharedfunc("zombie_damage", "damageMetabone", &function_71a411d4b5466318);
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557
// Size: 0xa1
function function_4361b33933cb779d(params) {
    return function_34e78cbd2dfff6df(params.einflictor, params.eattacker, params.idamage, params.idflags, params.smeansofdeath, params.sweapon, params.vpoint, params.vdir, params.shitloc, params.timeoffset, params.modelindex, params.partname, params.objweapon);
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params d, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x600
// Size: 0x1af
function function_34e78cbd2dfff6df(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    var_d74fc41b6b10ccf5 = spawnstruct();
    var_d74fc41b6b10ccf5.einflictor = einflictor;
    var_d74fc41b6b10ccf5.eattacker = eattacker;
    var_d74fc41b6b10ccf5.idamage = idamage;
    var_d74fc41b6b10ccf5.idflags = idflags;
    var_d74fc41b6b10ccf5.smeansofdeath = smeansofdeath;
    var_d74fc41b6b10ccf5.sweapon = sweapon;
    var_d74fc41b6b10ccf5.vpoint = vpoint;
    var_d74fc41b6b10ccf5.vdir = vdir;
    var_d74fc41b6b10ccf5.shitloc = shitloc;
    var_d74fc41b6b10ccf5.timeoffset = timeoffset;
    var_d74fc41b6b10ccf5.modelindex = modelindex;
    var_d74fc41b6b10ccf5.partname = partname;
    var_d74fc41b6b10ccf5.objweapon = objweapon;
    var_d74fc41b6b10ccf5.var_14edc6d1db3695bc = 0;
    var_d74fc41b6b10ccf5.var_feef4b237a6beb07 = 0;
    var_d74fc41b6b10ccf5.var_acba301fcf9d68b8 = 1;
    if (function_df9189c2ea1a100d()) {
        var_d74fc41b6b10ccf5.var_2eb474020f9d509 = function_e3bec440b7001e99(var_d74fc41b6b10ccf5);
    } else {
        var_d74fc41b6b10ccf5.var_2eb474020f9d509 = function_ae12b32b13b42c5e(shitloc, vdir);
        if (!isdefined(var_d74fc41b6b10ccf5.var_2eb474020f9d509)) {
            var_d74fc41b6b10ccf5.var_2eb474020f9d509 = function_b8f2b0917b1d3c98(vpoint, vdir);
        }
    }
    return var_d74fc41b6b10ccf5;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b7
// Size: 0xfd
function function_b8fd1823ea584538(eattacker, objweapon, smeansofdeath) {
    if (isplayer(eattacker) && is_equal(self.team, eattacker.team)) {
        return 1;
    }
    if (is_equal(eattacker, self) && namespace_c56b0b75fd51eab1::function_8ce7894f1a52fb77("charm")) {
        return 1;
    }
    var_225a577cbeda65c2 = function_f581838ce4328f7a(objweapon);
    if (ent_flag("deadwire_stunned") && smeansofdeath == "MOD_ELEMENTAL_ELEC") {
        var_2affb28c61eab26b = istrue(level.var_bfa98c9dd6edb929) && eattacker function_2e380dedfcfc7972(objweapon);
        if (istrue(var_2affb28c61eab26b) && eattacker function_87b7af080857567f(objweapon) == "deadwire") {
            return 0;
        }
    } else if (ent_flag("deadwire_stunned") && isdefined(self.aicategory) && self.aicategory == "normal") {
        return 1;
    }
    return 0;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bc
// Size: 0x1ef
function function_6a3d1a2884883a23(var_d74fc41b6b10ccf5) {
    var_2bd7283211fa61e7 = function_7d4c6e153055ebdc(var_d74fc41b6b10ccf5.objweapon, var_d74fc41b6b10ccf5.eattacker, var_d74fc41b6b10ccf5.smeansofdeath);
    var_4ff11f5368011566 = function_81366c086142dab6(var_d74fc41b6b10ccf5.objweapon);
    var_ebc23f622ee9bf55 = function_f05759f95f2503d1(var_d74fc41b6b10ccf5.objweapon);
    meansofdeath = var_d74fc41b6b10ccf5.smeansofdeath;
    if (meansofdeath == "MOD_IMPACT" && !var_ebc23f622ee9bf55) {
        return var_2bd7283211fa61e7;
    }
    if (isdefined(var_4ff11f5368011566) && var_4ff11f5368011566 != "none") {
        duration = function_a4facc27c3c73647(var_d74fc41b6b10ccf5.objweapon);
        damage_percent = function_7ee15220af294a5c(var_d74fc41b6b10ccf5.objweapon);
        var_451ebbf6c53edc68 = function_32b17fc3eff81e0a(var_d74fc41b6b10ccf5.objweapon);
        switch (var_4ff11f5368011566) {
        case #"hash_23f2c68a2fc41281":
            function_2e4d3c67e63f83ac(duration);
            break;
        case #"hash_e8f0758a10ec7618":
            slow("weapon", var_451ebbf6c53edc68, duration, var_d74fc41b6b10ccf5.eattacker);
            break;
        case #"hash_185c93a22da79530":
            charm(duration, var_d74fc41b6b10ccf5.eattacker);
            break;
        case #"hash_ab2e692ee80521f8":
            if (getdvarint(@"hash_666ee7d4e70b4c1c", 0) && meansofdeath != "MOD_UNKNOWN") {
                duration = getdvarint(@"hash_e43390f73e10b90c", 0);
                damage_percent = getdvarfloat(@"hash_c8df47ac901b11d7", 0);
                var_451ebbf6c53edc68 = getdvarint(@"hash_6236ca9688ad6f2a", 0);
            }
            burn(duration, damage_percent, var_451ebbf6c53edc68, var_d74fc41b6b10ccf5.eattacker, undefined, undefined, var_d74fc41b6b10ccf5.einflictor);
            break;
        }
    }
    return var_2bd7283211fa61e7;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab3
// Size: 0x1f2
function function_7d4c6e153055ebdc(objweapon, eattacker, smeansofdeath) {
    element = "none";
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    if (isplayer(eattacker) && istrue(level.var_bfa98c9dd6edb929) && eattacker function_2e380dedfcfc7972(objweapon)) {
        var_2632b2da60d34841 = eattacker function_87b7af080857567f(objweapon);
        if (isdefined(level.var_1b3072262db80fc1[var_2632b2da60d34841].element)) {
            element = level.var_1b3072262db80fc1[var_2632b2da60d34841].element;
        }
    } else {
        var_85240ff9a325f4d = undefined;
        if (isdefined(level.var_96c4059aa2eabfb8)) {
            var_85240ff9a325f4d = level.var_96c4059aa2eabfb8[var_225a577cbeda65c2];
        }
        if (isdefined(var_85240ff9a325f4d) && isdefined(var_85240ff9a325f4d.var_6792fe92d7b33272)) {
            element = var_85240ff9a325f4d.var_6792fe92d7b33272;
        }
    }
    if (isdefined(smeansofdeath)) {
        if (smeansofdeath == "MOD_FIRE" || smeansofdeath == "MOD_ELEMENTAL_FIRE") {
            element = "fire";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_ELEC") {
            element = "electrical";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_COLD") {
            element = "cold";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_TOXIC") {
            element = "toxic";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_DARK") {
            element = "dark";
        }
        if (smeansofdeath == "MOD_ELEMENTAL_LIGHT") {
            element = "light";
        }
        if (getdvarint(@"hash_666ee7d4e70b4c1c", 0) && (isdefined(objweapon.modifier) && issubstr(objweapon.modifier, "_db_") || isdefined(objweapon.underbarrel) && issubstr(objweapon.underbarrel, "ub_flame") && istrue(objweapon.isalternate)) && smeansofdeath != "MOD_UNKNOWN") {
            element = "fire";
        }
    }
    return element;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcad
// Size: 0x61
function function_f05759f95f2503d1(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    var_85240ff9a325f4d = undefined;
    if (isdefined(level.var_96c4059aa2eabfb8)) {
        var_85240ff9a325f4d = level.var_96c4059aa2eabfb8[var_225a577cbeda65c2];
    }
    if (isdefined(var_85240ff9a325f4d) && istrue(var_85240ff9a325f4d.var_ebc23f622ee9bf55)) {
        return 1;
    }
    return 0;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd16
// Size: 0xf6
function function_81366c086142dab6(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    var_85240ff9a325f4d = undefined;
    if (isdefined(level.var_96c4059aa2eabfb8)) {
        var_85240ff9a325f4d = level.var_96c4059aa2eabfb8[var_225a577cbeda65c2];
    }
    effect = "none";
    if (isdefined(var_85240ff9a325f4d) && isdefined(var_85240ff9a325f4d.var_4ff11f5368011566)) {
        effect = var_85240ff9a325f4d.var_4ff11f5368011566;
    }
    if (getdvarint(@"hash_666ee7d4e70b4c1c", 0) && isdefined(objweapon.modifier) && issubstr(objweapon.modifier, "_db_") || isdefined(objweapon.underbarrel) && issubstr(objweapon.underbarrel, "ub_flame") && istrue(objweapon.isalternate)) {
        effect = "burn";
    }
    return effect;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe14
// Size: 0x67
function function_a4facc27c3c73647(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    var_85240ff9a325f4d = level.var_96c4059aa2eabfb8[var_225a577cbeda65c2];
    duration = 0;
    if (isdefined(var_85240ff9a325f4d) && isdefined(var_85240ff9a325f4d.var_e6b200259be8bdba)) {
        duration = var_85240ff9a325f4d.var_e6b200259be8bdba;
    }
    return duration;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe83
// Size: 0x67
function function_7ee15220af294a5c(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    var_85240ff9a325f4d = level.var_96c4059aa2eabfb8[var_225a577cbeda65c2];
    damage_percent = 0;
    if (isdefined(var_85240ff9a325f4d) && isdefined(var_85240ff9a325f4d.var_457419727de9b293)) {
        damage_percent = var_85240ff9a325f4d.var_457419727de9b293;
    }
    return damage_percent;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef2
// Size: 0x67
function function_32b17fc3eff81e0a(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    var_85240ff9a325f4d = level.var_96c4059aa2eabfb8[var_225a577cbeda65c2];
    var_451ebbf6c53edc68 = 0;
    if (isdefined(var_85240ff9a325f4d) && isdefined(var_85240ff9a325f4d.var_6554b152bb1e35c3)) {
        var_451ebbf6c53edc68 = var_85240ff9a325f4d.var_6554b152bb1e35c3;
    }
    return var_451ebbf6c53edc68;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf61
// Size: 0x56
function function_b5af5dd435f7f00a(var_d74fc41b6b10ccf5) {
    if (isdefined(var_d74fc41b6b10ccf5.eattacker) && isdefined(var_d74fc41b6b10ccf5.eattacker.var_dec41e66d2f7fffd)) {
        return var_d74fc41b6b10ccf5.eattacker.var_dec41e66d2f7fffd;
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbf
// Size: 0x62
function function_73d296636c5ca3c6(var_d74fc41b6b10ccf5) {
    if (isdefined(self.var_691b16f55274b1c5) && isarray(self.var_691b16f55274b1c5) && istrue(self.var_691b16f55274b1c5[var_d74fc41b6b10ccf5.var_2bd7283211fa61e7])) {
        return (var_d74fc41b6b10ccf5.idamage * 1.5);
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1029
// Size: 0xe3
function function_f9c444fcf6bb992b(var_d74fc41b6b10ccf5) {
    agent = var_d74fc41b6b10ccf5.eattacker;
    if (isdefined(agent) && isagent(agent) && agent.type == "human") {
        if (isdefined(agent.var_526f1dcf41e8b261)) {
            var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage * agent.var_526f1dcf41e8b261;
        }
        if (isdefined(agent.var_46f376c7b944859b) && var_d74fc41b6b10ccf5.smeansofdeath == "MOD_MELEE" && issubstr(agent.agent_type, "shielded")) {
            var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage * agent.var_46f376c7b944859b;
        }
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1114
// Size: 0x211
function function_4948d7eacb9f12be(var_d74fc41b6b10ccf5) {
    var_f759223e4fa65752 = var_d74fc41b6b10ccf5.idamage;
    /#
        assert(isdefined(var_f759223e4fa65752));
    #/
    if (isarray(level.var_36cfc021447f6d92)) {
        for (var_347630e479972378 = 0; var_347630e479972378 < level.var_36cfc021447f6d92.size; var_347630e479972378++) {
            func = level.var_36cfc021447f6d92[var_347630e479972378];
            var_188a38cf4c902143 = self [[ func ]](var_d74fc41b6b10ccf5);
            /#
                assert(isdefined(var_188a38cf4c902143));
            #/
            if (isdefined(var_188a38cf4c902143) && var_188a38cf4c902143 != -1) {
                var_d74fc41b6b10ccf5.idamage = var_188a38cf4c902143;
                var_f759223e4fa65752 = var_188a38cf4c902143;
            }
        }
    }
    if (isarray(self.var_36cfc021447f6d92)) {
        for (var_347630e479972378 = 0; var_347630e479972378 < self.var_36cfc021447f6d92.size; var_347630e479972378++) {
            func = self.var_36cfc021447f6d92[var_347630e479972378];
            var_188a38cf4c902143 = self [[ func ]](var_d74fc41b6b10ccf5);
            /#
                assert(isdefined(var_188a38cf4c902143));
            #/
            if (isdefined(var_188a38cf4c902143) && var_188a38cf4c902143 != -1) {
                var_d74fc41b6b10ccf5.idamage = var_188a38cf4c902143;
                var_f759223e4fa65752 = var_188a38cf4c902143;
            }
        }
    }
    if (isdefined(var_d74fc41b6b10ccf5.sweapon)) {
        var_c1c1562ff63566c0 = var_d74fc41b6b10ccf5.sweapon.basename;
        if (isarray(level.var_ccb94c2ea5886365)) {
            func = level.var_ccb94c2ea5886365[var_c1c1562ff63566c0];
            if (isdefined(func)) {
                var_188a38cf4c902143 = self [[ func ]](var_d74fc41b6b10ccf5);
                if (var_188a38cf4c902143 != -1) {
                    var_d74fc41b6b10ccf5.idamage = var_188a38cf4c902143;
                    var_f759223e4fa65752 = var_188a38cf4c902143;
                }
            }
        }
        if (isarray(self.var_ccb94c2ea5886365)) {
            func = self.var_ccb94c2ea5886365[var_c1c1562ff63566c0];
            if (isdefined(func)) {
                var_188a38cf4c902143 = self [[ func ]](var_d74fc41b6b10ccf5);
                if (var_188a38cf4c902143 != -1) {
                    var_d74fc41b6b10ccf5.idamage = var_188a38cf4c902143;
                    var_f759223e4fa65752 = var_188a38cf4c902143;
                }
            }
        }
    }
    if (var_d74fc41b6b10ccf5.var_acba301fcf9d68b8 >= 0 && var_d74fc41b6b10ccf5.var_acba301fcf9d68b8 < 1 && isdefined(self.maxhealth)) {
        var_f759223e4fa65752 = min(var_f759223e4fa65752, var_d74fc41b6b10ccf5.var_acba301fcf9d68b8 * self.maxhealth);
    }
    return var_f759223e4fa65752;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132d
// Size: 0xa5
function function_71a411d4b5466318(var_d74fc41b6b10ccf5) {
    if (isdefined(var_d74fc41b6b10ccf5.var_2eb474020f9d509)) {
        b_destroyed = function_4ef84a18efbb779a(var_d74fc41b6b10ccf5.var_2eb474020f9d509, var_d74fc41b6b10ccf5.idamage, var_d74fc41b6b10ccf5.eattacker, var_d74fc41b6b10ccf5.einflictor);
        if (istrue(var_d74fc41b6b10ccf5.var_feef4b237a6beb07) && isdefined(self.var_5910081b63b4abfa)) {
            self.var_5910081b63b4abfa = self.var_5910081b63b4abfa | 512;
            if (b_destroyed) {
                self.var_5910081b63b4abfa = self.var_5910081b63b4abfa | 1024;
            }
        }
    }
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d9
// Size: 0x104
function function_89cc24cfc33e2693(var_d74fc41b6b10ccf5) {
    if (var_d74fc41b6b10ccf5.idflags != 65536) {
        if (isplayer(var_d74fc41b6b10ccf5.eattacker)) {
            rarity = var_d74fc41b6b10ccf5.eattacker function_5279067add367027(var_d74fc41b6b10ccf5.objweapon);
            var_3d400a1d02a80981 = function_d64f648b8a57d3d8(var_d74fc41b6b10ccf5.objweapon, var_d74fc41b6b10ccf5.smeansofdeath, rarity);
            var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage * var_3d400a1d02a80981;
        }
        var_4361f85b93d6dfc3 = function_b64d15c2d1631d7d(var_d74fc41b6b10ccf5.objweapon, var_d74fc41b6b10ccf5.smeansofdeath, var_d74fc41b6b10ccf5.eattacker);
        var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage * var_4361f85b93d6dfc3;
        var_d74fc41b6b10ccf5.idamage = function_afc5ebe1299256f5(var_d74fc41b6b10ccf5);
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e5
// Size: 0xab
function function_5279067add367027(objweapon) {
    var_e1a259655ce9190 = "white";
    var_dc06d61937139b33 = function_ed7c10f78d0598f2(objweapon);
    if (isdefined(var_dc06d61937139b33)) {
        switch (var_dc06d61937139b33) {
        case 0:
            var_e1a259655ce9190 = "white";
            break;
        case 1:
            var_e1a259655ce9190 = "green";
            break;
        case 2:
            var_e1a259655ce9190 = "blue";
            break;
        case 3:
            var_e1a259655ce9190 = "purple";
            break;
        case 4:
            var_e1a259655ce9190 = "orange";
            break;
        }
    }
    return var_e1a259655ce9190;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1598
// Size: 0x17a
function function_d64f648b8a57d3d8(objweapon, smeansofdeath, rarity) {
    if (is_equal(smeansofdeath, "MOD_MELEE") && !istrue(objweapon.ismelee)) {
        return 1;
    }
    var_caa1940c508ce7fa = 1;
    if (isdefined(level.var_96c4059aa2eabfb8)) {
        switch (rarity) {
        case #"hash_1393412d7401c646":
        default:
            var_caa1940c508ce7fa = function_53c4c53197386572(level.var_96c4059aa2eabfb8["rarity_settings"].var_64962e0b6ed91567, 1);
            break;
        case #"hash_883ff07272b4f9c":
            var_caa1940c508ce7fa = function_53c4c53197386572(level.var_96c4059aa2eabfb8["rarity_settings"].var_3fc24ec0bc2de11d, 1.25);
            break;
        case #"hash_778bb52ecd08072d":
            var_caa1940c508ce7fa = function_53c4c53197386572(level.var_96c4059aa2eabfb8["rarity_settings"].var_52dff081b694390, 1.5);
            break;
        case #"hash_598a30e44f53045f":
            var_caa1940c508ce7fa = function_53c4c53197386572(level.var_96c4059aa2eabfb8["rarity_settings"].var_2f4f5451344c144a, 1.75);
            break;
        case #"hash_35bb3bd014c77f4b":
            var_caa1940c508ce7fa = function_53c4c53197386572(level.var_96c4059aa2eabfb8["rarity_settings"].var_827b0c41035f0386, 2);
            break;
        }
    }
    return var_caa1940c508ce7fa;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171a
// Size: 0xc7
function function_171e93b007d03bb(var_29a8ba8c9dd43fd2) {
    var_92e4946901e59d8b = 1;
    if (isdefined(var_29a8ba8c9dd43fd2)) {
        switch (var_29a8ba8c9dd43fd2) {
        case 1:
            var_92e4946901e59d8b = function_53c4c53197386572(level.var_96c4059aa2eabfb8["pap_settings"].var_e007ac5715f424ab, 2);
            break;
        case 2:
            var_92e4946901e59d8b = function_53c4c53197386572(level.var_96c4059aa2eabfb8["pap_settings"].var_ac1ba74bafe62262, 2.5);
            break;
        case 3:
            var_92e4946901e59d8b = function_53c4c53197386572(level.var_96c4059aa2eabfb8["pap_settings"].var_a887a8da61532b15, 3);
            break;
        }
    }
    return var_92e4946901e59d8b;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e9
// Size: 0xcf
function function_677bbb1eccf8453e(objweapon, var_29a8ba8c9dd43fd2) {
    str_weapon_name = objweapon.var_9d7facbe889e667c;
    var_23c59677f17fdaee = undefined;
    if (isdefined(level.var_96c4059aa2eabfb8) && isdefined(level.var_96c4059aa2eabfb8[str_weapon_name])) {
        switch (var_29a8ba8c9dd43fd2) {
        case 1:
            var_23c59677f17fdaee = level.var_96c4059aa2eabfb8[str_weapon_name].var_f963f9dc56b73e5f;
            break;
        case 2:
            var_23c59677f17fdaee = level.var_96c4059aa2eabfb8[str_weapon_name].var_281e913b539232ce;
            break;
        case 3:
            var_23c59677f17fdaee = level.var_96c4059aa2eabfb8[str_weapon_name].var_7b6d8829dc9c7ed;
            break;
        }
    }
    return var_23c59677f17fdaee;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c0
// Size: 0xbb
function function_b64d15c2d1631d7d(objweapon, smeansofdeath, player) {
    if (!isplayer(player)) {
        return 1;
    }
    if (is_equal(smeansofdeath, "MOD_MELEE") && !istrue(objweapon.ismelee)) {
        return 1;
    }
    var_882887bafd21e4e = 1;
    var_29a8ba8c9dd43fd2 = undefined;
    if (issharedfuncdefined("zombie", "get_pap_level")) {
        var_29a8ba8c9dd43fd2 = player function_af5127390d3221e9(objweapon);
    }
    var_c54733cd1868d127 = function_677bbb1eccf8453e(objweapon, var_29a8ba8c9dd43fd2);
    var_d202cc37087c21f2 = function_171e93b007d03bb(var_29a8ba8c9dd43fd2);
    if (isdefined(var_29a8ba8c9dd43fd2)) {
        if (isdefined(var_c54733cd1868d127)) {
            var_882887bafd21e4e = var_c54733cd1868d127;
        } else {
            var_882887bafd21e4e = var_d202cc37087c21f2;
        }
    }
    return var_882887bafd21e4e;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1983
// Size: 0x75
function private function_e825787a429abdb3(weapon) {
    if (!isdefined(weapon)) {
        return 0;
    }
    var_768d659419360f70 = weapon.var_9d7facbe889e667c;
    if (!isdefined(var_768d659419360f70)) {
        return 0;
    }
    if (isdefined(level.var_96c4059aa2eabfb8)) {
        metadata = level.var_96c4059aa2eabfb8[var_768d659419360f70];
        if (isdefined(metadata) && isdefined(metadata.var_16740eb88c3c21fa)) {
            return metadata.var_16740eb88c3c21fa;
        }
    }
    return 0;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a00
// Size: 0x184
function private function_afc5ebe1299256f5(var_d74fc41b6b10ccf5) {
    if (!isplayer(var_d74fc41b6b10ccf5.eattacker) || var_d74fc41b6b10ccf5.smeansofdeath == "MOD_MELEE" || function_e825787a429abdb3(var_d74fc41b6b10ccf5.objweapon)) {
        return var_d74fc41b6b10ccf5.idamage;
    }
    if (isdefined(var_d74fc41b6b10ccf5.var_2eb474020f9d509)) {
        var_e30653cc783403d6 = function_4b44008810022d21(var_d74fc41b6b10ccf5.var_2eb474020f9d509, "Types_Weakspot");
        if (isdefined(var_e30653cc783403d6)) {
            /#
                if (!getdvarint(@"hash_2cbf00f3fb539237", 1)) {
                    iprintln("cold" + var_d74fc41b6b10ccf5.var_2eb474020f9d509);
                }
            #/
            var_d74fc41b6b10ccf5.var_14edc6d1db3695bc = 1;
            var_7a4e76731efbbc07 = 0;
            var_4017a57c0bba213e = function_59957d924fbc58e0(var_d74fc41b6b10ccf5.objweapon, "head");
            if (isdefined(var_4017a57c0bba213e)) {
                var_7a4e76731efbbc07 = var_7a4e76731efbbc07 + var_d74fc41b6b10ccf5.idamage * (var_4017a57c0bba213e - 1);
            }
            var_7a4e76731efbbc07 = var_7a4e76731efbbc07 + var_d74fc41b6b10ccf5.idamage * function_53c4c53197386572(var_e30653cc783403d6.var_779d8b41b8ca36d7, 0);
            var_b5059f8895137b40 = var_d74fc41b6b10ccf5.idamage + var_7a4e76731efbbc07;
            if (isdefined(var_d74fc41b6b10ccf5.eattacker.var_ae9b30f13abd35fc)) {
                var_b5059f8895137b40 = var_b5059f8895137b40 * var_d74fc41b6b10ccf5.eattacker.var_ae9b30f13abd35fc;
            }
            return var_b5059f8895137b40;
        }
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8c
// Size: 0x85
function function_6b8e5b333b2b3e43(var_d74fc41b6b10ccf5) {
    if (isplayer(var_d74fc41b6b10ccf5.eattacker) && isdefined(var_d74fc41b6b10ccf5.var_2eb474020f9d509)) {
        var_52520b9abaee3da5 = function_4b44008810022d21(var_d74fc41b6b10ccf5.var_2eb474020f9d509, "Types_Armor");
        if (isdefined(var_52520b9abaee3da5)) {
            var_d74fc41b6b10ccf5.var_feef4b237a6beb07 = 1;
            var_d74fc41b6b10ccf5.var_eb9031281d703c09 = var_52520b9abaee3da5.damagemod;
        }
    }
    return var_d74fc41b6b10ccf5.var_feef4b237a6beb07;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c19
// Size: 0x94
function function_10a52a9d2dcaf262(var_d74fc41b6b10ccf5) {
    if (istrue(var_d74fc41b6b10ccf5.var_feef4b237a6beb07)) {
        var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage * var_d74fc41b6b10ccf5.var_eb9031281d703c09;
        var_189da76068290292 = function_59957d924fbc58e0(var_d74fc41b6b10ccf5.objweapon, var_d74fc41b6b10ccf5.shitloc);
        if (isdefined(var_189da76068290292) && var_189da76068290292 != 0) {
            var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage / var_189da76068290292;
        }
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb5
// Size: 0xc6
function function_63e1cb89f73d0ad8(var_d74fc41b6b10ccf5) {
    if (!istrue(var_d74fc41b6b10ccf5.var_feef4b237a6beb07) && (var_d74fc41b6b10ccf5.shitloc == "head" || var_d74fc41b6b10ccf5.shitloc == "neck" || var_d74fc41b6b10ccf5.shitloc == "helmet") && var_d74fc41b6b10ccf5.smeansofdeath != "MOD_MELEE") {
        var_189da76068290292 = function_59957d924fbc58e0(var_d74fc41b6b10ccf5.objweapon, var_d74fc41b6b10ccf5.shitloc);
        if (isdefined(var_189da76068290292) && var_189da76068290292 != 0) {
            var_d74fc41b6b10ccf5.idamage = var_d74fc41b6b10ccf5.idamage / var_189da76068290292;
        }
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d83
// Size: 0x83
function function_5c8a92a87ae9751b(eattacker, var_feef4b237a6beb07, var_2eb474020f9d509, var_620a78a003c02280) {
    if (!isdefined(var_620a78a003c02280)) {
        var_620a78a003c02280 = "hitarmor";
    }
    self endon("death");
    self endon("metabone_destroyed");
    msg = waittill_any_timeout_1(0.5, "metabone_damaged_not_destroyed");
    if (msg == "timeout") {
        return;
    }
    if (isplayer(eattacker) && istrue(var_feef4b237a6beb07) && isdefined(var_2eb474020f9d509)) {
        eattacker updateDamageFeedback_SharedFunc(var_620a78a003c02280);
    }
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0d
// Size: 0x7c
function function_45500125495e46a6(eattacker, var_feef4b237a6beb07, var_2eb474020f9d509, var_e629a8e925c6d0af) {
    if (!isdefined(var_e629a8e925c6d0af)) {
        var_e629a8e925c6d0af = "hitarmorbreak";
    }
    self endon("death");
    msg = waittill_any_timeout_1(0.5, "metabone_destroyed");
    if (msg == "timeout") {
        return;
    }
    if (isplayer(eattacker) && istrue(var_feef4b237a6beb07) && isdefined(var_2eb474020f9d509)) {
        eattacker updateDamageFeedback_SharedFunc(var_e629a8e925c6d0af);
    }
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e90
// Size: 0x95
function function_ba2823ac0204930c(var_d74fc41b6b10ccf5) {
    if (isdefined(level.var_99a0ddbdeb40f977) && isdefined(var_d74fc41b6b10ccf5.objweapon) && isdefined(var_d74fc41b6b10ccf5.objweapon.basename) && isdefined(level.var_99a0ddbdeb40f977[var_d74fc41b6b10ccf5.objweapon.basename])) {
        return [[ level.var_99a0ddbdeb40f977[var_d74fc41b6b10ccf5.objweapon.basename] ]](var_d74fc41b6b10ccf5);
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2d
// Size: 0x1a5
function function_bc7da5341862e4e0(var_d74fc41b6b10ccf5) {
    var_1e0b2c127d2be63e = undefined;
    if (isdefined(var_d74fc41b6b10ccf5.eattacker)) {
        var_1e0b2c127d2be63e = var_d74fc41b6b10ccf5.eattacker;
    } else {
        var_1e0b2c127d2be63e = var_d74fc41b6b10ccf5.einflictor;
    }
    if (isdefined(var_d74fc41b6b10ccf5.smeansofdeath)) {
        if (var_d74fc41b6b10ccf5.smeansofdeath == "MOD_CRUSH") {
            if (isdefined(var_1e0b2c127d2be63e) && var_1e0b2c127d2be63e namespace_dbbb37eb352edf96::isvehicle()) {
                if (var_1e0b2c127d2be63e vehicle_getspeed() > 5) {
                    if (self.aicategory == "normal") {
                        return self.health;
                    } else if (getdvarint(@"hash_52daf1fb76b3dd86", 0) != 1) {
                        var_73069b4add1e8094 = "difficulty_easy";
                        var_c40c7a14462edbe6 = var_d74fc41b6b10ccf5.idamage * getdvarfloat(@"hash_c0702b410287faf1", 1);
                        if (isfunction(level.var_8241e0d86017df29)) {
                            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](var_1e0b2c127d2be63e.origin);
                        }
                        switch (var_73069b4add1e8094) {
                        case #"hash_af83e47edfa8900a":
                            var_c40c7a14462edbe6 = var_c40c7a14462edbe6 * getdvarfloat(@"hash_c07028410287f458", 2);
                            break;
                        case #"hash_5343b465e56ec9a4":
                            var_c40c7a14462edbe6 = var_c40c7a14462edbe6 * getdvarfloat(@"hash_c07029410287f68b", 5);
                            break;
                        case #"hash_651f76c0ad6741ec":
                            var_c40c7a14462edbe6 = var_c40c7a14462edbe6 * getdvarfloat(@"hash_c0702e410288018a", 10);
                            break;
                        }
                        return var_c40c7a14462edbe6;
                    }
                }
            }
        }
    }
    return var_d74fc41b6b10ccf5.idamage;
}

// Namespace zombie_damage/namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20da
// Size: 0x72
function function_942afcb4f4e24091(var_d74fc41b6b10ccf5) {
    if (!isdefined(var_d74fc41b6b10ccf5.objweapon) || !var_d74fc41b6b10ccf5.objweapon.isalternate) {
        return var_d74fc41b6b10ccf5.idamage;
    }
    if (issharedfuncdefined("zombie", "scale_underbarrel_damage")) {
        var_d74fc41b6b10ccf5.idamage = function_1ae8c41da6a042c3(var_d74fc41b6b10ccf5);
    }
    return var_d74fc41b6b10ccf5.idamage;
}

