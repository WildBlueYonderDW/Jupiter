// mwiii decomp prototype
#using scripts\asm\asm_bb.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_595089f78ef8e11b;

#namespace namespace_b556fcabc41ef8fa;

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30e
// Size: 0x126
function function_4880ef9ac634c6e5() {
    if (flag("abom_audio")) {
        return;
    }
    flag_set("abom_audio");
    function_f11270bb42f7f080("ambient_unaware", "ambient_unaware", "vox_ai_abom_ambient_unaware", 1);
    function_f11270bb42f7f080("ambient_aware", "ambient_aware", "vox_ai_abom_ambient_aware", 1);
    function_f11270bb42f7f080("roar_start", "roar_start", "vox_ai_abom_roar_start", 3);
    function_f11270bb42f7f080("roar_loop", "roar_loop", "vox_ai_abom_roar_loop", 3);
    function_f11270bb42f7f080("roar_end", "roar_end", "vox_ai_abom_roar_end", 3);
    function_f11270bb42f7f080("mega_breath_inhale", "mega_breath_inhale", "vox_ai_abom_mega_unaware_inhale", 1);
    function_f11270bb42f7f080("mega_breath_exhale", "mega_breath_exhale", "vox_ai_abom_mega_unaware_exhale", 1);
    function_ea9336bca9113548("zombie_abom_mega", "roar_start", "roar_start", "vox_ai_abom_mega_roar_start", 3);
    function_ea9336bca9113548("zombie_abom_mega", "roar_loop", "roar_loop", "vox_ai_abom_mega_roar_loop", 3);
    function_ea9336bca9113548("zombie_abom_mega", "roar_end", "roar_end", "vox_ai_abom_mega_roar_end", 3);
    level thread function_1dc3dbebbb45158a();
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43b
// Size: 0x28
function function_64bb14058709dfa1() {
    thread function_ff4bd4c9a8c14004();
    function_3b76e1d247d2f5a(&function_cd12e4b6f6fa089c);
    callback::add("killed_body_cloned", &function_c9071c313b8c83dc);
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x46a
// Size: 0xa0
function private function_cd12e4b6f6fa089c(event, zombie, var_c2aec59361d95878, alias, priority) {
    switch (event) {
    case #"hash_a6ff7cd9f24bf577":
        if (zombie isscriptable()) {
            zombie setscriptablepartstate("sound_vo", "roar_loop");
            zombie notify("ai_vo_override");
            zombie function_e1458b9c46007db6();
        }
        return;
    case #"hash_9c129a1f158d2d10":
        zombie function_b08db677617ccc93();
        break;
    default:
        break;
    }
    function_d01c8da69fe6ad5(zombie, var_c2aec59361d95878, alias, priority);
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x511
// Size: 0x9e
function private function_c9071c313b8c83dc(params) {
    /#
        assert(isdefined(params.body));
    #/
    if (self isscriptable()) {
        self setscriptablepartstate("sound_vo", "off");
    }
    if (issubstr(self.subclass, "mega")) {
        level thread function_cd12e4b6f6fa089c("death", params.body, "death", "vox_ai_abom_mega_death", 4);
    } else {
        level thread function_cd12e4b6f6fa089c("death", params.body, "death", "vox_ai_abom_death", 4);
    }
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b6
// Size: 0x2c
function function_ff4bd4c9a8c14004() {
    if (issubstr(self.subclass, "mega")) {
        thread function_b22414d725f85412();
    } else {
        thread function_78c6b4fdf8524643();
    }
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e9
// Size: 0xf3
function function_78c6b4fdf8524643() {
    var_fc3f1cd5f74c5908 = 3;
    self notify("ambientvox_singleton");
    self endon("ambientvox_singleton");
    self endon("ambientvox_shutdown");
    self endon("death");
    var_b038488e06f13dd0 = 0;
    var_fa42533f2450f37a = 0;
    var_b4ee4904cd7d9269 = undefined;
    while (1) {
        params = function_4e5d15fb46a1875f();
        if (function_51d76700600cebe3(params.var_76897e90bbff1185) || var_fa42533f2450f37a >= 5) {
            var_fa42533f2450f37a = 0;
            var_b4ee4904cd7d9269 = params.var_b1b1f6668aecbbe5;
        } else {
            var_fa42533f2450f37a++;
            var_b4ee4904cd7d9269 = undefined;
        }
        if (isdefined(level.var_3c408363d81b00e0) && isdefined(var_b4ee4904cd7d9269)) {
            level.var_3c408363d81b00e0++;
            if (level.var_3c408363d81b00e0 < var_fc3f1cd5f74c5908) {
                var_b038488e06f13dd0 = 1;
                function_f707c26d8f269f94(var_b4ee4904cd7d9269);
                waitframe();
                ent_flag_waitopen("playing_vo");
            }
        }
        wait(randomfloatrange(0.5, 1.2));
    }
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e3
// Size: 0x119
function function_b22414d725f85412() {
    var_fc3f1cd5f74c5908 = 3;
    self notify("ambientvox_singleton");
    self endon("ambientvox_singleton");
    self endon("ambientvox_shutdown");
    self endon("death");
    var_b038488e06f13dd0 = 0;
    var_fa42533f2450f37a = 0;
    var_b4ee4904cd7d9269 = undefined;
    var_36ac830085c37706 = 1;
    while (1) {
        params = function_56f857cb70c424b6();
        if (params.var_b1b1f6668aecbbe5 == "ambient_aware") {
            wait(1);
            continue;
        }
        if (!istrue(var_36ac830085c37706)) {
            if (function_51d76700600cebe3(params.var_76897e90bbff1185) || var_fa42533f2450f37a >= 5) {
                var_fa42533f2450f37a = 0;
                var_b4ee4904cd7d9269 = "mega_breath_exhale";
            } else {
                var_fa42533f2450f37a++;
                var_b4ee4904cd7d9269 = "mega_breath_exhale";
            }
            var_36ac830085c37706 = 1;
        } else {
            var_b4ee4904cd7d9269 = "mega_breath_inhale";
            var_36ac830085c37706 = 0;
        }
        if (isdefined(level.var_3c408363d81b00e0)) {
            level.var_3c408363d81b00e0++;
            if (level.var_3c408363d81b00e0 < var_fc3f1cd5f74c5908) {
                var_b038488e06f13dd0 = 1;
                function_f707c26d8f269f94(var_b4ee4904cd7d9269);
                waitframe();
                ent_flag_waitopen("playing_vo");
            }
        }
        waitframe();
    }
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x803
// Size: 0xcf
function private function_4e5d15fb46a1875f() {
    params = spawnstruct();
    params.var_b1b1f6668aecbbe5 = "ambient_unaware";
    params.var_f894d0cd3d945874 = "slow";
    params.var_76897e90bbff1185 = 80;
    if (isdefined(self.enemy)) {
        params.var_b1b1f6668aecbbe5 = "ambient_aware";
        if (bb_movetyperequested("run") || bb_movetyperequested("sprint") || bb_movetyperequested("super_sprint")) {
            params.var_f894d0cd3d945874 = "fast";
            params.var_76897e90bbff1185 = 100;
        } else {
            params.var_f894d0cd3d945874 = "slow";
            params.var_76897e90bbff1185 = 80;
        }
    }
    return params;
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8da
// Size: 0xbe
function private function_56f857cb70c424b6() {
    params = spawnstruct();
    params.var_b1b1f6668aecbbe5 = "ambient_unaware";
    params.var_76897e90bbff1185 = 100;
    if (isdefined(self.enemy)) {
        params.var_b1b1f6668aecbbe5 = "ambient_aware";
        if (bb_movetyperequested("run") || bb_movetyperequested("sprint") || bb_movetyperequested("super_sprint")) {
            params.var_f894d0cd3d945874 = "fast";
            params.var_76897e90bbff1185 = 100;
        } else {
            params.var_f894d0cd3d945874 = "slow";
            params.var_76897e90bbff1185 = 80;
        }
    }
    return params;
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9a0
// Size: 0x2c
function private function_1dc3dbebbb45158a() {
    level endon("game_ended");
    level.var_3c408363d81b00e0 = 0;
    while (1) {
        level.var_3c408363d81b00e0 = 0;
        wait(0.1);
    }
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9d3
// Size: 0xb
function private function_e1458b9c46007db6() {
    self notify("ambientvox_shutdown");
}

// Namespace namespace_b556fcabc41ef8fa/namespace_af5b26a9896fd01e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e5
// Size: 0x2c
function private function_b08db677617ccc93() {
    if (issubstr(self.subclass, "mega")) {
        thread function_b22414d725f85412();
    } else {
        thread function_78c6b4fdf8524643();
    }
}

