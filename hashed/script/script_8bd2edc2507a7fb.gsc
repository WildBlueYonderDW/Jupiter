// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_6bffae1b97f70547;
#using script_3214e6fcdce468a7;
#using script_429c2a03090c1ea1;
#using script_38eb8f4be20d54f4;

#namespace shatterblast;

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e
// Size: 0x222
function function_17e4e24746f8c9ed() {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    level._effect["shatterblast_explosion_effect"] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_perk_shatterblast_lvl0_exp.vfx");
    level endon("game_ended");
    flag_wait("ammo_mods_ready");
    flag_init("shatterblast_ready");
    var_746d800f9d085b2a = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_f5387c043922f4f8, 0.3);
    var_ad5528a4132dc97d = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_af198a8967836363, 0.1);
    var_fb5b2fb3fafc60c7 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_b65eda3e32b8f22e, 0);
    var_bcbfc6de4213b6af = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_f745464cd01e695a, 25);
    var_60cd3581dc64f213 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_1046b942dfff8dd2, 3);
    var_f27a8d5708fd9c4d = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_f2b6efc00a3c8036, 1);
    var_50b2d9031ce3da52 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_d4f5c6e6b4cec483, "");
    var_7cd0ba2c2358da52 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_4cae49a31cc4eca5, "");
    element = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_5976d1457ae822c0, "none");
    level.var_1efb9d8964ce6df8 = [];
    level.var_8a2e0c6154011aea = [];
    level.var_ca5954045d6b3e6c = function_e4c99b0f178ffb98("shatterblast_throttle", 1, level.framedurationseconds);
    function_7f759db5de1b44b0("shatterblast", 5, var_746d800f9d085b2a, var_ad5528a4132dc97d, var_fb5b2fb3fafc60c7, var_bcbfc6de4213b6af, var_60cd3581dc64f213, var_f27a8d5708fd9c4d, &function_74dd9dad02bab584, var_50b2d9031ce3da52, var_7cd0ba2c2358da52, &function_d68ef8ba212c85a, element, &function_3f5765f3394eadbb);
    flag_set("shatterblast_ready");
    /#
        level thread function_d2a179c33526b945();
    #/
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x447
// Size: 0x22
function function_956b04989248cd43(func) {
    level.var_1efb9d8964ce6df8[level.var_1efb9d8964ce6df8.size] = func;
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x470
// Size: 0x22
function function_52640c8abb792f05(func) {
    level.var_8a2e0c6154011aea[level.var_8a2e0c6154011aea.size] = func;
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499
// Size: 0xd1
function function_74dd9dad02bab584(death, attacker, mod, sweapon, vpoint, shitloc, modelindex) {
    if (level.var_1efb9d8964ce6df8.size > 0) {
        foreach (result_func in level.var_1efb9d8964ce6df8) {
            [[ result_func ]](death, attacker, mod, sweapon, vpoint, shitloc, modelindex);
        }
        return;
    }
    if (!isplayer(attacker)) {
        return;
    }
    if (!function_49feef49bfff113d(attacker)) {
        return;
    }
    function_aecd8c6088cdda0c(death, attacker, mod, sweapon, vpoint, shitloc, modelindex);
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x571
// Size: 0x34
function function_3f5765f3394eadbb(damage, attacker, sweapon) {
    if (istrue(ent_flag("is_shatterblast_target"))) {
        function_ee31e03f2ae0100(damage, attacker);
    }
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ac
// Size: 0x5e
function function_aecd8c6088cdda0c(death, attacker, mod, sweapon, vpoint, shitloc, modelindex) {
    playfx(getfx("shatterblast_explosion_effect"), vpoint);
    thread function_2ac5028ab35e92e0(death, attacker, mod, sweapon, vpoint, shitloc, modelindex);
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x611
// Size: 0x114
function function_2ac5028ab35e92e0(death, attacker, mod, sweapon, vpoint, shitloc, modelindex) {
    level endon("game_ended");
    attacker endon("disconnect");
    ent_flag_set("is_shatterblast_target");
    origin = self.origin;
    waitframe();
    var_59d8a38b844d1e11 = getaiarrayinradius(origin, 128);
    foreach (ai in var_59d8a38b844d1e11) {
        if (istrue(level.var_f1240a9ac4f65616.var_d24c25da0a5f1a52)) {
            ai thread function_1646cc331f11526d(death, attacker, mod, sweapon, vpoint, shitloc, modelindex, origin, level.var_ca5954045d6b3e6c);
        } else {
            ai function_caccc3fb671291a0(death, attacker, mod, sweapon, vpoint, shitloc, modelindex, origin);
        }
    }
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72c
// Size: 0x8b
function function_1646cc331f11526d(death, attacker, mod, sweapon, vpoint, shitloc, modelindex, damageorigin, throttle) {
    ai = self;
    level endon("game_ended");
    attacker endon("disconnect");
    ai endon("death_or_disconnect");
    function_f632348cbb773537(throttle, ai);
    ai function_caccc3fb671291a0(death, attacker, mod, sweapon, vpoint, shitloc, modelindex, damageorigin);
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7be
// Size: 0x243
function function_caccc3fb671291a0(death, attacker, mod, sweapon, vpoint, shitloc, modelindex, damageorigin) {
    damagepercent = 0;
    if (function_49feef49bfff113d(attacker)) {
        thread function_69f37932abc632da(attacker);
        if (isdefined(self.aicategory)) {
            if (self.aicategory == "normal") {
                var_1d23268d008ee8f2 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_53039572c4fb54ed, 64);
                var_1d23268d008ee8f2 = var_1d23268d008ee8f2 * var_1d23268d008ee8f2;
                if (distancesquared(self.origin, damageorigin) <= var_1d23268d008ee8f2) {
                    damagepercent = 1;
                } else {
                    damagepercent = float(function_53c4c53197386572(level.var_f1240a9ac4f65616.var_5c9306fb80b47ad9, 0.5));
                }
            } else if (self.aicategory == "special") {
                damagepercent = float(function_53c4c53197386572(level.var_f1240a9ac4f65616.var_5ec47ece9ca37503, 0.5));
            } else if (self.aicategory == "elite") {
                damagepercent = float(function_53c4c53197386572(level.var_f1240a9ac4f65616.var_fdd6e43418e8b123, 0.5));
            }
        } else if (isdefined(self.unittype) && self.unittype == "soldier") {
            if (isdefined(self.subclass) && issubstr(self.subclass, "warlord")) {
                damagepercent = float(function_53c4c53197386572(level.var_f1240a9ac4f65616.var_fdd6e43418e8b123, 0.5));
            } else {
                damagepercent = float(function_53c4c53197386572(level.var_f1240a9ac4f65616.var_5c9306fb80b47ad9, 0.5));
            }
        }
        if (damagepercent > 0) {
            damage = self.maxhealth * damagepercent;
            function_ee31e03f2ae0100(damage, attacker);
            self dodamage(damage, self.origin, attacker, attacker, "MOD_EXPLOSIVE", sweapon, shitloc, undefined, 65536);
        }
    }
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa08
// Size: 0xaa
function function_ee31e03f2ae0100(damage, attacker) {
    var_847a9efe63da40a5 = ent_flag("shatterblast_kill_scoreevent_awarded");
    var_e6713b85dde818e2 = self.health - damage < 1;
    if (!var_847a9efe63da40a5 && var_e6713b85dde818e2) {
        ent_flag_set("shatterblast_kill_scoreevent_awarded");
        if (isplayer(attacker)) {
            var_1b903f780de3dc79 = spawnstruct();
            var_1b903f780de3dc79.scoreevent = #"hash_555e88a4685955b5";
            var_1b903f780de3dc79.reason = #"kill";
            attacker callback::callback("zombie_score_event", var_1b903f780de3dc79);
        }
    }
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab9
// Size: 0x41
function function_49feef49bfff113d(attacker) {
    if (!isalive(self)) {
        return 0;
    }
    if (isdefined(self.team) && self.team == attacker.team) {
        return 0;
    }
    return 1;
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb02
// Size: 0xae
function function_d68ef8ba212c85a() {
    if (istrue(level.var_1b3072262db80fc1["shatterblast"].immune_result_direct[self.basearchetype])) {
        return 0;
    }
    if (isdefined(self.var_1b74dbfbf5e984dc)) {
        fail = [[ self.var_1b74dbfbf5e984dc ]]();
        if (!istrue(fail)) {
            return 0;
        }
    }
    foreach (result_func in level.var_8a2e0c6154011aea) {
        if (!istrue([[ result_func ]]())) {
            return 0;
        }
    }
    return 1;
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbb8
// Size: 0x50
function function_1e0fc29da12fb06d(shitloc, vpoint) {
    if (!isalive(self)) {
        return;
    }
    var_c02b1f6c1721c844 = function_ae12b32b13b42c5e(shitloc);
    if (!isdefined(var_c02b1f6c1721c844)) {
        var_c02b1f6c1721c844 = function_b8f2b0917b1d3c98(vpoint);
    }
    if (function_adb7b3f940cde3b5(var_c02b1f6c1721c844)) {
        function_b51afbf2bd72c825(var_c02b1f6c1721c844);
    }
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0f
// Size: 0x11a
function function_69f37932abc632da(eattacker) {
    self endon("death");
    if (self.unittype == "soldier") {
        return;
    }
    if (!isdefined(self.var_9bc8186f76d68603)) {
        return;
    }
    if (isdefined(self.aicategory) && (self.aicategory == "elite" || self.aicategory == "boss")) {
        return;
    }
    ent_flag_init("shatterblast_damaged_armor");
    ent_flag_set("shatterblast_damaged_armor");
    foreach (var_e7c68f035d44458c, var_20237ca8e4edbc82 in self.var_9bc8186f76d68603.info) {
        if (!var_20237ca8e4edbc82.is_active) {
            continue;
        }
        if (function_cec565632b7fc419(var_e7c68f035d44458c)) {
            continue;
        }
        if (!function_adb7b3f940cde3b5(var_e7c68f035d44458c)) {
            continue;
        }
        function_b51afbf2bd72c825(var_e7c68f035d44458c, eattacker, eattacker);
    }
    waitframe();
    waitframe();
    ent_flag_clear("shatterblast_damaged_armor");
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd30
// Size: 0x7e
function function_3b2ca0163dee88a4() {
    /#
        foreach (player in level.players) {
            currentweapon = player getcurrentweapon();
            player function_6c40f58b29a952a9(currentweapon, "<unknown string>");
            player iprintlnbold("<unknown string>");
        }
    #/
}

// Namespace shatterblast/namespace_f4dffd4c87f1e787
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdb5
// Size: 0x30
function function_d2a179c33526b945() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3b2ca0163dee88a4, 0);
        function_fe953f000498048f();
    #/
}

