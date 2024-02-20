// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_247745a526421ba7;
#using script_4c770a9a4ad7659c;
#using script_48814951e916af89;
#using scripts\engine\scriptable.gsc;
#using script_3ff084f114b7f6c9;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_d09b27d6534a97c;

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba
// Size: 0x308
function setupcallbacks() {
    if (getdvarint(@"hash_a8673f69d0431388", 0) == 0 || istrue(level.var_ec2fb549b15ad827) || istrue(level.var_77907d733abe8b63)) {
        namespace_7f0bcee5d45a1dea::add("player_connect", &function_66d05c31053f7c8f);
        return;
    }
    namespace_7f0bcee5d45a1dea::add("game_ended", &ongameended);
    namespace_7f0bcee5d45a1dea::add("player_disconnect", &onplayerdisconnect);
    namespace_7f0bcee5d45a1dea::add("player_connect", &onplayerconnect);
    if (isBRStyleGameType()) {
        level.adddroponplayerdeath = &function_3354140884867d15;
        level.var_d3fb932f0373554c = &function_c8958695acf2e1f1;
    } else {
        namespace_7f0bcee5d45a1dea::add("player_death", &function_ddcb9338c5cd1d29);
        namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_a1ffa457f63d28fd);
    }
    namespace_3c37cb17ade254d::registersharedfunc("br_loot_cache", "opened", &function_aa629573b9b452b7);
    namespace_3c37cb17ade254d::registersharedfunc("br_loot_cache_lege", "opened", &function_aa629573b9b452b7);
    namespace_3c37cb17ade254d::registersharedfunc("br_loot_cache", "spawnLoot", &function_735a4fd352102f67);
    namespace_3c37cb17ade254d::registersharedfunc("br_loot_cache_lege", "spawnLoot", &function_735a4fd352102f67);
    namespace_3c37cb17ade254d::registersharedfunc(26160, "pickedUp", &function_b468ee3a4aad8f93);
    namespace_3c37cb17ade254d::registersharedfunc("brloot_scorpion_trophy", "delete", &function_c2feb4d9932dfdcc);
    namespace_3c37cb17ade254d::registersharedfunc("iw9_mp_scorpion_trophy_entityless", "delete", &function_c2feb4d9932dfdcc);
    namespace_3c37cb17ade254d::registersharedfunc("scorpion_event", "player_win", &function_d5e7a53fa83f629d);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("trophy_bank", &function_340f4f4118dcf7c3);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("brloot_scorpion_trophy", &function_199f02943420e747);
    namespace_17c25f0877bfb620::scriptable_addautousecallback(&function_76c38f4af5d006ea);
    namespace_76a219af07c28c13::registerTeamAssimilateCallback(&onteamchange);
    level thread function_4d7a0b09d5f48c13();
    if (isdefined(data())) {
        return;
    }
    data = spawnstruct();
    data.dropcount = getdvarint(@"hash_a883d4d8dec18e3", 1);
    data.maxcount = getdvarint(@"hash_23b3d2eb188b1230", 6);
    data.var_ff2afeeaaa71f4bc = getdvarint(@"hash_c80ce9fc7bbc1e00", function_950cde7e875198d1());
    data.var_7d56c242c2c9880a = getdvarint(@"hash_a4f1b7232d99c28f", 10);
    data.var_dbad26986ec8f069 = getdvarint(@"hash_404a77e17612eee5", 1);
    data.var_8e3cd6bcc3e4f17c = getdvarint(@"hash_884af2871be336e8", function_fdf3d038ad278d6b());
    data.var_a082b242b6fae420 = 200;
    data.var_4e54edc5768a0ad4 = getdvarint(@"hash_3f33f4c872c90245", 20);
    data.var_3f2e2cb7b92e01ef = getdvarint(@"hash_ca2bc81f1c460d5b", 0);
    data.triggers = [];
    data.var_50abd2e2174e8f51 = [];
    data.var_de335d425ab8c9b0 = [];
    data.var_eb3be366abc17855 = [];
    data.dropped = [];
    game["scorpionEvent"] = data;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8c9
// Size: 0x2c9
function private function_4d7a0b09d5f48c13() {
    flag_wait("buy_stations_spawned");
    if (!isdefined(level.var_6aa304e25520289f)) {
        return;
    }
    topleft = [];
    var_fc4eacc5fd5d61bf = [];
    topright = [];
    var_e935789d709dd070 = [];
    foreach (struct in array_randomize(level.var_6aa304e25520289f)) {
        top = struct.origin[1] > 0;
        right = struct.origin[0] > 0;
        if (top && right) {
            topright[topright.size] = struct;
        } else if (!top && right) {
            var_e935789d709dd070[var_e935789d709dd070.size] = struct;
        } else if (top && !right) {
            topleft[topleft.size] = struct;
        } else if (!top && !right) {
            var_fc4eacc5fd5d61bf[var_fc4eacc5fd5d61bf.size] = struct;
        }
    }
    var_adbf09495b575466 = [];
    foreach (quadrant in [0:topleft, 1:var_fc4eacc5fd5d61bf, 2:topright, 3:var_e935789d709dd070]) {
        if (quadrant.size > 0) {
            var_adbf09495b575466[var_adbf09495b575466.size] = quadrant;
        }
    }
    if (var_adbf09495b575466.size == 0) {
        return;
    }
    var_adbf09495b575466 = array_randomize(var_adbf09495b575466);
    spawned = 0;
    level.var_939840b6113e9e66 = [];
    while (spawned < data().var_8e3cd6bcc3e4f17c) {
        index = spawned % var_adbf09495b575466.size;
        spawned = spawned + 1;
        struct = var_adbf09495b575466[index][var_adbf09495b575466[index].size - 1];
        var_adbf09495b575466[index][var_adbf09495b575466[index].size - 1] = undefined;
        level.var_939840b6113e9e66[level.var_939840b6113e9e66.size] = spawnscriptable("iw9_mp_scorpion_trophy_bank", struct.origin, struct.angles);
        if (var_adbf09495b575466[index].size == 0) {
            var_d4a4d8d21b1b423a = [];
            foreach (array in var_adbf09495b575466) {
                if (array.size > 0) {
                    var_d4a4d8d21b1b423a[var_d4a4d8d21b1b423a.size] = array;
                }
            }
            var_adbf09495b575466 = var_d4a4d8d21b1b423a;
        }
        if (var_adbf09495b575466.size == 0) {
            break;
        }
    }
    level.var_6aa304e25520289f = undefined;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb99
// Size: 0x9a
function private function_340f4f4118dcf7c3(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isvalidplayer(player)) {
        return;
    }
    if (!player function_1c8b9d8312271186()) {
        return;
    }
    player showsplash("scorpion_trophy_banked");
    success = player function_4c65595e68db285c();
    instance setscriptablepartstate("upload", "on");
    player function_3677f2be30fdd581("trophy_effects", "upload");
    if (success) {
        player thread namespace_cb965d2f71fefddc::playerplaypickupanim();
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc3a
// Size: 0x215
function private function_ddcb9338c5cd1d29(var_642470e1abc1bbf9) {
    if (!isdefined(self)) {
        return;
    }
    if (!function_1dc73c36b8cb3eca()) {
        return;
    }
    entnum = self getentitynumber();
    if (!isdefined(entnum)) {
        return;
    }
    if (isdefined(data().triggers[entnum])) {
        data().triggers[entnum] thread cleanup(0);
    }
    if (!isdefined(var_642470e1abc1bbf9) || !isvalidplayer(var_642470e1abc1bbf9.attacker)) {
        return;
    }
    if (var_642470e1abc1bbf9.attacker == self) {
        return;
    }
    if (level.teambased && is_equal(self.team, var_642470e1abc1bbf9.attacker.team)) {
        return;
    }
    if (!var_642470e1abc1bbf9.attacker function_2a504551561a812c()) {
        return;
    }
    attackerentnum = var_642470e1abc1bbf9.attacker getentitynumber();
    if (!isdefined(data().dropped[entnum])) {
        data().dropped[entnum] = [];
    }
    if (isdefined(data().dropped[entnum][attackerentnum])) {
        return;
    }
    var_d849e5e65179d50b = 0;
    if (function_1c8b9d8312271186()) {
        var_d849e5e65179d50b = int(min(data().var_de335d425ab8c9b0[entnum], data().var_ff2afeeaaa71f4bc));
        data().var_de335d425ab8c9b0[entnum] = data().var_de335d425ab8c9b0[entnum] - var_d849e5e65179d50b;
        self setclientomnvar("ui_scorpion_trophies_collected", data().var_de335d425ab8c9b0[entnum]);
    }
    trigger = function_cfb0bd180308a4ba(data().dropcount, self, var_d849e5e65179d50b, self.origin, entnum, var_642470e1abc1bbf9.attacker, "player_kill");
    trigger.var_e7c898d742b4ba46 = var_642470e1abc1bbf9.attacker;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe56
// Size: 0x1cc
function private function_3354140884867d15(dropstruct, attacker) {
    if (!isdefined(self)) {
        return;
    }
    if (!function_1dc73c36b8cb3eca()) {
        return;
    }
    entnum = self getentitynumber();
    if (!isdefined(entnum)) {
        return;
    }
    if (isdefined(data().var_50abd2e2174e8f51[entnum])) {
        foreach (trophy in data().var_50abd2e2174e8f51[entnum]) {
            trophy thread function_5179a5ddca15a921();
        }
        data().var_50abd2e2174e8f51[entnum] = undefined;
    }
    if (isvalidplayer(attacker)) {
        if (!isdefined(data().dropped[entnum])) {
            data().dropped[entnum] = [];
        }
        if (isdefined(data().dropped[entnum][attacker.team])) {
            return;
        }
    }
    var_d849e5e65179d50b = 0;
    if (function_1c8b9d8312271186()) {
        var_d849e5e65179d50b = int(min(data().var_de335d425ab8c9b0[entnum], data().var_ff2afeeaaa71f4bc));
        data().var_de335d425ab8c9b0[entnum] = data().var_de335d425ab8c9b0[entnum] - var_d849e5e65179d50b;
        self setclientomnvar("ui_scorpion_trophies_collected", data().var_de335d425ab8c9b0[entnum]);
    }
    function_cfb0bd180308a4ba(data().dropcount, self, var_d849e5e65179d50b, self.origin, entnum, attacker, "player_kill", dropstruct);
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1029
// Size: 0x51
function private onplayerdisconnect(params) {
    if (!isvalidplayer(self)) {
        return;
    }
    if (function_1c8b9d8312271186()) {
        self dlog_recordplayerevent("dlog_event_scorpion_not_banked", [0:"count", 1:data().var_de335d425ab8c9b0[self getentitynumber()]]);
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1081
// Size: 0x6b
function private onplayerconnect(params) {
    if (!isvalidplayer(self)) {
        return;
    }
    self setclientomnvar("ui_scorpion_trophies_collected", function_53c4c53197386572(data().var_de335d425ab8c9b0[self getentitynumber()], 0));
    self setclientomnvar("ui_scorpion_trophies_secured", function_53c4c53197386572(data().var_eb3be366abc17855[self getentitynumber()], 0));
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10f3
// Size: 0x17
function private function_66d05c31053f7c8f(params) {
    if (!isvalidplayer(self)) {
        return;
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1111
// Size: 0x1e
function private function_c8958695acf2e1f1(killer, dropstruct) {
    function_a1ffa457f63d28fd(self, killer, dropstruct);
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1136
// Size: 0xcd
function private function_a1ffa457f63d28fd(agent, killer, dropstruct) {
    if (!function_1dc73c36b8cb3eca()) {
        return;
    }
    if (data().var_7d56c242c2c9880a <= 0) {
        return;
    }
    if (!isvalidplayer(killer)) {
        return;
    }
    if (!killer function_2a504551561a812c()) {
        return;
    }
    if (randomint(100) > data().var_7d56c242c2c9880a) {
        return;
    }
    function_cfb0bd180308a4ba(data().var_dbad26986ec8f069, agent, 0, agent.origin, data().var_a082b242b6fae420, killer, "ai_kill", dropstruct);
    data().var_a082b242b6fae420 = data().var_a082b242b6fae420 + 1;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120a
// Size: 0x6e
function private function_aa629573b9b452b7(items, opener, var_64c59c08b4538d72) {
    if (!istrue(var_64c59c08b4538d72)) {
        return items;
    }
    if (!function_1dc73c36b8cb3eca()) {
        return items;
    }
    if (!isvalidplayer(opener)) {
        return items;
    }
    if (!opener function_2a504551561a812c()) {
        return items;
    }
    if (randomint(100) > data().var_4e54edc5768a0ad4) {
        return items;
    }
    items[items.size] = "brloot_scorpion_trophy";
    return items;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1280
// Size: 0xaa
function private function_735a4fd352102f67(opener, dropstruct) {
    if (!function_1dc73c36b8cb3eca()) {
        return;
    }
    if (!isvalidplayer(opener)) {
        return;
    }
    if (!opener function_2a504551561a812c()) {
        return;
    }
    if (randomint(100) > data().var_4e54edc5768a0ad4) {
        return;
    }
    trophies = function_cfb0bd180308a4ba(1, self, 0, self.origin, data().var_a082b242b6fae420, undefined, "loot", dropstruct);
    data().var_a082b242b6fae420 = data().var_a082b242b6fae420 + 1;
    return trophies;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1332
// Size: 0x6f
function private function_76c38f4af5d006ea(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(instance) || !isdefined(instance.type) || instance.type != "brloot_scorpion_trophy") {
        return;
    }
    function_199f02943420e747(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, 1);
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13a8
// Size: 0x260
function private function_199f02943420e747(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, var_71b664f5ab636333) {
    if (!isdefined(instance) || !isdefined(instance.type) || instance.type != "brloot_scorpion_trophy") {
        return;
    }
    if (isdefined(instance.team) && instance.team == player.team) {
        if (isdefined(instance.var_926f48790e712666)) {
            data().var_de335d425ab8c9b0[instance.entnum] = function_5bff4e2a3631e3e5(instance.entnum, 1);
            if (isdefined(instance.var_926f48790e712666)) {
                instance.var_926f48790e712666 showsplash("scorpion_trophy_recovered");
                instance.var_926f48790e712666 setclientomnvar("ui_scorpion_trophies_collected", data().var_de335d425ab8c9b0[instance.entnum]);
            }
        }
        if (!isdefined(instance.var_926f48790e712666) || instance.var_926f48790e712666 != player) {
            player showsplash("scorpion_trophy_denied");
        }
    } else {
        player function_439f0781dbd8a339(1, function_53c4c53197386572(instance.var_5d30e45c6d206a9e, "loot"));
        if (isdefined(instance.team)) {
            data().dropped[instance.entnum][player.team] = 1;
        }
    }
    player function_3677f2be30fdd581("trophy_effects", "pickup");
    if (!istrue(var_71b664f5ab636333)) {
        player thread namespace_cb965d2f71fefddc::playerplaypickupanim();
    }
    data().var_50abd2e2174e8f51[instance.entnum] = array_remove(data().var_50abd2e2174e8f51[instance.entnum], instance);
    if (data().var_50abd2e2174e8f51[instance.entnum].size == 0) {
        data().var_50abd2e2174e8f51[instance.entnum] = undefined;
    }
    instance thread function_5179a5ddca15a921(1);
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x160f
// Size: 0x37
function private function_b468ee3a4aad8f93(scriptable, player) {
    player function_439f0781dbd8a339(1, "loot");
    player function_3677f2be30fdd581("trophy_effects", "pickup");
    return 1;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x164e
// Size: 0x22
function private function_f858675bc65238fe() {
    if (isdefined(self.trigger)) {
        self.trigger thread cleanup(0);
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1677
// Size: 0x5
function private function_c2feb4d9932dfdcc() {
    return 1;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1684
// Size: 0x6b
function private ongameended(data) {
    if (!function_8efd0a6812869ea2()) {
        return;
    }
    foreach (player in level.players) {
        player function_4c65595e68db285c();
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16f6
// Size: 0xa
function private function_d5e7a53fa83f629d() {
    function_4c65595e68db285c();
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 8, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1707
// Size: 0x42d
function private function_cfb0bd180308a4ba(count, from, var_d849e5e65179d50b, origin, entnum, killer, type, dropstruct) {
    if (!isdefined(dropstruct) && isBRStyleGameType()) {
        /#
            assertmsg("Trying to spawn a trophy without a drop struct. This isn't allowed in BR");
        #/
        return;
    }
    count = count + function_53c4c53197386572(var_d849e5e65179d50b, 0);
    mover = undefined;
    if (isdefined(from) && isent(from) && isplayer(from)) {
        mover = from getmovingplatformparent();
    }
    if (isBRStyleGameType()) {
        var_50abd2e2174e8f51 = [];
        for (i = 0; i < count; i++) {
            if (isent(from)) {
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, from.origin, from.angles, from, undefined, undefined, randomfloatrange(15, 30));
            } else {
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, from.origin, from.angles, undefined, 115 + randomfloatrange(-10, 10), 35 + randomfloatrange(-5, 5), randomfloatrange(15, 30));
            }
            trophy = spawnscriptable("brloot_scorpion_trophy", var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, undefined, var_cb4fad49263e20c4.payload);
            trophy.entnum = entnum;
            trophy.isentity = 0;
            trophy.var_5d30e45c6d206a9e = type;
            namespace_cb965d2f71fefddc::registerscriptableinstance(trophy);
            if (isent(from) && isplayer(from)) {
                trophy.team = from.team;
            }
            if (var_d849e5e65179d50b > 0) {
                trophy.var_926f48790e712666 = from;
                var_d849e5e65179d50b = var_d849e5e65179d50b - 1;
            }
            mover = var_cb4fad49263e20c4.groundentity;
            if (isdefined(mover)) {
                trophy function_6e506f39f121ea8a(mover, rotatevectorinverted(trophy.origin - mover.origin, mover.angles));
                trophy setscriptablepartstate("brloot_scorpion_trophy", "dropped_linked");
            } else {
                trophy setscriptablepartstate("brloot_scorpion_trophy", "dropped");
            }
            var_50abd2e2174e8f51[var_50abd2e2174e8f51.size] = trophy;
        }
        data().var_50abd2e2174e8f51[entnum] = var_50abd2e2174e8f51;
        return var_50abd2e2174e8f51;
    } else {
        var_22ce7236b68b2334 = [];
        trophies = [];
        if (count > 1) {
            angle = randomfloat(360);
            for (i = 0; i < count; i++) {
                offset = (cos(angle), sin(angle), 0) * 12;
                var_22ce7236b68b2334[var_22ce7236b68b2334.size] = offset + origin;
                angle = angle + 360 / count;
            }
        } else {
            var_22ce7236b68b2334[var_22ce7236b68b2334.size] = origin;
        }
        foreach (spawnpos in var_22ce7236b68b2334) {
            trophy = spawn("script_model", spawnpos + (0, 0, randomfloatrange(18, 27)));
            trophy setmodel("iw9_mp_scorpion_trophy_entity");
            if (isdefined(killer)) {
                trophy showonlytoplayer(killer);
            }
            trophy setscriptablepartstate("iw9_mp_scorpion_trophy_entity", "visible");
            trophy.isentity = 1;
            trophy.angles = (0, randomfloat(360), 0);
            trophy rotatevelocity((0, randomfloatrange(45, 135) * ter_op(cointoss(), 1, -1), 0), 9999);
            if (isdefined(mover)) {
                trophy linkto(mover);
            }
            trophies[trophies.size] = trophy;
        }
        return function_128edf2232d31c50(origin, ter_op(count > 1, 45, 35), entnum, trophies, type, var_d849e5e65179d50b, from, mover);
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 8, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b3b
// Size: 0x14b
function private function_128edf2232d31c50(origin, radius, entnum, trophies, type, var_d849e5e65179d50b, fromPlayer, mover) {
    if (isdefined(mover)) {
        trigger = spawn("trigger_radius", origin, 0, radius, 35);
        trigger enablelinkto();
        trigger linkto(mover);
        trigger thread function_1dabbbecf02dd66b(mover);
    } else {
        trigger = spawn("noent_volume_trigger_radius", origin, 0, radius, 35);
    }
    trigger.var_182d8860fac4c70b = trophies;
    trigger.entnum = entnum;
    trigger.type = type;
    trigger.fromPlayer = fromPlayer;
    trigger.var_d849e5e65179d50b = var_d849e5e65179d50b;
    foreach (trophy in trophies) {
        trophy.trigger = trigger;
    }
    trigger thread watchtrigger();
    data().triggers[entnum] = trigger;
    return trigger;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c8e
// Size: 0x1df
function private watchtrigger() {
    self endon("remove");
    while (1) {
        ent = self waittill("trigger");
        if (!isvalidplayer(ent)) {
            continue;
        }
        if (isdefined(self.team) && ent.team == self.team) {
            if (self.var_d849e5e65179d50b > 0) {
                data().var_de335d425ab8c9b0[self.entnum] = function_5bff4e2a3631e3e5(self.entnum, self.var_d849e5e65179d50b);
                if (isdefined(self.fromPlayer)) {
                    self.fromPlayer showsplash("scorpion_trophy_recovered");
                    self.fromPlayer setclientomnvar("ui_scorpion_trophies_collected", data().var_de335d425ab8c9b0[self.entnum]);
                }
            }
            if (!isdefined(self.fromPlayer) || self.fromPlayer != ent) {
                ent showsplash("scorpion_trophy_denied");
            }
            thread cleanup(1);
            continue;
        }
        if (!ent function_2a504551561a812c()) {
            continue;
        }
        if (isdefined(self.var_e7c898d742b4ba46)) {
            if (self.var_e7c898d742b4ba46 != ent) {
                continue;
            }
            data().dropped[self.entnum][ent getentitynumber()] = 1;
        } else if (isdefined(self.team)) {
            data().dropped[self.entnum][ent.team] = 1;
        }
        ent function_439f0781dbd8a339(self.var_182d8860fac4c70b.size, self.type);
        ent function_3677f2be30fdd581("trophy_effects", "pickup");
        thread cleanup(1);
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e74
// Size: 0x31c
function private function_439f0781dbd8a339(num, type) {
    entnum = self getentitynumber();
    event = undefined;
    switch (type) {
    case #"hash_7da50b39ef481517":
        event = "dlog_event_scorpion_gathered_loot";
        break;
    case #"hash_5d0d8e1242960ca0":
        event = "dlog_event_scorpion_gathered_ai_kill";
        break;
    case #"hash_3c12327fb1211161":
        event = "dlog_event_scorpion_gathered_player_kill";
        break;
    }
    if (!isdefined(data().var_de335d425ab8c9b0[entnum])) {
        data().var_de335d425ab8c9b0[entnum] = 0;
    }
    before = data().var_de335d425ab8c9b0[entnum];
    after = function_5bff4e2a3631e3e5(entnum, num);
    data().var_de335d425ab8c9b0[entnum] = after;
    if (after > before) {
        self dlog_recordplayerevent(event, [0:"count", 1:after - before]);
        self setclientomnvar("ui_scorpion_trophies_collected", after);
        thread namespace_48a08c5037514e04::doScoreEvent(#"hash_ccb945806d13fd43");
        var_9164e8cfb80749ff = function_644b35bc4f205dcb();
        splash = undefined;
        if (var_9164e8cfb80749ff == data().maxcount) {
            self dlog_recordplayerevent("dlog_event_scorpion_limit_reached", [0:"limit", 1:data().maxcount]);
            if (isBRStyleGameType()) {
                if (namespace_cd0b2d039510b38d::getsubgametype() == "plunder") {
                    splash = "scorpion_trophy_collected_plunder_max";
                } else {
                    splash = "scorpion_trophy_collected_br_max";
                }
            } else {
                splash = "scorpion_trophy_collected_core_max";
            }
        } else if (isBRStyleGameType()) {
            if (namespace_cd0b2d039510b38d::getsubgametype() == "plunder") {
                splash = "scorpion_trophy_collected_plunder";
            } else {
                splash = "scorpion_trophy_collected_br";
            }
        } else {
            splash = "scorpion_trophy_collected_core";
        }
        showsplash(splash);
        if ((var_9164e8cfb80749ff == data().maxcount || var_9164e8cfb80749ff == 1) && isdefined(level.var_939840b6113e9e66) && level.var_939840b6113e9e66.size > 0) {
            closest = sortbydistance(level.var_939840b6113e9e66, self.origin)[0];
            foreach (teammate in namespace_54d20dd0dd79277f::getteamdata(self.team, "players")) {
                if (teammate function_bee315a15cf61820(closest.index)) {
                    return;
                }
            }
            var_d0ae85b60ec1f5f7 = namespace_ede58c1e66c2c280::calloutmarkerping_createcallout(18, (0, 0, 100), closest.index);
            thread namespace_ede58c1e66c2c280::function_9a7200f5142066ba(self, var_d0ae85b60ec1f5f7, undefined, [0:"death_or_disconnect", 1:"enter_live_ragdoll"], 30);
        }
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2197
// Size: 0x7e
function private function_5bff4e2a3631e3e5(entnum, num) {
    before = data().var_de335d425ab8c9b0[entnum];
    after = before + num;
    var_a5407b03b3e5f39f = data().maxcount - function_53c4c53197386572(data().var_eb3be366abc17855[entnum], 0);
    if (after > var_a5407b03b3e5f39f) {
        after = var_a5407b03b3e5f39f;
    }
    return after;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x221d
// Size: 0x191
function private function_4c65595e68db285c() {
    if (!isvalidplayer(self)) {
        return 0;
    }
    if (!function_1c8b9d8312271186()) {
        return 0;
    }
    entnum = self getentitynumber();
    num = data().var_de335d425ab8c9b0[entnum];
    self dlog_recordplayerevent("dlog_event_scorpion_banked", [0:"count", 1:num]);
    var_7c6183ce9e04512e = #"hash_f6befbe618f1037b";
    var_a7a6077754bbc2f8 = namespace_ec6836c9475c9d18::function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    params = [0:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version"), 1:1, 2:namespace_ec6836c9475c9d18::function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"value"), 3:num];
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", var_a7a6077754bbc2f8, params);
    }
    thread namespace_48a08c5037514e04::doScoreEvent(#"hash_d7637699e926cbc6");
    if (!isdefined(data().var_eb3be366abc17855[entnum])) {
        data().var_eb3be366abc17855[entnum] = 0;
    }
    data().var_eb3be366abc17855[entnum] = data().var_eb3be366abc17855[entnum] + num;
    data().var_de335d425ab8c9b0[entnum] = 0;
    self setclientomnvar("ui_scorpion_trophies_collected", 0);
    self setclientomnvar("ui_scorpion_trophies_secured", data().var_eb3be366abc17855[entnum]);
    return 1;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23b6
// Size: 0x24
function private function_1dabbbecf02dd66b(mover) {
    self endon("remove");
    mover waittill("death");
    thread cleanup(0);
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23e1
// Size: 0x9a
function private cleanup(used) {
    if (isdefined(self.var_182d8860fac4c70b)) {
        foreach (trophy in self.var_182d8860fac4c70b) {
            trophy thread function_5179a5ddca15a921(used);
        }
    }
    self notify("remove");
    data().triggers[self.entnum] = undefined;
    waittillframeend();
    self delete();
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2482
// Size: 0x7e
function private function_5179a5ddca15a921(used) {
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.deleting)) {
        return;
    }
    self.deleting = 1;
    state = ter_op(istrue(used), "pickup", "deleted");
    self setscriptablepartstate(self function_ec5f4851431f3382(), state);
    wait(3);
    if (istrue(self.isentity)) {
        self delete();
    } else {
        namespace_cb965d2f71fefddc::function_7b67823458cd14();
        self freescriptable();
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2507
// Size: 0x90
function private onteamchange(player, oldteam, newteam) {
    entnum = player getentitynumber();
    if (!isdefined(entnum) || !isdefined(data().triggers[entnum])) {
        return;
    }
    /#
        assert(data().triggers[entnum].team == oldteam);
    #/
    data().triggers[entnum].team = newteam;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x259e
// Size: 0x6d
function private showsplash(splash) {
    if (isdefined(self.var_d072e417b4cd76a) && self.var_d072e417b4cd76a > gettime()) {
        return;
    }
    self.var_d072e417b4cd76a = gettime() + 1000;
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz") {
        namespace_d696adde758cbe79::showDMZSplash(splash, [0:self]);
    } else {
        thread namespace_44abc05161e2e2cb::showsplash(splash, undefined, undefined, undefined, 1);
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2612
// Size: 0x2b
function private function_2a504551561a812c() {
    entnum = self getentitynumber();
    return function_644b35bc4f205dcb() < data().maxcount;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2645
// Size: 0x5f
function private function_644b35bc4f205dcb() {
    entnum = self getentitynumber();
    var_d8fed4d7ad83256a = function_53c4c53197386572(data().var_de335d425ab8c9b0[entnum], 0);
    var_4a7273fe950a1c5f = function_53c4c53197386572(data().var_eb3be366abc17855[entnum], 0);
    return var_d8fed4d7ad83256a + var_4a7273fe950a1c5f;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26ac
// Size: 0x1e
function private function_1dc73c36b8cb3eca() {
    return !namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c() || data().var_3f2e2cb7b92e01ef;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26d2
// Size: 0x3d
function private isvalidplayer(player) {
    return isdefined(player) && isplayer(player) && !isbot(player) && isdefined(player getentitynumber()) && isdefined(player.team);
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2717
// Size: 0x9
function private function_f5681f11e80e8dd6() {
    return isBRStyleGameType();
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2728
// Size: 0xa
function private function_8efd0a6812869ea2() {
    return !isBRStyleGameType();
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x273a
// Size: 0x12
function private function_950cde7e875198d1() {
    return ter_op(isBRStyleGameType(), 2, 0);
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2754
// Size: 0x2f
function private function_fdf3d038ad278d6b() {
    return ter_op(level.mapname == "mp_saba2" || level.mapname == "mp_saba", 6, 2);
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x278b
// Size: 0x52
function private function_1c8b9d8312271186() {
    if (!isdefined(self) || !isdefined(self getentitynumber())) {
        return 0;
    }
    entnum = self getentitynumber();
    return isdefined(data().var_de335d425ab8c9b0[entnum]) && data().var_de335d425ab8c9b0[entnum] > 0;
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x27e5
// Size: 0x55
function private function_f4792371ad163637() {
    if (!isdefined(self) || !isdefined(self getentitynumber())) {
        return 0;
    }
    entnum = self getentitynumber();
    if (isdefined(data().var_eb3be366abc17855[entnum])) {
        return data().var_eb3be366abc17855[entnum];
    } else {
        return 0;
    }
}

// Namespace namespace_d09b27d6534a97c/namespace_d856b08ddfedc495
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2841
// Size: 0xa
function private data() {
    return game["scorpionEvent"];
}

