#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_7edf952f8921aa6b;
#using script_4fa22bc28608e9bd;

#namespace namespace_cb396b2f1fa7bd07;

/#

    // Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
    // Params 0, eflags: 0x2 linked
    // Checksum 0x0, Offset: 0x142
    // Size: 0xc
    function function_3f12f7bb3b0f7b28() {
        function_fb0a160d277a9416();
    }

#/

// Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0xfb
function function_99484082dc3884de() {
    self.summon_cooldown = 0;
    self.var_52c29781bd641d26 = 0;
    self.var_7f35bbdd17571a22 = self.zombieaisettings.var_e58a65b7a8f5973c.var_c8bcab8c1ce580a4;
    self.var_16874cb97aa71c9f = self.zombieaisettings.var_e58a65b7a8f5973c.var_15ca0d607bd0f65d;
    self.var_146b3cc414242deb = self.zombieaisettings.var_e58a65b7a8f5973c.var_6ad8008df08f66a8 * 1000;
    thread function_e8bb01e68081e922();
    self.var_ec9d44662c92bb5c = level.var_ec9d44662c92bb5c;
    var_49b1e63fad5b1b54 = self.zombieaisettings.var_e58a65b7a8f5973c.var_b0469108aa1c5aa;
    if (isdefined(var_49b1e63fad5b1b54)) {
        self.var_ec9d44662c92bb5c = "actor_" + var_49b1e63fad5b1b54;
    }
    assert(isdefined(self.var_ec9d44662c92bb5c), "Need to config summon aitype for Disciple");
}

// Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259
// Size: 0x7e
function function_a6f183528ab5941(n_to_spawn) {
    /#
        if (getdvarint(@"hash_6489e49220d549c2", 0)) {
            return false;
        }
    #/
    if (self.summon_cooldown > gettime()) {
        return false;
    }
    n_to_spawn = default_to(n_to_spawn, self.var_7f35bbdd17571a22);
    if (function_c9eebf69d9a55148() < n_to_spawn) {
        return false;
    }
    if (self.var_52c29781bd641d26 + n_to_spawn > self.var_16874cb97aa71c9f) {
        return false;
    }
    if (function_9bdbd82cc19b68a8() < n_to_spawn) {
        return false;
    }
    return true;
}

// Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0
// Size: 0x21
function function_e8bb01e68081e922() {
    self endon("death");
    while (true) {
        self waittill("summon_loop_start");
        thread function_2641b2abaa5b142e();
    }
}

// Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309
// Size: 0x3a
function function_9f02faac5e45e7ca() {
    self endon("death");
    self.var_32a7d2c687b58510 = undefined;
    self.var_32a7d2c687b58510 = function_3bd08a7c5eba1671(self.var_7f35bbdd17571a22, self.origin, 100, 150, 80);
}

// Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b
// Size: 0x1a3
function function_2641b2abaa5b142e() {
    level endon("game_ended");
    self endon("death");
    thread function_9f02faac5e45e7ca();
    utility::function_3ab9164ef76940fd("summon", "summon_on");
    var_c2f67c5338fae371 = 0;
    while (true) {
        waitframe();
        if (!isarray(self.var_32a7d2c687b58510)) {
            continue;
        }
        if (var_c2f67c5338fae371 > gettime()) {
            continue;
        }
        if (self.var_32a7d2c687b58510.size == 0) {
            break;
        }
        if (function_c9eebf69d9a55148() == 0) {
            break;
        }
        if (!istrue(self function_11e2d4051ea44b35("in_summon"))) {
            break;
        }
        spawn_point = array_get_first_item(self.var_32a7d2c687b58510);
        spawn_angles = vectortoangles(self.origin - spawn_point);
        new_zombie = spawnnewaitype_sharedfunc(self.var_ec9d44662c92bb5c, spawn_point, spawn_angles, self.team);
        if (isdefined(new_zombie)) {
            new_zombie thread Animscripted_SharedFunc("spawn", "spawn_end", undefined, undefined, "spawn_animating");
            function_1fca749b9ae92b76(new_zombie);
            self.var_52c29781bd641d26++;
            self.var_32a7d2c687b58510 = array_remove(self.var_32a7d2c687b58510, spawn_point);
            var_c2f67c5338fae371 = gettime() + 2000;
            if (self._blackboard.var_8d19c6ba087e7a86) {
                new_zombie function_ca27630def7b7aad(self);
                new_zombie.var_f33496b914378bbd = 1;
            }
        }
    }
    utility::function_3ab9164ef76940fd("summon", "summon_off");
    self function_3e89eb3d8e3f1811("in_summon", 0);
    self.summon_cooldown = gettime() + self.var_146b3cc414242deb;
}

/#

    // Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4f6
    // Size: 0x5a
    function private function_fb0a160d277a9416() {
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_a9a864379a098ad6("<dev string:x36>", "<dev string:x43>", &force_summon);
        function_a9a864379a098ad6("<dev string:x50>", "<dev string:x5d>", &function_ebfaf249a2c588e5);
        function_a9a864379a098ad6("<dev string:x6a>", "<dev string:x80>", &function_f35637f417aa5b49);
        function_fe953f000498048f();
    }

    // Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x558
    // Size: 0x45
    function private force_summon() {
        disciple = function_30dd4f3ef5f328ea(level.players[0].origin, undefined, undefined, "<dev string:x97>");
        if (isdefined(disciple)) {
            disciple function_3e89eb3d8e3f1811("<dev string:xa7>", 1);
        }
    }

    // Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x5a5
    // Size: 0x1a
    function private function_ebfaf249a2c588e5() {
        function_2fb888667001fc39("<dev string:xb1>", @"hash_30a05f00a62a2579");
    }

    // Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x5c7
    // Size: 0x1a
    function private function_f35637f417aa5b49() {
        function_2fb888667001fc39("<dev string:xc7>", @"hash_6489e49220d549c2");
    }

    // Namespace namespace_cb396b2f1fa7bd07 / namespace_955feab79f1d0b47
    // Params 2, eflags: 0x4
    // Checksum 0x0, Offset: 0x5e9
    // Size: 0x63
    function private function_44eb214c98b6ecee(text, pos) {
        if (getdvarint(@"hash_30a05f00a62a2579", 0)) {
            pos = default_to(pos, self.origin + (0, 0, 70));
            print3d(pos, "<dev string:xde>" + text, (1, 0, 0));
        }
    }

#/
