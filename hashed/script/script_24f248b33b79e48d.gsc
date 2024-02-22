// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_54f6d121e91434f8;
#using script_41387eecc35b88bf;
#using script_2707474774db34b;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_6617e2f2bb62b52b;
#using script_3ab210ea917601e7;
#using script_5d8202968463a21d;
#using script_413d0426f154bd91;
#using script_347e655acacdace;

#namespace namespace_6ffa16dea1979f22;

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa10
// Size: 0xdb
function function_572fe6fc04592e85(var_acb3b2a1800aa703) {
    var_a6306814ebb7a58c = var_acb3b2a1800aa703.var_a6306814ebb7a58c;
    var_e690c121ea291e3e = spawnstruct();
    var_e690c121ea291e3e.var_d329713f6ab28a1f = [];
    foreach (broadcast in var_a6306814ebb7a58c.var_76fc63fd0797ef6c) {
        var_97889d347cc37c58 = function_97f68450b5c9ed9f(broadcast);
        if (var_97889d347cc37c58 == "ActivationNameBucket") {
            function_6b83f7908da7ccb7(var_e690c121ea291e3e, broadcast);
        } else {
            var_e690c121ea291e3e.var_d329713f6ab28a1f[var_e690c121ea291e3e.var_d329713f6ab28a1f.size] = broadcast;
        }
    }
    return var_e690c121ea291e3e.var_d329713f6ab28a1f;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf3
// Size: 0x172
function function_70dadbed22105e0c(var_f565df3793c12460, var_ce71fe28918136c6) {
    if (!isarray(var_ce71fe28918136c6) || var_ce71fe28918136c6.size == 0) {
        return;
    }
    for (var_7cfcb49cddb466ea = 0; var_7cfcb49cddb466ea < var_ce71fe28918136c6.size; var_7cfcb49cddb466ea++) {
        var_ec75cb30b9c76451 = var_ce71fe28918136c6[var_7cfcb49cddb466ea];
        var_ec75cb30b9c76451.id = var_f565df3793c12460.var_84827c1e71ea3472;
        var_f565df3793c12460.var_84827c1e71ea3472++;
        var_35e27bed393e774c = function_c24185c47d989c1a(var_ec75cb30b9c76451);
        if (var_35e27bed393e774c == "ActivationName") {
            var_f3c55aafff2be133 = function_41392da51bde3a01(var_ec75cb30b9c76451);
            if (isdefined(var_f3c55aafff2be133)) {
                if (!isdefined(var_f565df3793c12460.var_ce5a4a81ad64ed80[var_f3c55aafff2be133])) {
                    var_f565df3793c12460.var_ce5a4a81ad64ed80[var_f3c55aafff2be133] = [];
                }
                var_c3b7e14420005f1a = var_f565df3793c12460.var_ce5a4a81ad64ed80[var_f3c55aafff2be133].size;
                var_f565df3793c12460.var_ce5a4a81ad64ed80[var_f3c55aafff2be133][var_c3b7e14420005f1a] = var_ec75cb30b9c76451;
                var_f565df3793c12460.var_4e00614961473a63[var_f565df3793c12460.var_4e00614961473a63.size] = var_ec75cb30b9c76451;
            }
        } else {
            if (!isdefined(var_f565df3793c12460.var_38b0dd2cea06c40b[var_35e27bed393e774c])) {
                var_f565df3793c12460.var_38b0dd2cea06c40b[var_35e27bed393e774c] = [];
            }
            var_955c216995050d2b = var_f565df3793c12460.var_38b0dd2cea06c40b[var_35e27bed393e774c].size;
            var_f565df3793c12460.var_38b0dd2cea06c40b[var_35e27bed393e774c][var_955c216995050d2b] = var_ec75cb30b9c76451;
            var_f565df3793c12460.var_4e00614961473a63[var_f565df3793c12460.var_4e00614961473a63.size] = var_ec75cb30b9c76451;
        }
    }
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6c
// Size: 0x48
function function_1e7b6190459c97f5() {
    var_f565df3793c12460 = spawnstruct();
    var_f565df3793c12460.var_38b0dd2cea06c40b = [];
    var_f565df3793c12460.var_ce5a4a81ad64ed80 = [];
    var_f565df3793c12460.var_4e00614961473a63 = [];
    var_f565df3793c12460.var_84827c1e71ea3472 = 0;
    return var_f565df3793c12460;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbc
// Size: 0x17
function function_1c05f7e3290f8e6e(var_ec75cb30b9c76451) {
    return var_ec75cb30b9c76451.id;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdb
// Size: 0x12
function function_16eb9705410e02ab() {
    return function_c24185c47d989c1a(self.var_ec75cb30b9c76451);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf5
// Size: 0xae
function function_c24185c47d989c1a(var_ec75cb30b9c76451) {
    if (isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_a84449a9bd492279) && var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_a84449a9bd492279.size > 0) {
        return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_a84449a9bd492279[0].var_cf0d4d8cc5ac99a4.var_a84449a9bd492279;
    }
    /#
        var_d389f1191e609479 = function_97d99a58c1ec5772(var_ec75cb30b9c76451);
        var_5ae6a11bbc87d784 = function_53c4c53197386572(var_d389f1191e609479, "X_Percentage_Remaining");
        /#
            assertex(isdefined(var_d389f1191e609479), " broadcast ID: ");
        #/
    #/
    return "None";
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdab
// Size: 0x12
function function_6a312795248d0f1c() {
    return function_429075b722e9214d(self.var_ec75cb30b9c76451);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc5
// Size: 0x72
function function_429075b722e9214d(var_ec75cb30b9c76451) {
    if (isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_7c0025e4cf44b11a) && var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_7c0025e4cf44b11a.size > 0) {
        return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_7c0025e4cf44b11a[0].var_cf0d4d8cc5ac99a4.var_a84449a9bd492279;
    }
    return "None";
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3f
// Size: 0x45
function function_97f68450b5c9ed9f(var_ec75cb30b9c76451) {
    /#
        assertex(isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_97889d347cc37c58), "The broadcast's type property is not defined in the Activity Definition asset");
    #/
    return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_97889d347cc37c58;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8c
// Size: 0x12
function function_c9dd0ad4f024db96() {
    return function_f5a44c850aa837e3(self.var_ec75cb30b9c76451);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea6
// Size: 0x92
function function_f5a44c850aa837e3(var_ec75cb30b9c76451) {
    if (isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.destination) && var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.destination.size > 0) {
        return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.destination[0].var_cf0d4d8cc5ac99a4.var_d9aa4b39e0b9ead0;
    }
    /#
        var_5ae6a11bbc87d784 = function_53c4c53197386572(function_97d99a58c1ec5772(var_ec75cb30b9c76451), "X_Percentage_Remaining");
    #/
    return "Instance";
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf40
// Size: 0x12
function function_c0e15a98cb263ae6() {
    return function_1f62a8e43252c6b3(self.var_ec75cb30b9c76451);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5a
// Size: 0xc8
function function_1f62a8e43252c6b3(var_ec75cb30b9c76451) {
    /#
        assertex(isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.priority), "The Broadcast Priority property is not defined in the Activity Definition script bundle asset");
    #/
    var_f4690af2813396a3 = 2;
    switch (var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.priority) {
    case #"hash_4f2a820d1b7462cf":
        var_f4690af2813396a3 = 0;
        break;
    case #"hash_3e26921a2943163d":
        var_f4690af2813396a3 = 1;
        break;
    case #"hash_4d3d7a9f6b7b2fb6":
        var_f4690af2813396a3 = 2;
        break;
    case #"hash_1dd8746c9fb86ec1":
        var_f4690af2813396a3 = 3;
        break;
    case #"hash_ee858280143c22fb":
        var_f4690af2813396a3 = 4;
        break;
    default:
        break;
    }
    return var_f4690af2813396a3;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102a
// Size: 0x22
function function_ecce2ca2c125d18b(var_ec75cb30b9c76451) {
    return istrue(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_67bacee34bc7dbcc);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1054
// Size: 0x86
function function_3c05525e7efc4bc3(var_ec75cb30b9c76451) {
    if (isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_183531a09f83701e) && var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_183531a09f83701e.size > 0) {
        return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_183531a09f83701e[0].var_cf0d4d8cc5ac99a4.var_b5131ed52726b9c1;
    }
    var_97889d347cc37c58 = function_97f68450b5c9ed9f(var_ec75cb30b9c76451);
    return function_d7c3ce8df52d35c9(var_97889d347cc37c58);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e2
// Size: 0xa7
function function_84c3c2bce8659070(var_ec75cb30b9c76451) {
    var_b5131ed52726b9c1 = function_3c05525e7efc4bc3(var_ec75cb30b9c76451);
    /#
        assertex(var_b5131ed52726b9c1 == "Delay", "Asking for the Maximum Delay Time on a Broadcast Conflict Resolution setting that was not set to 'Delay.' ");
    #/
    if (isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_183531a09f83701e) && var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_183531a09f83701e.size > 0) {
        var_15309dae6e19a117 = var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_183531a09f83701e[0].var_cf0d4d8cc5ac99a4.var_ff8234eda7aa8b71;
        if (isdefined(var_15309dae6e19a117)) {
            return var_15309dae6e19a117;
        }
    }
    return 10;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1191
// Size: 0x4b
function function_75002b8400884f8(var_94bda1b3c0ae9bab) {
    var_94bda1b3c0ae9bab = function_53c4c53197386572(var_94bda1b3c0ae9bab, self);
    /#
        assertex(function_9cf7afd6797ae365(var_94bda1b3c0ae9bab), "This function requires a Player Broadcast Instance Struct to be passed in as an argument or used as 'self'. Neither are true in this case.");
    #/
    return istrue(var_94bda1b3c0ae9bab.var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_3994ad54a864b660);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e4
// Size: 0x50
function function_32cce566a03b93e9(var_94bda1b3c0ae9bab) {
    var_94bda1b3c0ae9bab = function_53c4c53197386572(var_94bda1b3c0ae9bab, self);
    /#
        assertex(function_9cf7afd6797ae365(var_94bda1b3c0ae9bab), "This function requires a Player Broadcast Instance Struct to be passed in as an argument or used as 'self'. Neither are true in this case.");
    #/
    var_2f881c28157cc352 = function_d20c7983c54fc98a(var_94bda1b3c0ae9bab);
    if (function_75002b8400884f8(var_94bda1b3c0ae9bab) || var_2f881c28157cc352) {
        return 1;
    }
    return 0;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123c
// Size: 0x118
function function_d20c7983c54fc98a(var_94bda1b3c0ae9bab, var_d389f1191e609479) {
    var_94bda1b3c0ae9bab = function_53c4c53197386572(var_94bda1b3c0ae9bab, self);
    /#
        assertex(function_9cf7afd6797ae365(var_94bda1b3c0ae9bab), "This function requires a Player Broadcast Instance Struct to be passed in as an argument or used as 'self'. Neither are true in this case.");
    #/
    var_96c73fc09d4f5c97 = var_94bda1b3c0ae9bab function_7437a8d48556e45e();
    foreach (var_c8796b66a6b3c07e in var_96c73fc09d4f5c97) {
        var_b082ea0e98192364 = function_f04267a7d3561996(var_c8796b66a6b3c07e);
        if (var_b082ea0e98192364.size > 0) {
            if (isdefined(var_d389f1191e609479)) {
                foreach (var_12b1a5e86193d37f in var_b082ea0e98192364) {
                    if (var_d389f1191e609479 == var_12b1a5e86193d37f.var_cf0d4d8cc5ac99a4.var_d389f1191e609479) {
                        return 1;
                    }
                }
            } else {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x135c
// Size: 0x12
function function_4f3f1f9cedf2d883() {
    return function_97d99a58c1ec5772(self.var_ec75cb30b9c76451);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1376
// Size: 0x3c
function function_97d99a58c1ec5772(var_ec75cb30b9c76451) {
    if (isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_d389f1191e609479)) {
        return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_d389f1191e609479;
    }
    return undefined;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ba
// Size: 0x12
function function_27486f42d37da990() {
    return function_41392da51bde3a01(self.var_ec75cb30b9c76451);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d4
// Size: 0x98
function function_41392da51bde3a01(var_ec75cb30b9c76451) {
    var_a84449a9bd492279 = function_c24185c47d989c1a(var_ec75cb30b9c76451);
    /#
        assertex(var_a84449a9bd492279 == "ActivationName", "Broadcast definitions can't have Activation Names if their Activity Moment is not set to 'ActivationName'");
    #/
    /#
        assertex(isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_a84449a9bd492279[0].var_cf0d4d8cc5ac99a4.activationname), "The broadcast's Activation Name property is not defined in the Activity Definition asset");
    #/
    return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_a84449a9bd492279[0].var_cf0d4d8cc5ac99a4.activationname;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1474
// Size: 0x12
function function_a3b4a80d61094f63() {
    return function_74e4bce48b3a6552(self.var_ec75cb30b9c76451);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148e
// Size: 0x89
function function_74e4bce48b3a6552(var_ec75cb30b9c76451) {
    var_1c7a0ae1a3f274b0 = function_429075b722e9214d(var_ec75cb30b9c76451);
    if (isdefined(var_1c7a0ae1a3f274b0) && var_1c7a0ae1a3f274b0 == "ActivationName") {
        return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_7c0025e4cf44b11a[0].var_cf0d4d8cc5ac99a4.var_3097614c7d3cd4d5;
    } else {
        /#
            var_a27a0ebc43f2eb60 = istrue(isdefined(var_1c7a0ae1a3f274b0) && var_1c7a0ae1a3f274b0 != "<unknown string>");
            /#
                assertex(var_a27a0ebc43f2eb60, "<unknown string>");
            #/
        #/
    }
    return undefined;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151f
// Size: 0xc9
function function_45575393a3d8e399(var_94bda1b3c0ae9bab) {
    /#
        var_d9aa4b39e0b9ead0 = var_94bda1b3c0ae9bab function_c9dd0ad4f024db96();
        if ("<unknown string>" != var_d9aa4b39e0b9ead0) {
            /#
                assertmsg("<unknown string>" + var_94bda1b3c0ae9bab function_cf54c2c8650d9688() + "<unknown string>");
            #/
            return;
        }
    #/
    var_c48f0dda5b074110 = "Broadcast Spatial Zone: " + var_94bda1b3c0ae9bab function_cf54c2c8650d9688();
    if (!namespace_8480efeffcd6e233::function_1888d1b2aeeda25(self, var_c48f0dda5b074110)) {
        var_a845183e758f6b9e = var_94bda1b3c0ae9bab.var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.destination[0].var_cf0d4d8cc5ac99a4.var_2ed778a161ccb2ab[0].var_cf0d4d8cc5ac99a4;
        namespace_c8e2077fca5ac679::function_c3c41d6d385b5b81(self, var_c48f0dda5b074110, var_a845183e758f6b9e);
    }
    return namespace_8480efeffcd6e233::function_7ec62d1550b9897e(self, var_c48f0dda5b074110);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f0
// Size: 0xb1
function function_b4f81cd2bdc5602e(var_a84449a9bd492279) {
    var_20a64c9312332c84 = [];
    var_88234ac4109fc206 = function_85f01c1d56e32f7c(self, var_a84449a9bd492279);
    if (!isdefined(var_88234ac4109fc206) || istrue(var_88234ac4109fc206)) {
        var_f565df3793c12460 = function_42a790b5e4c0dd36(self);
        var_8325119ddf1616e0 = var_f565df3793c12460.var_38b0dd2cea06c40b[var_a84449a9bd492279];
        if (isdefined(var_8325119ddf1616e0)) {
            for (var_4acb1935b73e5153 = 0; var_4acb1935b73e5153 < var_8325119ddf1616e0.size; var_4acb1935b73e5153++) {
                var_ec75cb30b9c76451 = var_8325119ddf1616e0[var_4acb1935b73e5153];
                var_8649a137ff962c24 = function_1c05f7e3290f8e6e(var_ec75cb30b9c76451);
                var_20a64c9312332c84[var_20a64c9312332c84.size] = function_3c4e7239271dbe30(var_ec75cb30b9c76451, var_8649a137ff962c24);
            }
        }
    }
    return var_20a64c9312332c84;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a9
// Size: 0xef
function function_709eb291cbeeb02(var_e6013eac45290cab, var_d389f1191e609479) {
    var_b77f3618b272f4a4 = undefined;
    var_f565df3793c12460 = function_42a790b5e4c0dd36(var_e6013eac45290cab);
    /#
        var_c850801a15ad511b = 0;
    #/
    for (var_4acb1935b73e5153 = 0; var_4acb1935b73e5153 < var_f565df3793c12460.var_4e00614961473a63.size; var_4acb1935b73e5153++) {
        var_ec75cb30b9c76451 = var_f565df3793c12460.var_4e00614961473a63[var_4acb1935b73e5153];
        var_5ae6a11bbc87d784 = function_97d99a58c1ec5772(var_ec75cb30b9c76451);
        if (isdefined(var_5ae6a11bbc87d784) && var_5ae6a11bbc87d784 == var_d389f1191e609479) {
            var_8649a137ff962c24 = function_1c05f7e3290f8e6e(var_ec75cb30b9c76451);
            var_b77f3618b272f4a4 = function_3c4e7239271dbe30(var_ec75cb30b9c76451, var_8649a137ff962c24);
            /#
                var_c850801a15ad511b++;
            #/
        }
    }
    /#
        if (var_c850801a15ad511b == 0) {
            /#
                assertmsg("<unknown string>");
            #/
        } else if (var_c850801a15ad511b > 1) {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    return var_b77f3618b272f4a4;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a0
// Size: 0xba
function function_e38f1d6d5a208fe1(activationname, var_90e824cc8b12a39c) {
    var_aee1297400a66c99 = [];
    var_f565df3793c12460 = function_42a790b5e4c0dd36(self);
    var_76f28f9ed47d04b6 = var_f565df3793c12460.var_ce5a4a81ad64ed80[activationname];
    if (isdefined(var_76f28f9ed47d04b6)) {
        for (var_4acb1935b73e5153 = 0; var_4acb1935b73e5153 < var_76f28f9ed47d04b6.size; var_4acb1935b73e5153++) {
            var_ec75cb30b9c76451 = var_76f28f9ed47d04b6[var_4acb1935b73e5153];
            var_352832458f7b0400 = !isdefined(var_90e824cc8b12a39c) || var_90e824cc8b12a39c == function_97f68450b5c9ed9f(var_ec75cb30b9c76451);
            if (var_352832458f7b0400) {
                var_8649a137ff962c24 = function_1c05f7e3290f8e6e(var_ec75cb30b9c76451);
                var_aee1297400a66c99[var_aee1297400a66c99.size] = function_3c4e7239271dbe30(var_ec75cb30b9c76451, var_8649a137ff962c24);
            }
        }
    }
    return var_aee1297400a66c99;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1862
// Size: 0x62
function function_a577c68231ddca0b(var_ec75cb30b9c76451) {
    /#
        assertex(isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_440272a7c84e0ab8) && isdefined(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_440272a7c84e0ab8.size > 0), "This broadcast has no data set or is setting them in an unexpected way.");
    #/
    return var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_440272a7c84e0ab8;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cc
// Size: 0x17
function function_feb90d1dee0c97d1(var_4ed40899ed266f0f) {
    return var_4ed40899ed266f0f.variant_type;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18eb
// Size: 0x45
function function_2756e9e9dc98a709(var_4ed40899ed266f0f) {
    /#
        assertex(isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.stringreference), "The string reference for this broadcast object is undefined. Check the Script Bundle for more details");
    #/
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.stringreference;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1938
// Size: 0x45
function function_f26baa739c00a3c7(var_4ed40899ed266f0f) {
    /#
        assertex(isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_86da4dbd5eb1fadf), "The splash reference for this broadcast object is undefined. Check the Script Bundle for more details");
    #/
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_86da4dbd5eb1fadf;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1985
// Size: 0x21
function function_dbb11dc6ea65794e(var_4ed40899ed266f0f) {
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_42b1e877ab187c6;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ae
// Size: 0x21
function function_79dc6a4dd519d5cd(var_4ed40899ed266f0f) {
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_dc58ead3e83c99d5;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d7
// Size: 0x21
function function_8cc6c17907ab41bf(var_4ed40899ed266f0f) {
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_80df30d103ee32b7;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a00
// Size: 0x45
function function_84ac089886facee5(var_4ed40899ed266f0f) {
    /#
        assertex(isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_9404a226fab29acd), "The overlord event reference for this broadcast object is undefined. Check the Script Bundle for more details");
    #/
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_9404a226fab29acd;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4d
// Size: 0x22
function function_5be1a4fd3bd9c0a7(var_4ed40899ed266f0f) {
    return istrue(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_26c983ff67cd2a4f);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a77
// Size: 0x22
function function_63b7c6f0e6f2a9f7(var_4ed40899ed266f0f) {
    return istrue(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_a992c85bbf2c3bd6);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa1
// Size: 0x21
function function_ffbb8d6b4076cfa7(var_4ed40899ed266f0f) {
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_c86c03369dc036bf;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aca
// Size: 0x45
function function_61d68ed67d014ce9(var_4ed40899ed266f0f) {
    /#
        assertex(isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_e9d476a3809cb3f1), "The omnvar name for this broadcast object is undefined. Check the Script Bundle for more details");
    #/
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_e9d476a3809cb3f1;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b17
// Size: 0x45
function function_35f7a3c169395432(var_4ed40899ed266f0f) {
    /#
        assertex(isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_26641d000f48954a), "The omnvar type for this broadcast object is undefined. Check the Script Bundle for more details");
    #/
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_26641d000f48954a;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b64
// Size: 0xc2
function function_5a2dda4763cf5dcb(var_4ed40899ed266f0f) {
    if (!isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_5c9ddcf56d36f133)) {
        var_26641d000f48954a = function_35f7a3c169395432(var_4ed40899ed266f0f);
        switch (var_26641d000f48954a) {
        case #"hash_4730906c2f53f03e":
            return 0;
        case #"hash_7e95f72ed09f139d":
            return 0;
        case #"hash_3e4a6f464c850b65":
            return 0;
        case #"hash_2ac140ce3b5ea398":
            return "";
        default:
            /#
                assertmsg("The omnvar value for this broadcast object is undefined and its type " + function_53c4c53197386572(var_26641d000f48954a, "undefined") + " has no code default. Check the Script Bundle for more details.");
            #/
            break;
        }
    }
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_5c9ddcf56d36f133;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c2e
// Size: 0x21
function function_2e71b566ccbca32a(var_4ed40899ed266f0f) {
    return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_cf52064ee3abd32;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c57
// Size: 0x72
function function_4e3ccf5ebd81daea(var_4ed40899ed266f0f) {
    if (isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117) && var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117.size > 0) {
        return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117[0].var_cf0d4d8cc5ac99a4.var_d3eca865f6bf6555;
    }
    return "None";
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd1
// Size: 0x72
function function_b683ad721a792a8e(var_4ed40899ed266f0f) {
    if (isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117) && var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117.size > 0) {
        return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_ac904ebee2e01117[0].var_cf0d4d8cc5ac99a4;
    }
    /#
        assertmsg("No Style Settings Struct was found on this broadcast. Is the 'Style' section filled out in the Script Bundle?");
    #/
    return undefined;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4b
// Size: 0x3c
function function_f04267a7d3561996(var_4ed40899ed266f0f) {
    if (isdefined(var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_445d84d98ace667a)) {
        return var_4ed40899ed266f0f.var_cf0d4d8cc5ac99a4.var_445d84d98ace667a;
    }
    return [];
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8f
// Size: 0xfd
function function_684411bce1d1c8bc(var_94bda1b3c0ae9bab, var_4ed40899ed266f0f, var_19266e4011b5f63d) {
    var_b082ea0e98192364 = function_f04267a7d3561996(var_4ed40899ed266f0f);
    var_839a3b46d36c45b7 = var_b082ea0e98192364[var_19266e4011b5f63d];
    if (isdefined(var_839a3b46d36c45b7)) {
        var_c113183796dfd41 = var_94bda1b3c0ae9bab function_8362248b8fb9637f();
        var_aa30a02555c77ef8 = function_4a145984b790852f(var_839a3b46d36c45b7);
        var_477873cc7f7f96ba = function_add6a5e1e7f656c7(var_839a3b46d36c45b7);
        var_1336db8efd12ba34 = var_c113183796dfd41 namespace_e82a1efb852543c9::function_6a26856f16c6a207(var_aa30a02555c77ef8);
        var_944664ec659ee119 = function_53c4c53197386572(var_839a3b46d36c45b7.var_cf0d4d8cc5ac99a4.format, undefined);
        var_e89c655fba344976 = function_a2ddac402ee3ea8f(var_477873cc7f7f96ba, undefined, var_944664ec659ee119);
        if (var_1336db8efd12ba34) {
            var_e89c655fba344976.value = var_c113183796dfd41 namespace_e82a1efb852543c9::function_e989e3f023f50368(var_aa30a02555c77ef8);
        } else {
            var_e89c655fba344976.value = function_ec28f992a3ffd931(var_839a3b46d36c45b7);
        }
        return var_e89c655fba344976;
    }
    return undefined;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e94
// Size: 0x1d5
function function_298a9e5ee57b3737(var_eaa6c671e0280ef3, var_636518cc7453a55a, currentvalue, endvalue) {
    if (var_eaa6c671e0280ef3 == "X_Complete") {
        return [0:currentvalue];
    } else if (var_eaa6c671e0280ef3 == "X_Remaining") {
        /#
            assertex(isdefined(endvalue), "Trying to format a broadcast which requires two data values but the second data point is undefined.");
        #/
        var_faafa97464a62804 = abs(endvalue - currentvalue);
        return [0:var_faafa97464a62804];
    } else if (var_eaa6c671e0280ef3 == "X_Out_Of_Y") {
        /#
            assertex(isdefined(endvalue), "Trying to format a broadcast which requires two data values but the second data point is undefined.");
        #/
        return [0:currentvalue, 1:endvalue];
    } else if (var_eaa6c671e0280ef3 == "X_Percentage_Complete") {
        /#
            assertex(isdefined(endvalue), "Trying to format a broadcast which requires two data values but the second data point is undefined.");
        #/
        var_6e2c8ae84f3a9fae = abs(endvalue - var_636518cc7453a55a);
        var_e6bcd0fd977eddde = currentvalue / var_6e2c8ae84f3a9fae * 100;
        if (endvalue < var_636518cc7453a55a) {
            numerator = var_6e2c8ae84f3a9fae - currentvalue;
            var_e6bcd0fd977eddde = numerator / var_6e2c8ae84f3a9fae * 100;
        }
        return [0:var_e6bcd0fd977eddde];
    } else if (var_eaa6c671e0280ef3 == "X_Percentage_Remaining") {
        /#
            assertex(isdefined(endvalue), "Trying to format a broadcast which requires two data values but the second data point is undefined.");
        #/
        var_6e2c8ae84f3a9fae = abs(endvalue - var_636518cc7453a55a);
        var_41286ce8e01ff0ff = currentvalue / var_6e2c8ae84f3a9fae * 100;
        if (endvalue > var_636518cc7453a55a) {
            numerator = var_6e2c8ae84f3a9fae - currentvalue;
            var_41286ce8e01ff0ff = numerator / var_6e2c8ae84f3a9fae * 100;
        }
        return [0:var_41286ce8e01ff0ff];
    } else if (var_eaa6c671e0280ef3 == "XX_YY_Clock") {
        minutes = currentvalue / 60;
        var_e938035e8071508d = floor(minutes);
        var_bac0692da6fb6294 = floor((minutes - var_e938035e8071508d) * 60);
        return [0:var_e938035e8071508d, 1:var_bac0692da6fb6294];
    } else {
        /#
            assertmsg("Unknown message format given. Are the constants in activity_player_broadcast_constants.gsh up to date?");
        #/
    }
    return [0:currentvalue];
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2071
// Size: 0x57
function private function_3c4e7239271dbe30(var_ec75cb30b9c76451, var_638eb31354fdfc0d) {
    var_94bda1b3c0ae9bab = function_91be3e69db760bef(var_ec75cb30b9c76451, var_638eb31354fdfc0d);
    /#
        assertex(isdefined(var_94bda1b3c0ae9bab), "Broadcast Instance was not properly converted from its definition.");
    #/
    var_cecb6f8a13d4084d = function_a558693f33df78c7(var_94bda1b3c0ae9bab function_cf54c2c8650d9688());
    if (isdefined(var_cecb6f8a13d4084d)) {
        return var_cecb6f8a13d4084d;
    }
    return var_94bda1b3c0ae9bab;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20d0
// Size: 0xc1
function private function_91be3e69db760bef(var_ec75cb30b9c76451, var_638eb31354fdfc0d) {
    var_e6013eac45290cab = self;
    var_97889d347cc37c58 = function_97f68450b5c9ed9f(var_ec75cb30b9c76451);
    var_94bda1b3c0ae9bab = function_3186d88f9311acf4(var_97889d347cc37c58);
    var_94bda1b3c0ae9bab.groupid = var_e6013eac45290cab.id;
    var_94bda1b3c0ae9bab.uniqueid = var_e6013eac45290cab.id + " broadcast ID: " + var_638eb31354fdfc0d;
    var_94bda1b3c0ae9bab.var_ec75cb30b9c76451 = var_ec75cb30b9c76451;
    var_94bda1b3c0ae9bab function_a2b3a19c012e474b(var_e6013eac45290cab);
    var_94bda1b3c0ae9bab.var_57214832d7aad3b6 = function_af0f8a1d90725bfa(var_ec75cb30b9c76451);
    var_94bda1b3c0ae9bab.var_82be66848b872db4 = function_a577c68231ddca0b(var_ec75cb30b9c76451);
    var_e6013eac45290cab function_8cd36bde2e65efd1(var_94bda1b3c0ae9bab, var_ec75cb30b9c76451);
    return var_94bda1b3c0ae9bab;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2199
// Size: 0xac
function private function_8cd36bde2e65efd1(var_94bda1b3c0ae9bab, var_ec75cb30b9c76451) {
    var_e6013eac45290cab = self;
    var_afb5c037a8f13bd5 = var_94bda1b3c0ae9bab function_c3bc406fe5bf3d79(var_ec75cb30b9c76451);
    var_b917dfe737d8414f = !function_ecce2ca2c125d18b(var_ec75cb30b9c76451);
    var_b5131ed52726b9c1 = function_3c05525e7efc4bc3(var_ec75cb30b9c76451);
    var_57bae934aff55b69 = var_b5131ed52726b9c1 != "None";
    function_fd7a0d7af53408c9(var_94bda1b3c0ae9bab, var_e6013eac45290cab, var_b917dfe737d8414f, var_afb5c037a8f13bd5, var_57bae934aff55b69);
    if (var_b5131ed52726b9c1 != "None") {
        if (var_b5131ed52726b9c1 == "Delay") {
            var_15309dae6e19a117 = function_84c3c2bce8659070(var_ec75cb30b9c76451);
            var_94bda1b3c0ae9bab function_15c75941af255c67(var_15309dae6e19a117);
        }
    }
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x224c
// Size: 0x54
function private function_a2ddac402ee3ea8f(datatype, value, format) {
    var_e89c655fba344976 = spawnstruct();
    var_e89c655fba344976.type = datatype;
    var_e89c655fba344976.value = value;
    var_e89c655fba344976.format = format;
    return var_e89c655fba344976;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22a8
// Size: 0x77
function private function_4a145984b790852f(var_8f2fc031475aef64) {
    /#
        var_c30742abf91f386e = "<unknown string>";
        if (!isdefined(var_8f2fc031475aef64.var_cf0d4d8cc5ac99a4.var_d389f1191e609479) || var_8f2fc031475aef64.var_cf0d4d8cc5ac99a4.var_d389f1191e609479 == var_c30742abf91f386e) {
            /#
                assertmsg("<unknown string>");
            #/
        }
    #/
    return var_8f2fc031475aef64.var_cf0d4d8cc5ac99a4.var_d389f1191e609479;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2327
// Size: 0x21
function private function_add6a5e1e7f656c7(var_cd1bcf4d1329635e) {
    return var_cd1bcf4d1329635e.var_cf0d4d8cc5ac99a4.var_477873cc7f7f96ba;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2350
// Size: 0x66
function private function_ec28f992a3ffd931(var_cd1bcf4d1329635e) {
    var_477873cc7f7f96ba = function_add6a5e1e7f656c7(var_cd1bcf4d1329635e);
    defaultvalue = var_cd1bcf4d1329635e.var_cf0d4d8cc5ac99a4.defaultvalue;
    if (var_477873cc7f7f96ba == "ProgressTracker") {
        return namespace_96552c234e66ebee::function_b58813f6489727f2(defaultvalue.var_a6b66cc5de548567, defaultvalue.var_2d80b9b9b9b8a29f);
    }
    return defaultvalue;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23be
// Size: 0x199
function private function_6b83f7908da7ccb7(var_e690c121ea291e3e, var_d88a4b756f4d46c7) {
    foreach (var_440272a7c84e0ab8 in var_d88a4b756f4d46c7.var_cf0d4d8cc5ac99a4.var_440272a7c84e0ab8) {
        var_420b9a9f4293a416 = function_7e7b315fcb2b9159(var_d88a4b756f4d46c7, 1);
        function_4c3aca27bf7091cb(var_420b9a9f4293a416, var_440272a7c84e0ab8.var_cf0d4d8cc5ac99a4.activationname);
        if (var_440272a7c84e0ab8.variant_type == "Types_ActivityBroadcastData_ActivationName_StringReference") {
            function_fea9146cdc329ceb(var_420b9a9f4293a416, "StringReference");
        } else if (var_440272a7c84e0ab8.variant_type == "Types_ActivityBroadcastData_ActivationName_SplashReference") {
            function_fea9146cdc329ceb(var_420b9a9f4293a416, "TitleSplash");
        } else if (var_440272a7c84e0ab8.variant_type == "Types_ActivityBroadcastData_ActivationName_MusicReference") {
            function_fea9146cdc329ceb(var_420b9a9f4293a416, "Music");
        } else if (var_440272a7c84e0ab8.variant_type == "Types_ActivityBroadcastData_ActivationName_OverlordReference" || var_440272a7c84e0ab8.variant_type == "Types_ActivityBroadcastData_ActivationName_OverlordConversation") {
            function_fea9146cdc329ceb(var_420b9a9f4293a416, "Overlord");
        } else if (var_440272a7c84e0ab8.variant_type == "Types_ActivityBroadcastData_ActivationName_Omnvar") {
            function_fea9146cdc329ceb(var_420b9a9f4293a416, "Omnvar");
        }
        var_420b9a9f4293a416.var_cf0d4d8cc5ac99a4.var_440272a7c84e0ab8 = [0:var_440272a7c84e0ab8];
        var_e690c121ea291e3e.var_d329713f6ab28a1f[var_e690c121ea291e3e.var_d329713f6ab28a1f.size] = var_420b9a9f4293a416;
    }
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x255e
// Size: 0x68
function private function_4c3aca27bf7091cb(var_ec75cb30b9c76451, activationname) {
    var_a84449a9bd492279 = function_c24185c47d989c1a(var_ec75cb30b9c76451);
    /#
        assertex(var_a84449a9bd492279 == "ActivationName", "Broadcast definitions can't have Activation Names if their Activity Moment is not set to 'ActivationName'");
    #/
    var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_a84449a9bd492279[0].var_cf0d4d8cc5ac99a4.activationname = activationname;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25cd
// Size: 0x2b
function private function_fea9146cdc329ceb(var_ec75cb30b9c76451, var_97889d347cc37c58) {
    var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_97889d347cc37c58 = var_97889d347cc37c58;
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25ff
// Size: 0x22
function private function_c3bc406fe5bf3d79(var_ec75cb30b9c76451) {
    return istrue(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_b3c357c514efd6dc);
}

// Namespace namespace_6ffa16dea1979f22/namespace_c47da9d4c2db4f0d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2629
// Size: 0x22
function private function_af0f8a1d90725bfa(var_ec75cb30b9c76451) {
    return istrue(var_ec75cb30b9c76451.var_cf0d4d8cc5ac99a4.var_57214832d7aad3b6);
}

