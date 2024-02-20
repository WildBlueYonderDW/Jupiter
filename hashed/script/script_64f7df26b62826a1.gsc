// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_6bffae1b97f70547;
#using script_3214e6fcdce468a7;
#using script_38eb8f4be20d54f4;
#using script_73926eaf280b0b75;

#namespace napalmburst;

// Namespace napalmburst/namespace_c45a18a82a9bca6b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105
// Size: 0x1e4
function function_c1459cd4ebd856d() {
    if (!istrue(level.var_bfa98c9dd6edb929)) {
        return;
    }
    level endon("game_ended");
    flag_wait("ammo_mods_ready");
    flag_init("napalmburst_ready");
    var_746d800f9d085b2a = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_4fb51392aae1ecd2, 0.2);
    var_ad5528a4132dc97d = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_4bf233f673b39379, 0.05);
    var_fb5b2fb3fafc60c7 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_55707674312df73c, 0);
    var_bcbfc6de4213b6af = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_24269ee9413f1198, 3);
    var_60cd3581dc64f213 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_13e6d0008e908b78, 3);
    var_f27a8d5708fd9c4d = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_c36a27ee3aa677b0, 1);
    var_50b2d9031ce3da52 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_d3b2954397f84855, "");
    var_7cd0ba2c2358da52 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_bd6ba7b9f57a662b, "");
    element = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_667e3a3f69aae5ba, "fire");
    level.var_f6b318184143b63e = [];
    level.var_c5af74f2886aa77c = [];
    function_7f759db5de1b44b0("napalmburst", 4, var_746d800f9d085b2a, var_ad5528a4132dc97d, var_fb5b2fb3fafc60c7, var_bcbfc6de4213b6af, var_60cd3581dc64f213, var_f27a8d5708fd9c4d, &function_a428cc7d938fa416, var_50b2d9031ce3da52, var_7cd0ba2c2358da52, &function_af75491a8a4c3790, element);
    flag_set("napalmburst_ready");
    /#
        level thread function_439421327ad70eb();
    #/
}

// Namespace napalmburst/namespace_c45a18a82a9bca6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f0
// Size: 0x22
function function_8d25decb6d23f001(func) {
    level.var_f6b318184143b63e[level.var_f6b318184143b63e.size] = func;
}

// Namespace napalmburst/namespace_c45a18a82a9bca6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x319
// Size: 0x22
function function_7d46ac68b0d2524f(func) {
    level.var_c5af74f2886aa77c[level.var_c5af74f2886aa77c.size] = func;
}

// Namespace napalmburst/namespace_c45a18a82a9bca6b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x342
// Size: 0xbd
function function_a428cc7d938fa416(death, attacker, mod, sweapon, vpoint, shitloc, modelindex) {
    if (level.var_f6b318184143b63e.size > 0) {
        foreach (result_func in level.var_f6b318184143b63e) {
            [[ result_func ]](death, attacker, mod, sweapon, vpoint, shitloc, modelindex);
        }
    } else {
        thread function_9f7e53b0c8a95ee(death, attacker, mod, sweapon, vpoint, shitloc, modelindex);
    }
}

// Namespace napalmburst/namespace_c45a18a82a9bca6b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x406
// Size: 0x12d
function function_9f7e53b0c8a95ee(death, attacker, mod, sweapon, vpoint, shitloc, modelindex) {
    level endon("game_ended");
    self endon("death");
    waitframe();
    if (!isalive(self)) {
        return;
    }
    if (isdefined(self.aicategory) && (self.aicategory == "normal" || self.aicategory == "special")) {
        var_ec7b6ae5eb2558c3 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_ec7b6ae5eb2558c3, 10);
        if (self.aicategory == "special") {
            var_fc4c702fcaf972e4 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_8cb2c6bb805dfe97, 0.025);
        } else {
            var_fc4c702fcaf972e4 = function_53c4c53197386572(level.var_f1240a9ac4f65616.var_fc4c702fcaf972e4, 0.1);
        }
        success = burn(var_ec7b6ae5eb2558c3, var_fc4c702fcaf972e4, 1, attacker, "napalmburst", "napalmburst_kill");
    }
}

// Namespace napalmburst/namespace_c45a18a82a9bca6b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53a
// Size: 0xae
function function_af75491a8a4c3790() {
    if (istrue(level.var_1b3072262db80fc1["napalmburst"].immune_result_direct[self.basearchetype])) {
        return 0;
    }
    if (isdefined(self.var_69fad82b1297b14)) {
        var_9c4fca37dfaf816a = [[ self.var_69fad82b1297b14 ]]();
        if (!istrue(var_9c4fca37dfaf816a)) {
            return 0;
        }
    }
    foreach (result_func in level.var_c5af74f2886aa77c) {
        if (!istrue([[ result_func ]]())) {
            return 0;
        }
    }
    return 1;
}

// Namespace napalmburst/namespace_c45a18a82a9bca6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f0
// Size: 0x7e
function function_746dda921942d946() {
    /#
        foreach (player in level.players) {
            currentweapon = player getcurrentweapon();
            player function_6c40f58b29a952a9(currentweapon, "<unknown string>");
            player iprintlnbold("<unknown string>");
        }
    #/
}

// Namespace napalmburst/namespace_c45a18a82a9bca6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x675
// Size: 0x30
function function_439421327ad70eb() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_746dda921942d946, 0);
        function_fe953f000498048f();
    #/
}

