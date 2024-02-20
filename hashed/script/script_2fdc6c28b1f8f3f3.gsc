// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_6bffae1b97f70547;
#using script_38eb8f4be20d54f4;
#using script_554830d27078277d;

#namespace brainrot;

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x118
// Size: 0x21e
function function_dc7d8af03fc44b91() {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    level endon("game_ended");
    level._effect["vfx_zai_exp_aoe_brain_rot"] = loadfx(level.var_f1240a9ac4f65616.var_fb1ea41cdec7fb3d);
    flag_wait("ammo_mods_ready");
    flag_init("brainrot_ready");
    var_746d800f9d085b2a = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_fdcd2fa4737af784, 0.15);
    var_ad5528a4132dc97d = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_ef4776d7c7a5e1b7, 0.03);
    var_fb5b2fb3fafc60c7 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_6902494309ecdf82, 0);
    var_bcbfc6de4213b6af = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_77f6495a5efa75b6, 40);
    var_60cd3581dc64f213 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_d79991c2a1c06c16, 5);
    var_f27a8d5708fd9c4d = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_d337dfeb11be1d02, 1);
    var_50b2d9031ce3da52 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_609b1a97084eeeef, "");
    var_7cd0ba2c2358da52 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_4c0e7ad946f68c49, "");
    element = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_6ad6dd1bd006491c, "toxic");
    level.var_37f448fda9dfdd24 = [];
    level.var_fda3ff4feb6c4546 = [];
    level callback::add("on_ai_killed", &function_266be48a55c0cdc5);
    function_7f759db5de1b44b0("brainrot", 1, var_746d800f9d085b2a, var_ad5528a4132dc97d, var_fb5b2fb3fafc60c7, var_bcbfc6de4213b6af, var_60cd3581dc64f213, var_f27a8d5708fd9c4d, &function_52575fe8c8a247f8, var_50b2d9031ce3da52, var_7cd0ba2c2358da52, &function_e77373dffa58f4fe, element);
    flag_set("brainrot_ready");
    /#
        level thread function_eb3305baa083c02d();
    #/
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33d
// Size: 0x22
function function_8bd543daa9037db7(func) {
    level.var_37f448fda9dfdd24[level.var_37f448fda9dfdd24.size] = func;
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x366
// Size: 0x22
function function_7d4e03466fcf5dc9(func) {
    level.var_fda3ff4feb6c4546[level.var_fda3ff4feb6c4546.size] = func;
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f
// Size: 0x2a
function function_aada6661ca89c2af() {
    var_8f7c76d8bdda1d35 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_8f7c76d8bdda1d35, 15);
    return var_8f7c76d8bdda1d35;
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c1
// Size: 0x2a
function function_3c3ea73ba0073f0a() {
    var_97a50fc940220bd7 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_97a50fc940220bd7, 6);
    return var_97a50fc940220bd7;
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f3
// Size: 0x19a
function function_52575fe8c8a247f8(death, attacker, mod, sweapon, vpoint, shitloc, modelindex) {
    if (level.var_37f448fda9dfdd24.size > 0) {
        foreach (result_func in level.var_37f448fda9dfdd24) {
            [[ result_func ]](death, attacker, mod, sweapon, vpoint, shitloc, modelindex);
        }
    } else if (isplayer(attacker)) {
        if (isdefined(self.aicategory) && (self.aicategory == "normal" || self.aicategory == "special")) {
            var_8f7c76d8bdda1d35 = function_aada6661ca89c2af();
            success = charm(var_8f7c76d8bdda1d35, attacker, &function_ffefeff2936671f6);
            if (success) {
                self function_65cdab0fc78aba8f(attacker.origin, 2000);
                self.ignoreme = 1;
                params = spawnstruct();
                params.attacker = attacker;
                self.var_941802a0997e0c42 = attacker;
                self.var_dec41e66d2f7fffd = self.maxhealth;
                self.var_988d62e7fca4e8c2 = 0;
                callback::callback("on_turned", params);
                thread function_9814cb5a82d0bc92();
                thread zombie_kill_tracker();
            }
        }
    }
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x594
// Size: 0x3f
function zombie_kill_tracker() {
    self endon("death");
    var_97a50fc940220bd7 = function_3c3ea73ba0073f0a();
    while (self.var_988d62e7fca4e8c2 < var_97a50fc940220bd7) {
        wait(1);
    }
    if (isalive(self)) {
        function_ffefeff2936671f6();
    }
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da
// Size: 0x25
function function_9814cb5a82d0bc92() {
    waitframe();
    if (isdefined(self) && isalive(self)) {
        self.health = self.maxhealth;
    }
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x606
// Size: 0xae
function function_e77373dffa58f4fe() {
    if (istrue(level.var_1b3072262db80fc1["brainrot"].immune_result_direct[self.basearchetype])) {
        return 0;
    }
    if (isdefined(self.var_c3554a26521188a8)) {
        var_bdcbee4500966e0c = [[ self.var_c3554a26521188a8 ]]();
        if (!istrue(var_bdcbee4500966e0c)) {
            return 0;
        }
    }
    foreach (result_func in level.var_fda3ff4feb6c4546) {
        if (!istrue([[ result_func ]]())) {
            return 0;
        }
    }
    return 1;
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bc
// Size: 0x77
function function_ffefeff2936671f6() {
    self.var_f33496b914378bbd = 1;
    playfx(getfx("vfx_zai_exp_aoe_brain_rot"), self.origin);
    if (isplayer(self.var_941802a0997e0c42) && isalive(self.var_941802a0997e0c42)) {
        self kill(self.origin, self.var_941802a0997e0c42);
    } else {
        self kill(self.origin);
    }
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73a
// Size: 0x4b
function function_266be48a55c0cdc5(var_d27680ff86693f5c) {
    if (isdefined(var_d27680ff86693f5c.eattacker) && isdefined(var_d27680ff86693f5c.eattacker.var_941802a0997e0c42)) {
        var_d27680ff86693f5c.eattacker.var_988d62e7fca4e8c2++;
    }
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78c
// Size: 0x7e
function function_4eca2aaa68c96aa0() {
    /#
        foreach (player in level.players) {
            currentweapon = player getcurrentweapon();
            player function_6c40f58b29a952a9(currentweapon, "<unknown string>");
            player iprintlnbold("<unknown string>");
        }
    #/
}

// Namespace brainrot/namespace_73918c307cdbe1ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x811
// Size: 0x30
function function_eb3305baa083c02d() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4eca2aaa68c96aa0, 0);
        function_fe953f000498048f();
    #/
}

