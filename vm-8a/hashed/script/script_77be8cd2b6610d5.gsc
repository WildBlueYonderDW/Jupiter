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

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x42f
// Size: 0x120
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

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557
// Size: 0xa0
function function_4361b33933cb779d(params) {
    return function_34e78cbd2dfff6df(params.einflictor, params.eattacker, params.idamage, params.idflags, params.smeansofdeath, params.sweapon, params.vpoint, params.vdir, params.shitloc, params.timeoffset, params.modelindex, params.partname, params.objweapon);
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x600
// Size: 0x1ae
function function_34e78cbd2dfff6df(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    dmg_struct = spawnstruct();
    dmg_struct.einflictor = einflictor;
    dmg_struct.eattacker = eattacker;
    dmg_struct.idamage = idamage;
    dmg_struct.idflags = idflags;
    dmg_struct.smeansofdeath = smeansofdeath;
    dmg_struct.sweapon = sweapon;
    dmg_struct.vpoint = vpoint;
    dmg_struct.vdir = vdir;
    dmg_struct.shitloc = shitloc;
    dmg_struct.timeoffset = timeoffset;
    dmg_struct.modelindex = modelindex;
    dmg_struct.partname = partname;
    dmg_struct.objweapon = objweapon;
    dmg_struct.var_14edc6d1db3695bc = 0;
    dmg_struct.var_feef4b237a6beb07 = 0;
    dmg_struct.damagemaxhealthcap = 1;
    if (function_df9189c2ea1a100d()) {
        dmg_struct.metabonename = function_e3bec440b7001e99(dmg_struct);
    } else {
        dmg_struct.metabonename = function_ae12b32b13b42c5e(shitloc, vdir);
        if (!isdefined(dmg_struct.metabonename)) {
            dmg_struct.metabonename = function_b8f2b0917b1d3c98(vpoint, vdir);
        }
    }
    return dmg_struct;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b7
// Size: 0xfc
function function_b8fd1823ea584538(eattacker, objweapon, smeansofdeath) {
    if (isplayer(eattacker) && is_equal(self.team, eattacker.team)) {
        return true;
    }
    if (is_equal(eattacker, self) && namespace_c56b0b75fd51eab1::function_8ce7894f1a52fb77("charm")) {
        return true;
    }
    var_225a577cbeda65c2 = function_f581838ce4328f7a(objweapon);
    if (ent_flag("deadwire_stunned") && smeansofdeath == "MOD_ELEMENTAL_ELEC") {
        hasammomod = istrue(level.var_bfa98c9dd6edb929) && eattacker function_2e380dedfcfc7972(objweapon);
        if (istrue(hasammomod) && eattacker function_87b7af080857567f(objweapon) == "deadwire") {
            return false;
        }
    } else if (ent_flag("deadwire_stunned") && isdefined(self.aicategory) && self.aicategory == "normal") {
        return true;
    }
    return false;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bc
// Size: 0x1ee
function function_6a3d1a2884883a23(dmg_struct) {
    var_2bd7283211fa61e7 = get_element(dmg_struct.objweapon, dmg_struct.eattacker, dmg_struct.smeansofdeath);
    statuseffecttype = function_81366c086142dab6(dmg_struct.objweapon);
    var_ebc23f622ee9bf55 = function_f05759f95f2503d1(dmg_struct.objweapon);
    meansofdeath = dmg_struct.smeansofdeath;
    if (meansofdeath == "MOD_IMPACT" && !var_ebc23f622ee9bf55) {
        return var_2bd7283211fa61e7;
    }
    if (isdefined(statuseffecttype) && statuseffecttype != "none") {
        duration = function_a4facc27c3c73647(dmg_struct.objweapon);
        damage_percent = function_7ee15220af294a5c(dmg_struct.objweapon);
        tick = function_32b17fc3eff81e0a(dmg_struct.objweapon);
        switch (statuseffecttype) {
        case #"hash_23f2c68a2fc41281": 
            function_2e4d3c67e63f83ac(duration);
            break;
        case #"hash_e8f0758a10ec7618": 
            slow("weapon", tick, duration, dmg_struct.eattacker);
            break;
        case #"hash_185c93a22da79530": 
            charm(duration, dmg_struct.eattacker);
            break;
        case #"hash_ab2e692ee80521f8": 
            if (getdvarint(@"hash_666ee7d4e70b4c1c", 0) && meansofdeath != "MOD_UNKNOWN") {
                duration = getdvarint(@"hash_e43390f73e10b90c", 0);
                damage_percent = getdvarfloat(@"hash_c8df47ac901b11d7", 0);
                tick = getdvarint(@"hash_6236ca9688ad6f2a", 0);
            }
            burn(duration, damage_percent, tick, dmg_struct.eattacker, undefined, undefined, dmg_struct.einflictor);
            break;
        }
    }
    return var_2bd7283211fa61e7;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab3
// Size: 0x1f1
function get_element(objweapon, eattacker, smeansofdeath) {
    element = "none";
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    if (isplayer(eattacker) && istrue(level.var_bfa98c9dd6edb929) && eattacker function_2e380dedfcfc7972(objweapon)) {
        var_2632b2da60d34841 = eattacker function_87b7af080857567f(objweapon);
        if (isdefined(level.ammo_mods[var_2632b2da60d34841].element)) {
            element = level.ammo_mods[var_2632b2da60d34841].element;
        }
    } else {
        weaponbundle = undefined;
        if (isdefined(level.weaponmetadata)) {
            weaponbundle = level.weaponmetadata[var_225a577cbeda65c2];
        }
        if (isdefined(weaponbundle) && isdefined(weaponbundle.elementdamagetype)) {
            element = weaponbundle.elementdamagetype;
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

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcad
// Size: 0x60
function function_f05759f95f2503d1(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    weaponbundle = undefined;
    if (isdefined(level.weaponmetadata)) {
        weaponbundle = level.weaponmetadata[var_225a577cbeda65c2];
    }
    if (isdefined(weaponbundle) && istrue(weaponbundle.var_ebc23f622ee9bf55)) {
        return true;
    }
    return false;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd16
// Size: 0xf5
function function_81366c086142dab6(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    weaponbundle = undefined;
    if (isdefined(level.weaponmetadata)) {
        weaponbundle = level.weaponmetadata[var_225a577cbeda65c2];
    }
    effect = "none";
    if (isdefined(weaponbundle) && isdefined(weaponbundle.statuseffecttype)) {
        effect = weaponbundle.statuseffecttype;
    }
    if (getdvarint(@"hash_666ee7d4e70b4c1c", 0) && isdefined(objweapon.modifier) && issubstr(objweapon.modifier, "_db_") || isdefined(objweapon.underbarrel) && issubstr(objweapon.underbarrel, "ub_flame") && istrue(objweapon.isalternate)) {
        effect = "burn";
    }
    return effect;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe14
// Size: 0x66
function function_a4facc27c3c73647(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    weaponbundle = level.weaponmetadata[var_225a577cbeda65c2];
    duration = 0;
    if (isdefined(weaponbundle) && isdefined(weaponbundle.statuseffectduration)) {
        duration = weaponbundle.statuseffectduration;
    }
    return duration;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe83
// Size: 0x66
function function_7ee15220af294a5c(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    weaponbundle = level.weaponmetadata[var_225a577cbeda65c2];
    damage_percent = 0;
    if (isdefined(weaponbundle) && isdefined(weaponbundle.statuseffectdamage)) {
        damage_percent = weaponbundle.statuseffectdamage;
    }
    return damage_percent;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef2
// Size: 0x66
function function_32b17fc3eff81e0a(objweapon) {
    var_225a577cbeda65c2 = objweapon.var_9d7facbe889e667c;
    weaponbundle = level.weaponmetadata[var_225a577cbeda65c2];
    tick = 0;
    if (isdefined(weaponbundle) && isdefined(weaponbundle.statuseffecttick)) {
        tick = weaponbundle.statuseffecttick;
    }
    return tick;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf61
// Size: 0x55
function function_b5af5dd435f7f00a(dmg_struct) {
    if (isdefined(dmg_struct.eattacker) && isdefined(dmg_struct.eattacker.var_dec41e66d2f7fffd)) {
        return dmg_struct.eattacker.var_dec41e66d2f7fffd;
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbf
// Size: 0x61
function function_73d296636c5ca3c6(dmg_struct) {
    if (isdefined(self.var_691b16f55274b1c5) && isarray(self.var_691b16f55274b1c5) && istrue(self.var_691b16f55274b1c5[dmg_struct.var_2bd7283211fa61e7])) {
        return (dmg_struct.idamage * 1.5);
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1029
// Size: 0xe2
function function_f9c444fcf6bb992b(dmg_struct) {
    agent = dmg_struct.eattacker;
    if (isdefined(agent) && isagent(agent) && agent.type == "human") {
        if (isdefined(agent.var_526f1dcf41e8b261)) {
            dmg_struct.idamage *= agent.var_526f1dcf41e8b261;
        }
        if (isdefined(agent.var_46f376c7b944859b) && dmg_struct.smeansofdeath == "MOD_MELEE" && issubstr(agent.agent_type, "shielded")) {
            dmg_struct.idamage *= agent.var_46f376c7b944859b;
        }
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1114
// Size: 0x210
function function_4948d7eacb9f12be(dmg_struct) {
    adjusteddamage = dmg_struct.idamage;
    assert(isdefined(adjusteddamage));
    if (isarray(level.var_36cfc021447f6d92)) {
        for (func_index = 0; func_index < level.var_36cfc021447f6d92.size; func_index++) {
            func = level.var_36cfc021447f6d92[func_index];
            new_damage = self [[ func ]](dmg_struct);
            assert(isdefined(new_damage));
            if (isdefined(new_damage) && new_damage != -1) {
                dmg_struct.idamage = new_damage;
                adjusteddamage = new_damage;
            }
        }
    }
    if (isarray(self.var_36cfc021447f6d92)) {
        for (func_index = 0; func_index < self.var_36cfc021447f6d92.size; func_index++) {
            func = self.var_36cfc021447f6d92[func_index];
            new_damage = self [[ func ]](dmg_struct);
            assert(isdefined(new_damage));
            if (isdefined(new_damage) && new_damage != -1) {
                dmg_struct.idamage = new_damage;
                adjusteddamage = new_damage;
            }
        }
    }
    if (isdefined(dmg_struct.sweapon)) {
        weapon_basename = dmg_struct.sweapon.basename;
        if (isarray(level.var_ccb94c2ea5886365)) {
            func = level.var_ccb94c2ea5886365[weapon_basename];
            if (isdefined(func)) {
                new_damage = self [[ func ]](dmg_struct);
                if (new_damage != -1) {
                    dmg_struct.idamage = new_damage;
                    adjusteddamage = new_damage;
                }
            }
        }
        if (isarray(self.var_ccb94c2ea5886365)) {
            func = self.var_ccb94c2ea5886365[weapon_basename];
            if (isdefined(func)) {
                new_damage = self [[ func ]](dmg_struct);
                if (new_damage != -1) {
                    dmg_struct.idamage = new_damage;
                    adjusteddamage = new_damage;
                }
            }
        }
    }
    if (dmg_struct.damagemaxhealthcap >= 0 && dmg_struct.damagemaxhealthcap < 1 && isdefined(self.maxhealth)) {
        adjusteddamage = min(adjusteddamage, dmg_struct.damagemaxhealthcap * self.maxhealth);
    }
    return adjusteddamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132d
// Size: 0xa4
function function_71a411d4b5466318(dmg_struct) {
    if (isdefined(dmg_struct.metabonename)) {
        b_destroyed = function_4ef84a18efbb779a(dmg_struct.metabonename, dmg_struct.idamage, dmg_struct.eattacker, dmg_struct.einflictor);
        if (istrue(dmg_struct.var_feef4b237a6beb07) && isdefined(self.modifiedidflags)) {
            self.modifiedidflags |= 512;
            if (b_destroyed) {
                self.modifiedidflags |= 1024;
            }
        }
    }
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d9
// Size: 0x103
function function_89cc24cfc33e2693(dmg_struct) {
    if (dmg_struct.idflags != 65536) {
        if (isplayer(dmg_struct.eattacker)) {
            rarity = dmg_struct.eattacker get_rarity(dmg_struct.objweapon);
            var_3d400a1d02a80981 = function_d64f648b8a57d3d8(dmg_struct.objweapon, dmg_struct.smeansofdeath, rarity);
            dmg_struct.idamage *= var_3d400a1d02a80981;
        }
        var_4361f85b93d6dfc3 = function_b64d15c2d1631d7d(dmg_struct.objweapon, dmg_struct.smeansofdeath, dmg_struct.eattacker);
        dmg_struct.idamage *= var_4361f85b93d6dfc3;
        dmg_struct.idamage = function_afc5ebe1299256f5(dmg_struct);
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e5
// Size: 0xaa
function get_rarity(objweapon) {
    returnrarity = "white";
    rarity_weapon = function_ed7c10f78d0598f2(objweapon);
    if (isdefined(rarity_weapon)) {
        switch (rarity_weapon) {
        case 0: 
            returnrarity = "white";
            break;
        case 1: 
            returnrarity = "green";
            break;
        case 2: 
            returnrarity = "blue";
            break;
        case 3: 
            returnrarity = "purple";
            break;
        case 4: 
            returnrarity = "orange";
            break;
        }
    }
    return returnrarity;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1598
// Size: 0x179
function function_d64f648b8a57d3d8(objweapon, smeansofdeath, rarity) {
    if (is_equal(smeansofdeath, "MOD_MELEE") && !istrue(objweapon.ismelee)) {
        return 1;
    }
    damagemult = 1;
    if (isdefined(level.weaponmetadata)) {
        switch (rarity) {
        case #"hash_1393412d7401c646":
        default: 
            damagemult = default_to(level.weaponmetadata["rarity_settings"].var_64962e0b6ed91567, 1);
            break;
        case #"hash_883ff07272b4f9c": 
            damagemult = default_to(level.weaponmetadata["rarity_settings"].var_3fc24ec0bc2de11d, 1.25);
            break;
        case #"hash_778bb52ecd08072d": 
            damagemult = default_to(level.weaponmetadata["rarity_settings"].var_52dff081b694390, 1.5);
            break;
        case #"hash_598a30e44f53045f": 
            damagemult = default_to(level.weaponmetadata["rarity_settings"].var_2f4f5451344c144a, 1.75);
            break;
        case #"hash_35bb3bd014c77f4b": 
            damagemult = default_to(level.weaponmetadata["rarity_settings"].var_827b0c41035f0386, 2);
            break;
        }
    }
    return damagemult;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171a
// Size: 0xc6
function function_171e93b007d03bb(var_29a8ba8c9dd43fd2) {
    var_92e4946901e59d8b = 1;
    if (isdefined(var_29a8ba8c9dd43fd2)) {
        switch (var_29a8ba8c9dd43fd2) {
        case 1: 
            var_92e4946901e59d8b = default_to(level.weaponmetadata["pap_settings"].var_e007ac5715f424ab, 2);
            break;
        case 2: 
            var_92e4946901e59d8b = default_to(level.weaponmetadata["pap_settings"].var_ac1ba74bafe62262, 2.5);
            break;
        case 3: 
            var_92e4946901e59d8b = default_to(level.weaponmetadata["pap_settings"].var_a887a8da61532b15, 3);
            break;
        }
    }
    return var_92e4946901e59d8b;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e9
// Size: 0xce
function function_677bbb1eccf8453e(objweapon, var_29a8ba8c9dd43fd2) {
    str_weapon_name = objweapon.var_9d7facbe889e667c;
    var_23c59677f17fdaee = undefined;
    if (isdefined(level.weaponmetadata) && isdefined(level.weaponmetadata[str_weapon_name])) {
        switch (var_29a8ba8c9dd43fd2) {
        case 1: 
            var_23c59677f17fdaee = level.weaponmetadata[str_weapon_name].var_f963f9dc56b73e5f;
            break;
        case 2: 
            var_23c59677f17fdaee = level.weaponmetadata[str_weapon_name].var_281e913b539232ce;
            break;
        case 3: 
            var_23c59677f17fdaee = level.weaponmetadata[str_weapon_name].var_7b6d8829dc9c7ed;
            break;
        }
    }
    return var_23c59677f17fdaee;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c0
// Size: 0xba
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

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1983
// Size: 0x74
function private function_e825787a429abdb3(weapon) {
    if (!isdefined(weapon)) {
        return 0;
    }
    var_768d659419360f70 = weapon.var_9d7facbe889e667c;
    if (!isdefined(var_768d659419360f70)) {
        return 0;
    }
    if (isdefined(level.weaponmetadata)) {
        metadata = level.weaponmetadata[var_768d659419360f70];
        if (isdefined(metadata) && isdefined(metadata.var_16740eb88c3c21fa)) {
            return metadata.var_16740eb88c3c21fa;
        }
    }
    return 0;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a00
// Size: 0x183
function private function_afc5ebe1299256f5(dmg_struct) {
    if (!isplayer(dmg_struct.eattacker) || dmg_struct.smeansofdeath == "MOD_MELEE" || function_e825787a429abdb3(dmg_struct.objweapon)) {
        return dmg_struct.idamage;
    }
    if (isdefined(dmg_struct.metabonename)) {
        weakspot_data = function_4b44008810022d21(dmg_struct.metabonename, "Types_Weakspot");
        if (isdefined(weakspot_data)) {
            /#
                if (!getdvarint(@"hash_2cbf00f3fb539237", 1)) {
                    iprintln("<dev string:x1c>" + dmg_struct.metabonename);
                }
            #/
            dmg_struct.var_14edc6d1db3695bc = 1;
            additional_dmg = 0;
            var_4017a57c0bba213e = function_59957d924fbc58e0(dmg_struct.objweapon, "head");
            if (isdefined(var_4017a57c0bba213e)) {
                additional_dmg += dmg_struct.idamage * (var_4017a57c0bba213e - 1);
            }
            additional_dmg += dmg_struct.idamage * default_to(weakspot_data.additionaldamagemod, 0);
            final_dmg = dmg_struct.idamage + additional_dmg;
            if (isdefined(dmg_struct.eattacker.var_ae9b30f13abd35fc)) {
                final_dmg *= dmg_struct.eattacker.var_ae9b30f13abd35fc;
            }
            return final_dmg;
        }
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8c
// Size: 0x84
function function_6b8e5b333b2b3e43(dmg_struct) {
    if (isplayer(dmg_struct.eattacker) && isdefined(dmg_struct.metabonename)) {
        armor_data = function_4b44008810022d21(dmg_struct.metabonename, "Types_Armor");
        if (isdefined(armor_data)) {
            dmg_struct.var_feef4b237a6beb07 = 1;
            dmg_struct.var_eb9031281d703c09 = armor_data.damagemod;
        }
    }
    return dmg_struct.var_feef4b237a6beb07;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c19
// Size: 0x93
function function_10a52a9d2dcaf262(dmg_struct) {
    if (istrue(dmg_struct.var_feef4b237a6beb07)) {
        dmg_struct.idamage *= dmg_struct.var_eb9031281d703c09;
        dmgmodifier = function_59957d924fbc58e0(dmg_struct.objweapon, dmg_struct.shitloc);
        if (isdefined(dmgmodifier) && dmgmodifier != 0) {
            dmg_struct.idamage /= dmgmodifier;
        }
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb5
// Size: 0xc5
function function_63e1cb89f73d0ad8(dmg_struct) {
    if (!istrue(dmg_struct.var_feef4b237a6beb07) && (dmg_struct.shitloc == "head" || dmg_struct.shitloc == "neck" || dmg_struct.shitloc == "helmet") && dmg_struct.smeansofdeath != "MOD_MELEE") {
        dmgmodifier = function_59957d924fbc58e0(dmg_struct.objweapon, dmg_struct.shitloc);
        if (isdefined(dmgmodifier) && dmgmodifier != 0) {
            dmg_struct.idamage /= dmgmodifier;
        }
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d83
// Size: 0x82
function function_5c8a92a87ae9751b(eattacker, var_feef4b237a6beb07, metabonename, armor_hitmarker) {
    if (!isdefined(armor_hitmarker)) {
        armor_hitmarker = "hitarmor";
    }
    self endon("death");
    self endon("metabone_destroyed");
    msg = waittill_any_timeout_1(0.5, "metabone_damaged_not_destroyed");
    if (msg == "timeout") {
        return;
    }
    if (isplayer(eattacker) && istrue(var_feef4b237a6beb07) && isdefined(metabonename)) {
        eattacker updateDamageFeedback_SharedFunc(armor_hitmarker);
    }
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0d
// Size: 0x7b
function function_45500125495e46a6(eattacker, var_feef4b237a6beb07, metabonename, var_e629a8e925c6d0af) {
    if (!isdefined(var_e629a8e925c6d0af)) {
        var_e629a8e925c6d0af = "hitarmorbreak";
    }
    self endon("death");
    msg = waittill_any_timeout_1(0.5, "metabone_destroyed");
    if (msg == "timeout") {
        return;
    }
    if (isplayer(eattacker) && istrue(var_feef4b237a6beb07) && isdefined(metabonename)) {
        eattacker updateDamageFeedback_SharedFunc(var_e629a8e925c6d0af);
    }
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e90
// Size: 0x94
function function_ba2823ac0204930c(dmg_struct) {
    if (isdefined(level.var_99a0ddbdeb40f977) && isdefined(dmg_struct.objweapon) && isdefined(dmg_struct.objweapon.basename) && isdefined(level.var_99a0ddbdeb40f977[dmg_struct.objweapon.basename])) {
        return [[ level.var_99a0ddbdeb40f977[dmg_struct.objweapon.basename] ]](dmg_struct);
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2d
// Size: 0x1a4
function function_bc7da5341862e4e0(dmg_struct) {
    attackent = undefined;
    if (isdefined(dmg_struct.eattacker)) {
        attackent = dmg_struct.eattacker;
    } else {
        attackent = dmg_struct.einflictor;
    }
    if (isdefined(dmg_struct.smeansofdeath)) {
        if (dmg_struct.smeansofdeath == "MOD_CRUSH") {
            if (isdefined(attackent) && attackent scripts\common\vehicle::isvehicle()) {
                if (attackent vehicle_getspeed() > 5) {
                    if (self.aicategory == "normal") {
                        return self.health;
                    } else if (getdvarint(@"hash_52daf1fb76b3dd86", 0) != 1) {
                        regiondifficulty = "difficulty_easy";
                        var_c40c7a14462edbe6 = dmg_struct.idamage * getdvarfloat(@"hash_c0702b410287faf1", 1);
                        if (isfunction(level.var_8241e0d86017df29)) {
                            regiondifficulty = [[ level.var_8241e0d86017df29 ]](attackent.origin);
                        }
                        switch (regiondifficulty) {
                        case #"hash_af83e47edfa8900a": 
                            var_c40c7a14462edbe6 *= getdvarfloat(@"hash_c07028410287f458", 2);
                            break;
                        case #"hash_5343b465e56ec9a4": 
                            var_c40c7a14462edbe6 *= getdvarfloat(@"hash_c07029410287f68b", 5);
                            break;
                        case #"hash_651f76c0ad6741ec": 
                            var_c40c7a14462edbe6 *= getdvarfloat(@"hash_c0702e410288018a", 10);
                            break;
                        }
                        return var_c40c7a14462edbe6;
                    }
                }
            }
        }
    }
    return dmg_struct.idamage;
}

// Namespace zombie_damage / namespace_28253c2ed4569abd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20da
// Size: 0x71
function function_942afcb4f4e24091(dmg_struct) {
    if (!isdefined(dmg_struct.objweapon) || !dmg_struct.objweapon.isalternate) {
        return dmg_struct.idamage;
    }
    if (issharedfuncdefined("zombie", "scale_underbarrel_damage")) {
        dmg_struct.idamage = function_1ae8c41da6a042c3(dmg_struct);
    }
    return dmg_struct.idamage;
}

