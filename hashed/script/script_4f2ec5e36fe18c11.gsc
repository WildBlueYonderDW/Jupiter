// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_35ee5e2cef30eea2;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\teams.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\outline.gsc;
#using script_40e63dd222434655;
#using scripts\cp_mp\execution.gsc;
#using script_27af1dac0930f28e;

#namespace namespace_cf6ea30b1312e834;

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2eb
// Size: 0x11d
function function_9813640fb9b49e46(bots) {
    if (!isdefined(bots)) {
        return;
    }
    var_105033a3f589a207 = [];
    var_7bb9679b97ffc9df = [];
    var_e80ef5b65c009b23 = [];
    foreach (bot in bots) {
        switch (bot.spawnpriority) {
        case #"hash_7e89154a96f625d":
            var_105033a3f589a207 = array_add(var_105033a3f589a207, bot);
            break;
        case #"hash_2881ce6c1efb40c5":
            var_7bb9679b97ffc9df = array_add(var_7bb9679b97ffc9df, bot);
            break;
        case #"hash_2f27546c22430661":
            var_e80ef5b65c009b23 = array_add(var_e80ef5b65c009b23, bot);
            break;
        default:
            var_7bb9679b97ffc9df = array_add(var_7bb9679b97ffc9df, bot);
            break;
        }
    }
    function_686deda65062ab0a(var_105033a3f589a207, "high_priority_bots_spawned");
    thread function_686deda65062ab0a(var_7bb9679b97ffc9df, "mid_priority_bots_spawned");
    thread function_1484a2c2c40efa4e(var_e80ef5b65c009b23, "low_priority_bots_spawned");
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x40f
// Size: 0x72
function private function_686deda65062ab0a(bots, var_40ea91e2825fa07a) {
    if (!isdefined(bots[0])) {
        return;
    }
    foreach (bot in bots) {
        function_b7f44575cc09ded1(bot);
    }
    if (isdefined(var_40ea91e2825fa07a)) {
        level notify(var_40ea91e2825fa07a);
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x488
// Size: 0x97
function private function_1484a2c2c40efa4e(bots, var_40ea91e2825fa07a) {
    if (!isdefined(bots[0])) {
        return;
    }
    level waittill("mid_priority_bots_spawned");
    foreach (bot in bots) {
        while (level.players.size >= level.maxclients) {
            wait(5);
        }
        function_b7f44575cc09ded1(bot);
    }
    if (isdefined(var_40ea91e2825fa07a)) {
        level notify(var_40ea91e2825fa07a);
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x526
// Size: 0xb3
function function_b7f44575cc09ded1(bot) {
    bot.var_e0e1c48a5393d3d1 = function_5f09f43b4ad28837(bot);
    while (!isdefined(bot.var_e0e1c48a5393d3d1) || !isdefined(bot.var_e0e1c48a5393d3d1.sessionstate) || bot.var_e0e1c48a5393d3d1.sessionstate == "spectator" || bot.var_e0e1c48a5393d3d1.sessionstate == "intermission") {
        waitframe();
    }
    bot thread function_f6354bdcd37ead9f();
    level.ftuedata.var_2d3ee106ce5ee967.var_b6a6d335d4f74dff++;
    return bot;
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5e1
// Size: 0x169
function private function_5f09f43b4ad28837(spawndata) {
    /#
        assert(isdefined(spawndata.name));
    #/
    /#
        assert(isdefined(spawndata.team));
    #/
    /#
        assert(isdefined(spawndata.operatorref));
    #/
    /#
        assert(isdefined(spawndata.personality));
    #/
    bot = addbot(spawndata.name);
    connecting = spawnstruct();
    connecting.ready = 0;
    connecting.abort = 0;
    connecting.difficulty = spawndata.personality;
    if (spawndata.team == "ally") {
        spawndata.team = level.player.team;
    }
    bot bot_set_loadout_class();
    bot spawn_bot_latent(spawndata.team, undefined, connecting);
    waitframe();
    bot namespace_6d8da2b47f878104::createoperatorcustomization(spawndata.operatorref[0], spawndata.operatorref[1]);
    bot.var_ff97225579de16a = bot.var_ff97225579de16a + level.ftuedata.var_2d3ee106ce5ee967.var_b6a6d335d4f74dff + 1;
    return bot;
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x752
// Size: 0x192
function private function_f6354bdcd37ead9f() {
    while (distance(self.var_e0e1c48a5393d3d1.origin, level.ftuedata.var_2d3ee106ce5ee967.var_f9aa74b7f60ce767) > 200) {
        self.var_e0e1c48a5393d3d1 setorigin(level.ftuedata.var_2d3ee106ce5ee967.var_f9aa74b7f60ce767);
        waitframe();
    }
    self.var_e0e1c48a5393d3d1 function_390c90207bac8552();
    while (!self.var_e0e1c48a5393d3d1 isonground()) {
        waitframe();
    }
    self.var_e0e1c48a5393d3d1 function_67d00e6b876c5ee2(self.spawnposition, self.var_6e4beaac52ce2b4a);
    if (!isdefined(self.var_f126ce05f58c4329) || !self.var_f126ce05f58c4329) {
        self.var_e0e1c48a5393d3d1 function_a593971d75d82113();
        self.var_e0e1c48a5393d3d1 function_379bb555405c16bb("ftue_bots::ftue_bots_placeBotOnSpawnPoint()");
        self.var_e0e1c48a5393d3d1 botsetflag("suspended", 1);
    }
    self.var_e0e1c48a5393d3d1.armorhealth = 0;
    self.var_e0e1c48a5393d3d1 takeallweapons();
    startingweapon = namespace_e0ee43ef2dddadaa::buildweapon(self.weapon, undefined, undefined, undefined, -1, undefined, undefined, undefined, 0);
    self.var_e0e1c48a5393d3d1 giveweapon(startingweapon);
    self.var_e0e1c48a5393d3d1 switchtoweapon(startingweapon);
    self.var_e0e1c48a5393d3d1 allowreload(0);
    self.var_e0e1c48a5393d3d1 function_f83c33a014ee22fe();
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8eb
// Size: 0xe7
function function_390c90207bac8552() {
    /#
        assert(isbot(self));
    #/
    self botsetflag("disable_movement", 1);
    self botsetflag("disable_attack", 1);
    self allowslide(0);
    self.var_4165728871d6465c = 0;
    self.var_bc97abf5a86e403f = 0;
    self.var_77198b6da7d57a45 = 0;
    self.var_95ee53cadeb45990 = 0;
    self botsetflag("ignore_nodes", 1);
    foreach (decision in self.mind.var_f0a8822dcc782c9d.var_577f45571c039a54) {
        decision.enabled = 0;
        decision.var_10f0b5c52ece08ce = 0;
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d9
// Size: 0x356
function function_931679c28a759f96(var_57c7cac27d98eaf7, style) {
    if (!isdefined(var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1) || !isbot(var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1)) {
        return;
    }
    var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 botsetflag("suspended", 0);
    var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 playershow();
    var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 namespace_f8065cafc523dba5::function_985b0973f29da4f8("ftue_bots::ftue_bots_botMakeEntrance()");
    if (getdvarint(@"hash_957c4bdd53678c6f", 0) == 1) {
        var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 function_67d00e6b876c5ee2(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"][0]);
        var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 function_9cd34cbd05a34bf2(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"][1]);
        var_57c7cac27d98eaf7 function_5827a66f9760a49d();
    } else if (isdefined(style)) {
        switch (style) {
        case #"hash_20cd76d83c2f7487":
            if (isdefined(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"])) {
                var_57c7cac27d98eaf7 function_f5ce7d12b7b279d3("DEFAULT", undefined, &function_5827a66f9760a49d, var_57c7cac27d98eaf7);
            }
            break;
        case #"hash_718f4c8bdaf008f8":
            if (isdefined(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"])) {
                var_57c7cac27d98eaf7 function_f5ce7d12b7b279d3("DEFAULT", undefined, &function_5827a66f9760a49d, var_57c7cac27d98eaf7);
                wait(0.5);
                var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 function_3500675d209f72a2(var_57c7cac27d98eaf7.var_81bc7fa5d77599d5);
            }
            break;
        case #"hash_4580af3edd21d3af":
            if (isdefined(var_57c7cac27d98eaf7.var_d676e6af83f5eb14) && isdefined(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"])) {
                var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 function_5a0202bcb9ee9af6(var_57c7cac27d98eaf7.var_d676e6af83f5eb14, var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"][0], var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"][1], &function_5827a66f9760a49d, var_57c7cac27d98eaf7);
            }
            break;
        default:
            var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 function_67d00e6b876c5ee2(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"][0]);
            var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 function_9cd34cbd05a34bf2(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"][1]);
            var_57c7cac27d98eaf7 function_5827a66f9760a49d();
            break;
        }
    } else {
        var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 function_67d00e6b876c5ee2(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"][0]);
        var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 function_9cd34cbd05a34bf2(var_57c7cac27d98eaf7.var_e5c38be28345c687["DEFAULT"][1]);
        var_57c7cac27d98eaf7 function_5827a66f9760a49d();
    }
    if (isdefined(var_57c7cac27d98eaf7.var_719183c83135ccbb) && var_57c7cac27d98eaf7.var_719183c83135ccbb) {
        return;
    }
    if (isdefined(level.ftuedata.var_2d3ee106ce5ee967.var_3a288a67f7bdbc94)) {
        wait(level.ftuedata.var_2d3ee106ce5ee967.var_3a288a67f7bdbc94);
    }
    var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 namespace_b903a23a81915f18::hudoutline_add_channel_internal("ftue_enemies", 10, "outlinefill_nodepth_orange");
    var_57c7cac27d98eaf7.var_e0e1c48a5393d3d1 namespace_b903a23a81915f18::hudoutline_enable_internal(level.player, "ftue_enemies");
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd36
// Size: 0x71
function private function_5827a66f9760a49d() {
    self.var_e0e1c48a5393d3d1 setcandamage(1);
    if (isdefined(self.shootenabled) && self.shootenabled) {
        self.var_e0e1c48a5393d3d1 function_3500675d209f72a2(self.var_81bc7fa5d77599d5);
    }
    if (isdefined(self.var_4165728871d6465c) && self.var_4165728871d6465c) {
        self.var_e0e1c48a5393d3d1 function_d5f96927e4cf615f();
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xdae
// Size: 0x5f
function function_7ae554a22b6a36ae(position, var_851848d8246b14aa, var_abf8bccf988c7d40, callback, var_273cfbde456ab2af) {
    /#
        assert(isbot(self));
    #/
    if (isdefined(self.var_4165728871d6465c)) {
        self.var_4165728871d6465c = 0;
    }
    thread function_d25ba7eda1bf7272(position, var_851848d8246b14aa, var_abf8bccf988c7d40, callback, var_273cfbde456ab2af);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xe14
// Size: 0xff
function private function_d25ba7eda1bf7272(position, var_851848d8246b14aa, var_abf8bccf988c7d40, callback, var_273cfbde456ab2af) {
    self notify("new_move_to_position");
    self endon("death_or_disconnect");
    self endon("new_move_to_position");
    targetposition = getclosestpointonnavmesh(position);
    function_47ba56fe3a40bd49(0);
    if (isdefined(var_851848d8246b14aa)) {
        function_9cd34cbd05a34bf2(var_851848d8246b14aa);
    } else if (!isdefined(self.var_4165728871d6465c) || !self.var_4165728871d6465c) {
        self.var_bc97abf5a86e403f = 0;
    }
    self botclearscriptgoal();
    self botsetpathingstyle("scripted");
    self botsetscriptgoal(targetposition, 20, "objective");
    result = bot_waittill_goal_or_fail();
    if (result != "script_goal_changed") {
        function_47ba56fe3a40bd49(1);
    }
    if (isdefined(var_abf8bccf988c7d40)) {
        function_9cd34cbd05a34bf2(var_abf8bccf988c7d40);
    }
    if (isdefined(callback)) {
        if (isdefined(var_273cfbde456ab2af)) {
            var_273cfbde456ab2af thread [[ callback ]]();
        } else {
            self thread [[ callback ]]();
        }
    }
    return 1;
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xf1b
// Size: 0x5f
function function_cf3bf67de9b58336(position, speed, var_abf8bccf988c7d40, callback, var_273cfbde456ab2af) {
    /#
        assert(isbot(self));
    #/
    if (isdefined(self.var_4165728871d6465c)) {
        self.var_4165728871d6465c = 0;
    }
    thread function_a74132c4896883a(position, speed, var_abf8bccf988c7d40, callback, var_273cfbde456ab2af);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xf81
// Size: 0x120
function private function_a74132c4896883a(position, speed, var_abf8bccf988c7d40, callback, var_273cfbde456ab2af) {
    self notify("new_move_to_position");
    self endon("death_or_disconnect");
    self endon("new_move_to_position");
    targetposition = getclosestpointonnavmesh(position);
    function_47ba56fe3a40bd49(0);
    path = [];
    path = self findpath(self.origin, targetposition);
    self botclearscriptgoal();
    for (i = 0; i < path.size; i++) {
        while (distance2d(self.origin, path[i]) > 20) {
            direction = vectortoyaw(path[i] - self.origin);
            self botsetscriptmove(direction, 0.1, speed);
            wait(0.1);
        }
    }
    self botclearscriptgoal();
    function_47ba56fe3a40bd49(1);
    if (isdefined(var_abf8bccf988c7d40)) {
        function_9cd34cbd05a34bf2(var_abf8bccf988c7d40);
    }
    if (isdefined(callback)) {
        if (isdefined(var_273cfbde456ab2af)) {
            var_273cfbde456ab2af thread [[ callback ]]();
        } else {
            self thread [[ callback ]]();
        }
    }
    return 1;
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10a9
// Size: 0x4d
function function_f5ce7d12b7b279d3(var_1dc862996a8f9b46, speed, callback, var_273cfbde456ab2af) {
    /#
        assert(isbot(self.var_e0e1c48a5393d3d1) && isdefined(var_1dc862996a8f9b46));
    #/
    thread function_a62362913caeb1cd(var_1dc862996a8f9b46, speed, callback, var_273cfbde456ab2af);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x10fd
// Size: 0xdd
function private function_a62362913caeb1cd(var_1dc862996a8f9b46, speed, callback, var_273cfbde456ab2af) {
    movement = undefined;
    if (isdefined(speed)) {
        movement = self.var_e0e1c48a5393d3d1 function_a74132c4896883a(self.var_e5c38be28345c687[var_1dc862996a8f9b46][0], speed, self.var_e5c38be28345c687[var_1dc862996a8f9b46][1]);
    } else {
        movement = self.var_e0e1c48a5393d3d1 function_d25ba7eda1bf7272(self.var_e5c38be28345c687[var_1dc862996a8f9b46][0], undefined, self.var_e5c38be28345c687[var_1dc862996a8f9b46][1]);
    }
    if (!isdefined(movement) || !movement) {
        return;
    }
    self.var_e0e1c48a5393d3d1 function_e333732833f72059(self.var_e5c38be28345c687[var_1dc862996a8f9b46][2]);
    if (isdefined(callback)) {
        if (isdefined(var_273cfbde456ab2af)) {
            var_273cfbde456ab2af thread [[ callback ]]();
        } else {
            self.var_e0e1c48a5393d3d1 thread [[ callback ]]();
        }
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x11e1
// Size: 0x8d
function function_5a0202bcb9ee9af6(var_fe4c0c27a524b5ee, var_b8c8d1e68c6c9c94, var_851848d8246b14aa, callback, var_273cfbde456ab2af) {
    /#
        assert(isbot(self) || isdefined(var_fe4c0c27a524b5ee) || isdefined(var_b8c8d1e68c6c9c94) || isdefined(var_851848d8246b14aa));
    #/
    self setorigin(var_fe4c0c27a524b5ee);
    function_47ba56fe3a40bd49(0);
    waitframe();
    self.var_38df06a438df2608 = var_b8c8d1e68c6c9c94;
    thread namespace_bc2665cbe6cf4e1f::parachute(0);
    while (self isonground() == 0) {
        waitframe();
    }
    wait(1);
    function_f5ce7d12b7b279d3(0, callback, var_273cfbde456ab2af);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1275
// Size: 0x1a
function function_d5f96927e4cf615f() {
    /#
        assert(isbot(self));
    #/
    thread function_a0fb5734f6cef381();
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1296
// Size: 0x8f
function private function_a0fb5734f6cef381() {
    self notify("new_reposition_routine");
    self endon("death_or_disconnect");
    self endon("new_reposition_routine");
    self.var_4165728871d6465c = 1;
    while (self.var_4165728871d6465c) {
        wait(5 + randomfloat(5));
        var_79eb2e15455a1646 = self.origin + (level.player.origin - self.origin) / 2;
        newpos = getrandomnavpoint(var_79eb2e15455a1646, 800);
        function_d25ba7eda1bf7272(newpos);
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x132c
// Size: 0x1d
function function_e333732833f72059(stance) {
    if (isbot(self)) {
        self botsetstance(stance);
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1350
// Size: 0x22
function function_47ba56fe3a40bd49(value) {
    if (isbot(self)) {
        self botsetflag("disable_movement", value);
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1379
// Size: 0x2d
function function_9cd34cbd05a34bf2(target, time) {
    /#
        assert(isbot(self));
    #/
    thread function_32b581a67dc2fb4e(target, time);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x13ad
// Size: 0x19f
function private function_32b581a67dc2fb4e(target, time) {
    self notify("new_look_at_target");
    self endon("death_or_disconnect");
    self endon("new_look_at_target");
    if (!isdefined(time)) {
        time = 0.2;
    }
    self.var_bc97abf5a86e403f = 1;
    while (self.var_bc97abf5a86e403f) {
        if (!isdefined(target)) {
            break;
        }
        if (isstring(target)) {
            switch (target) {
            case #"hash_1119adae802dcc40":
                if (!isalive(level.player)) {
                    return;
                }
                var_ee802a36a349579d = level.player geteye() + (randomfloat(0), randomfloat(0), randomfloat(0));
                self botlookatpoint(var_ee802a36a349579d, time, "script_forced");
                break;
            case #"hash_46f2e5a2ee89ad68":
                if (!isalive(level.ftuedata.var_395082021dfc3ae9[#"allybot_1"].var_e0e1c48a5393d3d1)) {
                    return;
                }
                var_ee802a36a349579d = level.ftuedata.var_395082021dfc3ae9[#"allybot_1"].var_e0e1c48a5393d3d1 geteye() + (randomfloat(0), randomfloat(0), randomfloat(0));
                self botlookatpoint(var_ee802a36a349579d, time, "script_forced");
                break;
            }
        } else if (isvector(target)) {
            self botlookatpoint(target, time, "script_forced");
        } else if (isent(target)) {
            if (!isalive(target)) {
                return;
            }
            self botlookatpoint(target.origin, time, "script_forced");
        }
        wait(time);
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1553
// Size: 0x24
function function_3500675d209f72a2(target) {
    /#
        assert(isbot(self));
    #/
    thread function_a3921eb2329446be(target);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x157e
// Size: 0x1a7
function private function_a3921eb2329446be(target) {
    self notify("new_shoot_routine");
    self endon("death_or_disconnect");
    self endon("new_shoot_routine");
    thread function_32b581a67dc2fb4e(target);
    wait(1);
    self.var_77198b6da7d57a45 = 1;
LOC_00000040:
    while (self.var_77198b6da7d57a45) {
        if (isstring(target)) {
            switch (target) {
            case #"hash_1119adae802dcc40":
                if (!isalive(level.player)) {
                    function_3a31862196d98146("attack");
                    return 1;
                }
                if (level.player sightconetrace(self geteye(), self) < 0) {
                    wait(1);
                    continue;
                }
                break;
            case #"hash_46f2e5a2ee89ad68":
                if (!isalive(level.ftuedata.var_395082021dfc3ae9[#"allybot_1"].var_e0e1c48a5393d3d1)) {
                    function_3a31862196d98146("attack");
                    return 1;
                }
                if (level.ftuedata.var_395082021dfc3ae9[#"allybot_1"].var_e0e1c48a5393d3d1 sightconetrace(self geteye(), self) < 0) {
                    wait(1);
                    continue;
                }
                break;
            }
        } else if (isent(target)) {
            if (!isalive(target)) {
                function_3a31862196d98146("attack");
                return 1;
            }
            if (target sightconetrace(self geteye(), self) < 0) {
                wait(1);
                continue;
            }
        } else {
            return;
        }
        var_2f0ac1d536d130ad = 0.5 + randomfloat(2);
        thread function_f37f04aa427d8f84("attack", var_2f0ac1d536d130ad);
        wait(var_2f0ac1d536d130ad + 1 + randomfloat(2));
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x172c
// Size: 0x2a
function function_a7fc1ce7540e5915(enemies) {
    /#
        assert(isbot(self) && isdefined(enemies));
    #/
    thread function_e6311310bbaaa193(enemies);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x175d
// Size: 0xf0
function private function_e6311310bbaaa193(enemies) {
    self notify("new_combat_routine");
    self endon("death_or_disconnect");
    self endon("new_combat_routine");
    self.var_95ee53cadeb45990 = 1;
    while (self.var_95ee53cadeb45990) {
        var_1e14956a236da6d8 = undefined;
        foreach (enemy in enemies) {
            enemybot = level.ftuedata.var_c0271a486aa56405[function_1823ff50bb28148d(enemy)].var_e0e1c48a5393d3d1;
            if (!isdefined(enemybot) || !isalive(enemybot)) {
                continue;
            } else {
                var_1e14956a236da6d8 = enemybot;
            }
        }
        if (!isdefined(var_1e14956a236da6d8)) {
            return 1;
        }
        function_3500675d209f72a2(var_1e14956a236da6d8);
        wait(3 + randomfloat(3));
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1854
// Size: 0x45
function function_d780d856d7d110a4(var_a2251d463637f414, var_8f20fb82370f5f68, var_90b23edbb5fca35c, callback) {
    /#
        assert(isbot(self) || !isdefined(var_a2251d463637f414));
    #/
    thread function_dc9666b56df67864(var_a2251d463637f414, var_8f20fb82370f5f68, var_90b23edbb5fca35c, callback);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x18a0
// Size: 0xed
function private function_dc9666b56df67864(var_a2251d463637f414, var_8f20fb82370f5f68, var_90b23edbb5fca35c, callback) {
    self endon("death_or_disconnect");
    if (isdefined(var_90b23edbb5fca35c)) {
        namespace_f446f6030ca8cff8::_giveexecution(var_90b23edbb5fca35c);
    }
    self.var_bc97abf5a86e403f = 0;
    var_b8bc5657b0d4dcf9 = vectornormalize(anglestoforward(var_a2251d463637f414 getplayerangles()));
    var_e9b6877d9370d55c = var_a2251d463637f414.origin - var_b8bc5657b0d4dcf9 * 30;
    if (distance2d(self.origin, var_e9b6877d9370d55c) > 20) {
        if (!isdefined(var_8f20fb82370f5f68)) {
            var_8f20fb82370f5f68 = 1;
        }
        function_a74132c4896883a(var_e9b6877d9370d55c, var_8f20fb82370f5f68);
    }
    self botlookatpoint(var_a2251d463637f414 geteye(), 1);
    self enableexecutionattack();
    while (!self isinexecutionattack()) {
        function_f37f04aa427d8f84("melee", 3);
        wait(3);
    }
    while (self isinexecutionattack()) {
        waitframe();
    }
    if (isdefined(callback)) {
        self thread [[ callback ]]();
    }
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1994
// Size: 0x42
function function_deafdba8d60e4c3b(var_71cb2f1fe7ef9720, var_1ff1fa846aaf925e, callback) {
    /#
        assert(isbot(self) || !isdefined(var_71cb2f1fe7ef9720) || !isdefined(var_1ff1fa846aaf925e));
    #/
    thread function_c0c83d8b47029a95(var_71cb2f1fe7ef9720, var_1ff1fa846aaf925e, callback);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x19dd
// Size: 0x103
function private function_c0c83d8b47029a95(var_71cb2f1fe7ef9720, var_1ff1fa846aaf925e, callback) {
    self endon("death_or_disconnect");
    var_6ed3b68e54963174 = self getcurrentweapon();
    self takeallweapons();
    var_25f632c5311f7107 = namespace_e0ee43ef2dddadaa::buildweapon("iw9_la_rpapa7", undefined, undefined, undefined, -1, undefined, undefined, undefined, 0);
    self giveweapon(var_25f632c5311f7107);
    self givemaxammo(var_25f632c5311f7107);
    self switchtoweapon(var_25f632c5311f7107);
    if (distance2d(self.origin, var_1ff1fa846aaf925e) > 20) {
        function_d25ba7eda1bf7272(var_1ff1fa846aaf925e);
    }
    function_9cd34cbd05a34bf2(var_71cb2f1fe7ef9720, 4);
    wait(0.5);
    function_f37f04aa427d8f84("ads", 4);
    wait(0.5);
    var_71cb2f1fe7ef9720 namespace_9e27347da4069f42::function_4d84a1c381ece6c0(callback);
    function_f37f04aa427d8f84("attack", 2);
    wait(1.5);
    if (isalive(var_71cb2f1fe7ef9720) > 0) {
        var_71cb2f1fe7ef9720 namespace_9e27347da4069f42::function_b9a4d29f4bc73806(callback);
    }
    self takeallweapons();
    self giveweapon(var_6ed3b68e54963174);
    self givemaxammo(var_6ed3b68e54963174);
    self switchtoweapon(var_6ed3b68e54963174);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae7
// Size: 0x2c
function function_f37f04aa427d8f84(var_baa0b8d939a551b, time) {
    /#
        assert(isbot(self));
    #/
    self botpressbutton(var_baa0b8d939a551b, time);
}

// Namespace namespace_cf6ea30b1312e834/namespace_d4396dc71e6e9c35
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1a
// Size: 0x23
function function_3a31862196d98146(var_baa0b8d939a551b) {
    /#
        assert(isbot(self));
    #/
    self botclearbutton(var_baa0b8d939a551b);
}

