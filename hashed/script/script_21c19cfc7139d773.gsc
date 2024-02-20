// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using script_3fa1bf21e3fc7b80;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_3169ff42d7051988;

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x96
function init() {
    /#
        if (getdvarint(@"hash_ac8dfa3636c6e111", 0) == 0) {
            return;
        }
    #/
    if (getdvarint(@"hash_ac8dfa3636c6e111", 1) == 0) {
        return;
    }
    level.var_b19067b41fd5cfe8 = 1;
    level.var_bf269015710de2dd = getdvarint(@"hash_a6b52f16f3853a9a", 0);
    namespace_3c37cb17ade254d::registersharedfunc("ftue", "player_action", &function_1976438a8865ac27);
    namespace_3c37cb17ade254d::registersharedfunc("hud", "ftue_trigger_landed_hint", &ftue_trigger_landed_hint);
    function_c7c9735d7c22924d();
    /#
        namespace_e4c20df2c9115a56::registerhandlecommand(&function_8247afd76f1b33e0);
    #/
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x415
// Size: 0x38
function function_c7c9735d7c22924d() {
    level.var_7a5545c9a0d5bd22 = [];
    function_5a738b2f3b7d88d9("br_ftue_supply_box", &function_598fb861f3171c2);
    function_5a738b2f3b7d88d9("br_ftue_sliding", &function_46c63a68a41e27a1);
    level thread function_1126427a8a7a78cd();
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x454
// Size: 0x4f
function function_ae4b4de059d48ed(ref) {
    if (!isdefined(self.var_bab92b2713023287)) {
        self.var_bab92b2713023287 = [];
    }
    if (isdefined(self.var_bab92b2713023287[ref])) {
        self.var_bab92b2713023287[ref]++;
    } else {
        self.var_bab92b2713023287[ref] = 1;
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aa
// Size: 0x9e
function function_86471673929333b2() {
    if (!isdefined(self.var_bab92b2713023287)) {
        return;
    }
    foreach (ref, var_747268c0c64d85dc in self.var_bab92b2713023287) {
        self dlog_recordplayerevent("dlog_event_ftue_popup_aggregate", [0:"is_ftue_playlist", 1:istrue(level.var_bf269015710de2dd), 2:"ftue_popup_ref", 3:ref, 4:"ftue_popup_aggregate", 5:var_747268c0c64d85dc]);
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54f
// Size: 0x1ba
function function_1126427a8a7a78cd() {
    level endon("game_ended");
    level waittill("prematch_done");
    if (getdvarint(@"hash_24c29de93e1ad520", 0) == 1) {
        foreach (player in level.players) {
            if (isdefined(player) && !isbot(player)) {
                player function_bfd3ae5074922ca4();
            }
        }
    }
    var_c502004b162c0807 = 0;
    var_1b35d2d08ce39687 = getdvarint(@"hash_2e1526107156458a", 5);
    if (var_1b35d2d08ce39687 <= 0) {
        return;
    }
    wait(10);
    while (1) {
        foreach (player in level.players) {
            if (isdefined(player) && isalive(player)) {
                foreach (func in level.var_7a5545c9a0d5bd22) {
                    if (isdefined(func) && isfunction(func)) {
                        player [[ func ]]();
                    }
                }
                var_c502004b162c0807++;
            }
            if (var_c502004b162c0807 >= var_1b35d2d08ce39687) {
                var_c502004b162c0807 = 0;
                wait(getdvarint(@"hash_cae27c6584a113b1", 5000) / 1000);
            }
        }
        var_c502004b162c0807 = 0;
        wait(getdvarint(@"hash_cae27c6584a113b1", 5000) / 1000);
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710
// Size: 0x21
function function_5a738b2f3b7d88d9(ref, var_22224b63f727b191) {
    level.var_7a5545c9a0d5bd22[ref] = var_22224b63f727b191;
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x738
// Size: 0x2c
function function_df45ad64b9dc074b(ref) {
    id = namespace_3fe5772ba4970d56::function_bec00f5eabdb65ea(ref);
    return tablelookupbyrow(namespace_3fe5772ba4970d56::function_92b0a87f4e1a1d72(), id, 4);
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76c
// Size: 0x47
function function_470bb108e6b631cf(ref) {
    id = namespace_3fe5772ba4970d56::function_bec00f5eabdb65ea(ref);
    index = tablelookupbyrow(namespace_3fe5772ba4970d56::function_92b0a87f4e1a1d72(), id, 5);
    mask = 1 << index;
    return mask;
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bb
// Size: 0x33
function function_2f0ba374d69e645c(ref) {
    playerdata = function_f7754d7ad59b2f8b();
    mask = function_470bb108e6b631cf(ref);
    return istrue(playerdata & mask);
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f6
// Size: 0x1a9
function function_2da74cf301f9faa5(ref) {
    if (!isplayer(self) || isbot(self)) {
        return 0;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        return 0;
    }
    if (!isalive(self)) {
        return 0;
    }
    if (!namespace_4b0406965e556711::gameflag("br_ready_to_jump") && ref != "br_ftue_suggested_landing") {
        return 0;
    }
    if (namespace_7e17181d03156026::isinlaststand(self)) {
        return 0;
    }
    if (namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        return 0;
    }
    if (namespace_d9c77dc2a6fe29c6::isoob(self)) {
        return 0;
    }
    if (isdefined(self.br_kiosk)) {
        return 0;
    }
    if (function_eff88219461e17e6(ref)) {
        return 0;
    }
    if (function_2f0ba374d69e645c(ref)) {
        function_ae4b4de059d48ed(ref);
        return 0;
    }
    var_c03c24b6e883a1e1 = getdvarint(@"hash_185628cd0876e868", 12000);
    var_170b1ef196126ec4 = getdvarint(@"hash_c2618ebb2ca593d3", 3000);
    if (isdefined(self.var_453b42f68499e7fc) && gettime() - self.var_453b42f68499e7fc <= var_c03c24b6e883a1e1 + var_170b1ef196126ec4) {
        return 0;
    }
    if (ref != "br_ftue_gas" && function_24c5a8d31ae262f(self.origin) && ref != "br_ftue_suggested_landing") {
        return 0;
    }
    if (!function_8f15851557170215(ref)) {
        var_874ac286d355a3b2 = getdvarint(@"hash_1e4d5603f4b10d4d", 3000);
        var_196d2b0aaa33db5d = getdvarint(@"hash_3ebb28ca5b9b3010", 500);
        var_f2e473b17ca70265 = self getclosestenemy(var_874ac286d355a3b2, var_196d2b0aaa33db5d, 1);
        if (isdefined(var_f2e473b17ca70265) && !isagent(var_f2e473b17ca70265)) {
            return 0;
        }
        if (function_88c626bafd6057bf(self)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a7
// Size: 0x141
function function_8fdd864a86afe560(var_82076cfff3bd567a) {
    if (!isplayer(self) || isbot(self)) {
        return;
    }
    if (getdvarint(@"hash_7f7ff49d4459fedd", 0) == 1) {
        return;
    }
    if (!isdefined(var_82076cfff3bd567a)) {
        return;
    }
    var_394466c2ddb208cb = undefined;
    if (isvector(var_82076cfff3bd567a)) {
        var_394466c2ddb208cb = namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(16, var_82076cfff3bd567a + (0, 0, 82));
    } else if (isent(var_82076cfff3bd567a) && isplayer(var_82076cfff3bd567a) && isdefined(var_82076cfff3bd567a.team) && isalive(var_82076cfff3bd567a)) {
        if (self.team != var_82076cfff3bd567a.team) {
            var_394466c2ddb208cb = namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(6, var_82076cfff3bd567a.origin + (0, 0, 82), 0);
        } else {
            var_394466c2ddb208cb = namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(16, var_82076cfff3bd567a.origin + (0, 0, 82), var_82076cfff3bd567a getentitynumber());
        }
    } else if (var_82076cfff3bd567a getscriptableisloot()) {
        var_394466c2ddb208cb = namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(19, var_82076cfff3bd567a.origin, var_82076cfff3bd567a.index);
    } else {
        return;
    }
    if (isdefined(var_394466c2ddb208cb)) {
        thread namespace_ede58c1e66c2c280::_calloutmarkerping_predicted_timeout(var_394466c2ddb208cb);
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaef
// Size: 0x67
function function_1976438a8865ac27(ref, var_82076cfff3bd567a) {
    if (!isplayer(self) || isbot(self)) {
        return;
    }
    if (istrue(level.var_b19067b41fd5cfe8) && function_2da74cf301f9faa5(ref)) {
        namespace_3fe5772ba4970d56::function_65336cc44771776e(ref);
        thread function_8fdd864a86afe560(var_82076cfff3bd567a);
        thread function_d42afc6ef83aafca(ref);
        self playlocalsound("uin_iw9_ftue_tip_generic");
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5d
// Size: 0x3f
function function_78172a2df0f18be4(ref) {
    if (!isalive(self)) {
        return 0;
    }
    if (namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        return 0;
    }
    if (isdefined(self.br_kiosk)) {
        return 0;
    }
    if (function_88c626bafd6057bf(self)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba4
// Size: 0xe9
function function_d42afc6ef83aafca(ref, mask, bimmediate) {
    /#
        assert(isplayer(self));
    #/
    self endon("remove_ftue_popup");
    if (!istrue(bimmediate)) {
        waitduration = getdvarint(@"hash_185628cd0876e868", 12000) / 1000;
        wait(waitduration);
    }
    if (!function_78172a2df0f18be4(ref)) {
        function_240d450c0ec5f614(ref);
        return;
    }
    if (ref == "br_ftue_suggested_landing") {
        return;
    }
    if (istrue(level.var_b19067b41fd5cfe8)) {
        playerdata = function_f7754d7ad59b2f8b();
        mask = function_470bb108e6b631cf(ref);
        playerdata = playerdata | mask;
        function_9406f25ca59385d7(playerdata);
        var_c3cabd0fa5e17f4b = istrue(level.var_bf269015710de2dd);
        self dlog_recordplayerevent("dlog_event_ftue_popup_initial", [0:"ftue_popup_ref", 1:ref, 2:"is_ftue_playlist", 3:var_c3cabd0fa5e17f4b]);
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc94
// Size: 0x44
function function_d0ccb374806fe494() {
    if (isdefined(self.var_942b501d544b0e0a) && !function_2f0ba374d69e645c(self.var_942b501d544b0e0a)) {
        self notify("remove_ftue_popup");
        function_240d450c0ec5f614(self.var_942b501d544b0e0a);
        namespace_3fe5772ba4970d56::function_233461f36bb50ef9();
        return 0;
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdf
// Size: 0x44
function function_240d450c0ec5f614(ref) {
    if (isdefined(ref) && isdefined(self)) {
        if (!isdefined(self.var_aa60aaec7e1f2460)) {
            self.var_aa60aaec7e1f2460 = [];
        }
        self.var_aa60aaec7e1f2460[self.var_aa60aaec7e1f2460.size] = ref;
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2a
// Size: 0x70
function function_eff88219461e17e6(ref) {
    if (isdefined(self.var_aa60aaec7e1f2460)) {
        foreach (var_f107d5603dfe9551 in self.var_aa60aaec7e1f2460) {
            if (ref == var_f107d5603dfe9551) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda2
// Size: 0x33
function function_f7754d7ad59b2f8b() {
    /#
        assert(isplayer(self));
    #/
    playerdata = self getplayerdata("mp", "ftueData", "popup_messages_01");
    return playerdata;
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddd
// Size: 0x32
function function_9406f25ca59385d7(data) {
    /#
        assert(isplayer(self));
    #/
    self setplayerdata("mp", "ftueData", "popup_messages_01", data);
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe16
// Size: 0x6b
function function_bfd3ae5074922ca4(ref) {
    /#
        assert(isplayer(self));
    #/
    if (isdefined(ref)) {
        playerdata = function_f7754d7ad59b2f8b();
        mask = function_470bb108e6b631cf(ref);
        playerdata = playerdata & !mask;
        function_9406f25ca59385d7(playerdata);
    } else {
        self setplayerdata("mp", "ftueData", "popup_messages_01", 0);
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe88
// Size: 0x33
function function_db5ff9a11953598a() {
    /#
        assert(isplayer(self));
    #/
    matchcount = self getplayerdata("mp", "ftueData", "ftue_match_count");
    return matchcount;
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec3
// Size: 0x32
function function_ba46b8be5a676356(data) {
    /#
        assert(isplayer(self));
    #/
    self setplayerdata("mp", "ftueData", "ftue_match_count", data);
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefc
// Size: 0x5d
function function_5b732dd6ab2ee2d6() {
    if (isdefined(self) && isplayer(self)) {
        function_86471673929333b2();
        matchcount = self getplayerdata("mp", "ftueData", "ftue_match_count");
        if (matchcount < 10) {
            matchcount = matchcount + 1;
            self setplayerdata("mp", "ftueData", "ftue_match_count", matchcount);
        }
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf60
// Size: 0x29
function function_e1efe40b5c5ae801() {
    /#
        assert(isplayer(self));
    #/
    self setplayerdata("mp", "ftueData", "ftue_match_count", 0);
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf90
// Size: 0x1c3
function function_da05e0125fa8bbf4() {
    /#
        if (level.mapname == "slideDiveInvertHoldKBM" && getdvarint(@"hash_97ab1e3e328ddff9", 0) == 0) {
            return;
        }
    #/
    wait(1);
    startpt = level.infilstruct.c130pathstruct.startpt;
    endpt = level.infilstruct.c130pathstruct.endpt;
    maxdist = 2000;
    maxdistsquared = maxdist * maxdist;
    var_be9720eaaaa043e = 1;
    foreach (player in level.players) {
        if (player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
            for (i = var_be9720eaaaa043e; i <= tablelookupgetnumrows("mp/brLandingLocations.csv"); i++) {
                var_1a91606a95a6f428 = int(tablelookupbyrow("mp/brLandingLocations.csv", i, 1));
                var_d82580e4ef677e9 = int(tablelookupbyrow("mp/brLandingLocations.csv", i, 2));
                var_2468f359e6db6d5e = int(tablelookupbyrow("mp/brLandingLocations.csv", i, 3));
                var_6b2e847a999c810e = (var_1a91606a95a6f428, var_d82580e4ef677e9, var_2468f359e6db6d5e);
                var_bb19c5d035c6218 = distance2dsquared(pointonsegmentnearesttopoint(startpt, endpt, var_6b2e847a999c810e), var_6b2e847a999c810e);
                if (var_bb19c5d035c6218 <= maxdistsquared) {
                    var_be9720eaaaa043e = i + 1;
                    player function_1976438a8865ac27("br_ftue_suggested_landing", var_6b2e847a999c810e);
                }
            }
        }
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115a
// Size: 0x1d3
function function_598fb861f3171c2() {
    if (function_2da74cf301f9faa5("br_ftue_supply_box")) {
        var_ad5c6ea429f3dfa4 = getentitylessscriptablearray(undefined, undefined, self.origin, 800, "body");
        if (var_ad5c6ea429f3dfa4.size > 0) {
            var_66df16d5eb83948 = undefined;
            var_275345d8f36271a8 = 640000;
            player_angles = self getplayerangles();
            player_forward = anglestoforward(player_angles);
            var_2d9d490a0cc189e2 = 0.8;
            foreach (var_36b81911e31bb387 in var_ad5c6ea429f3dfa4) {
                var_68d9e792fe9def4d = var_36b81911e31bb387 getscriptablepartstate("body", 1);
                if (!isdefined(var_68d9e792fe9def4d)) {
                    continue;
                }
                if (isdefined(var_68d9e792fe9def4d) && var_68d9e792fe9def4d == "closed_usable" || var_68d9e792fe9def4d == "closed_usable_no_collision") {
                    distsq = distancesquared(self.origin, var_36b81911e31bb387.origin);
                    angles = vectortoangles(var_36b81911e31bb387.origin - self.origin);
                    forward = anglestoforward(angles);
                    var_e53980533aaa2fee = vectordot(forward, player_forward);
                    if (var_e53980533aaa2fee > var_2d9d490a0cc189e2) {
                        if (distsq < var_275345d8f36271a8 && abs(self.origin[2] - var_36b81911e31bb387.origin[2]) < 80) {
                            var_66df16d5eb83948 = var_36b81911e31bb387;
                            var_275345d8f36271a8 = distsq;
                        }
                    }
                }
            }
            if (isdefined(var_66df16d5eb83948)) {
                function_1976438a8865ac27("br_ftue_supply_box", var_66df16d5eb83948.origin);
            }
        }
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1334
// Size: 0x5f
function function_7287acec1d584b46() {
    level endon("game_ended");
    self endon("disconnect");
    if (self usinggamepad()) {
        var_219c17c104495e0e = requestgamerprofile("slideDiveInvertHoldGamepad");
    } else {
        var_219c17c104495e0e = requestgamerprofile("slideDiveInvertHoldKBM");
    }
    if (var_219c17c104495e0e) {
        function_1976438a8865ac27("br_ftue_sliding_invert");
    } else {
        function_1976438a8865ac27("br_ftue_sliding");
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139a
// Size: 0x31
function function_46c63a68a41e27a1() {
    if (function_2da74cf301f9faa5("br_ftue_sliding") || function_2da74cf301f9faa5("br_ftue_sliding_invert")) {
        if (self issprinting()) {
            thread function_7287acec1d584b46();
        }
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d2
// Size: 0x78
function function_5a4b82ce1c8d94d6(victim) {
    if (function_2da74cf301f9faa5("br_ftue_enemy_down")) {
        wait(5);
        if (namespace_7e17181d03156026::isinlaststand(victim)) {
            function_1976438a8865ac27("br_ftue_enemy_down", victim);
        }
    } else if (function_2da74cf301f9faa5("br_ftue_interrogation") && function_2f0ba374d69e645c("br_ftue_enemy_down")) {
        wait(3);
        if (namespace_7e17181d03156026::isinlaststand(victim) && isalive(victim)) {
            function_1976438a8865ac27("br_ftue_interrogation", victim);
        }
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1451
// Size: 0x55
function function_4e19e6bf429dda56(teammate) {
    if (function_2da74cf301f9faa5("br_ftue_revive")) {
        distsq = distancesquared(self.origin, teammate.origin);
        if (distsq < 1000000) {
            function_1976438a8865ac27("br_ftue_revive", teammate);
        }
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ad
// Size: 0x3f
function function_8f15851557170215(ref) {
    return ref == "br_ftue_interrogation" || ref == "br_ftue_enemy_down" || ref == "br_ftue_gas" || ref == "br_ftue_parachute" || ref == "br_ftue_suggested_landing";
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f4
// Size: 0x138
function function_88c626bafd6057bf(player) {
    currenttime = gettime();
    var_527aac742ef4ec8b = getdvarint(@"hash_2d46f9a1548dfb28", 12000);
    if (isdefined(player) && isdefined(player.pers["lastDamageTime"]) && player.pers["lastDamageTime"] + var_527aac742ef4ec8b > currenttime || isdefined(player.lasttimedamaged) && player.lasttimedamaged + var_527aac742ef4ec8b > currenttime || isdefined(player.lastdamagedtime) && player.lastdamagedtime + var_527aac742ef4ec8b > currenttime) {
        return 1;
    }
    player namespace_25c5a6f43bb97b43::validaterecentattackers();
    if (isdefined(player.recentattackers) && player.recentattackers.size > 0) {
        return 1;
    }
    if (isdefined(player.vehicle)) {
        if (istrue(player.vehicle.burningdown)) {
            return 1;
        }
        if (istrue(namespace_d325722f2754c2c4::islockedonto(player.vehicle))) {
            return 1;
        }
    }
    if (isdefined(player) && player namespace_d9c77dc2a6fe29c6::istouchingoobtrigger()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1634
// Size: 0x6b
function ftue_trigger_landed_hint() {
    if (function_2da74cf301f9faa5("br_ftue_controls")) {
        function_1976438a8865ac27("br_ftue_controls");
        return;
    }
    teamplayers = namespace_54d20dd0dd79277f::getfriendlyplayers(self.team, 1);
    if (teamplayers.size > 0 && function_2f0ba374d69e645c("br_ftue_controls") && function_2da74cf301f9faa5("br_ftue_ping")) {
        function_1976438a8865ac27("br_ftue_ping");
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16a6
// Size: 0x91
function function_a381589f3fb2b34f(scriptablename, pickup) {
    if (function_2da74cf301f9faa5("br_ftue_stronghold")) {
        if (!istrue(namespace_cb965d2f71fefddc::function_cbbf9bf3544dc456(pickup))) {
            return;
        }
        var_9220ee8d6bf347ee = isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"key" && issubstr(scriptablename, "loot_key_fortress");
        if (var_9220ee8d6bf347ee) {
            function_1976438a8865ac27("br_ftue_stronghold");
        }
    }
}

// Namespace namespace_3169ff42d7051988/namespace_88bfae359020fdd3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x173e
// Size: 0x2b9
function function_8247afd76f1b33e0(command, args) {
    /#
        switch (command) {
        case #"hash_331cc3d256f46a92":
            var_3df399f484f486b6 = "<unknown string>";
            if (isdefined(args[0])) {
                var_3df399f484f486b6 = args[0];
            }
            level.player function_bfd3ae5074922ca4(var_3df399f484f486b6);
            level.player function_1976438a8865ac27(var_3df399f484f486b6);
            break;
        case #"hash_6d4107298063ce5b":
            level.player function_bfd3ae5074922ca4();
            level.player function_e1efe40b5c5ae801();
            break;
        case #"hash_3042071cce2a405a":
            level.player function_bfd3ae5074922ca4();
            break;
        case #"hash_3e708dd7a95b6863":
            level.player function_e1efe40b5c5ae801();
            break;
        case #"hash_cd0526653dd5a3c2":
            matchcount = 1;
            if (isdefined(args)) {
                matchcount = args;
            }
            level.player function_ba46b8be5a676356(matchcount);
            break;
        case #"hash_f51410d2484dcf62":
            level.player function_5b732dd6ab2ee2d6();
            break;
        case #"hash_75c29bbe1edeb517":
            var_3df399f484f486b6 = "<unknown string>";
            level.player function_bfd3ae5074922ca4(var_3df399f484f486b6);
            var_607da387f3617ed1 = namespace_54d20dd0dd79277f::function_3d0f2343793d709b(level.player.team, level.player.var_ff97225579de16a, 1);
            foreach (player in var_607da387f3617ed1) {
                if (player != level.player) {
                    level.player function_1976438a8865ac27(var_3df399f484f486b6, player);
                    return;
                }
            }
            break;
        case #"hash_badf722cbb8a0456":
            var_3df399f484f486b6 = "<unknown string>";
            level.player function_bfd3ae5074922ca4(var_3df399f484f486b6);
            enemyplayers = namespace_54d20dd0dd79277f::getenemyplayers(level.player.team, 1);
            foreach (player in enemyplayers) {
                if (isdefined(player) && isalive(player)) {
                    level.player function_1976438a8865ac27(var_3df399f484f486b6, player);
                }
                return;
            }
            break;
        default:
            break;
        }
    #/
}

