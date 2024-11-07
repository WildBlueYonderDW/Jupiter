#using scripts\sp\equipment\offhands.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;

#namespace namespace_c07206719a9cb6d8;

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3be
// Size: 0x174
function precache(offhand) {
    setdvarifuninitialized(@"hash_3aca48795d467555", 0);
    level.var_fc4f13d1550877e0 = spawnstruct();
    level.var_fc4f13d1550877e0.trace_contents = create_contents(1, 1, 0, 1, 1, 1, 0, 0, 1, 1);
    level.var_fc4f13d1550877e0.in_use = 0;
    level.var_fc4f13d1550877e0.var_a46d81ffa9ad3d38 = 0;
    level.var_fc4f13d1550877e0.var_c9b52c5429c64bba = 0;
    level.var_fc4f13d1550877e0.instances = 0;
    level.var_fc4f13d1550877e0.var_2616d3dd1d52992 = 1;
    level.var_fc4f13d1550877e0.var_da2c3632fe97d9eb = 1;
    level.var_fc4f13d1550877e0.var_9644508d9841f50a = 1;
    level.var_fc4f13d1550877e0.var_2a2a8dc3be44b0d7 = loadfx("vfx/iw8/level/lab/vfx_green_laser.vfx");
    registeroffhandfirefunc(offhand, &function_32f7b069ba153eaa);
    playeroffhandthread(&function_53402b702bd8e4ce);
    add_hint_string("offhand_spotter_detailed", %EQUIPMENT/OFFHAND_SPOTTER_FULL);
    add_hint_string("offhand_spotter_simple", %EQUIPMENT/OFFHAND_SPOTTER_SIMPLE, &function_75385c508a754a4b);
    add_hint_string("offhand_spotter_simple_press", %EQUIPMENT/OFFHAND_SPOTTER_SIMPLE_PRESS, &function_75385c508a754a4b);
    add_hint_string("offhand_spotter_commit", %EQUIPMENT/OFFHAND_SPOTTER_COMMIT, &function_77ff4092c0f2111c);
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53a
// Size: 0x1a
function function_32f7b069ba153eaa(grenade, weapon) {
    grenade delete();
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x55c
// Size: 0x11e
function function_53402b702bd8e4ce() {
    ent_flag_init("spotter_scope_up");
    while (true) {
        self waittill("grenade_pullback", grenadeweapon);
        if (grenadeweapon.basename == "offhand_spotter_scope") {
            ent_flag_set("spotter_scope_up");
            self notify("spotter_scope_raised");
            level.var_fc4f13d1550877e0.instances++;
            level.var_fc4f13d1550877e0.in_use = 1;
            wait 0.45;
            if (function_f9bae891decd126a("offhand_spotter_scope")) {
                thread function_737973b91098b744();
                if (istrue(level.var_fc4f13d1550877e0.var_2616d3dd1d52992)) {
                    thread display_hint("offhand_spotter_commit", undefined, 0, [level.player], ["spotter_scope_away"]);
                }
                setomnvar("ui_spotter_scope_toggle_visibility", 1);
                function_89c8024ac9f37744();
                setomnvar("ui_spotter_scope_toggle_visibility", 0);
            }
            self notify("spotter_scope_away");
            ent_flag_clear("spotter_scope_up");
            level.var_fc4f13d1550877e0.in_use = 0;
        }
    }
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x682
// Size: 0x1b
function function_89c8024ac9f37744() {
    self endon("weapon_switch_pressed");
    while (function_f9bae891decd126a("offhand_spotter_scope")) {
        waitframe();
    }
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a5
// Size: 0x186
function function_1af5449505bd5f10() {
    if (!level.player fragbuttonpressed() && !level.player function_61c258eacee448b2()) {
        return;
    }
    if (!level.var_fc4f13d1550877e0.var_a46d81ffa9ad3d38) {
        level.var_fc4f13d1550877e0.var_a46d81ffa9ad3d38 = 1;
    }
    var_2fc7b90001702e5c = array_add(getaiarray("allies"), level.player);
    if (isdefined(level.var_d53e9074f5864705)) {
        var_2fc7b90001702e5c = array_combine(var_2fc7b90001702e5c, level.var_d53e9074f5864705);
    }
    trace = ray_trace_detail(level.player geteye(), level.player geteye() + anglestoforward(level.player getplayerangles()) * 49999, var_2fc7b90001702e5c, level.var_fc4f13d1550877e0.trace_contents, 1);
    if (getdvarint(@"hash_3aca48795d467555")) {
        thread scripts\engine\trace::draw_trace(trace, undefined, 1, 60);
    }
    level notify("spotter_scope_target", trace);
    level.var_fc4f13d1550877e0.var_c9b52c5429c64bba = gettime();
    if (level.var_fc4f13d1550877e0.var_da2c3632fe97d9eb) {
        level.player playsound("laze_ready");
    }
    if (level.var_fc4f13d1550877e0.var_9644508d9841f50a) {
        level.player playrumbleonentity("damage_light");
    }
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x833
// Size: 0x43
function function_cf2ade74ef2ec215(enabled) {
    assertex(isdefined(level.var_fc4f13d1550877e0), "Trying to enable sounds on a spotter scope that was not properly spawned!");
    assert(isdefined(enabled));
    level.var_fc4f13d1550877e0.var_da2c3632fe97d9eb = enabled;
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x87e
// Size: 0x43
function function_bf4b28ac990e07c4(enabled) {
    assertex(isdefined(level.var_fc4f13d1550877e0), "Trying to enable sounds on a spotter scope that was not properly spawned!");
    assert(isdefined(enabled));
    level.var_fc4f13d1550877e0.var_9644508d9841f50a = enabled;
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c9
// Size: 0x58
function function_737973b91098b744() {
    self endon("spotter_scope_away");
    self endon("frag_released");
    while (true) {
        if (level.player usinggamepad()) {
            waittill_any_3("attack_pressed", "use_pressed", "melee_pressed");
        } else {
            self waittill("attack_pressed");
        }
        level function_1af5449505bd5f10();
        wait 0.25;
    }
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x929
// Size: 0xcc
function function_5e36ac4c83ab2d85() {
    overlay = newhudelem();
    overlay.x = 320;
    overlay.y = 240;
    overlay.alignx = "center";
    overlay.aligny = "middle";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 1;
    overlay.font = "objective";
    overlay.foreground = 1;
    overlay.fontscale = 1.2;
    overlay settext("+");
    return overlay;
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9fe
// Size: 0xbe
function function_77371b0fea36d1() {
    assertex(!isdefined(self.var_71c2f70ca88921b0), "Laser Tag getting created when one exists already!");
    self.var_33fd2e8ba5dc653d = spawn("script_model", self.origin + (0, 0, 0));
    self.var_33fd2e8ba5dc653d setmodel("misc_vm_handheld_green_laser");
    temp = makeweapon("iw8_spotter_scope_ir");
    self.var_33fd2e8ba5dc653d setmoverlaserweapon(temp);
    self.var_33fd2e8ba5dc653d linktoplayerview(self, "TAG_ACCESSORY_LEFT", (0, 0, 0), (0, 0, 0), 1);
    self.var_33fd2e8ba5dc653d hide();
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xac4
// Size: 0x15
function function_75385c508a754a4b() {
    return level.var_fc4f13d1550877e0.in_use;
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xae2
// Size: 0x16
function function_77ff4092c0f2111c() {
    return !level.var_fc4f13d1550877e0.in_use;
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb01
// Size: 0x15
function function_bce4bdd85e6b37d0() {
    return level.var_fc4f13d1550877e0.var_a46d81ffa9ad3d38;
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1f
// Size: 0x2e
function function_e28969e964231be6() {
    time = gettime();
    while (level.var_fc4f13d1550877e0.var_c9b52c5429c64bba < time) {
        waitframe();
    }
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb55
// Size: 0x42
function function_e3ecad902b0ebce7() {
    return isdefined(level.player.offhandweapon) && is_equal(level.player.offhandweapon.basename, "offhand_spotter_scope");
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xba0
// Size: 0x1e
function function_5499e027134652fc() {
    display_hint("offhand_spotter_detailed", undefined, undefined, level.player, "spotter_marked");
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbc6
// Size: 0x57
function function_7c5679320c7c1fac(var_7a410e817719294e, timeout) {
    if (level.player function_61c258eacee448b2()) {
        display_hint("offhand_spotter_simple_press", timeout, undefined, level.player, var_7a410e817719294e);
        return;
    }
    display_hint("offhand_spotter_simple", timeout, undefined, level.player, var_7a410e817719294e);
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc25
// Size: 0x23
function function_f7bf7870e38dcc6(timeout) {
    timeout = default_to(timeout, 12);
    function_7c5679320c7c1fac("spotter_marked", timeout);
}

// Namespace namespace_c07206719a9cb6d8 / namespace_26b24c57bb990cf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc50
// Size: 0x41
function function_37f7fc77b17ba731() {
    function_7c5679320c7c1fac("spotter_scope_offhand_raised", undefined);
    level.player waittill("spotter_scope_offhand_raised");
    wait 0.6;
    display_hint("offhand_spotter_commit", undefined, undefined, level.player, "spotter_marked");
}

