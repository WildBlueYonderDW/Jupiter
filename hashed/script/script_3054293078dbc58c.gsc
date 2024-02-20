// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using script_3b64eb40368c1450;

#namespace namespace_4e684dc307dd4bdd;

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xfc
// Size: 0xd
function private autoexec main() {
    /#
        function_bda4aa7e471bfbf3();
    #/
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110
// Size: 0x5d
function function_a8c2757799695a5a(ent) {
    ent.state = 0;
    ent.ball_velocity = (0, 0, 0);
    ent.var_81c8a1b6673ed52b = 0;
    ent thread function_1038bfc87beec575();
    ent thread function_e61b88b7b91e2427();
    /#
        ent thread function_b088653a7495d62d();
    #/
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174
// Size: 0x4b
function function_79bb217b25d90ffd(ball, base_speed, var_263af4e6f5cae741, max_speed) {
    ball.var_8a5887cc6471628 = base_speed;
    ball.var_a00e75154ba3d095 = var_263af4e6f5cae741;
    ball.var_6f338079af50d4fd = max_speed;
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c6
// Size: 0x79
function function_ec9d7950434eb902(var_2b00c7459f596398, var_f75e4b9bea638a30, var_97d10b46c5a312ae) {
    function_4f4004b3bbfaf766(self, 2);
    self.ball_velocity = var_2b00c7459f596398;
    self.var_3178028790dde0a3 = vectornormalize(var_2b00c7459f596398);
    self.var_63295c4748ede4d1 = self.origin + var_2b00c7459f596398 * var_f75e4b9bea638a30;
    self.var_97d10b46c5a312ae = var_97d10b46c5a312ae;
    self.var_fec078b045fc536e = self.origin;
    self notify("new_homing_ball_velocity");
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x246
// Size: 0x4f
function function_8a1752d6a06e7cd7(ball, target_ent) {
    ball.var_349af4466beb8322 = target_ent;
    /#
        ball function_4cf7f726b9cf3d10("<unknown string>" + target_ent getentitynumber(), self.origin + (0, 0, 50));
    #/
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c
// Size: 0x15
function set_invisible(ball) {
    function_4f4004b3bbfaf766(ball, 0);
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b8
// Size: 0x90
function private function_4f4004b3bbfaf766(ball, state) {
    if (state != ball.state) {
        ball.state = state;
        if (state == 3) {
            /#
                /#
                    assert(isdefined(self.var_349af4466beb8322));
                #/
            #/
            self.var_10d2d4a57de28f3 = distance2d(self.var_349af4466beb8322.origin, self.origin);
        }
        /#
            ball function_4cf7f726b9cf3d10("<unknown string>" + function_abea44bf774018a9(state));
        #/
    }
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34f
// Size: 0x1b3
function private function_1038bfc87beec575() {
    self endon("death");
    while (1) {
        if (self.state == 2) {
            var_67456e666eba6a68 = length(self.ball_velocity);
            if (var_67456e666eba6a68 <= 0) {
                function_4f4004b3bbfaf766(self, 4);
            }
        }
        var_7f4a6be39f5c9522 = isalive(self.var_349af4466beb8322) && !istrue(self.var_349af4466beb8322.ignoreme) && !istrue(self.var_349af4466beb8322.notarget) && !istrue(self.var_349af4466beb8322.var_f2f5db77ae69537f);
        if (self.state == 4) {
            if (!var_7f4a6be39f5c9522) {
                var_6a75892a622e0cb7 = 3000;
                potential_targets = function_143526130b12b2b6(self.origin, var_6a75892a622e0cb7);
                foreach (target in potential_targets) {
                    if (isalive(target) && !is_equal(target.team, self.team) && !istrue(target.ignoreme) && !istrue(target.notarget)) {
                        self.var_349af4466beb8322 = target;
                        var_7f4a6be39f5c9522 = 1;
                        break;
                    }
                }
            }
            if (var_7f4a6be39f5c9522) {
                function_4f4004b3bbfaf766(self, 3);
            }
        } else if (self.state == 3) {
            if (!var_7f4a6be39f5c9522) {
                function_4f4004b3bbfaf766(self, 4);
            }
        }
        waitframe();
    }
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x509
// Size: 0x36e
function private function_e61b88b7b91e2427() {
    self endon("death");
    var_4c1e1071f143a794 = 0.2;
    self.var_fec078b045fc536e = self.origin;
    self.var_3178028790dde0a3 = (0, 0, 0);
    while (1) {
        if (self.state == 1 || self.state == 0) {
            waitframe();
            continue;
        }
        self.var_721631a6670b1b39 = getdvarfloat(@"hash_c9fae6a46956f427", 0.8);
        target_pos = function_40db784a7c4e39f6();
        if (self.origin != self.var_fec078b045fc536e) {
            self.var_3178028790dde0a3 = vectornormalize(self.origin - self.var_fec078b045fc536e);
        }
        self.var_fec078b045fc536e = self.origin;
        function_f1cf0263bc538e(var_4c1e1071f143a794, target_pos);
        var_2cf75c1bfe8ed095 = self.ball_velocity + self.origin;
        self moveto(var_2cf75c1bfe8ed095, var_4c1e1071f143a794);
        waitresult = waittill_any_timeout_2(var_4c1e1071f143a794, "movedone", "new_homing_ball_velocity");
        if (isdefined(target_pos) && self.var_fec078b045fc536e != self.origin && distancesquared(self.var_fec078b045fc536e, self.origin) > 1) {
            var_4a062b0b3c49dd29 = pointonsegmentnearesttopoint(self.var_fec078b045fc536e, self.origin, target_pos);
            if (distancesquared(var_4a062b0b3c49dd29, target_pos) < squared(64)) {
                function_b34696cf4be98a4d();
            }
            /#
                if (function_64e4823b3d753975()) {
                    sphere(var_4a062b0b3c49dd29, 20, (0, 0, 1));
                    sphere(target_pos, 20, (0, 0.2, 0.8));
                    function_4cf7f726b9cf3d10("<unknown string>" + distance(var_4a062b0b3c49dd29, target_pos), target_pos);
                }
            #/
        }
        if (self.var_fec078b045fc536e != self.origin && distancesquared(self.var_fec078b045fc536e, self.origin) > 1) {
            var_a074c763266c6245 = function_143526130b12b2b6(averagepoint([0:self.var_fec078b045fc536e, 1:self.origin]), distance(self.var_fec078b045fc536e, self.origin) + 64);
            foreach (character in var_a074c763266c6245) {
                var_cfb227596c65259f = pointonsegmentnearesttopoint(self.var_fec078b045fc536e, self.origin, character getcentroid());
                var_ba3647c931043819 = math::function_6c1e6433c5e5cf79(var_cfb227596c65259f, character getcentroid(), character getboundshalfsize(), character.angles);
                if (distancesquared(var_cfb227596c65259f, var_ba3647c931043819) < squared(64) && !is_equal(self.team, character.team)) {
                    params = spawnstruct();
                    params.var_5e0b6286b77b3b1 = character;
                    callback("homing_ball_hit_character", params);
                }
            }
        }
    }
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x87e
// Size: 0x76
function private function_40db784a7c4e39f6() {
    if (self.state == 3) {
        if (isplayer(self.var_349af4466beb8322)) {
            self.var_63295c4748ede4d1 = self.var_349af4466beb8322 geteye();
        } else {
            self.var_63295c4748ede4d1 = self.var_349af4466beb8322 getcentroid();
        }
    }
    if (self.state == 4) {
        self.var_63295c4748ede4d1 = undefined;
    }
    return self.var_63295c4748ede4d1;
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8fc
// Size: 0x75
function private function_b34696cf4be98a4d() {
    self.var_81c8a1b6673ed52b = gettime();
    self.var_dc1137ecccc6f5f = self.state;
    if (self.state == 2 && isdefined(self.var_349af4466beb8322)) {
        function_4f4004b3bbfaf766(self, 3);
        return;
    }
    if (self.state == 3) {
        return;
    }
    if (self.state == 4) {
        return;
    }
    function_4f4004b3bbfaf766(self, 1);
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x345
function private function_f1cf0263bc538e(var_4c1e1071f143a794, target_pos) {
    var_73d0c62ee90ef3c3 = vectortoangles(self.var_3178028790dde0a3);
    if (isdefined(target_pos)) {
        var_1c729d9d0f7eda98 = distance2d(self.origin, target_pos);
        var_37b788b5f5e40bad = function_c33c9ec6d127eef2(target_pos, var_1c729d9d0f7eda98);
        lerp_factor = function_da518249c3bd9b59(0, var_1c729d9d0f7eda98);
        var_b629d2bf1a7458cd = function_da518249c3bd9b59(1, var_1c729d9d0f7eda98);
        var_f061d14f16b87a29 = (math::angle_lerp(var_73d0c62ee90ef3c3[0], var_37b788b5f5e40bad[0], var_b629d2bf1a7458cd), math::angle_lerp(var_73d0c62ee90ef3c3[1], var_37b788b5f5e40bad[1], lerp_factor), 0);
        forward_dir = anglestoforward(var_f061d14f16b87a29);
        if (self.state == 2) {
            var_67456e666eba6a68 = length(self.ball_velocity);
            if (isdefined(self.var_97d10b46c5a312ae) && var_67456e666eba6a68 > 0) {
                var_582ed37ea04976eb = max(var_67456e666eba6a68 - self.var_97d10b46c5a312ae * var_4c1e1071f143a794, 0);
                self.ball_velocity = var_582ed37ea04976eb * forward_dir;
            }
        }
        if (self.state == 3) {
            ball_velocity = length(self.ball_velocity) * forward_dir;
            ball_velocity = ball_velocity + function_f68a56043bfa8c0b(target_pos, var_4c1e1071f143a794, ball_velocity);
            current_speed = length(self.ball_velocity);
            var_b060602d728a3773 = current_speed;
            var_218197316c330f7f = gettime() - self.var_81c8a1b6673ed52b;
            var_fea05b0ea3d32961 = 4000;
            if (var_218197316c330f7f < var_fea05b0ea3d32961) {
                var_b060602d728a3773 = max(current_speed - self.var_a00e75154ba3d095, self.var_8a5887cc6471628);
            } else {
                var_b060602d728a3773 = min(current_speed + self.var_a00e75154ba3d095, self.var_6f338079af50d4fd);
            }
            self.ball_velocity = vectornormalize(ball_velocity) * var_b060602d728a3773;
        }
    }
    if (self.state == 4) {
        var_f061d14f16b87a29 = var_73d0c62ee90ef3c3 + (var_73d0c62ee90ef3c3[0] * -1, getdvarfloat(@"hash_c20b6c498e282903", 150) * var_4c1e1071f143a794, 0);
        forward_dir = anglestoforward(var_f061d14f16b87a29);
        current_speed = length(self.ball_velocity);
        var_b060602d728a3773 = max(current_speed - self.var_a00e75154ba3d095, self.var_8a5887cc6471628);
        self.ball_velocity = forward_dir * var_b060602d728a3773;
    }
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);
    trace = ray_trace(self.origin, self.origin + self.ball_velocity, self, var_fbcabd62b8f66eb8);
    if (trace["fraction"] < 1) {
        self.ball_velocity = self.ball_velocity * -1 * getdvarfloat(@"hash_a02fb18b5abd33d5", 0.7);
        /#
            if (function_64e4823b3d753975()) {
                line(self.origin, trace["<unknown string>"], (1, 0, 0), 1);
                function_4cf7f726b9cf3d10("<unknown string>", trace["<unknown string>"]);
            }
        #/
    }
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcc4
// Size: 0xb9
function private function_da518249c3bd9b59(var_d55e1698aa5ff80, var_1c729d9d0f7eda98) {
    lerp_factor = function_53c4c53197386572(self.var_721631a6670b1b39, 1);
    var_218197316c330f7f = gettime() - self.var_81c8a1b6673ed52b;
    var_5fcd68807ada6113 = 5000;
    if (var_218197316c330f7f < var_5fcd68807ada6113) {
        var_c3d5c227bbae7696 = math::remap(var_218197316c330f7f, 0, var_5fcd68807ada6113, 0, 1);
        lerp_factor = lerp_factor * var_c3d5c227bbae7696;
    } else {
        var_dbc98a586e1f6959 = 500;
        var_68d730e81f6bc34a = clamp(math::remap(var_1c729d9d0f7eda98, 0, var_dbc98a586e1f6959, 0, 1), 0, 1);
        lerp_factor = lerp_factor + (1 - lerp_factor) * (1 - var_68d730e81f6bc34a);
    }
    return lerp_factor;
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd85
// Size: 0x147
function private function_c33c9ec6d127eef2(var_12a34cc28b3fbf8c, var_1c729d9d0f7eda98) {
    target_pos = var_12a34cc28b3fbf8c;
    if (self.state == 3) {
        var_b629d2bf1a7458cd = getdvarfloat(@"hash_db895954aaa6ff", 0.2);
        target_pos = (math::lerp(self.origin[0], target_pos[0], var_b629d2bf1a7458cd), math::lerp(self.origin[1], target_pos[1], var_b629d2bf1a7458cd), math::lerp(self.origin[2], target_pos[2], 1));
        var_218197316c330f7f = gettime() - self.var_81c8a1b6673ed52b;
        var_97c5229c3261cd1 = 3000;
        if (var_218197316c330f7f < var_97c5229c3261cd1 && self.var_dc1137ecccc6f5f == self.state) {
            var_32e9443ec5862a9b = math::remap(var_218197316c330f7f, 0, var_97c5229c3261cd1, 0, 180);
            var_41b7c06172fbc0b0 = sin(var_32e9443ec5862a9b);
            var_87f9074b4e8aa0eb = getdvarfloat(@"hash_1e6ae20696779f0d", 100) * var_41b7c06172fbc0b0;
            target_pos = target_pos + (0, 0, var_87f9074b4e8aa0eb);
        }
    }
    var_37b788b5f5e40bad = vectortoangles(target_pos - self.origin);
    return var_37b788b5f5e40bad;
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xed4
// Size: 0x12d
function private function_f68a56043bfa8c0b(var_12a34cc28b3fbf8c, var_4c1e1071f143a794, ball_velocity, b_do_trace) {
    b_do_trace = function_53c4c53197386572(b_do_trace, 1);
    var_eb6912ce00906af1 = (0, 0, 0);
    if (b_do_trace) {
        trace = ray_trace(self.origin, self.origin + ball_velocity, self);
        /#
            if (function_64e4823b3d753975()) {
                line(self.origin, self.origin + ball_velocity, (1, 1, 0), 0.5);
            }
        #/
        if (trace["fraction"] < 1) {
            var_b3ee17531fb359c = getdvarfloat(@"hash_60864e18cad10506", 100);
            position = trace["position"] + (0, 0, var_b3ee17531fb359c);
            var_eb6912ce00906af1 = (0, 0, ball_velocity[2] * -1);
            /#
                if (function_64e4823b3d753975()) {
                    line(self.origin, position, (1, 0, 0), 1);
                    function_4cf7f726b9cf3d10("<unknown string>", position);
                }
            #/
        }
    }
    return var_eb6912ce00906af1;
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1009
// Size: 0x2f
function function_bda4aa7e471bfbf3() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4982940c42590e46);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x103f
// Size: 0x72
function private function_abea44bf774018a9(state) {
    /#
        switch (state) {
        case 0:
            return "<unknown string>";
            break;
        case 1:
            return "<unknown string>";
            break;
        case 2:
            return "<unknown string>";
            break;
        case 3:
            return "<unknown string>";
            break;
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10b8
// Size: 0xbd
function private function_b088653a7495d62d() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (!function_64e4823b3d753975()) {
                waitframe();
                continue;
            }
            sphere(self.origin, 30, (1, 0, 0));
            if (isdefined(self.var_63295c4748ede4d1)) {
                draw_arrow(self.origin, self.var_63295c4748ede4d1, (1, 0, 0));
            }
            print3d(self.origin + (0, 0, 90), "<unknown string>" + function_abea44bf774018a9(self.state), (1, 0, 0), 0.5, 0.5);
            waitframe();
        }
    #/
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x117c
// Size: 0x18
function private function_64e4823b3d753975() {
    /#
        return getdvarint(@"hash_b9852c62ef771212", 0) > 0;
    #/
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x119b
// Size: 0x1b
function private function_4982940c42590e46() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_b9852c62ef771212");
    #/
}

// Namespace namespace_4e684dc307dd4bdd/namespace_e28136bdc244349a
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x11bd
// Size: 0x5b
function private function_4cf7f726b9cf3d10(text, pos) {
    /#
        if (function_64e4823b3d753975()) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

