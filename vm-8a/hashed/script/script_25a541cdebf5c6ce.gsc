#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\engine\math.gsc;
#using script_7edf952f8921aa6b;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\trace.gsc;
#using script_6853191397ec0259;
#using script_3b78d23dad7ec5be;

#namespace namespace_ae11c87b7bfa2daa;

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf
// Size: 0x30
function function_c84ae25edc875e49() {
    thread function_6310496eb6338aba();
    thread function_983f20ad94e67f44();
    thread function_6c4b72272cd8e500();
    ent_flag_set("can_bull_charge_off_ledge");
    /#
        function_b03f7c7561b40e5d();
    #/
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x307
// Size: 0x38b
function function_e1fbc72dd102b947(asmname, statename, tostatename, params) {
    velocity = self.velocity;
    self.var_c8743e7a7c7ea168 = default_to(self.var_c8743e7a7c7ea168, velocity);
    var_f3292cd494761286 = function_f30eecf314f3f1e0();
    velocity_norm = vectornormalize(velocity);
    trace = navtrace(self.origin, var_f3292cd494761286 + velocity_norm * 30, self, 1);
    trace_hit = isdefined(trace) && trace["fraction"] < 1 && isdefined(trace["normal"]);
    self.var_197f81f41a21780c = trace_hit;
    /#
        line(self.origin, var_f3292cd494761286 + velocity_norm * 30, (1, 0, 0));
    #/
    if (trace_hit) {
        self.var_99cf8787b423d8fe = !ent_flag("can_bull_charge_off_ledge");
        if (!self.var_99cf8787b423d8fe && isdefined(trace["area_usage_flags"])) {
            area_usage_flags = trace["area_usage_flags"];
            if (area_usage_flags & -1) {
                self.var_99cf8787b423d8fe = 1;
            }
        }
        if (!self.var_99cf8787b423d8fe && self.var_e96704a2f0c3a889 == "gravity") {
            self animmode("gravity_off_nav");
            self.var_e96704a2f0c3a889 = "gravity_off_nav";
        }
        var_a2099f6f593803e2 = vectordot(velocity_norm, trace["normal"]);
        /#
            line(trace["<dev string:x1c>"], trace["<dev string:x1c>"] + trace["<dev string:x25>"] * 30, (1, 0, 1));
            bc_print("<dev string:x2c>" + var_a2099f6f593803e2, trace["<dev string:x1c>"]);
        #/
        if (var_a2099f6f593803e2 < -0.5) {
            halfsize = self getboundshalfsize();
            trace_z_offset = min(40, halfsize[2] * 0.66);
            var_a7c6f77b97abedfc = trace["position"] + (0, 0, trace_z_offset);
            velocity_flat = flatten_vector(velocity_norm, (0, 0, 1));
            var_1eb14d1ded87bc5 = var_a7c6f77b97abedfc + velocity_flat * max(80, halfsize[0]);
            var_5b98e545dd4ced6f = physicstrace(var_a7c6f77b97abedfc, var_1eb14d1ded87bc5);
            hit_physics = var_5b98e545dd4ced6f != var_1eb14d1ded87bc5;
            if (hit_physics) {
                /#
                    bc_print("<dev string:x36>");
                    line(var_a7c6f77b97abedfc, var_1eb14d1ded87bc5, (1, 0, 0));
                #/
                function_900321733ad57c11();
                return true;
            } else {
                /#
                    bc_print("<dev string:x47>");
                    line(var_a7c6f77b97abedfc, var_1eb14d1ded87bc5, (0, 1, 0));
                #/
            }
        } else {
            /#
                bc_print("<dev string:x60>");
                sphere(trace["<dev string:x1c>"], 25, ter_op(self.var_99cf8787b423d8fe, (1, 0, 0), (0, 1, 0)));
            #/
        }
    } else if (self.var_e96704a2f0c3a889 == "gravity_off_nav" && (self isonground() && ispointonnavmesh(self.origin) || !ent_flag("can_bull_charge_off_ledge"))) {
        self animmode("gravity");
        self.var_e96704a2f0c3a889 = "gravity";
    }
    return false;
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x69b
// Size: 0x40e
function function_4397b9eb5fee6a23(asmname, statename, tostatename, params) {
    if (!isdefined(self.enemy) || !isalive(self.enemy)) {
        return true;
    }
    position_delta = self.origin - default_to(self.var_b0025b27850a89ad, self.origin);
    var_481af8e3ab10d8f1 = 5;
    speed_sq = lengthsquared(position_delta);
    var_325031e3bd475ad = lengthsquared(self.var_a20667cd8eef2d30);
    var_62b0f3e6017d4cee = !isdefined(self.var_b0025b27850a89ad);
    /#
        bc_print("<dev string:x7d>" + length(position_delta), self.origin + (0, 0, 90));
    #/
    if (speed_sq * squared(5) < var_325031e3bd475ad && var_325031e3bd475ad > squared(var_481af8e3ab10d8f1)) {
        /#
            bc_print("<dev string:x8d>" + length(position_delta), self.origin + (0, 0, 30));
        #/
        return true;
    }
    min_speed = 0.1;
    if (speed_sq < squared(min_speed) && !var_62b0f3e6017d4cee) {
        /#
            bc_print("<dev string:xbb>" + length(position_delta));
        #/
        return true;
    }
    if (vectordot(position_delta, default_to(self.var_a20667cd8eef2d30, (0, 0, 0))) < 0) {
        /#
            bc_print("<dev string:xd1>" + vectordot(position_delta, default_to(self.var_a20667cd8eef2d30, (0, 0, 0))));
        #/
        return true;
    }
    if (istrue(self.var_99cf8787b423d8fe)) {
        self.var_99cf8787b423d8fe = undefined;
        return true;
    }
    self.var_b0025b27850a89ad = self.origin;
    self.var_a20667cd8eef2d30 = position_delta;
    if (istrue(self.var_197f81f41a21780c)) {
        drop_height = self.height * 2;
        var_f3292cd494761286 = function_f30eecf314f3f1e0(0.3);
        var_7f04d54a502de2ef = drop_to_ground(var_f3292cd494761286, self.height, -1 * drop_height);
        if (!isdefined(var_7f04d54a502de2ef)) {
            /#
                bc_print("<dev string:xed>");
            #/
            return true;
        } else if (var_f3292cd494761286[2] - var_7f04d54a502de2ef[2] >= drop_height) {
            /#
                bc_print("<dev string:x114>", var_7f04d54a502de2ef);
            #/
            ground_entity = self getgroundentity();
            if (!isdefined(ground_entity)) {
                /#
                    bc_print("<dev string:x13c>");
                #/
                return false;
            } else {
                if (!math::within_fov_2d(self.origin, self.angles, self.enemy.origin, 0.707)) {
                    /#
                        bc_print("<dev string:x14e>");
                    #/
                    return true;
                }
                /#
                    bc_print("<dev string:x173>");
                #/
            }
        } else {
            var_154288d91ba8cf1a = getclosestpointonnavmesh(var_7f04d54a502de2ef, self);
            if (isdefined(var_154288d91ba8cf1a)) {
                /#
                    bc_print("<dev string:x197>", var_154288d91ba8cf1a);
                #/
            }
            var_3f461949a6df342b = 15;
            if (!isdefined(var_154288d91ba8cf1a) || distance2dsquared(var_154288d91ba8cf1a, var_7f04d54a502de2ef) > squared(var_3f461949a6df342b)) {
                /#
                    bc_print("<dev string:x1ad>");
                #/
                return true;
            }
        }
        /#
            bc_print("<dev string:x1d4>", var_7f04d54a502de2ef);
        #/
    }
    self.var_326016aaef22eaa2 = default_to(self.var_326016aaef22eaa2, 0);
    if (gettime() > self.var_326016aaef22eaa2) {
        interval_check = 3000;
        self.var_326016aaef22eaa2 += interval_check;
        if (!math::is_point_in_front(self.enemy.origin)) {
            /#
                bc_print("<dev string:x1ec>");
            #/
            return true;
        }
    }
    return false;
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab2
// Size: 0x43
function private function_6310496eb6338aba() {
    self endon("death");
    while (true) {
        self waittill("bull_charge_intro_start");
        utility::function_3ab9164ef76940fd("charge_tell", "charge_tell_on");
        self waittill("bull_charge_intro_end");
        utility::function_3ab9164ef76940fd("charge_tell", "charge_tell_off");
    }
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xafd
// Size: 0xcb
function private function_983f20ad94e67f44() {
    self endon("death");
    while (true) {
        self waittill("bull_charge_loop_start");
        self.var_b0025b27850a89ad = undefined;
        self.var_a20667cd8eef2d30 = (0, 0, 0);
        self.var_e96704a2f0c3a889 = "gravity";
        self clearbtgoal(0);
        utility::function_3ab9164ef76940fd("charge_audio", "charge_audio_start");
        utility::function_3ab9164ef76940fd("charge_vfx", "charge_vfx_on");
        thread function_3fbc85b13c2e3772();
        self waittill("bull_charge_loop_end");
        utility::function_3ab9164ef76940fd("charge_audio", "charge_audio_stop");
        utility::function_3ab9164ef76940fd("charge_vfx", "charge_vfx_off");
        self clearpath();
        self clearbtgoal(0);
        self function_e64ea2b4e79c4b74(0);
        self forceupdategoalpos();
        self.var_e96704a2f0c3a889 = undefined;
    }
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbd0
// Size: 0x565
function private function_3fbc85b13c2e3772() {
    self endon("death");
    self endon("bull_charge_loop_end");
    while (true) {
        damage_point = function_f30eecf314f3f1e0() + (0, 0, self.height * 0.5);
        damage_radius = self.zombieaisettings.var_e58a65b7a8f5973c.var_ff6f00af7e3c1d57;
        rumble_radius = self.zombieaisettings.var_e58a65b7a8f5973c.var_309b2924da876f4b;
        /#
            if (function_34e269129d109e9d()) {
                sphere(damage_point, damage_radius, (1, 0, 0));
                sphere(damage_point, rumble_radius, (1, 1, 0));
            }
        #/
        players = function_883458a342af3041(damage_point, rumble_radius);
        if (players.size > 0) {
            foreach (player in players) {
                if (isalive(player) && player.team != self.team && !player ent_flag("abom_bull_charge_hit")) {
                    todamage = damage_point - player.origin;
                    var_d6ed44e5a8551291 = lengthsquared(todamage);
                    var_7895e5c029da0b75 = var_d6ed44e5a8551291 <= squared(damage_radius);
                    if (var_7895e5c029da0b75) {
                        trace_point = player scripts\mp\utility\player::getstancetop("prone");
                        hit_something = scripts\engine\trace::ray_trace_passed(damage_point, trace_point, self);
                        /#
                            if (function_34e269129d109e9d()) {
                                line(damage_point, player.origin, (1, 0, 0));
                            }
                        #/
                        if (hit_something) {
                            /#
                                bc_print("<dev string:x208>", player.origin);
                            #/
                            continue;
                        }
                        player ent_flag_set("abom_bull_charge_hit");
                        player thread ent_flag_clear_delayed("abom_bull_charge_hit", 2);
                        /#
                            if (function_34e269129d109e9d()) {
                                sphere(player.origin, 5, (0, 1, 1));
                                bc_print("<dev string:x219>", player.origin);
                            }
                        #/
                        player knockback_flat(player.origin - damage_point, 1200);
                        player earthquakeforplayer(0.8, 0.8, damage_point, max(damage_radius, 300));
                        player playrumbleonentity("heavy_1s");
                        player thread namespace_1ce798d596a27341::bloodmeleeeffect();
                        player namespace_1ce798d596a27341::_shellshock("bomb_stun_mp", "stun", 2);
                        player_damage = 50;
                        round_number = function_2201d3f3d7ab07a7();
                        var_9ed33f942da168b8 = clamp(math::remap(round_number, 20, 50, 0, 50), 0, 50);
                        player_damage += var_9ed33f942da168b8;
                        player dodamage(player_damage, damage_point, self, self, "MOD_IMPACT");
                        /#
                            bc_print("<dev string:x224>", damage_point);
                        #/
                        continue;
                    }
                    if (!player ent_flag("abom_bull_charge_rumble")) {
                        player ent_flag_set("abom_bull_charge_rumble");
                        player thread ent_flag_clear_delayed("abom_bull_charge_rumble", 2);
                        player playrumbleonentity("light_1s");
                        player earthquakeforplayer(0.4, 0.8, damage_point, max(rumble_radius, 300));
                        /#
                            if (function_34e269129d109e9d()) {
                                line(damage_point, player.origin, (1, 1, 0));
                                sphere(player.origin, 5, (1, 1, 0));
                                bc_print("<dev string:x233>", player.origin);
                            }
                        #/
                    }
                }
            }
        }
        knockdown_radius = damage_radius * 1.5;
        var_7bc0c3236a85a96a = getaiarrayinradius(damage_point, damage_radius);
        foreach (ai in var_7bc0c3236a85a96a) {
            if (!isalive(ai) || ai == self) {
                continue;
            }
            if (ai.type == "zombie") {
                if (!istrue(ai._blackboard.var_3a5dd6684caabe58)) {
                    ai namespace_db1ce2c035564e2c::function_e96aac065abbec4e(damage_point);
                }
                /#
                    if (function_34e269129d109e9d()) {
                        line(damage_point, ai.origin, (1, 0, 0));
                    }
                #/
            }
            if (ai.team != self.team && !ai ent_flag("abom_bull_charge_hit")) {
                ai ent_flag_set("abom_bull_charge_hit");
                ai thread ent_flag_clear_delayed("abom_bull_charge_hit", 2);
                ai_damage = max(ai.maxhealth * 0.1, 100);
                ai dodamage(ai_damage, damage_point);
            }
        }
        waitframe();
    }
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x113d
// Size: 0xb8
function private function_900321733ad57c11() {
    earthquake(0.5, 0.4, self.origin, 700);
    rumble_dist = 700;
    players = function_883458a342af3041(self.origin, rumble_dist);
    foreach (player in players) {
        player playrumbleonentity("artillery_rumble_heavy");
    }
    self function_3e89eb3d8e3f1811("roar_end_time", 4000);
    utility::function_3ab9164ef76940fd("charge_stun", "charge_stun");
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11fd
// Size: 0xcf
function private function_6c4b72272cd8e500() {
    self endon("death");
    rumble_dist = 700;
    while (true) {
        self waittill("start_roar_loop");
        while (istrue(self function_11e2d4051ea44b35("in_roar_loop"))) {
            earthquake(0.4, 1.5, self.origin, rumble_dist);
            players = function_883458a342af3041(self.origin, rumble_dist);
            foreach (player in players) {
                if (!player ent_flag("abom_roar_rumble")) {
                    thread function_2b1518259f8d33b3(player, rumble_dist);
                }
            }
            wait 1;
        }
    }
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12d4
// Size: 0xe5
function private function_2b1518259f8d33b3(player, rumble_dist) {
    player endon("death");
    assert(!player ent_flag("abom_roar_rumble"));
    player ent_flag_set("abom_roar_rumble");
    player playrumblelooponentity("steady_rumble");
    while (true) {
        is_alive = isalive(self);
        is_far = 0;
        var_70193c40e7108bd5 = 0;
        if (is_alive) {
            var_1dce2d1958040081 = distance2dsquared(self.origin, player.origin);
            is_far = var_1dce2d1958040081 > squared(rumble_dist);
            var_70193c40e7108bd5 = !istrue(self function_11e2d4051ea44b35("in_roar_loop"));
        }
        if (!is_alive || var_70193c40e7108bd5 || is_far) {
            player ent_flag_clear("abom_roar_rumble");
            player stoprumble("steady_rumble");
            return;
        }
        waitframe();
    }
}

// Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13c1
// Size: 0x66
function private function_f30eecf314f3f1e0(var_34e47768dd28215e) {
    var_890cdef8169db540 = default_to(var_34e47768dd28215e, 0.2);
    velocity = self.velocity;
    var_98754adfa114552e = (0, 0, velocity[2] / 2);
    var_f3292cd494761286 = self.origin + (velocity - var_98754adfa114552e) * var_890cdef8169db540;
    return var_f3292cd494761286;
}

/#

    // Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1430
    // Size: 0x5a
    function function_b03f7c7561b40e5d() {
        function_6e7290c8ee4f558b("<dev string:x241>");
        function_a9a864379a098ad6("<dev string:x25e>", "<dev string:x270>", &function_754478a869ee8149);
        function_a9a864379a098ad6("<dev string:x282>", "<dev string:x294>", &function_5da1a0b6113cd408);
        function_a9a864379a098ad6("<dev string:x2a6>", "<dev string:x2b1>", &force_roar);
        function_fe953f000498048f();
    }

    // Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1492
    // Size: 0x7e
    function private function_754478a869ee8149() {
        abom = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x2bc>");
        abom = default_to(abom, function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x2c8>"));
        if (!isdefined(abom)) {
            return;
        }
        abom function_3e89eb3d8e3f1811("<dev string:x2d9>", 4000);
        abom function_3e89eb3d8e3f1811("<dev string:x2e7>", 1);
    }

    // Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1518
    // Size: 0x17
    function private function_34e269129d109e9d() {
        return getdvarint(@"hash_9859e6325ac809fc", 0) > 0;
    }

    // Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1537
    // Size: 0x1a
    function private function_5da1a0b6113cd408() {
        function_2fb888667001fc39("<dev string:x2f6>", @"hash_9859e6325ac809fc");
    }

    // Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1559
    // Size: 0x7c
    function private force_roar() {
        abom = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x2bc>");
        if (!isdefined(abom)) {
            abom = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<dev string:x2c8>");
        }
        if (!isdefined(abom)) {
            return;
        }
        abom function_3e89eb3d8e3f1811("<dev string:x2d9>", 4000);
        abom function_3e89eb3d8e3f1811("<dev string:x30d>", 1);
    }

    // Namespace namespace_ae11c87b7bfa2daa / namespace_abc53b2852cb38c6
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x15dd
    // Size: 0x5a
    function private bc_print(text, pos) {
        if (function_34e269129d109e9d()) {
            pos = default_to(pos, self.origin + (0, 0, 70));
            print3d(pos, "<dev string:x315>" + text, (1, 0, 0));
        }
    }

#/
