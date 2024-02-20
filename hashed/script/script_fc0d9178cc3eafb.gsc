// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using script_1ed1214969b5eba7;

#namespace namespace_c30aea03ca048fdb;

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x3e9
// Size: 0x45
function autoexec main() {
    registersharedfunc("super_evg", "init", &function_69aaff334f8191de);
    registersharedfunc("super_evg", "onSuperButtonPressed", &function_cc4ae8e506326196);
    registersharedfunc("super_evg", "given", &function_c13e791e9af862d9);
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x435
// Size: 0x19
function function_69aaff334f8191de() {
    registersharedfunc("super_evg", "evg_used", &evg_used);
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x455
// Size: 0x24
function evg_used(grenade) {
    flag_init("equipment_interact");
    self.var_cb424f04bd652fb1 = undefined;
    return 1;
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x481
// Size: 0x67
function function_c13e791e9af862d9(objweapon) {
    function_816b4cfd02dde591();
    thread function_cb9565a90e01f30();
    thread function_5e0605fb98c65415();
    namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_52c31471752bee6f);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        self [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_52c31471752bee6f);
    }
    namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_381e4571957a1940);
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ef
// Size: 0x8e
function function_5e0605fb98c65415() {
    self notify("checkSuperButtonHeld");
    self endon("checkSuperButtonHeld");
    level endon("game_ended");
    self endon("evg_take");
    counter = 0;
    self.var_dbf122a3332e5dcc = istrue(self.pers["useNVG"]);
    while (1) {
        while (self function_5304f90e15c214d2()) {
            if (!istrue(self.var_c6b5a81ec8caffd1)) {
                function_cc4ae8e506326196();
                self.var_c6b5a81ec8caffd1 = 1;
            }
            wait(1.5);
        }
        self.var_c6b5a81ec8caffd1 = 0;
        wait(0.1);
    }
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x584
// Size: 0xae
function function_cc4ae8e506326196(objweapon) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("evg_take");
    self notify("evg_end_recharge");
    bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_evg");
    if (isdefined(level.nvgvisionsetoverride) && isstring(level.nvgvisionsetoverride)) {
        visionsetnight(level.nvgvisionsetoverride);
    } else {
        self visionsetnightforplayer(bundle.var_144afe956168e6e5);
    }
    if (!isdefined(self.pers["killstreak_forcedNVGOff"])) {
        self.pers["killstreak_forcedNVGOff"] = 0;
    }
    function_65d533faebb8fd7d();
    waitframe();
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x639
// Size: 0x231
function function_65d533faebb8fd7d() {
    if (istrue(self.var_12bfb031c0a0efd8) || istrue(self.isemped) || istrue(self.var_65219c911f198c95)) {
        return;
    }
    if (self isonladder() || self function_415fe9eeca7b2e2b()) {
        return;
    }
    if (isdefined(self.var_69182e585de962fe) && self.var_69182e585de962fe > gettime()) {
        return;
    }
    bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_evg");
    var_19163e14365d9264 = self.super;
    var_79ef6bdef3bf42d = bundle.var_191c4a1763eabb22;
    if (istrue(self.pers["useNVG"])) {
        function_afd32ce1f3abe610(1);
    } else {
        var_41286ce8e01ff0ff = 100;
        if (isdefined(self.var_c6e22d7a9f998295)) {
            var_721eb48c0deeb426 = bundle.var_94e973b394c254c0;
            var_41286ce8e01ff0ff = int(ceil((var_721eb48c0deeb426 - self.var_c6e22d7a9f998295) * 100 / var_721eb48c0deeb426));
        }
        var_19163e14365d9264.usepercent = var_41286ce8e01ff0ff / 100;
        if (issharedfuncdefined("supers", "updateSuperUIProgress")) {
            self [[ getsharedfunc("supers", "updateSuperUIProgress") ]]();
        }
        if (issharedfuncdefined("supers", "updateSuperUIState")) {
            self [[ getsharedfunc("supers", "updateSuperUIState") ]]();
        }
        if (var_41286ce8e01ff0ff <= 0) {
            return;
        }
        thread function_438ddb00054b12a9();
        thread function_8ef049fddedb272f();
        self nightvisionviewon();
        thread function_53710fd0ad26ee61(1);
        self setscriptablepartstate("evgSfx", "evg_on", 0);
        if (istrue(var_79ef6bdef3bf42d)) {
            thread function_268e214f18447610(0.6);
        }
        waitframe();
        self.var_69182e585de962fe = gettime() + 1000;
        function_6cbb5644d0b51e2d();
        if (issharedfuncdefined("supers", "setSuperIsActive")) {
            self [[ getsharedfunc("supers", "setSuperIsActive") ]](1);
        }
        if (issharedfuncdefined("supers", "setSuperIsInUse")) {
            self [[ getsharedfunc("supers", "setSuperIsInUse") ]](1);
        }
        self setclientomnvar("ui_block_fu_not_ready_error", 1);
    }
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x871
// Size: 0x63
function function_6cbb5644d0b51e2d() {
    if (!istrue(self.pers["useNVG"])) {
        self.pers["useNVG"] = 1;
    } else if (istrue(self.pers["useNVG"]) && !istrue(self.pers["killstreak_forcedNVGOff"])) {
        self.pers["useNVG"] = 0;
    }
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8db
// Size: 0x84
function function_8ef049fddedb272f() {
    level endon("game_ended");
    self endon("evg_off");
    self waittill("death_or_disconnect");
    self notify("evg_off_death");
    function_afd32ce1f3abe610(1);
    if (issharedfuncdefined("supers", "setSuperIsActive")) {
        self [[ getsharedfunc("supers", "setSuperIsActive") ]](0);
    }
    if (issharedfuncdefined("supers", "setSuperIsInUse")) {
        self [[ getsharedfunc("supers", "setSuperIsInUse") ]](0);
    }
    self.var_c6e22d7a9f998295 = 0;
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x966
// Size: 0xbf
function function_53710fd0ad26ee61(enabled) {
    if (getdvarint(@"hash_6c4aa4fa4c54eb2a", 1) == 0) {
        return;
    }
    if (isdefined(self.nvg3rdpersonmodel)) {
        self detach(self.nvg3rdpersonmodel, "j_head");
        self.nvg3rdpersonmodel = undefined;
    }
    if (enabled) {
        var_4e05baf0bb66c66e = function_248a3eaffa9c3dff();
        if (isdefined(var_4e05baf0bb66c66e)) {
            self.nvg3rdpersonmodel = var_4e05baf0bb66c66e;
            self attach(self.nvg3rdpersonmodel, "j_head");
        }
    } else {
        var_2626c56ce4ecc11b = function_289ea0fdb50f3084();
        if (isdefined(var_2626c56ce4ecc11b)) {
            self.nvg3rdpersonmodel = var_2626c56ce4ecc11b;
            self attach(self.nvg3rdpersonmodel, "j_head");
        }
    }
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2c
// Size: 0xd5
function function_248a3eaffa9c3dff() {
    var_4e05baf0bb66c66e = undefined;
    if (isdefined(level.nvgheadoverrides) && isdefined(level.nvgheadoverrides[self.operatorcustomization.head])) {
        var_4e05baf0bb66c66e = level.nvgheadoverrides[self.operatorcustomization.head]["down"];
    }
    if (!isdefined(var_4e05baf0bb66c66e)) {
        var_4e05baf0bb66c66e = "offhand_wm_nvgquad_mp_1";
    } else if (var_4e05baf0bb66c66e == "nvg_2") {
        var_4e05baf0bb66c66e = "offhand_wm_nvgquad_mp_2";
    } else if (var_4e05baf0bb66c66e == "nvg_3") {
        var_4e05baf0bb66c66e = "offhand_wm_nvgquad_mp_3";
    } else if (var_4e05baf0bb66c66e == "nvg_4") {
        var_4e05baf0bb66c66e = "offhand_wm_nvgquad_mp_4";
    } else if (var_4e05baf0bb66c66e == "none") {
        var_4e05baf0bb66c66e = undefined;
    } else {
        /#
            assert(0, "Invalid entry value set in level.nvgHeadOverrides for NVG Override Down");
        #/
        var_4e05baf0bb66c66e = "offhand_wm_nvgquad_mp_1";
    }
    return var_4e05baf0bb66c66e;
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb09
// Size: 0xd5
function function_289ea0fdb50f3084() {
    var_2626c56ce4ecc11b = undefined;
    if (isdefined(level.nvgheadoverrides) && isdefined(level.nvgheadoverrides[self.operatorcustomization.head])) {
        var_2626c56ce4ecc11b = level.nvgheadoverrides[self.operatorcustomization.head]["up"];
    }
    if (!isdefined(var_2626c56ce4ecc11b)) {
        var_2626c56ce4ecc11b = "offhand_wm_nvgquad_mp_1_up";
    } else if (var_2626c56ce4ecc11b == "nvg_2") {
        var_2626c56ce4ecc11b = "offhand_wm_nvgquad_mp_2_up";
    } else if (var_2626c56ce4ecc11b == "nvg_3") {
        var_2626c56ce4ecc11b = "offhand_wm_nvgquad_mp_3_up";
    } else if (var_2626c56ce4ecc11b == "nvg_4") {
        var_2626c56ce4ecc11b = "offhand_wm_nvgquad_mp_3_up";
    } else if (var_2626c56ce4ecc11b == "none") {
        var_2626c56ce4ecc11b = undefined;
    } else {
        /#
            assert(0, "Invalid entry value set in level.nvgHeadOverrides for NVG Override Up");
        #/
        var_2626c56ce4ecc11b = "offhand_wm_nvgquad_mp_1_up";
    }
    return var_2626c56ce4ecc11b;
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe6
// Size: 0x1e2
function function_268e214f18447610(var_95dba8fe66c343ab) {
    self endon("evg_off");
    self endon("evg_off_death");
    if (isdefined(var_95dba8fe66c343ab) && var_95dba8fe66c343ab > 0) {
        wait(var_95dba8fe66c343ab);
    }
    bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_evg");
    var_ec3acdb476b6a5d7 = getdvarint(@"hash_5716ac078aa9fdd6", 1);
    var_714ce97175180899 = getdvarint(@"hash_3aff4275c846084a", 3000);
    var_714ce97175180899 = var_714ce97175180899 * var_714ce97175180899;
    var_5b27571147e34abd = getdvarint(@"hash_20b810a0c1bd5e81", 1);
    var_4430b08d5a2d47bf = undefined;
    while (1) {
        var_2e3bc563c04ce992 = array_combine(getaiarray(), level.players);
        foreach (player in var_2e3bc563c04ce992) {
            var_6dd0a979b41755c = undefined;
            if (player == self) {
                continue;
            }
            entnum = player getentitynumber();
            if (!isdefined(self.outlineents)) {
                self.outlineents = [];
            }
            if (isdefined(self.outlineents[entnum])) {
                continue;
            }
            if (player.team == self.team) {
                if (var_5b27571147e34abd) {
                    var_4430b08d5a2d47bf = bundle.var_4ebae270af108843;
                }
            } else {
                var_4430b08d5a2d47bf = bundle.var_c31dc1dcf26d73cf;
                var_6dd0a979b41755c = "snapshotgrenade";
            }
            if (issharedfuncdefined("outline", "outlineEnableForPlayer")) {
                self.outlineents[entnum] = [[ getsharedfunc("outline", "outlineEnableForPlayer") ]](player, self, var_4430b08d5a2d47bf, "level_script");
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcf
// Size: 0xf5
function function_ab4442abb750dff6(var_95dba8fe66c343ab) {
    waitframe();
    if (!isdefined(self.outlineents)) {
        return;
    }
    if (isdefined(var_95dba8fe66c343ab) && var_95dba8fe66c343ab > 0) {
        wait(var_95dba8fe66c343ab);
    }
    var_2e3bc563c04ce992 = array_combine(getaiarray(), level.players);
    foreach (player in var_2e3bc563c04ce992) {
        if (player == self) {
            continue;
        }
        entnum = player getentitynumber();
        if (!isdefined(self.outlineents[entnum])) {
            continue;
        }
        if (issharedfuncdefined("outline", "outlineDisable")) {
            [[ getsharedfunc("outline", "outlineDisable") ]](self.outlineents[entnum], player);
        }
    }
    self.outlineents = undefined;
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xecb
// Size: 0x14
function function_bbf3a083d978a6d3(isjammed) {
    self function_9b28bd480aaad85f(isjammed);
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xee6
// Size: 0x24
function function_d8743ede8ca118c6(equipmentref, slot) {
    self notify("evg_take");
    thread function_816b4cfd02dde591();
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf11
// Size: 0x21
function function_cb9565a90e01f30() {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("death");
    thread function_816b4cfd02dde591();
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf39
// Size: 0x23
function function_816b4cfd02dde591() {
    self.var_d07d8acb673cb5c7 = undefined;
    self.var_7653bd4be7dd5fdb = undefined;
    flag_clear("equipment_interact");
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf63
// Size: 0x17a
function function_438ddb00054b12a9() {
    self notify("evg_init_battery_decay");
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("evg_init_battery_decay");
    self.var_cb424f04bd652fb1 = 1;
    if (!isdefined(self.var_c6e22d7a9f998295)) {
        self.var_c6e22d7a9f998295 = 0;
    }
    bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_evg");
    counter = 0;
    var_19163e14365d9264 = self.super;
    var_721eb48c0deeb426 = bundle.var_94e973b394c254c0;
    var_3c41d0b684e437f5 = var_721eb48c0deeb426 / 100;
    while (istrue(self.var_cb424f04bd652fb1)) {
        var_41286ce8e01ff0ff = int(ceil((var_721eb48c0deeb426 - self.var_c6e22d7a9f998295) * 100 / var_721eb48c0deeb426));
        if (var_41286ce8e01ff0ff < 0) {
            var_41286ce8e01ff0ff = 0;
        }
        if (counter >= var_3c41d0b684e437f5) {
            self.var_c6e22d7a9f998295 = self.var_c6e22d7a9f998295 + counter;
            counter = 0;
        }
        if (var_41286ce8e01ff0ff <= 0) {
            thread function_2ac5b3d09529dd5b();
            break;
        }
        var_19163e14365d9264.usepercent = var_41286ce8e01ff0ff / 100;
        if (issharedfuncdefined("supers", "updateSuperUIProgress")) {
            self [[ getsharedfunc("supers", "updateSuperUIProgress") ]]();
        }
        if (issharedfuncdefined("supers", "updateSuperUIState")) {
            self [[ getsharedfunc("supers", "updateSuperUIState") ]]();
        }
        counter = counter + 0.05;
        wait(0.05);
    }
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e4
// Size: 0x67
function function_2ac5b3d09529dd5b() {
    function_afd32ce1f3abe610();
    if (issharedfuncdefined("supers", "setSuperIsActive")) {
        self [[ getsharedfunc("supers", "setSuperIsActive") ]](0);
    }
    if (issharedfuncdefined("supers", "setSuperIsInUse")) {
        self [[ getsharedfunc("supers", "setSuperIsInUse") ]](0);
    }
    self setclientomnvar("ui_block_fu_not_ready_error", 0);
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1152
// Size: 0x1bf
function function_afd32ce1f3abe610(shouldrefundsuper) {
    self notify("evg_off");
    self nightvisionviewoff();
    thread function_53710fd0ad26ee61(0);
    self setscriptablepartstate("evgSfx", "evg_off", 0);
    bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_evg");
    var_19163e14365d9264 = self.super;
    var_79ef6bdef3bf42d = bundle.var_191c4a1763eabb22;
    if (istrue(var_79ef6bdef3bf42d)) {
        thread function_ab4442abb750dff6(0.5);
    }
    waitframe();
    self.var_69182e585de962fe = gettime() + 1000;
    function_6cbb5644d0b51e2d();
    self.var_cb424f04bd652fb1 = 0;
    var_721eb48c0deeb426 = bundle.var_94e973b394c254c0;
    if (istrue(shouldrefundsuper) && isdefined(self.var_c6e22d7a9f998295) && self.var_c6e22d7a9f998295 < var_721eb48c0deeb426) {
        self.var_c6e22d7a9f998295 = self.var_c6e22d7a9f998295 - 0.1;
        if (self.var_c6e22d7a9f998295 <= 0) {
            self.var_c6e22d7a9f998295 = 0;
        }
        var_41286ce8e01ff0ff = int(ceil((var_721eb48c0deeb426 - self.var_c6e22d7a9f998295) * 100 / var_721eb48c0deeb426));
        var_19163e14365d9264.usepercent = var_41286ce8e01ff0ff / 100;
    }
    if (issharedfuncdefined("supers", "updateSuperUIProgress")) {
        self [[ getsharedfunc("supers", "updateSuperUIProgress") ]]();
    }
    if (issharedfuncdefined("supers", "updateSuperUIState")) {
        self [[ getsharedfunc("supers", "updateSuperUIState") ]]();
    }
    if (issharedfuncdefined("supers", "superUseFinished")) {
        self [[ getsharedfunc("supers", "superUseFinished") ]](shouldrefundsuper);
    }
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1318
// Size: 0x1f
function function_52c31471752bee6f() {
    if (istrue(self.pers["useNVG"])) {
        function_afd32ce1f3abe610(1);
    }
}

// Namespace namespace_c30aea03ca048fdb/namespace_2607d291739404b1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133e
// Size: 0x1f
function function_381e4571957a1940() {
    if (istrue(self.pers["useNVG"])) {
        function_afd32ce1f3abe610(1);
    }
}

