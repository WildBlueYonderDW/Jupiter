#using scripts\engine\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\sp\damagefeedback.gsc;

#namespace namespace_696e493179dbdfab;

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x441
// Size: 0x6a
function precache() {
    level._effect["vfx_helmet_tier3"] = loadfx("vfx/iw9/gameplay/sp/vfx_al_qatala_helmet_tier_3.vfx");
    level._effect["vfx_opforce_cartel_helmet_tier_3"] = loadfx("vfx/iw9/gameplay/sp/vfx_opforce_cartel_helmet_tier_3.vfx");
    level._effect["vfx_mex_mil_helmet_tier3"] = loadfx("vfx/iw9/gameplay/sp/vfx_mex_mil_helmet_tier_3.vfx");
    level._effect["vfx_shadow_co_helmet_tier3"] = loadfx("vfx/iw9/gameplay/sp/vfx_shadow_co_helmet_tier_3.vfx");
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3
// Size: 0xe8
function function_1ddcdf764c5bdd84() {
    self.armored = 1;
    if (function_35cc826aceeeb635()) {
        if (istrue(level.var_2409f550b8a85394)) {
            return;
        }
    }
    if (istier3()) {
        function_b6ca17d480f22f01();
        self.var_b4378fc1b757b1b1 = 0;
        self.mask_on = 1;
    }
    self.spawnhealth = self.health;
    self.health = 99999;
    self.script_health = 99999;
    self.var_7a9debb6495e4fbe = ter_op(function_35cc826aceeeb635(), default_to(level.var_2986ed25936b6d23, 350), default_to(level.var_f203b64b98764f4, 1000));
    self.var_9aa77ab756fdca82 = 1000;
    self.var_43e2ad424676b8d4 = 100;
    self.fnshouldplaypainanim = &function_7477b2702d715c48;
    function_d18ffb2829a256ac();
    add_damage_function(&function_396b6f70220bfcf7);
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a3
// Size: 0xde
function function_b6ca17d480f22f01() {
    if (issubstr(self.code_classname, "_rus_pmc")) {
        self.var_fbf555896f954157 = level._effect["vfx_shadow_co_helmet_tier3"];
        return;
    }
    if (issubstr(self.code_classname, "_pmc")) {
        self.var_fbf555896f954157 = level._effect["vfx_shadow_co_helmet_tier3"];
        return;
    }
    if (issubstr(self.code_classname, "_cartel")) {
        self.var_fbf555896f954157 = level._effect["vfx_opforce_cartel_helmet_tier_3"];
        return;
    }
    if (issubstr(self.code_classname, "_mex")) {
        self.var_fbf555896f954157 = level._effect["vfx_mex_mil_helmet_tier3"];
        return;
    }
    self.var_fbf555896f954157 = level._effect["vfx_helmet_tier3"];
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x689
// Size: 0x4af
function function_396b6f70220bfcf7(amount, attacker, direction, dmgpoint, meansofdeath, modelname, tagname, partname, idflags, objweapon) {
    if (istrue(self.armored)) {
        self.health = 99999;
        self.script_health = 99999;
    }
    if (!utility::function_bbebfbddd1b77a34() && (istrue(level.var_288f1e20196e36b8) || istrue(self.var_288f1e20196e36b8))) {
        if (function_b653eb95e7d86ec0(partname)) {
            if (function_35cc826aceeeb635()) {
                function_758ea9f162c62fdc("hit_marker_3d_armor", "hithelmetlight");
            } else {
                function_758ea9f162c62fdc("hit_marker_3d_armor", "hithelmetheavy");
            }
            return;
        }
        if (function_35cc826aceeeb635()) {
            function_758ea9f162c62fdc("hit_marker_3d_armor", "hitarmorlight");
            return;
        }
        if (issubstr(self.animsetname, "shield")) {
            function_758ea9f162c62fdc("hit_marker_heavy", "hitblastshield");
            return;
        }
        function_758ea9f162c62fdc("hit_marker_3d_armor", "hitarmorheavy");
        return;
    }
    var_9bb7419c58aa52ba = is_equal(attacker, level.player);
    if (is_equal(self.attacker, self) || utility::function_bbebfbddd1b77a34() || amount <= 1 || !function_3884bec8f53b84f6(meansofdeath, objweapon)) {
        if (meansofdeath == "MOD_MELEE" && !utility::function_bbebfbddd1b77a34()) {
            if (var_9bb7419c58aa52ba) {
                thread play_sound_in_space("hit_marker_heavy", level.player.origin);
            }
            if (objweapon.basename == "iw9_me_riotshield_sp") {
                if (self.var_7a9debb6495e4fbe > 200) {
                    if (function_35cc826aceeeb635()) {
                        self.var_7a9debb6495e4fbe = 100;
                    } else {
                        self.var_7a9debb6495e4fbe = 200;
                    }
                } else if (self.health <= 100) {
                    function_6170c11c14c26ebd();
                    return;
                }
            } else if (var_9bb7419c58aa52ba) {
                if (istrue(level.var_bedd2f231189dcb3) || istrue(self.var_bedd2f231189dcb3)) {
                    if (self.var_7a9debb6495e4fbe > 0 && (!isdefined(self.var_fcb646f1134732fc) || time_has_passed(self.var_fcb646f1134732fc, 0.5))) {
                        self.var_fcb646f1134732fc = gettime();
                        function_758ea9f162c62fdc(undefined, "hitarmorlight");
                    }
                    return;
                }
                amount = 100;
            }
        } else {
            return;
        }
    }
    if (var_9bb7419c58aa52ba) {
        if (istrue(self.mask_on) && function_b653eb95e7d86ec0(partname)) {
            class = weaponclass(objweapon.basename);
            self.var_b4378fc1b757b1b1++;
            if (class != "sniper" && self.var_b4378fc1b757b1b1 < 3 && amount < 700) {
                if (function_35cc826aceeeb635()) {
                    function_758ea9f162c62fdc("hit_marker_3d_armor", "hithelmetlight");
                } else {
                    function_758ea9f162c62fdc("hit_marker_3d_armor", "hithelmetheavy");
                }
                return;
            }
            if (!istrue(self.var_717a05ab382cc6ef)) {
                if (class == "sniper" || amount >= 700) {
                    thread function_d93c0ae1f417abb3(var_9bb7419c58aa52ba, 0);
                    function_6170c11c14c26ebd();
                    return;
                }
                thread function_d93c0ae1f417abb3(var_9bb7419c58aa52ba, 1);
            }
            return;
        }
        attacker notify("ai_armorDamaged", meansofdeath);
    }
    if (istrue(self.burningtodeath)) {
        function_bb6c0b67e147ba97();
        return;
    }
    if (self.armored) {
        if (var_9bb7419c58aa52ba && isai(attacker)) {
            amount = int(amount * 0.33);
        }
        if (function_ce7e20508ce59a4c(meansofdeath) && !istrue(self.var_f4d5cb5646bd73e1)) {
            self.var_7a9debb6495e4fbe = 0;
        } else {
            self.var_7a9debb6495e4fbe -= amount;
        }
        if (!istrue(self.mask_on)) {
            if (function_b653eb95e7d86ec0(partname)) {
                function_6170c11c14c26ebd();
                return;
            }
        }
        if (self.var_7a9debb6495e4fbe > 1) {
            if (var_9bb7419c58aa52ba) {
                if (function_35cc826aceeeb635()) {
                    function_758ea9f162c62fdc("hit_marker_3d_armor", "hitarmorlight");
                } else if (issubstr(self.animsetname, "shield")) {
                    function_758ea9f162c62fdc("hit_marker_heavy", "hitblastshield");
                } else {
                    function_758ea9f162c62fdc("hit_marker_3d_armor", "hitarmorheavy");
                }
            }
            function_1d79a3f4f602f210(meansofdeath);
            return;
        }
        function_3dd3f7ea85b1e33a(var_9bb7419c58aa52ba);
        if (function_35cc826aceeeb635() && function_ce7e20508ce59a4c(meansofdeath)) {
            function_6170c11c14c26ebd();
        }
    }
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb40
// Size: 0x1d
function function_7477b2702d715c48() {
    if (is_equal(self.damagemod, "MOD_MELEE")) {
        return true;
    }
    return false;
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb66
// Size: 0x8d
function function_d93c0ae1f417abb3(var_9bb7419c58aa52ba, var_7ad84dc73ff10ea8) {
    if (var_9bb7419c58aa52ba) {
        if (function_35cc826aceeeb635()) {
            function_758ea9f162c62fdc("hit_marker_3d_armor_break", "hithelmetlightbreak");
        } else {
            function_758ea9f162c62fdc("hit_marker_3d_armor_break", "hithelmetheavybreak");
        }
    }
    self notify("armor_break");
    playfxontag(self.var_fbf555896f954157, self, "j_head");
    thread ai_attachhead();
    self.var_717a05ab382cc6ef = 1;
    if (var_7ad84dc73ff10ea8) {
        function_4adaecd9673d52ac();
    }
    wait 1;
    self.mask_on = undefined;
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb
// Size: 0x93
function function_758ea9f162c62fdc(sound, value, var_436ac5b58aa21220) {
    level.player setclientomnvar("damage_feedback_icon", value);
    if (isdefined(var_436ac5b58aa21220)) {
        level.player setclientomnvar("damage_icon_amount", var_436ac5b58aa21220);
    } else {
        level.player setclientomnvar("damage_icon_amount", 1);
    }
    level.player setclientomnvar("damage_feedback_icon_notify", gettime());
    if (isdefined(sound)) {
        thread play_sound_in_space(sound, self.origin);
    }
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc96
// Size: 0xd1
function function_3dd3f7ea85b1e33a(var_9bb7419c58aa52ba) {
    self notify("armor_break");
    self.var_b4378fc1b757b1b1 = 3;
    if (var_9bb7419c58aa52ba && istrue(self.armored)) {
        if (function_35cc826aceeeb635()) {
            function_758ea9f162c62fdc("hit_marker_3d_armor_break", "hitarmorlightbreak");
        } else if (issubstr(self.animsetname, "shield")) {
            function_758ea9f162c62fdc("hit_marker_3d_armor_break", "hitarmorheavybreak");
        } else {
            function_758ea9f162c62fdc("hit_marker_3d_armor_break", "hitarmorheavybreak");
        }
    }
    if (istrue(self.magic_bullet_shield)) {
        stop_magic_bullet_shield();
    }
    self.health = self.spawnhealth;
    self.script_health = self.spawnhealth;
    self.armored = 0;
    function_4adaecd9673d52ac();
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd6f
// Size: 0x2f
function function_3884bec8f53b84f6(meansofdeath, objweapon) {
    result = 1;
    if (function_d90870d4a1e92ff9(meansofdeath, objweapon)) {
        result = 0;
    }
    return result;
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xda7
// Size: 0x68
function function_d90870d4a1e92ff9(meansofdeath, objweapon) {
    if (meansofdeath == "MOD_IMPACT" || meansofdeath == "MOD_MELEE" && !utility::function_bbebfbddd1b77a34()) {
        return true;
    }
    if (isdefined(self.var_4c96ba0093ca475[meansofdeath]) && array_contains(self.var_4c96ba0093ca475[meansofdeath], objweapon.basename)) {
        return true;
    }
    return false;
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe18
// Size: 0x6c
function function_d18ffb2829a256ac() {
    self.var_4c96ba0093ca475["MOD_GRENADE_SPLASH"] = ["bottle", "flash", "smoke", "smoke_bomb", "gas_grenade_sp", "noisemaker"];
    self.var_4c96ba0093ca475["MOD_GRENADE"] = ["semtex", "molotov"];
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe8c
// Size: 0x61
function function_ce7e20508ce59a4c(meansofdeath) {
    switch (meansofdeath) {
    case #"hash_3c20f39c73a1422b":
    case #"hash_571e46e17a3cf2e3":
    case #"hash_66cb246f3e55fbe2":
    case #"hash_a911a1880d996edb":
    case #"hash_c22b13f81bed11f0":
        return 1;
    default:
        return 0;
    }
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xef5
// Size: 0x3e
function function_1d79a3f4f602f210(meansofdeath) {
    if (!function_ce7e20508ce59a4c(meansofdeath)) {
        return 0;
    }
    self notify("flashbang", (0, 0, 0), 1, 1, level.player, "axis");
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf3b
// Size: 0xc8
function ai_attachhead() {
    if (isdefined(self.hatmodel)) {
        self detach(self.hatmodel);
    }
    if (self tagexists("j_helmet")) {
        self hidepart("j_helmet", self.headmodel);
    }
    if (self tagexists("j_helmet_hide")) {
        self hidepart("j_helmet_hide", self.headmodel);
    }
    if (self tagexists("j_mask")) {
        self hidepart("j_mask", self.headmodel);
    }
    if (self tagexists("j_nvg")) {
        self hidepart("j_nvg", self.headmodel);
    }
    if (isdefined(self.hatmodel)) {
        self attach(self.hatmodel);
    }
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100b
// Size: 0x36
function function_4adaecd9673d52ac() {
    if (!istrue(self.var_26a3131d00c1e6f3)) {
        self notify("flashbang", (0, 0, 0), 1, 1, level.player, "axis");
    }
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1049
// Size: 0x16
function function_35cc826aceeeb635() {
    return is_equal(self.subclass, "tier2");
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1068
// Size: 0x16
function istier3() {
    return is_equal(self.subclass, "tier3");
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1087
// Size: 0x23
function function_b653eb95e7d86ec0(partname) {
    return isdefined(partname) && (scripts\sp\damagefeedback::isheadshot(partname) || partname == "j_helmet");
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b3
// Size: 0x79
function function_bb6c0b67e147ba97() {
    self notify("kill_armorLogic");
    self.armored = 0;
    self.var_b4378fc1b757b1b1 = 3;
    if (istrue(self.magic_bullet_shield)) {
        stop_magic_bullet_shield();
    }
    if (self.health > self.spawnhealth) {
        self.health = self.spawnhealth;
    }
    self.script_health = self.health;
    remove_damage_function(&function_396b6f70220bfcf7);
}

// Namespace namespace_696e493179dbdfab / namespace_c5f28ee126743bce
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1134
// Size: 0x28
function function_6170c11c14c26ebd() {
    self.var_b4378fc1b757b1b1 = 3;
    if (istrue(self.magic_bullet_shield)) {
        stop_magic_bullet_shield();
    }
    self kill();
}

