// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\analyticslog.gsc;
#using script_2d9d24f7c63ac143;

#namespace nvg;

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x449
// Size: 0xb1
function runnvg() {
    val::nuke("nvg");
    if (!namespace_4b0406965e556711::gameflag("prematch_done") && isdefined(self.infil)) {
        val::set("runNVG", "nvg", 0);
        thread allownvgsatmatchstart();
    } else {
        val::function_c9d0b43701bdba00("runNVG");
    }
    if (!isdefined(self.pers["useNVG"])) {
        self.pers["useNVG"] = 0;
    }
    if (!isdefined(namespace_3c5a4254f2b957ea::getpersstat("killstreak_forcedNVGOff"))) {
        self.pers["killstreak_forcedNVGOff"] = 0;
    }
    thread function_ca7eb80548414e31();
    thread function_389f3670051fb40d();
    thread nvg_monitor();
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501
// Size: 0x31
function allownvgsatmatchstart() {
    self notify("allowNVGsAtMatchStart");
    self endon("allowNVGsAtMatchStart");
    self endon("disconnect");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    val::function_c9d0b43701bdba00("runNVG");
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539
// Size: 0x3c
function clearnvg(var_d82b5fc6a04b17f3) {
    if (isdefined(self.nvg3rdpersonmodel)) {
        if (var_d82b5fc6a04b17f3) {
            self detach(self.nvg3rdpersonmodel, "j_head");
        }
        self.nvg3rdpersonmodel = undefined;
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57c
// Size: 0x4c
function savenvgstate() {
    if (self isnightvisionon()) {
        self.pers["useNVG"] = 1;
    } else if (!self isnightvisionon() && !istrue(namespace_3c5a4254f2b957ea::getpersstat("killstreak_forcedNVGOff"))) {
        self.pers["useNVG"] = 0;
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cf
// Size: 0xaa
function nvg_monitor() {
    self notify("nvg_monitor");
    self endon("nvg_monitor");
    self endon("disconnect");
    var_941cde8837521cff = gettime();
    while (1) {
        result = waittill_any_return_3("night_vision_on", "night_vision_off", "death");
        if (!isdefined(result)) {
            continue;
        }
        if (result == "death") {
            if (namespace_36f464722d326bbe::isBRStyleGameType() && namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "dmz") {
                self nightvisionviewoff(1);
                function_4ca8e54d359cf04a(0);
            }
            break;
        }
        enabled = result == "night_vision_on";
        function_4ca8e54d359cf04a(enabled);
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x680
// Size: 0x96
function function_4ca8e54d359cf04a(isenabled) {
    savenvgstate();
    nvg_update3rdperson(isenabled);
    if (istrue(isenabled)) {
        level notify("player_enabled_nvgs");
    }
    function_57a8aa1600b3e550(isenabled);
    var_2a3902259f88e70e = gettime();
    duration = var_2a3902259f88e70e - ter_op(isdefined(self.var_b6c830f1879e400f), self.var_941cde8837521cff, 0);
    namespace_bd0162aedd8c8594::logevent_nvgtoggled(gettime(), self.lifeid, self.origin, isenabled, duration, "none");
    self.var_941cde8837521cff = var_2a3902259f88e70e;
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71d
// Size: 0x83
function function_ca7eb80548414e31() {
    level endon("game_ended");
    self notify("nvg_monitorBlocking");
    self endon("nvg_monitorBlocking");
    thread function_b229e871fddf36d0();
    self endon("disconnect");
    while (1) {
        self waittill("pickup_object");
        childthread function_dffe59707d84c40f();
        if (namespace_3c37cb17ade254d::is_player_gamepad_enabled()) {
            function_b8159504f369a68d(0);
        }
        waittill_any_5("manual_drop", "force_manual_drop", "manual_drop_cleanup", "bomb_planted", "death");
        if (namespace_3c37cb17ade254d::is_player_gamepad_enabled()) {
            function_b8159504f369a68d(1);
        }
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a7
// Size: 0x26
function function_b229e871fddf36d0() {
    self endon("nvg_monitorBlocking");
    self endon("disconnect");
    level waittill("start_game_ended");
    if (isdefined(self)) {
        function_b8159504f369a68d(0);
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d4
// Size: 0x37
function function_57a8aa1600b3e550(isenabled) {
    var_6ddd66ee8722807b = ter_op(istrue(isenabled), "on", "off");
    self setscriptablepartstate("3PLight", var_6ddd66ee8722807b, 0);
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x812
// Size: 0xae
function function_389f3670051fb40d() {
    level endon("game_ended");
    self notify("nvg_monitor3PLight");
    self endon("nvg_monitor3PLight");
    self endon("disconnect");
    self endon("death");
    while (1) {
        childthread function_d8e93127577a3812("grenade_pullback");
        childthread function_d8e93127577a3812("weapon_switch");
        childthread function_d8e93127577a3812("offhand_end");
        newweapon = self waittill("nvg_checkWeapon");
        if (!isdefined(newweapon) || !function_add04ed347410264(newweapon)) {
            function_18d34f9bb2010a02(1);
        } else {
            function_18d34f9bb2010a02(0);
        }
        if (istrue(self.pers["useNVG"])) {
            function_57a8aa1600b3e550(function_7b70c15687fd673c());
        }
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c7
// Size: 0x2b
function function_d8e93127577a3812(var_4b9ab96c345311a6) {
    self endon("nvg_checkWeapon");
    weapon = self waittill(var_4b9ab96c345311a6);
    self notify("nvg_checkWeapon", weapon);
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f9
// Size: 0x19
function function_7b70c15687fd673c() {
    var_a8df187ef07439e1 = istrue(self.var_a81b0bebe46e1039);
    return var_a8df187ef07439e1;
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91a
// Size: 0x28
function function_18d34f9bb2010a02(var_a8df187ef07439e1) {
    if (var_a8df187ef07439e1) {
        self.var_a81b0bebe46e1039 = 1;
    } else {
        self.var_a81b0bebe46e1039 = undefined;
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x949
// Size: 0x89
function function_add04ed347410264(weapon) {
    if (!isdefined(weapon.basename)) {
        return 0;
    }
    switch (weapon.basename) {
    case #"hash_22f1c67a16accbe":
    case #"hash_288bc6291d670eaa":
    case #"hash_33c7f389fa9d6dd5":
    case #"hash_b43c2e4c05fafc4b":
    case #"hash_c94fd51fe359fdfe":
    case #"hash_decd8473cdd1b5a9":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d9
// Size: 0x3e
function function_dffe59707d84c40f() {
    self endon("manual_drop");
    self endon("force_manual_drop");
    self notify("nvg_monitoringGamePad");
    self endon("nvg_monitoringGamePad");
    while (1) {
        self waittill("input_type_changed");
        function_b8159504f369a68d(!namespace_3c37cb17ade254d::is_player_gamepad_enabled());
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1e
// Size: 0x31
function function_b8159504f369a68d(isallowed) {
    if (isallowed) {
        namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("blockNVGs");
    } else {
        namespace_1cd9f6896754adb0::set("blockNVGs", "nvg", 0);
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa56
// Size: 0x102
function nvg_get3rdpersonupmodel() {
    var_2626c56ce4ecc11b = undefined;
    if (isdefined(level.nvgheadoverrides[self.operatorcustomization.head])) {
        var_2626c56ce4ecc11b = level.nvgheadoverrides[self.operatorcustomization.head]["up"];
    }
    var_3474b4e818850c46 = getdvar(@"hash_59fbd1482230b72f");
    if (isdefined(var_3474b4e818850c46) && var_3474b4e818850c46 != "") {
        var_2626c56ce4ecc11b = var_3474b4e818850c46;
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_2626c56ce4ecc11b = undefined;
    } else if (!isdefined(var_2626c56ce4ecc11b)) {
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

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb60
// Size: 0xf3
function nvg_get3rdpersondownmodel() {
    var_4e05baf0bb66c66e = undefined;
    if (isdefined(level.nvgheadoverrides[self.operatorcustomization.head])) {
        var_4e05baf0bb66c66e = level.nvgheadoverrides[self.operatorcustomization.head]["down"];
    }
    var_3474b4e818850c46 = getdvar(@"hash_59fbd1482230b72f");
    if (isdefined(var_3474b4e818850c46) && var_3474b4e818850c46 != "") {
        var_4e05baf0bb66c66e = var_3474b4e818850c46;
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

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5b
// Size: 0xbf
function nvg_update3rdperson(enabled) {
    if (isdefined(self.nvg3rdpersonmodel)) {
        self detach(self.nvg3rdpersonmodel, "j_head");
        self.nvg3rdpersonmodel = undefined;
    }
    if (getdvarint(@"hash_e3e35ec6cd674ca", 0) == 1) {
        return;
    }
    if (enabled) {
        var_4e05baf0bb66c66e = nvg_get3rdpersondownmodel();
        if (isdefined(var_4e05baf0bb66c66e)) {
            self.nvg3rdpersonmodel = var_4e05baf0bb66c66e;
            self attach(self.nvg3rdpersonmodel, "j_head");
        }
    } else {
        var_2626c56ce4ecc11b = nvg_get3rdpersonupmodel();
        if (isdefined(var_2626c56ce4ecc11b)) {
            self.nvg3rdpersonmodel = var_2626c56ce4ecc11b;
            self attach(self.nvg3rdpersonmodel, "j_head");
        }
    }
}

// Namespace nvg/namespace_32b635fd0594e0cc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd21
// Size: 0x21
function function_258c5e445c8b7f80() {
    return namespace_36f464722d326bbe::function_d2d2b803a7b741a4() && !namespace_aead94004cf4c147::isBackpackInventoryEnabled() && !istrue(self.gulag);
}

