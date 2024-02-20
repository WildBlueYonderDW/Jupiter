// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_58be75c518bf0d40;
#using script_76cc264b397db9cb;
#using script_2342b8aad723994e;
#using script_4c770a9a4ad7659c;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gamescore.gsc;
#using script_3f1b6713ca4c9c7;
#using script_7c40fa80892a721;
#using script_a34750d17473c49;
#using scripts\mp\menus.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_6bf5a85a2b78b77a;

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x727
// Size: 0x184
function init() {
    registersharedfunc("teamAssim", "requestLeaveTeam", &requestLeaveTeam);
    registersharedfunc("teamAssim", "requestNearbyTeamChange", &requestNearbyTeamChange);
    registersharedfunc("teamAssim", "resolveAssimRequest", &resolveAssimRequest);
    registersharedfunc("teamAssim", "isWaitingForAssimResponse", &isWaitingForAssimResponse);
    registersharedfunc("teamAssim", "isEnabled", &function_6934349b7823d888);
    registersharedfunc("teamAssim", "disablePlayer", &function_bb4125d6847af349);
    registersharedfunc("teamAssim", "enablePlayer", &function_59cf08630dd70540);
    registersharedfunc("teamAssim", "isPlayersAssimDisabled", &isPlayersAssimDisabled);
    registersharedfunc("teamAssim", "permanentlyDisableAssim", &permanentlyDisableAssim);
    registersharedfunc("teamAssim", "registerTeamAssimilateCallback", &registerTeamAssimilateCallback);
    registersharedfunc("teamAssim", "canAssimilate", &canAssimilate);
    registersharedfunc("teamAssim", "canTeamAssimilate", &canTeamAssimilate);
    registersharedfunc("teamAssim", "assimilatePlayer", &assimilatePlayer);
    registersharedfunc("teamAssim", "shouldAutoAcceptTeamSwitch", &shouldAutoAcceptTeamSwitch);
    registersharedfunc("teamAssim", "getMaxAssimilationTeamSize", &getMaxAssimilationTeamSize);
    registersharedfunc("teamAssim", "sendDirectAssimRequest", &sendDirectAssimRequest);
    if (squad_utility::issquadmode()) {
        namespace_c31609f90efcf2ca::function_a99987c7bf114da4(&function_2a1e4811621fdcde);
    }
    /#
        level thread function_ec7c2b6761cd9ab3();
    #/
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b2
// Size: 0x39
function registerTeamAssimilateCallback(callback) {
    if (!isdefined(level.var_6b08d5e6b7943575)) {
        level.var_6b08d5e6b7943575 = [];
    }
    level.var_6b08d5e6b7943575[level.var_6b08d5e6b7943575.size] = callback;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f2
// Size: 0xd6
function function_80139212a4c66a94(player, oldteam, newteam, var_e91a6371e99e1350, var_43b043539f9c3ccf) {
    if (!isdefined(level.var_6b08d5e6b7943575)) {
        return;
    }
    foreach (callback in level.var_6b08d5e6b7943575) {
        [[ callback ]](player, oldteam, newteam);
    }
    params = spawnstruct();
    params.player = player;
    params.var_e91a6371e99e1350 = var_e91a6371e99e1350;
    params.var_43b043539f9c3ccf = var_43b043539f9c3ccf;
    namespace_7f0bcee5d45a1dea::callback("player_assimilated", params);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cf
// Size: 0x89
function function_6934349b7823d888() {
    if (!isdefined(level.var_cc0d5a1e8a904e5c)) {
        if (isdefined(level.var_62f6f7640e4431e3) && isdefined(level.var_62f6f7640e4431e3.var_1685d95f041d2a96)) {
            level.var_cc0d5a1e8a904e5c = level.var_62f6f7640e4431e3.var_1685d95f041d2a96 && getdvarint(@"hash_af509ac21ec3bd6a", 1);
        } else {
            level.var_cc0d5a1e8a904e5c = getdvarint(@"hash_af509ac21ec3bd6a", 0);
        }
    }
    return level.var_cc0d5a1e8a904e5c;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa60
// Size: 0x31
function function_9f3b05f2ea701548() {
    if (!isdefined(level.var_f759b9e710865ce3)) {
        level.var_f759b9e710865ce3 = getdvarint(@"hash_1d0d8806c4170519", 0);
    }
    return level.var_f759b9e710865ce3;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa99
// Size: 0x8b
function getMaxAssimilationTeamSize() {
    if (!isdefined(level.var_5f92f1f4d7faf5a0)) {
        if (isdefined(level.var_62f6f7640e4431e3) && isdefined(level.var_62f6f7640e4431e3.var_e4db1f07df5076a0)) {
            level.var_5f92f1f4d7faf5a0 = getdvarint(@"hash_cf23e6b4c2ae4e63", level.var_62f6f7640e4431e3.var_e4db1f07df5076a0);
        } else {
            level.var_5f92f1f4d7faf5a0 = getdvarint(@"hash_cf23e6b4c2ae4e63", level.maxteamsize);
        }
    }
    return level.var_5f92f1f4d7faf5a0;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2c
// Size: 0x32
function function_82aca4b8517cf46a() {
    if (!isdefined(level.var_414ea35a258152f2)) {
        level.var_414ea35a258152f2 = getdvarint(@"hash_a530e29a7e6e465f", 10);
    }
    return level.var_414ea35a258152f2;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb66
// Size: 0x32
function function_47e8570f3b3f9f83() {
    if (!isdefined(level.var_e69e9946b0c86b5b)) {
        level.var_e69e9946b0c86b5b = getdvarint(@"hash_2295fd2d3dd21f90", 20);
    }
    return level.var_e69e9946b0c86b5b;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba0
// Size: 0x32
function function_ef81e6fd30058e1b() {
    if (!isdefined(level.var_2cdb5739576268c2)) {
        level.var_2cdb5739576268c2 = getdvarint(@"hash_b030f536fdd71efb", 1);
    }
    return level.var_2cdb5739576268c2;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbda
// Size: 0x32
function function_75a3d83d6f553a46() {
    if (!isdefined(level.var_c650833ce57ce717)) {
        level.var_c650833ce57ce717 = getdvarint(@"hash_f1801dd0c0e36ab6", 5);
    }
    return level.var_c650833ce57ce717;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc14
// Size: 0x33
function function_f258ca1fd3c63122() {
    if (!isdefined(level.var_4466ec3279c26727)) {
        level.var_4466ec3279c26727 = getdvarint(@"hash_bb74d762ec936b6d", 1000);
    }
    return level.var_4466ec3279c26727;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4f
// Size: 0x43
function canTeamAssimilate(team) {
    if (!function_6934349b7823d888()) {
        return 0;
    }
    players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    teamsize = players.size;
    return teamsize < getMaxAssimilationTeamSize();
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9a
// Size: 0x62
function function_2a6e88019515e213(team, squadid) {
    if (!function_6934349b7823d888()) {
        return 0;
    }
    if (!isdefined(level.squaddata[team]) || !isdefined(level.squaddata[team][squadid])) {
        return 0;
    }
    return level.squaddata[team][squadid].players.size < getMaxAssimilationTeamSize();
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd04
// Size: 0xe7
function canAssimilate(var_3b96d5666000c2e0, var_784c8ada1184ff89, var_e80f1eb2c1910ad4, var_4ade2291346e1240) {
    if (!isdefined(var_3b96d5666000c2e0) || !isdefined(var_784c8ada1184ff89)) {
        return 0;
    }
    if (isPlayersAssimDisabled(var_e80f1eb2c1910ad4)) {
        var_e80f1eb2c1910ad4 namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_DISABLED");
        return 0;
    }
    if (isPlayersAssimDisabled(var_3b96d5666000c2e0) || isPlayersAssimDisabled(var_784c8ada1184ff89)) {
        var_e80f1eb2c1910ad4 namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_DISABLED_ENEMY");
        return 0;
    }
    var_674c1fec5874253c = isdefined(level.squaddata);
    var_1672c24528714d7d = var_784c8ada1184ff89.team;
    if (var_674c1fec5874253c && var_3b96d5666000c2e0.var_ff97225579de16a == var_784c8ada1184ff89.var_ff97225579de16a) {
        return 0;
    } else if (!var_674c1fec5874253c && var_1672c24528714d7d == var_3b96d5666000c2e0.team) {
        return 0;
    }
    if (!function_4aaeca4295a600d(var_784c8ada1184ff89, var_3b96d5666000c2e0, var_e80f1eb2c1910ad4, var_4ade2291346e1240)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf3
// Size: 0x18
function isWaitingForAssimResponse(player) {
    return isdefined(player.var_7f1423df13bbb144);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe13
// Size: 0x31
function private shouldAutoAcceptTeamSwitch() {
    if (!isdefined(level.var_9cc2a7f8358ecb3b)) {
        level.var_9cc2a7f8358ecb3b = getdvarint(@"hash_a267ff0e64f57760", 0);
    }
    return level.var_9cc2a7f8358ecb3b;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe4c
// Size: 0xf4
function private function_4aaeca4295a600d(var_784c8ada1184ff89, var_3b96d5666000c2e0, var_e80f1eb2c1910ad4, var_72ce9fa792fd31a1) {
    if (function_9f3b05f2ea701548() && !istrue(var_3b96d5666000c2e0.inlaststand)) {
        if (!istrue(var_72ce9fa792fd31a1)) {
            var_e80f1eb2c1910ad4 namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_PLAYER_NOT_DOWNED");
        }
        return 0;
    } else if (isdefined(level.squaddata) && !function_2a6e88019515e213(var_784c8ada1184ff89.team, var_784c8ada1184ff89.var_ff97225579de16a)) {
        if (!istrue(var_72ce9fa792fd31a1)) {
            var_e80f1eb2c1910ad4 namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_TEAM_SIZE");
        }
        return 0;
    } else if (!isdefined(level.squaddata) && !canTeamAssimilate(var_784c8ada1184ff89.team)) {
        if (!istrue(var_72ce9fa792fd31a1)) {
            var_e80f1eb2c1910ad4 namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_TEAM_SIZE");
        }
        return 0;
    } else if (var_3b96d5666000c2e0 namespace_f8065cafc523dba5::isinvehicle(1)) {
        if (!istrue(var_72ce9fa792fd31a1)) {
            var_e80f1eb2c1910ad4 namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_PLAYER_IN_VEHICLE");
        }
        return 0;
    }
    return 1;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf48
// Size: 0x7b
function function_bb4125d6847af349(player, request) {
    if (!isdefined(player.var_cd20b5c89ca5f5d0)) {
        player.var_cd20b5c89ca5f5d0 = [];
    }
    var_5631c1e8de9da238 = isPlayersAssimDisabled(player);
    player.var_cd20b5c89ca5f5d0[request] = 1;
    var_52f051d04c06af73 = isPlayersAssimDisabled(player);
    if (var_52f051d04c06af73 && !var_5631c1e8de9da238) {
        player setclientomnvar("ui_assimilation_disabled", 1);
    }
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfca
// Size: 0x78
function function_59cf08630dd70540(player, request) {
    if (!isdefined(player.var_cd20b5c89ca5f5d0)) {
        player.var_cd20b5c89ca5f5d0 = [];
    }
    var_5631c1e8de9da238 = isPlayersAssimDisabled(player);
    player.var_cd20b5c89ca5f5d0[request] = undefined;
    var_52f051d04c06af73 = isPlayersAssimDisabled(player);
    if (!var_52f051d04c06af73 && var_5631c1e8de9da238) {
        player setclientomnvar("ui_assimilation_disabled", 0);
    }
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1049
// Size: 0x36
function isPlayersAssimDisabled(player) {
    return istrue(level.var_ed844db90cb6d370) || isdefined(player.var_cd20b5c89ca5f5d0) && player.var_cd20b5c89ca5f5d0.size;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1087
// Size: 0x76
function permanentlyDisableAssim() {
    if (istrue(level.var_ed844db90cb6d370)) {
        return;
    }
    foreach (player in level.players) {
        function_bb4125d6847af349(player, "permanent");
    }
    level.var_ed844db90cb6d370 = 1;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1104
// Size: 0x3b
function function_a84bf6c8ff064511(targetplayer) {
    targetplayer.var_7f1423df13bbb144 = undefined;
    targetplayer.var_4f8afa3693e318d4 = undefined;
    targetplayer.var_312490cd130c9914 = undefined;
    targetplayer setclientomnvar("ui_assimilation_clientnum", -1);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1146
// Size: 0x50
function function_e81936c3b6775f2b(player) {
    if (isPlayersAssimDisabled(player)) {
        if (player namespace_10260b963310d30e::function_a2dd7d8143656503(player)) {
            player namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/BLOCKED_BY_INTERROGATE");
        }
        return 0;
    } else if (player namespace_f8065cafc523dba5::isinvehicle(1)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_PLAYER_IN_VEHICLE");
        return 0;
    }
    return 1;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119e
// Size: 0x3c
function function_b530aa511cac761(player) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("assimilation_resolved");
    timeout = function_47e8570f3b3f9f83();
    wait(timeout);
    function_a84bf6c8ff064511(player);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e1
// Size: 0x4d
function function_e5dbb2b054d0cabd(player, var_e9d6e314baedb056) {
    level endon("game_ended");
    player endon("disconnect");
    period = function_75a3d83d6f553a46();
    player.var_fee2ccc62e5cc50d = var_e9d6e314baedb056;
    wait(period);
    player.var_fee2ccc62e5cc50d = undefined;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1235
// Size: 0x26d
function requestLeaveTeam(player) {
    if (!getdvarint(@"hash_df8987540c302b00", 0)) {
        return 0;
    }
    if (!function_e81936c3b6775f2b(player)) {
        return 0;
    }
    var_674c1fec5874253c = isdefined(level.squaddata);
    if (!var_674c1fec5874253c) {
        return 0;
    }
    if (level.squaddata[player.team][player.var_ff97225579de16a].players.size <= 1) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_SOLO");
        return 0;
    }
    oldteam = player.team;
    var_e91a6371e99e1350 = player.var_ff97225579de16a;
    squads::leavesquad(oldteam, var_e91a6371e99e1350);
    squads::requestnewsquad(player.team);
    var_bd0b3fa85d4e5899 = [];
    var_238f49a5d09ad7b6 = level.squaddata[oldteam][var_e91a6371e99e1350].players;
    namespace_ede58c1e66c2c280::function_47990577bda08bb4(player, var_238f49a5d09ad7b6);
    player namespace_ede58c1e66c2c280::calloutmarkerping_removeallcalloutsforplayer();
    foreach (teammember in var_238f49a5d09ad7b6) {
        if (isdefined(teammember) && player != teammember) {
            var_bd0b3fa85d4e5899[var_bd0b3fa85d4e5899.size] = teammember;
        }
    }
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("assim_request_response_leaving_team", var_bd0b3fa85d4e5899);
    if (issharedfuncdefined("hud", "showBrDMZSplash")) {
        [[ getsharedfunc("hud", "showBrDMZSplash") ]]("player_left_alone", [0:player], undefined, undefined, undefined, level.var_42b1e877ab187c6);
        players = level.squaddata[oldteam][var_e91a6371e99e1350].players;
        if (isdefined(players)) {
            players = array_remove(players, player);
            [[ getsharedfunc("hud", "showBrDMZSplash") ]]("player_left_team", players, undefined, player getentitynumber(), undefined, level.var_42b1e877ab187c6);
        }
    }
    function_810613fb0e83165e(player.team, player.var_ff97225579de16a, player);
    function_9ad90f0a744225a8(player.team);
    function_80139212a4c66a94(player, oldteam, player.team, var_e91a6371e99e1350, player.var_ff97225579de16a);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a9
// Size: 0x25a
function requestNearbyTeamChange(player, var_99bcf6bdf31a0e49) {
    if (!function_e81936c3b6775f2b(player)) {
        return 0;
    }
    var_674c1fec5874253c = isdefined(level.squaddata);
    if (!var_99bcf6bdf31a0e49 && (!var_674c1fec5874253c && !canTeamAssimilate(player.team) || var_674c1fec5874253c && !function_2a6e88019515e213(player.team, player.var_ff97225579de16a))) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_PING_INGAME/ASSIM_FAILED_TEAM_SIZE");
        return 0;
    }
    if (issharedfuncdefined("hud", "showBrDMZSplash")) {
        if (var_99bcf6bdf31a0e49) {
            [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_team_assimilation_used_join_on_target", [0:player], undefined, undefined, undefined, level.var_42b1e877ab187c6);
        } else {
            [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_team_assimilation_used", [0:player], undefined, undefined, undefined, level.var_42b1e877ab187c6);
        }
    }
    var_7ff3973c2ad05964 = function_f258ca1fd3c63122();
    var_e965bce0774276b4 = namespace_7e17181d03156026::getplayersinradius(player.origin, var_7ff3973c2ad05964);
    var_3d290d914e1249a0 = [];
    var_e4fc35b9446269cf = function_ef81e6fd30058e1b();
    foreach (targetplayer in var_e965bce0774276b4) {
        if (targetplayer == player || !isplayer(targetplayer) || isPlayersAssimDisabled(targetplayer)) {
            continue;
        }
        if (var_674c1fec5874253c && self.var_ff97225579de16a == targetplayer.var_ff97225579de16a) {
            continue;
        } else if (!var_674c1fec5874253c && targetplayer.team == player.team) {
            continue;
        }
        success = sendDirectAssimRequest(player, targetplayer, var_99bcf6bdf31a0e49, var_e4fc35b9446269cf);
        if (istrue(success)) {
            var_3d290d914e1249a0[var_3d290d914e1249a0.size] = targetplayer;
        }
    }
    if (!var_99bcf6bdf31a0e49) {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("assim_request_you_join_me", [0:player]);
    }
    if (var_3d290d914e1249a0.size > 0) {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("assim_request_nearby", var_3d290d914e1249a0);
        function_f3bb4f4911a1beb2("pmc_missions", "onRequestTeamAssimilate", player, var_3d290d914e1249a0);
    }
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170a
// Size: 0x19a
function resolveAssimRequest(player, var_e3f7965361b1e757) {
    /#
        assert(isdefined(player.var_7f1423df13bbb144));
    #/
    var_3b96d5666000c2e0 = ter_op(istrue(player.var_4f8afa3693e318d4), player.var_7f1423df13bbb144, player);
    var_784c8ada1184ff89 = ter_op(istrue(player.var_4f8afa3693e318d4), player, player.var_7f1423df13bbb144);
    if (!canAssimilate(var_3b96d5666000c2e0, var_784c8ada1184ff89, player, 0)) {
        player setclientomnvar("ui_assimilation_clientnum", -1);
        return;
    }
    if (var_e3f7965361b1e757) {
        assimilatePlayer(var_3b96d5666000c2e0, var_784c8ada1184ff89, 0);
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            namespace_d20f8ef223912e12::updateplayerandteamcountui();
        }
    } else if (player.var_4f8afa3693e318d4) {
        [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_team_assimilation_request_denied_join_on_target", [0:player.var_7f1423df13bbb144], undefined, undefined, undefined, level.var_42b1e877ab187c6);
        [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_team_assimilation_request_you_denied_join_on_target", [0:player], undefined, undefined, undefined, level.var_42b1e877ab187c6);
    } else {
        [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_team_assimilation_request_denied", [0:player.var_7f1423df13bbb144], undefined, player getentitynumber(), undefined, level.var_42b1e877ab187c6);
        [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_team_assimilation_request_you_denied", [0:player], undefined, undefined, undefined, level.var_42b1e877ab187c6);
    }
    function_a84bf6c8ff064511(player);
    player notify("assimilation_resolved");
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ab
// Size: 0x103
function function_9ad90f0a744225a8(team) {
    teammembers = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    foreach (teammember in teammembers) {
        if (isdefined(teammember)) {
            teammember notify("refresh_revives");
            if (isdefined(level.br_plunder)) {
                plundercount = teammember.plundercount;
                data = namespace_c6ccccd95254983f::createplayerplundereventdata();
                data.setplunderifunchanged = 1;
                teammember namespace_c6ccccd95254983f::playersetplundercount(plundercount, data);
            } else {
                var_e28612e69968bb98 = namespace_e8a49b70d0769b66::_getplayerscore(teammember);
                teammember namespace_14f37777effc564d::function_52bea99a5c38fbe5(var_e28612e69968bb98, 1);
            }
        }
        teammember thread namespace_f8d3520d3483c1::function_cf547d762189deaa();
    }
    if (teammembers.size > 0) {
        teammembers[0] namespace_80cec6cfc70c4f95::updateplayereliminatedomnvar("assimilation");
    }
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b5
// Size: 0x517
function assimilatePlayer(var_3b96d5666000c2e0, var_784c8ada1184ff89, var_b215274f1a3eb134) {
    oldteam = var_3b96d5666000c2e0.team;
    newteam = var_784c8ada1184ff89.team;
    var_e91a6371e99e1350 = var_3b96d5666000c2e0.var_ff97225579de16a;
    var_43b043539f9c3ccf = var_784c8ada1184ff89.var_ff97225579de16a;
    var_67d0631ad9027f83 = !istrue(var_b215274f1a3eb134);
    var_7db64c868eef61a7 = isdefined(level.squaddata);
    var_bd0b3fa85d4e5899 = [];
    var_238f49a5d09ad7b6 = ter_op(var_7db64c868eef61a7, level.squaddata[oldteam][var_e91a6371e99e1350].players, namespace_54d20dd0dd79277f::getteamdata(oldteam, "players"));
    foreach (teammember in var_238f49a5d09ad7b6) {
        if (isdefined(teammember) && var_3b96d5666000c2e0 != teammember) {
            var_bd0b3fa85d4e5899[var_bd0b3fa85d4e5899.size] = teammember;
        }
    }
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("assim_request_response_leaving_team", var_bd0b3fa85d4e5899);
    if (issharedfuncdefined("hud", "showBrDMZSplash")) {
        if (var_67d0631ad9027f83) {
            [[ getsharedfunc("hud", "showBrDMZSplash") ]]("player_team_switched", [0:var_3b96d5666000c2e0], undefined, undefined, undefined, level.var_42b1e877ab187c6);
        }
        players = ter_op(var_7db64c868eef61a7, level.squaddata[newteam][var_43b043539f9c3ccf].players, namespace_54d20dd0dd79277f::getteamdata(newteam, "players"));
        [[ getsharedfunc("hud", "showBrDMZSplash") ]]("player_joined_team", players, undefined, var_3b96d5666000c2e0 getentitynumber(), undefined, level.var_42b1e877ab187c6);
        players = ter_op(var_7db64c868eef61a7, level.squaddata[oldteam][var_e91a6371e99e1350].players, namespace_54d20dd0dd79277f::getteamdata(oldteam, "players"));
        if (isdefined(players)) {
            players = array_remove(players, var_3b96d5666000c2e0);
            [[ getsharedfunc("hud", "showBrDMZSplash") ]]("player_left_team", players, undefined, var_3b96d5666000c2e0 getentitynumber(), undefined, level.var_42b1e877ab187c6);
        }
    }
    if (newteam != oldteam) {
        var_3b96d5666000c2e0 thread namespace_e5ed2f5a5ee8410e::addtoteam(newteam, undefined, var_67d0631ad9027f83, 1);
    }
    if (squad_utility::issquadmode()) {
        var_607da387f3617ed1 = var_3b96d5666000c2e0 squad_utility::getSquadMembers();
        namespace_ede58c1e66c2c280::function_47990577bda08bb4(var_3b96d5666000c2e0, var_607da387f3617ed1);
        function_810613fb0e83165e(newteam, var_43b043539f9c3ccf, var_3b96d5666000c2e0);
        var_3b96d5666000c2e0 thread namespace_9bb409deb69fb31d::function_8a9305612b73a15(newteam, oldteam, var_43b043539f9c3ccf);
    } else {
        function_8902607e87bb6d89(newteam, var_3b96d5666000c2e0);
        var_3b96d5666000c2e0 thread namespace_9bb409deb69fb31d::setsquad(newteam, var_43b043539f9c3ccf);
    }
    var_3b96d5666000c2e0 thread function_e5dbb2b054d0cabd(var_3b96d5666000c2e0, oldteam);
    var_3b96d5666000c2e0 namespace_ede58c1e66c2c280::calloutmarkerping_removeallcalloutsforplayer();
    function_9ad90f0a744225a8(newteam);
    function_9ad90f0a744225a8(oldteam);
    var_d6506419c4113c0f = ter_op(var_7db64c868eef61a7, level.squaddata[newteam][var_43b043539f9c3ccf].players, namespace_54d20dd0dd79277f::getteamdata(newteam, "players"));
    foreach (teammember in var_d6506419c4113c0f) {
        if (isdefined(teammember)) {
            teammember notify("refresh_revives");
            if (isdefined(level.br_plunder)) {
                plundercount = teammember.plundercount;
                data = namespace_c6ccccd95254983f::createplayerplundereventdata();
                data.setplunderifunchanged = 1;
                teammember namespace_c6ccccd95254983f::playersetplundercount(plundercount, data);
            } else {
                var_e28612e69968bb98 = namespace_e8a49b70d0769b66::_getplayerscore(teammember);
                teammember namespace_14f37777effc564d::function_52bea99a5c38fbe5(var_e28612e69968bb98, 1);
            }
        }
        teammember thread namespace_f8d3520d3483c1::function_cf547d762189deaa();
    }
    if (var_7db64c868eef61a7 && !isdefined(level.squaddata[oldteam][var_e91a6371e99e1350])) {
        function_80139212a4c66a94(var_3b96d5666000c2e0, oldteam, newteam, var_e91a6371e99e1350, var_43b043539f9c3ccf);
        return;
    }
    var_238f49a5d09ad7b6 = ter_op(var_7db64c868eef61a7, level.squaddata[oldteam][var_e91a6371e99e1350].players, namespace_54d20dd0dd79277f::getteamdata(oldteam, "players"));
    foreach (teammember in var_238f49a5d09ad7b6) {
        if (isdefined(teammember)) {
            teammember notify("refresh_revives");
            if (isdefined(level.br_plunder)) {
                plundercount = teammember.plundercount;
                data = namespace_c6ccccd95254983f::createplayerplundereventdata();
                data.setplunderifunchanged = 1;
                teammember namespace_c6ccccd95254983f::playersetplundercount(plundercount, data);
            } else {
                var_e28612e69968bb98 = namespace_e8a49b70d0769b66::_getplayerscore(teammember);
                teammember namespace_14f37777effc564d::function_52bea99a5c38fbe5(var_e28612e69968bb98, 1);
            }
        }
    }
    function_80139212a4c66a94(var_3b96d5666000c2e0, oldteam, newteam, var_e91a6371e99e1350, var_43b043539f9c3ccf);
    var_3b96d5666000c2e0 function_6401ee62bfbff899(oldteam, newteam);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ed3
// Size: 0x269
function sendDirectAssimRequest(var_e65d25126ef3331b, targetplayer, var_99bcf6bdf31a0e49, var_e4fc35b9446269cf) {
    if (targetplayer == var_e65d25126ef3331b || targetplayer.team == var_e65d25126ef3331b.team && !(squad_utility::issquadmode() && !squad_utility::function_9b1d18c04d310cfc(var_e65d25126ef3331b, targetplayer)) || !isplayer(targetplayer) || isPlayersAssimDisabled(targetplayer)) {
        return 0;
    }
    var_1672c24528714d7d = ter_op(var_99bcf6bdf31a0e49, targetplayer.team, var_e65d25126ef3331b.team);
    var_3b96d5666000c2e0 = ter_op(var_99bcf6bdf31a0e49, var_e65d25126ef3331b, targetplayer);
    var_784c8ada1184ff89 = ter_op(var_99bcf6bdf31a0e49, targetplayer, var_e65d25126ef3331b);
    if (!function_4aaeca4295a600d(var_784c8ada1184ff89, var_3b96d5666000c2e0, var_784c8ada1184ff89, 1)) {
        return 0;
    }
    if (var_e4fc35b9446269cf) {
        toenemy = vectornormalize(targetplayer.origin - self.origin);
        dotproduct = vectordot(anglestoforward(self.angles), toenemy);
        if (dotproduct < 0) {
            return 0;
        }
    }
    targetplayer setclientomnvar("ui_assimilation_clientnum", var_e65d25126ef3331b getentitynumber());
    targetplayer setclientomnvar("ui_assimilation_join_on_target", var_99bcf6bdf31a0e49);
    targetplayer.var_7f1423df13bbb144 = var_e65d25126ef3331b;
    targetplayer thread function_b530aa511cac761(targetplayer);
    if (issharedfuncdefined("hud", "showBrDMZSplash")) {
        var_c2d8959d0ccc0adb = function_82aca4b8517cf46a();
        if (!isdefined(targetplayer.var_312490cd130c9914) || targetplayer.var_312490cd130c9914 + var_c2d8959d0ccc0adb > gettime() || targetplayer.var_4f8afa3693e318d4 != var_99bcf6bdf31a0e49) {
            if (var_99bcf6bdf31a0e49) {
                [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_team_assimilation_requested_join_on_target", [0:targetplayer], undefined, var_e65d25126ef3331b getentitynumber(), undefined, level.var_42b1e877ab187c6);
            } else {
                [[ getsharedfunc("hud", "showBrDMZSplash") ]]("dmz_team_assimilation_requested", [0:targetplayer], undefined, var_e65d25126ef3331b getentitynumber(), undefined, level.var_42b1e877ab187c6);
            }
            targetplayer.var_312490cd130c9914 = gettime();
        }
    }
    targetplayer.var_4f8afa3693e318d4 = var_99bcf6bdf31a0e49;
    if (shouldAutoAcceptTeamSwitch()) {
        resolveAssimRequest(targetplayer, 1);
    }
    return 1;
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2144
// Size: 0x159
function function_6401ee62bfbff899(oldteam, newteam) {
    player = self;
    if (!isdefined(player)) {
        return;
    }
    eventparams = [];
    eventparams[eventparams.size] = "player_xuid";
    eventparams[eventparams.size] = player getxuid();
    eventparams[eventparams.size] = "player_entity_num";
    eventparams[eventparams.size] = player getentitynumber();
    eventparams[eventparams.size] = "old_team";
    eventparams[eventparams.size] = oldteam;
    eventparams[eventparams.size] = "old_team_alive_teammates";
    if (isdefined(level.teamdata[oldteam]["alivePlayers"])) {
        eventparams[eventparams.size] = level.teamdata[oldteam]["alivePlayers"].size;
    } else {
        eventparams[eventparams.size] = -1;
    }
    eventparams[eventparams.size] = "new_team";
    eventparams[eventparams.size] = newteam;
    eventparams[eventparams.size] = "new_team_alive_teammates";
    if (isdefined(level.teamdata[newteam]["alivePlayers"])) {
        eventparams[eventparams.size] = level.teamdata[newteam]["alivePlayers"].size;
    } else {
        eventparams[eventparams.size] = -1;
    }
    eventparams[eventparams.size] = "last_assimilation_request_time";
    if (isdefined(player.var_312490cd130c9914)) {
        eventparams[eventparams.size] = player.var_312490cd130c9914;
    } else {
        eventparams[eventparams.size] = -1;
    }
    eventparams[eventparams.size] = "game_time";
    eventparams[eventparams.size] = int(gettime() / 1000);
    player dlog_recordplayerevent("dlog_event_team_assimilation", eventparams);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a4
// Size: 0x7a
function function_810613fb0e83165e(team, squadindex, player) {
    if (!isdefined(level.squaddata)) {
        return;
    }
    if (!isdefined(level.squaddata[team][squadindex].properties["lastAssimedPlayer"])) {
        level.squaddata[team][squadindex].properties["lastAssimedPlayer"] = player;
        return;
    }
    namespace_9bb409deb69fb31d::function_a20a10ce593f692b(team, squadindex, "lastAssimedPlayer", player);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2325
// Size: 0x57
function function_8902607e87bb6d89(team, player) {
    if (!isdefined(level.teamdata)) {
        return;
    }
    if (!isdefined(level.teamdata[team]["lastAssimedPlayer"])) {
        level.teamdata[team]["lastAssimedPlayer"] = undefined;
        return;
    }
    namespace_54d20dd0dd79277f::setteamdata(team, "lastAssimedPlayer", player);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2383
// Size: 0x15
function function_2a1e4811621fdcde(player) {
    thread function_351ea84f3d394eea(player);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x239f
// Size: 0x36
function private function_351ea84f3d394eea(player) {
    level endon("game_ended");
    player endon("disconnect");
    waitframe();
    var_607da387f3617ed1 = player squad_utility::getSquadMembers();
    namespace_ede58c1e66c2c280::function_3d92221d673d555c(player, var_607da387f3617ed1);
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23dc
// Size: 0x76
function function_ec7c2b6761cd9ab3() {
    /#
        thread function_10cf654ff5fef6eb();
        waitframe();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("game_ended");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("player_joined_team", @"hash_f7804c5dfa9407ca");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_b954d42a85390b5b");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_5eedf824f533d2e6");
        namespace_b032b0cc17b10064::function_b2159fbbd7ac094e("<unknown string>", @"hash_8b77db100df49d5e");
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2459
// Size: 0x3f9
function private function_10cf654ff5fef6eb() {
    /#
        level endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_f7804c5dfa9407ca", 0)) {
                setdvar(@"hash_f7804c5dfa9407ca", 0);
                var_43b043539f9c3ccf = 0;
                foreach (player in level.players) {
                    player thread namespace_9bb409deb69fb31d::function_8a9305612b73a15(player.team, player.team, var_43b043539f9c3ccf);
                    var_43b043539f9c3ccf++;
                }
            }
            if (getdvarint(@"hash_b954d42a85390b5b", 0)) {
                setdvar(@"hash_b954d42a85390b5b", 0);
                playerteam = "<unknown string>";
                var_96674628376eaba6 = 0;
                var_3f4cc5498664136f = undefined;
                foreach (player in level.players) {
                    if (isplayer(player)) {
                        playerteam = player.team;
                        var_96674628376eaba6 = player.var_ff97225579de16a;
                        var_3f4cc5498664136f = player;
                        break;
                    }
                }
                foreach (bot in level.players) {
                    if (bot != var_3f4cc5498664136f && bot.var_ff97225579de16a != var_96674628376eaba6) {
                        if (!function_4aaeca4295a600d(var_3f4cc5498664136f, bot, var_3f4cc5498664136f, 1)) {
                            continue;
                        }
                        assimilatePlayer(bot, var_3f4cc5498664136f, 0);
                        break;
                    }
                }
            }
            if (getdvarint(@"hash_5eedf824f533d2e6", 0)) {
                setdvar(@"hash_5eedf824f533d2e6", 0);
                var_96674628376eaba6 = 0;
                var_3f4cc5498664136f = undefined;
                foreach (player in level.players) {
                    if (isplayer(player)) {
                        var_96674628376eaba6 = player.var_ff97225579de16a;
                        var_3f4cc5498664136f = player;
                        break;
                    }
                }
                foreach (bot in level.players) {
                    if (bot != var_3f4cc5498664136f && bot.var_ff97225579de16a != var_96674628376eaba6) {
                        function_5a35520fca6b5b34(bot, var_3f4cc5498664136f);
                        break;
                    }
                }
            }
            if (getdvarint(@"hash_8b77db100df49d5e", 0)) {
                setdvar(@"hash_8b77db100df49d5e", 0);
                playerteam = "<unknown string>";
                var_96674628376eaba6 = 0;
                var_3f4cc5498664136f = undefined;
                foreach (player in level.players) {
                    if (isplayer(player)) {
                        playerteam = player.team;
                        var_96674628376eaba6 = player.var_ff97225579de16a;
                        var_3f4cc5498664136f = player;
                        break;
                    }
                }
                foreach (bot in level.players) {
                    if (bot != var_3f4cc5498664136f && bot.var_ff97225579de16a == var_96674628376eaba6) {
                        bot requestLeaveTeam(bot);
                        break;
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_6bf5a85a2b78b77a/namespace_76a219af07c28c13
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2859
// Size: 0x145
function private function_5a35520fca6b5b34(bot, player) {
    /#
        if (!function_4aaeca4295a600d(bot, player, player, 1)) {
            return;
        }
        player setclientomnvar("<unknown string>", bot getentitynumber());
        player setclientomnvar("<unknown string>", 0);
        player.var_7f1423df13bbb144 = bot;
        player thread function_b530aa511cac761(player);
        if (issharedfuncdefined("<unknown string>", "<unknown string>")) {
            var_c2d8959d0ccc0adb = function_82aca4b8517cf46a();
            if (!isdefined(player.var_312490cd130c9914) || player.var_312490cd130c9914 + var_c2d8959d0ccc0adb > gettime() || player.var_4f8afa3693e318d4 != 0) {
                [[ getsharedfunc("<unknown string>", "<unknown string>") ]]("<unknown string>", [0:player], undefined, bot getentitynumber());
                player.var_312490cd130c9914 = gettime();
            }
        }
        player.var_4f8afa3693e318d4 = 0;
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", [0:bot]);
        var_3d290d914e1249a0 = [0:player];
        if (var_3d290d914e1249a0.size > 0) {
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", var_3d290d914e1249a0);
            function_f3bb4f4911a1beb2("<unknown string>", "<unknown string>", bot, var_3d290d914e1249a0);
        }
    #/
}

