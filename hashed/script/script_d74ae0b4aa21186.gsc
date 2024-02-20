// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4a941421347ff7df;

#namespace Mind;

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c5
// Size: 0x93
function function_232b4a5109df340(var_f9320d3953360ca2) {
    if (isdefined(level.Mind)) {
        return;
    }
    level.Mind = spawnstruct();
    level.Mind.callbacks = spawnstruct();
    level.Mind.callbacks.var_b7d58173e645ec4f = var_f9320d3953360ca2;
    level.Mind.events = spawnstruct();
    level.Mind.var_577f45571c039a54 = namespace_823e1abd5161abb1::function_6930ba7fa0669dba();
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f
// Size: 0x39
function initialize() {
    /#
        assert(isdefined(level.Mind));
    #/
    self.Mind = spawnstruct();
    function_fc6ca7aac4a988f5();
    function_e1aad2d0b9d1a56f();
    function_505d8b7080733a24();
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49f
// Size: 0x8e
function function_555c24cbde8f72c6() {
    foreach (decision in self.Mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        decision.var_6b8af58a3f65c8f2 = 0;
    }
    self.Mind.var_c38fcea73953365e.var_dd12ce0e7469509b = undefined;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x534
// Size: 0x8f
function update() {
    var_7bce355a36ef81aa = getsystemtimeinmicroseconds();
    if (function_edd1c69fa427f0e5()) {
        function_5bb78fd119f84548();
        function_6935ab68e207ab2b();
        function_bf27f58f5ee818da();
    }
    var_4ab6986de5328dff = getsystemtimeinmicroseconds();
    if (var_4ab6986de5328dff < var_7bce355a36ef81aa) {
        var_6cd5d0bf9202d9c6 = 2147483647 - var_7bce355a36ef81aa + 1 + var_4ab6986de5328dff;
    } else {
        var_6cd5d0bf9202d9c6 = var_4ab6986de5328dff - var_7bce355a36ef81aa;
    }
    var_d7db37e99c4cbd7a = 0.1 - var_6cd5d0bf9202d9c6 * 1e-06;
    if (var_d7db37e99c4cbd7a > 0) {
        wait(var_d7db37e99c4cbd7a);
    } else {
        wait(0.001);
    }
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ca
// Size: 0x115
function function_edd1c69fa427f0e5() {
    needupdate = 0;
    foreach (decision in self.Mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        decision.var_10f0b5c52ece08ce = 0;
        if (!decision.enabled) {
            continue;
        }
        decision.var_6b8af58a3f65c8f2 = decision.var_6b8af58a3f65c8f2 - 100;
        if (decision.var_6b8af58a3f65c8f2 <= 0) {
            decision.var_6b8af58a3f65c8f2 = decision.var_6b8af58a3f65c8f2 + decision.var_ed2441bc0e552f8d;
            if (decision.var_6b8af58a3f65c8f2 == 0) {
                decision.var_6b8af58a3f65c8f2 = decision.var_ed2441bc0e552f8d;
            }
            decision.var_10f0b5c52ece08ce = 1;
            needupdate = 1;
        }
    }
    return needupdate;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e7
// Size: 0x42
function function_fc6ca7aac4a988f5() {
    self.Mind.var_3c91684198954c83 = spawnstruct();
    self.Mind.var_3c91684198954c83.events = [];
    namespace_823e1abd5161abb1::function_86e16eda99117478();
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x730
// Size: 0x21
function function_c74368899713e7e6() {
    event = spawnstruct();
    event.var_d0942e9d2044d6c6 = 0;
    return event;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x759
// Size: 0x71
function function_5bb78fd119f84548() {
    foreach (event in self.Mind.var_3c91684198954c83.events) {
        event.var_d0942e9d2044d6c6 = 0;
    }
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d1
// Size: 0x138
function function_e1aad2d0b9d1a56f() {
    var_f0a8822dcc782c9d = spawnstruct();
    var_f0a8822dcc782c9d.var_577f45571c039a54 = [];
    /#
        var_f0a8822dcc782c9d.debuginfo = "<unknown string>";
    #/
    var_ff4950d12e0c1a32 = level.Mind.var_577f45571c039a54;
    var_141f7edd65e37a2d = namespace_823e1abd5161abb1::function_bfa5c0c232ced7eb();
    foreach (var_b4927f0893f5f26c in var_141f7edd65e37a2d) {
        desc = var_ff4950d12e0c1a32[var_b4927f0893f5f26c];
        /#
            assertex(isdefined(desc), "Invalid decision name: " + var_b4927f0893f5f26c);
        #/
        var_87f71c8ba2104b76 = desc.var_87f71c8ba2104b76;
        /#
            assertex(isdefined(var_87f71c8ba2104b76), "Not found 'createDecisionMethod' of decision: " + var_b4927f0893f5f26c);
        #/
        decision = [[ var_87f71c8ba2104b76 ]]();
        decision.name = var_b4927f0893f5f26c;
        var_f0a8822dcc782c9d.var_577f45571c039a54[var_b4927f0893f5f26c] = decision;
    }
    self.Mind.var_f0a8822dcc782c9d = var_f0a8822dcc782c9d;
    function_b4c45ed36fa851d5();
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x910
// Size: 0x80
function function_bffb5b682a4ef6a2(var_bf258b4d0ceba36c, var_90645b7af425f119, var_ed2441bc0e552f8d, var_b97e27a7552f6031) {
    decision = spawnstruct();
    decision.var_e0844a2b7f904b14 = var_bf258b4d0ceba36c;
    decision.var_8f4d51ce49593548 = var_90645b7af425f119;
    decision.var_b97e27a7552f6031 = var_b97e27a7552f6031;
    decision function_f7033a7afad12cdd(var_ed2441bc0e552f8d);
    decision.score = 0;
    decision.enabled = 1;
    return decision;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x998
// Size: 0xc0
function function_f7033a7afad12cdd(var_ed2441bc0e552f8d) {
    var_465d72931390a18e = 1000;
    var_a9c773f1d0e72281 = self.var_ed2441bc0e552f8d;
    self.var_ed2441bc0e552f8d = function_53c4c53197386572(var_ed2441bc0e552f8d, var_465d72931390a18e);
    if (self.var_ed2441bc0e552f8d < 100) {
        self.var_ed2441bc0e552f8d = 100;
    }
    if (isdefined(var_a9c773f1d0e72281) && var_a9c773f1d0e72281 != self.var_ed2441bc0e552f8d && isdefined(self.var_6b8af58a3f65c8f2) && self.var_6b8af58a3f65c8f2 != 0) {
        self.var_6b8af58a3f65c8f2 = self.var_6b8af58a3f65c8f2 + self.var_ed2441bc0e552f8d - var_a9c773f1d0e72281;
        if (self.var_6b8af58a3f65c8f2 < 0) {
            self.var_6b8af58a3f65c8f2 = 0;
        }
    }
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5f
// Size: 0x155
function function_bf27f58f5ee818da() {
    var_37f47315e6bcba99 = undefined;
    foreach (decision in self.Mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        decision.var_df9d35d9b4bee654 = undefined;
        if (!decision.var_10f0b5c52ece08ce) {
            decision.score = 0;
        } else {
            decision.score = decision [[ decision.var_e0844a2b7f904b14 ]](self);
            if (decision.score > 0) {
                if (!isdefined(var_37f47315e6bcba99) || decision.score > var_37f47315e6bcba99.score) {
                    var_37f47315e6bcba99 = decision;
                }
            }
        }
    }
    if (isdefined(var_37f47315e6bcba99)) {
        var_e25a797f1d46b511 = function_b697ed2efbe072b9(var_37f47315e6bcba99);
        if (isdefined(var_e25a797f1d46b511)) {
            var_37f47315e6bcba99 = var_e25a797f1d46b511;
        }
        if (var_37f47315e6bcba99 function_7d9b2d9364b68c8e(self)) {
            function_3cf1fa93b66c0336(var_37f47315e6bcba99.var_df9d35d9b4bee654, var_37f47315e6bcba99.score);
        }
    }
    /#
        self.Mind.var_f0a8822dcc782c9d.debuginfo = "<unknown string>";
    #/
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb
// Size: 0x13c
function function_b697ed2efbe072b9(decision) {
    if (!decision function_7d9b2d9364b68c8e(self)) {
        return undefined;
    }
    var_de3528a27254711d = undefined;
    foreach (executing in self.Mind.var_c38fcea73953365e.actions) {
        if (decision.var_df9d35d9b4bee654.var_1cd1b7db5606880e == executing.var_1cd1b7db5606880e) {
            var_de3528a27254711d = executing;
            break;
        }
    }
    if (isdefined(var_de3528a27254711d)) {
        var_eb0138d72f9fb02a = var_de3528a27254711d.decision;
        if (var_eb0138d72f9fb02a.enabled && !var_eb0138d72f9fb02a.var_10f0b5c52ece08ce) {
            var_eb0138d72f9fb02a.var_df9d35d9b4bee654 = undefined;
            score = var_eb0138d72f9fb02a [[ var_eb0138d72f9fb02a.var_e0844a2b7f904b14 ]](self);
            if (score >= decision.score) {
                var_eb0138d72f9fb02a.score = score;
                return var_eb0138d72f9fb02a;
            } else {
                var_eb0138d72f9fb02a.var_df9d35d9b4bee654 = undefined;
            }
        }
    }
    return undefined;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcff
// Size: 0x78
function function_7d9b2d9364b68c8e(bot) {
    if (isdefined(self.var_df9d35d9b4bee654)) {
        return 1;
    }
    if (isdefined(self.var_8f4d51ce49593548)) {
        self.var_df9d35d9b4bee654 = self [[ self.var_8f4d51ce49593548 ]](bot);
        /#
            assert(isdefined(self.var_df9d35d9b4bee654));
        #/
        return 1;
    } else {
        /#
            assertmsg("No action generated for a made decision '" + self.name + "'");
        #/
        return 0;
    }
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7e
// Size: 0x96
function function_5e44c9968544264(enabled, var_1e19818e63c57531) {
    foreach (name, decision in self.Mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        if (isdefined(var_1e19818e63c57531) && array_contains(var_1e19818e63c57531, name)) {
            continue;
        }
        decision.enabled = enabled;
    }
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe1b
// Size: 0x1a4
function function_e3becfc53745debe(var_ddd5b02aaf128173) {
    /#
        /#
            assert(!isdefined(var_ddd5b02aaf128173) || var_ddd5b02aaf128173 > 0);
        #/
        var_f0a8822dcc782c9d = self.Mind.var_f0a8822dcc782c9d;
        if (var_f0a8822dcc782c9d.debuginfo.size > 0) {
            return var_f0a8822dcc782c9d.debuginfo;
        }
        var_21b72418e16677fb = function_e60ece723e993125(var_f0a8822dcc782c9d.var_577f45571c039a54);
        debuginfo = "<unknown string>";
        count = 0;
        foreach (decision in var_21b72418e16677fb) {
            score = int(decision.score);
            if (score <= 0) {
                break;
            }
            if (debuginfo.size > 0) {
                debuginfo = debuginfo + "<unknown string>";
            }
            if (isdefined(decision.var_df9d35d9b4bee654)) {
                name = decision.var_df9d35d9b4bee654 getdescription();
            } else {
                name = decision.name;
            }
            debuginfo = debuginfo + score + "<unknown string>" + name;
            count++;
            if (isdefined(var_ddd5b02aaf128173) && count == var_ddd5b02aaf128173) {
                break;
            }
        }
        if (debuginfo.size > 0) {
            println("<unknown string>" + self getentitynumber() + "<unknown string>" + debuginfo);
        }
        var_f0a8822dcc782c9d.debuginfo = debuginfo;
        return debuginfo;
    #/
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc6
// Size: 0x4f
function getdescription() {
    /#
        var_11728671e7960b51 = 25;
        description = self.description;
        var_46f432042b3473d8 = description.size;
        if (var_46f432042b3473d8 > var_11728671e7960b51) {
            description = getsubstr(description, 0, var_11728671e7960b51 - 3) + "<unknown string>";
        }
        return description;
    #/
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101c
// Size: 0x6f
function function_e60ece723e993125(var_577f45571c039a54) {
    array = [];
    foreach (decision in var_577f45571c039a54) {
        array[array.size] = decision;
    }
    return array_sort_with_func(array, &function_6630749576e808a7);
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1093
// Size: 0x2b
function function_6630749576e808a7(var_577f07571c0311fa, var_577f06571c030fc7) {
    return var_577f07571c0311fa.score > var_577f06571c030fc7.score;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0x96
function function_4e58bf49977d1bfd(var_ec02147fee952ce2) {
    action = self.var_8ff05874bbb1ac7c;
    if (!isdefined(action)) {
        return 0;
    }
    var_94cf26805b74f3c9 = action.var_ec02147fee952ce2;
    if (isdefined(var_94cf26805b74f3c9) != isdefined(var_ec02147fee952ce2)) {
        return 0;
    }
    if (isdefined(var_94cf26805b74f3c9)) {
        if (isdefined(self.var_b97e27a7552f6031)) {
            if (![[ self.var_b97e27a7552f6031 ]](var_94cf26805b74f3c9, var_ec02147fee952ce2)) {
                return 0;
            }
        } else {
            /#
                assertex(!isstruct(var_94cf26805b74f3c9), "Need to provide a 'argumentComparer' function if argument is of struct type");
            #/
            if (var_94cf26805b74f3c9 != var_ec02147fee952ce2) {
                return 0;
            }
        }
    }
    return action.var_65d094291532fe1b;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1164
// Size: 0x52
function function_39b811fb3872bdb8(var_d721b9cd69442737, var_544048cb8b87dfd4) {
    /#
        assertex(isdefined(var_d721b9cd69442737), "DecisionConstants(), parameter 'loadConstantsMethod' must be defined.");
    #/
    constants = spawnstruct();
    [[ var_d721b9cd69442737 ]](constants);
    constants.var_5d6ecf0f2ffb1b0d = function_53c4c53197386572(var_544048cb8b87dfd4, "");
    return constants;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11be
// Size: 0x64
function function_30e98541032449dd(var_d721b9cd69442737, var_544048cb8b87dfd4) {
    /#
        assertex(isstruct(self), "DerivedDecisionConstants() must be called on a constants of struct type.");
    #/
    /#
        assertex(isdefined(var_d721b9cd69442737) && isdefined(var_544048cb8b87dfd4), "DerivedDecisionConstants(), parameters must be defined.");
    #/
    var_c87591a99f9a3d13 = function_7e7b315fcb2b9159(self, 1);
    [[ var_d721b9cd69442737 ]](var_c87591a99f9a3d13);
    var_c87591a99f9a3d13.var_5d6ecf0f2ffb1b0d = var_544048cb8b87dfd4;
    return var_c87591a99f9a3d13;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122a
// Size: 0xd5
function function_4e8e4b3605e73a33(var_c3dbaed99256c464, var_6beb626a7b315296) {
    /#
        assertex(isdefined(var_c3dbaed99256c464), "CreateDecisionDescription(), parameter 'createMethod' must be defined.");
    #/
    desc = spawnstruct();
    desc.var_87f71c8ba2104b76 = var_c3dbaed99256c464;
    if (isdefined(var_6beb626a7b315296)) {
        var_757cc864d1e4ff08 = [];
        var_ebaab9a548b4409a = [[ var_6beb626a7b315296 ]]();
        foreach (constants in var_ebaab9a548b4409a) {
            if (isdefined(constants.var_5d6ecf0f2ffb1b0d)) {
                var_757cc864d1e4ff08[constants.var_5d6ecf0f2ffb1b0d] = constants;
            }
        }
        desc.var_757cc864d1e4ff08 = var_757cc864d1e4ff08;
    }
    return desc;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1307
// Size: 0x110
function function_b4c45ed36fa851d5() {
    /#
        assert(isdefined(self.Mind) && isdefined(self.Mind.var_f0a8822dcc782c9d));
    #/
    var_f0a8822dcc782c9d = self.Mind.var_f0a8822dcc782c9d;
    var_ff4950d12e0c1a32 = level.Mind.var_577f45571c039a54;
    var_8967597d9c59f6e6 = namespace_823e1abd5161abb1::function_dd6540682cd2ab87();
    foreach (name, decision in var_f0a8822dcc782c9d.var_577f45571c039a54) {
        desc = var_ff4950d12e0c1a32[name];
        /#
            assert(isdefined(desc));
        #/
        if (isdefined(desc.var_757cc864d1e4ff08)) {
            decision.constants = namespace_823e1abd5161abb1::function_f56bbc9f43769ff6(desc.var_757cc864d1e4ff08, var_8967597d9c59f6e6);
        }
    }
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141e
// Size: 0x5b
function function_505d8b7080733a24() {
    var_c38fcea73953365e = spawnstruct();
    var_c38fcea73953365e.actions = [];
    var_c38fcea73953365e.var_33619db9d3c4b989 = namespace_823e1abd5161abb1::function_68397cb2cf3494e9();
    /#
        var_c38fcea73953365e.debuginfo = "<unknown string>";
    #/
    self.Mind.var_c38fcea73953365e = var_c38fcea73953365e;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1480
// Size: 0x16b
function function_ff35a4d756374ede(name, var_ec02147fee952ce2, var_1cd1b7db5606880e, description, var_372f3f12058d5833, decision, var_60524de5341e2666, var_da2f00d6903b03b7, var_daec6fd98c7cee50) {
    /#
        assert(!isdefined(var_da2f00d6903b03b7) || var_da2f00d6903b03b7 > 0);
    #/
    /#
        assert(!isdefined(var_daec6fd98c7cee50) || var_daec6fd98c7cee50 > 0);
    #/
    /#
        assertex(isdefined(var_da2f00d6903b03b7) || !isdefined(var_daec6fd98c7cee50), "If max value exists, increment value must also exist");
    #/
    if (!isdefined(description)) {
        /#
            assertmsg("The description of action " + name + " is undefined. It is used to distinguish different instances of the same action. Specify an empty string to it if all instances are the same");
        #/
        description = "";
    }
    action = spawnstruct();
    action.name = name;
    action.var_ec02147fee952ce2 = var_ec02147fee952ce2;
    action.var_1cd1b7db5606880e = var_1cd1b7db5606880e;
    action.description = name;
    if (description.size > 0) {
        action.description = action.description + " " + description;
    }
    action.var_372f3f12058d5833 = var_372f3f12058d5833;
    action.decision = decision;
    action.var_60524de5341e2666 = var_60524de5341e2666;
    action.var_da2f00d6903b03b7 = var_da2f00d6903b03b7;
    action.var_daec6fd98c7cee50 = var_daec6fd98c7cee50;
    action.var_65d094291532fe1b = 0;
    return action;
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f3
// Size: 0x12d
function function_6935ab68e207ab2b() {
    var_c38fcea73953365e = self.Mind.var_c38fcea73953365e;
    var_cb8abce5b631aac9 = 0;
    time = gettime();
    if (isdefined(var_c38fcea73953365e.var_dd12ce0e7469509b)) {
        var_cb8abce5b631aac9 = (time - var_c38fcea73953365e.var_dd12ce0e7469509b) * 0.001;
    }
    var_c38fcea73953365e.var_dd12ce0e7469509b = time;
    foreach (action in var_c38fcea73953365e.actions) {
        var_da2f00d6903b03b7 = action.var_da2f00d6903b03b7;
        if (isdefined(var_da2f00d6903b03b7)) {
            action.var_65d094291532fe1b = action.var_65d094291532fe1b + var_da2f00d6903b03b7 * var_cb8abce5b631aac9;
            var_daec6fd98c7cee50 = action.var_daec6fd98c7cee50;
            if (isdefined(var_daec6fd98c7cee50) && action.var_65d094291532fe1b > var_daec6fd98c7cee50) {
                action.var_65d094291532fe1b = var_daec6fd98c7cee50;
            }
        }
    }
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1727
// Size: 0xd5
function function_3cf1fa93b66c0336(action, score) {
    var_c38fcea73953365e = self.Mind.var_c38fcea73953365e;
    foreach (executing in var_c38fcea73953365e.actions) {
        if (action.description == executing.description) {
            return;
        }
    }
    action.score = score;
    action.decision.var_8ff05874bbb1ac7c = action;
    action.var_7fdb8fdafb49730 = var_c38fcea73953365e;
    function_163d65e081113f71(action);
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1803
// Size: 0x149
function function_163d65e081113f71(action) {
    var_c38fcea73953365e = self.Mind.var_c38fcea73953365e;
    if (action.var_1cd1b7db5606880e != "") {
        var_f27b68cbf13d11ae = [];
        foreach (executing in var_c38fcea73953365e.actions) {
            if (action.var_1cd1b7db5606880e == executing.var_1cd1b7db5606880e) {
                var_f27b68cbf13d11ae[var_f27b68cbf13d11ae.size] = executing;
            }
        }
        if (var_f27b68cbf13d11ae.size > 0) {
            foreach (var_b723a8cbc5428bf2 in var_f27b68cbf13d11ae) {
                function_1bcf2f3304885ffc(var_b723a8cbc5428bf2);
            }
        }
    }
    var_c38fcea73953365e.actions[var_c38fcea73953365e.actions.size] = action;
    /#
        var_c38fcea73953365e.debuginfo = "<unknown string>";
    #/
    thread function_be2ca917f8b5f30b(action);
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1953
// Size: 0xe7
function function_be2ca917f8b5f30b(action) {
    level endon("game_ended");
    var_a76969dcc6f15d80 = [0:"bot_suspended", 1:"death_or_disconnect", 2:action.description];
    foreach (condition in var_a76969dcc6f15d80) {
        self endon(condition);
    }
    self notify("bot_action_start", action);
    thread function_cfab1366832a49eb(var_a76969dcc6f15d80, action);
    action.lastError = action [[ action.var_372f3f12058d5833 ]](self);
    /#
        if (isdefined(action.lastError)) {
            action.var_24323dd7256d2d04 = gettime();
        }
    #/
    self notify(action.description);
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a41
// Size: 0x187
function function_cfab1366832a49eb(var_a76969dcc6f15d80, action) {
    function_1d3af9a375f218dd(var_a76969dcc6f15d80);
    action.completed = 1;
    action.decision.var_8ff05874bbb1ac7c = undefined;
    var_c38fcea73953365e = self.Mind.var_c38fcea73953365e;
    var_c38fcea73953365e.actions = array_remove(var_c38fcea73953365e.actions, action);
    if (isdefined(action.var_60524de5341e2666)) {
        lastError = [[ action.var_60524de5341e2666 ]](action);
        if (isdefined(lastError)) {
            action.lastError = lastError;
            /#
                action.var_24323dd7256d2d04 = gettime();
            #/
        }
    }
    if (isdefined(var_c38fcea73953365e.var_33619db9d3c4b989)) {
        [[ var_c38fcea73953365e.var_33619db9d3c4b989 ]](action);
    }
    /#
        if (isdefined(action.lastError) && action.lastError.size > 0) {
            var_c38fcea73953365e.lastError = action.lastError + "<unknown string>" + action getdescription() + "<unknown string>" + action.var_1cd1b7db5606880e;
            var_c38fcea73953365e.var_24323dd7256d2d04 = action.var_24323dd7256d2d04;
        }
        var_c38fcea73953365e.debuginfo = "<unknown string>";
    #/
    self notify("bot_action_end", action);
    self notify(action.description + "Ended");
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcf
// Size: 0x44
function function_1d3af9a375f218dd(messages) {
    /#
        assertex(messages.size > 0, "Message array must contain at least one string.");
    #/
    for (i = 0; i < messages.size; i++) {
        self endon(messages[i]);
    }
    level waittill("game_ended");
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1a
// Size: 0x3e
function function_1bcf2f3304885ffc(action) {
    if (istrue(action.completed)) {
        return;
    }
    self notify(action.description);
    self waittill(action.description + "Ended");
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5f
// Size: 0x6c
function function_cd40e795b7776f14() {
    foreach (action in self.Mind.var_c38fcea73953365e.actions) {
        function_1bcf2f3304885ffc(action);
    }
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd2
// Size: 0x5
function function_d57dd414963503d1() {
    return isdefined(self);
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cdf
// Size: 0x14f
function function_895e12d8ae226936() {
    /#
        var_c38fcea73953365e = self.Mind.var_c38fcea73953365e;
        if (var_c38fcea73953365e.debuginfo.size > 0) {
            return var_c38fcea73953365e.debuginfo;
        }
        debuginfo = "<unknown string>";
        foreach (action in var_c38fcea73953365e.actions) {
            if (debuginfo.size > 0) {
                debuginfo = debuginfo + "<unknown string>";
            }
            group = action.var_1cd1b7db5606880e;
            name = action.description;
            if (isdefined(action.var_55a389ca3c7d0111) && action.var_55a389ca3c7d0111.size > 0) {
                name = name + "<unknown string>" + action.var_55a389ca3c7d0111;
            }
            debuginfo = debuginfo + group + "<unknown string>" + name;
        }
        if (debuginfo.size > 0) {
            println("<unknown string>" + self getentitynumber() + "<unknown string>" + debuginfo);
        }
        var_c38fcea73953365e.debuginfo = debuginfo;
        return debuginfo;
    #/
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e35
// Size: 0x8e
function function_7ec4108a3d7a4091() {
    /#
        if (!isdefined(self.Mind.var_c38fcea73953365e.lastError)) {
            return undefined;
        }
        timesec = int((gettime() - self.Mind.var_c38fcea73953365e.var_24323dd7256d2d04) * 0.001);
        return self.Mind.var_c38fcea73953365e.lastError + "<unknown string>" + timesec + "<unknown string>";
    #/
}

// Namespace Mind/namespace_56b9cc3deb6e3f5e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1eca
// Size: 0x5a
function function_f3cf203834e48c6d(status) {
    /#
        /#
            assert(isdefined(status));
        #/
        if (isdefined(self.var_55a389ca3c7d0111) && self.var_55a389ca3c7d0111 == status) {
            return;
        }
        self.var_55a389ca3c7d0111 = status;
        self.var_7fdb8fdafb49730.debuginfo = "<unknown string>";
    #/
}

