#using script_26ccbfe3954cacf4;
#using script_40e63dd222434655;
#using script_4c9bd9a3bf3f8cf7;
#using script_58f20490049af6ac;
#using script_59ff79d681bb860c;
#using script_5bab271917698dc4;
#using script_72af5a878a9d3397;
#using scripts\cp_mp\parachute;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\utility;
#using scripts\mp\bots\bots;
#using scripts\mp\gamelogic;
#using scripts\mp\gametypes\br;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_gulag;
#using scripts\mp\gametypes\br_plunder;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\teams;
#using scripts\mp\utility\game;
#using scripts\mp\utility\script;
#using scripts\mp\utility\teams;

#namespace ui_bot;

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79d
// Size: 0x64
function function_b2502f3345564abf() {
    /#
        if (getdvarint(@"hash_d95f6cfac74fa872", 0)) {
            return false;
        }
    #/
    if (istrue(level.var_7b37b2193f163b9b.var_b871280cbdc11caf)) {
        return false;
    }
    if (namespace_95d8d8ec67e3e074::function_a420e0f6eca5f1c6()) {
        return false;
    }
    if (scripts\mp\gametypes\br_public::isplayerinorgoingtogulag()) {
        return false;
    }
    if (!isdefined(self)) {
        assertmsg("<dev string:x1c>");
        return false;
    }
    return !function_6f6c5cb39cd095b0();
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80a
// Size: 0x105
function function_6f6c5cb39cd095b0() {
    if (!function_6dd2dfeb41384764()) {
        return false;
    }
    if (scripts\mp\gamelogic::inprematch()) {
        partymembers = getpartyinfo();
        foreach (memberinfo in partymembers) {
            if (!memberinfo.isai && memberinfo.team == self.team) {
                return true;
            }
        }
    } else {
        teammates = scripts\mp\utility\teams::getteamdata(self.team, "players");
        foreach (player in teammates) {
            if (!isai(player)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x918
// Size: 0x7a
function recycle(reason) {
    if (!function_b2502f3345564abf()) {
        return false;
    }
    if (!isdefined(reason)) {
        reason = "unknown reason";
    }
    println("<dev string:x58>" + self getentitynumber() + "<dev string:x66>" + self.name + "<dev string:x6b>" + reason);
    self.uibot.recyclereason = strtok(reason, " ")[0];
    thread recyclethread();
    return true;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99b
// Size: 0x9
function recyclethread() {
    deactivate();
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ac
// Size: 0x245
function deactivate() {
    isdormant = 0;
    if (function_d012729eac1e7053()) {
        isdormant = 1;
        level.var_7b37b2193f163b9b.dormantbots = array_remove(level.var_7b37b2193f163b9b.dormantbots, self);
    }
    setenemy(undefined);
    botprofile = spawnstruct();
    botprofile.uibot = 1;
    botprofile.name = self.name;
    botprofile.team = self.team;
    botprofile.squad = self.sessionsquadid;
    botprofile.gulaguses = self.gulaguses;
    botprofile.operatorcustomization = self.operatorcustomization;
    botprofile.difficulty = self botgetdifficulty();
    botprofile.mind_personality = self.mind_personality;
    botprofile.locked = 0;
    botprofile.plundercount = self.plundercount;
    botprofile.xuid = self.xuid;
    if (namespace_92443376a63aa4bd::isenabled()) {
        assert(isdefined(self.bba_id));
        botprofile.bba_id = self.bba_id;
    }
    botprofile.pers = [];
    botprofile.pers["kills"] = self.pers["kills"];
    botprofile.pers["deaths"] = self.pers["deaths"];
    botprofile.pers["shotsFired"] = self.pers["shotsFired"];
    botprofile.pers["shotsHit"] = self.pers["shotsHit"];
    function_2b281a85caa4abde(botprofile);
    self.uibot.var_7dbb8165d792b06c = 1;
    self.var_b8e75e4315698cd = botprofile;
    kickplayer("uibot", ter_op(isdormant, "dormant", "active"));
    level notify("ui_bot_counter_updated");
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbf9
// Size: 0x56
function activatesome(count, nextstatus, reason) {
    for (i = 0; i < count; i++) {
        botprofile = function_32ec26ab4915f882();
        if (!isdefined(botprofile)) {
            break;
        }
        botprofile activate(nextstatus, reason);
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc57
// Size: 0x1d1
function function_33227166f85d1aea(count, nextstatus, reason) {
    var_e81bfdb1cb64fbec = function_33a64af3f46cb84d(count);
    foreach (profile in var_e81bfdb1cb64fbec) {
        function_516b85f3bbc993a7(profile);
    }
    foreach (profile in var_e81bfdb1cb64fbec) {
        profile.activereason = reason;
        namespace_92443376a63aa4bd::function_c622e0ea21d494fe(profile, reason);
    }
    bots = namespace_41f4dfb71dd08362::spawnbots(var_e81bfdb1cb64fbec, undefined, &function_9570b978f27641ef, undefined, "spawned_bots");
    if (bots.size < var_e81bfdb1cb64fbec.size) {
        assertmsg(var_e81bfdb1cb64fbec.size - bots.size + "<dev string:x8e>");
        successcount = 0;
        foreach (profile in var_e81bfdb1cb64fbec) {
            if (isdefined(profile.bot)) {
                successcount++;
                continue;
            }
            profile function_1ee0d9f85f7dc5d9(reason);
        }
        assert(successcount == bots.size);
    }
    foreach (bot in bots) {
        bot thread function_e164f99ea8cc4a48(nextstatus, reason);
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe30
// Size: 0xbf
function function_e164f99ea8cc4a48(nextstatus, reason) {
    bot = self;
    if (!istrue(bot.var_deb55e4a0429ef1)) {
        bot waittill_any_in_array_return(["bot_br_super_think", "death_or_disconnect"]);
        if (!isaliveplayer(bot)) {
            return undefined;
        }
    }
    assert(isvalidplayer(bot));
    bot function_142b713a2846f9ac("Activated - UI Bot");
    bot function_1e8fe34f5dfdea49(nextstatus);
    bot function_7d256d3586241325(reason);
    bot function_6fb380927695ee76();
    bot function_985b0973f29da4f8("ui_bot::ResumeStatusThread()");
    bot.var_7ca8ac9793bc9c22 = undefined;
    level notify("ui_bot_counter_updated");
    bot namespace_92443376a63aa4bd::function_b1c37e649a5cd380("active", "uibot");
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xef7
// Size: 0xce
function activate(nextstatus, reason) {
    level endon("game_ended");
    function_516b85f3bbc993a7(self);
    self.activereason = reason;
    namespace_92443376a63aa4bd::function_c622e0ea21d494fe(self, reason);
    if (!isvalidbotprofile(self, getpartyinfo())) {
        logstring("[UIBOT] Activate: Drop UI Bots: " + self.name + " xuid: " + self.xuid);
        function_1ee0d9f85f7dc5d9(reason + "_InvalidBotProfile");
        return undefined;
    }
    bots = namespace_41f4dfb71dd08362::spawnbots([self], self.team, &function_9570b978f27641ef, undefined, "spawned_bots");
    if (bots.size == 0) {
        function_1ee0d9f85f7dc5d9(reason);
        return undefined;
    }
    bot = bots[0];
    bot function_e164f99ea8cc4a48(nextstatus, reason);
    return bot;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfce
// Size: 0x63
function function_1ee0d9f85f7dc5d9(reason) {
    namespace_92443376a63aa4bd::function_1968d5899aa0a0cb(self, "kickout", "uibot");
    success = function_8edd1fb6091a089f(self);
    if (!success) {
        return;
    }
    namespace_92443376a63aa4bd::function_c622e0ea21d494fe(self, reason + "_failed");
    checkgameend();
    assertmsg("<dev string:xad>" + self.name);
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1039
// Size: 0x4a
function checkgameend() {
    team = self.team;
    if (namespace_95d8d8ec67e3e074::isteameliminated(team)) {
        scripts\mp\utility\teams::setteamdata(team, "deathEvent", 0);
        scripts\mp\utility\teams::modifyteamdata(team, "hasSpawned", 1);
        [[ level.updategameevents ]]();
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x108b
// Size: 0x15e
function function_c827480e6d21a271() {
    botprofile = self.var_5876cd9fc14af731;
    if (isdefined(botprofile)) {
        self.gulaguses = botprofile.gulaguses;
        if (istrue(level.br_c130spawndone)) {
            self.jumped = 1;
        }
        self.uibot.var_7dbb8165d792b06c = 0;
        self.plundercount = botprofile.plundercount;
        self.pers["kills"] = botprofile.pers["kills"];
        self.pers["deaths"] = botprofile.pers["deaths"];
        self.pers["shotsFired"] = botprofile.pers["shotsFired"];
        self.pers["shotsHit"] = botprofile.pers["shotsHit"];
        success = function_8edd1fb6091a089f(botprofile);
        assertex(success, "<dev string:xf1>" + botprofile.name + "<dev string:x116>" + botprofile.locked + "<dev string:x122>" + botprofile.team);
        namespace_92443376a63aa4bd::function_c622e0ea21d494fe(botprofile, botprofile.activereason + "_succeeded");
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f1
// Size: 0x51
function function_83574001589fb42d() {
    if (isdefined(self.var_5876cd9fc14af731)) {
        self.operatorcustomization = self.var_5876cd9fc14af731.operatorcustomization;
        scripts\mp\teams::setmodelfromcustomization();
        self.var_5876cd9fc14af731 = undefined;
        logstring("[Super Bots] Bot late recovered from uiBot:" + self.name);
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x124a
// Size: 0xc5
function function_2b281a85caa4abde(botprofile) {
    team = botprofile.team;
    level.var_7b37b2193f163b9b.uibots[level.var_7b37b2193f163b9b.uibots.size] = botprofile;
    level.teamdata[team]["UIBotCount"]++;
    level.teamdata[team]["UnlockedUIBotCount"]++;
    function_b3bb8f282b894dad(team);
    assert(level.teamdata[team]["<dev string:x12c>"] > 0);
    assert(level.teamdata[team]["<dev string:x13a>"] > 0);
    assert(!botprofile.locked);
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1317
// Size: 0xd0
function function_8edd1fb6091a089f(botprofile) {
    if (!array_contains(level.var_7b37b2193f163b9b.uibots, botprofile)) {
        return false;
    }
    team = botprofile.team;
    assert(level.teamdata[team]["<dev string:x12c>"] > 0);
    assert(botprofile.locked);
    botprofile.locked = 0;
    level.var_7b37b2193f163b9b.uibots = array_remove(level.var_7b37b2193f163b9b.uibots, botprofile);
    level.teamdata[team]["UIBotCount"]--;
    function_b3bb8f282b894dad(team);
    level notify("ui_bot_counter_updated");
    return true;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f0
// Size: 0xb0
function function_3e4c2fe4a6617607() {
    foreach (uibot in level.var_7b37b2193f163b9b.uibots) {
        team = uibot.team;
        level.teamdata[team]["UIBotCount"] = 0;
        level.teamdata[team]["UnlockedUIBotCount"] = 0;
    }
    level.var_7b37b2193f163b9b.uibots = [];
    level notify("ui_bot_counter_updated");
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a8
// Size: 0x11f
function function_cde96c5b28cc69f6() {
    if (!scripts\mp\utility\game::matchmakinggame()) {
        return;
    }
    if (!namespace_95d8d8ec67e3e074::isinitialized()) {
        return;
    }
    partymembers = getpartyinfo();
    uibots = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
    var_bb621279272ee27a = [];
    foreach (profile in uibots) {
        if (!istrue(profile.locked) && !isvalidbotprofile(profile, partymembers)) {
            var_bb621279272ee27a = array_add(var_bb621279272ee27a, profile);
        }
    }
    foreach (profile in var_bb621279272ee27a) {
        function_516b85f3bbc993a7(profile);
        logstring("[UIBOT] Drop UI Bots: " + profile.name + " xuid: " + profile.xuid);
        function_8edd1fb6091a089f(profile);
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15cf
// Size: 0xe2
function isvalidbotprofile(botprofile, partymembers) {
    if (!isdefined(botprofile)) {
        return false;
    }
    if (scripts\mp\utility\game::matchmakinggame()) {
        if (!isdefined(botprofile.xuid) || botprofile.xuid == "") {
            assertmsg("<dev string:x150>" + botprofile.name);
            return true;
        }
        found = 0;
        foreach (memberinfo in partymembers) {
            if (is_equal(botprofile.xuid, memberinfo.xuid)) {
                found = 1;
                break;
            }
        }
        if (!found) {
            return false;
        }
    }
    return true;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ba
// Size: 0x14a
function function_b3bb8f282b894dad(team) {
    var_eada48b37e7e4b05 = 0;
    var_b6bd7a39a24879ee = 0;
    foreach (uibot in level.var_7b37b2193f163b9b.uibots) {
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
        scripts\mp\utility\script::demoforcesre("UIBotCount is negative! team=" + team);
    }
    if (var_b08aea35d83f4f3d < 0) {
        scripts\mp\utility\script::demoforcesre("UnlockedUIBotCount is negative! team=" + team);
    }
    if (var_eada48b37e7e4b05 != var_4e57201d0f72c7d6) {
        scripts\mp\utility\script::demoforcesre("UIBotCount mismatch! team=" + team + " countInUIBotManager=" + var_eada48b37e7e4b05 + " countInTeamData=" + var_4e57201d0f72c7d6);
    }
    if (var_b6bd7a39a24879ee != var_b08aea35d83f4f3d) {
        scripts\mp\utility\script::demoforcesre("UnlockedUIBotCount mismatch! team=" + team + " unlockedCountInUIBotManager=" + var_b6bd7a39a24879ee + " unlockedCountInTeamData=" + var_b08aea35d83f4f3d);
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x180c
// Size: 0x98
function function_516b85f3bbc993a7(botprofile) {
    team = botprofile.team;
    if (level.teamdata[team]["UnlockedUIBotCount"] <= 0) {
        scripts\mp\utility\script::demoforcesre("SetBotProfileLocked: UnlockedUIBotCount <= 0! name=" + botprofile.name);
        return;
    }
    if (botprofile.locked) {
        scripts\mp\utility\script::demoforcesre("SetBotProfileLocked: profile is locked! name=" + botprofile.name);
        return;
    }
    botprofile.locked = 1;
    level.teamdata[team]["UnlockedUIBotCount"]--;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ac
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

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x195d
// Size: 0xca
function killsome(count, var_dcfac6660215f3be, reason, var_94afb7d602135955) {
    if (count <= 0) {
        return;
    }
    finalreason = "Killsome_" + reason;
    for (i = 0; i < count; i++) {
        botprofile = function_32ec26ab4915f882();
        if (!isdefined(botprofile)) {
            break;
        }
        var_629c48f843740b97 = botprofile activate("Combat", finalreason);
        if (isdefined(var_629c48f843740b97)) {
            if (istrue(var_dcfac6660215f3be)) {
                var_629c48f843740b97.gulaguses = undefined;
                var_629c48f843740b97.var_82bd86e99f1dd1e4 = 1;
                var_629c48f843740b97.var_94afb7d602135955 = var_94afb7d602135955;
            }
            wait 1;
            if (isvalidbot(var_629c48f843740b97)) {
                var_629c48f843740b97 suicide();
            }
        }
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2f
// Size: 0x8b
function function_32ec26ab4915f882(excludeteam) {
    foreach (botprofile in level.var_7b37b2193f163b9b.uibots) {
        if (isdefined(excludeteam) && botprofile.team == excludeteam) {
            continue;
        }
        if (!botprofile.locked) {
            return botprofile;
        }
    }
    return undefined;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ac3
// Size: 0xcd
function function_33a64af3f46cb84d(count) {
    assert(count > 0 && count <= level.var_7b37b2193f163b9b.uibots.size);
    var_e81bfdb1cb64fbec = [];
    partymembers = getpartyinfo();
    foreach (botprofile in level.var_7b37b2193f163b9b.uibots) {
        if (!botprofile.locked && isvalidbotprofile(botprofile, partymembers)) {
            var_e81bfdb1cb64fbec[var_e81bfdb1cb64fbec.size] = botprofile;
            if (var_e81bfdb1cb64fbec.size >= count) {
                break;
            }
        }
    }
    return var_e81bfdb1cb64fbec;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b99
// Size: 0x222
function function_947b37d99674b59c() {
    level endon("game_ended");
    var_81a80043d8ce8eef = 3000;
    curtime = gettime();
    if (isdefined(self.engageinfo.var_446d5c9f0f95831d) && curtime - self.engageinfo.var_446d5c9f0f95831d < var_81a80043d8ce8eef) {
        return;
    }
    self.engageinfo.var_446d5c9f0f95831d = curtime;
    radius = getdvarint(@"hash_358164e65d640280", 390);
    radius = max(radius, 390);
    botprofile = function_32ec26ab4915f882(self.team);
    if (!isdefined(botprofile)) {
        return;
    }
    var_cc70f10b6c345f6c = getdvarfloat(@"hash_e4a177febf5c5689", 0);
    deploytype = ter_op(randomfloat(1) < var_cc70f10b6c345f6c, 1, 0);
    /#
        var_d3195be35a205c8b = getdvarint(@"hash_ab6af73ba6902e7a", 0);
        if (var_d3195be35a205c8b == 1 || var_d3195be35a205c8b == 2) {
            deploytype = var_d3195be35a205c8b - 1;
        }
    #/
    var_e2270f384295faba = deploytype == 0 || namespace_95d8d8ec67e3e074::function_a420e0f6eca5f1c6();
    if (var_e2270f384295faba) {
        if (scripts\mp\gametypes\br::isgulagshutdown()) {
            var_dac0cb34ad4db25f = getdvarint(@"hash_f394eba720226431", 3700);
            radius += var_dac0cb34ad4db25f;
        }
        bot = DeployOneBotOnGround(botprofile, self.origin, self.angles, radius, self.name);
    } else {
        bot = DeployOneBotInAir(botprofile, self.origin, self.angles, radius, self.name);
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
            self.engageinfo.var_f315b15bf1bd4b5e = gettime();
        }
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc3
// Size: 0x1d6
function function_38b0bf785f0d3321(type, origin, bot, name) {
    mindistancetoplayer = distance(origin, bot.origin);
    var_2a740f1203c3ef99 = bot;
    foreach (player in level.players) {
        if (function_40034c2faf09a87b(player)) {
            distancetoplayer = distance(player.origin, bot.origin);
            if (distancetoplayer < mindistancetoplayer) {
                mindistancetoplayer = distancetoplayer;
                var_2a740f1203c3ef99 = player;
            }
        }
    }
    logstring("[Super Bots] Deploy Bot in " + type + " bot:" + bot.name + " (" + bot.origin[0] + ", " + bot.origin[1] + ", " + bot.origin[2] + ") player:" + name + " (" + origin[0] + ", " + origin[1] + ", " + origin[2] + ")" + " distToPlayer:" + distance(origin, bot.origin) + " minDistPlayer:" + var_2a740f1203c3ef99.name + " (" + var_2a740f1203c3ef99.origin[0] + ", " + var_2a740f1203c3ef99.origin[1] + ", " + var_2a740f1203c3ef99.origin[2] + ")" + " minDistToPlayer:" + mindistancetoplayer);
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa1
// Size: 0x28b
function DeployOneBotOnGround(botprofile, origin, angles, radius, name) {
    level endon("game_ended");
    bot = botprofile activate("Combat", "DeployOneBotOnGround");
    if (!isvalidplayer(bot)) {
        return undefined;
    }
    bot.uibot.isuibot = 1;
    bot function_a593971d75d82113();
    bot function_379bb555405c16bb("ui_bot::DeployOneBotOnGround()");
    bot botsetflag("suspended", 1);
    deployedpos = undefined;
    var_724926dbac2bb2fb = 10;
    trycount = 0;
    humanplayers = [];
    foreach (player in level.players) {
        if (function_40034c2faf09a87b(player)) {
            humanplayers[humanplayers.size] = player;
        }
    }
    while (!isdefined(deployedpos) && trycount < var_724926dbac2bb2fb) {
        waitframe();
        if (function_5d2aae3a7d90df56() >= getdvarint(@"hash_789bfeb36c8e00fd", 999)) {
            break;
        }
        if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(origin)) {
            logstring("[Super Bots] Warning: no valid bot deploy position found for player, the player is faraway from the circle");
            break;
        }
        trycount++;
        poscandidate = function_f24f661dc7782ebc(origin, humanplayers, radius);
        if (isdefined(poscandidate)) {
            namespace_92443376a63aa4bd::onplayerteleport(bot, bot.origin, poscandidate, "DeployOneBotOnGround");
            bot setorigin(poscandidate, 1);
            if (!bot function_b74cf5eb822312cb()) {
                deployedpos = poscandidate;
            }
        }
        /#
            if (getdvarint(@"hash_96ba75c35ec39e87", 0) == 1) {
                origin += anglestoforward(angles) * 100;
                deployedpos = origin;
            }
        #/
    }
    bot.uibot.isuibot = 0;
    if (isdefined(deployedpos)) {
        bot botsetflag("suspended", 0);
        bot setorigin(deployedpos, 1);
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
    if (!bot recycle("deployment fails")) {
        bot kickplayer();
    }
    return undefined;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2235
// Size: 0x7c
function function_5d2aae3a7d90df56() {
    var_4f304a8f807b9777 = 0;
    foreach (player in level.players) {
        if (isbot(player) && !player iseliminated() && !player isuibot()) {
            var_4f304a8f807b9777++;
        }
    }
    return var_4f304a8f807b9777;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x22ba
// Size: 0xe8
function function_f24f661dc7782ebc(origin, humanplayers, radius) {
    var_938ed9c898b8c83 = getdvarfloat(@"hash_74d198f9030a4630", 0.8);
    poscandidate = scripts\mp\gametypes\br_circle::getrandompointincircle(origin, radius, var_938ed9c898b8c83, 1, 1, 0);
    var_5da2a4fc5e5b9c9d = 45;
    if (namespace_bbc79db4c3949a5c::gettimetilldangerforpoint(poscandidate) < var_5da2a4fc5e5b9c9d) {
        return undefined;
    }
    var_2bc127f950ad927c = radius * var_938ed9c898b8c83;
    foreach (player in humanplayers) {
        if (function_40034c2faf09a87b(player) && ispointinsidecircle(player.origin, poscandidate, var_2bc127f950ad927c)) {
            return undefined;
        }
    }
    return poscandidate;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x23ab
// Size: 0x217
function DeployOneBotInAir(botprofile, origin, angles, radius, name) {
    spawnorigin = namespace_8bfdb6eb5a3df67a::getsafeoriginaroundpoint(origin, radius);
    if (isdefined(spawnorigin)) {
        bot = botprofile activate("Skydive", "DeployOneBotInAir");
        if (!isvalidplayer(bot)) {
            return undefined;
        }
        spawnorigin = scripts\mp\gametypes\br_public::droptogroundmultitrace(spawnorigin);
        spawnangles = namespace_8bfdb6eb5a3df67a::getanglesfacingorigin(spawnorigin, origin);
        height = scripts\cp_mp\parachute::getc130height();
        if (isdefined(level.br_circle)) {
            circleindex = level.br_circle.circleindex;
            closedindex = scripts\mp\gametypes\br_gulag::getgulagclosedcircleindex();
            var_f0b695bb4c38471b = isdefined(circleindex) && circleindex >= closedindex;
            if (var_f0b695bb4c38471b) {
                height *= getdvarfloat(@"hash_a1c2d6b19bb6a568", 0.55);
            }
        }
        if (isdefined(level.respawnheightoverride)) {
            height = level.respawnheightoverride;
        }
        dropspawnoffset = (0, 0, height);
        spawnorigin = scripts\mp\gametypes\br::getoffsetspawnorigin(spawnorigin, dropspawnoffset);
        /#
            if (getdvarint(@"hash_96ba75c35ec39e87", 0) == 1) {
                origin += anglestoforward(angles) * 100;
                spawnorigin = origin;
            }
        #/
        namespace_92443376a63aa4bd::onplayerteleport(bot, bot.origin, spawnorigin, "DeployOneBotInAir");
        bot setorigin(spawnorigin);
        bot setplayerangles(spawnangles);
        falltime = 0;
        if (isdefined(level.parachutedeploydelay)) {
            falltime = level.parachutedeploydelay;
        }
        dropinfo = bot scripts\mp\gametypes\br_plunder::function_79275e2fab13f54d();
        bot.plundercount = dropinfo.var_6aee9c9054f09ed5;
        bot thread scripts\cp_mp\parachute::startfreefall(falltime, 0, undefined, undefined, 1);
        if (getdvarint(@"hash_429176496a1b2fd8", 0)) {
            function_38b0bf785f0d3321("air", origin, bot, name);
        }
        return bot;
    }
    return undefined;
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25cb
// Size: 0x83
function function_b9c4a50390b0b5eb(bot, botprofile) {
    bot.var_5876cd9fc14af731 = botprofile;
    botprofile.bot = bot;
    bot function_a593971d75d82113();
    bot function_379bb555405c16bb("ui_bot::SpawnUIBotLogic()");
    bot scripts\mp\bots\bots::bot_set_loadout_class();
    var_344e415f40e9796b = getdvarint(@"hash_b7f8b4b89ea6ced1", 0);
    if (var_344e415f40e9796b > 0) {
        bot.var_76b390d02672ecea = 1;
        bot thread namespace_c50b30148766aa59::ClearPlotArmorThread(var_344e415f40e9796b);
    }
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2656
// Size: 0xe8
function ClearPlotArmorThread(var_344e415f40e9796b) {
    self endon("ClearPlotArmorThread");
    name = self.name;
    id = self getentitynumber();
    reason = waittill_any_in_array_or_timeout(["death", "disconnect"], var_344e415f40e9796b);
    if (isdefined(self)) {
        if (isaliveplayer(self)) {
            logstring("[Super Bots] clear plotArmorTriggerHurt. name=" + name + " id=" + id + " health=" + self.health + " superThinkCalled=" + istrue(self.var_deb55e4a0429ef1) + " reason=" + reason);
            if (!recycle("ClearPlotArmorThread timeout")) {
                kickplayer();
            }
        } else {
            function_7d256d3586241325(reason);
        }
        return;
    }
    logstring("[Super Bots] clear plotArmorTriggerHurt. self=undefined name=" + name + " id=" + id + " reason=" + reason);
}

// Namespace ui_bot / namespace_c50b30148766aa59
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2746
// Size: 0xaf
function function_7d256d3586241325(reason) {
    if (istrue(self.var_76b390d02672ecea)) {
        self.var_76b390d02672ecea = 0;
        name = self.name;
        id = self getentitynumber();
        health = default_to(self.health, "undefined");
        if (!isdefined(reason)) {
            reason = "unknown";
        }
        logstring("[Super Bots] clear plotArmorTriggerHurt. name=" + name + " id=" + id + " health=" + health + " superThinkCalled=" + istrue(self.var_deb55e4a0429ef1) + " reason=" + reason);
        self notify("ClearPlotArmorThread");
    }
}

/#

    // Namespace ui_bot / namespace_c50b30148766aa59
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x27fd
    // Size: 0x54
    function function_2fd7dbe9fce56a4b() {
        cmd = "<dev string:x189>";
        adddevguicmd(cmd);
        cmd = "<dev string:x1f7>";
        adddevguicmd(cmd);
        cmd = "<dev string:x262>";
        adddevguicmd(cmd);
        cmd = "<dev string:x2cf>";
        adddevguicmd(cmd);
        level thread function_e192a1113d735473();
    }

    // Namespace ui_bot / namespace_c50b30148766aa59
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2859
    // Size: 0x84
    function function_e192a1113d735473() {
        level endon("<dev string:x349>");
        setdvarifuninitialized(@"hash_96ba75c35ec39e87", 0);
        var_f3e6f502b8b4a289 = getdvarint(@"hash_96ba75c35ec39e87", 0);
        while (true) {
            if (var_f3e6f502b8b4a289 != getdvarint(@"hash_96ba75c35ec39e87", 0)) {
                var_f3e6f502b8b4a289 = getdvarint(@"hash_96ba75c35ec39e87", 0);
                if (var_f3e6f502b8b4a289) {
                    iprintln("<dev string:x357>");
                } else {
                    iprintln("<dev string:x375>");
                }
            }
            wait 1;
        }
    }

#/
