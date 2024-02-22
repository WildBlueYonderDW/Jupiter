// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_54f6d121e91434f8;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_945eaec008a2a2b0;

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba
// Size: 0x32
function function_70b0f5c75f974eff() {
    if (!isdefined(level.var_19f9544004bec048)) {
        level.var_19f9544004bec048 = [];
    }
    /#
        level.var_19f9544004bec048["<unknown string>"] = &function_28d42a2b1f0b3eab;
    #/
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f3
// Size: 0x38
function function_f18abd71e34586a2(var_97889d347cc37c58, var_e4ab070d4073a115) {
    if (!isdefined(level.var_19f9544004bec048)) {
        level.var_19f9544004bec048 = [];
    }
    level.var_19f9544004bec048[var_97889d347cc37c58] = var_e4ab070d4073a115;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0xcf
function function_9e193f65f09b4ac4(player, var_94bda1b3c0ae9bab) {
    var_91b2a18054e979ae = function_365e789cf7ee1a2f(player, var_94bda1b3c0ae9bab);
    if (!var_91b2a18054e979ae) {
        var_2bf0f676fdb4d9d9 = spawnstruct();
        var_2bf0f676fdb4d9d9.player = player;
        var_2bf0f676fdb4d9d9.var_94bda1b3c0ae9bab = var_94bda1b3c0ae9bab;
        var_15309dae6e19a117 = var_94bda1b3c0ae9bab function_9ece756d9ac04e6d();
        if (isdefined(var_15309dae6e19a117) && var_15309dae6e19a117 > 0) {
            function_21987527fd4733ad(var_94bda1b3c0ae9bab, player, &function_c5de94ea3ad8f2e6, var_2bf0f676fdb4d9d9, var_15309dae6e19a117);
        } else {
            var_108eadcfc61719c = function_93587d5ba6247f36(var_94bda1b3c0ae9bab, player);
            if (var_108eadcfc61719c) {
                function_c5de94ea3ad8f2e6(var_2bf0f676fdb4d9d9);
            } else {
                /#
                    function_747e8968c9de65cd(player, var_94bda1b3c0ae9bab, 0, "<unknown string>");
                #/
            }
        }
    } else {
        /#
            function_747e8968c9de65cd(player, var_94bda1b3c0ae9bab, 0, "<unknown string>");
        #/
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308
// Size: 0x62
function function_4cd1243025855075(playerlist, var_94bda1b3c0ae9bab) {
    foreach (player in playerlist) {
        function_9e193f65f09b4ac4(player, var_94bda1b3c0ae9bab);
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371
// Size: 0x62
function function_724d89e705c4c011(player, var_aa1d85c9afc2ce60) {
    foreach (var_94bda1b3c0ae9bab in var_aa1d85c9afc2ce60) {
        function_9e193f65f09b4ac4(player, var_94bda1b3c0ae9bab);
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da
// Size: 0x6f
function function_8dc0cab5b4dd949b(var_94bda1b3c0ae9bab) {
    foreach (player in level.players) {
        if (function_365e789cf7ee1a2f(player, var_94bda1b3c0ae9bab)) {
            function_bb9bc4c538a84c97(player, var_94bda1b3c0ae9bab, 1);
        }
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x59
function function_cf562ba1189ef6d0(var_aa1d85c9afc2ce60) {
    foreach (var_94bda1b3c0ae9bab in var_aa1d85c9afc2ce60) {
        function_8dc0cab5b4dd949b(var_94bda1b3c0ae9bab);
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b0
// Size: 0x47
function function_8b7e04a0cc14a82e(player, var_94bda1b3c0ae9bab) {
    if (!function_365e789cf7ee1a2f(player, var_94bda1b3c0ae9bab)) {
        /#
            function_747e8968c9de65cd(player, var_94bda1b3c0ae9bab, 2, "<unknown string>");
        #/
        return;
    }
    function_d1b2e5b614aa5495(player, var_94bda1b3c0ae9bab);
    function_bb9bc4c538a84c97(player, var_94bda1b3c0ae9bab, 2);
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fe
// Size: 0x62
function function_dc1c1d2f6e9de57d(player, var_aa1d85c9afc2ce60) {
    foreach (var_94bda1b3c0ae9bab in var_aa1d85c9afc2ce60) {
        function_8b7e04a0cc14a82e(player, var_94bda1b3c0ae9bab);
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x567
// Size: 0x6f
function function_13fbc3d3854d009a(var_94bda1b3c0ae9bab) {
    foreach (player in level.players) {
        if (function_365e789cf7ee1a2f(player, var_94bda1b3c0ae9bab)) {
            function_bb9bc4c538a84c97(player, var_94bda1b3c0ae9bab, 2);
        }
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd
// Size: 0x62
function function_dacc8aa0d16e4487(playerlist, var_94bda1b3c0ae9bab) {
    foreach (player in playerlist) {
        function_8b7e04a0cc14a82e(player, var_94bda1b3c0ae9bab);
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x646
// Size: 0x73
function function_790e679b0f2d121e(var_9c34764b7d5ac247, var_94bda1b3c0ae9bab) {
    var_23d6245ff51f1599 = namespace_54d20dd0dd79277f::function_5b7802e04b6d946(var_9c34764b7d5ac247);
    if (istrue(var_23d6245ff51f1599)) {
        squad = getsquadmates(var_9c34764b7d5ac247.team, var_9c34764b7d5ac247.var_ff97225579de16a, 0);
        function_4cd1243025855075(squad, var_94bda1b3c0ae9bab);
    } else if (!function_365e789cf7ee1a2f(var_9c34764b7d5ac247, var_94bda1b3c0ae9bab)) {
        function_9e193f65f09b4ac4(var_9c34764b7d5ac247, var_94bda1b3c0ae9bab);
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c0
// Size: 0x1d
function function_9bce3b7a2f2ae1e(var_94bda1b3c0ae9bab) {
    function_4cd1243025855075(level.players, var_94bda1b3c0ae9bab);
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6e4
// Size: 0x7e
function function_9d73d2cd3341c8e1(var_72e26865a560af92, var_77caeaf9f9b13760, var_94bda1b3c0ae9bab) {
    foreach (player in level.players) {
        if (utility::function_44daa65837a12044(player, var_72e26865a560af92, var_77caeaf9f9b13760)) {
            function_9e193f65f09b4ac4(player, var_94bda1b3c0ae9bab);
        }
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x769
// Size: 0xcc
function function_3186d88f9311acf4(var_97889d347cc37c58) {
    var_94bda1b3c0ae9bab = spawnstruct();
    var_94bda1b3c0ae9bab.var_57214832d7aad3b6 = 0;
    var_94bda1b3c0ae9bab.var_97889d347cc37c58 = var_97889d347cc37c58;
    var_94bda1b3c0ae9bab.var_82be66848b872db4 = [];
    var_94bda1b3c0ae9bab.var_c113183796dfd41 = undefined;
    var_94bda1b3c0ae9bab.var_c6167efbc0cc9a86 = 1;
    var_94bda1b3c0ae9bab.var_8e09c79789611261 = 0;
    if (!isdefined(level.var_9022a58955ba248a)) {
        level.var_9022a58955ba248a = 0;
    }
    var_94bda1b3c0ae9bab.uniqueid = level.var_9022a58955ba248a;
    var_94bda1b3c0ae9bab.groupid = var_94bda1b3c0ae9bab.uniqueid;
    level.var_9022a58955ba248a++;
    var_94bda1b3c0ae9bab.var_f16900d47079d51f = [];
    var_94bda1b3c0ae9bab function_a1f71337a6844055();
    return var_94bda1b3c0ae9bab;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x83d
// Size: 0x34
function function_ab07dddb2e50773b(var_f9e49cacd074be6f) {
    /#
        var_94bda1b3c0ae9bab = function_3186d88f9311acf4("<unknown string>");
        var_94bda1b3c0ae9bab.text = var_f9e49cacd074be6f;
        return var_94bda1b3c0ae9bab;
    #/
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x878
// Size: 0x18
function function_9cf7afd6797ae365(var_94bda1b3c0ae9bab) {
    return istrue(var_94bda1b3c0ae9bab.var_c6167efbc0cc9a86);
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x898
// Size: 0xd
function function_be70a75a57d524fe() {
    return istrue(self.var_57214832d7aad3b6);
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad
// Size: 0xc
function function_7437a8d48556e45e() {
    return self.var_82be66848b872db4;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c1
// Size: 0x24
function function_54ad2295d6995862() {
    /#
        assertex(isdefined(self.var_97889d347cc37c58), "A type was not specified on this broadcast. Player Broadcasting won't know which system to hand it off to.");
    #/
    return self.var_97889d347cc37c58;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ed
// Size: 0xc
function function_cf54c2c8650d9688() {
    return self.uniqueid;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x901
// Size: 0xc
function function_178a0ef658e52420() {
    return self.groupid;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x915
// Size: 0xc
function function_9ece756d9ac04e6d() {
    return self.var_8e09c79789611261;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x929
// Size: 0xc
function function_8362248b8fb9637f() {
    return self.var_c113183796dfd41;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93d
// Size: 0x16
function function_a2b3a19c012e474b(var_f746a99031177c8f) {
    self.var_c113183796dfd41 = var_f746a99031177c8f;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95a
// Size: 0x16
function function_15c75941af255c67(var_15309dae6e19a117) {
    self.var_8e09c79789611261 = var_15309dae6e19a117;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x977
// Size: 0x50
function private function_365e789cf7ee1a2f(player, var_94bda1b3c0ae9bab) {
    if (!isdefined(player) || !isdefined(player.guid)) {
        return 0;
    }
    var_2aba3fb4a35aad3b = var_94bda1b3c0ae9bab.var_f16900d47079d51f[player.guid];
    return istrue(var_2aba3fb4a35aad3b);
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9cf
// Size: 0x2e
function private function_d06b740fbbece1eb(player, var_94bda1b3c0ae9bab) {
    var_94bda1b3c0ae9bab.var_f16900d47079d51f[player.guid] = 1;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0x2d
function private function_d1b2e5b614aa5495(player, var_94bda1b3c0ae9bab) {
    var_94bda1b3c0ae9bab.var_f16900d47079d51f[player.guid] = 0;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa38
// Size: 0x16
function private function_47c20e1020b91ac1(player, params) {
    return 1;
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xa56
// Size: 0x31
function private function_28d42a2b1f0b3eab(player, var_94bda1b3c0ae9bab, var_9f0f45f421504c19) {
    /#
        clientprint(player, var_94bda1b3c0ae9bab.text);
    #/
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa8e
// Size: 0x5e
function private function_c5de94ea3ad8f2e6(var_2bf0f676fdb4d9d9) {
    player = var_2bf0f676fdb4d9d9.player;
    var_94bda1b3c0ae9bab = var_2bf0f676fdb4d9d9.var_94bda1b3c0ae9bab;
    function_d06b740fbbece1eb(player, var_94bda1b3c0ae9bab);
    if (var_94bda1b3c0ae9bab function_be70a75a57d524fe()) {
        function_790e679b0f2d121e(player, var_94bda1b3c0ae9bab);
    }
    function_bb9bc4c538a84c97(player, var_94bda1b3c0ae9bab, 0);
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaf3
// Size: 0x8f
function private function_bb9bc4c538a84c97(player, var_94bda1b3c0ae9bab, var_9f0f45f421504c19) {
    if (!isdefined(player)) {
        /#
            assertmsg("Attempting to broadcast to a player that is undefined. Did they disconnect? Broadcast Unique Id: " + var_94bda1b3c0ae9bab function_cf54c2c8650d9688() + ". Command Type: " + var_9f0f45f421504c19);
        #/
        return;
    }
    var_97889d347cc37c58 = var_94bda1b3c0ae9bab function_54ad2295d6995862();
    if (isdefined(var_97889d347cc37c58)) {
        /#
            assertex(isdefined(level.var_19f9544004bec048[var_97889d347cc37c58]), "This player broadcast message type has not been registered with a handoff function.");
        #/
        [[ level.var_19f9544004bec048[var_97889d347cc37c58] ]](player, var_94bda1b3c0ae9bab, var_9f0f45f421504c19);
        /#
            function_83152f28715ba19f(player, var_94bda1b3c0ae9bab, var_9f0f45f421504c19);
        #/
    }
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb89
// Size: 0x37
function function_b3bcffc014571bbd(var_94bda1b3c0ae9bab) {
    /#
        var_be886913a2deb841 = "<unknown string>" + var_94bda1b3c0ae9bab function_54ad2295d6995862() + "<unknown string>" + var_94bda1b3c0ae9bab function_cf54c2c8650d9688();
        return var_be886913a2deb841;
    #/
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbc7
// Size: 0x24
function private function_7f891130ef74a0() {
    /#
        var_c3799283434e45d7 = getdvarint(@"hash_26b7e4a2ecc0df79", 0);
        return var_c3799283434e45d7 != 0;
    #/
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xbf2
// Size: 0x5d
function private function_83152f28715ba19f(player, var_94bda1b3c0ae9bab, var_9f0f45f421504c19) {
    /#
        if (!function_7f891130ef74a0()) {
            return;
        }
        iprintln(function_fc8d2e5257bc9932() + "<unknown string>" + "<unknown string>" + player.guid + function_b3bcffc014571bbd(var_94bda1b3c0ae9bab) + function_8fcfb1771a833c28(var_9f0f45f421504c19));
    #/
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0xc56
// Size: 0x6d
function private function_747e8968c9de65cd(player, var_94bda1b3c0ae9bab, var_9f0f45f421504c19, details) {
    /#
        if (!function_7f891130ef74a0()) {
            return;
        }
        iprintln(function_fc8d2e5257bc9932() + "<unknown string>" + "<unknown string>" + player.guid + function_b3bcffc014571bbd(var_94bda1b3c0ae9bab) + function_8fcfb1771a833c28(var_9f0f45f421504c19) + "<unknown string>" + details);
    #/
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xcca
// Size: 0x46
function private function_8fcfb1771a833c28(var_9f0f45f421504c19) {
    /#
        var_6874af4f6c91c92f = "<unknown string>";
        if (var_9f0f45f421504c19 == 1) {
            var_6874af4f6c91c92f = "<unknown string>";
        } else if (var_9f0f45f421504c19 == 2) {
            var_6874af4f6c91c92f = "<unknown string>";
        }
        return "<unknown string>" + var_6874af4f6c91c92f;
    #/
}

// Namespace namespace_945eaec008a2a2b0/namespace_236d5e32d01e927d
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd17
// Size: 0xc
function private function_fc8d2e5257bc9932() {
    /#
        return "<unknown string>";
    #/
}

