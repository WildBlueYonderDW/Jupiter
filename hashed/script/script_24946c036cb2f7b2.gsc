// mwiii decomp prototype
#using script_54f6d121e91434f8;
#using script_24f248b33b79e48d;
#using script_185660037b9236c1;
#using script_3ab210ea917601e7;
#using script_6617e2f2bb62b52b;
#using script_24946c036cb2f7b2;
#using script_1f97a44d1761c919;
#using script_600b944a95c3a7bf;
#using script_3e2f8cc477d57433;

#namespace namespace_c3cbdb17ee537af1;

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188
// Size: 0x17
function function_cb146e445d78e9ee() {
    self.var_741c4f3150e30c83 = function_195ff27978a91a68(self, 1, 0, 0);
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6
// Size: 0x7d
function function_a7679b1e7a48f91(activationname, players, var_c3b480c3f8207bab) {
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return 0;
    }
    var_d4464743d0edff8c = function_a6dfaa6e79adbc09(activationname);
    if (!isdefined(var_d4464743d0edff8c)) {
        return;
    }
    if (isdefined(var_d4464743d0edff8c.delay)) {
        wait(var_d4464743d0edff8c.delay);
    }
    return function_5b45cad5c8f016ab(var_d4464743d0edff8c.ref, players, 0, var_c3b480c3f8207bab);
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b
// Size: 0xa9
function function_43007b614b2eb884(activationname, players, cooldownseconds) {
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return 0;
    }
    var_d4464743d0edff8c = function_a6dfaa6e79adbc09(activationname);
    if (!isdefined(var_d4464743d0edff8c)) {
        return;
    }
    if (isdefined(var_d4464743d0edff8c.delay)) {
        wait(var_d4464743d0edff8c.delay);
    }
    var_1d1eecf1ed7cbdb0 = namespace_9718b9a169c3ead0::function_d52f11eff492795d(players[0], 1);
    if (!isdefined(var_1d1eecf1ed7cbdb0)) {
        return;
    }
    var_1d1eecf1ed7cbdb0 = var_d4464743d0edff8c.ref + var_1d1eecf1ed7cbdb0;
    function_7175613cab6db0dc(var_1d1eecf1ed7cbdb0, var_d4464743d0edff8c.ref, players, cooldownseconds);
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2db
// Size: 0x4e
function function_5b45cad5c8f016ab(eventref, players, includedeadplayers, var_c3b480c3f8207bab) {
    var_2787b644956f87d9 = function_73e12b91e73e2977(players);
    if (var_2787b644956f87d9.size == 0) {
        return 0;
    }
    return namespace_446fc987a980892f::playevent(eventref, var_2787b644956f87d9, 0, includedeadplayers, var_c3b480c3f8207bab);
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x331
// Size: 0x41
function function_90db3e7d7b085484(var_1d1eecf1ed7cbdb0, eventref, players) {
    var_2787b644956f87d9 = function_73e12b91e73e2977(players);
    if (var_2787b644956f87d9.size == 0) {
        return 0;
    }
    return namespace_446fc987a980892f::function_9b411de07c46bddc(eventref, var_2787b644956f87d9, 0, var_1d1eecf1ed7cbdb0);
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37a
// Size: 0x8c
function function_7175613cab6db0dc(var_1d1eecf1ed7cbdb0, eventref, players, cooldownseconds) {
    if (!isdefined(self.var_11ac05ea8fa7826d)) {
        self.var_11ac05ea8fa7826d = [];
    }
    currenttime = gettime();
    var_73ddaf989477e28c = self.var_11ac05ea8fa7826d[var_1d1eecf1ed7cbdb0];
    if (isdefined(var_73ddaf989477e28c) && var_73ddaf989477e28c + cooldownseconds * 1000 > currenttime) {
        return;
    }
    if (function_5b45cad5c8f016ab(eventref, players)) {
        self.var_11ac05ea8fa7826d[var_1d1eecf1ed7cbdb0] = currenttime;
    }
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40d
// Size: 0xd4
function private function_a6dfaa6e79adbc09(activationname) {
    if (!isdefined(activationname)) {
        return undefined;
    }
    var_4fb0bb8290e39fb3 = function_e38f1d6d5a208fe1(activationname);
    /#
        assertex(var_4fb0bb8290e39fb3.size == 1, "get_overlord_event_info_from_activiation_name: Multiple VO definition found for " + activationname + ". Check data.");
    #/
    broadcastdata = var_4fb0bb8290e39fb3[0] function_7437a8d48556e45e();
    /#
        assertex(broadcastdata.size == 1, "get_overlord_event_info_from_activiation_name: Incorrect number of broadcast data for " + activationname + ". Check data.");
    #/
    var_a0df226025d98d74 = spawnstruct();
    var_a0df226025d98d74.ref = function_84ac089886facee5(broadcastdata[0]);
    var_a0df226025d98d74.delay = function_ffbb8d6b4076cfa7(broadcastdata[0]);
    var_a0df226025d98d74.isconversation = function_63b7c6f0e6f2a9f7(broadcastdata[0]);
    var_a0df226025d98d74.var_a992c85bbf2c3bd6 = function_63b7c6f0e6f2a9f7(broadcastdata[0]);
    return var_a0df226025d98d74;
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e9
// Size: 0x9f
function private function_73e12b91e73e2977(players) {
    var_2787b644956f87d9 = [];
    if (isdefined(self.var_741c4f3150e30c83) && isdefined(players) && isarray(players)) {
        foreach (player in players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!function_93587d5ba6247f36(self.var_741c4f3150e30c83, player)) {
                continue;
            }
            var_2787b644956f87d9[var_2787b644956f87d9.size] = player;
        }
    }
    return var_2787b644956f87d9;
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x590
// Size: 0xcf
function function_d52f11eff492795d(player, var_45e792783f2a92ab, var_81c927dcd9cba1f9) {
    key = undefined;
    if (isdefined(player)) {
        if (istrue(var_45e792783f2a92ab)) {
            if (isdefined(player.team) && isdefined(player.sessionsquadid)) {
                key = "team:" + player.team + "id:" + player.sessionsquadid;
            }
        } else if (isdefined(player.guid)) {
            key = "playerguid:" + player.guid;
        }
    }
    if (isdefined(key) && istrue(var_81c927dcd9cba1f9) && isdefined(self)) {
        activityid = namespace_4fda5d7358015a06::function_f0f498aed6f8fa5d(self);
        if (isdefined(activityid)) {
            key = "activityid:" + activityid + key;
        }
    }
    return key;
}

// Namespace namespace_c3cbdb17ee537af1 / namespace_9718b9a169c3ead0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667
// Size: 0xbd
function function_1abf09c903e6c16b(players, lootref) {
    if (!isdefined(players) || !isarray(players) || players.size == 0) {
        return false;
    }
    if (!isdefined(lootref)) {
        return false;
    }
    lootid = namespace_38b993c4618e76cd::getlootidfromref(lootref);
    if (!isdefined(lootid)) {
        return false;
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        backpackindex = player namespace_feea61bc660e9e0f::function_4776284a348ebb6a(lootid);
        if (backpackindex != -1) {
            return true;
        }
    }
    return false;
}

