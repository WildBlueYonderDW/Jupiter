// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_570f992e202c79b4;
#using scripts\mp\gamelogic.gsc;
#using script_6617e2f2bb62b52b;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_2707474774db34b;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_24f248b33b79e48d;
#using script_347e655acacdace;
#using script_413d0426f154bd91;
#using script_54f6d121e91434f8;
#using script_3ac7886f9e4eceef;

#namespace namespace_a93e7904fe28c5c4;

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc
// Size: 0x44
function function_9c328f2f2bc853e6(var_d3f89f07fe3fa0ab) {
    var_d3f89f07fe3fa0ab.var_57c2b110e4deb587 = function_63555ee8e5fb64fc(8);
    var_d3f89f07fe3fa0ab.var_9060ae63d8f02700 = [];
    var_d3f89f07fe3fa0ab.var_9060ae63d8f02700["TitleSplash"] = "Delay";
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x507
// Size: 0xe7
function function_caf8f45b7e3b78a2(var_e6013eac45290cab) {
    var_ee373e1060f9863f = function_dd58016ab8a9a3e0(var_e6013eac45290cab);
    if (!isdefined(var_ee373e1060f9863f.var_bf8dc9b4e4603f8d)) {
        var_ee373e1060f9863f.var_bf8dc9b4e4603f8d = [];
    }
    var_f565df3793c12460 = function_42a790b5e4c0dd36(var_e6013eac45290cab);
    var_ec5849fb65eb261a = function_c795f9c21a9bc8();
    var_ec5849fb65eb261a = array_add(var_ec5849fb65eb261a, "ActivationName");
    foreach (var_ffc5db804c3eff2c in var_ec5849fb65eb261a) {
        var_8325119ddf1616e0 = var_f565df3793c12460.var_38b0dd2cea06c40b[var_ffc5db804c3eff2c];
        if (isdefined(var_8325119ddf1616e0) && var_8325119ddf1616e0.size > 0) {
            var_ee373e1060f9863f.var_bf8dc9b4e4603f8d[var_ffc5db804c3eff2c] = 1;
        }
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f5
// Size: 0x45
function function_85f01c1d56e32f7c(var_e6013eac45290cab, var_a84449a9bd492279) {
    var_ee373e1060f9863f = function_dd58016ab8a9a3e0(var_e6013eac45290cab);
    if (!isdefined(var_ee373e1060f9863f.var_bf8dc9b4e4603f8d)) {
        return undefined;
    }
    return istrue(var_ee373e1060f9863f.var_bf8dc9b4e4603f8d[var_a84449a9bd492279]);
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x642
// Size: 0x88
function function_6fe8aa8dfb9111eb(var_e6013eac45290cab, var_c8796b66a6b3c07e) {
    var_d389f1191e609479 = function_71667164a3e75714(var_c8796b66a6b3c07e);
    foreach (var_cecb6f8a13d4084d in var_e6013eac45290cab.var_40b691c0a6852f73) {
        if (function_d20c7983c54fc98a(var_cecb6f8a13d4084d, var_d389f1191e609479)) {
            function_8dc0cab5b4dd949b(var_cecb6f8a13d4084d);
        }
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d1
// Size: 0x83
function function_947973be56e0dbb2(playerlist) {
    function_c662924b60a37407("Persistent and Tracker broadcasts reactivated for players.", @"hash_3b38e79d9ffe7e9f", self, playerlist);
    foreach (broadcast in self.var_40b691c0a6852f73) {
        if (function_75002b8400884f8(broadcast)) {
            function_4cd1243025855075(playerlist, broadcast);
        }
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75b
// Size: 0x1d
function function_2e44f2eaf470e806(var_94bda1b3c0ae9bab) {
    function_4cd1243025855075(self.var_6c29f2fdb0054bbe, var_94bda1b3c0ae9bab);
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77f
// Size: 0x1a
function function_3f3bc21a4bec7c33(var_94bda1b3c0ae9bab) {
    /#
        assertmsg("Broadcast to Zone has not been implemented yet despite being called.");
    #/
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a0
// Size: 0x113
function broadcast(var_94bda1b3c0ae9bab, playerlist) {
    function_c662924b60a37407("Broadcast Activated for Activity: " + function_872fb49b377327fe(var_94bda1b3c0ae9bab), @"hash_3b38e79d9ffe7e9f", self, playerlist);
    switch (var_94bda1b3c0ae9bab function_c9dd0ad4f024db96()) {
    case #"hash_f29608411835dbd2":
        function_2e44f2eaf470e806(var_94bda1b3c0ae9bab);
        break;
    case #"hash_fad3c75d039713f1":
        function_790e679b0f2d121e(playerlist[0], var_94bda1b3c0ae9bab);
        break;
    case #"hash_f81f6f6ee4ce49a2":
        centerpoint = namespace_68dc261109a9503f::function_8988a4c89289d7f4(self);
        var_ab5375b03260c7 = function_45575393a3d8e399(var_94bda1b3c0ae9bab);
        function_4cd1243025855075(var_ab5375b03260c7, var_94bda1b3c0ae9bab);
        break;
    case #"hash_81b1b8581bbc387":
        function_3f3bc21a4bec7c33(var_94bda1b3c0ae9bab);
        break;
    case #"hash_edac25dbcb316612":
        function_9bce3b7a2f2ae1e(var_94bda1b3c0ae9bab);
        break;
    case #"hash_129fc9ef498f13cc":
    default:
        function_4cd1243025855075(playerlist, var_94bda1b3c0ae9bab);
        break;
    }
    if (function_32cce566a03b93e9(var_94bda1b3c0ae9bab)) {
        function_bec053dce018ba34(var_94bda1b3c0ae9bab);
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ba
// Size: 0xb6
function function_484f9658b565df53(var_a84449a9bd492279, playerlist) {
    function_c662924b60a37407("Activated all broadcasts with Activation Moment: " + var_a84449a9bd492279, @"hash_3b38e79d9ffe7e9f", self, playerlist);
    if (var_a84449a9bd492279 == "ActivationName") {
        /#
            assertmsg("Can't Broadcast Activation Name broadcasts in bulk. Each one reequires that specific Activation Name to be activated.");
        #/
        return;
    }
    var_4fb0bb8290e39fb3 = function_b4f81cd2bdc5602e(var_a84449a9bd492279);
    foreach (var_94bda1b3c0ae9bab in var_4fb0bb8290e39fb3) {
        if (!isdefined(playerlist)) {
            playerlist = self.var_6c29f2fdb0054bbe;
        }
        broadcast(var_94bda1b3c0ae9bab, playerlist);
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x977
// Size: 0x70
function function_9d4772170bc34a3c(var_d389f1191e609479, playerlist) {
    function_c662924b60a37407("Activated all broadcasts with Unique Name: " + var_d389f1191e609479, @"hash_3b38e79d9ffe7e9f", self, playerlist);
    var_e6013eac45290cab = self;
    var_4fb0bb8290e39fb3 = [];
    var_c1bf8d848d376cf2 = function_709eb291cbeeb02(var_e6013eac45290cab, var_d389f1191e609479);
    if (isdefined(var_c1bf8d848d376cf2)) {
        var_4fb0bb8290e39fb3 = [0:var_c1bf8d848d376cf2];
    }
    function_58c9b87625671005(var_4fb0bb8290e39fb3, var_d389f1191e609479, undefined, 0);
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9ee
// Size: 0x71
function function_bcdc9fefc04fa6a(var_d389f1191e609479, playerlist) {
    function_c662924b60a37407("Hide all broadcasts with Unique Name: " + var_d389f1191e609479, @"hash_3b38e79d9ffe7e9f", self, playerlist);
    var_e6013eac45290cab = self;
    var_4fb0bb8290e39fb3 = [];
    var_c1bf8d848d376cf2 = function_709eb291cbeeb02(var_e6013eac45290cab, var_d389f1191e609479);
    if (isdefined(var_c1bf8d848d376cf2)) {
        var_4fb0bb8290e39fb3 = [0:var_c1bf8d848d376cf2];
    }
    function_58c9b87625671005(var_4fb0bb8290e39fb3, var_d389f1191e609479, undefined, 1);
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa66
// Size: 0x6a
function function_cdd79617f81a46d2(var_d389f1191e609479) {
    function_c662924b60a37407("Removed all broadcasts with Unique Name: " + var_d389f1191e609479 + var_d389f1191e609479, @"hash_3b38e79d9ffe7e9f", self);
    var_e6013eac45290cab = self;
    var_4fb0bb8290e39fb3 = [];
    var_c1bf8d848d376cf2 = function_709eb291cbeeb02(var_e6013eac45290cab, var_d389f1191e609479);
    if (isdefined(var_c1bf8d848d376cf2)) {
        var_4fb0bb8290e39fb3 = [0:var_c1bf8d848d376cf2];
    }
    function_58c9b87625671005(var_4fb0bb8290e39fb3, var_d389f1191e609479, undefined, 2);
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad7
// Size: 0x4a
function function_1281c7fff9456e18(ActivationName, playerlist) {
    function_c662924b60a37407("Activated all broadcasts with Activation Name: " + ActivationName, @"hash_3b38e79d9ffe7e9f", self, playerlist);
    var_4fb0bb8290e39fb3 = function_e38f1d6d5a208fe1(ActivationName);
    function_58c9b87625671005(var_4fb0bb8290e39fb3, ActivationName, playerlist, 0);
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28
// Size: 0x4b
function function_f2a618a7ad2f558d(ActivationName, playerlist) {
    function_c662924b60a37407("Hide all broadcasts with Activation Name: " + ActivationName, @"hash_3b38e79d9ffe7e9f", self, playerlist);
    var_4fb0bb8290e39fb3 = function_e38f1d6d5a208fe1(ActivationName);
    function_58c9b87625671005(var_4fb0bb8290e39fb3, ActivationName, playerlist, 1);
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7a
// Size: 0xb8
function function_8350a7df2508a779(var_ffc5db804c3eff2c) {
    function_c662924b60a37407("Deactivated Active broadcasts with Deactivation Moment: " + var_ffc5db804c3eff2c, @"hash_3b38e79d9ffe7e9f", self);
    if (var_ffc5db804c3eff2c == "ActivationName") {
        /#
            assertmsg("Can't Broadcast Activation Name broadcasts in bulk. Each one reequires that specific Activation Name to be activated.");
        #/
        return;
    }
    foreach (var_94bda1b3c0ae9bab in self.var_40b691c0a6852f73) {
        var_7c0025e4cf44b11a = var_94bda1b3c0ae9bab function_6a312795248d0f1c();
        if (isdefined(var_7c0025e4cf44b11a) && var_7c0025e4cf44b11a == var_ffc5db804c3eff2c) {
            function_13fbc3d3854d009a(var_94bda1b3c0ae9bab);
            function_91f301cdf6b88253(var_94bda1b3c0ae9bab);
        }
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc39
// Size: 0xe0
function function_ca585715158d49fa(var_3097614c7d3cd4d5) {
    function_c662924b60a37407("Deactivated Active Broadcasts with Deactivation name: " + var_3097614c7d3cd4d5, @"hash_3b38e79d9ffe7e9f", self);
    foreach (var_94bda1b3c0ae9bab in self.var_40b691c0a6852f73) {
        var_7c0025e4cf44b11a = var_94bda1b3c0ae9bab function_6a312795248d0f1c();
        name = var_94bda1b3c0ae9bab function_a3b4a80d61094f63();
        var_32b29279371d24a2 = isdefined(var_7c0025e4cf44b11a) && var_7c0025e4cf44b11a == "ActivationName";
        var_3c7b34c332071a5e = isdefined(name) && name == var_3097614c7d3cd4d5;
        if (var_32b29279371d24a2 && var_3c7b34c332071a5e) {
            function_13fbc3d3854d009a(var_94bda1b3c0ae9bab);
            function_91f301cdf6b88253(var_94bda1b3c0ae9bab);
        }
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd20
// Size: 0x79
function function_94050b71cb4ef1ca(playerlist) {
    function_c662924b60a37407("Hide all active persistent and tracker broadcasts.", @"hash_3b38e79d9ffe7e9f", self, playerlist);
    foreach (var_c1bf8d848d376cf2 in self.var_40b691c0a6852f73) {
        function_dacc8aa0d16e4487(playerlist, var_c1bf8d848d376cf2);
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda0
// Size: 0x35
function function_a558693f33df78c7(var_9022a58955ba248a) {
    var_8b0f9e27726d5db2 = undefined;
    if (isdefined(self.var_40b691c0a6852f73[var_9022a58955ba248a])) {
        var_8b0f9e27726d5db2 = self.var_40b691c0a6852f73[var_9022a58955ba248a];
    }
    return var_8b0f9e27726d5db2;
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddd
// Size: 0x41
function function_d7c3ce8df52d35c9(var_97889d347cc37c58) {
    var_d3f89f07fe3fa0ab = function_efe441752cd7303d();
    if (isdefined(var_d3f89f07fe3fa0ab.var_9060ae63d8f02700[var_97889d347cc37c58])) {
        return var_d3f89f07fe3fa0ab.var_9060ae63d8f02700[var_97889d347cc37c58];
    }
    return "None";
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe26
// Size: 0x49
function function_195ff27978a91a68(var_e6013eac45290cab, var_b917dfe737d8414f, var_afb5c037a8f13bd5, var_57bae934aff55b69) {
    var_427e912941ad805f = spawnstruct();
    var_427e912941ad805f function_a1f71337a6844055();
    function_fd7a0d7af53408c9(var_427e912941ad805f, var_e6013eac45290cab, var_b917dfe737d8414f, var_afb5c037a8f13bd5, var_57bae934aff55b69);
    return var_427e912941ad805f;
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe77
// Size: 0xed
function function_fd7a0d7af53408c9(var_d9915f8020fff325, var_e6013eac45290cab, var_b917dfe737d8414f, var_afb5c037a8f13bd5, var_57bae934aff55b69, var_6457b48cd688f2ed) {
    var_b917dfe737d8414f = function_53c4c53197386572(var_b917dfe737d8414f, 1);
    var_afb5c037a8f13bd5 = function_53c4c53197386572(var_afb5c037a8f13bd5, 0);
    var_57bae934aff55b69 = function_53c4c53197386572(var_57bae934aff55b69, 1);
    var_6457b48cd688f2ed = function_53c4c53197386572(var_6457b48cd688f2ed, 1);
    function_45945c0e6cfb54cd(var_d9915f8020fff325, &function_388f018d407adc40, []);
    if (istrue(var_afb5c037a8f13bd5)) {
        function_45945c0e6cfb54cd(var_d9915f8020fff325, &function_d4959a754e2acb72, [0:var_e6013eac45290cab]);
    }
    if (istrue(var_b917dfe737d8414f)) {
        function_45945c0e6cfb54cd(var_d9915f8020fff325, &function_d49dc10646971d24, [0:var_e6013eac45290cab]);
    }
    if (istrue(var_57bae934aff55b69)) {
        function_45945c0e6cfb54cd(var_d9915f8020fff325, &function_3b6f0ac301030549, []);
    }
    if (istrue(var_b917dfe737d8414f)) {
        function_45945c0e6cfb54cd(var_d9915f8020fff325, &function_bc33f8483c604d9b, [0:var_d9915f8020fff325, 1:var_e6013eac45290cab]);
    }
    if (function_71d38726159c3f12(13)) {
        function_f541e4e4edaa8e99(13, [0:var_d9915f8020fff325, 1:var_e6013eac45290cab], 0);
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf6b
// Size: 0xb7
function private function_58c9b87625671005(var_4fb0bb8290e39fb3, ActivationName, playerlist, var_35498449056da93d) {
    if (!isdefined(playerlist)) {
        playerlist = self.var_6c29f2fdb0054bbe;
    }
    foreach (var_c1bf8d848d376cf2 in var_4fb0bb8290e39fb3) {
        if (var_35498449056da93d == 0) {
            broadcast(var_c1bf8d848d376cf2, playerlist);
        } else if (var_35498449056da93d == 1) {
            function_dacc8aa0d16e4487(playerlist, var_c1bf8d848d376cf2);
        } else if (var_35498449056da93d == 2) {
            function_dacc8aa0d16e4487(playerlist, var_c1bf8d848d376cf2);
            function_91f301cdf6b88253(var_c1bf8d848d376cf2);
        }
    }
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1029
// Size: 0x49
function private function_bec053dce018ba34(var_94bda1b3c0ae9bab) {
    function_c662924b60a37407("Persistent broadcast is active and stored in activity instance data." + function_872fb49b377327fe(var_94bda1b3c0ae9bab), @"hash_3b38e79d9ffe7e9f", self);
    uniqueid = var_94bda1b3c0ae9bab function_cf54c2c8650d9688();
    self.var_40b691c0a6852f73[uniqueid] = var_94bda1b3c0ae9bab;
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1079
// Size: 0x47
function private function_91f301cdf6b88253(var_94bda1b3c0ae9bab) {
    function_c662924b60a37407("Persistent broadcast is inactive and removed from activity instance data." + function_872fb49b377327fe(var_94bda1b3c0ae9bab), @"hash_3b38e79d9ffe7e9f", self);
    uniqueid = var_94bda1b3c0ae9bab function_cf54c2c8650d9688();
    self.var_40b691c0a6852f73[uniqueid] = undefined;
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x10c7
// Size: 0x8a
function private function_1bb667dce8ec20d2(ActivationName) {
    var_c9f561285d1c4859 = [];
    foreach (var_cecb6f8a13d4084d in self.var_40b691c0a6852f73) {
        var_f3c55aafff2be133 = var_cecb6f8a13d4084d function_27486f42d37da990();
        if (isdefined(var_f3c55aafff2be133) && var_f3c55aafff2be133 == ActivationName) {
            var_c9f561285d1c4859[var_c9f561285d1c4859.size] = var_cecb6f8a13d4084d;
        }
    }
    return var_c9f561285d1c4859;
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1159
// Size: 0x41
function private function_872fb49b377327fe(var_94bda1b3c0ae9bab) {
    var_b110b538c0af62cd = " broadcast: type: " + var_94bda1b3c0ae9bab function_54ad2295d6995862() + " unique id: " + var_94bda1b3c0ae9bab function_cf54c2c8650d9688() + " destination: " + var_94bda1b3c0ae9bab function_c9dd0ad4f024db96();
    return var_b110b538c0af62cd;
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a2
// Size: 0x14b
function function_ff72cf17a0a5fac() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_7ee522f2b2a96bbc);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_a93e7904fe28c5c4/namespace_277c27ef297ef569
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x12f4
// Size: 0xcf
function private function_7ee522f2b2a96bbc(params) {
    /#
        hostplayer = gethostplayer();
        if (isdefined(hostplayer) && isplayer(hostplayer) && isdefined(hostplayer.var_83abcb9b3a5dbe24.var_6346961d07f668fe)) {
            id = hostplayer.var_83abcb9b3a5dbe24.var_6346961d07f668fe;
            instance = function_1f3e343912ae15c5(id);
            moment = params[0];
            if (moment == "<unknown string>" || moment == "<unknown string>" || moment == "<unknown string>") {
                instance function_484f9658b565df53(moment, [0:hostplayer]);
            } else {
                instance function_484f9658b565df53(moment, instance.var_6c29f2fdb0054bbe);
            }
        }
    #/
}

