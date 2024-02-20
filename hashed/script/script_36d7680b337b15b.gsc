// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\ai.gsc;
#using script_3b78d23dad7ec5be;
#using scripts\asm\asm.gsc;
#using script_bd0d3e8f9ff5c11;
#using script_193e3e231841082f;
#using script_6c63dbe7d4c85e19;
#using script_7edf952f8921aa6b;

#namespace zombie_deathworm;

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x223
// Size: 0x35
function function_2dd162d826667677() {
    self.var_544ffa1d219d6810 = undefined;
    self.var_a60b211ca1cf2a4e = 0;
    self.var_cadb0f258ae78683 = 400;
    thread function_a0d80c109b9ae1a4();
    /#
        function_c321972f4a10279a();
    #/
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x25f
// Size: 0xdb
function function_27b22f19bdfaf6eb(asmname, statename, params) {
    if (isdefined(self.var_6856f1954a5f95cb) && gettime() - self.var_6856f1954a5f95cb < 17000) {
        self function_3e89eb3d8e3f1811("snakebite_fast", 1);
    } else {
        var_de7821bc51ab43a0 = [[ self.var_8f1d8328f7a9091b ]]();
        var_4c7853a34cd074cf = [[ self.var_c54a21ea717fe8a5 ]]();
        var_6b246e279fd1929f = self.health < self.maxhealth * 0.5;
        if (var_de7821bc51ab43a0 >= 4 || var_de7821bc51ab43a0 > 1 && var_4c7853a34cd074cf >= 1 || var_6b246e279fd1929f) {
            self function_3e89eb3d8e3f1811("snakebite_fast", 1);
        } else {
            self function_3e89eb3d8e3f1811("snakebite_fast", 0);
        }
    }
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x341
// Size: 0x37
function function_82000d1cf70c611d(asmname, statename, params) {
    self function_3e89eb3d8e3f1811("in_snake_bite", 0);
    self.var_6856f1954a5f95cb = gettime();
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x37f
// Size: 0x4aa
function private function_ee486eaddde6fd68() {
    self endon("death");
    self endon("snake_bite_end");
    self.var_a60b211ca1cf2a4e = 0;
    self.var_cadb0f258ae78683 = 400;
    self.var_3f4dee1c560fc063 = undefined;
    is_fast = istrue(self function_11e2d4051ea44b35("snakebite_fast"));
    if (is_fast) {
        goto LOC_000000e2;
    }
    var_6388c7254040bb1f = 1;
    var_3d61940eebf6312c = 4000;
    var_4c7853a34cd074cf = [[ self.var_c54a21ea717fe8a5 ]]();
    if (var_4c7853a34cd074cf >= 1 && self.var_f8adf1aaec88d636 >= 7 || var_4c7853a34cd074cf >= 0.8 && self.var_f8adf1aaec88d636 >= 13) {
        var_3d61940eebf6312c = 6000;
    }
    var_20624047a42925e0 = gettime() + var_3d61940eebf6312c / var_6388c7254040bb1f;
    while (gettime() < var_20624047a42925e0) {
        if (isdefined(self.var_544ffa1d219d6810)) {
            if (!function_e82696e7b59178f3(self.var_544ffa1d219d6810.origin)) {
                target_yaw = getyawtospot(self.var_544ffa1d219d6810.origin);
                target_yaw = clamp(target_yaw, -70, 70);
                target_dist = distance2d(self.origin, self.var_544ffa1d219d6810.origin);
                target_dist = clamp(target_dist, 471, 1886);
                self.var_a60b211ca1cf2a4e = target_yaw;
                self.var_cadb0f258ae78683 = target_dist;
                self.var_3f4dee1c560fc063 = self.var_544ffa1d219d6810.origin;
                /#
                    if (function_2113bc484dd870c2()) {
                        sphere(self.var_3f4dee1c560fc063, 20, (1, 0, 0));
                        function_ded744d746e2760b("<unknown string>", self.var_3f4dee1c560fc063);
                    }
                #/
            } else {
                /#
                    function_ded744d746e2760b("<unknown string>", self.var_544ffa1d219d6810.origin);
                #/
            }
        }
        self function_a490fd20800374d8(self.var_a60b211ca1cf2a4e);
        self function_12df4eebdbb4f79(self.var_cadb0f258ae78683);
        /#
            if (function_2113bc484dd870c2()) {
                head_pos = self gettagorigin("<unknown string>");
                line(self.origin, head_pos, (1, 0, 0));
                function_ded744d746e2760b("<unknown string>" + distance2d(self.origin, head_pos), head_pos);
            }
        #/
        waitframe();
    }
    thread function_4408acc265d9aae3();
    /#
        function_ded744d746e2760b("<unknown string>" + self.var_cadb0f258ae78683);
    #/
    if (self.var_cadb0f258ae78683 > 1000) {
        return;
    }
    self endon("snake_bite_about_to_hit");
    while (1) {
        head_pos = self gettagorigin("j_head");
        var_cb520a17509e5da0 = self gettagangles("j_head");
        var_5be86dc5cf50456d = anglestoforward(var_cb520a17509e5da0);
        var_8222a5ee7b1da38d = anglestoup(var_cb520a17509e5da0);
        var_f145d4e348818a77 = getdvarfloat(@"hash_7174d8c71ecb56dc", 450);
        var_c0e04d727bc6589d = getdvarfloat(@"hash_d5be4cd033c8e19c", 150);
        var_da6f0c3db9954161 = create_playerclip_contents();
        trace = ray_trace(head_pos + var_5be86dc5cf50456d * var_f145d4e348818a77 * 0.5 + var_8222a5ee7b1da38d * var_c0e04d727bc6589d, head_pos + var_5be86dc5cf50456d * var_f145d4e348818a77 + var_8222a5ee7b1da38d * var_c0e04d727bc6589d, self, var_da6f0c3db9954161);
        trace2 = ray_trace(head_pos + var_5be86dc5cf50456d * var_f145d4e348818a77 * 0.5 - var_8222a5ee7b1da38d * var_c0e04d727bc6589d, head_pos + var_5be86dc5cf50456d * var_f145d4e348818a77 - var_8222a5ee7b1da38d * var_c0e04d727bc6589d, self, var_da6f0c3db9954161);
        var_321755813f40b563 = ray_trace(head_pos + var_5be86dc5cf50456d * var_f145d4e348818a77 * 0.5 - var_8222a5ee7b1da38d * var_c0e04d727bc6589d, head_pos + var_5be86dc5cf50456d * var_f145d4e348818a77 * 0.5 - var_8222a5ee7b1da38d * var_c0e04d727bc6589d * 2, self, var_da6f0c3db9954161);
        /#
            if (function_2113bc484dd870c2()) {
                draw_trace(trace, (1, 0, 0), 1);
                draw_trace(trace2, (1, 0, 0), 1);
                draw_trace(var_321755813f40b563, (1, 0, 0), 1);
            }
        #/
        if (isdefined(trace) && trace["hittype"] == "hittype_world" || isdefined(trace2) && trace2["hittype"] == "hittype_world" || isdefined(var_321755813f40b563) && var_321755813f40b563["hittype"] == "hittype_world") {
            self notify("snake_bite_hit");
            self asmfireevent(self.asmname, "end");
        }
        waitframe();
    }
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x830
// Size: 0xb1
function private function_a0d80c109b9ae1a4() {
    self endon("death");
    while (1) {
        self waittill("snake_bite_start");
        ent_flag_clear("has_snake_bite_hit");
        thread thread_on_notify("snake_bite_end", &function_2ec0b59b433b1f34, undefined, undefined, self);
        self.var_544ffa1d219d6810 = self.enemy;
        /#
            if (function_2113bc484dd870c2()) {
                if (isdefined(self.var_544ffa1d219d6810)) {
                    line(self.origin, self.var_544ffa1d219d6810.origin, (1, 0, 0));
                }
                function_ded744d746e2760b("<unknown string>");
            }
        #/
        thread function_ee486eaddde6fd68();
        thread function_eef6594341c62496();
    }
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e8
// Size: 0x1a0
function private function_4408acc265d9aae3() {
    self endon("snake_bite_hit");
    self endon("snake_bite_end");
    self endon("death");
    var_a3986c6c03221f24 = 200;
    self.var_165940eda043efa7 = [];
    while (1) {
        if (isdefined(self.var_3f4dee1c560fc063)) {
            players = function_883458a342af3041(self.var_3f4dee1c560fc063, var_a3986c6c03221f24);
            /#
                if (function_2113bc484dd870c2()) {
                    sphere(self.var_3f4dee1c560fc063, var_a3986c6c03221f24, (1, 1, 0));
                    function_ded744d746e2760b("<unknown string>", self.var_3f4dee1c560fc063);
                }
            #/
            foreach (player in players) {
                if (!player ent_flag("in_snake_bite_danger_zone")) {
                    player function_3677f2be30fdd581("deathwormVFX", "snake_bite_danger");
                    thread function_cf9764313ad75400(player);
                    player ent_flag_set("in_snake_bite_danger_zone");
                }
            }
            foreach (var_5b734868f8470ce in self.var_165940eda043efa7) {
                if (!array_contains(players, var_5b734868f8470ce)) {
                    var_5b734868f8470ce function_3677f2be30fdd581("deathwormVFX", "off");
                    var_5b734868f8470ce ent_flag_clear("in_snake_bite_danger_zone");
                }
            }
            self.var_165940eda043efa7 = players;
        }
        waitframe();
    }
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa8f
// Size: 0x70
function private function_cf9764313ad75400(player) {
    self endon("death");
    waittill_any_3("death", "snake_bite_hit", "snake_bite_end");
    currentstate = player getscriptablepartstate("deathwormVFX", 1);
    if (isdefined(currentstate) && currentstate != "swallowed") {
        player function_3677f2be30fdd581("deathwormVFX", "off");
    }
    player ent_flag_clear("in_snake_bite_danger_zone");
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb06
// Size: 0x3d
function private function_2ec0b59b433b1f34() {
    ai::function_3e5ce428974325fb("snake_bite_cooldown", getdvarint(@"hash_5b8c5fcfa978b47", 5000));
    ai::function_3e5ce428974325fb("snake_bite_close_cooldown", getdvarint(@"hash_bf7cde3d3856076a", 2000));
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4a
// Size: 0x318
function function_6c917394118c12ea(var_f238c840934e431e, damage_radius, max_damage) {
    if (!isdefined(damage_radius)) {
        damage_radius = 400;
    }
    if (!isdefined(max_damage)) {
        max_damage = 420;
    }
    head_pos = self gettagorigin("j_head");
    /#
        /#
            assert(isdefined(head_pos));
        #/
    #/
    var_b9f231daf3d07f7d = 60000;
    var_ac4af4d91d50f961 = 50000;
    targets = function_143526130b12b2b6(head_pos, damage_radius);
    foreach (target in targets) {
        var_fbe2fca375ce1bbb = max_damage;
        if (isplayer(target)) {
            function_d26c4202b8c890da(target, head_pos);
        } else if (isai(target)) {
            var_fbe2fca375ce1bbb = 0;
            if (isdefined(target.aicategory) && !istrue(var_f238c840934e431e)) {
                if (target.aicategory == "normal") {
                    var_fbe2fca375ce1bbb = target.health;
                } else if (target.aicategory == "special") {
                    var_fbe2fca375ce1bbb = 100000;
                } else if (target.aicategory == "elite") {
                    var_fbe2fca375ce1bbb = 50000;
                }
            }
        }
        var_d45caa2978502280 = distance2d(head_pos, target.origin);
        var_db488b8a52e21f79 = max((damage_radius - var_d45caa2978502280) / damage_radius, 0);
        var_bb94b44258598dce = math::remap(var_db488b8a52e21f79, 0, 1, 10, var_fbe2fca375ce1bbb);
        if (isalive(target)) {
            if (istrue(var_f238c840934e431e)) {
                if (istrue(self.var_fa1a1806d30a40e1) && self.var_f8adf1aaec88d636 > 1 && target.armorhealth > 0) {
                    target dodamage(var_bb94b44258598dce, head_pos, self, self, "MOD_MELEE");
                }
                swallowed = function_bea202648c100e56(target, head_pos, var_bb94b44258598dce);
                if (!swallowed) {
                    target dodamage(var_bb94b44258598dce, head_pos, self, self, "MOD_MELEE");
                }
            } else if (isai(target)) {
                target function_e96aac065abbec4e(head_pos);
                target dodamage(var_bb94b44258598dce, head_pos, self, self, "MOD_MELEE");
            } else if (isplayer(target)) {
                target dodamage(var_bb94b44258598dce, head_pos, self, self, "MOD_MELEE");
            }
        }
        /#
            function_ded744d746e2760b("<unknown string>" + var_bb94b44258598dce, target.origin + (0, 0, 70));
        #/
    }
    self setscriptablepartstate("audio", "snake_bite_impact");
    earthquake(0.8, 0.4, head_pos, 1000);
    /#
        if (function_2113bc484dd870c2()) {
            iprintlnbold("<unknown string>");
            function_ded744d746e2760b("<unknown string>" + targets.size + "<unknown string>", head_pos);
            sphere(head_pos, damage_radius, (1, 0, 0));
        }
    #/
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe69
// Size: 0x60
function private function_eef6594341c62496() {
    self endon("death");
    self endon("snake_bite_start");
    self waittill("snake_bite_hit");
    ent_flag_set("has_snake_bite_hit");
    damage = 320;
    var_de7821bc51ab43a0 = [[ self.var_8f1d8328f7a9091b ]]();
    if (var_de7821bc51ab43a0 >= 13) {
        damage = 600;
    }
    function_6c917394118c12ea(1, undefined, damage);
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xed0
// Size: 0x38
function private function_d26c4202b8c890da(player, damage_point) {
    player function_2861d9b80e013196(player.origin - damage_point, 1600);
    player playrumbleonentity("heavy_1s");
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf0f
// Size: 0x45
function function_c321972f4a10279a() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_38699ca6e633d4e);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_790ff4ccb7f11b99);
        function_fe953f000498048f();
    #/
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf5b
// Size: 0x46
function private function_38699ca6e633d4e() {
    /#
        var_33a6ac144efb85a6 = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (!isdefined(var_33a6ac144efb85a6)) {
            return;
        }
        var_33a6ac144efb85a6 function_3e89eb3d8e3f1811("<unknown string>", 1);
    #/
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfa8
// Size: 0x18
function private function_2113bc484dd870c2() {
    /#
        return getdvarint(@"hash_4c15f2ff8e7fd1bf", 0) > 0;
    #/
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfc7
// Size: 0x1b
function private function_790ff4ccb7f11b99() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_4c15f2ff8e7fd1bf");
    #/
}

// Namespace zombie_deathworm/namespace_f00b3245968fa941
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xfe9
// Size: 0x5b
function private function_ded744d746e2760b(text, pos) {
    /#
        if (function_2113bc484dd870c2()) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

