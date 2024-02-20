// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_3214e6fcdce468a7;
#using script_3b64eb40368c1450;
#using script_686729055b66c6e4;
#using script_38eb8f4be20d54f4;
#using script_6bffae1b97f70547;

#namespace deadwire;

// Namespace deadwire/namespace_1796345de585c9dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc
// Size: 0x21b
function function_f0091083ed1767b() {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    level endon("game_ended");
    level._effect["vfx_perk_dw_aoe_exp"] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_perk_dw_aoe_exp.vfx");
    flag_wait("ammo_mods_ready");
    flag_init("deadwire_ready");
    var_746d800f9d085b2a = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_554426503d76e08e, 0.2);
    var_ad5528a4132dc97d = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_d582785a41a462cd, 0.04);
    var_fb5b2fb3fafc60c7 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_508bf57826aa4710, 0);
    var_bcbfc6de4213b6af = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_f5d90e6daa6bbab4, 15);
    var_60cd3581dc64f213 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_f2f97526966640ac, 15);
    var_f27a8d5708fd9c4d = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_724408de2e09faac, 1);
    var_50b2d9031ce3da52 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_1212283d4ed9b1a1, "");
    var_7cd0ba2c2358da52 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_628a8a44395b472f, "");
    element = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_84c3be81519a4db6, "electrical");
    level.var_740f925da07c4d6b = function_e4c99b0f178ffb98("deadwire", 2, 1);
    level.var_347f02218c1bdfaa = [];
    level.var_474baa8191a671a8 = [];
    function_7f759db5de1b44b0("deadwire", 3, var_746d800f9d085b2a, var_ad5528a4132dc97d, var_fb5b2fb3fafc60c7, var_bcbfc6de4213b6af, var_60cd3581dc64f213, var_f27a8d5708fd9c4d, &function_9f332972d199fdda, var_50b2d9031ce3da52, var_7cd0ba2c2358da52, &function_34506c532bfbda54, element, &function_dc3f0e5b8db53339);
    flag_set("deadwire_ready");
    /#
        level thread function_6c46532ee1ae7b03();
    #/
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41e
// Size: 0x22
function function_ca3453d66c7654b5(func) {
    level.var_347f02218c1bdfaa[level.var_347f02218c1bdfaa.size] = func;
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x447
// Size: 0x22
function function_48c02397f0acdf83(func) {
    level.var_474baa8191a671a8[level.var_474baa8191a671a8.size] = func;
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470
// Size: 0x193
function function_9f332972d199fdda(death, attacker, mod, sweapon, vpoint, shitloc, modelindex) {
    if (level.var_347f02218c1bdfaa.size > 0) {
        foreach (result_func in level.var_347f02218c1bdfaa) {
            [[ result_func ]](death, attacker, mod, sweapon, vpoint, shitloc, modelindex);
        }
    } else if (isdefined(self.aicategory) && (self.aicategory == "normal" || self.aicategory == "special")) {
        if (!istrue(ent_flag("deadwire_stunned"))) {
            var_a62c9131c5dfe17 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_a62c9131c5dfe17, 5);
            self.var_521c8f60b6e7acc = gettime() + function_a5b14435e3229bed(var_a62c9131c5dfe17);
            params = spawnstruct();
            params.attacker = attacker;
            callback::callback("shocked", params);
            val::set("deadwire_stunned", "ignoreme", 1);
            ent_flag_set("deadwire_stunned");
            function_2e4d3c67e63f83ac(1000);
            thread function_f1355290e4b221a8(death, attacker, mod, sweapon, vpoint, shitloc, modelindex);
        }
    }
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60a
// Size: 0xae
function function_34506c532bfbda54() {
    if (istrue(level.var_1b3072262db80fc1["deadwire"].immune_result_direct[self.basearchetype])) {
        return 0;
    }
    if (isdefined(self.var_b5117f0fdd28774a)) {
        var_cff09a426d81d296 = [[ self.var_b5117f0fdd28774a ]]();
        if (!istrue(var_cff09a426d81d296)) {
            return 0;
        }
    }
    foreach (result_func in level.var_474baa8191a671a8) {
        if (!istrue([[ result_func ]]())) {
            return 0;
        }
    }
    return 1;
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c0
// Size: 0x70
function function_dc3f0e5b8db53339(damage, attacker, weapon) {
    if (isdefined(self.aicategory) && self.aicategory == "normal" && istrue(ent_flag("deadwire_stunned"))) {
        self.health = int(damage + 1);
        self notify("deadwire_stun_wait");
        thread function_51375a25a2ba999(attacker, weapon);
    }
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x737
// Size: 0xac
function function_51375a25a2ba999(attacker, weapon) {
    self endon("deadwire_stun_wait");
    self endon("death");
    ent_flag_waitopen("deadwire_stunned");
    if (self.aicategory == "normal" && isalive(self)) {
        if (isplayer(attacker)) {
            var_1b903f780de3dc79 = spawnstruct();
            var_1b903f780de3dc79.scoreevent = #"deadwire_aoe_kill";
            var_1b903f780de3dc79.reason = #"kill";
            attacker callback::callback("zombie_score_event", var_1b903f780de3dc79);
        }
        self kill(self.origin, attacker);
    }
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ea
// Size: 0x582
function function_f1355290e4b221a8(death, attacker, mod, sweapon, vpoint, shitloc, modelindex) {
    self endon("death");
    var_21e5979d9e3b862b = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_21e5979d9e3b862b, 128);
    var_a1ca9749343cd1a2 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_a1ca9749343cd1a2, 0.01);
    var_9d54da6a6ef1372e = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_9d54da6a6ef1372e, 0.005);
    var_2862ef8c5aa5adbb = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_2862ef8c5aa5adbb, 0.05);
    var_853affe15cd4a849 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_853affe15cd4a849, 0.2);
    var_afc4af44f507da0c = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_afc4af44f507da0c, 0.025);
    if (self.aicategory == "normal") {
        val::set("deadwire", "show_healthbar", 0);
        if (self.health < 1) {
            self.health = 1;
        }
    }
    while (istrue(is_stunned()) && gettime() < self.var_521c8f60b6e7acc) {
        playfxontag(getfx("vfx_perk_dw_aoe_exp"), self, "j_spine4");
        var_fb04a2e22cf56f22 = getaiarrayinradius(self.origin, var_21e5979d9e3b862b);
        if (isdefined(self getexecutionpartner()) || self isinexecutionvictim()) {
            ent_flag_set("executed_during_deadwire_stun");
            self.var_5ede61272f442abd = undefined;
            params = spawnstruct();
            params.attacker = attacker;
            callback::callback("shocked_end", params);
            ent_flag_clear("deadwire_stunned");
            val::reset("deadwire_stunned", "ignoreme");
            clear_stun();
            return;
        }
        foreach (zombie in var_fb04a2e22cf56f22) {
            if (isalive(zombie) && zombie != self) {
                if (isdefined(zombie.aicategory) && zombie.aicategory == "special") {
                    var_c37a2660b28e5fc1 = int(zombie.maxhealth * var_a1ca9749343cd1a2);
                } else if (isdefined(zombie.aicategory) && zombie.aicategory == "elite") {
                    var_c37a2660b28e5fc1 = int(zombie.maxhealth * var_9d54da6a6ef1372e);
                } else if (isdefined(zombie.subclass) && issubstr(zombie.subclass, "warlord")) {
                    var_c37a2660b28e5fc1 = int(zombie.maxhealth * var_9d54da6a6ef1372e);
                } else {
                    var_c37a2660b28e5fc1 = int(zombie.maxhealth * var_2862ef8c5aa5adbb);
                }
                if (zombie.health - var_c37a2660b28e5fc1 < 1 && zombie != self) {
                    if (isplayer(attacker)) {
                        var_1b903f780de3dc79 = spawnstruct();
                        var_1b903f780de3dc79.scoreevent = #"deadwire_aoe_kill";
                        attacker callback::callback("zombie_score_event", var_1b903f780de3dc79);
                    }
                }
                zombie val::set("deadwire", "pain", 0);
                zombie dodamage(var_c37a2660b28e5fc1, zombie.origin, attacker, attacker, "MOD_ELEMENTAL_ELEC", sweapon, "none", undefined, 65536);
                zombie val::reset("deadwire", "pain");
            }
        }
        if (isalive(self)) {
            if (self.aicategory == "normal") {
                if (self.health < 1) {
                    self.health = 1;
                }
            } else if (self.aicategory == "special") {
                var_c37a2660b28e5fc1 = int(self.maxhealth * var_afc4af44f507da0c);
                if (self.health - var_c37a2660b28e5fc1 < 0) {
                    self.health = 1;
                } else {
                    self dodamage(var_c37a2660b28e5fc1, self.origin, attacker, attacker, "MOD_ELEMENTAL_ELEC", sweapon, "none", undefined, 65536);
                }
            }
        }
        function_f632348cbb773537(level.var_740f925da07c4d6b, self);
        time = gettime();
    }
    params = spawnstruct();
    params.attacker = attacker;
    callback::callback("shocked_end", params);
    ent_flag_clear("deadwire_stunned");
    val::reset("deadwire_stunned", "ignoreme");
    if (isalive(self)) {
        if (self.aicategory == "normal") {
            if (isplayer(attacker)) {
                var_1b903f780de3dc79 = spawnstruct();
                var_1b903f780de3dc79.scoreevent = #"deadwire_aoe_kill";
                attacker callback::callback("zombie_score_event", var_1b903f780de3dc79);
            }
            self kill(self.origin, attacker);
        } else {
            clear_stun();
        }
    }
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd73
// Size: 0x7e
function function_9a617a4a862078ca() {
    /#
        foreach (player in level.players) {
            currentweapon = player getcurrentweapon();
            player function_6c40f58b29a952a9(currentweapon, "<unknown string>");
            player iprintlnbold("<unknown string>");
        }
    #/
}

// Namespace deadwire/namespace_1796345de585c9dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf8
// Size: 0x30
function function_6c46532ee1ae7b03() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_9a617a4a862078ca, 0);
        function_fe953f000498048f();
    #/
}

