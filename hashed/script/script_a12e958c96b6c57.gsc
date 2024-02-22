// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_405d05c89e998922;

#namespace namespace_bef38f3f43af8ebb;

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8
// Size: 0xa1
function function_77162a69f1bd973e(var_6e0fb0c557889b56, var_2411f6b1a46295a6) {
    function_8abb92a7be2335d4(var_6e0fb0c557889b56);
    self.var_57f34b07b40854e8 = [];
    self._blackboard.var_955e413d1be8201a = 1;
    self._blackboard.var_c6d286a55d32d53 = 0;
    self._blackboard.var_931d1d458f955826 = 0;
    self._blackboard.var_7ed3358141280e35 = 0;
    self._blackboard.var_c5cb03878d899c0d = var_2411f6b1a46295a6;
    callback::add("killed_body_cloned", &function_8e6ae0f9fd3a8de2);
}

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180
// Size: 0x22
function function_e8880a314e127af9(var_e3ff174a3bff8b41) {
    self.var_57f34b07b40854e8[self.var_57f34b07b40854e8.size] = var_e3ff174a3bff8b41;
}

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9
// Size: 0x38
function function_3cebd1a2fee6b2c3(value) {
    if (isdefined(self._blackboard.var_955e413d1be8201a)) {
        self._blackboard.var_931d1d458f955826 = value;
    }
}

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e8
// Size: 0x50
function function_abed6225e0fce55c(params) {
    if (isdefined(self._blackboard.var_c6d286a55d32d53) && !self._blackboard.var_c6d286a55d32d53) {
        self._blackboard.var_c6d286a55d32d53 = 1;
    }
}

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23f
// Size: 0x50
function function_4221e1b246248997(params) {
    if (isdefined(self._blackboard.var_c6d286a55d32d53) && istrue(self._blackboard.var_c6d286a55d32d53)) {
        self._blackboard.var_c6d286a55d32d53 = 0;
    }
}

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x296
// Size: 0x63
function private function_8abb92a7be2335d4(var_6e0fb0c557889b56) {
    foreach (var_8e5735736895a5ec in var_6e0fb0c557889b56) {
        self function_c6007f7404057c67(var_8e5735736895a5ec.var_c8b64adafd8e5711);
    }
}

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x300
// Size: 0x1ba
function private function_8e6ae0f9fd3a8de2(params) {
    if (self.var_57f34b07b40854e8.size > 0) {
        var_4649381dc3b0c600 = [];
        foreach (var_e1f6564425e3da6d in self.var_57f34b07b40854e8) {
            var_4649381dc3b0c600[var_4649381dc3b0c600.size] = var_e1f6564425e3da6d;
        }
    }
    alias = tag = var_12f08b5cb2718d76 = params.body waittill("emergence_spawn");
    if (isdefined(var_4649381dc3b0c600)) {
        foreach (var_e1f6564425e3da6d in var_4649381dc3b0c600) {
            [[ var_e1f6564425e3da6d ]](params.body, var_12f08b5cb2718d76);
        }
    }
    aitypes = get_aitype_by_subclass_sharedfunc(var_12f08b5cb2718d76);
    spawnangles = params.body gettagangles(tag);
    zombie = spawnnewaitype_sharedfunc(aitypes[0], params.body.origin, spawnangles, params.body.team);
    zombie thread animscripted_sharedfunc(alias, alias, params.body.origin, spawnangles);
    zombie linkto(params.body, "tag_origin");
    zombie waittill("unlink_spawned_ai");
    zombie unlink();
}

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c1
// Size: 0x31
function function_71fb46ec2e0bf63() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_572d7a042e2d9309, 1);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_bef38f3f43af8ebb/namespace_d30035ccbf6888e3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4f9
// Size: 0x98
function private function_572d7a042e2d9309() {
    /#
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        var_e494de5eb86a0117 = namespace_3c37cb17ade254d::get_array_of_closest(level.players[0].origin, zombies)[0];
        if (!isdefined(var_e494de5eb86a0117) || !isalive(var_e494de5eb86a0117) || isdefined(var_e494de5eb86a0117) && !isdefined(var_e494de5eb86a0117._blackboard.var_955e413d1be8201a)) {
            return;
        }
        var_e494de5eb86a0117 function_3cebd1a2fee6b2c3(!var_e494de5eb86a0117._blackboard.var_931d1d458f955826);
    #/
}

