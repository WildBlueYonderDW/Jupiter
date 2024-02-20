// mwiii decomp prototype
#using scripts\asm\asm_bb.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using script_595089f78ef8e11b;

#namespace namespace_4f424515b9703262;

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309
// Size: 0x17a
function function_842e17022dab63c3() {
    if (flag("hellhound_audio")) {
        return;
    }
    flag_set("hellhound_audio");
    function_f11270bb42f7f080("ambient_unaware", "ambient_unaware", "vox_ai_hellhound_ambient_unaware", 1);
    function_f11270bb42f7f080("ambient_aware", "ambient_aware", "vox_ai_hellhound_ambient_aware", 1);
    function_f11270bb42f7f080("breath_inhale_slow", "breath_inhale_slow", "vox_ai_hellhound_breath_inhale_slow", 1);
    function_f11270bb42f7f080("breath_inhale_fast", "breath_inhale_fast", "vox_ai_hellhound_breath_inhale_fast", 1);
    function_f11270bb42f7f080("breath_exhale_slow", "breath_exhale_slow", "vox_ai_hellhound_breath_exhale_slow", 1);
    function_f11270bb42f7f080("breath_exhale_fast", "breath_exhale_fast", "vox_ai_hellhound_breath_exhale_fast", 1);
    function_f11270bb42f7f080("warning_close", "warning_close", "vox_ai_hellhound_warning_close", 2);
    function_f11270bb42f7f080("zombie_pain_start", "pain", "vox_ai_hellhound_pain", 3);
    function_f11270bb42f7f080("bite_vox", "attack", "vox_ai_hellhound_attack", 3);
    level callback::add("player_connect", &function_720c096e235021fd, self.basearchetype);
    foreach (player in level.players) {
        player thread function_720c096e235021fd(undefined, self.basearchetype);
    }
    level thread function_1dc3dbebbb45158a();
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a
// Size: 0x28
function function_8f8cff4c91f6845b() {
    thread function_78c6b4fdf8524643();
    function_3b76e1d247d2f5a(&function_cd12e4b6f6fa089c);
    callback::add("killed_body_cloned", &function_c9071c313b8c83dc);
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b9
// Size: 0x73
function private function_cd12e4b6f6fa089c(event, zombie, var_c2aec59361d95878, alias, priority) {
    switch (event) {
    case #"hash_c29acedba2860c6d":
        zombie function_5420e83b135ec96f(function_a5b14435e3229bed(1.5), 1);
        break;
    default:
        break;
    }
    function_d01c8da69fe6ad5(zombie, var_c2aec59361d95878, alias, priority);
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x533
// Size: 0x60
function private function_c9071c313b8c83dc(params) {
    /#
        assert(isdefined(params.body));
    #/
    if (self isscriptable()) {
        self setscriptablepartstate("sound_vo", "off");
    }
    level thread function_cd12e4b6f6fa089c("death", params.body, "death", "vox_ai_hellhound_death", 4);
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a
// Size: 0x10a
function function_78c6b4fdf8524643() {
    var_fc3f1cd5f74c5908 = 3;
    self endon("death");
    var_b038488e06f13dd0 = 0;
    var_fa42533f2450f37a = 0;
    var_36ac830085c37706 = 1;
    while (1) {
        params = function_4e5d15fb46a1875f();
        if (!istrue(var_36ac830085c37706)) {
            if (function_51d76700600cebe3(params.var_76897e90bbff1185) || var_fa42533f2450f37a >= 5) {
                var_fa42533f2450f37a = 0;
                var_b4ee4904cd7d9269 = "breath_exhale_" + params.var_f894d0cd3d945874;
            } else {
                var_fa42533f2450f37a++;
                var_b4ee4904cd7d9269 = "breath_exhale_" + params.var_f894d0cd3d945874;
            }
            var_36ac830085c37706 = 1;
        } else {
            var_b4ee4904cd7d9269 = "breath_inhale_" + params.var_f894d0cd3d945874;
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

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6ab
// Size: 0xcf
function private function_4e5d15fb46a1875f() {
    params = spawnstruct();
    params.var_b1b1f6668aecbbe5 = "ambient_unaware";
    params.var_f894d0cd3d945874 = "slow";
    params.var_76897e90bbff1185 = 1;
    if (isdefined(self.enemy)) {
        params.var_b1b1f6668aecbbe5 = "ambient_aware";
        if (bb_movetyperequested("run") || bb_movetyperequested("sprint") || bb_movetyperequested("super_sprint")) {
            params.var_f894d0cd3d945874 = "fast";
            params.var_76897e90bbff1185 = 1;
        } else {
            params.var_f894d0cd3d945874 = "slow";
            params.var_76897e90bbff1185 = 1;
        }
    }
    return params;
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x782
// Size: 0x2c
function private function_1dc3dbebbb45158a() {
    level endon("game_ended");
    level.var_3c408363d81b00e0 = 0;
    while (1) {
        level.var_3c408363d81b00e0 = 0;
        wait(0.1);
    }
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b5
// Size: 0x1d
function private function_720c096e235021fd(params, archetype) {
    thread function_4af19ec43ed1888e(archetype);
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d9
// Size: 0x12f
function private function_4af19ec43ed1888e(archetype) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    while (1) {
        wait(0.5);
        ai_array = getaiarrayinradius(self.origin, 750);
        if (isdefined(ai_array)) {
            foreach (ai in ai_array) {
                if (!isdefined(ai) || !isdefined(ai.basearchetype) || ai.basearchetype != archetype) {
                    continue;
                }
                if (istrue(ai.var_926b0f07a813ecc8)) {
                    continue;
                }
                if (!isdefined(ai.enemy) || ai.enemy != self || !isplayer(ai.enemy)) {
                    continue;
                }
                if (function_4974a1eb59f8524e(ai)) {
                    ai function_f707c26d8f269f94("warning_close");
                    ai thread function_9b98c632f16fb653();
                    wait(0.25);
                }
            }
        }
    }
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90f
// Size: 0x81
function private function_4974a1eb59f8524e(zombie) {
    dist = 750;
    distance = distance2dsquared(self.origin, zombie.origin);
    var_6e9af20b91466ec6 = distance < dist * dist;
    var_2eb8073bda36e7eb = distance < 40000;
    /#
        /#
            assert(isplayer(zombie.enemy));
        #/
    #/
    if (var_2eb8073bda36e7eb) {
        return 0;
    }
    return var_6e9af20b91466ec6;
}

// Namespace namespace_4f424515b9703262/namespace_3f4e80ef87da7f80
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x998
// Size: 0x22
function private function_9b98c632f16fb653() {
    self endon("death");
    self.var_926b0f07a813ecc8 = 1;
    wait(5);
    self.var_926b0f07a813ecc8 = 0;
}

