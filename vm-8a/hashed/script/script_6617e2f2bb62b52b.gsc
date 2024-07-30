#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_54f6d121e91434f8;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_945eaec008a2a2b0;

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba
// Size: 0x31
function function_70b0f5c75f974eff() {
    if (!isdefined(level.var_19f9544004bec048)) {
        level.var_19f9544004bec048 = [];
    }
    /#
        level.var_19f9544004bec048["<dev string:x1c>"] = &function_28d42a2b1f0b3eab;
    #/
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f3
// Size: 0x37
function function_f18abd71e34586a2(broadcasttype, var_e4ab070d4073a115) {
    if (!isdefined(level.var_19f9544004bec048)) {
        level.var_19f9544004bec048 = [];
    }
    level.var_19f9544004bec048[broadcasttype] = var_e4ab070d4073a115;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0xce
function broadcasttoplayer(player, broadcastinstance) {
    var_91b2a18054e979ae = function_365e789cf7ee1a2f(player, broadcastinstance);
    if (!var_91b2a18054e979ae) {
        var_2bf0f676fdb4d9d9 = spawnstruct();
        var_2bf0f676fdb4d9d9.player = player;
        var_2bf0f676fdb4d9d9.broadcastinstance = broadcastinstance;
        var_15309dae6e19a117 = broadcastinstance function_9ece756d9ac04e6d();
        if (isdefined(var_15309dae6e19a117) && var_15309dae6e19a117 > 0) {
            function_21987527fd4733ad(broadcastinstance, player, &function_c5de94ea3ad8f2e6, var_2bf0f676fdb4d9d9, var_15309dae6e19a117);
        } else {
            var_108eadcfc61719c = function_93587d5ba6247f36(broadcastinstance, player);
            if (var_108eadcfc61719c) {
                function_c5de94ea3ad8f2e6(var_2bf0f676fdb4d9d9);
            } else {
                /#
                    function_747e8968c9de65cd(player, broadcastinstance, 0, "<dev string:x22>");
                #/
            }
        }
        return;
    }
    /#
        function_747e8968c9de65cd(player, broadcastinstance, 0, "<dev string:x61>");
    #/
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308
// Size: 0x61
function function_4cd1243025855075(playerlist, broadcastinstance) {
    foreach (player in playerlist) {
        broadcasttoplayer(player, broadcastinstance);
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371
// Size: 0x61
function function_724d89e705c4c011(player, var_aa1d85c9afc2ce60) {
    foreach (broadcastinstance in var_aa1d85c9afc2ce60) {
        broadcasttoplayer(player, broadcastinstance);
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da
// Size: 0x6e
function updatebroadcast(broadcastinstance) {
    foreach (player in level.players) {
        if (function_365e789cf7ee1a2f(player, broadcastinstance)) {
            function_bb9bc4c538a84c97(player, broadcastinstance, 1);
        }
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x58
function function_cf562ba1189ef6d0(var_aa1d85c9afc2ce60) {
    foreach (broadcastinstance in var_aa1d85c9afc2ce60) {
        updatebroadcast(broadcastinstance);
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b0
// Size: 0x46
function function_8b7e04a0cc14a82e(player, broadcastinstance) {
    if (!function_365e789cf7ee1a2f(player, broadcastinstance)) {
        /#
            function_747e8968c9de65cd(player, broadcastinstance, 2, "<dev string:x89>");
        #/
        return;
    }
    function_d1b2e5b614aa5495(player, broadcastinstance);
    function_bb9bc4c538a84c97(player, broadcastinstance, 2);
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fe
// Size: 0x61
function function_dc1c1d2f6e9de57d(player, var_aa1d85c9afc2ce60) {
    foreach (broadcastinstance in var_aa1d85c9afc2ce60) {
        function_8b7e04a0cc14a82e(player, broadcastinstance);
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x567
// Size: 0x6e
function function_13fbc3d3854d009a(broadcastinstance) {
    foreach (player in level.players) {
        if (function_365e789cf7ee1a2f(player, broadcastinstance)) {
            function_bb9bc4c538a84c97(player, broadcastinstance, 2);
        }
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd
// Size: 0x61
function function_dacc8aa0d16e4487(playerlist, broadcastinstance) {
    foreach (player in playerlist) {
        function_8b7e04a0cc14a82e(player, broadcastinstance);
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x646
// Size: 0x72
function function_790e679b0f2d121e(var_9c34764b7d5ac247, broadcastinstance) {
    var_23d6245ff51f1599 = scripts\mp\utility\teams::function_5b7802e04b6d946(var_9c34764b7d5ac247);
    if (istrue(var_23d6245ff51f1599)) {
        squad = getsquadmates(var_9c34764b7d5ac247.team, var_9c34764b7d5ac247.sessionsquadid, 0);
        function_4cd1243025855075(squad, broadcastinstance);
        return;
    }
    if (!function_365e789cf7ee1a2f(var_9c34764b7d5ac247, broadcastinstance)) {
        broadcasttoplayer(var_9c34764b7d5ac247, broadcastinstance);
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c0
// Size: 0x1c
function function_9bce3b7a2f2ae1e(broadcastinstance) {
    function_4cd1243025855075(level.players, broadcastinstance);
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6e4
// Size: 0x7d
function function_9d73d2cd3341c8e1(broadcastorigin, var_77caeaf9f9b13760, broadcastinstance) {
    foreach (player in level.players) {
        if (utility::function_44daa65837a12044(player, broadcastorigin, var_77caeaf9f9b13760)) {
            broadcasttoplayer(player, broadcastinstance);
        }
    }
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x769
// Size: 0xcb
function function_3186d88f9311acf4(broadcasttype) {
    broadcastinstance = spawnstruct();
    broadcastinstance.var_57214832d7aad3b6 = 0;
    broadcastinstance.broadcasttype = broadcasttype;
    broadcastinstance.var_82be66848b872db4 = [];
    broadcastinstance.var_c113183796dfd41 = undefined;
    broadcastinstance.var_c6167efbc0cc9a86 = 1;
    broadcastinstance.var_8e09c79789611261 = 0;
    if (!isdefined(level.broadcastuniqueid)) {
        level.broadcastuniqueid = 0;
    }
    broadcastinstance.uniqueid = level.broadcastuniqueid;
    broadcastinstance.groupid = broadcastinstance.uniqueid;
    level.broadcastuniqueid++;
    broadcastinstance.var_f16900d47079d51f = [];
    broadcastinstance function_a1f71337a6844055();
    return broadcastinstance;
}

/#

    // Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x83d
    // Size: 0x33
    function function_ab07dddb2e50773b(messagetext) {
        broadcastinstance = function_3186d88f9311acf4("<dev string:x1c>");
        broadcastinstance.text = messagetext;
        return broadcastinstance;
    }

#/

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x878
// Size: 0x17
function function_9cf7afd6797ae365(broadcastinstance) {
    return istrue(broadcastinstance.var_c6167efbc0cc9a86);
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x898
// Size: 0xc
function function_be70a75a57d524fe() {
    return istrue(self.var_57214832d7aad3b6);
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ad
// Size: 0xb
function function_7437a8d48556e45e() {
    return self.var_82be66848b872db4;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c1
// Size: 0x23
function function_54ad2295d6995862() {
    assertex(isdefined(self.broadcasttype), "A type was not specified on this broadcast. Player Broadcasting won't know which system to hand it off to.");
    return self.broadcasttype;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ed
// Size: 0xb
function function_cf54c2c8650d9688() {
    return self.uniqueid;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x901
// Size: 0xb
function function_178a0ef658e52420() {
    return self.groupid;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x915
// Size: 0xb
function function_9ece756d9ac04e6d() {
    return self.var_8e09c79789611261;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x929
// Size: 0xb
function function_8362248b8fb9637f() {
    return self.var_c113183796dfd41;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93d
// Size: 0x15
function function_a2b3a19c012e474b(datatracker) {
    self.var_c113183796dfd41 = datatracker;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95a
// Size: 0x15
function function_15c75941af255c67(var_15309dae6e19a117) {
    self.var_8e09c79789611261 = var_15309dae6e19a117;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x977
// Size: 0x4f
function private function_365e789cf7ee1a2f(player, broadcastinstance) {
    if (!isdefined(player) || !isdefined(player.guid)) {
        return false;
    }
    playerseen = broadcastinstance.var_f16900d47079d51f[player.guid];
    return istrue(playerseen);
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9cf
// Size: 0x2d
function private function_d06b740fbbece1eb(player, broadcastinstance) {
    broadcastinstance.var_f16900d47079d51f[player.guid] = 1;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0x2c
function private function_d1b2e5b614aa5495(player, broadcastinstance) {
    broadcastinstance.var_f16900d47079d51f[player.guid] = 0;
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa38
// Size: 0x15
function private function_47c20e1020b91ac1(player, params) {
    return true;
}

/#

    // Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0xa56
    // Size: 0x30
    function private function_28d42a2b1f0b3eab(player, broadcastinstance, broadcastcommand) {
        clientprint(player, broadcastinstance.text);
    }

#/

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa8e
// Size: 0x5d
function private function_c5de94ea3ad8f2e6(var_2bf0f676fdb4d9d9) {
    player = var_2bf0f676fdb4d9d9.player;
    broadcastinstance = var_2bf0f676fdb4d9d9.broadcastinstance;
    function_d06b740fbbece1eb(player, broadcastinstance);
    if (broadcastinstance function_be70a75a57d524fe()) {
        function_790e679b0f2d121e(player, broadcastinstance);
    }
    function_bb9bc4c538a84c97(player, broadcastinstance, 0);
}

// Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaf3
// Size: 0x8e
function private function_bb9bc4c538a84c97(player, broadcastinstance, broadcastcommand) {
    if (!isdefined(player)) {
        assertmsg("Attempting to broadcast to a player that is undefined. Did they disconnect? Broadcast Unique Id: " + broadcastinstance function_cf54c2c8650d9688() + ". Command Type: " + broadcastcommand);
        return;
    }
    broadcasttype = broadcastinstance function_54ad2295d6995862();
    if (isdefined(broadcasttype)) {
        assertex(isdefined(level.var_19f9544004bec048[broadcasttype]), "This player broadcast message type has not been registered with a handoff function.");
        [[ level.var_19f9544004bec048[broadcasttype] ]](player, broadcastinstance, broadcastcommand);
        /#
            function_83152f28715ba19f(player, broadcastinstance, broadcastcommand);
        #/
    }
}

/#

    // Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xb89
    // Size: 0x36
    function function_b3bcffc014571bbd(broadcastinstance) {
        var_be886913a2deb841 = "<dev string:xd8>" + broadcastinstance function_54ad2295d6995862() + "<dev string:xeb>" + broadcastinstance function_cf54c2c8650d9688();
        return var_be886913a2deb841;
    }

    // Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xbc7
    // Size: 0x23
    function private function_7f891130ef74a0() {
        enableddvar = getdvarint(@"hash_26b7e4a2ecc0df79", 0);
        return enableddvar != 0;
    }

    // Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0xbf2
    // Size: 0x5c
    function private function_83152f28715ba19f(player, broadcastinstance, broadcastcommand) {
        if (!function_7f891130ef74a0()) {
            return;
        }
        iprintln(function_fc8d2e5257bc9932() + "<dev string:xf8>" + "<dev string:x10d>" + player.guid + function_b3bcffc014571bbd(broadcastinstance) + function_8fcfb1771a833c28(broadcastcommand));
    }

    // Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0xc56
    // Size: 0x6c
    function private function_747e8968c9de65cd(player, broadcastinstance, broadcastcommand, details) {
        if (!function_7f891130ef74a0()) {
            return;
        }
        iprintln(function_fc8d2e5257bc9932() + "<dev string:x117>" + "<dev string:x10d>" + player.guid + function_b3bcffc014571bbd(broadcastinstance) + function_8fcfb1771a833c28(broadcastcommand) + "<dev string:x133>" + details);
    }

    // Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0xcca
    // Size: 0x45
    function private function_8fcfb1771a833c28(broadcastcommand) {
        commandstring = "<dev string:x13e>";
        if (broadcastcommand == 1) {
            commandstring = "<dev string:x142>";
        } else if (broadcastcommand == 2) {
            commandstring = "<dev string:x149>";
        }
        return "<dev string:x150>" + commandstring;
    }

    // Namespace namespace_945eaec008a2a2b0 / namespace_236d5e32d01e927d
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xd17
    // Size: 0xb
    function private function_fc8d2e5257bc9932() {
        return "<dev string:x160>";
    }

#/
