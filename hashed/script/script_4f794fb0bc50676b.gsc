// mwiii decomp prototype
#using script_686729055b66c6e4;
#using script_7edf952f8921aa6b;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using script_3214e6fcdce468a7;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_f50b7a445cd149bc;

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d6
// Size: 0x122
function init() {
    level callback::add("player_weapon_change", &function_7bd275ed660d3b32);
    level._effect["plasmagun_trail"] = [];
    level._effect["plasmagun_trail_pap"] = [];
    for (i = 0; i < 6; i++) {
        level._effect["plasmagun_trail"][i] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_zmb_dark_aether_plasma_hit_lvl" + i + ".vfx");
        level._effect["plasmagun_trail_pap"][i] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_zmb_dark_aether_plasma_hit_pap_lvl" + i + ".vfx");
    }
    level._effect["plasmagun_air_launch_explosion"] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_zmb_dark_aether_plasma_fiy_loop_camera_1p.vfx");
    level callback::add("on_zombie_ai_killed", &function_acff8f7424c6a789);
    var_a6a33e69f0bceb0c = makeweapon("jup_la_plasmagun_mp");
    /#
        assert(isdefined(var_a6a33e69f0bceb0c.weaponcustomsettings), "Can't find custom weapon setting for Plasma Gun");
    #/
    level.var_bb16eca3af147d1e = var_a6a33e69f0bceb0c.weaponcustomsettings;
    level.var_4f5da0e672c7da16 = function_e4c99b0f178ffb98("plasmagun_damage", 5, 0.05);
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ff
// Size: 0x102
function function_7bd275ed660d3b32(params) {
    if (!isdefined(params.weapon) || isbot(self)) {
        return;
    }
    if (params.weapon.basename == "jup_la_plasmagun_mp") {
        thread function_bcdfcd35a8621567();
        thread function_67a4136e8238d49c();
        thread function_b68365b7252e2cc3(params.weapon);
        thread function_e52edfb5ea677904();
        thread function_3a1fea67117b5878(params.weapon);
    } else {
        self notify("stop_plasmagun_watch_enter_charge");
        self notify("stop_plasmagun_watch_fire_notify");
        self notify("stop_monitor_plasmagun_vfx_state");
        self notify("stop_plasmagun_watch_charge_overtime");
        utility::function_3677f2be30fdd581("PlasmaLauncherAmbientVFX", "off");
        self.var_1b497a63cfb737b2 = 0;
    }
    if (function_fe8f110892c02b38("ui_plasma_launcher_charge_time")) {
        var_e86e779321cf55a2 = function_d379e4f28a5e64b7();
        var_fa84b91cdac6791f = ter_op(var_e86e779321cf55a2, 2, 3);
        self setclientomnvar("ui_plasma_launcher_charge_time", var_fa84b91cdac6791f);
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x808
// Size: 0x8e
function private function_bcdfcd35a8621567() {
    self endon("death");
    self notify("stop_plasmagun_watch_enter_charge");
    self endon("stop_plasmagun_watch_enter_charge");
    while (1) {
        param = self waittill("weapon_enter_or_clear_charge");
        switch (param) {
        case 0:
            function_d4e2072a078a7a16();
            break;
        case 1:
            function_2fe43dabafffe097();
            break;
        case 2:
            function_1a8cf1d0a5a6b560();
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x89d
// Size: 0xa3
function private function_67a4136e8238d49c() {
    self endon("death");
    self notify("stop_plasmagun_watch_fire_notify");
    self endon("stop_plasmagun_watch_fire_notify");
    while (1) {
        objweapon = self waittill("weapon_fired");
        if (isdefined(objweapon) && objweapon.basename == "jup_la_plasmagun_mp") {
            if (istrue(self.var_e8aa11bc1e7cb985) && isdefined(self.var_f66d06842794850a)) {
                thread function_5fb77a929eee804c(objweapon);
            } else if (istrue(self.var_ea0b71e2cfd433a8) && isdefined(self.var_8929c2f2830df829)) {
                function_ec35cd5953d2903b(objweapon);
            }
            self.var_90ae1d56bf49c344 = 1;
        }
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x947
// Size: 0xff
function private function_d4e2072a078a7a16() {
    val::set("plasma_charge", "mantle", 0);
    val::set("plasma_charge", "sprint", 0);
    val::set("plasma_charge", "equipment_primary", 0);
    val::set("plasma_charge", "equipment_secondary", 0);
    val::set("plasma_charge", "gesture", 0);
    var_9188795b9c55b203 = 0;
    state_name = "fire_charge";
    if (function_d379e4f28a5e64b7() > 0) {
        var_9188795b9c55b203 = 1;
        state_name = "fire_charge_pap";
    }
    thread function_9794ae7dbbc171b6(state_name, var_9188795b9c55b203);
    if (function_fe8f110892c02b38("ui_plasma_launcher_light_color")) {
        self setclientomnvar("ui_plasma_launcher_light_color", 0);
    }
    utility::function_3677f2be30fdd581("PlasmaLauncherStates", state_name);
    self.var_f66d06842794850a = gettime();
    self.var_e8aa11bc1e7cb985 = 1;
    self.var_8929c2f2830df829 = undefined;
    self.var_ea0b71e2cfd433a8 = 0;
    self.var_90ae1d56bf49c344 = 0;
    self notify("plasmagun_ammo_regen_stop");
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa4d
// Size: 0x100
function private function_2fe43dabafffe097() {
    val::set("plasma_charge", "mantle", 0);
    val::set("plasma_charge", "sprint", 0);
    val::set("plasma_charge", "equipment_primary", 0);
    val::set("plasma_charge", "equipment_secondary", 0);
    val::set("plasma_charge", "gesture", 0);
    var_9188795b9c55b203 = 0;
    state_name = "launch_charge";
    if (function_d379e4f28a5e64b7() > 0) {
        var_9188795b9c55b203 = 1;
        state_name = "launch_charge_pap";
    }
    thread function_9794ae7dbbc171b6(state_name, var_9188795b9c55b203);
    if (function_fe8f110892c02b38("ui_plasma_launcher_light_color")) {
        self setclientomnvar("ui_plasma_launcher_light_color", 1);
    }
    utility::function_3677f2be30fdd581("PlasmaLauncherStates", state_name);
    self.var_f66d06842794850a = undefined;
    self.var_e8aa11bc1e7cb985 = 0;
    self.var_8929c2f2830df829 = gettime();
    self.var_ea0b71e2cfd433a8 = 1;
    self.var_90ae1d56bf49c344 = 0;
    self notify("plasmagun_ammo_regen_stop");
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb54
// Size: 0xa1
function private function_9794ae7dbbc171b6(state_name, var_9188795b9c55b203) {
    self endon("death");
    self notify("stop_plasmagun_watch_charge_overtime");
    self endon("stop_plasmagun_watch_charge_overtime");
    wait_time = 3;
    if (var_9188795b9c55b203) {
        wait_time = 2;
    }
    msg = waittill_any_timeout_1(wait_time + 0.1, "skydive_deployparachute");
    if (isdefined(msg) && msg == "skydive_deployparachute") {
        function_1a8cf1d0a5a6b560();
    }
    if (utility::function_35c178c80fa19cbd("PlasmaLauncherStates", state_name)) {
        utility::function_3677f2be30fdd581("PlasmaLauncherStates", "off");
        thread function_3a1fea67117b5878(self getcurrentweapon());
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbfc
// Size: 0xd1
function private function_1a8cf1d0a5a6b560() {
    val::set("plasma_charge", "mantle", 1);
    val::set("plasma_charge", "sprint", 1);
    val::set("plasma_charge", "equipment_primary", 1);
    val::set("plasma_charge", "equipment_secondary", 1);
    val::set("plasma_charge", "gesture", 1);
    if (istrue(self.var_90ae1d56bf49c344)) {
        return;
    }
    if (function_fe8f110892c02b38("ui_plasma_launcher_light_color")) {
        self setclientomnvar("ui_plasma_launcher_light_color", 0);
    }
    utility::function_3677f2be30fdd581("PlasmaLauncherStates", "off");
    self.var_f66d06842794850a = undefined;
    self.var_e8aa11bc1e7cb985 = 0;
    self.var_8929c2f2830df829 = undefined;
    self.var_ea0b71e2cfd433a8 = 0;
    thread function_3a1fea67117b5878(self getcurrentweapon());
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcd4
// Size: 0x83
function private function_71e3d59774799cfa(var_211d72a36271e99d, var_f70ff2193bcb2c83) {
    if (var_211d72a36271e99d) {
        if (var_f70ff2193bcb2c83) {
            utility::function_3677f2be30fdd581("PlasmaLauncherStates", "weapon_launch_fired_full");
        } else {
            utility::function_3677f2be30fdd581("PlasmaLauncherStates", "weapon_launch_fired");
        }
    } else if (var_f70ff2193bcb2c83) {
        utility::function_3677f2be30fdd581("PlasmaLauncherStates", "weapon_fired_full");
    } else {
        utility::function_3677f2be30fdd581("PlasmaLauncherStates", "weapon_fired");
    }
    thread function_5b2ffe8a6eb4cf9d();
    thread function_3a1fea67117b5878(self getcurrentweapon());
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd5e
// Size: 0x1c
function private function_5b2ffe8a6eb4cf9d() {
    self endon("death");
    waitframe();
    utility::function_3677f2be30fdd581("PlasmaLauncherStates", "off");
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd81
// Size: 0x78
function private function_e52edfb5ea677904() {
    self endon("death");
    self endon("stop_monitor_plasmagun_vfx_state");
    while (1) {
        result = waittill_any_return_5("weapon_switch_started", "skydive_deployparachute", "weapon_switch_canceled", "offhand_end", "skydive_end");
        if (!isdefined(result)) {
            continue;
        }
        if (result == "weapon_switch_started" || result == "skydive_deployparachute") {
            self.var_1b497a63cfb737b2 = 1;
        } else {
            self.var_1b497a63cfb737b2 = 0;
        }
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe00
// Size: 0xb0
function private function_b68365b7252e2cc3(current_weapon) {
    self endon("death");
    self notify("stop_monitor_plasmagun_vfx_state");
    self endon("stop_monitor_plasmagun_vfx_state");
    var_e6f4ad46c089cece = "off";
    if (!istrue(self.var_c9b32cb8f261f065)) {
        wait(1);
        self.var_c9b32cb8f261f065 = 1;
    }
    while (1) {
        if (istrue(self.var_1b497a63cfb737b2)) {
            fx_state = "off";
        } else {
            fx_state = "on";
        }
        if (fx_state != var_e6f4ad46c089cece) {
            if (fx_state == "on" && function_d379e4f28a5e64b7() > 0) {
                fx_state = "on_pap";
            }
            utility::function_3677f2be30fdd581("PlasmaLauncherAmbientVFX", fx_state);
            var_e6f4ad46c089cece = fx_state;
        }
        waitframe();
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb7
// Size: 0x4b
function private function_d379e4f28a5e64b7() {
    if (issharedfuncdefined("zombie", "get_pap_level")) {
        current_weapon = self getcurrentweapon();
        if (!is_equal(current_weapon.basename, "jup_la_plasmagun_mp")) {
            return 0;
        }
        return function_af5127390d3221e9(current_weapon);
    }
    return 0;
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf0a
// Size: 0xa0
function private function_3f54cae9f655ea24(var_3032a1d2003305a6, var_fa84b91cdac6791f, var_9d7ea9fde0db54eb) {
    var_da49a6c35dc8e259 = 0;
    var_d389b0c90dbea55d = ter_op(var_3032a1d2003305a6, 2, 3);
    if (function_fe8f110892c02b38("ui_plasma_launcher_charge_time")) {
        self setclientomnvar("ui_plasma_launcher_charge_time", var_d389b0c90dbea55d);
    }
    if (var_fa84b91cdac6791f >= var_d389b0c90dbea55d) {
        var_da49a6c35dc8e259 = 5;
    } else {
        var_da49a6c35dc8e259 = int(var_fa84b91cdac6791f / var_d389b0c90dbea55d * 5);
    }
    var_da49a6c35dc8e259 = max(var_da49a6c35dc8e259, 1);
    var_de8a9ead75a0581 = self getweaponammoclip(var_9d7ea9fde0db54eb);
    var_da49a6c35dc8e259 = int(min(var_da49a6c35dc8e259, var_de8a9ead75a0581 + 1));
    return var_da49a6c35dc8e259;
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfb2
// Size: 0x55
function private function_1f358f6cc8bd3599(var_87599197ac030074, ai_target, var_5c63b3413b883ca7) {
    if (isdefined(ai_target) && ai_target namespace_1f188a13f7e79610::isvehicle()) {
        var_87599197ac030074 = 100;
    }
    var_8cee2fb29562a6ec = 1;
    if (var_5c63b3413b883ca7 > 0) {
        var_8cee2fb29562a6ec = 2 + 0.5 * (var_5c63b3413b883ca7 - 1);
    }
    return var_87599197ac030074 * var_8cee2fb29562a6ec;
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x100f
// Size: 0x38b
function private function_5fb77a929eee804c(objweapon) {
    self endon("death");
    var_3032a1d2003305a6 = 0;
    var_800f2adb5f8efb28 = function_d379e4f28a5e64b7();
    if (var_800f2adb5f8efb28 > 0) {
        var_3032a1d2003305a6 = 1;
    }
    time_now = gettime();
    var_ff1723e516236c87 = function_c89ed1840c8d0f0f(time_now - self.var_f66d06842794850a);
    var_f70ff2193bcb2c83 = 0;
    var_f528b2c52c8909ac = function_3f54cae9f655ea24(var_3032a1d2003305a6, var_ff1723e516236c87, objweapon);
    function_a88ee6bfa7bbbf2d(objweapon, var_f528b2c52c8909ac);
    if (var_f528b2c52c8909ac == 5) {
        var_f70ff2193bcb2c83 = 1;
    }
    function_71e3d59774799cfa(0, var_f70ff2193bcb2c83);
    self.var_f66d06842794850a = undefined;
    /#
        function_b333f7f92486cb57("fire_charge" + var_f528b2c52c8909ac);
    #/
    var_7e997c12a6b016b0 = level.var_bb16eca3af147d1e.var_5737a3eec36cf475 + level.var_bb16eca3af147d1e.var_b2cc181b1e309cae * var_f528b2c52c8909ac;
    var_351af8c1f3879c3f = level.var_bb16eca3af147d1e.var_7c57d2cc8909e9da + level.var_bb16eca3af147d1e.var_803043770a12cf9 * var_f528b2c52c8909ac;
    var_c95187ac203b53a2 = var_351af8c1f3879c3f / 2;
    start_point = self getvieworigin();
    player_angles = self getplayerangles();
    var_2dac0753d0fb4b2d = vectornormalize(anglestoforward(player_angles));
    var_5cb594641df06ee1 = self gettagorigin("tag_flash");
    end_point = start_point + var_2dac0753d0fb4b2d * var_7e997c12a6b016b0;
    var_5160014ce4ec2684 = (start_point + end_point) / 2;
    var_6fda1daae1df6534 = function_1e42f5373983de9f(start_point, player_angles);
    var_f464ee4235e6e103 = level.var_bb16eca3af147d1e.var_6cf27ccb42a2cb44 + level.var_bb16eca3af147d1e.var_d61c1c529cf19e43 * var_f528b2c52c8909ac;
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 0, 0, 0, 0);
    ignoreents = [0:self];
    trace = namespace_2a184fc4902783dc::ray_trace(start_point, end_point, ignoreents, contentoverride);
    end_point = trace["position"];
    var_390da608d44b5b72 = spawn_tag_origin(var_6fda1daae1df6534, vectortoangles(vectornormalize(end_point - var_6fda1daae1df6534)));
    var_390da608d44b5b72 show();
    var_390da608d44b5b72 function_172fff96f149cb86(trace["position"], var_f528b2c52c8909ac, 0.3, var_800f2adb5f8efb28);
    var_daaa88e256ba5cdf = spawn_tag_origin(var_6fda1daae1df6534, vectortoangles(vectornormalize(end_point - var_6fda1daae1df6534)));
    var_daaa88e256ba5cdf thread function_9aa347a76fa69e30(var_f528b2c52c8909ac, var_f464ee4235e6e103);
    /#
        function_2287375d7ea1f1ae(start_point, end_point, var_c95187ac203b53a2, (0, 1, 0), 0, 240);
    #/
    var_88f52a15dfb77ad2 = function_b42e7cb6787cfbef(start_point, end_point, var_5160014ce4ec2684, var_7e997c12a6b016b0, var_c95187ac203b53a2, var_2dac0753d0fb4b2d);
    foreach (ai_target in var_88f52a15dfb77ad2) {
        ai_target function_1be0050857965aa8(var_3032a1d2003305a6);
        ai_target thread function_140dea1474dc3f28(function_1f358f6cc8bd3599(level.var_bb16eca3af147d1e.var_cc23e257b705ba8c, ai_target, var_800f2adb5f8efb28), self, objweapon);
    }
    thread function_85eca118ca41d759(objweapon, var_f464ee4235e6e103, var_800f2adb5f8efb28, start_point, end_point, var_5160014ce4ec2684, var_7e997c12a6b016b0, var_c95187ac203b53a2, var_2dac0753d0fb4b2d);
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a1
// Size: 0x101
function function_85eca118ca41d759(objweapon, var_f464ee4235e6e103, var_800f2adb5f8efb28, start_point, end_point, var_5160014ce4ec2684, var_7e997c12a6b016b0, var_c95187ac203b53a2, var_2dac0753d0fb4b2d) {
    self endon("death");
    var_b9937f7b1b9b4ee2 = 0;
    while (var_b9937f7b1b9b4ee2 < var_f464ee4235e6e103) {
        wait(0.5);
        var_88f52a15dfb77ad2 = function_b42e7cb6787cfbef(start_point, end_point, var_5160014ce4ec2684, var_7e997c12a6b016b0, var_c95187ac203b53a2, var_2dac0753d0fb4b2d);
        foreach (ai_target in var_88f52a15dfb77ad2) {
            ai_target thread function_140dea1474dc3f28(function_1f358f6cc8bd3599(level.var_bb16eca3af147d1e.var_ae0afbdb9e060fc8, ai_target, var_800f2adb5f8efb28), self, objweapon);
        }
        var_b9937f7b1b9b4ee2 = var_b9937f7b1b9b4ee2 + 0.5;
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a9
// Size: 0x54
function function_140dea1474dc3f28(var_a3092db3aac5015d, player, objweapon) {
    self endon("death");
    throttle::function_f632348cbb773537(level.var_4f5da0e672c7da16, self);
    self dodamage(var_a3092db3aac5015d, player.origin, player, undefined, "MOD_UNKNOWN", objweapon, "upper_torso");
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1504
// Size: 0x6d
function function_1be0050857965aa8(var_3032a1d2003305a6) {
    var_36aa7007d5c49a07 = "plasma_hit_vfx";
    if (var_3032a1d2003305a6) {
        var_36aa7007d5c49a07 = var_36aa7007d5c49a07 + "_pap";
    }
    if (isdefined(self.aicategory) && self.aicategory == "normal" && randomint(10) < 5) {
        var_36aa7007d5c49a07 = var_36aa7007d5c49a07 + "a";
    }
    utility::function_3677f2be30fdd581("plasma_hit", var_36aa7007d5c49a07);
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1578
// Size: 0x7d
function function_1e42f5373983de9f(var_77b1b2703bb71422, player_angles) {
    var_f1eb02de236eecda = getdvarint(@"hash_cb8683d34d92d83", 100);
    var_8a444f6f271a657a = getdvarint(@"hash_6c6825ac08c7934b", -2);
    var_bff3e0f8dbdbb856 = getdvarint(@"hash_625b2aec934211f3", -3);
    var_949d9008fc020806 = rotatevector((var_f1eb02de236eecda, var_8a444f6f271a657a, var_bff3e0f8dbdbb856), player_angles);
    return var_77b1b2703bb71422 + var_949d9008fc020806;
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fd
// Size: 0xb4
function function_172fff96f149cb86(end_point, charge_level, var_d214566710738392, var_5c63b3413b883ca7) {
    level endon("game_ended");
    self endon("death");
    if (var_5c63b3413b883ca7 > 0) {
        playfxontag(level._effect["plasmagun_trail_pap"][charge_level], self, "tag_origin");
    } else {
        playfxontag(level._effect["plasmagun_trail"][charge_level], self, "tag_origin");
    }
    thread play_loop_sound_on_entity("proj_plasmagun_lp");
    self moveto(end_point, var_d214566710738392);
    wait(var_d214566710738392);
    stop_loop_sound_on_entity("proj_plasmagun_lp");
    playsoundatpos(self.origin, "proj_plasmagun_lp_end");
    self delete();
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b8
// Size: 0x58
function function_9aa347a76fa69e30(charge_level, var_3ae198b1ea89871) {
    level endon("game_ended");
    self endon("death");
    thread play_loop_sound_on_entity("proj_plasmagun_lp");
    wait(var_3ae198b1ea89871);
    stop_loop_sound_on_entity("proj_plasmagun_lp");
    playsoundatpos(self.origin, "proj_plasmagun_lp_end");
    self delete();
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1717
// Size: 0x1a3
function function_b42e7cb6787cfbef(start_point, end_point, var_5160014ce4ec2684, var_7e997c12a6b016b0, var_c95187ac203b53a2, var_2dac0753d0fb4b2d) {
    var_48c04837d9e0eafc = var_c95187ac203b53a2 * var_c95187ac203b53a2;
    var_18c86d4b6f045520 = (var_c95187ac203b53a2 + 30) * (var_c95187ac203b53a2 + 30);
    var_8dae93390b0b3a19 = getaiarrayinradius(var_5160014ce4ec2684, var_7e997c12a6b016b0 / 2);
    var_88f52a15dfb77ad2 = [];
    foreach (var_6175dabe2b377ef0 in var_8dae93390b0b3a19) {
        var_aa440cdd07894c27 = var_6175dabe2b377ef0 getcentroid();
        /#
            function_f4402753f88cefb5(var_aa440cdd07894c27, 20, (1, 0, 0), 0, 240);
        #/
        if (pointvscylinder(var_aa440cdd07894c27, var_48c04837d9e0eafc, var_7e997c12a6b016b0, start_point, var_2dac0753d0fb4b2d)) {
            var_88f52a15dfb77ad2 = function_6d6af8144a5131f1(var_88f52a15dfb77ad2, var_6175dabe2b377ef0);
        }
    }
    var_5cc482101de7fbe0 = getentarrayinradius("script_vehicle", "classname", var_5160014ce4ec2684, var_7e997c12a6b016b0 / 2 + 30);
    foreach (var_d65737e032faf4d3 in var_5cc482101de7fbe0) {
        var_aa440cdd07894c27 = var_d65737e032faf4d3 getcentroid();
        if (pointvscylinder(var_aa440cdd07894c27, var_18c86d4b6f045520, var_7e997c12a6b016b0 + 30, start_point, var_2dac0753d0fb4b2d)) {
            var_88f52a15dfb77ad2 = function_6d6af8144a5131f1(var_88f52a15dfb77ad2, var_d65737e032faf4d3);
        }
    }
    return var_88f52a15dfb77ad2;
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18c2
// Size: 0x1d4
function private function_ec35cd5953d2903b(objweapon) {
    var_3032a1d2003305a6 = 0;
    var_800f2adb5f8efb28 = function_d379e4f28a5e64b7();
    time_now = gettime();
    var_987479ea4dd468d4 = function_c89ed1840c8d0f0f(time_now - self.var_8929c2f2830df829);
    if (var_800f2adb5f8efb28 > 0) {
        var_3032a1d2003305a6 = 1;
    }
    var_f70ff2193bcb2c83 = 0;
    var_7f54af4b0790e28d = function_3f54cae9f655ea24(var_3032a1d2003305a6, var_987479ea4dd468d4, objweapon);
    function_a88ee6bfa7bbbf2d(objweapon, var_7f54af4b0790e28d);
    if (var_7f54af4b0790e28d == 5) {
        var_f70ff2193bcb2c83 = 1;
    }
    function_71e3d59774799cfa(1, var_f70ff2193bcb2c83);
    self.var_8929c2f2830df829 = undefined;
    /#
        function_b333f7f92486cb57("zombie" + var_7f54af4b0790e28d);
    #/
    if (var_7f54af4b0790e28d > 0) {
        self radiusdamage(self.origin, level.var_bb16eca3af147d1e.var_60fca609d86bfc77, level.var_bb16eca3af147d1e.var_4f35c31d13113691 * var_7f54af4b0790e28d, level.var_bb16eca3af147d1e.var_4f35c31d13113691 * var_7f54af4b0790e28d, self, "MOD_EXPLOSIVE", "jup_la_plasmagun_mp");
        var_424765b57629b251 = spawn_tag_origin(self.origin, (0, 0, 0));
        var_424765b57629b251 show();
        playfxontag(level._effect["plasmagun_air_launch_explosion"], var_424765b57629b251, "tag_origin");
        var_424765b57629b251 delaycall(2, &delete);
        if (function_4de5fbb5a8d10590()) {
            neworigin = (self.origin[0], self.origin[1], self.origin[2] + 20);
            self setorigin(neworigin);
            self setvelocity((1, 1, level.var_bb16eca3af147d1e.var_e21272e6f0102e08 * var_7f54af4b0790e28d));
        }
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a9d
// Size: 0x80
function private function_4de5fbb5a8d10590() {
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 0, 0, 0, 0);
    ignoreents = [0:self];
    trace = namespace_2a184fc4902783dc::ray_trace(self.origin, self.origin + (0, 0, 80), ignoreents, contentoverride);
    if (isdefined(trace["fraction"]) && trace["fraction"] < 0.99) {
        return 0;
    }
    return 1;
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b25
// Size: 0xc2
function private function_acff8f7424c6a789(params) {
    if (isdefined(params.objweapon) && isdefined(params.objweapon.basename) && params.objweapon.basename == "jup_la_plasmagun_mp") {
        var_29a8ba8c9dd43fd2 = 0;
        if (issharedfuncdefined("zombie", "get_pap_level") && isdefined(params.eattacker)) {
            var_29a8ba8c9dd43fd2 = params.eattacker function_af5127390d3221e9(params.objweapon);
        }
        if (var_29a8ba8c9dd43fd2 > 0) {
            ent_flag_set("plasma_death_pap");
        } else {
            ent_flag_set("plasma_death");
        }
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bee
// Size: 0x6b
function private function_3a1fea67117b5878(var_a6a33e69f0bceb0c) {
    self endon("death_or_disconnect");
    self notify("plasmagun_ammo_regen_stop");
    self endon("plasmagun_ammo_regen_stop");
    wait(2);
    clip_size = weaponclipsize(var_a6a33e69f0bceb0c);
    while (1) {
        wait(0.6);
        var_de8a9ead75a0581 = self getweaponammoclip(var_a6a33e69f0bceb0c);
        if (var_de8a9ead75a0581 >= clip_size) {
            break;
        }
        self setweaponammoclip(var_a6a33e69f0bceb0c, var_de8a9ead75a0581 + 1);
    }
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c60
// Size: 0x4b
function private function_a88ee6bfa7bbbf2d(var_a6a33e69f0bceb0c, charge_level) {
    var_de8a9ead75a0581 = self getweaponammoclip(var_a6a33e69f0bceb0c);
    new_ammo = int(max(0, var_de8a9ead75a0581 - charge_level + 1));
    self setweaponammoclip(var_a6a33e69f0bceb0c, new_ammo);
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1cb2
// Size: 0x2b
function private function_b333f7f92486cb57(string) {
    /#
        if (getdvarint(@"hash_6c4707e681bb2aa5", 0) == 0) {
            return;
        }
        iprintlnbold(string);
    #/
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x1ce4
// Size: 0x58
function private function_2287375d7ea1f1ae(start, end, radius, color, depthtest, duration) {
    /#
        if (getdvarint(@"hash_6c4707e681bb2aa5", 0) == 0) {
            return;
        }
        cylinder(start, end, radius, color, depthtest, duration);
    #/
}

// Namespace namespace_f50b7a445cd149bc/namespace_9839c571b9b98e7d
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1d43
// Size: 0x4f
function private function_f4402753f88cefb5(origin, radius, color, depthtest, duration) {
    /#
        if (getdvarint(@"hash_6c4707e681bb2aa5", 0) == 0) {
            return;
        }
        sphere(origin, radius, color, depthtest, duration);
    #/
}

