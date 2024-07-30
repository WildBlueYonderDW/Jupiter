#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_22f1701e151b9d12;
#using script_41387eecc35b88bf;
#using script_7956d56c4922bd1;
#using script_220d0eb95a8fab7d;
#using script_185660037b9236c1;
#using script_5d8202968463a21d;

#namespace namespace_80f1ffea676eeeaa;

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7
// Size: 0x2
function function_d79126b3e1170484() {
    
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1
// Size: 0x97
function function_84b829dec3e573eb(requestid, fncallback, userdata) {
    activityinstance = self;
    assertex(isdefined(activityinstance.var_21f1863c6d44d936[requestid]), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    assertex(isdefined(fncallback) && isfunction(fncallback), "Attempting to register a callback function with an invalid function parameter.");
    activityinstance.var_21f1863c6d44d936[requestid].var_aa1b6c99aa21be47 = fncallback;
    activityinstance.var_21f1863c6d44d936[requestid].var_20159f152c5e8c3c = userdata;
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x450
// Size: 0x97
function function_ce9c21523336cdbc(requestid, fncallback, userdata) {
    activityinstance = self;
    assertex(isdefined(activityinstance.var_21f1863c6d44d936[requestid]), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    assertex(isdefined(fncallback) && isfunction(fncallback), "Attempting to register a callback function with an invalid function parameter.");
    activityinstance.var_21f1863c6d44d936[requestid].spawnedcallback = fncallback;
    activityinstance.var_21f1863c6d44d936[requestid].var_6f3b687769f6051 = userdata;
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ef
// Size: 0x3f
function function_5b9ffa6991e4d730(requestid, fncallback, userdata) {
    assertex(isdefined(fncallback) && isfunction(fncallback), "Attempting to register a callback function with an invalid function parameter.");
    function_11f03fd3165d148f(requestid, fncallback, userdata);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x536
// Size: 0x3f
function function_3c85fe57dbc02e4e(requestid, fncallback, userdata) {
    assertex(isdefined(fncallback) && isfunction(fncallback), "Attempting to register a callback function with an invalid function parameter.");
    function_7a2920be35f4386(requestid, fncallback, userdata);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x57d
// Size: 0x3f
function function_594789f6d7f992eb(requestid, fncallback, userdata) {
    assertex(isdefined(fncallback) && isfunction(fncallback), "Attempting to register a callback function with an invalid function parameter.");
    function_6e43cc397b953a97(requestid, fncallback, userdata);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c4
// Size: 0x3f
function function_c67c7b9e7cbf3821(requestid, fncallback, userdata) {
    assertex(isdefined(fncallback) && isfunction(fncallback), "Attempting to register a callback function with an invalid function parameter.");
    function_bc5315dc37ae4cf(requestid, fncallback, userdata);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b
// Size: 0x3f
function function_c6942df117004b8(requestid, fncallback, userdata) {
    assertex(isdefined(fncallback) && isfunction(fncallback), "Attempting to register a callback function with an invalid function parameter.");
    function_73147cdf5c28d10c(requestid, fncallback, userdata);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x652
// Size: 0x97
function function_cf06967ecf7cfb28(requestid, fncallback, userdata) {
    activityinstance = self;
    assertex(isdefined(activityinstance.var_21f1863c6d44d936[requestid]), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    assertex(isdefined(fncallback) && isfunction(fncallback), "Attempting to register a callback function with an invalid function parameter.");
    activityinstance.var_21f1863c6d44d936[requestid].shutdowncallback = fncallback;
    activityinstance.var_21f1863c6d44d936[requestid].var_8f5f1ba3466b81db = userdata;
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f1
// Size: 0xb0
function function_f8ccadcd850da124(encounterbundlename, origin, radius, enabled, var_139ffb100e4fb6c4, spawntype, cleanuptype) {
    activityinstance = self;
    spawnimmediately = spawntype == 1;
    requestid = spawn_request(encounterbundlename, origin, radius, enabled, spawnimmediately);
    if (!isdefined(requestid)) {
        assertmsg("An AI Director Spawn Request for: " + encounterbundlename + " was unable to be fulfilled. Activity: " + function_de53ed8e35d0ed7a(activityinstance) + " Variant: " + function_a4748b32a824c79c(activityinstance));
        return undefined;
    }
    function_28438f6accf29a65(requestid, var_139ffb100e4fb6c4, spawntype, cleanuptype);
    return requestid;
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7aa
// Size: 0x79
function function_ad14acb938009c6a(requestid, enabled, var_139ffb100e4fb6c4, spawntype, cleanuptype) {
    activityinstance = self;
    if (!isdefined(requestid)) {
        assertmsg("The Passed In AI Director Spawn Request ID was undefined. Activity: " + function_de53ed8e35d0ed7a(activityinstance) + " Variant: " + function_a4748b32a824c79c(activityinstance));
        return;
    }
    function_28438f6accf29a65(requestid, var_139ffb100e4fb6c4, spawntype, cleanuptype);
    if (istrue(enabled)) {
        function_1f72a70dcbbc72cf(requestid);
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b
// Size: 0x12
function function_3e4d79e9a1b31df1(targetname) {
    return function_930897c0d1a7eb24(targetname);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x846
// Size: 0x8d
function function_3ee36bc763779ba1(targetname, enabled, var_139ffb100e4fb6c4, spawntype, cleanuptype) {
    activityinstance = self;
    requestid = activityinstance function_3e4d79e9a1b31df1(targetname);
    if (!isdefined(requestid)) {
        assertmsg("An AI Director Spawn Request with the target name: " + targetname + " was unable to be fulfilled. Activity: " + function_de53ed8e35d0ed7a(activityinstance) + " Variant: " + function_a4748b32a824c79c(activityinstance));
        return undefined;
    }
    activityinstance function_ad14acb938009c6a(requestid, enabled, var_139ffb100e4fb6c4, spawntype, cleanuptype);
    return requestid;
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc
// Size: 0x5d
function function_1f72a70dcbbc72cf(requestid) {
    activityinstance = self;
    if (!isdefined(requestid) || !isdefined(activityinstance.var_21f1863c6d44d936[requestid])) {
        assertmsg("The Passed In AI Director Spawn Request ID was undefined. Activity: " + function_de53ed8e35d0ed7a(activityinstance) + " Variant: " + function_a4748b32a824c79c(activityinstance));
        return;
    }
    function_fc38783a3da0bc71(requestid, 1);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x941
// Size: 0x6a
function function_55caa7ecdad1659c(requestid) {
    activityinstance = self;
    encounterrequest = activityinstance.var_21f1863c6d44d936[requestid];
    assertex(isdefined(encounterrequest), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    assertex(encounterrequest.ReadyToSpawn == 1, "Never recieved a 'ready to spawn' notice from the AI Director. Can't start spawning until we are 'ready to spawn'");
    function_a39e9894083f4513(requestid);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b3
// Size: 0x67
function function_b2d0fc97b77a18ab() {
    activityinstance = self;
    foreach (requestid, encounterrequest in activityinstance.var_21f1863c6d44d936) {
        function_15782481b264647b(activityinstance, requestid, 0);
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa22
// Size: 0x45
function function_a85d041589d03dc1(requestid) {
    activityinstance = self;
    assertex(isdefined(activityinstance.var_21f1863c6d44d936[requestid]), "Encounter request ID: " + requestid + " was not found on this activity instance.");
    function_15782481b264647b(activityinstance, requestid, 0);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6f
// Size: 0x99
function function_f21a2c921f86f5a2(cleanuptype) {
    activityinstance = self;
    foreach (requestid, encounterrequest in activityinstance.var_21f1863c6d44d936) {
        if (encounterrequest.cleanuptype == cleanuptype) {
            var_e63f28f54dc0a813 = encounterrequest.cleanuptype == 2;
            function_15782481b264647b(activityinstance, requestid, var_e63f28f54dc0a813);
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb10
// Size: 0x80
function function_a26e39e03a0d6739() {
    activityinstance = self;
    foreach (requestid, encounterrequest in activityinstance.var_21f1863c6d44d936) {
        var_e63f28f54dc0a813 = encounterrequest.cleanuptype == 2;
        function_15782481b264647b(activityinstance, requestid, var_e63f28f54dc0a813);
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb98
// Size: 0x17
function function_f89c25ec86412327(requestid) {
    return isdefined(self.var_21f1863c6d44d936[requestid]);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb8
// Size: 0x72
function function_c19b2c80e7bdf71c() {
    self endon("activity_ai_spawning_can_resume");
    self endon("instance_destroyed");
    if (function_1b2c7507c804109a(self) && !istrue(self.var_68d121a25cba8aab)) {
        function_b80c72d02fd28d8(0, 0);
        self.var_68d121a25cba8aab = 1;
        var_1451867c268ba62f = function_73354d36b8ec6cb8(self);
        while (var_1451867c268ba62f) {
            wait getdvarfloat(@"hash_b1b13b4fc75d3cd7", 2.5);
            function_b80c72d02fd28d8(0, 0);
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc32
// Size: 0x3d
function function_b4d20e1455c1aa71() {
    self notify("activity_ai_spawning_can_resume");
    if (istrue(self.var_68d121a25cba8aab)) {
        var_98b3854d89c3149e = function_fa23b11703ca0c14(self);
        function_b80c72d02fd28d8(1, var_98b3854d89c3149e);
        self.var_68d121a25cba8aab = 0;
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc77
// Size: 0xb1
function private function_c08376872165ee81(requestid, activityinstance) {
    encounterrequest = activityinstance.var_21f1863c6d44d936[requestid];
    if (isdefined(encounterrequest)) {
        encounterrequest.ReadyToSpawn = 1;
        if (encounterrequest.spawntype == 0) {
            function_2dd0a973cd99e9d(activityinstance, requestid);
        } else if (encounterrequest.spawntype == 1) {
            activityinstance function_55caa7ecdad1659c(requestid);
        }
        if (isdefined(encounterrequest.var_aa1b6c99aa21be47) && isfunction(encounterrequest.var_aa1b6c99aa21be47)) {
            [[ encounterrequest.var_aa1b6c99aa21be47 ]](requestid, encounterrequest.var_20159f152c5e8c3c);
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd30
// Size: 0x9c
function private function_78aff650e83b2c99(requestid, activityinstance, agent, var_6f453eec9b65ecbd) {
    encounterrequest = activityinstance.var_21f1863c6d44d936[requestid];
    if (isdefined(encounterrequest)) {
        if (isdefined(encounterrequest.spawnedcallback) && isfunction(encounterrequest.spawnedcallback)) {
            [[ encounterrequest.spawnedcallback ]](requestid, encounterrequest.var_6f3b687769f6051, agent, var_6f453eec9b65ecbd);
        }
        if (encounterrequest.var_67d592cc829bbba7 && isdefined(agent)) {
            activityinstance function_f0675d4a690011d6(agent);
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdd4
// Size: 0x77
function private function_f350de8253d01a5f(requestid, activityinstance) {
    encounterrequest = activityinstance.var_21f1863c6d44d936[requestid];
    if (isdefined(encounterrequest)) {
        if (isdefined(encounterrequest.shutdowncallback) && isfunction(encounterrequest.shutdowncallback)) {
            [[ encounterrequest.shutdowncallback ]](requestid, encounterrequest.var_8f5f1ba3466b81db);
        }
        function_15782481b264647b(activityinstance, requestid, 0);
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe53
// Size: 0x65
function private function_28438f6accf29a65(requestid, var_139ffb100e4fb6c4, spawntype, cleanuptype) {
    activityinstance = self;
    function_f0cc0f2e6e1d085e(requestid, &function_c08376872165ee81, activityinstance);
    function_3248cab79849207(requestid, &function_f350de8253d01a5f, activityinstance);
    function_e4a67fe4ddca7ed5(requestid, &function_78aff650e83b2c99, activityinstance);
    function_fcd53573cbf1d194(activityinstance, requestid, spawntype, cleanuptype, var_139ffb100e4fb6c4);
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xec0
// Size: 0xf9
function private function_fcd53573cbf1d194(activityinstance, requestid, spawntype, cleanuptype, var_139ffb100e4fb6c4) {
    if (!isdefined(activityinstance.var_21f1863c6d44d936[requestid])) {
        activityinstance.var_21f1863c6d44d936[requestid] = spawnstruct();
        activityinstance.var_21f1863c6d44d936[requestid].spawntype = spawntype;
        activityinstance.var_21f1863c6d44d936[requestid].cleanuptype = cleanuptype;
        activityinstance.var_21f1863c6d44d936[requestid].var_67d592cc829bbba7 = istrue(var_139ffb100e4fb6c4);
        activityinstance.var_21f1863c6d44d936[requestid].ReadyToSpawn = 0;
        if (spawntype == 0) {
            function_dca86aca511288f4(activityinstance, "ActiveState", "Waiting for AI Director spawn approval for encounter: " + requestid);
            activityinstance.var_21f1863c6d44d936[requestid].var_23d95fc81d77d990 = 1;
        }
        return;
    }
    assertmsg("A request ID with the same encounterBundleNamee has already been added to this Activity Instance.");
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfc1
// Size: 0x5a
function private function_15782481b264647b(activityinstance, requestid, var_e63f28f54dc0a813) {
    if (isdefined(activityinstance.var_21f1863c6d44d936[requestid])) {
        function_2dd0a973cd99e9d(activityinstance, requestid);
        if (istrue(var_e63f28f54dc0a813)) {
            function_2169641d6a403864(requestid);
        } else {
            function_9950e6e485bf5261(requestid, 0);
        }
        activityinstance.var_21f1863c6d44d936[requestid] = undefined;
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1023
// Size: 0x77
function private function_2dd0a973cd99e9d(activityinstance, requestid) {
    encounterrequest = activityinstance.var_21f1863c6d44d936[requestid];
    if (isdefined(encounterrequest)) {
        if (encounterrequest.spawntype == 0 && istrue(encounterrequest.var_23d95fc81d77d990)) {
            function_20e36ec9e5802d01(activityinstance, "ActiveState", "AI Director spawn approval for encounter: " + requestid + " was granted");
            encounterrequest.var_23d95fc81d77d990 = 0;
        }
    }
}

// Namespace namespace_80f1ffea676eeeaa / namespace_34bf641998024ddb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10a2
// Size: 0xdb
function private function_b80c72d02fd28d8(removeonly, removedelay) {
    function_3d8d8ad244283e65(#"hash_849107430cbd7871");
    var_26734318504eb4f9 = function_5bbdc39a533d9d57(self, "Ambient_AI_Exclusion_Zone");
    for (var_df85372371c33e6b = 0; var_df85372371c33e6b < var_26734318504eb4f9.size; var_df85372371c33e6b++) {
        var_895cdc0860bbc056 = var_26734318504eb4f9[var_df85372371c33e6b];
        center = function_37c1f31d2434f628(var_895cdc0860bbc056);
        radius = function_2403f7fe5d40cecc(var_895cdc0860bbc056);
        uniquename = string(function_f0f498aed6f8fa5d(self)) + " : " + string(var_df85372371c33e6b);
        function_c7311cb3f768f21e(uniquename + self.type, removedelay);
        if (!removeonly) {
            function_606642b946a01237(uniquename + self.type, center, radius);
        }
    }
    function_7f3923ed3d66f8ad();
}

