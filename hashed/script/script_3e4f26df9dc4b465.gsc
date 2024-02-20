// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_7edf952f8921aa6b;
#using script_4fa22bc28608e9bd;

#namespace namespace_cb396b2f1fa7bd07;

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142
// Size: 0xd
function function_3f12f7bb3b0f7b28() {
    /#
        function_fb0a160d277a9416();
    #/
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0xfc
function function_99484082dc3884de() {
    self.var_239414d8431bbfb6 = 0;
    self.var_52c29781bd641d26 = 0;
    self.var_7f35bbdd17571a22 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_c8bcab8c1ce580a4;
    self.var_16874cb97aa71c9f = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_15ca0d607bd0f65d;
    self.var_146b3cc414242deb = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_6ad8008df08f66a8 * 1000;
    thread function_e8bb01e68081e922();
    self.var_ec9d44662c92bb5c = level.var_ec9d44662c92bb5c;
    var_49b1e63fad5b1b54 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_b0469108aa1c5aa;
    if (isdefined(var_49b1e63fad5b1b54)) {
        self.var_ec9d44662c92bb5c = "actor_" + var_49b1e63fad5b1b54;
    }
    /#
        assert(isdefined(self.var_ec9d44662c92bb5c), "Need to config summon aitype for Disciple");
    #/
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259
// Size: 0x7f
function function_a6f183528ab5941(n_to_spawn) {
    /#
        if (getdvarint(@"hash_6489e49220d549c2", 0)) {
            return 0;
        }
    #/
    if (self.var_239414d8431bbfb6 > gettime()) {
        return 0;
    }
    n_to_spawn = function_53c4c53197386572(n_to_spawn, self.var_7f35bbdd17571a22);
    if (function_c9eebf69d9a55148() < n_to_spawn) {
        return 0;
    }
    if (self.var_52c29781bd641d26 + n_to_spawn > self.var_16874cb97aa71c9f) {
        return 0;
    }
    if (function_9bdbd82cc19b68a8() < n_to_spawn) {
        return 0;
    }
    return 1;
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0
// Size: 0x22
function function_e8bb01e68081e922() {
    self endon("death");
    while (1) {
        self waittill("summon_loop_start");
        thread function_2641b2abaa5b142e();
    }
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x309
// Size: 0x3b
function function_9f02faac5e45e7ca() {
    self endon("death");
    self.var_32a7d2c687b58510 = undefined;
    self.var_32a7d2c687b58510 = function_3bd08a7c5eba1671(self.var_7f35bbdd17571a22, self.origin, 100, 150, 80);
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b
// Size: 0x1a4
function function_2641b2abaa5b142e() {
    level endon("game_ended");
    self endon("death");
    thread function_9f02faac5e45e7ca();
    utility::function_3ab9164ef76940fd("summon", "summon_on");
    var_c2f67c5338fae371 = 0;
    while (1) {
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
        var_397b09064658bb4c = spawnNewAIType_SharedFunc(self.var_ec9d44662c92bb5c, spawn_point, spawn_angles, self.team);
        if (isdefined(var_397b09064658bb4c)) {
            var_397b09064658bb4c thread Animscripted_SharedFunc("spawn", "spawn_end", undefined, undefined, "spawn_animating");
            function_1fca749b9ae92b76(var_397b09064658bb4c);
            self.var_52c29781bd641d26++;
            self.var_32a7d2c687b58510 = array_remove(self.var_32a7d2c687b58510, spawn_point);
            var_c2f67c5338fae371 = gettime() + 2000;
            if (self._blackboard.var_8d19c6ba087e7a86) {
                var_397b09064658bb4c function_ca27630def7b7aad(self);
                var_397b09064658bb4c.var_f33496b914378bbd = 1;
            }
        }
    }
    utility::function_3ab9164ef76940fd("summon", "summon_off");
    self function_3e89eb3d8e3f1811("in_summon", 0);
    self.var_239414d8431bbfb6 = gettime() + self.var_146b3cc414242deb;
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4f6
// Size: 0x5b
function private function_fb0a160d277a9416() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_f04ec4e21d13c912);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_ebfaf249a2c588e5);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_f35637f417aa5b49);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x558
// Size: 0x46
function private function_f04ec4e21d13c912() {
    /#
        disciple = function_30dd4f3ef5f328ea(level.players[0].origin, undefined, undefined, "<unknown string>");
        if (isdefined(disciple)) {
            disciple function_3e89eb3d8e3f1811("<unknown string>", 1);
        }
    #/
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5a5
// Size: 0x1b
function private function_ebfaf249a2c588e5() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_30a05f00a62a2579");
    #/
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5c7
// Size: 0x1b
function private function_f35637f417aa5b49() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_6489e49220d549c2");
    #/
}

// Namespace namespace_cb396b2f1fa7bd07/namespace_955feab79f1d0b47
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x5e9
// Size: 0x64
function private function_44eb214c98b6ecee(text, pos) {
    /#
        if (getdvarint(@"hash_30a05f00a62a2579", 0)) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

