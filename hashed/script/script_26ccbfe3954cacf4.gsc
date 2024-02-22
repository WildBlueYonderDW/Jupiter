// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using scripts\mp\utility\game.gsc;
#using script_44f4640b93ab1b47;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_4c9bd9a3bf3f8cf7;
#using script_2e6a95dfe7dfc5f8;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_72af5a878a9d3397;
#using script_5bab271917698dc4;
#using script_a34750d17473c49;
#using scripts\mp\playerlogic.gsc;
#using script_26ccbfe3954cacf4;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;

#namespace manager;

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d7
// Size: 0xfc
function initialize(var_9f4a3632d9f75d32) {
    if (!isenabled()) {
        return;
    }
    /#
        assert(isdefined(var_9f4a3632d9f75d32));
    #/
    level.var_7b37b2193f163b9b = spawnstruct();
    level.var_7b37b2193f163b9b.var_892fa74a6b549ef0 = [];
    level.var_7b37b2193f163b9b.var_156f390a5362bc55 = [];
    level.var_7b37b2193f163b9b.var_9f4a3632d9f75d32 = var_9f4a3632d9f75d32;
    thread function_9d31b1338e2f80e8();
    thread function_821a6fdd1d60d2af();
    thread function_c9b0122de1017d85();
    thread function_494150569261c828();
    thread function_9f9e27bf69291e6d();
    if (istrue(level.usegulag)) {
        thread function_5b2b7905d2d6b349();
    }
    if (getdvarint(@"hash_79500dabf3e1a102", 1) && function_a0e0c0e1e94630f6()) {
        thread function_c596173d88d8446e();
    }
    namespace_4ad0bd66eaa05ae7::function_360128ec8c9d243();
    if (getdvarint(@"hash_429176496a1b2fd8", 0)) {
        thread function_a93242f2e58447b3();
    }
    /#
        thread function_f19131452f7b839a();
    #/
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7da
// Size: 0x34
function isenabled() {
    if (getdvar(@"hash_12e53040d5281856", "") == "scripted") {
        return 0;
    }
    return getdvarint(@"hash_b7fcb658021d7931", 1) == 1;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x816
// Size: 0x65
function onplayerconnect(player) {
    /#
        assert(isenabled());
    #/
    if (isdefined(player.var_5876cd9fc14af731) && isdefined(player.var_5876cd9fc14af731.clientmatchdataid)) {
        player.clientmatchdataid = player.var_5876cd9fc14af731.clientmatchdataid;
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x882
// Size: 0x56
function onplayerdisconnect(player) {
    /#
        assert(isenabled());
    #/
    if (isdefined(player.var_b8e75e4315698cd)) {
        player.var_b8e75e4315698cd.clientmatchdataid = player.clientmatchdataid;
        player.var_b8e75e4315698cd = undefined;
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8df
// Size: 0x32
function isteameliminated(team) {
    alivecount = namespace_54d20dd0dd79277f::getteamdata(team, "aliveCount");
    if (alivecount > 0) {
        return 0;
    }
    return namespace_d20f8ef223912e12::function_227ca42a35b0398b(team);
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x919
// Size: 0x56f
function function_a93242f2e58447b3() {
    level endon("game_ended");
    if (level.br_infils_disabled) {
        level waittill("spawned_bots");
    } else {
        level waittill("br_circle_set");
    }
    while (1) {
        logstring("[DumpBots] start");
        uibotcount = level.var_7b37b2193f163b9b.var_156f390a5362bc55.size;
        var_b11bec30763a97f8 = 0;
        var_d507b1dd6759ff83 = 0;
        var_a4c3a5afe5b8da9b = [];
        curtime = gettime();
        foreach (player in level.players) {
            if (!isdefined(player) || player iseliminated()) {
                continue;
            }
            if (player isuibot()) {
                continue;
            }
            var_a4c3a5afe5b8da9b[player.team] = 1;
            if (isbot(player)) {
                var_b11bec30763a97f8++;
            } else {
                var_d507b1dd6759ff83++;
            }
        }
        alivecount = var_b11bec30763a97f8 + var_d507b1dd6759ff83;
        logstring("Time:" + curtime + ", TotalPlayers:" + alivecount + uibotcount + ", AliveHumans:" + var_d507b1dd6759ff83 + ", AliveBots:" + var_b11bec30763a97f8 + uibotcount + ", UIBots:" + uibotcount);
        if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
            logstring("Circle:" + level.br_circle.circleindex + " origin:" + level.br_circle.dangercircleent.origin);
        }
        logstring("IsGulagShutDown:" + namespace_d20f8ef223912e12::function_72ce5f47da0f5661());
        if (level.var_7b37b2193f163b9b.var_156f390a5362bc55.size > 0) {
            logstring("[DumpUIBots] start");
            foreach (bot in level.var_7b37b2193f163b9b.var_156f390a5362bc55) {
                logstring("[Dump UIBot] name:" + bot.name + " locked:" + bot.locked + " team:" + bot.team);
                namespace_c50b30148766aa59::function_b3bb8f282b894dad(bot.team);
            }
            logstring("[DumpUIBots] end");
        }
        logstring("[DumpActiveTeams] start");
        foreach (team, v in var_a4c3a5afe5b8da9b) {
            logstring("team:" + team);
            players = namespace_54d20dd0dd79277f::getteamdata(team, "alivePlayers");
            foreach (player in players) {
                speed = length(player getvelocity());
                status = ter_op(isbot(player) && isdefined(player.status), player.status, "");
                logstring("[Dump player] name:" + player.name + " origin:" + player.origin + " health:" + player.health + " speed:" + speed + " status:" + status);
                if (isbot(player)) {
                    if (!isdefined(player.lastposition) || distancesquared(player.origin, player.lastposition) > 10) {
                        player.var_b012001b3448e7c7 = curtime;
                    }
                    player.lastposition = player.origin;
                    if (isdefined(player.var_b012001b3448e7c7) && curtime - player.var_b012001b3448e7c7 > 10000) {
                        logstring("[Dump player] STUCKED!!! lastTimeHaveMove:" + player.var_b012001b3448e7c7 - level.starttime + " stuck time:" + curtime - player.var_b012001b3448e7c7);
                        /#
                            line(player.origin - (0, 0, 3000), player.origin + (0, 0, 5000), (1, 0, 0), 1, 0, 50);
                            print3d(player.origin + (0, 0, 3000), " stuck time:", (1, 0, 0), 1, 20, 50, 1);
                        #/
                    }
                }
            }
        }
        logstring("[DumpActiveTeams] end");
        level waittill_any_in_array_or_timeout([0:"ui_bot_counter_updated", 1:"updatePlayerAndTeamCountUI"], 1);
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0xc2
function function_5b2b7905d2d6b349() {
    level endon("game_ended");
    if (level.br_infils_disabled) {
        level waittill("spawned_bots");
    } else {
        level waittill("br_circle_set");
    }
    timeout = getdvarint(@"hash_5d346678d4fb1795", 30000);
    while (!namespace_d20f8ef223912e12::function_72ce5f47da0f5661()) {
        if (level.var_7b37b2193f163b9b.var_156f390a5362bc55.size == 0) {
            wait(1);
            continue;
        }
        player = function_baaa373e746b0672();
        if (isdefined(player)) {
            if (gettime() - player.jailtime > timeout) {
                var_cd5428d556223258 = player function_7c6f438b4f3922cb();
                namespace_c50b30148766aa59::function_966ab6ffd873ec11(1, 1, "DeployUIBotIntoGulag", var_cd5428d556223258);
            }
        }
        wait(1);
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf58
// Size: 0x118
function private function_baaa373e746b0672() {
    targetplayer = undefined;
    var_1001a564e09ea44a = undefined;
    foreach (arena in level.gulag.arenas) {
        foreach (match in arena.matches) {
            if (match.size != 1) {
                continue;
            }
            player = match[0];
            if (!isdefined(player) || isbot(player)) {
                continue;
            }
            if (!isdefined(var_1001a564e09ea44a) || player.jailtime < var_1001a564e09ea44a) {
                var_1001a564e09ea44a = player.jailtime;
                targetplayer = player;
            }
        }
    }
    return targetplayer;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1078
// Size: 0x62
function private function_7c6f438b4f3922cb() {
    if (!isdefined(self.arena)) {
        return undefined;
    }
    for (i = 0; i < level.gulag.arenas.size; i++) {
        if (level.gulag.arenas[i] == self.arena) {
            return i;
        }
    }
    return undefined;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e2
// Size: 0x22d
function function_64432af189b8a177(var_1a645e724209ac4a, var_2ba509f4d1261ba7) {
    if (!isinitialized()) {
        return 0;
    }
    /#
        assert(isdefined(var_1a645e724209ac4a));
    #/
    var_cc9d656efb786a8b = undefined;
    var_c2ad339c4e95c7fe = undefined;
    switch (var_1a645e724209ac4a) {
    case 0:
        dist2d = getdvarint(@"hash_81156fddeb6b5508", 5900);
        var_72fde5447014f573 = dist2d * dist2d;
        height = getdvarint(@"hash_b51792a54d2cc6df", 5900);
        if (namespace_c4ef709c036dc4a8::function_b2502f3345564abf(var_72fde5447014f573, height, 0) && !function_190fb7e79cad0d0()) {
            var_cc9d656efb786a8b = 0;
            var_c2ad339c4e95c7fe = "landing position meets the range [2D dist = " + dist2d + ", height = " + height + "] and not witnessed";
            namespace_c4ef709c036dc4a8::function_89b861aa78808ed8();
        }
        break;
    case 1:
        if (function_5cb1c8ec264fbdbd(self) == 0) {
            var_cc9d656efb786a8b = 1;
            var_c2ad339c4e95c7fe = "prematch active player count limit";
        }
        break;
    case 2:
        if (function_dc1089b7b817790e() < 0) {
            var_cc9d656efb786a8b = 1;
            var_c2ad339c4e95c7fe = "infil active bot count limit";
        }
        break;
    case 3:
        if (!function_16a5388d4963e316() && !function_190fb7e79cad0d0()) {
            if (!namespace_c50b30148766aa59::function_b2502f3345564abf()) {
                self dodamage(self.health + 10000, self.origin, self);
                return 0;
            } else {
                var_cc9d656efb786a8b = 1;
                var_c2ad339c4e95c7fe = "parachute stuck at " + self.origin;
            }
        }
        break;
    case 4:
        if (!function_16a5388d4963e316() && !function_190fb7e79cad0d0()) {
            if (!namespace_c50b30148766aa59::function_b2502f3345564abf()) {
                self dodamage(self.health + 10000, self.origin, self);
                return 0;
            } else {
                var_cc9d656efb786a8b = 1;
                var_c2ad339c4e95c7fe = "off_navmesh and not witnessed.";
            }
        }
        break;
    default:
        break;
    }
    if (isdefined(var_cc9d656efb786a8b) && !function_5f352fb76c54705c()) {
        if (var_2ba509f4d1261ba7) {
            function_532c9aa14c794ff(function_3032314d524a3487());
        }
        if (var_cc9d656efb786a8b) {
            return namespace_c50b30148766aa59::function_d3638cf9a2da76a(var_c2ad339c4e95c7fe);
        } else {
            return namespace_c4ef709c036dc4a8::function_d3638cf9a2da76a(var_c2ad339c4e95c7fe);
        }
    } else {
        return 0;
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1316
// Size: 0xd
function isinitialized() {
    return isdefined(level.var_7b37b2193f163b9b);
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132b
// Size: 0x25
function function_d012729eac1e7053() {
    return isdefined(self.uibot) && istrue(self.uibot.var_d012729eac1e7053);
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1358
// Size: 0x3d
function isuibot() {
    return isdefined(self.uibot) && (istrue(self.uibot.isuibot) || istrue(self.uibot.var_7dbb8165d792b06c));
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139d
// Size: 0x25
function function_3ae9c05025cbac2d() {
    return isdefined(self.uibot) && istrue(self.uibot.var_7dbb8165d792b06c);
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ca
// Size: 0x19
function function_190fb7e79cad0d0() {
    var_721982228624d657 = namespace_a9c534dc7832aba4::getspectatorsofplayer(self);
    return var_721982228624d657.size > 0;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13eb
// Size: 0x25
function function_749723c2a45a0233() {
    if (isinitialized()) {
        return level.var_7b37b2193f163b9b.var_156f390a5362bc55;
    } else {
        return [];
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1417
// Size: 0x26
function function_1bbd21d289ba8a92() {
    if (isinitialized()) {
        return level.var_7b37b2193f163b9b.var_156f390a5362bc55.size;
    } else {
        return 0;
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1444
// Size: 0x70
function private function_9d31b1338e2f80e8() {
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        if (isdefined(player)) {
            if (isbot(player)) {
                if (!isdefined(player.uibot)) {
                    player.uibot = spawnstruct();
                }
                player thread namespace_c4ef709c036dc4a8::function_a955d908f57b75cf();
            } else {
                player.var_44f4fb2fdd683ffa = spawnstruct();
            }
        }
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14bb
// Size: 0x1c
function private function_821a6fdd1d60d2af() {
    level endon("game_ended");
    level childthread function_bcef157dfcf2c5f3();
    level childthread function_1e0804e806447a25();
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14de
// Size: 0x10d
function private function_bcef157dfcf2c5f3() {
    if (istrue(level.skipprematch)) {
        return;
    }
    level waittill("player_spawned");
    while (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
        var_9fa0ddc57b0f35b0 = function_5cb1c8ec264fbdbd();
        namespace_c50b30148766aa59::function_e81d83cfe1ab45fc(var_9fa0ddc57b0f35b0, "Skydive", "SpawnInPrematch");
        wait(1);
    }
    var_e88f02ac1f526a32 = function_dc1089b7b817790e();
    if (var_e88f02ac1f526a32 < 0) {
        foreach (player in level.players) {
            if (isbot(player) && !player isuibot()) {
                success = player namespace_c50b30148766aa59::function_d3638cf9a2da76a("infil active bot count limit");
                if (success) {
                    var_e88f02ac1f526a32++;
                    if (var_e88f02ac1f526a32 == 0) {
                        break;
                    }
                }
            }
        }
    } else if (var_e88f02ac1f526a32 > 0) {
        level waittill("br_c130_in_bounds");
        namespace_c50b30148766aa59::function_33227166f85d1aea(var_e88f02ac1f526a32, "Skydive", "ActivateUIBotsAfterPrematch");
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15f2
// Size: 0xbc
function private function_5cb1c8ec264fbdbd(var_f5720cac60ca8410) {
    /#
        assert(namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c());
    #/
    activeplayercount = 0;
    foreach (player in level.players) {
        if (isdefined(player) && (!isdefined(var_f5720cac60ca8410) || var_f5720cac60ca8410 != player)) {
            if (!isbot(player) || !player isuibot()) {
                activeplayercount++;
            }
        }
    }
    var_9fa0ddc57b0f35b0 = function_d6d3f0e8a701880f() - activeplayercount;
    if (var_9fa0ddc57b0f35b0 < 0) {
        var_9fa0ddc57b0f35b0 = 0;
    }
    return var_9fa0ddc57b0f35b0;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16b6
// Size: 0x13
function private function_d6d3f0e8a701880f() {
    return getdvarint(@"hash_e82992eec48cf830", 20);
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16d1
// Size: 0x56
function private function_dc1089b7b817790e() {
    var_1e9700821627ab11 = function_1b34e035241a60e7();
    var_1745f9ff57437be9 = int(var_1e9700821627ab11 * clamp(getdvarfloat(@"hash_a9691c347e9bb21c", 1), 0, 1));
    return var_1745f9ff57437be9 - var_1e9700821627ab11 - level.var_7b37b2193f163b9b.var_156f390a5362bc55.size;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x172f
// Size: 0x93
function private function_1b34e035241a60e7() {
    if (!namespace_cd0b2d039510b38d::matchmakinggame()) {
        return getdvarint(@"hash_116700c9b39c1eba", 0);
    } else {
        botcount = 0;
        var_786f842d5771cdb6 = function_538e92208b641725();
        foreach (var_e72dfdb2a9343f1b in var_786f842d5771cdb6) {
            if (var_e72dfdb2a9343f1b.isai) {
                botcount++;
            }
        }
        return botcount;
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17c9
// Size: 0x1a9
function private function_1e0804e806447a25() {
    if (istrue(level.br_infils_disabled)) {
        level waittill("player_spawned");
    } else {
        level waittill("br_c130_left_bounds");
    }
    var_865c2dbd684c82cd = getdvarint(@"hash_e7e9bb130c1ca431", 0);
    if (var_865c2dbd684c82cd) {
        thread function_e89eaa436ffad5a4();
    }
    updateinterval = 1;
    while (1) {
        var_8baa6cfd8698560c = 0;
        var_afdc93e504789c3d = 0;
        var_797045ba3477aee8 = [];
        foreach (player in level.players) {
            if (!isdefined(player) || isbot(player)) {
                continue;
            }
            var_8baa6cfd8698560c = 1;
            if (player iseliminated()) {
                continue;
            }
            var_afdc93e504789c3d = 1;
            var_8dfb4c8e7302515e = player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() || !function_ded80385ea7471db(player) || player isskydiving() || player isparachuting();
            if (var_8dfb4c8e7302515e) {
                continue;
            }
            var_797045ba3477aee8[var_797045ba3477aee8.size] = player;
        }
        nohumanalivebutspectating = var_8baa6cfd8698560c && !var_afdc93e504789c3d;
        if (nohumanalivebutspectating) {
            level.var_7b37b2193f163b9b.var_b871280cbdc11caf = 1;
            thread function_e79f454a81696e11("noHumanAliveButSpectating");
            level notify("no_human_alive");
            break;
        }
        if (var_797045ba3477aee8.size > 0) {
            var_6f45c47a2030379d = "ui_bots_deployed";
            level thread function_5982992426cf092(var_797045ba3477aee8, updateinterval, var_6f45c47a2030379d);
            level waittill(var_6f45c47a2030379d);
        }
        wait(updateinterval);
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1979
// Size: 0x217
function private function_5982992426cf092(humanplayers, updateinterval, var_dfc67eaaf62bc0) {
    /#
        if (getdvarint(@"hash_25920b075500f084", 0)) {
            level function_c73ffcc4d5a2bc9c(var_dfc67eaaf62bc0);
            return;
        }
    #/
    foreach (player in humanplayers) {
        var_44f4fb2fdd683ffa = player.var_44f4fb2fdd683ffa;
        if (function_a420e0f6eca5f1c6()) {
            var_755cf06afb953275 = 1;
        } else {
            var_5bc7cbbcf589f547 = player function_a0fbe39135ab0d35();
            var_ae5632495dfca986 = gettime() - var_5bc7cbbcf589f547;
            if (!isdefined(var_44f4fb2fdd683ffa.var_96be2fbd0ac6a848)) {
                var_44f4fb2fdd683ffa.var_96be2fbd0ac6a848 = 0;
            }
            if (!isdefined(var_44f4fb2fdd683ffa.var_5bc7cbbcf589f547)) {
                var_44f4fb2fdd683ffa.var_5bc7cbbcf589f547 = 0;
            }
            if (var_44f4fb2fdd683ffa.var_5bc7cbbcf589f547 != var_5bc7cbbcf589f547) {
                var_44f4fb2fdd683ffa.var_96be2fbd0ac6a848 = 0;
                var_44f4fb2fdd683ffa.var_5bc7cbbcf589f547 = var_5bc7cbbcf589f547;
            }
            velocity = player getvelocity();
            speed = length(velocity);
            if (speed < getdvarint(@"hash_3d8ce2c99aa4db2b", 1) && var_ae5632495dfca986 > 0) {
                penalty = getdvarint(@"hash_9be4e2fbbfe8d9c5", 500);
                /#
                    assert(penalty >= 0 && penalty < 1000);
                #/
                var_44f4fb2fdd683ffa.var_96be2fbd0ac6a848 = var_44f4fb2fdd683ffa.var_96be2fbd0ac6a848 + penalty * updateinterval;
            }
            var_b8bba9ccd960781 = getdvarint(@"hash_e32340e297efbbdd", 45000);
            var_755cf06afb953275 = var_ae5632495dfca986 >= var_b8bba9ccd960781 + var_44f4fb2fdd683ffa.var_96be2fbd0ac6a848;
        }
        if (var_755cf06afb953275) {
            var_44f4fb2fdd683ffa.var_96be2fbd0ac6a848 = 0;
            player thread namespace_c50b30148766aa59::function_947b37d99674b59c();
        }
    }
    level function_c73ffcc4d5a2bc9c(var_dfc67eaaf62bc0);
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b97
// Size: 0x2e
function private respawndisabled() {
    return isdefined(level.brgametype.var_c42e40ec22a1f0d4) && !level.brgametype.var_c42e40ec22a1f0d4;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bcd
// Size: 0x13
function private function_a420e0f6eca5f1c6() {
    return namespace_d20f8ef223912e12::function_72ce5f47da0f5661() || respawndisabled();
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1be8
// Size: 0x13f
function private function_e79f454a81696e11(reason) {
    level endon("game_ended");
    logstring("[Super Bots] DeployAllUIBotsThread start");
    namespace_92443376a63aa4bd::function_8303a56b1ee268b2("begin", reason, level.var_7b37b2193f163b9b.var_156f390a5362bc55.size);
    while (level.var_7b37b2193f163b9b.var_156f390a5362bc55.size > 0) {
        count = level.var_7b37b2193f163b9b.var_156f390a5362bc55.size;
        for (i = 0; i < count; i++) {
            var_89a675c5bde8848f = namespace_c50b30148766aa59::function_32ec26ab4915f882();
            if (!isdefined(var_89a675c5bde8848f)) {
                break;
            }
            bot = var_89a675c5bde8848f namespace_c50b30148766aa59::activate("Combat", reason);
            if (isdefined(bot)) {
                streamtimeout = getdvarint(@"hash_a022906be1321bb1", 2);
                var_f1f1bc7727ca599b = bot namespace_8bfdb6eb5a3df67a::playergetrespawnpoint(0, streamtimeout).origin;
                namespace_92443376a63aa4bd::onplayerteleport(bot, bot.origin, var_f1f1bc7727ca599b, reason);
                bot setorigin(var_f1f1bc7727ca599b, 1);
            }
        }
        wait(1);
    }
    namespace_92443376a63aa4bd::function_8303a56b1ee268b2("end", reason);
    logstring("[Super Bots] DeployAllUIBotsThread end");
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d2e
// Size: 0xa2
function private function_c9b0122de1017d85() {
    level endon("game_ended");
    while (1) {
        msg = level waittill_any_in_array_return([0:"ui_bot_counter_updated", 1:"updatePlayerAndTeamCountUI"]);
        if (msg == "updatePlayerAndTeamCountUI") {
            level.var_7b37b2193f163b9b.var_892fa74a6b549ef0 = array_removeundefined(level.var_7b37b2193f163b9b.var_892fa74a6b549ef0);
            level.var_7b37b2193f163b9b.var_156f390a5362bc55 = array_removeundefined(level.var_7b37b2193f163b9b.var_156f390a5362bc55);
        }
        function_a892d044d30522da();
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1dd7
// Size: 0x169
function private function_a892d044d30522da() {
    if (getdvarint(@"hash_a2d26b607a32e157", 0) == 1) {
        var_7246a3f648408e11 = level.var_7b37b2193f163b9b.var_892fa74a6b549ef0.size;
        var_d89e89e64b8a8e94 = level.var_7b37b2193f163b9b.var_156f390a5362bc55.size;
        var_4abf63aeddf72469 = 0;
        var_28424573cf3f8f98 = 0;
        var_ba0722e02a3acdf1 = 0;
        foreach (player in level.players) {
            if (isbot(player)) {
                if (!player iseliminated() && !player isuibot()) {
                    if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                        var_28424573cf3f8f98++;
                    } else {
                        var_4abf63aeddf72469++;
                    }
                }
            } else if (function_40034c2faf09a87b()) {
                var_ba0722e02a3acdf1++;
            }
        }
        var_92a9ba49002e7180 = var_4abf63aeddf72469 - var_7246a3f648408e11;
        var_47bf15e70ee220a = (var_d89e89e64b8a8e94 << 24) + (var_7246a3f648408e11 << 16) + (var_92a9ba49002e7180 << 8) + var_ba0722e02a3acdf1;
        setomnvar("ui_br_matchinfo_bot_stats", var_47bf15e70ee220a);
        setomnvar("ui_br_matchinfo_bot_gulag_stats", var_28424573cf3f8f98);
    } else {
        setomnvar("ui_br_matchinfo_bot_stats", 0);
        setomnvar("ui_br_matchinfo_bot_gulag_stats", 0);
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f47
// Size: 0x1c9
function private function_494150569261c828() {
    level endon("game_ended");
    if (istrue(level.br_infils_disabled)) {
        level waittill("player_spawned");
    } else {
        level waittill("br_c130_left_bounds");
    }
    var_60ef63d165685620 = 1.15;
    var_60ef66d165685cb9 = 1.2;
    while (1) {
        interval = getdvarint(@"hash_e0ec70c334cf532a", 30);
        point = function_f7d87293d8dda36();
        if (isdefined(point) && point[1] > 0) {
            var_8b49e0c7718e511c = function_49ed1adad9307ce5();
            var_37749fa4a24bfe71 = var_8b49e0c7718e511c / point[1];
            if (var_37749fa4a24bfe71 > var_60ef63d165685620) {
                interval = clamp(pow(1 / (var_37749fa4a24bfe71 - var_60ef63d165685620), var_60ef66d165685cb9), 1, interval);
            }
        }
        msg = level waittill_any_in_array_or_timeout([0:"player_killed"], interval);
        if (msg == "player_killed") {
            continue;
        }
        /#
            if (getdvarint(@"hash_dd9f8b3596ac0b3d", 0) > 0) {
                iprintln("Skydive");
                continue;
            }
        #/
        var_78c6f95a3c5b0462 = level.var_7b37b2193f163b9b.var_892fa74a6b549ef0.size;
        if (var_78c6f95a3c5b0462 != 0) {
            var_629c48f843740b97 = undefined;
            for (index = 0; index < var_78c6f95a3c5b0462; index++) {
                var_9d90fc100c035523 = level.var_7b37b2193f163b9b.var_892fa74a6b549ef0[index];
                if (!var_9d90fc100c035523 function_16a5388d4963e316()) {
                    var_629c48f843740b97 = var_9d90fc100c035523;
                    break;
                }
            }
            if (isdefined(var_629c48f843740b97)) {
                var_629c48f843740b97 namespace_c4ef709c036dc4a8::activate();
                var_629c48f843740b97 dodamage(var_629c48f843740b97.health + 10000, var_629c48f843740b97.origin, var_629c48f843740b97);
            }
        }
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2117
// Size: 0x93
function function_9f9e27bf69291e6d() {
    function_315d33bcb2364d51();
    while (1) {
        var_8baa6cfd8698560c = 0;
        foreach (player in level.players) {
            if (isdefined(player) && !isbot(player)) {
                var_8baa6cfd8698560c = 1;
                break;
            }
        }
        if (var_8baa6cfd8698560c) {
            wait(1);
        } else {
            forceendgame();
            return;
        }
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21b1
// Size: 0x43
function private function_315d33bcb2364d51() {
    level endon("game_ended");
    /#
        assert(!isdefined(level.players));
    #/
    while (1) {
        player = level waittill("player_spawned");
        if (!isai(player)) {
            return;
        }
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21fb
// Size: 0x97
function private function_49ed1adad9307ce5(var_b12d06a2613ef1a1) {
    count = 0;
    foreach (player in level.players) {
        if (isplayer(player) && !player iseliminated() && !player isuibot()) {
            count++;
        }
    }
    if (!istrue(var_b12d06a2613ef1a1)) {
        count = count + function_1bbd21d289ba8a92();
    }
    return count;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x229a
// Size: 0x2a1
function private function_a0e0c0e1e94630f6() {
    tablename = "mp/br_bot_survival_curve.csv";
    var_9e93f969d16d924b = getdvarint(@"hash_818c699a5caaee4f", 150);
    var_cb2737353ad087da = tableexists(tablename);
    /#
        assert(var_cb2737353ad087da, "br_bot_survival_curve.csv does not exist");
    #/
    level.var_de1b021064d0f5bb = spawnstruct();
    level.var_de1b021064d0f5bb.points = [];
    if (var_cb2737353ad087da && isdefined(level.br_level) && isdefined(level.br_level.br_circledelaytimes)) {
        var_67ba7c3c6b03a843 = 0;
        for (circleindex = 0; circleindex < level.br_level.br_circleclosetimes.size - level.br_level.br_movingcirclecount; circleindex++) {
            var_67ba7c3c6b03a843 = var_67ba7c3c6b03a843 + level.br_level.br_circleclosetimes[circleindex];
            var_67ba7c3c6b03a843 = var_67ba7c3c6b03a843 + level.br_level.br_circledelaytimes[circleindex];
        }
        points = [];
        mapname = getdvar(@"hash_687fb8f9b7a23245");
        var_678958b6c61e482b = 0;
        rownum = tablelookupgetnumrows(tablename);
        for (row = 0; row < rownum; row++) {
            name = tablelookupbyrow(tablename, row, 0);
            gametype = tablelookupbyrow(tablename, row, 1);
            if (name == mapname && namespace_cd0b2d039510b38d::getsubgametype() == gametype) {
                var_678958b6c61e482b = 1;
                progress = int(tablelookupbyrow(tablename, row, 2));
                /#
                    assert(progress >= 0 && progress <= 100);
                #/
                var_37749fa4a24bfe71 = int(tablelookupbyrow(tablename, row, 3)) / 100;
                var_71ea6e5e5cc30c2f = int(tablelookupbyrow(tablename, row, 4)) / 100;
                threshold = int(tablelookupbyrow(tablename, row, 5));
                points[points.size] = (int(float(var_67ba7c3c6b03a843) * progress / 100), int(var_37749fa4a24bfe71 * var_9e93f969d16d924b), int(var_71ea6e5e5cc30c2f * var_9e93f969d16d924b) * 100 + threshold);
            } else if (var_678958b6c61e482b) {
                break;
            }
        }
        if (points.size > 0) {
            level.var_de1b021064d0f5bb.points = points;
            return 1;
        }
    }
    return 0;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2543
// Size: 0x24
function function_e3b7c7a52e05ac10(point) {
    if (isdefined(point)) {
        return int(int(point[2]) / 100);
    }
    return undefined;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x256f
// Size: 0x24
function private function_94f7fcf9188a0a81(point) {
    if (isdefined(point)) {
        return int(int(point[2]) % 100);
    }
    return undefined;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259b
// Size: 0x157
function function_f7d87293d8dda36() {
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.var_5b8569581e64d55a) || !isdefined(level.var_de1b021064d0f5bb) || !isdefined(level.var_de1b021064d0f5bb.points) || level.var_de1b021064d0f5bb.points.size <= 0) {
        return undefined;
    }
    var_27a51444298629d = (gettime() - level.br_circle.var_5b8569581e64d55a) / 1000;
    point = undefined;
    for (i = level.var_de1b021064d0f5bb.curindex; i < level.var_de1b021064d0f5bb.points.size; i++) {
        if (var_27a51444298629d < level.var_de1b021064d0f5bb.points[i][0]) {
            point = level.var_de1b021064d0f5bb.points[i];
            level.var_de1b021064d0f5bb.curindex = i;
            break;
        }
    }
    if (!isdefined(point)) {
        level.var_de1b021064d0f5bb.curindex = level.var_de1b021064d0f5bb.points.size;
    }
    return point;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26fa
// Size: 0x13e
function private function_c596173d88d8446e() {
    level endon("game_ended");
    level.var_de1b021064d0f5bb.curindex = 0;
    if (level.br_infils_disabled) {
        level waittill("spawned_bots");
    } else {
        level waittill("br_c130_left_bounds");
    }
    /#
        level.var_de1b021064d0f5bb.var_aea8b799cac51eff = 0;
        level thread function_3732de24f5682219();
    #/
    while (1) {
        var_27a51444298629d = (gettime() - level.br_circle.var_5b8569581e64d55a) / 1000;
        point = function_f7d87293d8dda36();
        if (!isdefined(point)) {
            break;
        }
        var_a36b089919c77aa6 = point[0] - var_27a51444298629d;
        var_8b49e0c7718e511c = function_49ed1adad9307ce5();
        var_a22a5a2e074a564 = var_8b49e0c7718e511c - point[1];
        if (var_a22a5a2e074a564 < 1) {
            wait(var_a36b089919c77aa6);
            continue;
        }
        var_cf155863a8e68ec0 = var_a36b089919c77aa6 / var_a22a5a2e074a564;
        /#
            level.var_de1b021064d0f5bb.var_aea8b799cac51eff = gettime() + var_cf155863a8e68ec0 * 1000;
        #/
        wait(var_cf155863a8e68ec0);
        logstring("[Super Bots] SurvivalCurve: to many survivors, kill a bot");
        namespace_c50b30148766aa59::function_966ab6ffd873ec11(1, 0, "SurvivalCurve");
        wait(1);
    }
    cleanupleftuibots();
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x283f
// Size: 0x65
function private cleanupleftuibots() {
    level.var_7b37b2193f163b9b.var_b871280cbdc11caf = 1;
    reason = "CleanUpLeftUIBots";
    namespace_92443376a63aa4bd::function_8303a56b1ee268b2("begin", reason, function_1bbd21d289ba8a92());
    while (function_1bbd21d289ba8a92() > 0) {
        namespace_c50b30148766aa59::function_966ab6ffd873ec11(1, 0, reason);
        wait(1);
    }
    namespace_92443376a63aa4bd::function_8303a56b1ee268b2("end", reason);
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28ab
// Size: 0x159
function private function_fb4771e79218146b(bot) {
    if (!isbot(bot)) {
        return undefined;
    }
    /#
        if (getdvarint(@"hash_aefbe1721e059470", 0)) {
            return undefined;
        }
    #/
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.var_5b8569581e64d55a)) {
        return undefined;
    }
    if (istrue(bot.var_82bd86e99f1dd1e4)) {
        bot.var_82bd86e99f1dd1e4 = undefined;
        return undefined;
    }
    if (!isdefined(level.var_de1b021064d0f5bb) || !isdefined(level.var_de1b021064d0f5bb.points) || level.var_de1b021064d0f5bb.points.size <= 0) {
        return undefined;
    }
    point = function_f7d87293d8dda36();
    if (!isdefined(point)) {
        return undefined;
    }
    threshold = function_94f7fcf9188a0a81(point) / 100;
    var_8b49e0c7718e511c = function_49ed1adad9307ce5();
    if (var_8b49e0c7718e511c > point[1] * (1 + threshold)) {
        namespace_80cec6cfc70c4f95::markplayeraseliminated(bot);
        logstring("[Super Bots] SurvivalCurve: mark bot as eliminated:" + bot.name);
        return 1;
    } else if (var_8b49e0c7718e511c < point[1] * (1 - threshold)) {
        if (!bot namespace_c50b30148766aa59::function_b2502f3345564abf()) {
            return undefined;
        }
        bot.respawningfromtoken = 1;
        bot thread function_6e4f25ce6aafc2a8();
        return 0;
    }
    return undefined;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a0c
// Size: 0xd6
function private function_6e4f25ce6aafc2a8() {
    level endon("game_ended");
    /#
        assert(isdefined(self));
    #/
    name = self.name;
    entityid = self getentitynumber();
    var_ff1a8c6f49882fe8 = function_53c4c53197386572(self.var_ff1a8c6f49882fe8, "");
    var_6fd1e5714453e3f9 = 2;
    timeuntilspawn = namespace_99ac021a7547cae3::timeuntilspawn(1) + var_6fd1e5714453e3f9;
    wait(timeuntilspawn);
    if (!isdefined(self)) {
        logstring("WARNING: SurvivalCurveWaitRecycleThread() bot is undefined! Skip recycle. name=" + name + " entityID=" + entityid + " BBA_Id=" + var_ff1a8c6f49882fe8);
        return;
    }
    logstring("[Super Bots] SurvivalCurve: recycle bot after killed:" + self.name);
    result = namespace_c50b30148766aa59::function_d3638cf9a2da76a("SurvivalCurve recycle after killed");
    if (!result) {
        kickplayer();
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ae9
// Size: 0x51
function private function_a5786099ca387b00() {
    point = namespace_95d8d8ec67e3e074::function_f7d87293d8dda36();
    if (isdefined(point)) {
        threshold = namespace_95d8d8ec67e3e074::function_94f7fcf9188a0a81(point) / 100;
        var_8b49e0c7718e511c = namespace_95d8d8ec67e3e074::function_49ed1adad9307ce5();
        if (var_8b49e0c7718e511c > point[1] * (1 + threshold)) {
            return 0;
        }
    }
    return 1;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b42
// Size: 0x91
function function_e89eaa436ffad5a4() {
    level endon("game_ended");
    duration = getdvarint(@"hash_6f2bcb1f13830539", 90000);
    var_d0b92e71c0c2d4fb = function_719a071e30a49f1();
    var_e254f66879e0132d = gettime();
    while (1) {
        if (var_d0b92e71c0c2d4fb > 0 && gettime() >= var_d0b92e71c0c2d4fb) {
            break;
        }
        if (function_6f0140d48aee879()) {
            if (gettime() - var_e254f66879e0132d >= duration) {
                break;
            }
        } else {
            var_e254f66879e0132d = gettime();
        }
        wait(1);
    }
    forceendgame();
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bda
// Size: 0x12b
function function_719a071e30a49f1() {
    if (istrue(level.br_circle_disabled)) {
        return 0;
    }
    if (!isdefined(level.br_circle.var_5b8569581e64d55a)) {
        level waittill("br_circle_set");
    }
    var_2fb1ab6e77cc6a3d = 0;
    if (isdefined(level.br_level.br_circledelaytimes)) {
        for (i = 0; i < level.br_level.br_circledelaytimes.size; i++) {
            var_c3d4caa5cb4132e6 = level.br_level.br_circledelaytimes[i];
            var_2fb1ab6e77cc6a3d = var_2fb1ab6e77cc6a3d + var_c3d4caa5cb4132e6;
        }
    }
    if (isdefined(level.br_level.br_circleclosetimes)) {
        for (i = 0; i < level.br_level.br_circleclosetimes.size; i++) {
            closetime = level.br_level.br_circleclosetimes[i];
            var_2fb1ab6e77cc6a3d = var_2fb1ab6e77cc6a3d + closetime;
        }
    }
    return level.br_circle.var_5b8569581e64d55a + var_2fb1ab6e77cc6a3d * 1000 + getdvarint(@"hash_b601ee95f4a4ba2e", 0);
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0d
// Size: 0x86
function function_6f0140d48aee879() {
    var_b80587eae094ec62 = 0;
    var_638aaa73bdeb51c9 = function_a0f36ff3eae203ae();
    foreach (entry in level.teamnamelist) {
        if (function_947d35b32cf46531(entry, var_638aaa73bdeb51c9)) {
            var_b80587eae094ec62++;
            if (var_b80587eae094ec62 > 1) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9b
// Size: 0x6b
function function_a0f36ff3eae203ae() {
    if (istrue(level.br_circle_disabled)) {
        return 0;
    }
    if (level.br_level.br_movingcirclecount <= 0) {
        return 0;
    }
    return level.br_circle.circleindex + 1 >= level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0e
// Size: 0xaa
function function_947d35b32cf46531(team, var_638aaa73bdeb51c9) {
    alivecount = namespace_54d20dd0dd79277f::getteamdata(team, "aliveCount");
    if (alivecount <= 0) {
        return 0;
    }
    if (istrue(var_638aaa73bdeb51c9)) {
        players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
        foreach (teammate in players) {
            if (!isai(teammate)) {
                return 1;
            }
        }
        return 0;
    } else {
        return 1;
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebf
// Size: 0xae
function forceendgame() {
    level.var_7b37b2193f163b9b.var_b871280cbdc11caf = 1;
    var_575cd615eea97ff5 = getdvarint(@"hash_14a1f07fa4c28b94", 0);
    logstring("ForceEndGame. endGameMethod=" + var_575cd615eea97ff5);
    namespace_92443376a63aa4bd::function_873c0be4897bd6c8(var_575cd615eea97ff5);
    if (var_575cd615eea97ff5 == 0) {
        thread namespace_d576b6dc7cef9c62::forceend();
        return;
    }
    winner = function_5b81a287d0eff6ad();
    /#
        assert(isdefined(winner));
    #/
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        function_eb1a045a6d299c6a();
    }
    if (!namespace_d20f8ef223912e12::function_a587b0b0998c6d13()) {
        thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["enemies_eliminated"], game["end_reason"]["br_eliminated"]);
    }
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f74
// Size: 0xf8
function function_5b81a287d0eff6ad() {
    var_638aaa73bdeb51c9 = 1;
    foreach (entry in level.teamnamelist) {
        if (function_947d35b32cf46531(entry, var_638aaa73bdeb51c9)) {
            return entry;
        }
    }
    var_638aaa73bdeb51c9 = 0;
    foreach (entry in level.teamnamelist) {
        if (function_947d35b32cf46531(entry, var_638aaa73bdeb51c9)) {
            return entry;
        }
    }
    if (level.var_7b37b2193f163b9b.var_156f390a5362bc55.size > 0) {
        return level.var_7b37b2193f163b9b.var_156f390a5362bc55[0].team;
    }
    return undefined;
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3074
// Size: 0xa2
function function_f19131452f7b839a() {
    /#
        level waittill("<unknown string>");
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        cmd = "<unknown string>";
        function_94d6b8da353cf462(cmd);
        namespace_c50b30148766aa59::function_2fd7dbe9fce56a4b();
        level thread function_3e27a1f84d84fc6a();
        level thread function_a0ee40c011c7dbf0();
        level thread function_da1172b593a41342();
    #/
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x311d
// Size: 0x232
function function_3e27a1f84d84fc6a() {
    /#
        level endon("<unknown string>");
        while (!isdefined(level.players)) {
            wait(1);
        }
        setdvarifuninitialized(@"hash_a2d26b607a32e157", 0);
        while (1) {
            if (getdvarint(@"hash_a2d26b607a32e157", 0) == 1) {
                var_4abf63aeddf72469 = 0;
                var_defe7b118dc3891d = 0;
                foreach (player in level.players) {
                    if (isbot(player) && !player iseliminated()) {
                        if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                            var_defe7b118dc3891d++;
                        } else if (!player isuibot()) {
                            var_4abf63aeddf72469++;
                            if (player function_d012729eac1e7053()) {
                                var_14efa638229efbd5 = "<unknown string>";
                                if (player namespace_c4ef709c036dc4a8::issuspended()) {
                                    var_14efa638229efbd5 = var_14efa638229efbd5 + "<unknown string>";
                                }
                                if (isdefined(player.var_c2ad339c4e95c7fe)) {
                                    var_14efa638229efbd5 = var_14efa638229efbd5 + "<unknown string>" + player.var_c2ad339c4e95c7fe;
                                }
                            } else {
                                var_14efa638229efbd5 = "<unknown string>";
                            }
                            print3d(player.origin + (0, 0, 100), var_14efa638229efbd5, (1, 0, 0), 1, 1, 70, 1);
                        }
                    }
                }
                var_7246a3f648408e11 = level.var_7b37b2193f163b9b.var_892fa74a6b549ef0.size;
                var_d89e89e64b8a8e94 = level.var_7b37b2193f163b9b.var_156f390a5362bc55.size;
                var_3ce65cfec5ad6979 = var_7246a3f648408e11 + var_d89e89e64b8a8e94;
                var_89e85c0815c992d6 = gettime() + 1000;
                while (gettime() < var_89e85c0815c992d6) {
                    printtoscreen2d(500, 100, "<unknown string>" + var_3ce65cfec5ad6979 + "<unknown string>" + var_7246a3f648408e11 + "<unknown string>" + var_d89e89e64b8a8e94 + "<unknown string>" + var_defe7b118dc3891d + "<unknown string>" + var_4abf63aeddf72469 - var_7246a3f648408e11, (1, 0, 0), 2);
                    waitframe();
                }
            } else {
                wait(1);
            }
        }
    #/
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3356
// Size: 0xdd
function function_a0ee40c011c7dbf0() {
    /#
        level endon("<unknown string>");
        while (!isdefined(level.players)) {
            wait(1);
        }
        setdvarifuninitialized(@"hash_e7a0fc54a24bf343", 0);
        while (1) {
            if (getdvarint(@"hash_e7a0fc54a24bf343", 0) == 1) {
                setdvar(@"hash_e7a0fc54a24bf343", 0);
                foreach (player in level.players) {
                    if (isvalidbot(player)) {
                        if (!namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c()) {
                            player namespace_c4ef709c036dc4a8::function_d3638cf9a2da76a("<unknown string>");
                        } else {
                            player namespace_c50b30148766aa59::function_d3638cf9a2da76a("<unknown string>");
                        }
                    }
                }
            }
            wait(1);
        }
    #/
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x343a
// Size: 0x1ad
function function_da1172b593a41342() {
    /#
        level endon("<unknown string>");
        setdvarifuninitialized(@"hash_d95f6cfac74fa872", 0);
        setdvarifuninitialized(@"hash_25920b075500f084", 0);
        setdvarifuninitialized(@"hash_70561094fa4e91b5", 0);
        setdvarifuninitialized(@"hash_dd9f8b3596ac0b3d", 0);
        setdvarifuninitialized(@"hash_aefbe1721e059470", 0);
        var_b99c15ff91a54ffa = getdvarint(@"hash_d95f6cfac74fa872", 0);
        var_29080d691bb72834 = getdvarint(@"hash_25920b075500f084", 0);
        var_24b5eeca7a6109ed = getdvarint(@"hash_70561094fa4e91b5", 0);
        var_7c4e466930c5330e = getdvarint(@"hash_dd9f8b3596ac0b3d", 0);
        var_889f45625d6bc05c = getdvarint(@"hash_aefbe1721e059470", 0);
        while (1) {
            function_dc925a47fd3404ba(var_b99c15ff91a54ffa, @"hash_d95f6cfac74fa872", "<unknown string>");
            var_b99c15ff91a54ffa = getdvarint(@"hash_d95f6cfac74fa872", 0);
            function_dc925a47fd3404ba(var_29080d691bb72834, @"hash_25920b075500f084", "<unknown string>");
            var_29080d691bb72834 = getdvarint(@"hash_25920b075500f084", 0);
            function_dc925a47fd3404ba(var_24b5eeca7a6109ed, @"hash_70561094fa4e91b5", "<unknown string>");
            var_24b5eeca7a6109ed = getdvarint(@"hash_70561094fa4e91b5", 0);
            function_dc925a47fd3404ba(var_7c4e466930c5330e, @"hash_dd9f8b3596ac0b3d", "<unknown string>");
            var_7c4e466930c5330e = getdvarint(@"hash_dd9f8b3596ac0b3d", 0);
            function_dc925a47fd3404ba(var_889f45625d6bc05c, @"hash_aefbe1721e059470", "<unknown string>");
            var_889f45625d6bc05c = getdvarint(@"hash_aefbe1721e059470", 0);
            wait(1);
        }
    #/
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x35ee
// Size: 0x52
function function_dc925a47fd3404ba(dvarvalue, dvarname, hintstring) {
    /#
        if (dvarvalue != getdvarint(dvarname, 0)) {
            if (getdvarint(dvarname, 0)) {
                iprintln(hintstring + "<unknown string>");
            } else {
                iprintln(hintstring + "<unknown string>");
            }
        }
    #/
}

// Namespace manager/namespace_95d8d8ec67e3e074
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3647
// Size: 0x4f5
function function_3732de24f5682219() {
    /#
        var_b1bb15f72ae705d3 = [];
        for (i = 0; i < level.var_de1b021064d0f5bb.points.size; i++) {
            var_b1bb15f72ae705d3[var_b1bb15f72ae705d3.size] = 0;
        }
        var_e39d8e5a89e12a3e = [];
        time = 0;
        for (circleindex = 0; circleindex < level.br_level.br_circledelaytimes.size; circleindex++) {
            timedelay = level.br_level.br_circledelaytimes[circleindex];
            time = time + timedelay;
            var_e39d8e5a89e12a3e[var_e39d8e5a89e12a3e.size] = time;
            var_3d8565e2775a243c = level.br_level.br_circleclosetimes[circleindex];
            time = time + var_3d8565e2775a243c;
        }
        while (1) {
            if (getdvarint(@"hash_52f1eee4900df5a4", 0) > 0) {
                var_27a51444298629d = (gettime() - level.br_circle.var_5b8569581e64d55a) / 1000;
                var_8b49e0c7718e511c = function_49ed1adad9307ce5();
                point = undefined;
                for (i = level.var_de1b021064d0f5bb.curindex; i < level.var_de1b021064d0f5bb.points.size; i++) {
                    if (var_27a51444298629d < level.var_de1b021064d0f5bb.points[i][0]) {
                        point = level.var_de1b021064d0f5bb.points[i];
                        var_b1bb15f72ae705d3[i] = var_8b49e0c7718e511c;
                        break;
                    }
                }
                if (!isdefined(point)) {
                    point = level.var_de1b021064d0f5bb.points[level.var_de1b021064d0f5bb.points.size - 1];
                }
                var_a36b089919c77aa6 = point[0] - var_27a51444298629d;
                msg = "<unknown string>";
                if (gettime() < level.var_de1b021064d0f5bb.var_aea8b799cac51eff) {
                    msg = "<unknown string>" + (level.var_de1b021064d0f5bb.var_aea8b799cac51eff - gettime()) / 1000;
                }
                x = 600;
                y = 900;
                printtoscreen2d(x, 600, "<unknown string>" + getdvarint(@"hash_818c699a5caaee4f", 0) + "<unknown string>" + var_a36b089919c77aa6, (1, 0, 0), 1.5);
                printtoscreen2d(x, 650, "<unknown string>" + point[1] + "<unknown string>" + var_8b49e0c7718e511c + "<unknown string>" + msg, (1, 0, 0), 1.5);
                printtoscreen2d(x, 700, "<unknown string>" + function_e3b7c7a52e05ac10(point) + "<unknown string>" + function_94f7fcf9188a0a81(point), (1, 0, 0), 1.5);
                printtoscreen2d(x, y, "<unknown string>", (1, 1, 1), 1);
                var_ee5ab934f482b124 = namespace_47fd1e79a44628cd::gettimetogulagclosed();
                printtoscreen2d(x + var_ee5ab934f482b124 / 2, y, "<unknown string>", (1, 1, 1), 1);
                printtoscreen2d(x + var_27a51444298629d / 2, y, "<unknown string>", (1, 1, 1), 1);
                for (i = 0; i < 10; i++) {
                    printtoscreen2d(x, y - i * 15, "<unknown string>", (1, 1, 1), 1);
                }
                printtoscreen2d(x, y - 150, "<unknown string>", (1, 1, 1), 1);
                for (i = 0; i < level.var_de1b021064d0f5bb.points.size; i++) {
                    point = level.var_de1b021064d0f5bb.points[i];
                    if (i == level.var_de1b021064d0f5bb.curindex) {
                        printtoscreen2d(x + point[0] / 2, y - point[1] * 2, "<unknown string>", (1, 1, 0), 1);
                    } else {
                        printtoscreen2d(x + point[0] / 2, y - point[1] * 2, "<unknown string>", (1, 0, 0), 1);
                    }
                    if (var_b1bb15f72ae705d3[i] > 0) {
                        printtoscreen2d(x + point[0] / 2, y - var_b1bb15f72ae705d3[i] * 2, "<unknown string>", (0, 1, 0), 1);
                    }
                }
                for (i = 0; i < var_e39d8e5a89e12a3e.size; i++) {
                    printtoscreen2d(x + var_e39d8e5a89e12a3e[i] / 2, y - 5, "<unknown string>", (1, 1, 1), 1);
                }
                waitframe();
            } else {
                wait(1);
            }
        }
    #/
}

