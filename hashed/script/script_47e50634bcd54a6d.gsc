// mwiii decomp prototype
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using script_3d2770dc09c1243;

#namespace namespace_93ef1ea062af3119;

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d
// Size: 0xea
function init() {
    level.var_367c15041e69a2a9.traversal = spawnstruct();
    level.var_367c15041e69a2a9.traversal.traversals = function_c85c46ce3b5439ce(getallnodes());
    level.var_367c15041e69a2a9.traversal.total = level.var_367c15041e69a2a9.traversal.traversals.size;
    level.var_367c15041e69a2a9.traversal.var_bb9730f6ce13f387 = 0;
    /#
        level thread function_a087eafdd1fd738a();
    #/
    level.var_367c15041e69a2a9.traversal.var_c5e2c99115b2c8df = [];
    level.var_367c15041e69a2a9.traversal.var_eb99c06f565b2a3b = [];
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fe
// Size: 0x2bd
function private function_c85c46ce3b5439ce(var_5836c6d53a5f99a2) {
    var_bbee5a437d741fb6 = [];
    endnode = [];
    foreach (node in var_5836c6d53a5f99a2) {
        if (!isdefined(node.type)) {
            continue;
        }
        nodename = function_df46390ffcc4d8f8(node);
        if (!isdefined(nodename)) {
            continue;
        }
        if (node.type == "Begin") {
            if (isdefined(var_bbee5a437d741fb6[nodename])) {
                report("duplicated name: " + nodename + ", node1:" + node.origin + ", node2:" + var_bbee5a437d741fb6[nodename].origin);
                continue;
            }
            var_bbee5a437d741fb6[nodename] = node;
        } else if (node.type == "End") {
            if (isdefined(endnode[nodename])) {
                report("duplicated name: " + nodename + ", node1:" + node.origin + ", node2:" + endnode[nodename].origin);
            } else {
                endnode[nodename] = node;
            }
        }
    }
    var_66b7a5f6f62447b6 = getarraykeys(var_bbee5a437d741fb6);
    result = [];
    foreach (name in var_66b7a5f6f62447b6) {
        if (isdefined(endnode[name])) {
            size = result.size;
            result[size] = [];
            result[size][0] = var_bbee5a437d741fb6[name];
            result[size][1] = endnode[name];
            var_bbee5a437d741fb6[name] = undefined;
            endnode[name] = undefined;
        }
    }
    if (var_bbee5a437d741fb6.size > 0) {
        foreach (key, value in var_bbee5a437d741fb6) {
            report("unpaired begin node: " + key + ", " + value.origin);
        }
    }
    if (endnode.size > 0) {
        foreach (key, value in endnode) {
            report("unpaired end node: " + key + ", " + value.origin);
        }
    }
    return result;
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c3
// Size: 0x2ea
function private report(var_889f3d7e1c1ea6b, bot, position, var_fde6cf296eb26748) {
    if (!istrue(level.var_367c15041e69a2a9.traversal.var_853b0ac91bee4934)) {
        header = "#time; #situation; #bot; #lastPosition; #traversalName; #traversalType; #traversalBegin; #traversalEnd; #comment";
        function_9a0a24de119b078a("Traversal", header);
        level.var_367c15041e69a2a9.traversal.var_853b0ac91bee4934 = 1;
    }
    var_11217a46ee62df5c = "";
    if (isdefined(bot)) {
        var_11217a46ee62df5c = bot getentitynumber();
    }
    lastposition = "";
    if (isdefined(position)) {
        lastposition = position;
    }
    var_6bec857a97eaade6 = "";
    var_99b287b76f4b63a5 = "";
    endposition = "";
    traversaltype = "";
    if (isdefined(var_fde6cf296eb26748)) {
        var_6bec857a97eaade6 = function_df46390ffcc4d8f8(var_fde6cf296eb26748[0]);
        var_99b287b76f4b63a5 = var_fde6cf296eb26748[0].origin;
        endposition = var_fde6cf296eb26748[1].origin;
        level.var_367c15041e69a2a9.traversal.var_eb99c06f565b2a3b[level.var_367c15041e69a2a9.traversal.var_eb99c06f565b2a3b.size] = var_fde6cf296eb26748;
        traversaltype = var_fde6cf296eb26748[0].animscript;
    }
    comment = "";
    if (isdefined(bot.var_367c15041e69a2a9) && isdefined(bot.var_367c15041e69a2a9.comment)) {
        comment = bot.var_367c15041e69a2a9.comment;
    }
    var_444a5451f436094a = gettime() + "; " + var_889f3d7e1c1ea6b + "; " + var_11217a46ee62df5c + "; " + lastposition + "; " + var_6bec857a97eaade6 + "; " + traversaltype + "; " + var_99b287b76f4b63a5 + "; " + endposition + "; " + comment;
    function_9a0a24de119b078a("Traversal", var_444a5451f436094a);
    /#
        if (isdefined(level.var_367c15041e69a2a9.traversal.var_31e45429b9998458)) {
            level.var_367c15041e69a2a9.traversal.var_31e45429b9998458 = level.var_367c15041e69a2a9.traversal.var_31e45429b9998458 + 1;
        } else {
            level.var_367c15041e69a2a9.traversal.var_31e45429b9998458 = 1;
        }
        function_f2bc01a7b0321f52("disable_movement", endposition, endposition + (0, 0, 100), var_fde6cf296eb26748, level.var_367c15041e69a2a9.traversal.var_31e45429b9998458);
    #/
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b4
// Size: 0x5c
function private function_a38df45ab16839f3(var_889f3d7e1c1ea6b, bot) {
    if (!function_b9b4e6815c62b52f(bot.var_367c15041e69a2a9.traversal, var_889f3d7e1c1ea6b)) {
        report(var_889f3d7e1c1ea6b, bot, bot.origin, bot.var_367c15041e69a2a9.traversal);
    }
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x917
// Size: 0x43
function private function_df46390ffcc4d8f8(node) {
    if (isdefined(node.target)) {
        return node.target;
    }
    if (isdefined(node.targetname)) {
        return node.targetname;
    }
    return undefined;
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x962
// Size: 0x139
function function_ffd4129f1032e796() {
    /#
        assert(!isdefined(self.var_367c15041e69a2a9.traversal));
    #/
    self botsetdifficultysetting("slideChance", 0);
    self.var_367c15041e69a2a9.traversal = function_b5224992bfb5b100();
    if (!isdefined(self.var_367c15041e69a2a9.traversal)) {
        return;
    }
    self.var_367c15041e69a2a9.onplayerkilled = &onplayerkilled;
    var_d22fdca158e266e = 25;
    var_7d2294c58a5c346 = 50;
    var_fc77e2b383d17ec9 = function_721588ae374756b5(self.var_367c15041e69a2a9.traversal[0].origin, var_d22fdca158e266e, var_7d2294c58a5c346);
    if (isdefined(var_fc77e2b383d17ec9)) {
        if (isstartstr(var_fc77e2b383d17ec9, "inaccurate")) {
            self.var_367c15041e69a2a9.comment = var_fc77e2b383d17ec9;
        } else {
            function_a38df45ab16839f3("teleport failed/" + var_fc77e2b383d17ec9, self);
            return;
        }
    }
    /#
        thread function_dec8f2a03738931b(self.var_367c15041e69a2a9.traversal);
    #/
    function_f3f364499c3a6ecc(self, self.var_367c15041e69a2a9.traversal);
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaa2
// Size: 0x158
function private function_b5224992bfb5b100() {
    /#
        var_df608cf67a97c2ff = getdvarvector(@"hash_19539497cc24bc9");
        if (isdefined(var_df608cf67a97c2ff) && level.players.size == 2) {
            level.var_367c15041e69a2a9.traversal.var_c5e2c99115b2c8df = [];
            return function_5a02aa402b327557(var_df608cf67a97c2ff);
        }
    #/
    if (level.var_367c15041e69a2a9.traversal.traversals.size == 0) {
        return undefined;
    }
    /#
        assert(level.var_367c15041e69a2a9.traversal.traversals.size > 0);
    #/
    for (index = 0; index < level.var_367c15041e69a2a9.traversal.traversals.size; index++) {
        current = level.var_367c15041e69a2a9.traversal.traversals[index];
        if (function_25eb6fee59a46e3a(current)) {
            level.var_367c15041e69a2a9.traversal.traversals = array_remove_index(level.var_367c15041e69a2a9.traversal.traversals, index);
            return current;
        }
    }
    return undefined;
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc02
// Size: 0x12a
function private function_25eb6fee59a46e3a(traversal) {
    var_92c13c6437a38a60 = 64;
    foreach (player in level.players) {
        if (!isbot(player) || !function_ded80385ea7471db(player)) {
            continue;
        }
        if (isdefined(player.var_367c15041e69a2a9) && isdefined(player.var_367c15041e69a2a9.traversal)) {
            isclose = distance(traversal[0].origin, player.var_367c15041e69a2a9.traversal[1].origin) < var_92c13c6437a38a60 || distance(traversal[1].origin, player.var_367c15041e69a2a9.traversal[0].origin) < var_92c13c6437a38a60;
            if (isclose) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd34
// Size: 0x288
function private function_f3f364499c3a6ecc(bot, traversal) {
    var_cbef341a3aeef001 = 30;
    var_4112bb19cc3c6a26 = 60;
    endposition = bot.var_367c15041e69a2a9.traversal[1].origin;
    begintime = function_71b519a5e0525acc();
    dist = distance(bot.var_367c15041e69a2a9.traversal[0].origin, endposition);
    var_68291b1086bff85 = (dist / var_4112bb19cc3c6a26 + 1) * 1000;
    bot function_9e400058ef021b03(endposition, var_cbef341a3aeef001);
    var_4ddf9c3e5ceddc6 = 0;
    var_172ffc4a18f645a9 = 15000;
    while (1) {
        result = function_b564050a363f08ec(bot, 0.1);
        if (result == "goal") {
            timeused = function_71b519a5e0525acc() - begintime;
            var_ec553be653a5bbaa = timeused / 1000 + "/" + var_68291b1086bff85 / 1000;
            if (!var_4ddf9c3e5ceddc6) {
                function_a38df45ab16839f3("never used traversal", bot);
            } else {
                if (timeused <= var_68291b1086bff85) {
                    function_c6794b6366f34ce2(bot.var_367c15041e69a2a9.traversal, "on time goal " + var_ec553be653a5bbaa);
                } else {
                    function_c6794b6366f34ce2(bot.var_367c15041e69a2a9.traversal, "late goal " + var_ec553be653a5bbaa);
                }
                level.var_367c15041e69a2a9.traversal.var_bb9730f6ce13f387++;
            }
            break;
        } else if (result == "timeout") {
            if (!var_4ddf9c3e5ceddc6) {
                var_4ddf9c3e5ceddc6 = bot function_3e76c64a7bfe7be9(bot.var_367c15041e69a2a9.traversal[0].origin, bot.var_367c15041e69a2a9.traversal[1].origin);
            }
            timeused = function_71b519a5e0525acc() - begintime;
            if (gettimescale() == 4) {
                var_769dcc5659a2d870 = var_172ffc4a18f645a9 * 5.5 / var_172ffc4a18f645a9 / 1000 / 4;
            } else {
                var_769dcc5659a2d870 = var_172ffc4a18f645a9;
            }
            if (timeused > var_769dcc5659a2d870) {
                function_a38df45ab16839f3("time > " + var_172ffc4a18f645a9 / 1000 + "s", bot);
                break;
            }
        } else {
            function_a38df45ab16839f3(result, bot);
            break;
        }
    }
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfc3
// Size: 0x51
function private onplayerkilled(var_642470e1abc1bbf9) {
    if (isdefined(self.var_367c15041e69a2a9) && isdefined(self.var_367c15041e69a2a9.traversal)) {
        function_a38df45ab16839f3("death", self);
        self.var_367c15041e69a2a9.traversal = undefined;
    }
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101b
// Size: 0x10f
function function_60524de5341e2666() {
    if (level.var_367c15041e69a2a9.traversal.var_bb9730f6ce13f387 + level.var_367c15041e69a2a9.traversal.var_eb99c06f565b2a3b.size >= level.var_367c15041e69a2a9.traversal.total) {
        var_444a5451f436094a = "test result: " + level.var_367c15041e69a2a9.traversal.total + " traversals " + level.var_367c15041e69a2a9.traversal.var_bb9730f6ce13f387 + " succeed " + level.var_367c15041e69a2a9.traversal.var_eb99c06f565b2a3b.size + " failed";
        function_9a0a24de119b078a("Traversal", var_444a5451f436094a);
    }
    if (isdefined(self)) {
        self botsetflag("disable_movement", 0);
        self.var_367c15041e69a2a9.traversal = undefined;
    }
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1131
// Size: 0x3b
function function_3113f44ebafe71b1() {
    return level.var_367c15041e69a2a9.traversal.traversals.size > 0 || isdefined(self.var_367c15041e69a2a9.traversal);
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1174
// Size: 0x24e
function private function_a087eafdd1fd738a() {
    /#
        level endon("<unknown string>");
        var_ca95f7370067862a = [];
        traversaltype = [];
        foreach (var_c11232f663e821c0 in level.var_367c15041e69a2a9.traversal.traversals) {
            name = function_df46390ffcc4d8f8(var_c11232f663e821c0[0]);
            var_ca95f7370067862a[name] = var_c11232f663e821c0[0].origin;
            traversaltype[name] = var_c11232f663e821c0[0].animscript;
        }
        while (1) {
            wait(20);
            var_f54dbe8ac62a891d = 0;
            foreach (player in level.players) {
                if (!isbot(player)) {
                    continue;
                }
                if (isdefined(player.var_367c15041e69a2a9.traversal)) {
                    var_f54dbe8ac62a891d = 1;
                    break;
                }
            }
            if (!var_f54dbe8ac62a891d && level.var_367c15041e69a2a9.traversal.traversals.size == 0) {
                break;
            }
        }
        foreach (k, v in level.var_367c15041e69a2a9.traversal.var_c5e2c99115b2c8df) {
            outputstring = v.size + "<unknown string>" + k + "<unknown string>" + var_ca95f7370067862a[k] + "<unknown string>" + traversaltype[k] + "<unknown string>";
            outputstring = outputstring + function_996b01cd49d0128d(v, "<unknown string>");
            for (i = 0; i < 3 - v.size; i++) {
                outputstring = outputstring + "<unknown string>";
            }
            function_9a0a24de119b078a("<unknown string>", outputstring);
        }
    #/
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13c9
// Size: 0x9d
function private function_b9b4e6815c62b52f(traversal, str) {
    function_c6794b6366f34ce2(traversal, str);
    var_95b4c05a30e3944a = level.var_367c15041e69a2a9.traversal.var_c5e2c99115b2c8df[function_df46390ffcc4d8f8(traversal[0])].size;
    if (var_95b4c05a30e3944a < 3) {
        level.var_367c15041e69a2a9.traversal.traversals = array_add(level.var_367c15041e69a2a9.traversal.traversals, traversal);
        return 1;
    }
    return 0;
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x146e
// Size: 0xba
function private function_c6794b6366f34ce2(traversal, str) {
    name = function_df46390ffcc4d8f8(traversal[0]);
    if (!isdefined(level.var_367c15041e69a2a9.traversal.var_c5e2c99115b2c8df[name])) {
        level.var_367c15041e69a2a9.traversal.var_c5e2c99115b2c8df[name] = [];
    }
    var_46f432042b3473d8 = level.var_367c15041e69a2a9.traversal.var_c5e2c99115b2c8df[name].size;
    level.var_367c15041e69a2a9.traversal.var_c5e2c99115b2c8df[name][var_46f432042b3473d8] = str;
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x152f
// Size: 0x8d
function private function_5a02aa402b327557(pos) {
    /#
        foreach (var_c11232f663e821c0 in level.var_367c15041e69a2a9.traversal.traversals) {
            if (distance(pos, var_c11232f663e821c0[0].origin) < 8) {
                return var_c11232f663e821c0;
            }
        }
        return undefined;
    #/
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x15c3
// Size: 0x82
function private function_8c1b5b6ac49d6b0e(name) {
    /#
        foreach (var_c11232f663e821c0 in level.var_367c15041e69a2a9.traversal.traversals) {
            if (name == function_df46390ffcc4d8f8(var_c11232f663e821c0[0])) {
                return var_c11232f663e821c0;
            }
        }
        return undefined;
    #/
}

// Namespace namespace_93ef1ea062af3119/namespace_e52f2dbcddf04577
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x164c
// Size: 0xa3
function function_dec8f2a03738931b(traversal) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (1) {
            sphere(traversal[0].origin, 30, (0, 1, 0), 0, 1);
            sphere(traversal[1].origin, 30, (0, 0, 1), 0, 1);
            draw_arrow_time(traversal[0].origin, traversal[1].origin, (1, 0, 0), 1);
            waitframe();
        }
    #/
}

