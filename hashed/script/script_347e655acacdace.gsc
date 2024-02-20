// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_347adb0dcffb8479;

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6
// Size: 0x83
function function_b58813f6489727f2(var_cc3e7fbaface5a17, var_b76b3aee05993635) {
    ProgressTracker = spawnstruct();
    ProgressTracker.var_84ceb983b1ef5f11 = 0;
    ProgressTracker.callbacks = [];
    ProgressTracker.var_cc3e7fbaface5a17 = var_cc3e7fbaface5a17;
    ProgressTracker.var_621cb2c0d9b1cdae = var_cc3e7fbaface5a17;
    ProgressTracker.var_b76b3aee05993635 = var_b76b3aee05993635;
    /#
        if (isdefined(var_b76b3aee05993635) && var_cc3e7fbaface5a17 == var_b76b3aee05993635) {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    return ProgressTracker;
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181
// Size: 0x33
function function_cfeb21bf93c30dae() {
    /#
        assertex(isdefined(self.var_b76b3aee05993635), "Can't have 'remaining progress' for a tracker without a final value");
    #/
    return abs(self.var_b76b3aee05993635 - self.var_621cb2c0d9b1cdae);
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc
// Size: 0x16
function function_5cd1865af5a5edcf(var_d389f1191e609479) {
    self.var_d389f1191e609479 = var_d389f1191e609479;
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d9
// Size: 0x3e
function function_4f3f1f9cedf2d883() {
    /#
        if (!isdefined(self.var_d389f1191e609479) || self.var_d389f1191e609479 == "<unknown string>") {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    return self.var_d389f1191e609479;
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0xc
function iscomplete() {
    return self.var_84ceb983b1ef5f11;
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233
// Size: 0x54
function function_af4d87f338d86a53(var_1fd2df2315da3137, callbackfunction) {
    var_a4857eabc50be3ce = spawnstruct();
    var_a4857eabc50be3ce.var_436a7c95a01e8480 = var_1fd2df2315da3137;
    var_a4857eabc50be3ce.callbackfunction = callbackfunction;
    self.callbacks[self.callbacks.size] = var_a4857eabc50be3ce;
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e
// Size: 0x9e
function function_e619a5f97879fa4a() {
    var_9eb651441b8f9d6f = 0;
    foreach (callback in self.callbacks) {
        if (isdefined(callback)) {
            callback.var_436a7c95a01e8480 [[ callback.callbackfunction ]](self);
        } else {
            var_9eb651441b8f9d6f = 1;
        }
    }
    if (var_9eb651441b8f9d6f) {
        self.callbacks = array_removeundefined(self.callbacks);
    }
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333
// Size: 0x3d
function function_a370b85e4225923c(var_d2194902e87613eb) {
    if (iscomplete()) {
        return;
    }
    if (!isdefined(var_d2194902e87613eb)) {
        var_d2194902e87613eb = 1;
    }
    var_8ccf1248fb22534c = self.var_621cb2c0d9b1cdae + var_d2194902e87613eb;
    function_c664e1d4584b1dcd(var_8ccf1248fb22534c);
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377
// Size: 0x46
function function_1e9e5153831d8c68(var_2289d03a794e6eff) {
    if (iscomplete()) {
        return;
    }
    if (!isdefined(var_2289d03a794e6eff)) {
        var_2289d03a794e6eff = 1;
    }
    var_7b277612b5f42940 = self.var_621cb2c0d9b1cdae - var_2289d03a794e6eff;
    var_7b277612b5f42940 = max(var_7b277612b5f42940, 0);
    function_c664e1d4584b1dcd(var_7b277612b5f42940);
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c4
// Size: 0x41
function function_7681e7890758b69b(var_b0fb203598f9de63) {
    if (var_b0fb203598f9de63 < self.var_621cb2c0d9b1cdae) {
        function_1e9e5153831d8c68(self.var_621cb2c0d9b1cdae - var_b0fb203598f9de63);
    } else {
        function_a370b85e4225923c(var_b0fb203598f9de63 - self.var_621cb2c0d9b1cdae);
    }
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c
// Size: 0x40
function function_ea45d380408d2922(var_32e688c1e2cf28c0) {
    if (iscomplete()) {
        return;
    }
    /#
        assertex(isdefined(var_32e688c1e2cf28c0), "The new final value for the progress tracker is undefined");
    #/
    self.var_b76b3aee05993635 = var_32e688c1e2cf28c0;
    function_c664e1d4584b1dcd(self.var_621cb2c0d9b1cdae);
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x453
// Size: 0x4e
function private function_c664e1d4584b1dcd(var_6f4eb8a505d5c52f) {
    self.var_84ceb983b1ef5f11 = function_c076b6b5c85274d8(var_6f4eb8a505d5c52f);
    if (self.var_84ceb983b1ef5f11) {
        self.var_621cb2c0d9b1cdae = self.var_b76b3aee05993635;
    } else {
        self.var_621cb2c0d9b1cdae = var_6f4eb8a505d5c52f;
    }
    function_e619a5f97879fa4a();
}

// Namespace namespace_347adb0dcffb8479/namespace_96552c234e66ebee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0xdf
function private function_c076b6b5c85274d8(var_6f4eb8a505d5c52f) {
    if (!isdefined(self.var_b76b3aee05993635)) {
        return 0;
    }
    var_47378a790f40bbe2 = self.var_cc3e7fbaface5a17 < self.var_b76b3aee05993635 && var_6f4eb8a505d5c52f >= self.var_b76b3aee05993635;
    var_e1836bac44cbf54a = self.var_cc3e7fbaface5a17 > self.var_b76b3aee05993635 && var_6f4eb8a505d5c52f <= self.var_b76b3aee05993635;
    var_feef1209b8b0a9ea = self.var_cc3e7fbaface5a17 == self.var_b76b3aee05993635 || iscomplete();
    var_d49232a821579d29 = isfloat(var_6f4eb8a505d5c52f) && abs(var_6f4eb8a505d5c52f - self.var_b76b3aee05993635) <= 0.25;
    if (var_47378a790f40bbe2 || var_e1836bac44cbf54a || var_feef1209b8b0a9ea || var_d49232a821579d29) {
        return 1;
    }
    return 0;
}

