// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using script_3db04fd1b466bdba;
#using scripts\engine\trace.gsc;
#using script_77c18cdedec620b3;

#namespace toma_strike;

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x740
// Size: 0x38
function function_1ad414b91ae3a040(var_fd773ed7f8ab59de, var_3880925df9d5088c, var_24b393fa046f4151, default_val) {
    function_2ad245efb6cf07aa(var_fd773ed7f8ab59de, var_3880925df9d5088c, var_24b393fa046f4151, default_val, #"int");
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77f
// Size: 0x38
function function_7b9978e4325e037b(var_fd773ed7f8ab59de, var_3880925df9d5088c, var_24b393fa046f4151, default_val) {
    function_2ad245efb6cf07aa(var_fd773ed7f8ab59de, var_3880925df9d5088c, var_24b393fa046f4151, default_val, #"float");
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7be
// Size: 0x5d
function function_2ad245efb6cf07aa(var_fd773ed7f8ab59de, var_3880925df9d5088c, var_24b393fa046f4151, default_val, value_type) {
    level.var_b51c54768ce5dc13[var_fd773ed7f8ab59de] = function_892aec72bcbbbc96(var_3880925df9d5088c, var_24b393fa046f4151, default_val);
    if (isdefined(value_type)) {
        level.var_b51c54768ce5dc13[var_fd773ed7f8ab59de].type = value_type;
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x822
// Size: 0x73
function function_892aec72bcbbbc96(var_3880925df9d5088c, var_24b393fa046f4151, default_val) {
    var_cc2712a8519a8fd1 = spawnstruct();
    if (isdefined(var_3880925df9d5088c)) {
        var_cc2712a8519a8fd1.dvarstr = var_3880925df9d5088c;
    }
    if (isdefined(var_24b393fa046f4151)) {
        var_cc2712a8519a8fd1.var_24b393fa046f4151 = var_24b393fa046f4151;
    }
    if (isdefined(default_val)) {
        var_cc2712a8519a8fd1.default_val = default_val;
    } else {
        var_cc2712a8519a8fd1.default_val = 0;
    }
    return var_cc2712a8519a8fd1;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89d
// Size: 0xe6
function function_2fbfcadcc628d1a9(var_fd773ed7f8ab59de) {
    var_cc2712a8519a8fd1 = level.var_b51c54768ce5dc13[var_fd773ed7f8ab59de];
    if (!isdefined(var_cc2712a8519a8fd1)) {
        return 0;
    }
    if (isdefined(var_cc2712a8519a8fd1.var_24b393fa046f4151)) {
        return var_cc2712a8519a8fd1.var_24b393fa046f4151;
    }
    if (!isdefined(var_cc2712a8519a8fd1.dvarstr) || !isdefined(var_cc2712a8519a8fd1.type)) {
        return var_cc2712a8519a8fd1.default_val;
    }
    if (var_cc2712a8519a8fd1.type == #"float") {
        return getdvarfloat(var_cc2712a8519a8fd1.dvarstr, var_cc2712a8519a8fd1.default_val);
    } else if (var_cc2712a8519a8fd1.type == #"int") {
        return getdvarint(var_cc2712a8519a8fd1.dvarstr, var_cc2712a8519a8fd1.default_val);
    }
    return var_cc2712a8519a8fd1.default_val;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98b
// Size: 0x8e
function init() {
    if (issharedfuncdefined("toma_strike", "init")) {
        [[ getsharedfunc("toma_strike", "init") ]]();
    }
    level.toma_strikes = [];
    level.var_2512ecdb67f24156 = 0;
    level.var_eb94e9ccd3da6b2e = getdvarint(@"hash_f44ae58a97bde793", 0);
    init_toma_strike_vo();
    function_f690e3ac50d71008();
    function_23d581c2a3bc96b3();
    /#
        setdevdvarifuninitialized(@"hash_1eb5365bdad13b78", 0);
        setdevdvarifuninitialized(@"hash_604652367665c1e0", 1);
    #/
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa20
// Size: 0x60
function init_toma_strike_vo() {
    game["dialog"]["toma_strike" + "_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["toma_strike" + "_hit_target"] = "killstreak_remote_operator" + "_hit_target";
    game["dialog"]["toma_strike" + "_miss_target"] = "killstreak_remote_operator" + "_miss_target";
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa87
// Size: 0x58
function function_f690e3ac50d71008() {
    level.var_d05191e44c57d2f7 = "toma_strike_placement";
    val::function_2d6e7e0b80767910(level.var_d05191e44c57d2f7, [0:"offhand_weapons", 1:"melee", 2:"execution_attack", 3:"weapon_pickup", 4:"cp_munitions_pickup", 5:"supers"]);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae6
// Size: 0x44f
function function_75667e2fe77b75c5(var_db99a5290e2a0cd0) {
    bundle = isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"]) ? {var_d2a6e2899c72649b:undefined} : level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"];
    level.var_d2a6e2899c72649b = isdefined(bundle.var_d2a6e2899c72649b) ? "toma_proj_mp" : bundle.var_d2a6e2899c72649b;
    if (var_db99a5290e2a0cd0 == 1) {
        function_1ad414b91ae3a040(#"hash_56384a128dec0dac", @"hash_ca710d92e3e6f796", bundle.var_ef6057a8dee4db1a, 900);
        function_1ad414b91ae3a040(#"hash_2dea788eca3bc99a", @"hash_fa567925d565ce1f", bundle.var_a20f464e59b5af88, 5);
        function_1ad414b91ae3a040(#"num_waves", @"hash_5f34f197c71def3c", bundle.var_f7545ca62e446f27, 4);
        function_1ad414b91ae3a040(#"hash_3082f1a04b68416a", @"hash_9d9d004060864d1f", bundle.var_11743a7230976341, 4);
        function_7b9978e4325e037b(#"hash_6f7dfd81108ea213", @"hash_791db5592ca32e41", bundle.var_977070ec24e2ee7d, 3.25);
        function_7b9978e4325e037b(#"hash_38f03def4a4b6115", @"hash_6b6230528e92a697", bundle.var_80df958a7ebd91eb, 4);
        function_7b9978e4325e037b(#"hash_de33a7ef4ddea7d8", @"hash_4539fb841b0d72ce", bundle.var_d2dd5ea126e7f952, 0.5);
        function_7b9978e4325e037b(#"hash_fd5d123893ddc96a", @"hash_32f455fe26173e84", bundle.var_79d55329c3be1430, 0.75);
    } else if (var_db99a5290e2a0cd0 == 2) {
        function_1ad414b91ae3a040(#"hash_56384a128dec0dac", @"hash_ca710d92e3e6f796", bundle.var_ef6057a8dee4db1a, 50);
        function_1ad414b91ae3a040(#"hash_2dea788eca3bc99a", @"hash_fa567925d565ce1f", bundle.var_a20f464e59b5af88, 0);
        function_1ad414b91ae3a040(#"num_waves", @"hash_5f34f197c71def3c", bundle.var_f7545ca62e446f27, 1);
        function_1ad414b91ae3a040(#"hash_3082f1a04b68416a", @"hash_9d9d004060864d1f", bundle.var_11743a7230976341, 14);
        function_7b9978e4325e037b(#"hash_6f7dfd81108ea213", @"hash_791db5592ca32e41", bundle.var_977070ec24e2ee7d, 3.25);
        function_7b9978e4325e037b(#"hash_38f03def4a4b6115", @"hash_6b6230528e92a697", bundle.var_80df958a7ebd91eb, 4);
        function_7b9978e4325e037b(#"hash_de33a7ef4ddea7d8", @"hash_4539fb841b0d72ce", bundle.var_d2dd5ea126e7f952, 0.2);
        function_7b9978e4325e037b(#"hash_fd5d123893ddc96a", @"hash_32f455fe26173e84", bundle.var_79d55329c3be1430, 0.8);
    } else {
        function_1ad414b91ae3a040(#"hash_56384a128dec0dac", @"hash_ca710d92e3e6f796", bundle.var_ef6057a8dee4db1a, 450);
        function_1ad414b91ae3a040(#"hash_2dea788eca3bc99a", @"hash_fa567925d565ce1f", bundle.var_a20f464e59b5af88, 2);
        function_1ad414b91ae3a040(#"num_waves", @"hash_5f34f197c71def3c", bundle.var_f7545ca62e446f27, 4);
        function_1ad414b91ae3a040(#"hash_3082f1a04b68416a", @"hash_9d9d004060864d1f", bundle.var_11743a7230976341, 4);
        function_7b9978e4325e037b(#"hash_6f7dfd81108ea213", @"hash_791db5592ca32e41", bundle.var_977070ec24e2ee7d, 3.25);
        function_7b9978e4325e037b(#"hash_38f03def4a4b6115", @"hash_6b6230528e92a697", bundle.var_80df958a7ebd91eb, 4);
        function_7b9978e4325e037b(#"hash_de33a7ef4ddea7d8", @"hash_4539fb841b0d72ce", bundle.var_d2dd5ea126e7f952, 0.5);
        function_7b9978e4325e037b(#"hash_fd5d123893ddc96a", @"hash_32f455fe26173e84", bundle.var_79d55329c3be1430, 0.75);
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3c
// Size: 0xca
function function_23d581c2a3bc96b3() {
    setdvarifuninitialized(@"hash_1eb5365bdad13b78", 0);
    setdvarifuninitialized(@"hash_ca710d92e3e6f796", 450);
    setdvarifuninitialized(@"hash_fa567925d565ce1f", 2);
    setdvarifuninitialized(@"hash_3417b331cd0f5b4f", 6);
    setdvarifuninitialized(@"hash_5f34f197c71def3c", 4);
    setdvarifuninitialized(@"hash_9d9d004060864d1f", 4);
    setdvarifuninitialized(@"hash_791db5592ca32e41", 3.25);
    setdvarifuninitialized(@"hash_6b6230528e92a697", 4);
    setdvarifuninitialized(@"hash_4539fb841b0d72ce", 0.5);
    setdvarifuninitialized(@"hash_32f455fe26173e84", 0.75);
    setdvarifuninitialized(@"hash_a394734820792b88", 4);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100d
// Size: 0x2be
function function_cad492faa20c3feb(var_f3f8aa78862a0804) {
    var_db99a5290e2a0cd0 = getdvarint(@"hash_1eb5365bdad13b78", 0);
    if (var_db99a5290e2a0cd0 == var_f3f8aa78862a0804) {
        return;
    }
    if (var_f3f8aa78862a0804 == 0) {
        setdvar(@"hash_1eb5365bdad13b78", 0);
        setdvar(@"hash_ca710d92e3e6f796", 450);
        setdvar(@"hash_fa567925d565ce1f", 2);
        setdvar(@"hash_3417b331cd0f5b4f", 6);
        setdvar(@"hash_5f34f197c71def3c", 4);
        setdvar(@"hash_9d9d004060864d1f", 4);
        setdvar(@"hash_791db5592ca32e41", 3.25);
        setdvar(@"hash_6b6230528e92a697", 4);
        setdvar(@"hash_4539fb841b0d72ce", 0.5);
        setdvar(@"hash_32f455fe26173e84", 0.75);
        setdvar(@"hash_a394734820792b88", 4);
    } else if (var_f3f8aa78862a0804 == 1) {
        setdvar(@"hash_1eb5365bdad13b78", 1);
        setdvar(@"hash_ca710d92e3e6f796", 900);
        setdvar(@"hash_fa567925d565ce1f", 5);
        setdvar(@"hash_3417b331cd0f5b4f", 6);
        setdvar(@"hash_5f34f197c71def3c", 4);
        setdvar(@"hash_9d9d004060864d1f", 4);
        setdvar(@"hash_791db5592ca32e41", 3.25);
        setdvar(@"hash_6b6230528e92a697", 4);
        setdvar(@"hash_4539fb841b0d72ce", 0.5);
        setdvar(@"hash_32f455fe26173e84", 0.75);
        setdvar(@"hash_a394734820792b88", 4);
    } else if (var_f3f8aa78862a0804 == 2) {
        setdvar(@"hash_1eb5365bdad13b78", 2);
        setdvar(@"hash_ca710d92e3e6f796", 50);
        setdvar(@"hash_fa567925d565ce1f", 0);
        setdvar(@"hash_3417b331cd0f5b4f", 14);
        setdvar(@"hash_5f34f197c71def3c", 1);
        setdvar(@"hash_9d9d004060864d1f", 14);
        setdvar(@"hash_791db5592ca32e41", 3.25);
        setdvar(@"hash_6b6230528e92a697", 4);
        setdvar(@"hash_4539fb841b0d72ce", 0.2);
        setdvar(@"hash_32f455fe26173e84", 0.8);
        setdvar(@"hash_a394734820792b88", 1.5);
    }
    self.var_70b761d63979e102 = getdvarfloat(@"hash_a394734820792b88", 4) - 0.075;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d2
// Size: 0x3e
function trytomastriketriggered(streakinfo) {
    streakname = streakinfo.streakname;
    var_db99a5290e2a0cd0 = getdvarint(@"hash_1eb5365bdad13b78", 0);
    return 1;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1318
// Size: 0xb3
function gettimeremaining() {
    var_aea16e6a3159cbda = undefined;
    foreach (strike in level.toma_strikes) {
        timeleft = int(max(1, strike.var_7bf1255a3715a632 + strike.var_fc1e1636b43c53ed * 1000 - gettime()));
        if (!isdefined(var_aea16e6a3159cbda) || timeleft < var_aea16e6a3159cbda) {
            var_aea16e6a3159cbda = timeleft;
        }
    }
    return int(function_c89ed1840c8d0f0f(var_aea16e6a3159cbda)) + 1;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d3
// Size: 0xc5
function weapongiventomastrike(streakinfo) {
    if (isdefined(level.toma_strikes) && level.toma_strikes.size >= 2) {
        if (istrue(level.var_eb94e9ccd3da6b2e)) {
            timesec = gettimeremaining();
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED_TIME", timesec);
            }
        } else if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    if (function_b1412f0ab907bab7()) {
        self setclientomnvar("ui_using_clusterstrike", 1);
    }
    return 1;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a0
// Size: 0x14e
function weaponfiredtomastrike(streakinfo, var_a9dd4e8c5e5c7178, var_b663fbbcbb2f5780) {
    if (!isdefined(streakinfo.targetoverride)) {
        var_b21e2e887c161b9 = tomastrike_getownerlookat(self);
        if (!isdefined(var_b21e2e887c161b9)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/INVALID_POINT");
            }
            return "continue";
        }
    }
    if (function_f3890748bda5f813()) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            if (iscp()) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("EQUIPMENT/ARMAMENT_CANNOT_BE_USED");
            } else {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/CANNOT_BE_USED");
            }
        }
        return "continue";
    }
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 3;
    }
    thread function_d1b8339c6ab7b1fa("toma_strike", "toma_strike" + "_use", 1, var_52a5be2e2f91d710);
    if (function_b1412f0ab907bab7()) {
        self setclientomnvar("ui_using_clusterstrike", 0);
    }
    return "success";
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f6
// Size: 0x21
function tryusetomastrike() {
    streakinfo = function_bc5bcad4a3bbd734("toma_strike", self);
    return tryusetomastrikefromstruct(streakinfo);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161f
// Size: 0x1b3
function tryusetomastrikefromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_db99a5290e2a0cd0 = function_717a6e5e13464b20();
    function_75667e2fe77b75c5(var_db99a5290e2a0cd0);
    if (var_db99a5290e2a0cd0 == 1 && isdefined(self.kstargetlocation)) {
        streakinfo.targetoverride = self.kstargetlocation;
        self.kstargetlocation = undefined;
        var_9cf1d5b97d062b8a = weaponfiredtomastrike(streakinfo, undefined, undefined);
        if (var_9cf1d5b97d062b8a != "success") {
            return 0;
        }
    } else {
        if (isdefined(level.var_d05191e44c57d2f7)) {
            streakinfo.var_fb58a31c756db4cc = level.var_d05191e44c57d2f7;
        }
        var_9b1deb5e9d32bbe3 = function_de31b76c1bf488e8(streakinfo, makeweapon("iw9_laser_large_ir_mp"), "weapon_fired", &weapongiventomastrike, undefined, &weaponfiredtomastrike);
        if (!istrue(var_9b1deb5e9d32bbe3)) {
            if (function_b1412f0ab907bab7()) {
                self setclientomnvar("ui_using_clusterstrike", 0);
            }
            return 0;
        }
    }
    self playlocalsound("kls_location_select");
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_toma_strike", self);
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.streakname, self.origin);
    }
    starttomastrike(var_db99a5290e2a0cd0, streakinfo);
    return 1;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17da
// Size: 0x8f
function function_717a6e5e13464b20() {
    var_db99a5290e2a0cd0 = getdvarint(@"hash_1eb5365bdad13b78", 0);
    var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (var_e005d4b70d6f2611 && isplayer(self)) {
        var_db99a5290e2a0cd0 = 1;
        function_cad492faa20c3feb(var_db99a5290e2a0cd0);
    } else if (isagent(self)) {
        var_db99a5290e2a0cd0 = 2;
        function_cad492faa20c3feb(var_db99a5290e2a0cd0);
    } else {
        var_db99a5290e2a0cd0 = 0;
    }
    function_cad492faa20c3feb(var_db99a5290e2a0cd0);
    return var_db99a5290e2a0cd0;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1871
// Size: 0x160
function function_5d38cccb518046f6(target, var_44b5105c6f71bc85, var_6530ac0c11cac0f8, var_fc2a5d82867fc3a1) {
    var_db99a5290e2a0cd0 = function_717a6e5e13464b20();
    function_75667e2fe77b75c5(var_db99a5290e2a0cd0);
    if (var_db99a5290e2a0cd0 == 2) {
        if (isdefined(var_44b5105c6f71bc85)) {
            self.var_624e594faf861476 = var_44b5105c6f71bc85;
            self.var_6ac9ab8269fb85d1 = var_6530ac0c11cac0f8;
        }
        if (isdefined(var_fc2a5d82867fc3a1)) {
            if (isdefined(target) && isplayer(target) && isdefined(target.vehicle) && isdefined(target.vehicle.vehiclename)) {
                setdvar(@"hash_a394734820792b88", var_fc2a5d82867fc3a1.var_a344cd99b1752579);
                self.var_70b761d63979e102 = var_fc2a5d82867fc3a1.var_a344cd99b1752579 - 0.075;
            } else {
                setdvar(@"hash_a394734820792b88", var_fc2a5d82867fc3a1.var_2c0d2f5a54b626c8);
                self.var_70b761d63979e102 = var_fc2a5d82867fc3a1.var_2c0d2f5a54b626c8 - 0.075;
            }
        }
    }
    streakinfo = function_bc5bcad4a3bbd734("toma_strike", self);
    var_667382a9bcab1e3f = function_d46771d03c3e46fa();
    level.toma_strikes[var_667382a9bcab1e3f] = self;
    function_e744d4edafed7523(var_667382a9bcab1e3f, var_db99a5290e2a0cd0, target);
    tomastrike_attacktarget(var_db99a5290e2a0cd0, undefined, target, streakinfo, var_667382a9bcab1e3f);
    level.toma_strikes[var_667382a9bcab1e3f] = undefined;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d8
// Size: 0xcd
function starttomastrike(var_ebfc9454321cb5c3, streakinfo) {
    var_667382a9bcab1e3f = function_d46771d03c3e46fa();
    function_e744d4edafed7523(var_667382a9bcab1e3f, var_ebfc9454321cb5c3);
    thread tomastrike_watchgameend(var_667382a9bcab1e3f, streakinfo);
    thread function_817d8b8f6d28b2b7(var_667382a9bcab1e3f, streakinfo);
    thread function_bb7e41c7f2afb421(var_667382a9bcab1e3f);
    thread tomastrike_attacktarget(var_ebfc9454321cb5c3, undefined, undefined, streakinfo, var_667382a9bcab1e3f);
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    if (issharedfuncdefined("toma_strike", "munitionUsed")) {
        self [[ getsharedfunc("toma_strike", "munitionUsed") ]]();
    }
    if (issharedfuncdefined("player", "doOnActionScoreEvent")) {
        self [[ getsharedfunc("player", "doOnActionScoreEvent") ]](2, "tomaStrikeUsed");
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aac
// Size: 0xec
function tomastrike_getownerlookat(owner) {
    content = [0:"physicscontents_water", 1:"physicscontents_clipshot", 2:"physicscontents_missileclip", 3:"physicscontents_vehicle"];
    contentoverride = physics_createcontents(content);
    starttrace = owner getvieworigin();
    if (owner function_2f8556207c6fd79f()) {
        starttrace = owner function_aef9ca498b472945();
    }
    endtrace = starttrace + anglestoforward(owner getplayerangles()) * 50000;
    ignoreents = owner function_b01aad7f0553d2c8();
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignoreents, contentoverride);
    endpos = undefined;
    if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none") {
        endpos = trace["position"];
    }
    return endpos;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba0
// Size: 0x4f
function function_d46771d03c3e46fa() {
    level.var_2512ecdb67f24156++;
    if (getdvarint(@"hash_1eb5365bdad13b78", 0) == 2) {
        return (self getentitynumber() + "_" + level.var_2512ecdb67f24156);
    }
    return self getxuid() + "_" + level.var_2512ecdb67f24156;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf7
// Size: 0x32
function tomastrike_watchgameend(var_667382a9bcab1e3f, streakinfo) {
    level endon("toma_strike_clean_up_" + var_667382a9bcab1e3f);
    level waittill("game_ended");
    if (isdefined(self)) {
        function_fd8ddf2e23d31475(streakinfo);
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c30
// Size: 0x5e
function function_817d8b8f6d28b2b7(var_667382a9bcab1e3f, streakinfo) {
    level endon("game_ended");
    level thread function_9bdb853be512d3ed("disconnect", var_667382a9bcab1e3f, self);
    level thread function_9bdb853be512d3ed("toma_strike_finished_" + var_667382a9bcab1e3f, var_667382a9bcab1e3f);
    level waittill("toma_strike_clean_up_" + var_667382a9bcab1e3f);
    if (isdefined(self)) {
        function_fd8ddf2e23d31475(streakinfo);
    }
    level.toma_strikes[var_667382a9bcab1e3f] = undefined;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c95
// Size: 0x47
function function_9bdb853be512d3ed(var_bf4a0adf8e2321fe, var_667382a9bcab1e3f, player) {
    level endon("toma_strike_clean_up_" + var_667382a9bcab1e3f);
    var_c586ec36655fd62f = level;
    if (isdefined(player)) {
        var_c586ec36655fd62f = player;
    }
    var_c586ec36655fd62f waittill(var_bf4a0adf8e2321fe);
    level notify("toma_strike_clean_up_" + var_667382a9bcab1e3f);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce3
// Size: 0x91
function function_bb7e41c7f2afb421(var_667382a9bcab1e3f) {
    level endon("game_ended");
    self notify("toma_strike_watch_kills");
    self endon("toma_strike_watch_kills");
    self.var_effda3765a5caf17 = 0;
    childthread function_44ffb652b0e5c138(var_667382a9bcab1e3f);
    childthread function_9b8a16f9169ac8b2(var_667382a9bcab1e3f);
    level waittill("toma_strike_finished_" + var_667382a9bcab1e3f);
    if (isdefined(self)) {
        if (self.var_effda3765a5caf17 >= 1) {
            function_d1b8339c6ab7b1fa("toma_strike", "toma_strike" + "_hit_target", 1);
        } else {
            function_d1b8339c6ab7b1fa("toma_strike", "toma_strike" + "_miss_target", 1);
        }
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d7b
// Size: 0x59
function function_44ffb652b0e5c138(var_667382a9bcab1e3f) {
    level endon("toma_strike_finished_" + var_667382a9bcab1e3f);
    while (isdefined(self)) {
        var_366b0ecc2f28aead = recentkillcount = self waittill("update_rapid_kill_buffered");
        if (isdefined(var_366b0ecc2f28aead) && var_366b0ecc2f28aead == level.var_d2a6e2899c72649b) {
            self.var_effda3765a5caf17++;
        }
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ddb
// Size: 0x59
function function_9b8a16f9169ac8b2(var_667382a9bcab1e3f) {
    level endon("toma_strike_finished_" + var_667382a9bcab1e3f);
    while (isdefined(self)) {
        var_366b0ecc2f28aead = recentkillcount = self waittill("update_rapid_agent_kill_buffered");
        if (isdefined(var_366b0ecc2f28aead) && var_366b0ecc2f28aead == level.var_d2a6e2899c72649b) {
            self.var_effda3765a5caf17++;
        }
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3b
// Size: 0x36a
function function_e744d4edafed7523(var_667382a9bcab1e3f, var_ebfc9454321cb5c3, target) {
    level.toma_strikes[var_667382a9bcab1e3f] = spawnstruct();
    level.toma_strikes[var_667382a9bcab1e3f].var_7bf1255a3715a632 = gettime();
    level.toma_strikes[var_667382a9bcab1e3f].var_fc1e1636b43c53ed = function_2fbfcadcc628d1a9(#"hash_2dea788eca3bc99a");
    level.toma_strikes[var_667382a9bcab1e3f].var_d1defcdabebfb1a = [];
    explosiontype = getdvarint(@"hash_604652367665c1e0", 1);
    var_4cb267f38b5de2f2 = function_2fbfcadcc628d1a9(#"num_waves");
    var_c1ca10e800f3bb3b = function_2fbfcadcc628d1a9(#"hash_3082f1a04b68416a");
    var_9e29352ba1d54508 = function_2fbfcadcc628d1a9(#"hash_6f7dfd81108ea213");
    var_fbc8bef50e9d8f8a = function_2fbfcadcc628d1a9(#"hash_38f03def4a4b6115");
    var_55811e2f54b0b1 = function_2fbfcadcc628d1a9(#"hash_de33a7ef4ddea7d8");
    var_61ef97f2418800cb = function_2fbfcadcc628d1a9(#"hash_fd5d123893ddc96a");
    if (explosiontype == 1) {
        if (var_ebfc9454321cb5c3 == 2) {
            if (isdefined(level.ob.var_bfc5850d296d2ebe["Rainmaker"])) {
                var_c1ca10e800f3bb3b = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_4dd5c4885e94aaaa;
                var_4cb267f38b5de2f2 = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_a8b72b0b7f481d0b;
            }
        }
        level.toma_strikes[var_667382a9bcab1e3f].wavedelay = [];
        for (i = 0; i < var_4cb267f38b5de2f2; i++) {
            level.toma_strikes[var_667382a9bcab1e3f].var_d1defcdabebfb1a[i] = [];
            for (j = 0; j < var_c1ca10e800f3bb3b; j++) {
                timetowait = randomfloatrange(var_55811e2f54b0b1, var_61ef97f2418800cb);
                level.toma_strikes[var_667382a9bcab1e3f].var_fc1e1636b43c53ed = level.toma_strikes[var_667382a9bcab1e3f].var_fc1e1636b43c53ed + timetowait;
                level.toma_strikes[var_667382a9bcab1e3f].var_d1defcdabebfb1a[i][j] = timetowait;
            }
            timetowait = randomfloatrange(var_9e29352ba1d54508, var_fbc8bef50e9d8f8a);
            level.toma_strikes[var_667382a9bcab1e3f].var_fc1e1636b43c53ed = level.toma_strikes[var_667382a9bcab1e3f].var_fc1e1636b43c53ed + timetowait;
            level.toma_strikes[var_667382a9bcab1e3f].wavedelay[i] = timetowait;
        }
    } else {
        var_57acadc40b2f0a8 = function_19051844ba5d9143(var_ebfc9454321cb5c3);
        radius = var_57acadc40b2f0a8[1];
        var_d52eb0b612b4aaa2 = var_57acadc40b2f0a8[0];
        for (i = 0; i < var_d52eb0b612b4aaa2; i++) {
            timetowait = randomfloatrange(1.35, 2.5);
            level.toma_strikes[var_667382a9bcab1e3f].var_fc1e1636b43c53ed = level.toma_strikes[var_667382a9bcab1e3f].var_fc1e1636b43c53ed + timetowait;
            level.toma_strikes[var_667382a9bcab1e3f].var_d1defcdabebfb1a[i] = timetowait;
        }
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x21ac
// Size: 0x40
function function_f05afcd1f818600(var_667382a9bcab1e3f, explosiontype, var_2942061b33337051) {
    /#
        assert(explosiontype != 1);
    #/
    return level.toma_strikes[var_667382a9bcab1e3f].var_d1defcdabebfb1a[var_2942061b33337051];
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f4
// Size: 0x4a
function function_db43c64d90389bec(var_667382a9bcab1e3f, explosiontype, var_2648b8fc988ecd74, var_2942061b33337051) {
    /#
        assert(explosiontype == 1);
    #/
    return level.toma_strikes[var_667382a9bcab1e3f].var_d1defcdabebfb1a[var_2648b8fc988ecd74][var_2942061b33337051];
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2246
// Size: 0x40
function function_2a08e4b3be6f5721(var_667382a9bcab1e3f, explosiontype, var_2648b8fc988ecd74) {
    /#
        assert(explosiontype == 1);
    #/
    return level.toma_strikes[var_667382a9bcab1e3f].wavedelay[var_2648b8fc988ecd74];
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228e
// Size: 0x4a
function function_19051844ba5d9143(var_ebfc9454321cb5c3) {
    var_d52eb0b612b4aaa2 = getdvarint(@"hash_3417b331cd0f5b4f");
    radius = function_2fbfcadcc628d1a9(#"hash_56384a128dec0dac");
    return [0:var_d52eb0b612b4aaa2, 1:radius];
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e0
// Size: 0x22
function function_79762e7627b23945(var_667382a9bcab1e3f) {
    return level.toma_strikes[var_667382a9bcab1e3f].var_d1defcdabebfb1a.size;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x230a
// Size: 0x2c
function function_8e60d713e3da2f08(var_667382a9bcab1e3f, var_6dff277d92c172c5) {
    return level.toma_strikes[var_667382a9bcab1e3f].var_d1defcdabebfb1a[var_6dff277d92c172c5].size;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233e
// Size: 0x859
function tomastrike_attacktarget(var_ebfc9454321cb5c3, vehicle, marker, streakinfo, var_667382a9bcab1e3f) {
    self endon("disconnect");
    level endon("game_ended");
    self notify("drone_target_placed");
    streakinfo.shots_fired++;
    var_cb6109df81ef0dc = self.origin + (0, 0, 5000) - anglestoforward(self.angles) * 5000;
    var_773a048a6c827187 = anglestoright(self.angles);
    var_4d8559e1e8d5ff3d = undefined;
    if (isdefined(marker)) {
        if (isvector(marker)) {
            var_4d8559e1e8d5ff3d = marker;
        } else {
            var_4d8559e1e8d5ff3d = marker.origin;
        }
    } else {
        if (var_ebfc9454321cb5c3 == 1 && isdefined(streakinfo.targetoverride)) {
            var_4d8559e1e8d5ff3d = streakinfo.targetoverride;
        } else {
            var_4d8559e1e8d5ff3d = tomastrike_getownerlookat(self);
        }
        if (!isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"])) {
            goto LOC_0000021a;
        }
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"];
        marker = spawn("script_model", var_4d8559e1e8d5ff3d);
        marker setmodel(isdefined(bundle.var_fcca389ece98b4a3) ? "ks_toma_strike_marker_mp" : bundle.var_fcca389ece98b4a3);
        marker.objidnum = 0;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "requestObjectiveID")) {
            marker.objidnum = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "requestObjectiveID") ]](99);
        }
        marker.icon = "icon_waypoint_clusterstrike";
        marker setotherent(self);
        marker toma_strike_setmarkerobjective(marker.objidnum, marker.icon, self, 50);
        marker thread toma_strike_handlemarkerscriptable();
    }
    if (function_ccf98e6391dd38b9()) {
        self.marker = marker;
        thread function_99347dc58ab12b57(marker.origin);
    }
    var_d52eb0b612b4aaa2 = getdvarint(@"hash_3417b331cd0f5b4f", 6);
    radius = function_2fbfcadcc628d1a9(#"hash_56384a128dec0dac");
    if (var_ebfc9454321cb5c3 == 1) {
        if (issharedfuncdefined("br", "challengeEvaluator")) {
            var_cd37ce775909957b = spawnstruct();
            var_cd37ce775909957b.streakinfo = streakinfo;
            var_cd37ce775909957b.targetsite = var_4d8559e1e8d5ff3d;
            self [[ getsharedfunc("br", "challengeEvaluator") ]]("br_mastery_pointBlank_tomahawk", var_cd37ce775909957b);
        }
    }
    function_940b2080e171a9d3(self, self.team, radius + 300, streakinfo.streakname, var_4d8559e1e8d5ff3d);
    delaytime = function_2fbfcadcc628d1a9(#"hash_2dea788eca3bc99a");
    var_d77253c873d2b420 = anglestoforward(self getplayerangles());
    ownerforward = anglestoforward(self.angles);
    var_3c5a1b26c6973c2a = anglestoright(self.angles);
    function_2284137aa92dbd16(delaytime);
    /#
        var_837704e088e0a4a5 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (var_837704e088e0a4a5) {
            thread namespace_d8bd5ac27a00a48d::debug_sphere(var_4d8559e1e8d5ff3d, 20, (1, 1, 1), 20);
        }
    #/
    explosiontype = getdvarint(@"hash_604652367665c1e0", 1);
    if (!isdefined(self.var_624e594faf861476)) {
        self.var_624e594faf861476 = 4000;
    }
    var_5e81359581486a4a = self.var_624e594faf861476 * self.var_624e594faf861476;
    if (!isdefined(self.var_6ac9ab8269fb85d1)) {
        self.var_6ac9ab8269fb85d1 = 0;
    }
    var_ab7ba1695185b1f5 = self.var_6ac9ab8269fb85d1 * self.var_6ac9ab8269fb85d1;
    if (explosiontype == 1) {
        if (isdefined(level.var_b67b5f9dfe488c2f)) {
            thread [[ level.var_b67b5f9dfe488c2f ]](streakinfo);
        }
        var_4cb267f38b5de2f2 = function_79762e7627b23945(var_667382a9bcab1e3f);
        for (i = 0; i < var_4cb267f38b5de2f2; i++) {
            var_c1ca10e800f3bb3b = function_8e60d713e3da2f08(var_667382a9bcab1e3f, i);
            var_61ef97f2418800cb = undefined;
            var_55811e2f54b0b1 = undefined;
            var_fbc8bef50e9d8f8a = undefined;
            var_9e29352ba1d54508 = undefined;
            if (isdefined(level.ob) && isdefined(level.ob.var_bfc5850d296d2ebe) && isdefined(level.ob.var_bfc5850d296d2ebe["Rainmaker"])) {
                if (isdefined(marker) && isplayer(marker) && isdefined(marker.vehicle) && isdefined(marker.vehicle.vehiclename)) {
                    var_61ef97f2418800cb = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_4b6686b7eee42901.var_a344cd99b1752579;
                    var_55811e2f54b0b1 = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_55811e2f54b0b1.var_a344cd99b1752579;
                    var_fbc8bef50e9d8f8a = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_fbc8bef50e9d8f8a.var_a344cd99b1752579;
                    var_9e29352ba1d54508 = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_9e29352ba1d54508.var_a344cd99b1752579;
                } else {
                    var_61ef97f2418800cb = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_4b6686b7eee42901.var_2c0d2f5a54b626c8;
                    var_55811e2f54b0b1 = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_55811e2f54b0b1.var_2c0d2f5a54b626c8;
                    var_fbc8bef50e9d8f8a = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_fbc8bef50e9d8f8a.var_2c0d2f5a54b626c8;
                    var_9e29352ba1d54508 = level.ob.var_bfc5850d296d2ebe["Rainmaker"].var_9e29352ba1d54508.var_2c0d2f5a54b626c8;
                }
            }
            for (j = 0; j < var_c1ca10e800f3bb3b; j++) {
                if (var_ebfc9454321cb5c3 == 2) {
                    enemyplayer = marker;
                    targetposition = enemyplayer.origin;
                    if (isdefined(self.var_45f1d0774d6a1062)) {
                        targetposition = [[ self.var_45f1d0774d6a1062 ]](j, function_d46771d03c3e46fa(), enemyplayer);
                    }
                    if (isdefined(targetposition)) {
                        var_fa378e997a33a137 = findunobstructedfiringinfo(targetposition, radius, var_d77253c873d2b420, ownerforward, var_3c5a1b26c6973c2a);
                        thread tomastrike_firestrike(var_ebfc9454321cb5c3, var_fa378e997a33a137, streakinfo);
                    }
                } else {
                    var_fa378e997a33a137 = findunobstructedfiringinfo(var_4d8559e1e8d5ff3d, radius, var_d77253c873d2b420, ownerforward, var_3c5a1b26c6973c2a);
                    thread tomastrike_firestrike(var_ebfc9454321cb5c3, var_fa378e997a33a137, streakinfo);
                }
                if (isdefined(var_61ef97f2418800cb) && isdefined(var_55811e2f54b0b1)) {
                    timetowait = randomfloatrange(var_55811e2f54b0b1, var_61ef97f2418800cb);
                    wait(timetowait);
                } else {
                    timetowait = function_db43c64d90389bec(var_667382a9bcab1e3f, explosiontype, i, j);
                    wait(timetowait);
                }
            }
            if (isdefined(var_fbc8bef50e9d8f8a) && isdefined(var_9e29352ba1d54508)) {
                timetowait = randomfloatrange(var_9e29352ba1d54508, var_fbc8bef50e9d8f8a);
                wait(timetowait);
            } else {
                timetowait = function_2a08e4b3be6f5721(var_667382a9bcab1e3f, explosiontype, i);
                wait(timetowait);
            }
        }
    } else {
        for (i = 0; i < var_d52eb0b612b4aaa2; i++) {
            if (var_ebfc9454321cb5c3 == 2) {
                var_fa378e997a33a137 = findunobstructedfiringinfo(marker.origin, radius, var_d77253c873d2b420, ownerforward, var_3c5a1b26c6973c2a);
            } else {
                var_fa378e997a33a137 = findunobstructedfiringinfo(var_4d8559e1e8d5ff3d, radius, var_d77253c873d2b420, ownerforward, var_3c5a1b26c6973c2a);
            }
            thread tomastrike_firestrike(var_ebfc9454321cb5c3, var_fa378e997a33a137, streakinfo);
            function_2284137aa92dbd16(randomfloatrange(1.35, 2.5));
        }
    }
    if (isdefined(level.var_f56a88761038798b)) {
        thread [[ level.var_f56a88761038798b ]](streakinfo);
    }
    level notify("toma_strike_finished_" + var_667382a9bcab1e3f);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9e
// Size: 0xae
function function_99347dc58ab12b57(center) {
    wait(6);
    var_6bb1b1677e0a4cf2 = createnavbadplacebyshape(center, (0, 0, 0), 8, 400, 500);
    wait(4);
    if (isdefined(var_6bb1b1677e0a4cf2)) {
        destroynavobstacle(var_6bb1b1677e0a4cf2);
    }
    var_6bb1b0677e0a4abf = createnavbadplacebyshape(center, (0, 0, 0), 8, 600, 500);
    wait(4);
    if (isdefined(var_6bb1b0677e0a4abf)) {
        destroynavobstacle(var_6bb1b0677e0a4abf);
    }
    var_6bb1af677e0a488c = createnavbadplacebyshape(center, (0, 0, 0), 8, 800, 500);
    wait(22);
    if (isdefined(var_6bb1af677e0a488c)) {
        destroynavobstacle(var_6bb1af677e0a488c);
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c53
// Size: 0x254
function findunobstructedfiringinfo(var_27c77d35f1de2019, var_a0edd3f59d938fb1, var_d77253c873d2b420, ownerforward, var_3c5a1b26c6973c2a) {
    gravity = getdvarint(@"hash_b5d7d39d32720e78", 800);
    if (getdvarint(@"hash_12ca000dd2976ebc", 0)) {
        gravity = getdvarfloat(@"hash_2f4cf62df1af9a6", 125);
    }
    var_fa378e997a33a137 = spawnstruct();
    var_cb6109df81ef0dc = tomastrike_findoptimallaunchpos(var_27c77d35f1de2019, var_d77253c873d2b420, ownerforward, var_3c5a1b26c6973c2a);
    var_a78cd67f5364240c = vectornormalize(var_27c77d35f1de2019 - (var_cb6109df81ef0dc[0], var_cb6109df81ef0dc[1], 0));
    var_1f0ff6559c9092d0 = tomastrike_getrandombombingpoint(var_27c77d35f1de2019, var_a0edd3f59d938fb1, var_a78cd67f5364240c);
    var_dea0d8baceebf59b = (0, 0, -1 * gravity);
    traveltime = getdvarfloat(@"hash_a394734820792b88", 4);
    var_556b5972dbd50cf4 = (var_1f0ff6559c9092d0.point - 0.5 * var_dea0d8baceebf59b * squared(traveltime) - var_cb6109df81ef0dc) / traveltime;
    /#
        var_837704e088e0a4a5 = getdvarint(@"hash_920f0586653a26d4", 0);
        if (var_837704e088e0a4a5) {
            thread namespace_d8bd5ac27a00a48d::debug_sphere(var_1f0ff6559c9092d0.point, 20, (1, 1, 0), 20);
            thread namespace_d8bd5ac27a00a48d::debug_line(var_cb6109df81ef0dc, var_1f0ff6559c9092d0.point, (1, 1, 0), 20);
        }
    #/
    if (!isdefined(self.var_70b761d63979e102)) {
        self.var_70b761d63979e102 = getdvarfloat(@"hash_a394734820792b88", 4) - 0.075;
    }
    var_f69efd87385e55 = var_cb6109df81ef0dc + var_556b5972dbd50cf4 * self.var_70b761d63979e102 + 0.5 * var_dea0d8baceebf59b * squared(self.var_70b761d63979e102);
    var_fa378e997a33a137.sourcepos = var_cb6109df81ef0dc;
    var_fa378e997a33a137.entityhit = var_1f0ff6559c9092d0.entityhit;
    var_fa378e997a33a137.entityhittype = var_1f0ff6559c9092d0.entityhittype;
    var_fa378e997a33a137.goalpos = var_1f0ff6559c9092d0.point;
    var_fa378e997a33a137.preexplpos = var_f69efd87385e55;
    var_fa378e997a33a137.initvelocity = var_556b5972dbd50cf4;
    return var_fa378e997a33a137;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eaf
// Size: 0x51
function delayscriptablechangethread(delaytime) {
    self.owner endon("disconnect");
    self endon("death");
    self.owner waittill_any_timeout_1(delaytime, "stop_marker_guide");
    self setscriptablepartstate("target", "off", 0);
    self delete();
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f07
// Size: 0x17e
function tomastrike_getrandombombingpoint(var_27c77d35f1de2019, var_a0edd3f59d938fb1, var_a78cd67f5364240c) {
    var_a0a41ba05e16ffe6 = randomint(var_a0edd3f59d938fb1);
    randangle = randomint(360);
    x = var_27c77d35f1de2019[0] + var_a0a41ba05e16ffe6 * cos(randangle);
    y = var_27c77d35f1de2019[1] + var_a0a41ba05e16ffe6 * sin(randangle);
    z = var_27c77d35f1de2019[2];
    point = (x, y, z);
    if (isdefined(var_a78cd67f5364240c)) {
        point = point - var_a78cd67f5364240c * 100;
    }
    var_7cce0455543aec8e = 10000;
    if (isdefined(level.toma_strike_trace_offset)) {
        var_7cce0455543aec8e = level.toma_strike_trace_offset;
    }
    var_470c049a636db53d = spawnstruct();
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    trace = namespace_2a184fc4902783dc::ray_trace(point + (0, 0, var_7cce0455543aec8e), point - (0, 0, var_7cce0455543aec8e), undefined, contents);
    if (isdefined(trace["entity"])) {
        entity = trace["entity"];
        var_470c049a636db53d.entityhit = entity;
        if (tomastrike_isflyingvehicle(entity) || tomastrike_isflyingkillstreak(entity)) {
            var_470c049a636db53d.entityhittype = "flying";
        }
    }
    if (isdefined(trace["position"])) {
        point = trace["position"];
    }
    var_470c049a636db53d.point = point;
    return var_470c049a636db53d;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308d
// Size: 0x22
function tomastrike_isflyingvehicle(entity) {
    return isdefined(self.vehiclename) && istrue(entity function_d7d7db3140b95ce3());
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b7
// Size: 0x3d
function tomastrike_isflyingkillstreak(entity) {
    return isdefined(entity.streakinfo) && isdefined(entity.sentientpool) && entity.sentientpool == "Killstreak_Air";
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30fc
// Size: 0x438
function tomastrike_firestrike(var_ebfc9454321cb5c3, var_fa378e997a33a137, streakinfo, vehicle) {
    self endon("disconnect");
    level endon("game_ended");
    if (isdefined(vehicle)) {
        self earthquakeforplayer(0.35, 1, vehicle.origin, 1000);
        self playlocalsound("weap_cluster_fire");
    }
    if (!isdefined(level.var_d2a6e2899c72649b)) {
        function_75667e2fe77b75c5(var_ebfc9454321cb5c3);
    }
    missile = magicgrenademanual(level.var_d2a6e2899c72649b, var_fa378e997a33a137.sourcepos, var_fa378e997a33a137.initvelocity, getdvarfloat(@"hash_a394734820792b88", 4) + 2, self);
    missile forcenetfieldhighlod(1);
    var_d9855d8e772a9061 = getdvarint(@"hash_2cfbf02c634789ea", 1);
    if (var_d9855d8e772a9061 == 0) {
        missile function_6262c3a1ef0924d(1);
    } else {
        minimapid = undefined;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjective")) {
            minimapid = missile [[ namespace_3c37cb17ade254d::getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_mortar_strike", self.team, undefined, 1, 1);
        }
        missile.minimapid = minimapid;
    }
    missile setentityowner(self);
    missile setotherent(self);
    missile.owner = self;
    missile.streakinfo = streakinfo;
    killcament = spawn("script_model", var_fa378e997a33a137.sourcepos);
    killcament linkto(missile, "tag_origin", (10, 0, 10), (0, 0, 0));
    missile.killcament = killcament;
    if (!isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"])) {
        goto LOC_00000230;
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"];
    missile.explodeent = spawn("script_model", missile.origin);
    if (!isdefined(bundle.var_7e5ed6a828e0ed8f)) {
        goto LOC_00000276;
    }
    missile.explodeent setmodel(bundle.var_7e5ed6a828e0ed8f, "ks_toma_strike_missile_mp");
    missile.explodeent linkto(missile);
    missile.explodeent dontinterpolate();
    missile.explodeent setentityowner(self);
    missile.explodeent.killcament = killcament;
    if (!istrue(self.var_c0aa24316813868f) && issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](var_fa378e997a33a137.goalpos, 512, 300, self.team, 6, self, 1);
    }
    missile setscriptablepartstate("launch", "active", 0);
    missile setscriptablepartstate("trail", "active", 0);
    missile thread toma_strike_watch_owner();
    missile thread function_dd555baddc036858();
    explosiontype = getdvarint(@"hash_604652367665c1e0", 1);
    var_63160bef0a2103d3 = getdvarfloat(@"hash_a394734820792b88", 4) - 0.5;
    var_29893615de503cf5 = var_fa378e997a33a137.preexplpos;
    if (explosiontype != 1) {
        missile thread toma_strike_watch_airexplosion(var_fa378e997a33a137.preexplpos, var_fa378e997a33a137.entityhit, var_fa378e997a33a137.entityhittype, self.var_70b761d63979e102);
    } else {
        missile thread toma_strike_watch_airexplosion(undefined, undefined, undefined, getdvarfloat(@"hash_a394734820792b88", 4) + 1);
    }
    missile thread toma_strike_watch_stuck(explosiontype, vectortoangles(var_fa378e997a33a137.initvelocity), gettime(), var_fa378e997a33a137.initvelocity);
    missile.killcament thread toma_strike_move_killcam(var_63160bef0a2103d3, var_29893615de503cf5);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x353b
// Size: 0x100
function function_6153b8a392d10771(var_39ee47d1ea1f5617, var_63d5339e498e6f77, stuckto, owner, starttime, streakinfo) {
    level endon("game_ended");
    self.exploding = 1;
    var_dcc903d262b29994 = toma_strike_create_explosion(var_39ee47d1ea1f5617, var_63d5339e498e6f77, stuckto, owner, starttime, streakinfo);
    var_dcc903d262b29994.killcament = self.killcament;
    var_98dc829402c94023 = "explode_large";
    if (istrue(self.var_4f31aae63fcdc12e)) {
        var_98dc829402c94023 = var_98dc829402c94023 + "_water";
    }
    var_dcc903d262b29994 setscriptablepartstate(var_98dc829402c94023, "active", 0);
    if (isdefined(self.explodeent)) {
        self.explodeent delete();
    }
    self delete();
    function_2284137aa92dbd16(3);
    if (isdefined(var_dcc903d262b29994)) {
        if (isdefined(var_dcc903d262b29994.killcament)) {
            var_dcc903d262b29994.killcament delete();
        }
        var_dcc903d262b29994 delete();
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3642
// Size: 0xf2
function function_441a028592c3ca77(var_8e46de7d6785b0d8) {
    self endon("death");
    self.exploding = 1;
    self.explodeent unlink();
    self.explodeent.origin = var_8e46de7d6785b0d8;
    self.explodeent setscriptablepartstate("explode", "active", 0);
    thread toma_strike_delay_hide();
    function_2284137aa92dbd16(3);
    if (isdefined(self.explodeent)) {
        self.explodeent delete();
    }
    if (isdefined(self.minimapid)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    self delete();
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x373b
// Size: 0x22
function toma_strike_delay_hide() {
    self endon("death");
    wait(0.05);
    self setscriptablepartstate("visibility", "hide", 0);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3764
// Size: 0x71
function toma_strike_watch_owner() {
    self endon("missile_empd");
    self endon("death");
    self endon("missile_dest_succeed");
    owner = self.owner;
    owner waittill("disconnect");
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    function_6262c3a1ef0924d(0);
    thread function_441a028592c3ca77(self.origin);
    self notify("missile_dest_failed");
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37dc
// Size: 0x7e
function function_dd555baddc036858() {
    self notify("missile_empd");
    self endon("death");
    owner = self.owner;
    while (1) {
        if (istrue(owner.var_65219c911f198c95)) {
            if (isdefined(self.killcament)) {
                self.killcament delete();
            }
            function_6262c3a1ef0924d(0);
            thread function_441a028592c3ca77(self.origin);
            self notify("missile_dest_failed");
            break;
        }
        waitframe();
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3861
// Size: 0xa0
function toma_strike_watch_airexplosion(var_8e46de7d6785b0d8, entityhit, entityhittype, var_43b2a9d31e4f271b) {
    self endon("death");
    self endon("missile_dest_failed");
    self endon("missile_dest_succeed");
    function_2284137aa92dbd16(var_43b2a9d31e4f271b);
    function_6262c3a1ef0924d(0);
    if (!isdefined(var_8e46de7d6785b0d8)) {
        var_8e46de7d6785b0d8 = self.origin;
    }
    thread function_441a028592c3ca77(var_8e46de7d6785b0d8);
    if (isdefined(entityhit) && isdefined(entityhittype) && entityhittype == "flying") {
        entityhit dodamage(500, var_8e46de7d6785b0d8, self.owner, self, "MOD_EXPLOSIVE", makeweapon(level.var_d2a6e2899c72649b));
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3908
// Size: 0x49
function toma_strike_move_killcam(var_b0ce2d9bbd8d8fae, endpos) {
    if (isdefined(self)) {
        self endon("death");
        function_2284137aa92dbd16(var_b0ce2d9bbd8d8fae);
        self unlink();
        self moveto(endpos, 5);
        function_2284137aa92dbd16(7);
        self delete();
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3958
// Size: 0x17e
function toma_strike_watch_stuck(explosiontype, var_6951cf1f43bc8ebe, var_8011cffb839e8243, launchvelocity) {
    self endon("death");
    self endon("missile_dest_failed");
    stuckto = function_7ef768a282337b03();
    var_d9855d8e772a9061 = getdvarint(@"hash_2cfbf02c634789ea", 1);
    if (var_d9855d8e772a9061 == 0) {
        function_6262c3a1ef0924d(0);
    } else {
        function_6262c3a1ef0924d(1);
    }
    if (isdefined(self.minimapid)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
    if (explosiontype != 1 && gettime() - var_8011cffb839e8243 < self.var_70b761d63979e102 * 1000) {
        thread function_441a028592c3ca77(self.origin);
        self notify("missile_dest_failed");
        return;
    }
    wait(0.05);
    var_53705575ed27c4d7 = -1 * getdvarint(@"hash_b5d7d39d32720e78", 800);
    traveltime = (gettime() - var_8011cffb839e8243) / 1000;
    var_ceab23e7a7e95404 = launchvelocity + (0, 0, var_53705575ed27c4d7 * traveltime);
    if (isdefined(stuckto) && isplayer(stuckto)) {
        toma_strike_stuck_player(explosiontype, self, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404);
    } else {
        toma_strike_stuck(explosiontype, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404);
    }
    self notify("missile_dest_succeed");
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3add
// Size: 0xae
function function_7ef768a282337b03() {
    self endon("death");
    self endon("missile_dest_failed");
    impactinfo = function_51afe751c1e36723("missile_stuck", "missile_water_impact");
    if (isdefined(level.var_ca1a76fbc0ba0bef)) {
        thread [[ level.var_ca1a76fbc0ba0bef ]](self.streakinfo, self.origin, 0);
    }
    stuckto = undefined;
    if (isdefined(impactinfo)) {
        if (impactinfo.msg == "missile_stuck") {
            stuckto = impactinfo.param1;
        } else if (impactinfo.msg == "missile_water_impact") {
            self.var_4f31aae63fcdc12e = 1;
        }
    }
    return stuckto;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b93
// Size: 0x10d
function toma_strike_stuck(explosiontype, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404) {
    angles = undefined;
    forward = vectornormalize(var_ceab23e7a7e95404);
    up = anglestoup(self.angles);
    right = anglestoright(var_6951cf1f43bc8ebe);
    if (istrue(self.var_4f31aae63fcdc12e)) {
        up = (0, 0, 1);
    }
    if (abs(vectordot(forward, up)) >= 0.9848) {
        angles = toma_strike_rebuild_angles_up_right(up, right);
    } else {
        angles = toma_strike_rebuild_angles_up_forward(up, forward);
    }
    self.angles = angles;
    if (explosiontype == 1) {
        thread function_6153b8a392d10771(self.origin, angles, stuckto, self.owner, gettime(), self.streakinfo);
    } else {
        thread toma_strike_launch_cluster(self, self.origin, angles, stuckto, gettime());
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ca7
// Size: 0x1fa
function toma_strike_stuck_player(explosiontype, grenade, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404) {
    var_ceab23e7a7e95404 = var_ceab23e7a7e95404 * (0, 0, 1);
    caststart = grenade.origin;
    castdir = (0, 0, -1);
    castend = caststart + castdir * 128;
    contents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_glass", 2:"physicscontents_water", 3:"physicscontents_item", 4:"physicscontents_vehicle"]);
    var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, grenade, 0, "physicsquery_closest", 1);
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        castend = var_e021c2744cc7ed68[0]["position"];
        var_a95d04f8f906e839 = var_e021c2744cc7ed68[0]["normal"];
        var_8d3dd4e0ca9bb1c0 = var_e021c2744cc7ed68[0]["entity"];
        castend = castend - var_a95d04f8f906e839 * 1;
        var_53705575ed27c4d7 = -1 * getdvarint(@"hash_b5d7d39d32720e78", 800);
        d = vectordot(castend - caststart, castdir);
        t = sqrt(2 * d / -1 * var_53705575ed27c4d7);
        up = var_a95d04f8f906e839;
        right = anglestoright(var_6951cf1f43bc8ebe);
        var_4b65413211af7033 = toma_strike_rebuild_angles_up_right(up, right);
        if (explosiontype == 1) {
            thread function_6153b8a392d10771(self.origin, var_4b65413211af7033, stuckto, self.owner, gettime(), self.streakinfo);
        } else {
            thread toma_strike_launch_cluster(grenade, castend, var_4b65413211af7033, var_8d3dd4e0ca9bb1c0, gettime() + t * 1000);
        }
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea8
// Size: 0x335
function toma_strike_launch_cluster(grenade, var_183bdcc9e630d8dd, var_4b65413211af7033, var_3ae043bbb7b2fdf0, impacttime) {
    owner = grenade.owner;
    killcament = grenade.killcament;
    impactnormal = anglestoup(var_4b65413211af7033);
    caststart = var_183bdcc9e630d8dd + impactnormal * 1;
    castend = caststart + impactnormal * 25;
    contents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_glass", 2:"physicscontents_water", 3:"physicscontents_item", 4:"physicscontents_vehicle"]);
    var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, grenade, 0, "physicsquery_closest", 1);
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        castend = var_e021c2744cc7ed68[0]["position"] - impactnormal * 1;
    }
    var_a862bfa81aee2a1b = castend;
    shareddata = toma_strike_get_shared_data(owner, grenade.streakinfo, impacttime, killcament);
    castdata = toma_strike_get_cast_data();
    var_8d01e03c5c561b39 = toma_strike_create_branch(shareddata, castdata, undefined, var_a862bfa81aee2a1b, var_4b65413211af7033, var_3ae043bbb7b2fdf0, 0, undefined, undefined);
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    var_8d01e03c5c561b39.killcament = killcament;
    forward = anglestoforward(var_4b65413211af7033);
    right = anglestoright(var_4b65413211af7033);
    up = anglestoup(var_4b65413211af7033);
    var_17f0969ab028c296 = rotatepointaroundvector(up, forward, 30);
    bright = vectornormalize(vectorcross(var_17f0969ab028c296, up));
    var_b644a203c149f9ac = vectorcross(bright, forward);
    var_106f27f1bc233c55 = axistoangles(var_17f0969ab028c296, bright, var_b644a203c149f9ac);
    castdata = toma_strike_get_cast_data();
    var_8d01e03c5c561b39 = toma_strike_create_branch(shareddata, castdata, undefined, var_a862bfa81aee2a1b, var_106f27f1bc233c55, var_3ae043bbb7b2fdf0, 0, undefined, undefined);
    var_8d01e03c5c561b39.killcament = killcament;
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    var_17f0969ab028c296 = rotatepointaroundvector(up, forward, -30);
    bright = vectornormalize(vectorcross(var_17f0969ab028c296, up));
    var_b644a203c149f9ac = vectorcross(bright, forward);
    var_106f27f1bc233c55 = axistoangles(var_17f0969ab028c296, bright, var_b644a203c149f9ac);
    castdata = toma_strike_get_cast_data();
    var_8d01e03c5c561b39 = toma_strike_create_branch(shareddata, castdata, undefined, var_a862bfa81aee2a1b, var_106f27f1bc233c55, var_3ae043bbb7b2fdf0, 0, undefined, undefined);
    var_8d01e03c5c561b39.killcament = killcament;
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    shareddata toma_strike_shared_data_register_cast();
    foreach (var_8d01e03c5c561b39 in shareddata.branches) {
        var_8d01e03c5c561b39 thread toma_strike_start_branch();
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41e4
// Size: 0x71f
function toma_strike_start_branch() {
    killcament = self.killcament;
    /#
        if (issharedfuncdefined("success", "killstreak_finish_use")) {
            self thread [[ getsharedfunc("success", "killstreak_finish_use") ]]();
        }
    #/
    if (!isdefined(self.preventstarttime)) {
        self.preventstarttime = gettime();
    }
    if (!isdefined(self.startingcasttype)) {
        if (!self.shareddata toma_strike_shared_data_is_complete()) {
            var_a368d1afbdcf65dd = toma_strike_branch_create_explosion(self.startingorigin, self.startingangles, self.startingstuckto, self.shareddata.streakinfo);
            var_a368d1afbdcf65dd.killcament = killcament;
            var_a368d1afbdcf65dd thread toma_strike_start_explosion();
            self.iscomplete = 1;
            self.shareddata toma_strike_shared_data_is_complete(1);
            /#
                self.hitpositions[self.hitpositions.size] = self.startingorigin;
                self.hittypes[self.hittypes.size] = 1;
            #/
        }
    } else {
        self.caststart = self.startingorigin;
        self.castend = undefined;
        self.castangles = self.startingangles;
        self.castdir = undefined;
        self.casttype = self.startingcasttype;
        self.startingorigin = undefined;
        self.startingangles = undefined;
        self.startingcasttype = undefined;
        while (1) {
            if (self.shareddata toma_strike_shared_data_is_complete()) {
                break;
            }
            if (toma_strike_branch_is_complete()) {
                break;
            }
            if (!self.shareddata toma_strike_shared_data_can_cast_this_frame()) {
                waitframe();
                continue;
            }
            if (self.casttype == 0) {
                firstforwardmodanglesfunc = self.castdata.firstforwardmodanglesfunc;
                if (isdefined(firstforwardmodanglesfunc)) {
                    self.castangles = [[ firstforwardmodanglesfunc ]](self.castangles);
                    self.castdata.firstforwardmodanglesfunc = undefined;
                }
            }
            self.castdir = toma_strike_get_cast_dir(self.castangles, self.casttype);
            self.castend = self.caststart + self.castdir * toma_strike_get_cast_dist(self.casttype, self.castdata);
            var_10cfd730ad727443 = undefined;
            var_488ae8e1536d02b3 = undefined;
            var_a95d04f8f906e839 = undefined;
            var_8d3dd4e0ca9bb1c0 = undefined;
            var_d27f9a12a82f66e3 = undefined;
            var_e021c2744cc7ed68 = physics_raycast(self.caststart, self.castend, self.shareddata.castcontents, undefined, 0, "physicsquery_closest", 1);
            if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                var_10cfd730ad727443 = 1;
                var_488ae8e1536d02b3 = var_e021c2744cc7ed68[0]["position"];
                var_a95d04f8f906e839 = var_e021c2744cc7ed68[0]["normal"];
                var_8d3dd4e0ca9bb1c0 = var_e021c2744cc7ed68[0]["entity"];
            }
            switch (self.casttype) {
            case 0:
                if (istrue(var_10cfd730ad727443)) {
                    toma_strike_branch_register_cast(self.casttype, 0, var_488ae8e1536d02b3);
                    var_bb5cf2286a5c3135 = 1;
                    if (isdefined(self.castdata.firstforwarddist)) {
                        var_d0914e2fc24e75f8 = var_488ae8e1536d02b3 - self.caststart;
                        var_64b62cb5dc1e7af6 = vectordot(var_d0914e2fc24e75f8, self.castdir);
                        self.castdata.firstforwarddist = self.castdata.firstforwarddist - var_64b62cb5dc1e7af6;
                        if (self.castdata.firstforwarddist > self.castdata.firstforwardmindist) {
                            var_bb5cf2286a5c3135 = 0;
                        } else {
                            self.castdata.firstforwarddist = undefined;
                        }
                    }
                    var_d27f9a12a82f66e3 = toma_strike_rebuild_angles_up_right(var_a95d04f8f906e839, anglestoright(self.castangles));
                    if (var_bb5cf2286a5c3135) {
                        var_a368d1afbdcf65dd = toma_strike_branch_create_explosion(var_488ae8e1536d02b3, var_d27f9a12a82f66e3, var_8d3dd4e0ca9bb1c0, self.shareddata.streakinfo);
                        var_a368d1afbdcf65dd.killcament = killcament;
                        var_a368d1afbdcf65dd thread toma_strike_start_explosion();
                    }
                    self.casttype = 2;
                    self.caststart = var_488ae8e1536d02b3 + var_a95d04f8f906e839 * 1;
                    self.castangles = var_d27f9a12a82f66e3;
                } else {
                    toma_strike_branch_register_cast(self.casttype, undefined, undefined);
                    if (isdefined(self.castdata.firstforwarddist)) {
                        var_d0914e2fc24e75f8 = self.castend - self.caststart;
                        var_64b62cb5dc1e7af6 = vectordot(var_d0914e2fc24e75f8, self.castdir);
                        self.castdata.firstforwarddist = self.castdata.firstforwarddist - var_64b62cb5dc1e7af6;
                        if (self.castdata.firstforwarddist <= self.castdata.firstforwardmindist) {
                            self.castdata.firstforwarddist = undefined;
                        }
                    }
                    self.casttype = 1;
                    self.caststart = self.castend;
                }
                break;
            case 1:
                if (istrue(var_10cfd730ad727443)) {
                    var_d27f9a12a82f66e3 = toma_strike_rebuild_angles_up_right(var_a95d04f8f906e839, anglestoright(self.castangles));
                    var_a368d1afbdcf65dd = toma_strike_branch_create_explosion(var_488ae8e1536d02b3, var_d27f9a12a82f66e3, var_8d3dd4e0ca9bb1c0, self.shareddata.streakinfo);
                    var_a368d1afbdcf65dd.killcament = killcament;
                    var_a368d1afbdcf65dd thread toma_strike_start_explosion();
                    var_970f97cb88d6b89e = vectordot(anglestoup(self.castangles), var_a95d04f8f906e839);
                    if (var_970f97cb88d6b89e < 0.9848) {
                        toma_strike_branch_register_cast(self.casttype, 2, var_488ae8e1536d02b3);
                        self.casttype = 2;
                        self.caststart = var_488ae8e1536d02b3 + var_a95d04f8f906e839 * 1;
                        self.castangles = var_d27f9a12a82f66e3;
                    } else {
                        toma_strike_branch_register_cast(self.casttype, 1, var_488ae8e1536d02b3);
                        self.casttype = 0;
                    }
                } else {
                    toma_strike_branch_register_cast(self.casttype, undefined, undefined);
                    self.caststart = self.castend;
                }
                break;
            case 2:
                if (istrue(var_10cfd730ad727443)) {
                    toma_strike_branch_register_cast(self.casttype, 3, var_488ae8e1536d02b3);
                    self.casttype = 0;
                    self.caststart = var_488ae8e1536d02b3 + var_a95d04f8f906e839 * 1;
                } else {
                    toma_strike_branch_register_cast(self.casttype, undefined, undefined);
                    self.casttype = 0;
                }
                break;
            }
            waittillframeend();
        }
        self.iscomplete = 1;
        self.shareddata toma_strike_shared_data_is_complete(1);
        self.shareddata.branches = [];
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x490a
// Size: 0xba
function toma_strike_branch_create_explosion(origin, angles, stuckto, streakinfo) {
    delayms = 50;
    if (-1) {
        delayms = randomintrange(50, 350);
    }
    starttime = self.preventstarttime + delayms;
    ent = toma_strike_create_explosion(origin + anglestoup(angles), angles, stuckto, self.shareddata.owner, starttime, streakinfo);
    self.preventstarttime = starttime;
    self.ents[self.ents.size] = ent;
    self.shareddata toma_strike_shared_data_register_ent();
    return ent;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49cc
// Size: 0x123
function toma_strike_create_explosion(origin, angles, stuckto, owner, starttime, streakinfo) {
    if (!isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"])) {
        goto LOC_00000088;
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"];
    ent = spawn("script_model", origin);
    ent.angles = angles;
    ent.stuckto = stuckto;
    ent.owner = owner;
    ent.starttime = starttime;
    ent.streakinfo = streakinfo;
    ent setmodel(isdefined(bundle.var_3a1a5610b3e228c0) ? "ks_toma_strike_cluster_mp" : bundle.var_3a1a5610b3e228c0);
    ent setotherent(owner);
    ent setentityowner(owner);
    if (isdefined(stuckto)) {
        ent linkto(stuckto);
    }
    return ent;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af7
// Size: 0x62
function toma_strike_start_explosion() {
    self endon("death");
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    if (isdefined(self.stuckto)) {
        self.stuckto endon("death");
    }
    while (gettime() < self.starttime) {
        waitframe();
    }
    thread toma_strike_explosion_end();
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b60
// Size: 0x1f
function toma_strike_explosion_end() {
    self setscriptablepartstate("explode", "active", 0);
    wait(1);
    self delete();
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b86
// Size: 0x25
function toma_strike_shared_data_register_cast() {
    self.caststotal++;
    self.caststhisframe++;
    self.frametimestamp = gettime();
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb2
// Size: 0xd
function toma_strike_shared_data_register_ent() {
    self.entstotal++;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc6
// Size: 0x39
function toma_strike_shared_data_can_cast_this_frame() {
    if (self.frametimestamp < gettime()) {
        self.frametimestamp = gettime();
        self.caststhisframe = 0;
    }
    return self.caststhisframe < 3;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c07
// Size: 0xcb
function toma_strike_shared_data_is_complete(var_af8745e2185687a8) {
    iscomplete = 0;
    if (self.caststotal >= 60) {
        iscomplete = 1;
    } else if (self.entstotal >= 20) {
        iscomplete = 1;
    } else if (istrue(var_af8745e2185687a8)) {
        var_3ce5d6eb962629fa = 1;
        foreach (var_8d01e03c5c561b39 in self.branches) {
            if (!var_8d01e03c5c561b39 toma_strike_branch_is_complete()) {
                var_3ce5d6eb962629fa = 0;
                break;
            }
        }
        if (var_3ce5d6eb962629fa) {
            iscomplete = 1;
        }
    }
    if (iscomplete) {
        self.iscomplete = 1;
    }
    return iscomplete;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cda
// Size: 0x17a
function toma_strike_branch_register_cast(casttype, var_8e87ebe279cdfcfb, hitposition) {
    self.shareddata toma_strike_shared_data_register_cast();
    self.casts++;
    if (isdefined(var_8e87ebe279cdfcfb)) {
        if (var_8e87ebe279cdfcfb == 0 || var_8e87ebe279cdfcfb == 1 || var_8e87ebe279cdfcfb == 2) {
            self.castfails = 0;
        }
    } else if (casttype == 1) {
        self.castfails++;
    }
    /#
        var_14efa638229efbd5 = undefined;
        if (isdefined(var_8e87ebe279cdfcfb)) {
            var_14efa638229efbd5 = undefined;
            switch (var_8e87ebe279cdfcfb) {
            case 0:
                var_14efa638229efbd5 = "br";
                break;
            case 1:
                var_14efa638229efbd5 = "tag_origin";
                break;
            case 2:
                var_14efa638229efbd5 = "explode";
                break;
            case 3:
                var_14efa638229efbd5 = "current";
                break;
            }
            self.hitpositions[self.hitpositions.size] = hitposition;
            self.hittypes[self.hittypes.size] = var_8e87ebe279cdfcfb;
        } else {
            switch (casttype) {
            case 0:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            case 1:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            case 2:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            }
        }
        if (istrue(level.var_4482770c326f1498)) {
            if (isdefined(var_14efa638229efbd5)) {
                println(var_14efa638229efbd5);
            }
        }
    #/
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e5b
// Size: 0x204
function toma_strike_branch_is_complete(var_af8745e2185687a8) {
    iscomplete = 0;
    var_3ce5d6eb962629fa = undefined;
    if (self.shareddata toma_strike_shared_data_is_complete()) {
        iscomplete = 1;
    } else if (isdefined(self.castdata) && self.castfails >= self.castdata.maxfails) {
        iscomplete = 1;
    } else if (isdefined(self.castdata) && self.casts >= self.castdata.maxcasts) {
        iscomplete = 1;
    } else if (isdefined(self.castdata) && self.ents.size >= self.castdata.maxents) {
        iscomplete = 1;
    } else if (istrue(var_af8745e2185687a8)) {
        var_3ce5d6eb962629fa = 1;
        foreach (var_8d01e03c5c561b39 in self.branches) {
            if (!var_8d01e03c5c561b39 toma_strike_branch_is_complete()) {
                var_3ce5d6eb962629fa = 0;
                break;
            }
        }
        if (var_3ce5d6eb962629fa) {
            iscomplete = 1;
        }
    }
    if (iscomplete && !istrue(self.iscomplete)) {
        oncompletedfunc = self.oncompletedfunc;
        if (isdefined(oncompletedfunc)) {
            self [[ oncompletedfunc ]]();
        }
        /#
            println("<unknown string>");
        #/
        if (istrue(var_3ce5d6eb962629fa)) {
            iscomplete = 0;
            foreach (var_8d01e03c5c561b39 in self.branches) {
                if (!var_8d01e03c5c561b39 toma_strike_branch_is_complete()) {
                    var_3ce5d6eb962629fa = 0;
                    break;
                }
            }
            if (var_3ce5d6eb962629fa) {
                iscomplete = 1;
            }
        }
    }
    if (iscomplete) {
        self.iscomplete = 1;
    }
    return iscomplete;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5067
// Size: 0x116
function toma_strike_create_branch(shareddata, castdata, parent, startingorigin, startingangles, startingstuckto, startingcasttype, preventstarttime, oncompletedfunc) {
    var_8d01e03c5c561b39 = spawnstruct();
    var_8d01e03c5c561b39.shareddata = shareddata;
    var_8d01e03c5c561b39.castdata = castdata;
    var_8d01e03c5c561b39.startingorigin = startingorigin;
    var_8d01e03c5c561b39.startingangles = startingangles;
    var_8d01e03c5c561b39.startingstuckto = startingstuckto;
    var_8d01e03c5c561b39.startingcasttype = startingcasttype;
    var_8d01e03c5c561b39.oncompletedfunc = oncompletedfunc;
    var_8d01e03c5c561b39.ents = [];
    var_8d01e03c5c561b39.branches = [];
    var_8d01e03c5c561b39.hitpositions = [];
    var_8d01e03c5c561b39.hittypes = [];
    var_8d01e03c5c561b39.casts = 0;
    var_8d01e03c5c561b39.castfails = 0;
    var_8d01e03c5c561b39.preventstarttime = preventstarttime;
    return var_8d01e03c5c561b39;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5185
// Size: 0xf7
function toma_strike_get_shared_data(owner, streakinfo, impacttime, killcament) {
    shareddata = spawnstruct();
    shareddata.owner = owner;
    shareddata.team = owner.team;
    shareddata.streakinfo = streakinfo;
    shareddata.impacttime = impacttime;
    shareddata.branches = [];
    shareddata.entstotal = 0;
    shareddata.caststotal = 0;
    shareddata.caststhisframe = 0;
    shareddata.frametimestamp = gettime();
    shareddata.castcontents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_glass", 2:"physicscontents_water", 3:"physicscontents_item", 4:"physicscontents_vehicle"]);
    return shareddata;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5284
// Size: 0x68
function toma_strike_get_cast_data() {
    castdata = spawnstruct();
    castdata.distforward = 125;
    castdata.distdown = 50;
    castdata.distup = 25;
    castdata.maxcasts = 12;
    castdata.maxfails = 3;
    castdata.maxents = 4;
    return castdata;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52f4
// Size: 0x5a
function toma_strike_get_cast_dir(angles, casttype) {
    switch (casttype) {
    case 0:
        return anglestoforward(angles);
    case 1:
        return (-1 * anglestoup(angles));
    case 2:
        return anglestoup(angles);
        break;
    }
    return undefined;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5356
// Size: 0x84
function toma_strike_get_cast_dist(casttype, castdata) {
    switch (casttype) {
    case 0:
        if (isdefined(castdata.firstforwarddist)) {
            return castdata.firstforwarddist;
            goto LOC_00000042;
        }
        return castdata.distforward;
    case 1:
    LOC_00000042:
        return castdata.distdown;
    case 2:
        return castdata.distup;
        break;
    }
    return undefined;
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53e2
// Size: 0x3c
function toma_strike_rebuild_angles_up_right(up, right) {
    forward = vectornormalize(vectorcross(up, right));
    right = vectorcross(forward, up);
    return axistoangles(forward, right, up);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5426
// Size: 0x3c
function toma_strike_rebuild_angles_up_forward(up, forward) {
    right = vectornormalize(vectorcross(forward, up));
    forward = vectorcross(up, right);
    return axistoangles(forward, right, up);
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x546a
// Size: 0xa3
function toma_strike_setmarkerobjective(objid, icon, owner, offset) {
    if (issp()) {
        return;
    }
    objective_icon(objid, icon);
    objective_showtoplayersinmask(objid);
    objective_addclienttomask(objid, owner);
    objective_onentity(objid, self);
    objective_setzoffset(objid, offset);
    objective_setplayintro(objid, 0);
    objective_setplayoutro(objid, 0);
    objective_setbackground(objid, 1);
    if (level.teambased) {
        objective_setownerteam(objid, owner.team);
    } else {
        objective_setownerclient(objid, owner);
    }
    objective_state(objid, "current");
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5514
// Size: 0x60
function toma_strike_handlemarkerscriptable() {
    self endon("death");
    self setscriptablepartstate("target", "on", 0);
    function_2284137aa92dbd16(10);
    if (isdefined(self)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.objidnum);
        }
        self delete();
    }
}

// Namespace toma_strike/namespace_25d6bd23fd862a00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557b
// Size: 0x1f2
function tomastrike_findoptimallaunchpos(var_4d8559e1e8d5ff3d, var_d77253c873d2b420, ownerforward, var_3c5a1b26c6973c2a) {
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    trace = namespace_2a184fc4902783dc::ray_trace(var_4d8559e1e8d5ff3d - var_d77253c873d2b420 * 30, var_4d8559e1e8d5ff3d + var_d77253c873d2b420 * 1000, undefined, contents);
    var_6e7c70b904418daa = trace["position"] + trace["normal"] * 20;
    targetpos = var_6e7c70b904418daa;
    var_359711dd322783ec = 5000;
    var_950bc1815e708cb6 = 5000;
    var_f74f18c717b149e2 = [0:targetpos + ownerforward * 100, 1:targetpos - ownerforward * 100, 2:targetpos + var_3c5a1b26c6973c2a * 100, 3:targetpos - var_3c5a1b26c6973c2a * 100, 4:targetpos + (ownerforward + var_3c5a1b26c6973c2a) * 100, 5:targetpos + (ownerforward - var_3c5a1b26c6973c2a) * 100, 6:targetpos + (var_3c5a1b26c6973c2a - ownerforward) * 100, 7:targetpos + (-1 * ownerforward - var_3c5a1b26c6973c2a) * 100];
    var_4b92da7c3f7930e4 = vectornormalize(var_f74f18c717b149e2[0] - targetpos);
    var_899eef3a2f55b6a6 = targetpos + (0, 0, var_359711dd322783ec) - var_4b92da7c3f7930e4 * var_950bc1815e708cb6;
    foreach (var_f9567f37db523f7a in var_f74f18c717b149e2) {
        direction = vectornormalize(var_f9567f37db523f7a - targetpos);
        var_14b9b15ccd581542 = targetpos + (0, 0, var_359711dd322783ec) - direction * var_950bc1815e708cb6;
        var_27ac9f99fc2e7a9b = targetpos;
        traceresult = namespace_2a184fc4902783dc::ray_trace_passed(var_14b9b15ccd581542, var_27ac9f99fc2e7a9b, undefined, contents);
        if (!istrue(traceresult)) {
            continue;
        }
        var_899eef3a2f55b6a6 = var_14b9b15ccd581542;
        break;
    }
    return var_899eef3a2f55b6a6;
}

