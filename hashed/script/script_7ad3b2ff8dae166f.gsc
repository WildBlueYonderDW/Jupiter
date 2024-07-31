#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_e422f53ac4bc98a4;

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x14b
// Size: 0x78
function autoexec main() {
    level.var_b8057c65baf0784a = spawnstruct();
    level.var_b8057c65baf0784a.init = &function_a114d6863af2f149;
    level.var_b8057c65baf0784a.var_d9f305202f6f3913 = &function_784a9a0ec8d203b9;
    level callback::add("killstreak_can_trigger", &function_3fbc4888ac56a);
    level callback::add("killstreak_finish_use", &function_b5001bf4e9beeb3e);
    level callback::add("killstreak_trigger_failed", &function_b5001bf4e9beeb3e);
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb
// Size: 0x2d0
function function_a114d6863af2f149() {
    if (!isdefined(level.gamemodebundle.var_671c47a45645026c)) {
        return;
    }
    var_e4fea1d5467252b4 = getscriptbundle(level.gamemodebundle.var_671c47a45645026c);
    level.var_e422f53ac4bc98a4 = {#match:{#deployables:[]}, #teams:[], #rules:[]};
    foreach (var_f1ed926be0dab9ce in var_e4fea1d5467252b4.var_8fd13818a31a01ba) {
        foreach (rule in var_f1ed926be0dab9ce.var_3c85425284934a4f) {
            assertex(!isdefined(level.var_e422f53ac4bc98a4.rules[rule.name]), "<dev string:x1c>");
            if (rule.type == #"hash_4af11b8034b04aea") {
                level.var_e422f53ac4bc98a4.rules[rule.name] = rule;
                if (isdefined(rule.var_2c1ee79078c7bc2a.var_ffcfa1d2741472f1) && isdefined(rule.var_2c1ee79078c7bc2a.var_be4e19aac3ecfae9)) {
                    assert(rule.var_2c1ee79078c7bc2a.var_be4e19aac3ecfae9 <= rule.var_2c1ee79078c7bc2a.var_ffcfa1d2741472f1, "<dev string:x42>");
                }
                if (isdefined(rule.var_2c1ee79078c7bc2a.var_ffcfa1d2741472f1) && isdefined(rule.var_2c1ee79078c7bc2a.perplayer)) {
                    assert(rule.var_2c1ee79078c7bc2a.perplayer <= rule.var_2c1ee79078c7bc2a.var_ffcfa1d2741472f1, "<dev string:x85>");
                }
                if (isdefined(rule.var_2c1ee79078c7bc2a.var_be4e19aac3ecfae9) && isdefined(rule.var_2c1ee79078c7bc2a.perplayer)) {
                    assert(rule.var_2c1ee79078c7bc2a.perplayer <= rule.var_2c1ee79078c7bc2a.var_be4e19aac3ecfae9, "<dev string:xca>");
                }
                continue;
            }
            assertmsg("<dev string:x10e>");
        }
    }
    level.var_63121fffa39a5238 = 1;
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a3
// Size: 0xa4
function function_784a9a0ec8d203b9(bundle) {
    if (!istrue(level.var_63121fffa39a5238)) {
        return;
    }
    if (isdefined(bundle.var_e422f53ac4bc98a4)) {
        foreach (rule in bundle.var_e422f53ac4bc98a4) {
            assertex(isdefined(level.var_e422f53ac4bc98a4.rules[rule.name]), "<dev string:x132>");
        }
    }
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x54f
// Size: 0x91
function private function_3fbc4888ac56a(params) {
    if (!istrue(level.var_63121fffa39a5238)) {
        params.var_ea46784be09b48e0 = 1;
        return;
    }
    player = params.player;
    id = params.bundle.var_19fb085453713468;
    var_dc472c6c6f75536c = params.bundle.var_e422f53ac4bc98a4;
    params.var_ea46784be09b48e0 = function_de91481004edba65(player, id, var_dc472c6c6f75536c);
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x5e8
// Size: 0x212
function private function_de91481004edba65(player, id, var_dc472c6c6f75536c) {
    if (!isdefined(var_dc472c6c6f75536c)) {
        return true;
    }
    if (!isdefined(player.var_e422f53ac4bc98a4)) {
        player.var_e422f53ac4bc98a4 = {#deployables:[]};
    }
    if (!isdefined(player.var_e422f53ac4bc98a4.deployables[id])) {
        player.var_e422f53ac4bc98a4.deployables[id] = {#counts:[]};
    }
    if (!isdefined(level.var_e422f53ac4bc98a4.teams[player.team])) {
        level.var_e422f53ac4bc98a4.teams[player.team] = {#deployables:[]};
    }
    if (!isdefined(level.var_e422f53ac4bc98a4.teams[player.team].deployables[id])) {
        level.var_e422f53ac4bc98a4.teams[player.team].deployables[id] = {#counts:[]};
    }
    if (!isdefined(level.var_e422f53ac4bc98a4.match.deployables[id])) {
        level.var_e422f53ac4bc98a4.match.deployables[id] = {#counts:[]};
    }
    errormsg = istrue(level.var_e422f53ac4bc98a4.rules[var_dc472c6c6f75536c[0].name].var_8ff5c508700ace25) ? "KILLSTREAKS/AIR_SPACE_TOO_CROWDED" : "KILLSTREAKS/TOO_MANY_KILLSTREAK";
    if (!function_d56747948459c017(player, id, var_dc472c6c6f75536c)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            [[ getsharedfunc("hud", "showErrorMessage") ]](errormsg);
        }
        return false;
    }
    function_4b4a7fc5dbb7f51f(player, id, var_dc472c6c6f75536c);
    return true;
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x803
// Size: 0x2fc
function private function_d56747948459c017(player, id, var_dc472c6c6f75536c) {
    foreach (var_34efed7ae0989f08 in var_dc472c6c6f75536c) {
        rule = level.var_e422f53ac4bc98a4.rules[var_34efed7ae0989f08.name];
        if (rule.type == #"hash_4af11b8034b04aea") {
            if (!isdefined(player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name])) {
                player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
            }
            if (!isdefined(level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name])) {
                level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
            }
            if (!isdefined(level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name])) {
                level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
            }
            playercount = player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name];
            teamcount = level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name];
            matchcount = level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name];
            if (!function_d0a009b77b2abfeb(rule.var_2c1ee79078c7bc2a, playercount, teamcount, matchcount)) {
                return false;
            }
        }
    }
    return true;
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xb08
// Size: 0x2f6
function private function_4b4a7fc5dbb7f51f(player, id, var_dc472c6c6f75536c) {
    foreach (var_34efed7ae0989f08 in var_dc472c6c6f75536c) {
        rule = level.var_e422f53ac4bc98a4.rules[var_34efed7ae0989f08.name];
        if (rule.type == #"hash_4af11b8034b04aea") {
            if (!isdefined(player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name])) {
                player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
            }
            if (!isdefined(level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name])) {
                level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
            }
            if (!isdefined(level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name])) {
                level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
            }
            playercount = player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name];
            teamcount = level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name];
            matchcount = level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name];
            function_82da19a6031f4815(rule.var_2c1ee79078c7bc2a, playercount, teamcount, matchcount);
        }
    }
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xe06
// Size: 0x8c
function private function_b5001bf4e9beeb3e(params) {
    if (!istrue(level.var_63121fffa39a5238)) {
        return;
    }
    streakinfo = params.streakinfo;
    owner = streakinfo.owner;
    bundle = level.streakglobals.streakbundles[streakinfo.streakname];
    function_f918710cd8320f22(owner, bundle.var_19fb085453713468, bundle.var_e422f53ac4bc98a4);
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xe9a
// Size: 0x30c
function private function_f918710cd8320f22(player, id, var_dc472c6c6f75536c) {
    if (isdefined(var_dc472c6c6f75536c) && isdefined(player.var_e422f53ac4bc98a4)) {
        foreach (var_34efed7ae0989f08 in var_dc472c6c6f75536c) {
            rule = level.var_e422f53ac4bc98a4.rules[var_34efed7ae0989f08.name];
            if (rule.type == #"hash_4af11b8034b04aea") {
                if (!isdefined(player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name])) {
                    player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
                }
                if (!isdefined(level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name])) {
                    level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
                }
                if (!isdefined(level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name])) {
                    level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name] = {#count:undefined};
                }
                playercount = player.var_e422f53ac4bc98a4.deployables[id].counts[var_34efed7ae0989f08.name];
                teamcount = level.var_e422f53ac4bc98a4.teams[player.team].deployables[id].counts[var_34efed7ae0989f08.name];
                matchcount = level.var_e422f53ac4bc98a4.match.deployables[id].counts[var_34efed7ae0989f08.name];
                function_153a5eceee7d579c(rule.var_2c1ee79078c7bc2a, playercount, teamcount, matchcount);
            }
        }
    }
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x11ae
// Size: 0xd9
function private function_d0a009b77b2abfeb(var_2c1ee79078c7bc2a, playercount, teamcount, matchcount) {
    if (isdefined(var_2c1ee79078c7bc2a.perplayer) && isdefined(playercount.count) && playercount.count >= var_2c1ee79078c7bc2a.perplayer) {
        return false;
    }
    if (isdefined(var_2c1ee79078c7bc2a.var_be4e19aac3ecfae9) && isdefined(teamcount.count) && teamcount.count >= var_2c1ee79078c7bc2a.var_be4e19aac3ecfae9) {
        return false;
    }
    if (isdefined(var_2c1ee79078c7bc2a.var_ffcfa1d2741472f1) && isdefined(matchcount.count) && matchcount.count >= var_2c1ee79078c7bc2a.var_ffcfa1d2741472f1) {
        return false;
    }
    return true;
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1290
// Size: 0x109
function private function_82da19a6031f4815(var_2c1ee79078c7bc2a, playercount, teamcount, matchcount) {
    var_590c6775f1b37399 = isdefined(playercount.count) ? playercount.count + 1 : 1;
    var_4630a356021ae421 = isdefined(teamcount.count) ? teamcount.count + 1 : 1;
    var_185a1d050b79f38b = isdefined(matchcount.count) ? matchcount.count + 1 : 1;
    playercount.count = isdefined(var_2c1ee79078c7bc2a.perplayer) ? var_590c6775f1b37399 : undefined;
    teamcount.count = isdefined(var_2c1ee79078c7bc2a.var_be4e19aac3ecfae9) ? var_4630a356021ae421 : undefined;
    matchcount.count = isdefined(var_2c1ee79078c7bc2a.var_ffcfa1d2741472f1) ? var_185a1d050b79f38b : undefined;
}

// Namespace namespace_e422f53ac4bc98a4 / namespace_94b697e2ef867537
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x13a1
// Size: 0x140
function private function_153a5eceee7d579c(var_2c1ee79078c7bc2a, playercount, teamcount, matchcount) {
    if (isdefined(var_2c1ee79078c7bc2a.perplayer)) {
        assertex(playercount.count > 0, "<dev string:x153>");
        playercount.count -= 1;
        if (playercount.count == 0) {
            playercount.count = undefined;
        }
    }
    if (isdefined(var_2c1ee79078c7bc2a.var_be4e19aac3ecfae9)) {
        assertex(teamcount.count > 0, "<dev string:x196>");
        teamcount.count -= 1;
        if (teamcount.count == 0) {
            teamcount.count = undefined;
        }
    }
    if (isdefined(var_2c1ee79078c7bc2a.var_ffcfa1d2741472f1)) {
        assertex(matchcount.count > 0, "<dev string:x1d7>");
        matchcount.count -= 1;
        if (matchcount.count == 0) {
            matchcount.count = undefined;
        }
    }
}

