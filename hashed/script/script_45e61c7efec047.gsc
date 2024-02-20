// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\scriptable.gsc;
#using script_639bf783929acf9b;
#using script_38eb8f4be20d54f4;
#using script_67fb1233e876ed8;
#using script_398835140857d740;
#using script_3e2f8cc477d57433;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_43971bbeefd98f05;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\outofbounds.gsc;

#namespace perk_tombstone;

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7
// Size: 0x20e
function function_ce82f1d47d2e5a58(var_1df6de077e30f8c2, var_fe59c44529c721a0) {
    if (istrue(level.var_5025186a3fc7fa4)) {
        return;
    }
    level thread function_f3a23df892bf82f6("specialty_tombstone", var_1df6de077e30f8c2, var_fe59c44529c721a0, &function_c9b691d2acfb3c55, &function_be6733eb26422227);
    callback::add("player_spawned", &function_c0a90b470c8db3b5);
    callback::add("player_disconnect", &function_5f75982dd09c5aff);
    callback::add("player_death", &function_828d4e52d624e921);
    callback::add("player_revived", &function_72a8eb52f0be7b20);
    callback::add("player_connect", &function_a96eb05bcccdae3d);
    callback::add("ob_exfil_success", &function_cb0dffa5e243988f);
    callback::add(#"player_eliminated", &function_68a1dda7fd1c33f9);
    callback::add("map_to_map_transition", &function_daacf7d82f553a35);
    callback::add("player_item_pickup", &on_item_pickup);
    scriptable_addnotifycallback("stash_dead", &function_53984676bfb1fe35);
    level.var_2251a7fd416d962a = [];
    level.var_d3bc04e8a1946502 = [0:(36845, 17622, 3396), 1:(36527, 17795, 3395), 2:(36258, 17703, 3327), 3:(35979, 17378, 3312), 4:(35789, 17361, 3312), 5:(35620, 17401, 3312), 6:(35568, 17644, 3306), 7:(35012, 17582, 3158), 8:(34423, 17935, 3135), 9:(34162, 18085, 3131), 10:(33681, 19037, 3133), 11:(37069, 17864, 3395), 12:(35585, 18342, 3310), 13:(33758, 19259, 3127), 14:(35926, 17660, 3290)];
    setdvarifuninitialized(@"hash_6d31f61a8b813a5a", 1);
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fc
// Size: 0xa
function function_c9b691d2acfb3c55() {
    function_d60544ce1e681740();
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60d
// Size: 0x2b
function function_be6733eb26422227(b_pause, str_perk, str_result, n_slot) {
    function_480ad40598a5406a();
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f
// Size: 0xf
function function_d60544ce1e681740() {
    function_ab7a3ff9f75e4867("specialty_tombstone");
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x655
// Size: 0xf
function function_480ad40598a5406a() {
    function_fe0d28e6f0008329("specialty_tombstone");
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66b
// Size: 0x4f4
function function_c0a90b470c8db3b5(params) {
    mapname = namespace_36f464722d326bbe::getmapname();
    if (mapname == "mp_jup_bigmap" || istrue(level.var_18a131403527449e)) {
        function_58b9475ad345f0d3();
        foreach (cache in level.var_2251a7fd416d962a) {
            if (!isdefined(cache)) {
                continue;
            }
            if (isdefined(self.var_9b55e3337571adb4) && is_equal(self.var_9b55e3337571adb4.cache, cache)) {
                cache enablescriptableplayeruse(self);
                if (isdefined(cache.icon) && isdefined(cache.icon.objectiveiconid)) {
                    namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(cache.icon.objectiveiconid, self);
                    namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, cache.origin, cache.icon.objectiveiconid);
                }
            } else {
                if (isdefined(cache.icon) && isdefined(cache.icon.objectiveiconid)) {
                    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(cache.icon.objectiveiconid, self);
                }
                cache disablescriptableplayeruse(self);
            }
        }
    }
    /#
        if (level._custom_perks.size) {
            self endon("tombstone_stash");
            var_3352bf952cfc182a = self.name;
            function_6e7290c8ee4f558b("altmode" + var_3352bf952cfc182a + "<unknown string>");
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_e8e91e981eed0341);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_d809d194ca48db47);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_1829cbe6d232c1d9);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + var_3352bf952cfc182a + "<unknown string>", &function_f8a387a8c88b1c8a);
            function_fe953f000498048f();
        }
    #/
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb66
// Size: 0x4e
function function_5f75982dd09c5aff(params) {
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        self.var_9b55e3337571adb4.cache function_99de0ed107698b92(self, 1);
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb
// Size: 0x13
function function_828d4e52d624e921(params) {
    function_5f07fd4885970a1d();
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd5
// Size: 0x75
function function_cb0dffa5e243988f(params) {
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        self.var_9b55e3337571adb4.cache thread function_99de0ed107698b92(self, 1);
    }
    if (isplayer(self)) {
        self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
        function_8ec2a2bfd11473be();
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc51
// Size: 0x4f
function function_68a1dda7fd1c33f9(param) {
    var_76063bf99f55fa00 = self getplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack");
    if (istrue(self.var_addfab42810330a4)) {
        self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 1);
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca7
// Size: 0x6e
function function_daacf7d82f553a35(params) {
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
        self.var_9b55e3337571adb4.cache function_99de0ed107698b92(self, 1);
        waitframe();
        self function_f91677634526e3bb(1);
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1c
// Size: 0xdf
function function_5f07fd4885970a1d() {
    var_277e5a7de395bb2e = getdvarint(@"hash_5c869b8df5b17357", 0);
    if (var_277e5a7de395bb2e > 0) {
        if (gettime() <= function_a5b14435e3229bed(var_277e5a7de395bb2e)) {
            return;
        }
    }
    if (has_perk("specialty_tombstone")) {
        params = spawnstruct();
        if (isbot(self)) {
            /#
                function_39c1cce4c78f1e6c(params);
            #/
        } else {
            function_ea489c9a3e230419(params);
        }
    } else if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        if (isplayer(self)) {
            self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
            self.var_9b55e3337571adb4.cache function_99de0ed107698b92(self, 1);
            waitframe();
            self function_f91677634526e3bb(1);
        }
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe02
// Size: 0xc
function function_72a8eb52f0be7b20(params) {
    
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe15
// Size: 0x3b
function function_a96eb05bcccdae3d(params) {
    var_76063bf99f55fa00 = self getplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack");
    if (istrue(var_76063bf99f55fa00)) {
        self.var_9cabc8bf28b5247f = 1;
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe57
// Size: 0x3ff
function function_ea489c9a3e230419(params) {
    if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
        self.var_9b55e3337571adb4.cache function_99de0ed107698b92(self, 1);
    }
    if (!has_perk("specialty_tombstone") || self.sessionstate == "intermission") {
        return;
    }
    function_8ec2a2bfd11473be();
    self.var_9b55e3337571adb4 = spawnstruct();
    self.var_9b55e3337571adb4.var_96fe349cc1405483 = [];
    self.var_9b55e3337571adb4.var_af2cea418410a822 = [];
    for (i = 0; i < 10; i++) {
        lootid = function_d870b2c45335bd88(i);
        var_ea156f5f477a8792 = function_5ce7fe3dca9c1a22(i);
        self.var_9b55e3337571adb4.var_af2cea418410a822[lootid] = var_ea156f5f477a8792;
        var_fbe755f0978c0369 = function_fc925a153c7fd55c(lootid);
        if (!isdefined(var_fbe755f0978c0369)) {
            continue;
        }
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        scriptable = itembundle.scriptable;
        self.var_9b55e3337571adb4.var_96fe349cc1405483 = array_add(self.var_9b55e3337571adb4.var_96fe349cc1405483, lootid);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "lootID", lootid);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "quantity", var_ea156f5f477a8792);
        var_96c503c9e2fe99c4 = i;
    }
    var_7a83ce8a86de986 = self.var_614607f42dca0826;
    if (isdefined(var_7a83ce8a86de986)) {
        goto LOC_00000215;
    }
    var_17bfab818caf8234 = currency::function_15975e20bbd2c824("essence");
    var_17bfab818caf8234 = int(var_17bfab818caf8234 * getdvarfloat(@"hash_6d31f61a8b813a5a"));
    self setplayerdata(level.var_5d69837cf4db0407, "tombstoneEssence", var_17bfab818caf8234);
    if (var_17bfab818caf8234 > 0) {
        lootid = function_6d15e119c2779a93(getscriptbundle("itemspawnentry:ob_jup_item_essence_tombstone"));
        self.var_9b55e3337571adb4.var_96fe349cc1405483 = array_add(self.var_9b55e3337571adb4.var_96fe349cc1405483, lootid);
        index = isdefined(var_96c503c9e2fe99c4) ? var_96c503c9e2fe99c4 + 1 : 0;
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", index, "lootID", lootid);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", index, "quantity", 1);
    }
    if (self.var_9b55e3337571adb4.var_96fe349cc1405483.size) {
        self.var_addfab42810330a4 = 1;
        mapname = namespace_36f464722d326bbe::getmapname();
        if (mapname != "mp_jup_bigmap" && !istrue(level.var_18a131403527449e) || namespace_d9c77dc2a6fe29c6::istouchingoobtrigger() || function_6c71c72547bb931(self.origin)) {
            var_a9979045658c3ded = function_b2cd26ac28946ea7(level.var_d3bc04e8a1946502);
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 0, var_a9979045658c3ded[0]);
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 1, var_a9979045658c3ded[1]);
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 2, var_a9979045658c3ded[2]);
        } else {
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 0, self.origin[0]);
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 1, self.origin[1]);
            self setplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 2, self.origin[2]);
        }
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x125d
// Size: 0x400
function function_388d12d30b04fbc1() {
    /#
        assertex(isdefined(self.clientid), "Player has no client id assigned.");
    #/
    var_e89a9a6a3475bd0a = undefined;
    if (!isdefined(self.var_9b55e3337571adb4) || !isdefined(self.var_9b55e3337571adb4.var_96fe349cc1405483) || self.var_9b55e3337571adb4.var_96fe349cc1405483.size < 1) {
        return;
    }
    if (isdefined(self.var_30ae0dc4dbcb9e7f)) {
        var_f4991b19147602f9 = self.var_30ae0dc4dbcb9e7f;
    } else {
        var_f4991b19147602f9 = self.clientid;
    }
    var_f7a2c7ec29f706c5 = var_f4991b19147602f9 + 1;
    if (var_f7a2c7ec29f706c5 < 10) {
        var_e89a9a6a3475bd0a = function_40fd49171fad19d3("tombstone_stash_0" + var_f7a2c7ec29f706c5);
    } else {
        var_e89a9a6a3475bd0a = function_40fd49171fad19d3("tombstone_stash_" + var_f7a2c7ec29f706c5);
    }
    x = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 0);
    y = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 1);
    z = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneStashOrigin", 2);
    essence = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneEssence");
    dropstruct = namespace_2abc885019e1956::function_59a2e61d79065dca();
    var_cb4fad49263e20c4 = namespace_2abc885019e1956::function_49b86047c8a8b228(dropstruct, (x, y, z), (0, 0, 0), undefined, 1);
    icon = function_efda1ea04874e527(var_cb4fad49263e20c4.origin);
    if (!isdefined(icon)) {
        return;
    }
    cache = spawnscriptable(var_e89a9a6a3475bd0a, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles);
    if (!isdefined(cache)) {
        /#
            assertmsg("Failed to create Tombstone stash: " + var_e89a9a6a3475bd0a + " for client# " + var_f4991b19147602f9);
        #/
        return;
    }
    cache.icon = icon;
    namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(11, cache.origin, icon.objectiveiconid);
    cache setscriptablepartstate("body", "closed_usable");
    var_b98ef95ec6346029 = [];
    var_b98ef95ec6346029 = array_combine(var_b98ef95ec6346029, self.var_9b55e3337571adb4.var_96fe349cc1405483);
    foreach (item in var_b98ef95ec6346029) {
        if (!isdefined(item)) {
            continue;
        }
        n_count = 1;
        if (isdefined(self.var_9b55e3337571adb4.var_af2cea418410a822[item])) {
            n_count = self.var_9b55e3337571adb4.var_af2cea418410a822[item];
        }
        namespace_3883e3399f2870b5::function_6eee0ede493b44e8(cache, n_count, item);
    }
    foreach (player in level.players) {
        if (player == self) {
            cache enablescriptableplayeruse(player);
            n_id = var_f4991b19147602f9 + 1;
            player setclientomnvar("tombstone_stash", n_id);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(cache.icon.objectiveiconid, player);
            cache disablescriptableplayeruse(player);
        }
    }
    self.var_9b55e3337571adb4.cache = cache;
    level.var_2251a7fd416d962a = array_add(level.var_2251a7fd416d962a, cache);
    cache callback::add("on_cache_closed", &function_db8eb6248ea8a6df);
    self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
    waitframe();
    self function_f91677634526e3bb(1);
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1664
// Size: 0x116
function function_99de0ed107698b92(player, var_dac8ca004908667b) {
    if (!isdefined(var_dac8ca004908667b)) {
        var_dac8ca004908667b = 0;
    }
    self notify("cleanup_tombstone_cache");
    self endon("cleanup_tombstone_cache");
    if (!var_dac8ca004908667b && !player isContainerEmpty(self)) {
        return;
    }
    if (isdefined(self.icon)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.icon.objectiveiconid);
        self.icon = undefined;
    }
    self setscriptablepartstate("body", "shutdown");
    player setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
    player function_8ec2a2bfd11473be();
    if (!var_dac8ca004908667b) {
        waittill_notify_or_timeout("stash_dead", 20);
    }
    while (isplayer(player) && player namespace_3883e3399f2870b5::function_d6041f45fee8083d() && !var_dac8ca004908667b) {
        wait(0.1);
    }
    level.var_2251a7fd416d962a = array_remove(level.var_2251a7fd416d962a, self);
    self freescriptable();
    if (isplayer(player)) {
        player setclientomnvar("tombstone_stash", 0);
        player.var_9b55e3337571adb4 = undefined;
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1781
// Size: 0xaf
function function_db8eb6248ea8a6df(params) {
    player = params.opener;
    if (isplayer(player) && isdefined(player.var_9b55e3337571adb4) && isdefined(player.var_9b55e3337571adb4.cache) && self == player.var_9b55e3337571adb4.cache) {
        player callback::callback("on_tombstone_used_cache", {var_506e11545ce72281:self});
        player.var_9b55e3337571adb4.cache function_99de0ed107698b92(params.opener);
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1837
// Size: 0x2d
function function_53984676bfb1fe35(instance, note, param, var_535d9c3fdddab5a9) {
    waitframe();
    instance notify("stash_dead");
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x186b
// Size: 0x14
function function_70cb750bdeab27e1(instance, player) {
    
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1886
// Size: 0x75
function function_47a4709ac15919(var_ba5943944b6cba2f) {
    var_d152e4e27251f20a = self getweaponammoclip(var_ba5943944b6cba2f);
    var_763c9d03986746af = self getweaponammoclip(var_ba5943944b6cba2f, "left");
    var_e4bca3d2e20844aa = self getweaponammostock(var_ba5943944b6cba2f);
    var_742208586ecb63c3 = self getweaponammoclip(var_ba5943944b6cba2f getaltweapon());
    var_bb9462c52bd454eb = function_7209c8cd4b2e3afd(var_d152e4e27251f20a + var_e4bca3d2e20844aa, var_763c9d03986746af, var_742208586ecb63c3);
    return var_bb9462c52bd454eb;
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1903
// Size: 0x6d
function function_ebc56eeecea60302(weapon) {
    if (isdefined(weapon.basename)) {
        switch (weapon.basename) {
        case #"hash_6c8fe4d0c94a4fb4":
        case #"hash_b7c258f34317cf65":
        case #"hash_d95d00b228b20251":
            return 1;
            break;
        }
    }
    if (weapon.inventorytype == "altmode") {
        return 1;
    }
    return 0;
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1978
// Size: 0x190
function function_58b9475ad345f0d3() {
    if (istrue(self.var_9cabc8bf28b5247f)) {
        self.var_9cabc8bf28b5247f = undefined;
        self setplayerdata(level.var_5d69837cf4db0407, "restoreTombstoneBackpack", 0);
        self.var_9b55e3337571adb4 = spawnstruct();
        self.var_9b55e3337571adb4.var_96fe349cc1405483 = [];
        self.var_9b55e3337571adb4.var_af2cea418410a822 = [];
        for (i = 0; i < 10; i++) {
            var_57acedc40b2f974 = function_eb02768c294d3e1c(i);
            var_ea156f5f477a8792 = var_57acedc40b2f974[1];
            lootid = var_57acedc40b2f974[0];
            if (lootid != 0) {
                self.var_9b55e3337571adb4.var_af2cea418410a822[lootid] = var_ea156f5f477a8792;
                var_fbe755f0978c0369 = function_fc925a153c7fd55c(lootid);
                if (!isdefined(var_fbe755f0978c0369)) {
                    self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "lootID", 0);
                    self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "quantity", 0);
                } else {
                    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
                    scriptable = itembundle.scriptable;
                    self.var_9b55e3337571adb4.var_96fe349cc1405483 = array_add(self.var_9b55e3337571adb4.var_96fe349cc1405483, lootid);
                }
            }
        }
        function_388d12d30b04fbc1();
        waitframe();
        self function_f91677634526e3bb(1);
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0f
// Size: 0x61
function function_eb02768c294d3e1c(index) {
    lootid = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", index, "lootID");
    quantity = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", index, "quantity");
    return [0:lootid, 1:quantity];
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b78
// Size: 0x74
function function_8ec2a2bfd11473be() {
    for (i = 0; i < 10; i++) {
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "lootID", 0);
        self setplayerdata(level.var_5d69837cf4db0407, "tombstoneBackpack", i, "quantity", 0);
    }
    self setplayerdata(level.var_5d69837cf4db0407, "tombstoneEssence", 0);
    waitframe();
    self function_f91677634526e3bb(1);
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bf3
// Size: 0xa7
function private function_efda1ea04874e527(origin) {
    objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (objectiveiconid == -1) {
        return undefined;
    }
    icon = spawnstruct();
    icon.objectiveiconid = objectiveiconid;
    namespace_5a22b6f3a56f7e9b::objective_add_objective(icon.objectiveiconid, "active", origin + (0, 0, 49), "jup_ui_icon_tombstone_soda");
    var_9680f4970fbe8e0e = 1;
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(icon.objectiveiconid, var_9680f4970fbe8e0e);
    objective_setdescription(icon.objectiveiconid, "CP_ZMB/PING_TOMBSTONE_STASH");
    return icon;
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca2
// Size: 0x54
function on_item_pickup(params) {
    if (is_equal(params.var_fbe755f0978c0369, "ob_jup_item_essence_tombstone")) {
        essence = self getplayerdata(level.var_5d69837cf4db0407, "tombstoneEssence");
        currency::function_3036cef61495210f("essence", essence - 1);
    }
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cfd
// Size: 0x4a
function function_e8e91e981eed0341(a_params) {
    /#
        player = function_b3818ef99e063667(a_params[0]);
        params = spawnstruct();
        if (player has_perk("<unknown string>")) {
            player function_388d12d30b04fbc1();
        }
    #/
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4e
// Size: 0x53
function function_1829cbe6d232c1d9(a_params) {
    /#
        player = function_b3818ef99e063667(a_params[0]);
        params = spawnstruct();
        if (isbot(player)) {
            player thread function_39c1cce4c78f1e6c(params);
        } else {
            player thread function_ea489c9a3e230419(params);
        }
    #/
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1da8
// Size: 0x43
function function_d809d194ca48db47(a_params) {
    /#
        player = function_b3818ef99e063667(a_params[0]);
        player.var_9b55e3337571adb4.cache thread function_99de0ed107698b92(player, 1);
    #/
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1df2
// Size: 0x38
function function_f8a387a8c88b1c8a(a_params) {
    /#
        player = function_b3818ef99e063667(a_params[0]);
        player.var_30ae0dc4dbcb9e7f = int(a_params[1]);
    #/
}

// Namespace perk_tombstone/namespace_8f3ef228cc9c9507
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e31
// Size: 0x24b
function function_39c1cce4c78f1e6c(params) {
    /#
        if (isdefined(self.var_9b55e3337571adb4) && isdefined(self.var_9b55e3337571adb4.cache)) {
            self.var_9b55e3337571adb4.cache function_99de0ed107698b92(self, 1);
        }
        if (!has_perk("<unknown string>")) {
            return;
        }
        function_8ec2a2bfd11473be();
        self.var_9b55e3337571adb4 = spawnstruct();
        self.var_9b55e3337571adb4.var_96fe349cc1405483 = [];
        self.var_9b55e3337571adb4.var_af2cea418410a822 = [];
        for (i = 0; i < 10; i++) {
            lootid = level.players[0] function_d870b2c45335bd88(i);
            var_ea156f5f477a8792 = level.players[0] function_5ce7fe3dca9c1a22(i);
            self.var_9b55e3337571adb4.var_af2cea418410a822[lootid] = var_ea156f5f477a8792;
            var_fbe755f0978c0369 = function_fc925a153c7fd55c(lootid);
            if (!isdefined(var_fbe755f0978c0369)) {
                continue;
            }
            itembundle = getscriptbundle("<unknown string>" + var_fbe755f0978c0369);
            scriptable = itembundle.scriptable;
            self.var_9b55e3337571adb4.var_96fe349cc1405483 = array_add(self.var_9b55e3337571adb4.var_96fe349cc1405483, lootid);
            self setplayerdata(level.var_5d69837cf4db0407, "<unknown string>", i, "<unknown string>", lootid);
            self setplayerdata(level.var_5d69837cf4db0407, "<unknown string>", i, "<unknown string>", var_ea156f5f477a8792);
        }
        if (self.var_9b55e3337571adb4.var_96fe349cc1405483.size) {
            self setplayerdata(level.var_5d69837cf4db0407, "<unknown string>", 1);
            self setplayerdata(level.var_5d69837cf4db0407, "<unknown string>", 0, self.origin[0]);
            self setplayerdata(level.var_5d69837cf4db0407, "<unknown string>", 1, self.origin[1]);
            self setplayerdata(level.var_5d69837cf4db0407, "<unknown string>", 2, self.origin[2]);
        }
    #/
}

