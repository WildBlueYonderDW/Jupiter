// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_7035609a5c640fe1;

// Namespace namespace_7035609a5c640fe1/namespace_e6e035262e5f01a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f
// Size: 0x21
function init() {
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587() && namespace_cd0b2d039510b38d::matchmakinggame()) {
        level.var_3392f98172a332d7 = 1;
    }
}

// Namespace namespace_7035609a5c640fe1/namespace_e6e035262e5f01a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137
// Size: 0xd
function function_3392f98172a332d7() {
    return istrue(level.var_3392f98172a332d7);
}

// Namespace namespace_7035609a5c640fe1/namespace_e6e035262e5f01a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x53
function function_abd8520a1b77ab7b(var_5ea5f0acd4fd6e5f) {
    var_e6d96e0e82e3743a = undefined;
    switch (var_5ea5f0acd4fd6e5f) {
    case #"hash_417c605750c7baa5":
    case #"hash_4ca1dc2e1b0de0d3":
        var_e6d96e0e82e3743a = 0;
        break;
    case #"hash_19ba8d41970911ad":
        var_e6d96e0e82e3743a = 1;
        break;
    }
    return var_e6d96e0e82e3743a;
}

// Namespace namespace_7035609a5c640fe1/namespace_e6e035262e5f01a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7
// Size: 0x203
function function_a23861c0f0635cf4(var_5ea5f0acd4fd6e5f) {
    if (isbot(self)) {
        return;
    }
    var_e6d96e0e82e3743a = function_abd8520a1b77ab7b(var_5ea5f0acd4fd6e5f);
    if (!isdefined(var_e6d96e0e82e3743a)) {
        return;
    }
    var_cc2e917291cc4a13 = self function_50f9d8900c83dc40();
    var_745a0ba506902bfa = self function_9de349505d658eff(var_cc2e917291cc4a13, var_e6d96e0e82e3743a);
    if (var_745a0ba506902bfa == 0) {
        return;
    }
    if (var_745a0ba506902bfa < randomfloat(1)) {
        return;
    }
    var_f654c0a4060b57ff = self function_3993c643d423122a(var_cc2e917291cc4a13);
    var_f654c0a4060b57ff = function_9d27ef5aadbfaf3b(var_f654c0a4060b57ff);
    if (var_f654c0a4060b57ff.size == 0) {
        return;
    }
    var_746f5f0494d6253 = 0;
    for (index = 0; index < var_f654c0a4060b57ff.size; index++) {
        var_746f5f0494d6253 = var_746f5f0494d6253 + var_f654c0a4060b57ff[index].weight;
    }
    var_7ec3efadc5d1beac = randomint(var_746f5f0494d6253);
    var_6c8b8ac0c7274797 = 0;
    for (index = 0; index < var_f654c0a4060b57ff.size; index++) {
        var_7ec3efadc5d1beac = var_7ec3efadc5d1beac - var_f654c0a4060b57ff[index].weight;
        if (var_7ec3efadc5d1beac <= 0) {
            var_6c8b8ac0c7274797 = var_f654c0a4060b57ff[index].id;
            break;
        }
    }
    if (var_6c8b8ac0c7274797 == 0) {
        return;
    }
    var_7c6183ce9e04512e = #"hash_3971fbf1d7a8c855";
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_311cc95400ed6a7f"), 1:var_6c8b8ac0c7274797, 2:function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"hash_81c8086c749c4bb9"), 3:1];
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
    }
    if (!isdefined(self.var_52e352f8923ed6f9)) {
        self.var_52e352f8923ed6f9 = [];
    }
    self.var_52e352f8923ed6f9[self.var_52e352f8923ed6f9.size] = var_6c8b8ac0c7274797;
    self setclientomnvar("ui_edge_item_gain", var_6c8b8ac0c7274797);
    waitframe();
    self setclientomnvar("ui_edge_item_gain", 0);
}

// Namespace namespace_7035609a5c640fe1/namespace_e6e035262e5f01a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1
// Size: 0x9b
function function_9d27ef5aadbfaf3b(var_f654c0a4060b57ff) {
    var_49010211722113d6 = self function_da5d6f8b4926cb90();
    var_6c2ac9eaf9d1b5d3 = [];
    for (index = 0; index < var_f654c0a4060b57ff.size; index++) {
        if (isdefined(var_49010211722113d6) && array_contains(var_49010211722113d6, var_f654c0a4060b57ff[index].id)) {
            continue;
        }
        if (isdefined(self.var_52e352f8923ed6f9) && array_contains(self.var_52e352f8923ed6f9, var_f654c0a4060b57ff[index].id)) {
            continue;
        }
        var_6c2ac9eaf9d1b5d3[var_6c2ac9eaf9d1b5d3.size] = var_f654c0a4060b57ff[index];
    }
    return var_6c2ac9eaf9d1b5d3;
}

