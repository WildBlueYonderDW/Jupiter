// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using script_26ccbfe3954cacf4;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_72af5a878a9d3397;
#using scripts\mp\teams.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\bots\bots.gsc;
#using script_4c9bd9a3bf3f8cf7;

#namespace namespace_2767334de2e180cd;

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79d
// Size: 0x5a
function function_b2502f3345564abf() {
    /#
        if (getdvarint(@"hash_d95f6cfac74fa872", 0)) {
            return 0;
        }
    #/
    if (istrue(level.var_7b37b2193f163b9b.var_b871280cbdc11caf)) {
        return 0;
    }
    if (namespace_95d8d8ec67e3e074::function_a420e0f6eca5f1c6()) {
        return 0;
    }
    if (!isdefined(self)) {
        /#
            assertmsg("WARNING: CanBeRecycled() bot is undefined! Skip recycle.");
        #/
        return 0;
    }
    return !function_6f6c5cb39cd095b0();
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ff
// Size: 0x10c
function function_6f6c5cb39cd095b0() {
    if (!function_6dd2dfeb41384764()) {
        return 0;
    }
    if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        var_786f842d5771cdb6 = function_538e92208b641725();
        foreach (var_e72dfdb2a9343f1b in var_786f842d5771cdb6) {
            if (!var_e72dfdb2a9343f1b.isai && var_e72dfdb2a9343f1b.team == self.team) {
                return 1;
            }
        }
    } else {
        teammates = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
        foreach (player in teammates) {
            if (!isai(player)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x913
// Size: 0x7b
function function_d3638cf9a2da76a(reason) {
    if (!function_b2502f3345564abf()) {
        return 0;
    }
    if (!isdefined(reason)) {
        reason = "unknown reason";
    }
    /#
        println(" locked=" + self getentitynumber() + "UIBotCount mismatch! team=" + self.name + " countInTeamData=" + reason);
    #/
    self.uibot.var_c2ad339c4e95c7fe = strtok(reason, " ")[0];
    thread function_b20f2224a6fa748e();
    return 1;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x996
// Size: 0xa
function function_b20f2224a6fa748e() {
    deactivate();
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a7
// Size: 0x246
function deactivate() {
    var_7577420d6146984a = 0;
    if (function_d012729eac1e7053()) {
        var_7577420d6146984a = 1;
        level.var_7b37b2193f163b9b.var_892fa74a6b549ef0 = array_remove(level.var_7b37b2193f163b9b.var_892fa74a6b549ef0, self);
    }
    function_2c2b5b435027f895(undefined);
    var_89a675c5bde8848f = spawnstruct();
    var_89a675c5bde8848f.uibot = 1;
    var_89a675c5bde8848f.name = self.name;
    var_89a675c5bde8848f.team = self.team;
    var_89a675c5bde8848f.squad = self.var_ff97225579de16a;
    var_89a675c5bde8848f.gulaguses = self.gulaguses;
    var_89a675c5bde8848f.operatorcustomization = self.operatorcustomization;
    var_89a675c5bde8848f.difficulty = self botgetdifficulty();
    var_89a675c5bde8848f.var_e2055bf088954e86 = self.var_e2055bf088954e86;
    var_89a675c5bde8848f.locked = 0;
    var_89a675c5bde8848f.plundercount = self.plundercount;
    var_89a675c5bde8848f.xuid = self.xuid;
    if (namespace_92443376a63aa4bd::isenabled()) {
        /#
            assert(isdefined(self.var_ff1a8c6f49882fe8));
        #/
        var_89a675c5bde8848f.var_ff1a8c6f49882fe8 = self.var_ff1a8c6f49882fe8;
    }
    var_89a675c5bde8848f.pers = [];
    var_89a675c5bde8848f.pers["kills"] = self.pers["kills"];
    var_89a675c5bde8848f.pers["deaths"] = self.pers["deaths"];
    var_89a675c5bde8848f.pers["shotsFired"] = self.pers["shotsFired"];
    var_89a675c5bde8848f.pers["shotsHit"] = self.pers["shotsHit"];
    function_2b281a85caa4abde(var_89a675c5bde8848f);
    self.uibot.var_7dbb8165d792b06c = 1;
    self.var_b8e75e4315698cd = var_89a675c5bde8848f;
    kickplayer("uibot", ter_op(var_7577420d6146984a, "dormant", "active"));
    level notify("ui_bot_counter_updated");
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf4
// Size: 0x57
function function_e81d83cfe1ab45fc(count, var_a4273e17f90bfbe6, reason) {
    for (i = 0; i < count; i++) {
        var_89a675c5bde8848f = function_32ec26ab4915f882();
        if (!isdefined(var_89a675c5bde8848f)) {
            break;
        }
        var_89a675c5bde8848f activate(var_a4273e17f90bfbe6, reason);
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc52
// Size: 0x1dd
function function_33227166f85d1aea(count, var_a4273e17f90bfbe6, reason) {
    var_e81bfdb1cb64fbec = function_33a64af3f46cb84d(count);
    foreach (profile in var_e81bfdb1cb64fbec) {
        function_516b85f3bbc993a7(profile);
    }
    foreach (profile in var_e81bfdb1cb64fbec) {
        profile.var_db1b05e55e874b47 = reason;
        namespace_92443376a63aa4bd::function_c622e0ea21d494fe(profile, reason);
    }
    bots = namespace_41f4dfb71dd08362::function_7d92b857142dbdc6(var_e81bfdb1cb64fbec, undefined, &function_9570b978f27641ef, undefined, "spawned_bots");
    if (bots.size < var_e81bfdb1cb64fbec.size) {
        /#
            assertmsg(var_e81bfdb1cb64fbec.size - bots.size + " bots failed to be spawned.");
        #/
        var_b727546678ab62b = 0;
        foreach (profile in var_e81bfdb1cb64fbec) {
            if (isdefined(profile.bot)) {
                var_b727546678ab62b++;
            } else {
                profile function_1ee0d9f85f7dc5d9(reason);
            }
        }
        /#
            assert(var_b727546678ab62b == bots.size);
        #/
    }
    foreach (bot in bots) {
        bot thread function_e164f99ea8cc4a48(var_a4273e17f90bfbe6, reason);
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe36
// Size: 0xbf
function function_e164f99ea8cc4a48(var_a4273e17f90bfbe6, reason) {
    bot = self;
    if (!istrue(bot.var_deb55e4a0429ef1)) {
        bot waittill_any_in_array_return([0:"bot_br_super_think", 1:"death_or_disconnect"]);
        if (!function_ded80385ea7471db(bot)) {
            return undefined;
        }
    }
    /#
        assert(isvalidplayer(bot));
    #/
    bot function_142b713a2846f9ac("Activated - UI Bot");
    bot function_1e8fe34f5dfdea49(var_a4273e17f90bfbe6);
    bot function_7d256d3586241325(reason);
    bot function_6fb380927695ee76();
    bot function_985b0973f29da4f8("ui_bot::ResumeStatusThread()");
    bot.var_7ca8ac9793bc9c22 = undefined;
    level notify("ui_bot_counter_updated");
    bot namespace_92443376a63aa4bd::function_b1c37e649a5cd380("active", "uibot");
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefc
// Size: 0xcf
function activate(var_a4273e17f90bfbe6, reason) {
    level endon("game_ended");
    function_516b85f3bbc993a7(self);
    self.var_db1b05e55e874b47 = reason;
    namespace_92443376a63aa4bd::function_c622e0ea21d494fe(self, reason);
    if (!function_f7bbd79229321acb(self, function_538e92208b641725())) {
        logstring("[UIBOT] Activate: Drop UI Bots: " + self.name + " xuid: " + self.xuid);
        function_1ee0d9f85f7dc5d9(reason + "_InvalidBotProfile");
        return undefined;
    }
    bots = namespace_41f4dfb71dd08362::function_7d92b857142dbdc6([0:self], self.team, &function_9570b978f27641ef, undefined, "spawned_bots");
    if (bots.size == 0) {
        function_1ee0d9f85f7dc5d9(reason);
        return undefined;
    }
    bot = bots[0];
    bot function_e164f99ea8cc4a48(var_a4273e17f90bfbe6, reason);
    return bot;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd3
// Size: 0x63
function function_1ee0d9f85f7dc5d9(reason) {
    namespace_92443376a63aa4bd::function_1968d5899aa0a0cb(self, "kickout", "uibot");
    success = function_8edd1fb6091a089f(self);
    if (!success) {
        return;
    }
    namespace_92443376a63aa4bd::function_c622e0ea21d494fe(self, reason + "_failed");
    function_551f4f12c0e20c06();
    /#
        assertmsg("Can't activate a UI bot because the spawn fails! botProfileName=" + self.name);
    #/
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103d
// Size: 0x4a
function function_551f4f12c0e20c06() {
    team = self.team;
    if (namespace_95d8d8ec67e3e074::isteameliminated(team)) {
        namespace_54d20dd0dd79277f::setteamdata(team, "deathEvent", 0);
        namespace_54d20dd0dd79277f::modifyteamdata(team, "hasSpawned", 1);
        [[ level.updategameevents ]]();
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108e
// Size: 0x15f
function function_c827480e6d21a271() {
    var_89a675c5bde8848f = self.var_5876cd9fc14af731;
    if (isdefined(var_89a675c5bde8848f)) {
        self.gulaguses = var_89a675c5bde8848f.gulaguses;
        if (istrue(level.br_c130spawndone)) {
            self.jumped = 1;
        }
        self.uibot.var_7dbb8165d792b06c = 0;
        self.plundercount = var_89a675c5bde8848f.plundercount;
        self.pers["kills"] = var_89a675c5bde8848f.pers["kills"];
        self.pers["deaths"] = var_89a675c5bde8848f.pers["deaths"];
        self.pers["shotsFired"] = var_89a675c5bde8848f.pers["shotsFired"];
        self.pers["shotsHit"] = var_89a675c5bde8848f.pers["shotsHit"];
        success = function_8edd1fb6091a089f(var_89a675c5bde8848f);
        /#
            assertex(success, "botProfile already removed! name=" + var_89a675c5bde8848f.name + " locked=" + var_89a675c5bde8848f.locked + " team=" + var_89a675c5bde8848f.team);
        #/
        namespace_92443376a63aa4bd::function_c622e0ea21d494fe(var_89a675c5bde8848f, var_89a675c5bde8848f.var_db1b05e55e874b47 + "_succeeded");
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f4
// Size: 0x52
function function_83574001589fb42d() {
    if (isdefined(self.var_5876cd9fc14af731)) {
        self.operatorcustomization = self.var_5876cd9fc14af731.operatorcustomization;
        namespace_6d8da2b47f878104::setmodelfromcustomization();
        self.var_5876cd9fc14af731 = undefined;
        logstring("[Super Bots] Bot late recovered from uiBot:" + self.name);
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0xc5
function function_2b281a85caa4abde(var_89a675c5bde8848f) {
    team = var_89a675c5bde8848f.team;
    level.var_7b37b2193f163b9b.var_156f390a5362bc55[level.var_7b37b2193f163b9b.var_156f390a5362bc55.size] = var_89a675c5bde8848f;
    level.teamdata[team]["UIBotCount"]++;
    level.teamdata[team]["UnlockedUIBotCount"]++;
    function_b3bb8f282b894dad(team);
    /#
        assert(level.teamdata[team]["UIBotCount"] > 0);
    #/
    /#
        assert(level.teamdata[team]["UnlockedUIBotCount"] > 0);
    #/
    /#
        assert(!var_89a675c5bde8848f.locked);
    #/
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1319
// Size: 0xd0
function function_8edd1fb6091a089f(var_89a675c5bde8848f) {
    if (!array_contains(level.var_7b37b2193f163b9b.var_156f390a5362bc55, var_89a675c5bde8848f)) {
        return 0;
    }
    team = var_89a675c5bde8848f.team;
    /#
        assert(level.teamdata[team]["UIBotCount"] > 0);
    #/
    /#
        assert(var_89a675c5bde8848f.locked);
    #/
    var_89a675c5bde8848f.locked = 0;
    level.var_7b37b2193f163b9b.var_156f390a5362bc55 = array_remove(level.var_7b37b2193f163b9b.var_156f390a5362bc55, var_89a675c5bde8848f);
    level.teamdata[team]["UIBotCount"]--;
    function_b3bb8f282b894dad(team);
    level notify("ui_bot_counter_updated");
    return 1;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f1
// Size: 0xb3
function function_3e4c2fe4a6617607() {
    foreach (uibot in level.var_7b37b2193f163b9b.var_156f390a5362bc55) {
        team = uibot.team;
        level.teamdata[team]["UIBotCount"] = 0;
        level.teamdata[team]["UnlockedUIBotCount"] = 0;
    }
    level.var_7b37b2193f163b9b.var_156f390a5362bc55 = [];
    level notify("ui_bot_counter_updated");
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ab
// Size: 0x126
function function_cde96c5b28cc69f6() {
    if (!namespace_cd0b2d039510b38d::matchmakinggame()) {
        return;
    }
    if (!namespace_95d8d8ec67e3e074::isinitialized()) {
        return;
    }
    var_786f842d5771cdb6 = function_538e92208b641725();
    var_156f390a5362bc55 = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
    var_bb621279272ee27a = [];
    foreach (profile in var_156f390a5362bc55) {
        if (!istrue(profile.locked) && !function_f7bbd79229321acb(profile, var_786f842d5771cdb6)) {
            var_bb621279272ee27a = array_add(var_bb621279272ee27a, profile);
        }
    }
    foreach (profile in var_bb621279272ee27a) {
        function_516b85f3bbc993a7(profile);
        logstring("[UIBOT] Drop UI Bots: " + profile.name + " xuid: " + profile.xuid);
        function_8edd1fb6091a089f(profile);
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d8
// Size: 0xe5
function function_f7bbd79229321acb(var_89a675c5bde8848f, var_786f842d5771cdb6) {
    if (!isdefined(var_89a675c5bde8848f)) {
        return 0;
    }
    if (namespace_cd0b2d039510b38d::matchmakinggame()) {
        if (!isdefined(var_89a675c5bde8848f.xuid) || var_89a675c5bde8848f.xuid == "") {
            /#
                assertmsg("[UIBOT] Bot profile xuid is undefined or empty! Name:" + var_89a675c5bde8848f.name);
            #/
            return 1;
        }
        found = 0;
        foreach (var_e72dfdb2a9343f1b in var_786f842d5771cdb6) {
            if (is_equal(var_89a675c5bde8848f.xuid, var_e72dfdb2a9343f1b.xuid)) {
                found = 1;
                break;
            }
        }
        if (!found) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c5
// Size: 0x150
function function_b3bb8f282b894dad(team) {
    var_eada48b37e7e4b05 = 0;
    var_b6bd7a39a24879ee = 0;
    foreach (uibot in level.var_7b37b2193f163b9b.var_156f390a5362bc55) {
        if (uibot.team == team) {
            var_eada48b37e7e4b05++;
            if (!uibot.locked) {
                var_b6bd7a39a24879ee++;
            }
        }
    }
    var_4e57201d0f72c7d6 = level.teamdata[team]["UIBotCount"];
    var_b08aea35d83f4f3d = level.teamdata[team]["UnlockedUIBotCount"];
    if (var_4e57201d0f72c7d6 < 0) {
        namespace_9c840bb9f2ecbf00::demoforcesre("UIBotCount is negative! team=" + team);
    }
    if (var_b08aea35d83f4f3d < 0) {
        namespace_9c840bb9f2ecbf00::demoforcesre("UnlockedUIBotCount is negative! team=" + team);
    }
    if (var_eada48b37e7e4b05 != var_4e57201d0f72c7d6) {
        namespace_9c840bb9f2ecbf00::demoforcesre("UIBotCount mismatch! team=" + team + " countInUIBotManager=" + var_eada48b37e7e4b05 + " countInTeamData=" + var_4e57201d0f72c7d6);
    }
    if (var_b6bd7a39a24879ee != var_b08aea35d83f4f3d) {
        namespace_9c840bb9f2ecbf00::demoforcesre("UnlockedUIBotCount mismatch! team=" + team + " unlockedCountInUIBotManager=" + var_b6bd7a39a24879ee + " unlockedCountInTeamData=" + var_b08aea35d83f4f3d);
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181c
// Size: 0x98
function function_516b85f3bbc993a7(var_89a675c5bde8848f) {
    team = var_89a675c5bde8848f.team;
    if (level.teamdata[team]["UnlockedUIBotCount"] <= 0) {
        namespace_9c840bb9f2ecbf00::demoforcesre("SetBotProfileLocked: UnlockedUIBotCount <= 0! name=" + var_89a675c5bde8848f.name);
        return;
    }
    if (var_89a675c5bde8848f.locked) {
        namespace_9c840bb9f2ecbf00::demoforcesre("SetBotProfileLocked: profile is locked! name=" + var_89a675c5bde8848f.name);
        return;
    }
    var_89a675c5bde8848f.locked = 1;
    level.teamdata[team]["UnlockedUIBotCount"]--;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bb
// Size: 0xa9
function function_9570b978f27641ef() {
    self.uibot = spawnstruct();
    self.uibot.var_7dbb8165d792b06c = 1;
    if (isdefined(level.var_7b37b2193f163b9b.var_9f4a3632d9f75d32)) {
        spawnpoint = spawnstruct();
        spawnpoint.origin = level.var_7b37b2193f163b9b.var_9f4a3632d9f75d32;
        spawnpoint.angles = (0, 0, 0);
        spawnpoint.index = -1;
        self.prespawnspawn = spawnpoint;
        self.var_7ca8ac9793bc9c22 = 1;
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196b
// Size: 0xcd
function function_966ab6ffd873ec11(count, var_dcfac6660215f3be, reason, var_94afb7d602135955) {
    if (count <= 0) {
        return;
    }
    var_68767159ca419dc7 = "Killsome_" + reason;
    for (i = 0; i < count; i++) {
        var_89a675c5bde8848f = function_32ec26ab4915f882();
        if (!isdefined(var_89a675c5bde8848f)) {
            break;
        }
        var_629c48f843740b97 = var_89a675c5bde8848f activate("Combat", var_68767159ca419dc7);
        if (isdefined(var_629c48f843740b97)) {
            if (istrue(var_dcfac6660215f3be)) {
                var_629c48f843740b97.gulaguses = undefined;
                var_629c48f843740b97.var_82bd86e99f1dd1e4 = 1;
                var_629c48f843740b97.var_94afb7d602135955 = var_94afb7d602135955;
            }
            wait(1);
            if (isvalidbot(var_629c48f843740b97)) {
                var_629c48f843740b97 suicide();
            }
        }
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3f
// Size: 0x8d
function function_32ec26ab4915f882(var_6f5c365e73ad85fc) {
    foreach (var_89a675c5bde8848f in level.var_7b37b2193f163b9b.var_156f390a5362bc55) {
        if (isdefined(var_6f5c365e73ad85fc) && var_89a675c5bde8848f.team == var_6f5c365e73ad85fc) {
            continue;
        }
        if (!var_89a675c5bde8848f.locked) {
            return var_89a675c5bde8848f;
        }
    }
    return undefined;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad4
// Size: 0xd1
function function_33a64af3f46cb84d(count) {
    /#
        assert(count > 0 && count <= level.var_7b37b2193f163b9b.var_156f390a5362bc55.size);
    #/
    var_e81bfdb1cb64fbec = [];
    var_786f842d5771cdb6 = function_538e92208b641725();
    foreach (var_89a675c5bde8848f in level.var_7b37b2193f163b9b.var_156f390a5362bc55) {
        if (!var_89a675c5bde8848f.locked && function_f7bbd79229321acb(var_89a675c5bde8848f, var_786f842d5771cdb6)) {
            var_e81bfdb1cb64fbec[var_e81bfdb1cb64fbec.size] = var_89a675c5bde8848f;
            if (var_e81bfdb1cb64fbec.size >= count) {
                break;
            }
        }
    }
    return var_e81bfdb1cb64fbec;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bad
// Size: 0x22b
function function_947b37d99674b59c() {
    level endon("game_ended");
    var_81a80043d8ce8eef = 3000;
    curtime = gettime();
    if (isdefined(self.var_44f4fb2fdd683ffa.var_446d5c9f0f95831d) && curtime - self.var_44f4fb2fdd683ffa.var_446d5c9f0f95831d < var_81a80043d8ce8eef) {
        return;
    }
    self.var_44f4fb2fdd683ffa.var_446d5c9f0f95831d = curtime;
    radius = getdvarint(@"hash_358164e65d640280", 390);
    radius = max(radius, 390);
    var_89a675c5bde8848f = function_32ec26ab4915f882(self.team);
    if (!isdefined(var_89a675c5bde8848f)) {
        return;
    }
    var_cc70f10b6c345f6c = getdvarfloat(@"hash_e4a177febf5c5689", 0);
    var_17f9769ecc54cd5a = ter_op(randomfloat(1) < var_cc70f10b6c345f6c, 1, 0);
    /#
        var_d3195be35a205c8b = getdvarint(@"hash_ab6af73ba6902e7a", 0);
        if (var_d3195be35a205c8b == 1 || var_d3195be35a205c8b == 2) {
            var_17f9769ecc54cd5a = var_d3195be35a205c8b - 1;
        }
    #/
    var_e2270f384295faba = var_17f9769ecc54cd5a == 0 || namespace_95d8d8ec67e3e074::function_a420e0f6eca5f1c6();
    if (var_e2270f384295faba) {
        if (namespace_d20f8ef223912e12::function_72ce5f47da0f5661()) {
            var_dac0cb34ad4db25f = getdvarint(@"hash_f394eba720226431", 3700);
            radius = radius + var_dac0cb34ad4db25f;
        }
        bot = DeployOneBotOnGround(var_89a675c5bde8848f, self.origin, self.angles, radius, self.name);
    } else {
        bot = DeployOneBotInAir(var_89a675c5bde8848f, self.origin, self.angles, radius, self.name);
    }
    if (isdefined(bot)) {
        if (!bot.var_ab5f5270cb22e3c8 && var_e2270f384295faba) {
            bot thread function_916e2512538553db();
        }
        if (!var_e2270f384295faba) {
            bot.var_6601ccd8ec4b0356 = self;
        }
        bot switchtoweapon(bot.primaryweapons[0]);
        if (isdefined(self)) {
            self.var_44f4fb2fdd683ffa.var_f315b15bf1bd4b5e = gettime();
        }
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ddf
// Size: 0x1db
function function_38b0bf785f0d3321(type, origin, bot, name) {
    var_d5bb04f234d19728 = distance(origin, bot.origin);
    var_2a740f1203c3ef99 = bot;
    foreach (player in level.players) {
        if (function_40034c2faf09a87b(player)) {
            distancetoplayer = distance(player.origin, bot.origin);
            if (distancetoplayer < var_d5bb04f234d19728) {
                var_d5bb04f234d19728 = distancetoplayer;
                var_2a740f1203c3ef99 = player;
            }
        }
    }
    logstring("[Super Bots] Deploy Bot in " + type + " bot:" + bot.name + " (" + bot.origin[0] + ", " + bot.origin[1] + ", " + bot.origin[2] + ") player:" + name + " (" + origin[0] + ", " + origin[1] + ", " + origin[2] + ")" + " distToPlayer:" + distance(origin, bot.origin) + " minDistPlayer:" + var_2a740f1203c3ef99.name + " (" + var_2a740f1203c3ef99.origin[0] + ", " + var_2a740f1203c3ef99.origin[1] + ", " + var_2a740f1203c3ef99.origin[2] + ")" + " minDistToPlayer:" + var_d5bb04f234d19728);
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc1
// Size: 0x293
function DeployOneBotOnGround(var_89a675c5bde8848f, origin, angles, radius, name) {
    level endon("game_ended");
    bot = var_89a675c5bde8848f activate("Combat", "DeployOneBotOnGround");
    if (!isvalidplayer(bot)) {
        return undefined;
    }
    bot.uibot.var_6ecc7cd453466014 = 1;
    bot function_a593971d75d82113();
    bot function_379bb555405c16bb("ui_bot::DeployOneBotOnGround()");
    bot botsetflag("suspended", 1);
    var_f1f1bc7727ca599b = undefined;
    var_724926dbac2bb2fb = 10;
    trycount = 0;
    humanplayers = [];
    foreach (player in level.players) {
        if (function_40034c2faf09a87b(player)) {
            humanplayers[humanplayers.size] = player;
        }
    }
    while (!isdefined(var_f1f1bc7727ca599b) && trycount < var_724926dbac2bb2fb) {
        waitframe();
        if (function_5d2aae3a7d90df56() >= getdvarint(@"hash_789bfeb36c8e00fd", 999)) {
            break;
        }
        if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(origin)) {
            logstring("[Super Bots] Warning: no valid bot deploy position found for player, the player is faraway from the circle");
            break;
        }
        trycount++;
        var_25854db1807f021a = function_f24f661dc7782ebc(origin, humanplayers, radius);
        if (isdefined(var_25854db1807f021a)) {
            namespace_92443376a63aa4bd::function_6b1ca7faeb9fd14a(bot, bot.origin, var_25854db1807f021a, "DeployOneBotOnGround");
            bot setorigin(var_25854db1807f021a, 1);
            if (!bot function_b74cf5eb822312cb()) {
                var_f1f1bc7727ca599b = var_25854db1807f021a;
            }
        }
        /#
            if (getdvarint(@"hash_96ba75c35ec39e87", 0) == 1) {
                origin = origin + anglestoforward(angles) * 100;
                var_f1f1bc7727ca599b = origin;
            }
        #/
    }
    bot.uibot.var_6ecc7cd453466014 = 0;
    if (isdefined(var_f1f1bc7727ca599b)) {
        bot botsetflag("suspended", 0);
        bot setorigin(var_f1f1bc7727ca599b, 1);
        bot function_6fb380927695ee76();
        bot function_985b0973f29da4f8("ui_bot::DeployOneBotOnGround()");
        if (getdvarint(@"hash_429176496a1b2fd8", 0)) {
            function_38b0bf785f0d3321("ground", origin, bot, name);
        }
        return bot;
    }
    if (trycount == var_724926dbac2bb2fb) {
        logstring("[Super Bots] Warning: no valid bot deploy position found for player origin " + origin);
    }
    if (!bot function_d3638cf9a2da76a("deployment fails")) {
        bot kickplayer();
    }
    return undefined;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225c
// Size: 0x7f
function function_5d2aae3a7d90df56() {
    var_4f304a8f807b9777 = 0;
    foreach (player in level.players) {
        if (isbot(player) && !player function_a9cbf557dc66d201() && !player function_6ecc7cd453466014()) {
            var_4f304a8f807b9777++;
        }
    }
    return var_4f304a8f807b9777;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e3
// Size: 0xee
function function_f24f661dc7782ebc(origin, humanplayers, radius) {
    var_938ed9c898b8c83 = getdvarfloat(@"hash_74d198f9030a4630", 0.8);
    var_25854db1807f021a = namespace_c5622898120e827f::getrandompointincircle(origin, radius, var_938ed9c898b8c83, 1, 1, 0);
    var_5da2a4fc5e5b9c9d = 45;
    if (namespace_bbc79db4c3949a5c::function_3e0a90b32e551ad(var_25854db1807f021a) < var_5da2a4fc5e5b9c9d) {
        return undefined;
    }
    var_2bc127f950ad927c = radius * var_938ed9c898b8c83;
    foreach (player in humanplayers) {
        if (function_40034c2faf09a87b(player) && ispointinsidecircle(player.origin, var_25854db1807f021a, var_2bc127f950ad927c)) {
            return undefined;
        }
    }
    return var_25854db1807f021a;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d9
// Size: 0x220
function DeployOneBotInAir(var_89a675c5bde8848f, origin, angles, radius, name) {
    spawnorigin = namespace_8bfdb6eb5a3df67a::getsafeoriginaroundpoint(origin, radius);
    if (isdefined(spawnorigin)) {
        bot = var_89a675c5bde8848f activate("Skydive", "DeployOneBotInAir");
        if (!isvalidplayer(bot)) {
            return undefined;
        }
        spawnorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(spawnorigin);
        spawnangles = namespace_8bfdb6eb5a3df67a::getanglesfacingorigin(spawnorigin, origin);
        height = namespace_5078ee98abb32db9::getc130height();
        if (isdefined(level.br_circle)) {
            circleindex = level.br_circle.circleindex;
            var_ae439bde76b3e937 = namespace_47fd1e79a44628cd::getgulagclosedcircleindex();
            var_f0b695bb4c38471b = isdefined(circleindex) && circleindex >= var_ae439bde76b3e937;
            if (var_f0b695bb4c38471b) {
                height = height * getdvarfloat(@"hash_a1c2d6b19bb6a568", 0.55);
            }
        }
        if (isdefined(level.respawnheightoverride)) {
            height = level.respawnheightoverride;
        }
        var_a6427a6a24f058dc = (0, 0, height);
        spawnorigin = namespace_d20f8ef223912e12::getoffsetspawnorigin(spawnorigin, var_a6427a6a24f058dc);
        /#
            if (getdvarint(@"hash_96ba75c35ec39e87", 0) == 1) {
                origin = origin + anglestoforward(angles) * 100;
                spawnorigin = origin;
            }
        #/
        namespace_92443376a63aa4bd::function_6b1ca7faeb9fd14a(bot, bot.origin, spawnorigin, "DeployOneBotInAir");
        bot setorigin(spawnorigin);
        bot setplayerangles(spawnangles);
        falltime = 0;
        if (isdefined(level.parachutedeploydelay)) {
            falltime = level.parachutedeploydelay;
        }
        var_cb4fad49263e20c4 = bot namespace_c6ccccd95254983f::function_79275e2fab13f54d();
        bot.plundercount = var_cb4fad49263e20c4.var_6aee9c9054f09ed5;
        bot thread namespace_5078ee98abb32db9::startfreefall(falltime, 0, undefined, undefined, 1);
        if (getdvarint(@"hash_429176496a1b2fd8", 0)) {
            function_38b0bf785f0d3321("air", origin, bot, name);
        }
        return bot;
    }
    return undefined;
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2601
// Size: 0x83
function function_b9c4a50390b0b5eb(bot, var_89a675c5bde8848f) {
    bot.var_5876cd9fc14af731 = var_89a675c5bde8848f;
    var_89a675c5bde8848f.bot = bot;
    bot function_a593971d75d82113();
    bot function_379bb555405c16bb("ui_bot::SpawnUIBotLogic()");
    bot namespace_e4a5fcd525f0b19b::bot_set_loadout_class();
    var_344e415f40e9796b = getdvarint(@"hash_b7f8b4b89ea6ced1", 0);
    if (var_344e415f40e9796b > 0) {
        bot.var_76b390d02672ecea = 1;
        bot thread namespace_c50b30148766aa59::ClearPlotArmorThread(var_344e415f40e9796b);
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x268b
// Size: 0xea
function ClearPlotArmorThread(var_344e415f40e9796b) {
    self endon("ClearPlotArmorThread");
    name = self.name;
    id = self getentitynumber();
    reason = waittill_any_in_array_or_timeout([0:"death", 1:"disconnect"], var_344e415f40e9796b);
    if (isdefined(self)) {
        if (function_ded80385ea7471db(self)) {
            logstring("[Super Bots] clear plotArmorTriggerHurt. name=" + name + " id=" + id + " health=" + self.health + " superThinkCalled=" + istrue(self.var_deb55e4a0429ef1) + " reason=" + reason);
            if (!function_d3638cf9a2da76a("ClearPlotArmorThread timeout")) {
                kickplayer();
            }
        } else {
            function_7d256d3586241325(reason);
        }
    } else {
        logstring("[Super Bots] clear plotArmorTriggerHurt. self=undefined name=" + name + " id=" + id + " reason=" + reason);
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x277c
// Size: 0xb1
function function_7d256d3586241325(reason) {
    if (istrue(self.var_76b390d02672ecea)) {
        self.var_76b390d02672ecea = 0;
        name = self.name;
        id = self getentitynumber();
        health = function_53c4c53197386572(self.health, "undefined");
        if (!isdefined(reason)) {
            reason = "unknown";
        }
        logstring("[Super Bots] clear plotArmorTriggerHurt. name=" + name + " id=" + id + " health=" + health + " superThinkCalled=" + istrue(self.var_deb55e4a0429ef1) + " reason=" + reason);
        self notify("ClearPlotArmorThread");
    }
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2834
// Size: 0x54
function function_2fd7dbe9fce56a4b() {
    /#
        cmd = " id=";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        level thread function_e192a1113d735473();
    #/
}

// Namespace namespace_2767334de2e180cd/namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x288f
// Size: 0x84
function function_e192a1113d735473() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_96ba75c35ec39e87", 0);
        var_f3e6f502b8b4a289 = getdvarint(@"hash_96ba75c35ec39e87", 0);
        while (1) {
            if (var_f3e6f502b8b4a289 != getdvarint(@"hash_96ba75c35ec39e87", 0)) {
                var_f3e6f502b8b4a289 = getdvarint(@"hash_96ba75c35ec39e87", 0);
                if (var_f3e6f502b8b4a289) {
                    iprintln("<unknown string>");
                } else {
                    iprintln("<unknown string>");
                }
            }
            wait(1);
        }
    #/
}

