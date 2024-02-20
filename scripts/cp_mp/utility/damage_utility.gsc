// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_25ead30c6ed027fb;

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x354
// Size: 0xce
function adddamagemodifier(id, modifier, additive, var_9e3a69e8e82478bd) {
    if (!isdefined(additive)) {
        additive = 1;
    }
    if (additive) {
        if (!isdefined(self.additivedamagemodifiers)) {
            self.additivedamagemodifiers = [];
        }
        self.additivedamagemodifiers[id] = modifier;
        if (isdefined(var_9e3a69e8e82478bd)) {
            if (!isdefined(self.additivedamagemodifierignorefuncs)) {
                self.additivedamagemodifierignorefuncs = [];
            }
            self.additivedamagemodifierignorefuncs[id] = var_9e3a69e8e82478bd;
        }
    } else {
        if (!isdefined(self.multiplicativedamagemodifiers)) {
            self.multiplicativedamagemodifiers = [];
        }
        self.multiplicativedamagemodifiers[id] = modifier;
        if (isdefined(var_9e3a69e8e82478bd)) {
            if (!isdefined(self.multiplicativedamagemodifierignorefuncs)) {
                self.multiplicativedamagemodifierignorefuncs = [];
            }
            self.multiplicativedamagemodifierignorefuncs[id] = var_9e3a69e8e82478bd;
        }
    }
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x429
// Size: 0x88
function removedamagemodifier(id, additive) {
    if (!isdefined(additive)) {
        additive = 1;
    }
    if (additive) {
        if (!isdefined(self.additivedamagemodifiers)) {
            return;
        }
        self.additivedamagemodifiers[id] = undefined;
        if (!isdefined(self.additivedamagemodifierignorefuncs)) {
            return;
        }
        self.additivedamagemodifierignorefuncs[id] = undefined;
    } else {
        if (!isdefined(self.multiplicativedamagemodifiers)) {
            return;
        }
        self.multiplicativedamagemodifiers[id] = undefined;
        if (!isdefined(self.multiplicativedamagemodifierignorefuncs)) {
            return;
        }
        self.multiplicativedamagemodifierignorefuncs[id] = undefined;
    }
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b8
// Size: 0x19e
function getdamagemodifiertotal(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    var_c8e219b403b2e789 = 1;
    if (isdefined(self.additivedamagemodifiers)) {
        foreach (index, modifier in self.additivedamagemodifiers) {
            var_8411c7d6ac406b06 = 0;
            if (isdefined(self.additivedamagemodifierignorefuncs) && isdefined(self.additivedamagemodifierignorefuncs[index])) {
                var_8411c7d6ac406b06 = [[ self.additivedamagemodifierignorefuncs[index] ]](inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc);
            }
            if (!var_8411c7d6ac406b06) {
                var_c8e219b403b2e789 = var_c8e219b403b2e789 + modifier - 1;
            }
        }
    }
    var_1cbf01d0df82cde7 = 1;
    if (isdefined(self.multiplicativedamagemodifiers)) {
        foreach (index, modifier in self.multiplicativedamagemodifiers) {
            var_8411c7d6ac406b06 = 0;
            if (isdefined(self.multiplicativedamagemodifierignorefuncs) && isdefined(self.multiplicativedamagemodifierignorefuncs[index])) {
                var_8411c7d6ac406b06 = [[ self.multiplicativedamagemodifierignorefuncs[index] ]](inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc);
            }
            if (!var_8411c7d6ac406b06) {
                var_1cbf01d0df82cde7 = var_1cbf01d0df82cde7 * modifier;
            }
        }
    }
    return var_c8e219b403b2e789 * var_1cbf01d0df82cde7;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e
// Size: 0x2b
function cleardamagemodifiers() {
    self.additivedamagemodifiers = [];
    self.multiplicativedamagemodifiers = [];
    self.additivedamagemodifierignorefuncs = [];
    self.multiplicativedamagemodifierignorefuncs = [];
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x690
// Size: 0x1a3
function packdamagedata(attacker, victim, damage, objweapon, meansofdeath, inflictor, point, direction_vec, modelname, var_799f234362adb813, partname, tagname, idflags, eventid, hitloc, var_1da1a66b5c6a06a7) {
    struct = spawnstruct();
    struct.attacker = attacker;
    struct.victim = victim;
    struct.damage = damage;
    struct.objweapon = objweapon;
    struct.meansofdeath = meansofdeath;
    struct.inflictor = inflictor;
    struct.point = point;
    struct.direction_vec = direction_vec;
    struct.modelname = modelname;
    struct.var_799f234362adb813 = var_799f234362adb813;
    struct.partname = partname;
    struct.tagname = tagname;
    struct.idflags = idflags;
    struct.damageflags = idflags;
    struct.eventid = eventid;
    struct.hitloc = hitloc;
    struct.var_1da1a66b5c6a06a7 = var_1da1a66b5c6a06a7;
    if (isdefined(struct.attacker)) {
        struct.attacker.assistedsuicide = 0;
    }
    return struct;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83b
// Size: 0x90
function isstuckdamage(data, var_9b97f4ba6bdc58be) {
    if (istrue(self.forcestuckdamage)) {
        return 1;
    }
    if (isdefined(self.stuckbygrenade)) {
        if (isdefined(data.inflictor) && data.inflictor == self.stuckbygrenade) {
            if (istrue(var_9b97f4ba6bdc58be)) {
                return 1;
            } else if (isexplosivedamagemod(data.meansofdeath) || data.meansofdeath == "MOD_FIRE") {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d3
// Size: 0x1d
function iscrossbowdamage(objweapon) {
    return objweapon.basename == "iw9_dm_crossbow_mp";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f8
// Size: 0x2c
function function_6065fce6cdcad(objweapon) {
    return objweapon.basename == "iw9_dm_crossbow_mp" && objweapon hasattachment("ammo_bolt_he");
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92c
// Size: 0x2c
function function_d49206e61ac4f6de(objweapon) {
    return objweapon.basename == "iw9_dm_crossbow_mp" && objweapon hasattachment("ammo_bolt_db");
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x960
// Size: 0x111
function isstuckdamagekill(data) {
    if (istrue(self.nostuckdamagekill)) {
        return 0;
    }
    if (!isstuckdamage(data, 0)) {
        return 0;
    }
    if (issubstr(data.objweapon.basename, "molotov_mp")) {
        return 0;
    } else if (issubstr(data.objweapon.basename, "thermite_mp")) {
        return 0;
    } else if (issubstr(data.objweapon.basename, "thermite_ap_mp")) {
        return 0;
    } else if (issubstr(data.objweapon.basename, "thermite_av_mp")) {
        return 0;
    } else if (issubstr(data.objweapon.basename, "bunkerbuster_mp")) {
        return 0;
    } else if (issubstr(data.objweapon.basename, "bunkerbuster_burrowed_mp")) {
        return 0;
    }
    return 1;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa79
// Size: 0xe
function forcestuckdamage() {
    self.forcestuckdamage = 1;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8e
// Size: 0xd
function forcestuckdamageclear() {
    self.forcestuckdamage = undefined;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa2
// Size: 0x47
function isheadshot(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    if (smeansofdeath == "MOD_GRENADE") {
        return 0;
    }
    return shitloc == "head" || shitloc == "helmet";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf1
// Size: 0x3b
function function_b656251147d7d40b(partname) {
    if (!isdefined(partname)) {
        return 0;
    }
    return partname == "j_head" || partname == "j_helmet" || partname == "j_neck" || partname == "tag_eye";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb34
// Size: 0xaa
function validshotcheck(smeansofdeath, attacker) {
    if (isdefined(attacker)) {
        if (isdefined(attacker.owner)) {
            switch (attacker.code_classname) {
            case #"hash_3872eb7d97592cac":
            case #"hash_4af55147c6098215":
            case #"hash_81903cb95a447b8c":
                return 0;
                break;
            }
        }
    }
    switch (smeansofdeath) {
    case #"hash_a5123f4d02745600":
    case #"hash_a911a1880d996edb":
    case #"hash_abb1587cdc6def23":
    case #"hash_b1078ff213fddba6":
    case #"hash_d8646db4e6ee3658":
        return 0;
        break;
    }
    return 1;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe6
// Size: 0x13a
function function_abfcdee8fda20a4() {
    if (!isdefined(level.var_d43e78e513933216)) {
        level.var_d43e78e513933216 = [];
    }
    function_8bba4c474cb4043a("j_head");
    function_8bba4c474cb4043a("j_helmet");
    function_8bba4c474cb4043a("j_neck");
    function_8bba4c474cb4043a("tag_eye");
    function_8bba4c474cb4043a("j_chest");
    function_8bba4c474cb4043a("j_spineupper");
    function_8bba4c474cb4043a("j_spine4");
    function_8bba4c474cb4043a("j_spinelower");
    function_8bba4c474cb4043a("j_spinelower2");
    function_8bba4c474cb4043a("j_clavicle_ri");
    function_8bba4c474cb4043a("j_clavicle_le");
    function_8bba4c474cb4043a("j_shoulder_ri");
    function_8bba4c474cb4043a("j_shoulder_le");
    function_8bba4c474cb4043a("j_elbow_le");
    function_8bba4c474cb4043a("j_elbow_ri");
    function_8bba4c474cb4043a("j_wrist_le");
    function_8bba4c474cb4043a("j_wrist_ri");
    function_8bba4c474cb4043a("j_hip_ri");
    function_8bba4c474cb4043a("j_hip_le");
    function_8bba4c474cb4043a("j_knee_ri");
    function_8bba4c474cb4043a("j_knee_le");
    function_8bba4c474cb4043a("j_ankle_ri");
    function_8bba4c474cb4043a("j_ankle_le");
    function_8bba4c474cb4043a("j_mainroot");
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd27
// Size: 0x1e
function private function_8bba4c474cb4043a(str) {
    level.var_d43e78e513933216[function_3db00f01cdba4538(str)] = str;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4c
// Size: 0x42
function function_edefa1e693dd3c7d(var_f46544d32b6b992e) {
    if (!function_28eeffcb2337321e(var_f46544d32b6b992e)) {
        return var_f46544d32b6b992e;
    }
    if (!isdefined(level.var_d43e78e513933216) || !isdefined(level.var_d43e78e513933216[var_f46544d32b6b992e])) {
        return var_f46544d32b6b992e;
    }
    return level.var_d43e78e513933216[var_f46544d32b6b992e];
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd96
// Size: 0x3f
function istorsoshot(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return istorsouppershot(shitloc, smeansofdeath, attacker) || function_77ed09d75c0c7165(shitloc, smeansofdeath, attacker);
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddd
// Size: 0x3b
function istorsouppershot(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "neck" || shitloc == "torso_upper";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe20
// Size: 0xb2
function function_dcdde2598f1bdfc0(partname) {
    var_ee272d22135e6099 = 0;
    if (isdefined(partname)) {
        switch (partname) {
        case #"hash_52bdc7a0500be8b":
        case #"hash_58a0c7a054aabcd":
        case #"hash_270342211f93c022":
        case #"hash_274912211fcb218c":
        case #"hash_68e40995148f2457":
        case #"hash_a61118340cc1bc57":
        case #"hash_b68fa57896eba8d3":
        case #"hash_d332e6054003402b":
        case #"hash_d3921605404ec06d":
        case #"hash_d6c67a869aa3949f":
        case #"hash_d70b82869ad9bb31":
            var_ee272d22135e6099 = 1;
            break;
        }
    }
    return var_ee272d22135e6099;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeda
// Size: 0x30
function function_77ed09d75c0c7165(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "torso_lower";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf12
// Size: 0x46
function function_255c1a4a52956161(partname) {
    var_9a4f72b70e38d234 = 0;
    if (isdefined(partname)) {
        switch (partname) {
        case #"hash_75d098324e281f06":
        case #"hash_9f7ecb3109291edc":
            var_9a4f72b70e38d234 = 1;
            break;
        }
    }
    return var_9a4f72b70e38d234;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf60
// Size: 0x3f
function function_2deb4955aa2d2bc1(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return function_6f291533530edc79(shitloc, smeansofdeath, attacker) || function_d5c75fd1228282ee(shitloc, smeansofdeath, attacker);
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa7
// Size: 0x3f
function function_6f291533530edc79(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return function_24278eb0ec1e2953(shitloc, smeansofdeath, attacker) || function_bf1efc7185168448(shitloc, smeansofdeath, attacker);
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfee
// Size: 0x3f
function function_d5c75fd1228282ee(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return function_82850161196df912(shitloc, smeansofdeath, attacker) || function_d7395809e0049a49(shitloc, smeansofdeath, attacker);
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1035
// Size: 0x30
function function_24278eb0ec1e2953(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_arm_upper";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106d
// Size: 0x30
function function_82850161196df912(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "left_arm_upper";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a5
// Size: 0x3b
function function_bf1efc7185168448(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_arm_lower" || shitloc == "right_hand";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e8
// Size: 0x3b
function function_d7395809e0049a49(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "left_arm_lower" || shitloc == "left_hand";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x112b
// Size: 0x3f
function function_45f34eaec78ad083(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return function_c0bd16deeb47765b(shitloc, smeansofdeath, attacker) || function_f15a47528fffce28(shitloc, smeansofdeath, attacker);
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1172
// Size: 0x3f
function function_c0bd16deeb47765b(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return function_4536856e83718dbd(shitloc, smeansofdeath, attacker) || function_2eef344e0f951a1a(shitloc, smeansofdeath, attacker);
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b9
// Size: 0x3f
function function_f15a47528fffce28(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return function_275e2a90a59b872c(shitloc, smeansofdeath, attacker) || function_da1a82d3ae010f8b(shitloc, smeansofdeath, attacker);
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1200
// Size: 0x30
function function_4536856e83718dbd(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_leg_upper";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1238
// Size: 0x30
function function_275e2a90a59b872c(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "left_leg_upper";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1270
// Size: 0x3b
function function_2eef344e0f951a1a(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_leg_lower" || shitloc == "right_foot";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b3
// Size: 0x3b
function function_da1a82d3ae010f8b(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "left_leg_lower" || shitloc == "left_foot";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12f6
// Size: 0x5c
function function_457f72c1da9b8f7d(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_hand" || shitloc == "left_hand" || shitloc == "right_arm_lower" || shitloc == "left_arm_lower" || shitloc == "gun";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x135a
// Size: 0x5c
function function_6720f01c6abbcad4(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_hand" || shitloc == "left_hand" || shitloc == "right_arm_lower" || shitloc == "left_arm_lower" || shitloc == "gun";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13be
// Size: 0x5c
function function_ab8b1bd1015c043c(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_hand" || shitloc == "left_hand" || shitloc == "right_arm_lower" || shitloc == "left_arm_lower" || shitloc == "gun";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1422
// Size: 0x30
function function_8aea541c52417dfd(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_foot";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x145a
// Size: 0x30
function function_79daddb5d9b1b30(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "left_foot";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1492
// Size: 0x3b
function function_a09f9e84b9e51885(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "right_foot" || shitloc == "left_foot";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14d5
// Size: 0x30
function function_e39711c54e2e8b06(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    return shitloc == "neck";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150d
// Size: 0xba
function isupperbodyshot(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    switch (shitloc) {
    case #"hash_da51cc36a471058":
    case #"hash_1cbc508a2fe01b79":
    case #"hash_51d5d0b9add9cc5a":
    case #"hash_5d5aac570f6fd382":
    case #"hash_810a7426c8bac3ac":
    case #"hash_92bbfe494d03d772":
    case #"hash_a7980c387477e7bb":
    case #"hash_b275b50677dcf6cb":
    case #"hash_d42e71cd9f1e822f":
    case #"hash_da2f35145aa58933":
    case #"hash_fbb61fc356f3c75e":
        return 1;
        break;
    }
    return 0;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15cf
// Size: 0x7e
function islowerbodyshot(shitloc, smeansofdeath, attacker) {
    if (!validshotcheck(smeansofdeath, attacker)) {
        return 0;
    }
    switch (shitloc) {
    case #"hash_168c74e879f0ba11":
    case #"hash_1cbc508a2fe01b79":
    case #"hash_7b36142458a6c2d5":
    case #"hash_810a7426c8bac3ac":
    case #"hash_9536712388e65bce":
    case #"hash_a638fec9040cfcf4":
        return 1;
        break;
    }
    return 0;
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1655
// Size: 0x33
function function_cb9ba92488b23c5(objweapon) {
    return isdefined(objweapon) && isdefined(objweapon.basename) && objweapon.basename == "danger_circle_br";
}

// Namespace namespace_25ead30c6ed027fb/namespace_169cd7a8fbc76ee5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1690
// Size: 0x3c
function register_vehicle_damage_callback(func) {
    if (!isdefined(level.var_2d3abe16d5e2ffe6)) {
        level.var_2d3abe16d5e2ffe6 = [];
    }
    level.var_2d3abe16d5e2ffe6 = array_add(level.var_2d3abe16d5e2ffe6, func);
}

