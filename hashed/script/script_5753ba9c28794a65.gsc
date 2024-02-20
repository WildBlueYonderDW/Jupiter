// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_22f1701e151b9d12;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_220d0eb95a8fab7d;
#using script_185660037b9236c1;
#using script_5d8202968463a21d;

#namespace namespace_80f1ffea676eeeaa;

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7
// Size: 0x3
function function_d79126b3e1170484() {
    
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1
// Size: 0x98
function function_84b829dec3e573eb(requestid, var_fa2c135047e3da22, userdata) {
    var_e6013eac45290cab = self;
    /#
        assertex(isdefined(var_e6013eac45290cab.var_21f1863c6d44d936[requestid]), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    #/
    /#
        assertex(isdefined(var_fa2c135047e3da22) && isfunction(var_fa2c135047e3da22), "Attempting to register a callback function with an invalid function parameter.");
    #/
    var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_aa1b6c99aa21be47 = var_fa2c135047e3da22;
    var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_20159f152c5e8c3c = userdata;
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x450
// Size: 0x98
function function_ce9c21523336cdbc(requestid, var_fa2c135047e3da22, userdata) {
    var_e6013eac45290cab = self;
    /#
        assertex(isdefined(var_e6013eac45290cab.var_21f1863c6d44d936[requestid]), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    #/
    /#
        assertex(isdefined(var_fa2c135047e3da22) && isfunction(var_fa2c135047e3da22), "Attempting to register a callback function with an invalid function parameter.");
    #/
    var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_a29b7348046ed1ae = var_fa2c135047e3da22;
    var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_6f3b687769f6051 = userdata;
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ef
// Size: 0x40
function function_5b9ffa6991e4d730(requestid, var_fa2c135047e3da22, userdata) {
    /#
        assertex(isdefined(var_fa2c135047e3da22) && isfunction(var_fa2c135047e3da22), "Attempting to register a callback function with an invalid function parameter.");
    #/
    function_11f03fd3165d148f(requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536
// Size: 0x40
function function_3c85fe57dbc02e4e(requestid, var_fa2c135047e3da22, userdata) {
    /#
        assertex(isdefined(var_fa2c135047e3da22) && isfunction(var_fa2c135047e3da22), "Attempting to register a callback function with an invalid function parameter.");
    #/
    function_7a2920be35f4386(requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x57d
// Size: 0x40
function function_594789f6d7f992eb(requestid, var_fa2c135047e3da22, userdata) {
    /#
        assertex(isdefined(var_fa2c135047e3da22) && isfunction(var_fa2c135047e3da22), "Attempting to register a callback function with an invalid function parameter.");
    #/
    function_6e43cc397b953a97(requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c4
// Size: 0x40
function function_c67c7b9e7cbf3821(requestid, var_fa2c135047e3da22, userdata) {
    /#
        assertex(isdefined(var_fa2c135047e3da22) && isfunction(var_fa2c135047e3da22), "Attempting to register a callback function with an invalid function parameter.");
    #/
    function_bc5315dc37ae4cf(requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b
// Size: 0x40
function function_c6942df117004b8(requestid, var_fa2c135047e3da22, userdata) {
    /#
        assertex(isdefined(var_fa2c135047e3da22) && isfunction(var_fa2c135047e3da22), "Attempting to register a callback function with an invalid function parameter.");
    #/
    function_73147cdf5c28d10c(requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x652
// Size: 0x98
function function_cf06967ecf7cfb28(requestid, var_fa2c135047e3da22, userdata) {
    var_e6013eac45290cab = self;
    /#
        assertex(isdefined(var_e6013eac45290cab.var_21f1863c6d44d936[requestid]), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    #/
    /#
        assertex(isdefined(var_fa2c135047e3da22) && isfunction(var_fa2c135047e3da22), "Attempting to register a callback function with an invalid function parameter.");
    #/
    var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_866e3ea37d740690 = var_fa2c135047e3da22;
    var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_8f5f1ba3466b81db = userdata;
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f1
// Size: 0xb1
function function_f8ccadcd850da124(var_52acc86bf2482c55, origin, radius, enabled, var_139ffb100e4fb6c4, spawntype, var_9ff725630851828f) {
    var_e6013eac45290cab = self;
    var_c27e2ce1ddcbbe12 = spawntype == 1;
    requestid = function_54da428ad4a96f2e(var_52acc86bf2482c55, origin, radius, enabled, var_c27e2ce1ddcbbe12);
    if (!isdefined(requestid)) {
        /#
            assertmsg("An AI Director Spawn Request for: " + var_52acc86bf2482c55 + " was unable to be fulfilled. Activity: " + function_de53ed8e35d0ed7a(var_e6013eac45290cab) + " Variant: " + function_a4748b32a824c79c(var_e6013eac45290cab));
        #/
        return undefined;
    }
    function_28438f6accf29a65(requestid, var_139ffb100e4fb6c4, spawntype, var_9ff725630851828f);
    return requestid;
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7aa
// Size: 0x7a
function function_ad14acb938009c6a(requestid, enabled, var_139ffb100e4fb6c4, spawntype, var_9ff725630851828f) {
    var_e6013eac45290cab = self;
    if (!isdefined(requestid)) {
        /#
            assertmsg("The Passed In AI Director Spawn Request ID was undefined. Activity: " + function_de53ed8e35d0ed7a(var_e6013eac45290cab) + " Variant: " + function_a4748b32a824c79c(var_e6013eac45290cab));
        #/
        return;
    }
    function_28438f6accf29a65(requestid, var_139ffb100e4fb6c4, spawntype, var_9ff725630851828f);
    if (istrue(enabled)) {
        function_1f72a70dcbbc72cf(requestid);
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b
// Size: 0x13
function function_3e4d79e9a1b31df1(targetname) {
    return function_930897c0d1a7eb24(targetname);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x846
// Size: 0x8e
function function_3ee36bc763779ba1(targetname, enabled, var_139ffb100e4fb6c4, spawntype, var_9ff725630851828f) {
    var_e6013eac45290cab = self;
    requestid = var_e6013eac45290cab function_3e4d79e9a1b31df1(targetname);
    if (!isdefined(requestid)) {
        /#
            assertmsg("An AI Director Spawn Request with the target name: " + targetname + " was unable to be fulfilled. Activity: " + function_de53ed8e35d0ed7a(var_e6013eac45290cab) + " Variant: " + function_a4748b32a824c79c(var_e6013eac45290cab));
        #/
        return undefined;
    }
    var_e6013eac45290cab function_ad14acb938009c6a(requestid, enabled, var_139ffb100e4fb6c4, spawntype, var_9ff725630851828f);
    return requestid;
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc
// Size: 0x5e
function function_1f72a70dcbbc72cf(requestid) {
    var_e6013eac45290cab = self;
    if (!isdefined(requestid) || !isdefined(var_e6013eac45290cab.var_21f1863c6d44d936[requestid])) {
        /#
            assertmsg("The Passed In AI Director Spawn Request ID was undefined. Activity: " + function_de53ed8e35d0ed7a(var_e6013eac45290cab) + " Variant: " + function_a4748b32a824c79c(var_e6013eac45290cab));
        #/
        return;
    }
    function_fc38783a3da0bc71(requestid, 1);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x941
// Size: 0x6b
function function_55caa7ecdad1659c(requestid) {
    var_e6013eac45290cab = self;
    var_43c9ee7ec9270b3b = var_e6013eac45290cab.var_21f1863c6d44d936[requestid];
    /#
        assertex(isdefined(var_43c9ee7ec9270b3b), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    #/
    /#
        assertex(var_43c9ee7ec9270b3b.ReadyToSpawn == 1, "Never recieved a 'ready to spawn' notice from the AI Director. Can't start spawning until we are 'ready to spawn'");
    #/
    function_a39e9894083f4513(requestid);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b3
// Size: 0x68
function function_b2d0fc97b77a18ab() {
    var_e6013eac45290cab = self;
    foreach (requestid, var_43c9ee7ec9270b3b in var_e6013eac45290cab.var_21f1863c6d44d936) {
        function_15782481b264647b(var_e6013eac45290cab, requestid, 0);
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa22
// Size: 0x46
function function_a85d041589d03dc1(requestid) {
    var_e6013eac45290cab = self;
    /#
        assertex(isdefined(var_e6013eac45290cab.var_21f1863c6d44d936[requestid]), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    #/
    function_15782481b264647b(var_e6013eac45290cab, requestid, 0);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6f
// Size: 0x9a
function function_f21a2c921f86f5a2(var_9ff725630851828f) {
    var_e6013eac45290cab = self;
    foreach (requestid, var_43c9ee7ec9270b3b in var_e6013eac45290cab.var_21f1863c6d44d936) {
        if (var_43c9ee7ec9270b3b.var_9ff725630851828f == var_9ff725630851828f) {
            var_e63f28f54dc0a813 = var_43c9ee7ec9270b3b.var_9ff725630851828f == 2;
            function_15782481b264647b(var_e6013eac45290cab, requestid, var_e63f28f54dc0a813);
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb10
// Size: 0x81
function function_a26e39e03a0d6739() {
    var_e6013eac45290cab = self;
    foreach (requestid, var_43c9ee7ec9270b3b in var_e6013eac45290cab.var_21f1863c6d44d936) {
        var_e63f28f54dc0a813 = var_43c9ee7ec9270b3b.var_9ff725630851828f == 2;
        function_15782481b264647b(var_e6013eac45290cab, requestid, var_e63f28f54dc0a813);
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0x18
function function_f89c25ec86412327(requestid) {
    return isdefined(self.var_21f1863c6d44d936[requestid]);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb8
// Size: 0x73
function function_c19b2c80e7bdf71c() {
    self endon("activity_ai_spawning_can_resume");
    self endon("instance_destroyed");
    if (function_1b2c7507c804109a(self) && !istrue(self.var_68d121a25cba8aab)) {
        function_b80c72d02fd28d8(0, 0);
        self.var_68d121a25cba8aab = 1;
        var_1451867c268ba62f = function_73354d36b8ec6cb8(self);
        while (var_1451867c268ba62f) {
            wait(getdvarfloat(@"hash_b1b13b4fc75d3cd7", 2.5));
            function_b80c72d02fd28d8(0, 0);
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc32
// Size: 0x3e
function function_b4d20e1455c1aa71() {
    self notify("activity_ai_spawning_can_resume");
    if (istrue(self.var_68d121a25cba8aab)) {
        var_98b3854d89c3149e = function_fa23b11703ca0c14(self);
        function_b80c72d02fd28d8(1, var_98b3854d89c3149e);
        self.var_68d121a25cba8aab = 0;
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc77
// Size: 0xb2
function private function_c08376872165ee81(requestid, var_e6013eac45290cab) {
    var_43c9ee7ec9270b3b = var_e6013eac45290cab.var_21f1863c6d44d936[requestid];
    if (isdefined(var_43c9ee7ec9270b3b)) {
        var_43c9ee7ec9270b3b.ReadyToSpawn = 1;
        if (var_43c9ee7ec9270b3b.spawntype == 0) {
            function_2dd0a973cd99e9d(var_e6013eac45290cab, requestid);
        } else if (var_43c9ee7ec9270b3b.spawntype == 1) {
            var_e6013eac45290cab function_55caa7ecdad1659c(requestid);
        }
        if (isdefined(var_43c9ee7ec9270b3b.var_aa1b6c99aa21be47) && isfunction(var_43c9ee7ec9270b3b.var_aa1b6c99aa21be47)) {
            [[ var_43c9ee7ec9270b3b.var_aa1b6c99aa21be47 ]](requestid, var_43c9ee7ec9270b3b.var_20159f152c5e8c3c);
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd30
// Size: 0x9d
function private function_78aff650e83b2c99(requestid, var_e6013eac45290cab, agent, var_6f453eec9b65ecbd) {
    var_43c9ee7ec9270b3b = var_e6013eac45290cab.var_21f1863c6d44d936[requestid];
    if (isdefined(var_43c9ee7ec9270b3b)) {
        if (isdefined(var_43c9ee7ec9270b3b.var_a29b7348046ed1ae) && isfunction(var_43c9ee7ec9270b3b.var_a29b7348046ed1ae)) {
            [[ var_43c9ee7ec9270b3b.var_a29b7348046ed1ae ]](requestid, var_43c9ee7ec9270b3b.var_6f3b687769f6051, agent, var_6f453eec9b65ecbd);
        }
        if (var_43c9ee7ec9270b3b.var_67d592cc829bbba7 && isdefined(agent)) {
            var_e6013eac45290cab function_f0675d4a690011d6(agent);
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd4
// Size: 0x78
function private function_f350de8253d01a5f(requestid, var_e6013eac45290cab) {
    var_43c9ee7ec9270b3b = var_e6013eac45290cab.var_21f1863c6d44d936[requestid];
    if (isdefined(var_43c9ee7ec9270b3b)) {
        if (isdefined(var_43c9ee7ec9270b3b.var_866e3ea37d740690) && isfunction(var_43c9ee7ec9270b3b.var_866e3ea37d740690)) {
            [[ var_43c9ee7ec9270b3b.var_866e3ea37d740690 ]](requestid, var_43c9ee7ec9270b3b.var_8f5f1ba3466b81db);
        }
        function_15782481b264647b(var_e6013eac45290cab, requestid, 0);
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe53
// Size: 0x66
function private function_28438f6accf29a65(requestid, var_139ffb100e4fb6c4, spawntype, var_9ff725630851828f) {
    var_e6013eac45290cab = self;
    function_f0cc0f2e6e1d085e(requestid, &function_c08376872165ee81, var_e6013eac45290cab);
    function_3248cab79849207(requestid, &function_f350de8253d01a5f, var_e6013eac45290cab);
    function_e4a67fe4ddca7ed5(requestid, &function_78aff650e83b2c99, var_e6013eac45290cab);
    function_fcd53573cbf1d194(var_e6013eac45290cab, requestid, spawntype, var_9ff725630851828f, var_139ffb100e4fb6c4);
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xec0
// Size: 0xfa
function private function_fcd53573cbf1d194(var_e6013eac45290cab, requestid, spawntype, var_9ff725630851828f, var_139ffb100e4fb6c4) {
    if (!isdefined(var_e6013eac45290cab.var_21f1863c6d44d936[requestid])) {
        var_e6013eac45290cab.var_21f1863c6d44d936[requestid] = spawnstruct();
        var_e6013eac45290cab.var_21f1863c6d44d936[requestid].spawntype = spawntype;
        var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_9ff725630851828f = var_9ff725630851828f;
        var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_67d592cc829bbba7 = istrue(var_139ffb100e4fb6c4);
        var_e6013eac45290cab.var_21f1863c6d44d936[requestid].ReadyToSpawn = 0;
        if (spawntype == 0) {
            function_dca86aca511288f4(var_e6013eac45290cab, "ActiveState", "Waiting for AI Director spawn approval for encounter: " + requestid);
            var_e6013eac45290cab.var_21f1863c6d44d936[requestid].var_23d95fc81d77d990 = 1;
        }
    } else {
        /#
            assertmsg("A request ID with the same encounterBundleNamee has already been added to this Activity Instance.");
        #/
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfc1
// Size: 0x5b
function private function_15782481b264647b(var_e6013eac45290cab, requestid, var_e63f28f54dc0a813) {
    if (isdefined(var_e6013eac45290cab.var_21f1863c6d44d936[requestid])) {
        function_2dd0a973cd99e9d(var_e6013eac45290cab, requestid);
        if (istrue(var_e63f28f54dc0a813)) {
            function_2169641d6a403864(requestid);
        } else {
            function_9950e6e485bf5261(requestid, 0);
        }
        var_e6013eac45290cab.var_21f1863c6d44d936[requestid] = undefined;
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1023
// Size: 0x78
function private function_2dd0a973cd99e9d(var_e6013eac45290cab, requestid) {
    var_43c9ee7ec9270b3b = var_e6013eac45290cab.var_21f1863c6d44d936[requestid];
    if (isdefined(var_43c9ee7ec9270b3b)) {
        if (var_43c9ee7ec9270b3b.spawntype == 0 && istrue(var_43c9ee7ec9270b3b.var_23d95fc81d77d990)) {
            function_20e36ec9e5802d01(var_e6013eac45290cab, "ActiveState", "AI Director spawn approval for encounter: " + requestid + " was granted");
            var_43c9ee7ec9270b3b.var_23d95fc81d77d990 = 0;
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa/namespace_34bf641998024ddb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10a2
// Size: 0xdc
function private function_b80c72d02fd28d8(var_342324d10a9a58fb, var_faff4b5c0aec95f4) {
    function_3d8d8ad244283e65(#"hash_849107430cbd7871");
    var_26734318504eb4f9 = function_5bbdc39a533d9d57(self, "Ambient_AI_Exclusion_Zone");
    for (var_df85372371c33e6b = 0; var_df85372371c33e6b < var_26734318504eb4f9.size; var_df85372371c33e6b++) {
        var_895cdc0860bbc056 = var_26734318504eb4f9[var_df85372371c33e6b];
        center = function_37c1f31d2434f628(var_895cdc0860bbc056);
        radius = function_2403f7fe5d40cecc(var_895cdc0860bbc056);
        var_d389f1191e609479 = string(function_f0f498aed6f8fa5d(self)) + " : " + string(var_df85372371c33e6b);
        function_c7311cb3f768f21e(var_d389f1191e609479 + self.type, var_faff4b5c0aec95f4);
        if (!var_342324d10a9a58fb) {
            function_606642b946a01237(var_d389f1191e609479 + self.type, center, radius);
        }
    }
    function_7f3923ed3d66f8ad();
}

