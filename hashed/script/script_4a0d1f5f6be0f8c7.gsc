// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_3b64eb40368c1450;
#using script_59ff79d681bb860c;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_4a0d1f5f6be0f8c7;
#using script_40e63dd222434655;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_26ccbfe3954cacf4;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;

#namespace namespace_11d8f65c2828dad8;

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ca
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_bd131dfa920d03b9::init;
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e9
// Size: 0x1f6
function init() {
    namespace_bc2665cbe6cf4e1f::function_5865e18adb02de38();
    level.var_2c93542553c664f5 = 0;
    level.var_472d7a6d15e57940 = 0;
    level.var_1d814f83596d0a02 = 0;
    level.var_c1d58bf29dcae79 = 1;
    level.minplunderdropondeath = getdvarint(@"hash_e0a487b88d0e4410", 1);
    level.var_cc9e990b6e83975b = getdvarint(@"hash_c39067c564e9be9", 1);
    var_3408b3be04ff0639 = getdvarint(@"hash_4c8e33496c92cd2e", 0);
    if (var_3408b3be04ff0639 == 1) {
        namespace_71073fa38f11492::disablefeature("drogBagLoadout");
    }
    namespace_71073fa38f11492::registerbrgametypefunc("modifyPlayerDamage", &namespace_bc2665cbe6cf4e1f::function_92a85a0dda6ca085);
    namespace_71073fa38f11492::registerbrgametypefunc("getBestSpectateCandidate", &getbestspectatecandidate);
    namespace_71073fa38f11492::registerbrgametypefunc("isValidSpectateTarget", &isvalidspectatetarget);
    namespace_71073fa38f11492::registerbrgametypefunc("onMarkPlayerAsEliminated", &onMarkPlayerAsEliminated);
    namespace_71073fa38f11492::registerbrgametypefunc("onUnmarkPlayerAsEliminated", &onUnmarkPlayerAsEliminated);
    namespace_71073fa38f11492::registerbrgametypefunc("getDefaultLoadout", &getDefaultLoadout);
    namespace_71073fa38f11492::registerbrgametypefunc("kioskRevivePlayer", &function_b8ce7e76dc2dc587);
    namespace_71073fa38f11492::registerbrgametypefunc("playerWelcomeSplashes", &playerwelcomesplashes);
    namespace_71073fa38f11492::registerbrgametypefunc("GetRandomLoadout", &GetRandomLoadout);
    level.var_bdd92c05d3032f65 = &function_bdd92c05d3032f65;
    level.var_cb87db3f189cf3f1 = &function_3363de115c63751d;
    level.quest_domdistmin = getdvarint(@"hash_a733bbfd9d9909fe", 500);
    level.quest_domdistmax = getdvarint(@"hash_a710cdfd9d72e9dc", 7000);
    level.quest_assdistmin = getdvarint(@"hash_4512e59f0eae9", 500);
    level.quest_assdistmax = getdvarint(@"hash_ffe1432e59ca8467", 7000);
    level.quest_scavdistmin = getdvarint(@"hash_a607164e2c76e4f1", 500);
    level.quest_scavdistmax = getdvarint(@"hash_a62a284e2c9d543f", 7000);
    level.shownonspectatingwinnersplash = 1;
    thread function_ced5973479a0e03b();
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e6
// Size: 0xf4
function function_ced5973479a0e03b() {
    level endon("game_ended");
    while (!isdefined(level.teamnamelist)) {
        waitframe();
    }
    while (1) {
        foreach (team in level.teamnamelist) {
            var_a059cab9dfe3d005 = level.teamdata[team]["plunderTeamTotal"];
            players = namespace_54d20dd0dd79277f::getfriendlyplayers(team, 0);
            foreach (player in players) {
                player setclientomnvar("ui_br_team_cash_pockets", var_a059cab9dfe3d005);
            }
        }
        waitframe();
    }
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e1
// Size: 0x1b
function getDefaultLoadout() {
    var_dab2d2efde751b62 = "classtable:classtable_br_vanilla";
    return namespace_d20f8ef223912e12::initstandardloadout(var_dab2d2efde751b62, 0);
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x904
// Size: 0x6c
function function_bdd92c05d3032f65() {
    if (istrue(level.skipprematch)) {
        return undefined;
    }
    if (namespace_d576b6dc7cef9c62::function_1147bbc93ea9b83c() && isdefined(level.var_c360d548f96125f2) && level.var_c360d548f96125f2.size > 0) {
        var_360efb157ec1aa68 = level.var_c360d548f96125f2[randomint(level.var_c360d548f96125f2.size)];
        return vectortoangles(var_360efb157ec1aa68 - self geteye());
    }
    return undefined;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x1bd
function function_7e904ff184e6794c(var_9f4a3632d9f75d32, var_d4884966c59032e3, var_46ed5dc5c4434238, spawnangle, var_5623feabb8673fa2) {
    var_60b36839d21113f = namespace_d3d40f75bb4e4c32::isBrPracticeMode();
    /#
        assert(!var_60b36839d21113f);
    #/
    var_580c0ab2f1d761be = getdvarint(@"hash_25ad2925d6075c8f", 0);
    if (var_580c0ab2f1d761be != 0) {
        level.skipprematch = 1;
        if (var_580c0ab2f1d761be == 2) {
            level.skipprematchdropspawn = 1;
            level.br_infils_disabled = 1;
            level thread function_f6e343c0b9912601();
            /#
                assert(isdefined(var_46ed5dc5c4434238));
            #/
            spawnangle = function_53c4c53197386572(spawnangle, (0, 60, 0));
            spawns = [];
            spawns[spawns.size] = namespace_b2d5aa2baf2b5701::createscriptedspawnpoint("mp_dm_spawn_start", var_46ed5dc5c4434238, spawnangle);
            namespace_b2d5aa2baf2b5701::addscriptedspawnpoints(spawns);
        }
    } else {
        var_d9d6c656a9fd19ac = 150;
        var_54401a32bf2a02b = namespace_d20f8ef223912e12::function_cb40f77c51717ea1();
        var_32c7d201a42335ff = var_d9d6c656a9fd19ac / var_54401a32bf2a02b;
        var_78de90a02fd7622b = namespace_95d8d8ec67e3e074::function_d6d3f0e8a701880f();
        level.var_2f78f22edf92faa9 = ceil(var_78de90a02fd7622b / var_32c7d201a42335ff);
    }
    level.br_level.var_61321b51908d55cb = "classtable:classtable_br_bot_loadouts_phase1";
    level.br_level.var_61321c51908d57fe = "classtable:classtable_br_bot_loadouts_phase2";
    level.br_standard_loadout = getDefaultLoadout();
    level.var_5623feabb8673fa2 = var_5623feabb8673fa2;
    function_900efe56e44a6c12();
    namespace_95d8d8ec67e3e074::initialize(var_9f4a3632d9f75d32);
    if (isdefined(var_d4884966c59032e3) && var_d4884966c59032e3 > 0) {
        setdvar(@"hash_749412e5db698400", var_d4884966c59032e3);
    }
    level thread namespace_bc2665cbe6cf4e1f::function_c38398385afc10fc();
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3c
// Size: 0x61
function function_f6e343c0b9912601() {
    player = level waittill("player_spawned");
    player setclientomnvar("ui_br_infiled", 1);
    level waittill("infils_ready");
    level.br_c130spawndone = 1;
    player namespace_3bcd40a3005712ec::br_ammo_player_clear();
    player namespace_3bcd40a3005712ec::br_give_starting_ammo();
    namespace_3bcd40a3005712ec::br_ammo_update_weapons(player);
    player skydive_setdeploymentstatus(1);
    player skydive_setbasejumpingstatus(1);
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba4
// Size: 0x285
function function_900efe56e44a6c12() {
    var_3e0899315f010884 = getstructarray("br_bot_landing_group", "script_noteworthy");
    var_3a1b0d8a5d8da62a = 0;
    if (var_3e0899315f010884.size == 0 && isdefined(level.var_301d639da97100c9) && level.var_301d639da97100c9.size > 0) {
        var_3e0899315f010884 = level.var_301d639da97100c9;
        var_3a1b0d8a5d8da62a = 1;
    }
    /#
        assertex(var_3e0899315f010884.size > 0, "No br_bot_landing_group in the map!");
    #/
    zones = [];
    level.var_c360d548f96125f2 = [];
    foreach (var_57c76a7b5032791f in var_3e0899315f010884) {
        zone = spawnstruct();
        zone.name = var_57c76a7b5032791f.target;
        zone.var_26910ae9f2257df0 = var_57c76a7b5032791f.origin;
        zone.weight = int(var_57c76a7b5032791f.script_parameters);
        if (zone.weight <= 0) {
            /#
                assertmsg("Invalid zone weight of zone " + zone.name + "! will reset it to 1");
            #/
            zone.weight = 1;
        }
        zone.var_301d639da97100c9 = [];
        zones[zones.size] = zone;
        var_301d639da97100c9 = [];
        if (!var_3a1b0d8a5d8da62a) {
            var_301d639da97100c9 = var_57c76a7b5032791f get_target_array();
        }
        var_301d639da97100c9[var_301d639da97100c9.size] = var_57c76a7b5032791f;
        foreach (var_f3fcf5af579acd60 in var_301d639da97100c9) {
            struct = spawnstruct();
            struct.origin = getclosestpointonnavmesh(var_f3fcf5af579acd60.origin);
            zone.var_301d639da97100c9[zone.var_301d639da97100c9.size] = struct;
            var_49e421b4bf8cf977 = 0;
            if (var_49e421b4bf8cf977) {
                level.var_c360d548f96125f2[level.var_c360d548f96125f2.size] = var_f3fcf5af579acd60.origin;
            }
        }
    }
    level.var_dbcb33d81f7d48d = spawnstruct();
    level.var_dbcb33d81f7d48d.zones = zones;
    level thread function_b0d6c85d2f044e95();
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe30
// Size: 0x36
function function_b0d6c85d2f044e95() {
    function_514703d9665f6f93();
    if (istrue(level.br_infils_disabled)) {
        return;
    }
    level waittill("br_c130_in_bounds");
    function_74149d8336258367();
    level waittill("br_c130_left_bounds");
    function_514703d9665f6f93();
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6d
// Size: 0x8a
function function_514703d9665f6f93() {
    zones = level.var_dbcb33d81f7d48d.zones;
    var_be66de030b25508c = 0;
    for (index = 0; index < zones.size; index++) {
        zone = zones[index];
        if (isdefined(zone)) {
            var_be66de030b25508c = var_be66de030b25508c + zone.weight;
            zone.var_68e87685aa19da24 = var_be66de030b25508c;
        }
    }
    level.var_dbcb33d81f7d48d.var_f51f037fb790e57c = var_be66de030b25508c;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefe
// Size: 0x183
function function_74149d8336258367() {
    var_da9d0b7a05252ce1 = 100;
    zones = level.var_dbcb33d81f7d48d.zones;
    var_f51f037fb790e57c = 0;
    startpoint = level.infilstruct.c130pathstruct.startpt;
    endpoint = level.infilstruct.c130pathstruct.endpt;
    maxdistance = level.var_5623feabb8673fa2;
    if (isdefined(maxdistance)) {
        maxdistancesq = 1 * maxdistance * maxdistance;
    } else {
        maxdistancesq = undefined;
    }
    for (index = 0; index < zones.size; index++) {
        zone = zones[index];
        weight = zone.weight;
        if (isdefined(maxdistancesq)) {
            var_1fdb895a11ef0c58 = vectorfromlinetopoint(startpoint, endpoint, zone.var_26910ae9f2257df0);
            distancesq = length2dsquared(var_1fdb895a11ef0c58);
            if (distancesq <= maxdistancesq) {
                weight = weight * var_da9d0b7a05252ce1;
            }
        }
        if (namespace_c5622898120e827f::function_c11714256f856e10(zone.var_26910ae9f2257df0)) {
            weight = weight * var_da9d0b7a05252ce1;
        }
        var_f51f037fb790e57c = var_f51f037fb790e57c + weight;
        zone.var_68e87685aa19da24 = var_f51f037fb790e57c;
    }
    level.var_dbcb33d81f7d48d.var_f51f037fb790e57c = var_f51f037fb790e57c;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1088
// Size: 0x116
function getbestspectatecandidate(victim, attacker) {
    playertospectate = undefined;
    if (isvalidspectatetarget(victim.nextplayertospectate)) {
        playertospectate = victim.nextplayertospectate;
        victim.nextplayertospectate = undefined;
        return playertospectate;
    }
    playertospectate = function_c041447b9139985b(victim);
    if (isvalidspectatetarget(playertospectate)) {
        return playertospectate;
    }
    if (isvalidspectatetarget(attacker)) {
        return attacker;
    }
    var_b0dfeeb00d0acf03 = function_b78e0439fec18199(victim);
    if (isdefined(var_b0dfeeb00d0acf03)) {
        return var_b0dfeeb00d0acf03;
    }
    var_1d17d55b8c1ec9cf = undefined;
    foreach (bot in level.players) {
        if (bot != victim && isvalidspectatetarget(bot)) {
            if (!bot namespace_95d8d8ec67e3e074::function_d012729eac1e7053()) {
                return bot;
            } else if (!isdefined(var_1d17d55b8c1ec9cf)) {
                var_1d17d55b8c1ec9cf = bot;
            }
        }
    }
    if (isdefined(var_1d17d55b8c1ec9cf)) {
        return var_1d17d55b8c1ec9cf;
    }
    return undefined;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a6
// Size: 0x49
function isvalidspectatetarget(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (player namespace_95d8d8ec67e3e074::function_6ecc7cd453466014()) {
        return 0;
    }
    if (!function_ded80385ea7471db(player)) {
        return 0;
    }
    if (istrue(player.var_7ca8ac9793bc9c22)) {
        return 0;
    }
    return !istrue(player.br_iseliminated);
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f7
// Size: 0x2e3
function function_c041447b9139985b(victim) {
    if (istrue(level.onlinegame) && isdefined(victim) && victim getprivatepartysize()) {
        var_aa90f92ce9f7f1de = victim getfireteammembers();
        var_cad1692006efd64a = undefined;
        foreach (player in var_aa90f92ce9f7f1de) {
            if (player == victim) {
                continue;
            }
            if (player isfireteamleader() && isvalidspectatetarget(player)) {
                return player;
            }
        }
        var_cad1692006efd64a = undefined;
        closestdist = undefined;
        foreach (player in var_aa90f92ce9f7f1de) {
            if (victim != player && isvalidspectatetarget(player)) {
                if (isdefined(victim.lastdeathpos)) {
                    var_12810e24e83acb1d = distance2dsquared(victim.lastdeathpos, player.origin);
                    if (!isdefined(closestdist) || var_12810e24e83acb1d < closestdist) {
                        var_cad1692006efd64a = player;
                        closestdist = var_12810e24e83acb1d;
                    }
                } else {
                    return player;
                }
            }
        }
        if (isdefined(var_cad1692006efd64a)) {
            return var_cad1692006efd64a;
        }
    }
    var_8be8967782f3e0e3 = undefined;
    if (isdefined(victim.team)) {
        teammates = namespace_54d20dd0dd79277f::getfriendlyplayers(victim.team, 1);
        if (isdefined(victim.lastdeathpos)) {
            var_e9dc9ecbe66722fe = undefined;
            var_2854e504ec9ed2bd = undefined;
            closestdist = undefined;
            foreach (player in teammates) {
                var_12810e24e83acb1d = distance2dsquared(victim.lastdeathpos, player.origin);
                if (function_78e25eb20dbfe396(player)) {
                    if (!isdefined(var_2854e504ec9ed2bd) || var_12810e24e83acb1d < var_2854e504ec9ed2bd) {
                        var_e9dc9ecbe66722fe = player;
                        var_2854e504ec9ed2bd = var_12810e24e83acb1d;
                    }
                } else if (!isdefined(var_e9dc9ecbe66722fe) && isvalidspectatetarget(player)) {
                    if (!isdefined(closestdist) || var_12810e24e83acb1d < closestdist) {
                        var_8be8967782f3e0e3 = player;
                        closestdist = var_12810e24e83acb1d;
                    }
                }
            }
            if (isdefined(var_e9dc9ecbe66722fe)) {
                return var_e9dc9ecbe66722fe;
            }
        } else {
            foreach (player in teammates) {
                if (function_78e25eb20dbfe396(player)) {
                    return player;
                } else if (isvalidspectatetarget(player)) {
                    var_8be8967782f3e0e3 = player;
                }
            }
        }
    }
    return var_8be8967782f3e0e3;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e2
// Size: 0xad
function function_b78e0439fec18199(victim) {
    playertospectate = undefined;
    var_45c781aa56fc57ec = level.players.size;
    foreach (player in level.players) {
        if (player != victim && function_78e25eb20dbfe396(player)) {
            var_721982228624d657 = namespace_a9c534dc7832aba4::getspectatorsofplayer(player);
            if (var_721982228624d657.size < var_45c781aa56fc57ec) {
                var_45c781aa56fc57ec = var_721982228624d657.size;
                playertospectate = player;
            }
        }
    }
    return playertospectate;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1597
// Size: 0x37
function function_78e25eb20dbfe396(player) {
    if (!isdefined(player) || isai(player)) {
        return 0;
    }
    if (!function_ded80385ea7471db(player)) {
        return 0;
    }
    return !istrue(player.br_iseliminated);
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d6
// Size: 0x259
function function_6f2a3c608d954d4(immediate) {
    var_156f390a5362bc55 = namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
    teammembers = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
    if (!istrue(immediate)) {
        foreach (member in teammembers) {
            if (!member namespace_bc2665cbe6cf4e1f::function_a9cbf557dc66d201() && member != self) {
                return;
            }
        }
        foreach (uibot in var_156f390a5362bc55) {
            if (uibot.team == self.team) {
                return;
            }
        }
    }
    totalplayers = level.players.size;
    var_a4c3a5afe5b8da9b = [];
    for (i = 0; i < totalplayers; i++) {
        player = level.players[i];
        if (!player namespace_bc2665cbe6cf4e1f::function_a9cbf557dc66d201() && player.team != self.team) {
            var_a4c3a5afe5b8da9b[player.team] = 1;
        }
    }
    foreach (uibot in var_156f390a5362bc55) {
        if (uibot.team != self.team) {
            var_a4c3a5afe5b8da9b[uibot.team] = 1;
        }
    }
    place = var_a4c3a5afe5b8da9b.size + 1;
    foreach (member in teammembers) {
        member.pers["br_place"] = place;
    }
    self.pers["br_place"] = place;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1836
// Size: 0x35
function function_305f60799dc60d7c(player) {
    player function_6f2a3c608d954d4();
    player.pers["br_survival_time"] = gettime() - level.starttime;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1872
// Size: 0x14
function onMarkPlayerAsEliminated(player) {
    function_305f60799dc60d7c(player);
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188d
// Size: 0x32
function onUnmarkPlayerAsEliminated(player) {
    player.pers["br_place"] = 0;
    player.pers["br_survival_time"] = 0;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c6
// Size: 0x7a
function GetRandomLoadout() {
    var_b84a7e9373dcbe39 = 10;
    newclass = randomint(var_b84a7e9373dcbe39);
    if (getomnvar("ui_only_default_loadouts") == 1) {
        var_d7d1c6c477af4621 = 100;
        newclass = newclass + var_d7d1c6c477af4621;
    }
    var_2d36749fdffc49b4 = namespace_e5ed2f5a5ee8410e::getclasschoice(newclass);
    self.pers["class"] = var_2d36749fdffc49b4;
    self.class = var_2d36749fdffc49b4;
    namespace_d19129e4fa5d176::preloadandqueueclass(var_2d36749fdffc49b4);
    return 1;
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1948
// Size: 0x2a
function function_b8ce7e76dc2dc587(player, var_4dfc1f5d7602b10d) {
    namespace_47fd1e79a44628cd::playergulagautowin("vanillaKioskRevive", player, var_4dfc1f5d7602b10d);
    namespace_c6ccccd95254983f::playersetplundercount(0);
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1979
// Size: 0x5a
function function_3363de115c63751d(var_a37e3649cfb19f73, var_ac0f8be89fa21057) {
    var_2a05c2d2d4716320 = getdvarint(@"hash_2d936fb12b19ca30", 0);
    if (var_2a05c2d2d4716320) {
        counttime = clamp(var_a37e3649cfb19f73 - var_ac0f8be89fa21057, 0, 65535);
        setomnvar("ui_match_start_countdown_not_reach_minplayer", int(counttime));
    }
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19da
// Size: 0xf5
function playerwelcomesplashes(data) {
    self endon("disconnect");
    self waittill("spawned_player");
    wait(1);
    gametype = namespace_cd0b2d039510b38d::getsubgametype();
    if (gametype == "mini_mgl") {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_mini_prematch_welcome");
    } else if (gametype == "resurgence_mgl") {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_resurgence_prematch_welcome");
    } else if (gametype == "champion") {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_champion_prematch_welcome");
    } else if (!istrue(game["liveLobbyCompleted"])) {
        namespace_44abc05161e2e2cb::showsplash("br_prematch_welcome");
    }
    if (!istrue(level.br_infils_disabled)) {
        thread function_79d674479a5744bb();
        self waittill("br_jump");
        while (!self isonground()) {
            waitframe();
        }
    } else {
        level waittill("prematch_done");
    }
    namespace_a011fbf6d93f25e5::branalytics_landing(self);
    wait(1);
    if (gametype == "mini_mgl") {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_mini_mgl_welcome");
    }
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("primary_objective", self, 0);
}

// Namespace namespace_11d8f65c2828dad8/namespace_bd131dfa920d03b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad6
// Size: 0x73
function function_79d674479a5744bb() {
    self waittill("infil_move");
    gametype = namespace_cd0b2d039510b38d::getsubgametype();
    if (gametype == "mini_mgl") {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_mini_mgl_match_introduction");
    } else if (gametype == "resurgence_mgl") {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_resurgence_match_introduction");
    } else if (gametype == "champion") {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_champion_match_introduction");
    } else {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_vanilla_match_introduction");
    }
}

