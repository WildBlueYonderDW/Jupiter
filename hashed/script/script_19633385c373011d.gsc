// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_4a0d1f5f6be0f8c7;
#using script_303fd53078a244f1;
#using script_5bc86a57086a4774;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_a34750d17473c49;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\outofbounds.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\cp_mp\parachute.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_rewards.gsc;
#using scripts\mp\gametypes\br_skydive_protection.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\gametypes\br_killstreaks.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\utility\points.gsc;

#namespace namespace_304d296a920c310e;

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1169
// Size: 0x36
function autoexec main() {
    if (!isdefined(level.brgametype) || level.brgametype.name != "champion") {
        return;
    }
    init();
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a6
// Size: 0x8a
function init() {
    namespace_bd131dfa920d03b9::init();
    level thread function_634d911d513c3380();
    level thread initpostmain();
    level thread initdialog();
    setdvarifuninitialized(@"hash_98fad011285f3011", 0);
    setdvarifuninitialized(@"hash_e82b8618853a182c", 1500);
    level thread function_7b49b147e0d292e5();
    level thread function_90066bc128fbd493();
    namespace_a5b4009d7c2e0b3d::init();
    namespace_fedf34ab40283d70::init();
    level.brdisablefinalkillcam = 1;
    level.var_c5dc0e983c929728 = getdvarint(@"hash_58e2b234d0a26865", 0);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1237
// Size: 0x333
function function_7b49b147e0d292e5() {
    setomnvar("ui_br_resurgence_respawn_enabled", 1);
    function_97b175cec5b685be("mp/classtable_br_resurgence_mgl.csv");
    function_97b175cec5b685be("mp/classtable_br_resurgence_mgl_circle2.csv");
    function_97b175cec5b685be("mp/classtable_br_resurgence_mgl_circle3.csv");
    level.brgametype.var_6420b42c7add53cc = getdvarint(@"hash_d2891d4180de0553", 1);
    level.brgametype.var_f6682c80c3c868d6 = getmatchrulesdata("brData", "resurgenceUseVengeance");
    level.brgametype.var_fbc20f6d398b973e = getmatchrulesdata("brData", "resurgenceVengeanceUseAnyKill");
    level.brgametype.var_7b3746fd57041fb7 = getmatchrulesdata("brData", "resurgenceUseVengeanceDecreaseRespawnTimer");
    level.brgametype.var_fc3b5a2e206a85f2 = getdvarint(@"hash_9a00313371f55de1", 0);
    level.brgametype.var_3dd997e45e444b3d = getmatchrulesdata("brData", "resurgenceUsePointsToReduceRespawnTime");
    level.brgametype.var_8cb996b879748bb1 = getdvarfloat(@"hash_6772e6c744d1d962", 30);
    level.brgametype.var_59af2e5140d3fed7 = getdvarfloat(@"hash_e9b60187d57107b9", 1);
    level.respawnheightoverride = getdvarint(@"hash_ae35e4bb8a3aa9e7", 7500);
    level.brgametype.var_a916b204f027af6b = getdvarint(@"hash_a91b489383d89274", 0);
    level.brgametype.var_6f3c4d74a8c614ab = getdvarint(@"hash_38aff65bda44b82a", 1);
    level.brgametype.var_b43745b85f249e68 = 1;
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("mayConsiderPlayerDead");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("onMarkPlayerAsEliminated");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("getDefaultLoadout");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("kioskRevivePlayer");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("onPlayerKilled");
    namespace_71073fa38f11492::registerbrgametypefunc("circleTimer", &circletimer);
    namespace_71073fa38f11492::registerbrgametypefunc("mayConsiderPlayerDead", &brmayconsiderplayerdead);
    namespace_71073fa38f11492::registerbrgametypefunc("triggerRespawnOverlay", &triggerrespawnoverlay);
    namespace_71073fa38f11492::registerbrgametypefunc("playerNakedDropLoadout", &playernakeddroploadout);
    namespace_71073fa38f11492::registerbrgametypefunc("getDefaultLoadout", &getDefaultLoadout);
    namespace_71073fa38f11492::registerbrgametypefunc("kioskRevivePlayer", &kioskreviveplayer);
    namespace_71073fa38f11492::registerbrgametypefunc("dropOnPlayerDeath", &droponplayerdeath);
    namespace_71073fa38f11492::registerbrgametypefunc("onMarkPlayerAsEliminated", &onMarkPlayerAsEliminated);
    namespace_71073fa38f11492::registerbrgametypefunc("onCloseCircleCompleted", &onCloseCircleCompleted);
    namespace_71073fa38f11492::registerbrgametypefunc("onPlayerKilled", &function_735fe9ec0c4dd312);
    namespace_71073fa38f11492::registerbrgametypefunc("onDeadEvent", &ondeadevent);
    namespace_71073fa38f11492::registerbrgametypefunc("playerGetRespawnPoint", &playerGetRespawnPoint);
    waittillframeend();
    if (level.brgametype.var_3dd997e45e444b3d) {
        level.var_5dfd73c97bf5d03d = &function_5dfd73c97bf5d03d;
    }
    level.var_484f1a4bdb5cda1e = &function_a2131d000491ae2c;
    function_641eee023180065();
    thread function_49a4f952ccb3fd45();
    thread function_8369d5301de43452();
    thread function_aaacd0f0a1d84290();
    thread function_e003a419d3914c23();
    thread function_2573e08a439335f7();
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1571
// Size: 0x35
function function_90066bc128fbd493() {
    level endon("game_ended");
    level waittill("prematch_done");
    namespace_c5622898120e827f::function_4448b165e1f42719(4);
    namespace_c5622898120e827f::function_eca79fa0f341ee08(4, &namespace_a4b43c1cf86c6fe5::dangercircletick);
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&namespace_a5b4009d7c2e0b3d::function_c9a0784e88fcf18d);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ad
// Size: 0x8e
function function_9a61575de4f3d1ec() {
    if (!istrue(level.var_9db23a91b81905c3)) {
        level.canprocessot = 1;
        level.ontimelimitgraceperiod = getdvarfloat(@"hash_b1dc99c22b12bd63", 0);
        level.currenttimelimitdelay = 0;
        level.var_9db23a91b81905c3 = level.ontimelimitgraceperiod > 0;
        level.setallclientomnvarot = level.var_9db23a91b81905c3;
        level.forceotlogictorun = level.var_9db23a91b81905c3;
        namespace_52f6938dd902c7d0::showsplashtoall("br_champion_overtime_activated");
        level thread namespace_3bde6869e44a2770::function_283a36147406b42f();
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1642
// Size: 0x60
function function_634d911d513c3380() {
    if (getdvarint(@"hash_5a1dae481ef5d089", 0) == 1) {
        namespace_71073fa38f11492::enablefeature("allowLateJoiners");
    }
    namespace_71073fa38f11492::disablefeature("gulag");
    namespace_71073fa38f11492::disablefeature("randomizeCircleCenter");
    namespace_71073fa38f11492::disablefeature("planeSnapToOOB");
    namespace_71073fa38f11492::enablefeature("planeUseCircleRadius");
    namespace_71073fa38f11492::enablefeature("circleEarlyStart");
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a9
// Size: 0xb8
function initpostmain() {
    namespace_3c37cb17ade254d::registersharedfunc("champion", "packClientMatchData", &packclientmatchdata);
    namespace_71073fa38f11492::registerbrgametypefunc("createC130PathStruct", &createc130pathstruct);
    namespace_71073fa38f11492::registerbrgametypefunc("addToC130Infil", &addtoc130infil);
    level.bots_gametype_handles_class_choice = 0;
    if (getdvarint(@"hash_bb3cfa989a77b2c5", 1) == 1) {
        thread setdropbagdelay();
    }
    waittillframeend();
    level.ontimelimit = &ontimelimit;
    cleanupents();
    level.validautoassignquests = [];
    level.validautoassignquests[0] = "assassination";
    level.validautoassignquests[1] = "domination";
    level.validautoassignquests[2] = "scavenger";
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1768
// Size: 0x12c
function function_b79b55c5a0aaa08(var_939b8e8818bfd5ae, state, missionid, var_c08e41851ed100e8) {
    player = var_939b8e8818bfd5ae getentitynumber();
    if (!isdefined(state)) {
        state = 0;
    }
    if (!isdefined(player)) {
        player = 0;
    }
    if (!isdefined(missionid)) {
        missionid = 0;
    }
    var_936b577d2320099a = 4;
    var_17662f483f270d8 = var_936b577d2320099a;
    var_4110e41370f4d67c = 8;
    var_d8354a49cc36aa44 = var_17662f483f270d8 + var_4110e41370f4d67c;
    var_d950a79d86f32708 = 16;
    var_d5f8c4084a83331b = 0;
    var_3faa24937366bd8c = var_d8354a49cc36aa44 + var_d950a79d86f32708;
    foreach (reviveplayer in var_c08e41851ed100e8) {
        var_d5f8c4084a83331b = var_d5f8c4084a83331b | reviveplayer << var_3faa24937366bd8c;
        var_3faa24937366bd8c++;
    }
    value = 0;
    value = var_d5f8c4084a83331b | missionid << var_d8354a49cc36aa44 | player << var_17662f483f270d8 | state;
    self setclientomnvar("ui_br_expanded_obit_message", value);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189b
// Size: 0x8a
function function_4bb3153d2bc88c04(team, var_939b8e8818bfd5ae, state, missionid, var_c08e41851ed100e8) {
    foreach (player in getteamdata(team, "players")) {
        player function_b79b55c5a0aaa08(var_939b8e8818bfd5ae, state, missionid, var_c08e41851ed100e8);
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192c
// Size: 0x1ad
function function_a380c47216dc87a7(attacker, var_e48b3d05087e93f5, var_73cacd5a645aab1f) {
    if (getdvarint(@"hash_5b0a580d2ed6f60e", 1) == 0) {
        return;
    }
    var_4af8655668df58e2 = var_e48b3d05087e93f5 getentitynumber();
    attackerentnum = attacker getentitynumber();
    var_af9cbb6cb7344131 = [];
    index = 1;
    teamplayers = getteamdata(level.players[attackerentnum].team, "players");
    foreach (entry in teamplayers) {
        if (entry == level.players[attackerentnum]) {
            var_af9cbb6cb7344131[index] = 0;
            index++;
        } else {
            var_af9cbb6cb7344131[index] = 0;
            foreach (var_22080d73ae745a4b in var_73cacd5a645aab1f) {
                if (entry == var_22080d73ae745a4b) {
                    var_af9cbb6cb7344131[index] = 1;
                    break;
                }
            }
            index++;
        }
    }
    for (var_ac61d946afdba08b = index; var_ac61d946afdba08b < 4; var_ac61d946afdba08b++) {
        var_af9cbb6cb7344131[var_ac61d946afdba08b] = 0;
    }
    function_4bb3153d2bc88c04(level.players[attackerentnum].team, level.players[attackerentnum], 15, var_4af8655668df58e2, var_af9cbb6cb7344131);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae0
// Size: 0xa2
function initdialog() {
    level endon("game_ended");
    game["dialog"]["match_start"] = "gametype_resurgence";
    game["dialog"]["match_desc"] = "gametype_desc_resurgence";
    game["dialog"]["last_man_standing"] = "rsrg_squad_last_alive";
    game["dialog"]["champion_avenge_teammate"] = "resurgence_avenge_teammate";
    game["dialog"]["champion_redeploy"] = "resurgence_redeploy";
    game["dialog"]["champion_disabled"] = "resurgence_reinforcement_disabled";
    game["dialog"]["champion_ending"] = "resurgence_reinforcement_ending";
    game["dialog"]["champion_teammate_respawn"] = "resurgence_teammate_respawn";
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b89
// Size: 0x16
function function_747b066379119d51() {
    game["dialog"]["last_man_standing"] = "resurgence_last_alive";
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba6
// Size: 0x3e
function cleanupents() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    namespace_36f464722d326bbe::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("me_electrical_box_street_01", 1);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1beb
// Size: 0x43
function function_49a4f952ccb3fd45() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    level.brgametype.var_c42e40ec22a1f0d4 = 1;
    level.var_843573804b98eb7e = 1;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c35
// Size: 0x15e
function function_8369d5301de43452() {
    waittillframeend();
    var_8dbb05ff88408c71 = level.allteamnamelist;
    foreach (index, team in var_8dbb05ff88408c71) {
        level.teamdata[team]["index"] = index;
    }
    var_840b848760f488a4 = getdvarint(@"hash_96c8e4682ff85b5f", 0);
    if (istrue(var_840b848760f488a4)) {
        foreach (name, team in level.teamdata) {
            level.teamdata[name]["trackedTeams"] = [];
        }
    } else {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
        foreach (player in level.players) {
            player.trackedTeams = [];
        }
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d9a
// Size: 0x63
function function_aaacd0f0a1d84290() {
    foreach (name, team in level.teamdata) {
        level.teamdata[name]["deadPlayers"] = [];
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e04
// Size: 0x28
function function_ec09c585da4071ed(reason) {
    winner = namespace_a5b4009d7c2e0b3d::gethighestscoringteam();
    level thread namespace_d576b6dc7cef9c62::endgame(winner, reason);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e33
// Size: 0x82
function ontimelimit() {
    if (!isdefined(level.ontimelimitgraceperiod)) {
        level function_9a61575de4f3d1ec();
        return;
    }
    foreach (entry in level.teamnamelist) {
        namespace_d20f8ef223912e12::setaardata(entry);
    }
    function_ec09c585da4071ed(game["end_reason"]["time_limit_reached"]);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebc
// Size: 0x53
function brmayconsiderplayerdead(player) {
    if (namespace_4b0406965e556711::gameflag("prematch_done") && namespace_4b0406965e556711::gameflag("prematch_fade_done")) {
        player thread function_3c88ec256b493bd0();
        if (!istrue(level.brgametype.var_b43745b85f249e68)) {
            namespace_80cec6cfc70c4f95::markplayeraseliminated(player);
        }
    }
    return 1;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f17
// Size: 0xe
function ondeadevent(team) {
    return 1;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2d
// Size: 0x55
function packclientmatchdata() {
    if (!isdefined(self.var_11e422333cb859e)) {
        self.var_11e422333cb859e = 0;
    }
    var_81dab8953b9df82 = self.var_11e422333cb859e;
    if (var_81dab8953b9df82 > 255) {
        var_81dab8953b9df82 = 255;
    }
    self.extrascore0 = var_81dab8953b9df82;
    self.pers["extrascore0"] = var_81dab8953b9df82;
    return var_81dab8953b9df82;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8a
// Size: 0x12b
function function_348449f96ff7cef8(teamdata, var_75c8cc005e7e9f3) {
    var_2f945dac0cd1edcb = !istrue(level.teamdata[self.team]["teamHadFirstRevive"]);
    if (var_2f945dac0cd1edcb) {
        level.teamdata[self.team]["teamHadFirstRevive"] = 1;
    }
    foreach (var_b46423b1979cb10e in teamdata) {
        if (!isdefined(var_b46423b1979cb10e.var_11e422333cb859e)) {
            var_b46423b1979cb10e.var_11e422333cb859e = 0;
        }
        var_b46423b1979cb10e.var_11e422333cb859e++;
        var_b46423b1979cb10e namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("reviveCount", var_b46423b1979cb10e.var_11e422333cb859e);
        var_b46423b1979cb10e packclientmatchdata();
        var_75a087e96d31ddc5 = !isdefined(var_75c8cc005e7e9f3) || var_b46423b1979cb10e != var_75c8cc005e7e9f3;
        var_4b59e709fd5bcc45 = var_2f945dac0cd1edcb && var_75a087e96d31ddc5;
        if (var_4b59e709fd5bcc45) {
            var_b46423b1979cb10e thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_first_revive", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp_mgl");
        }
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20bc
// Size: 0x5b
function kioskreviveplayer(var_84e2123aaca9a965, var_57d71760971f748f) {
    var_c7869d69dbcf7fd3 = self;
    var_c7869d69dbcf7fd3 thread namespace_47fd1e79a44628cd::playergulagautowin("championKioskRevive", var_84e2123aaca9a965, var_57d71760971f748f);
    var_c7869d69dbcf7fd3 function_348449f96ff7cef8(level.teamdata[var_c7869d69dbcf7fd3.team]["alivePlayers"], var_84e2123aaca9a965);
    function_1f8da2719751fc5f();
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211f
// Size: 0x39
function droponplayerdeath(attacker) {
    if (istrue(level.brgametype.var_d6dc578c217f88cf) && !isdefined(self.var_5fb036c33cddd360)) {
        namespace_d20f8ef223912e12::function_10ffa1071b1c2681();
    }
    return 0;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2160
// Size: 0x14
function onMarkPlayerAsEliminated(player) {
    namespace_bd131dfa920d03b9::function_305f60799dc60d7c(player);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217b
// Size: 0x126
function function_735fe9ec0c4dd312(var_642470e1abc1bbf9) {
    if (!istrue(level.br_prematchstarted)) {
        return;
    }
    if (level.gameended) {
        return;
    }
    if (!isdefined(var_642470e1abc1bbf9.victim)) {
        return;
    }
    thread namespace_71073fa38f11492::runbrgametypefunc("preOnPlayerKilled", var_642470e1abc1bbf9);
    if (!isdefined(var_642470e1abc1bbf9.attacker) || !isplayer(var_642470e1abc1bbf9.attacker) || var_642470e1abc1bbf9.attacker == var_642470e1abc1bbf9.victim) {
        return;
    }
    alivecount = getteamdata(var_642470e1abc1bbf9.attacker.team, "aliveCount");
    if (alivecount <= 0) {
        return;
    }
    var_642470e1abc1bbf9.attacker function_ff9954eb6fa229a8(var_642470e1abc1bbf9.attacker.team, var_642470e1abc1bbf9.victim.team);
    var_642470e1abc1bbf9.attacker thread function_7af0dacee64943c2(var_642470e1abc1bbf9.attacker.team, var_642470e1abc1bbf9.victim);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a8
// Size: 0x34
function function_ff9954eb6fa229a8(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98) {
    if (!level.brgametype.var_6420b42c7add53cc) {
        return;
    }
    trackTeam(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e3
// Size: 0xa8
function function_7af0dacee64943c2(team, var_3e59c6682b60d27e) {
    level endon("game_ended");
    if (!level.brgametype.var_f6682c80c3c868d6) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    alivecount = getteamdata(team, "aliveCount");
    if (alivecount <= 0) {
        return;
    }
    var_d0b996fde8bfc937 = level.teamdata[team]["deadPlayers"];
    if (var_d0b996fde8bfc937.size <= 0) {
        return;
    }
    var_4e776a22240ff174 = function_c033ab6f3faa6fca(var_d0b996fde8bfc937, var_3e59c6682b60d27e);
    function_5535ff78fc16526e(var_4e776a22240ff174, var_3e59c6682b60d27e);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2392
// Size: 0x120
function function_c033ab6f3faa6fca(var_d0b996fde8bfc937, var_3e59c6682b60d27e) {
    var_4e776a22240ff174 = [];
    if (istrue(level.brgametype.var_fbc20f6d398b973e)) {
        foreach (item in var_d0b996fde8bfc937) {
            if (!isdefined(item)) {
                continue;
            }
            var_4e776a22240ff174 = array_add(var_4e776a22240ff174, item);
            break;
        }
    } else {
        foreach (item in var_d0b996fde8bfc937) {
            if (!isdefined(item)) {
                continue;
            }
            if (isdefined(item.killer) && item.killer == var_3e59c6682b60d27e && isdefined(item.player)) {
                var_4e776a22240ff174 = array_add(var_4e776a22240ff174, item.player);
            }
        }
    }
    return var_4e776a22240ff174;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ba
// Size: 0xae
function function_5535ff78fc16526e(var_4e776a22240ff174, var_e48b3d05087e93f5) {
    if (var_4e776a22240ff174.size <= 0) {
        return;
    }
    foreach (teammate in var_4e776a22240ff174) {
        if (!isdefined(teammate)) {
            continue;
        }
        function_9d794b8a2ad15cd5(teammate);
    }
    if (!istrue(level.brgametype.var_7b3746fd57041fb7)) {
        function_a380c47216dc87a7(self, var_e48b3d05087e93f5, var_4e776a22240ff174);
    }
    thread namespace_391de535501b0143::killeventtextpopup("br_resurgence_vengeance", 0, 0);
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("champion_avenge_teammate", self);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256f
// Size: 0x73
function function_9d794b8a2ad15cd5(var_92a674d94df29e77) {
    if (istrue(level.brgametype.var_7b3746fd57041fb7)) {
        var_92a674d94df29e77.respawndelay = var_92a674d94df29e77.respawndelay - getmatchrulesdata("brData", "resurgenceVengeanceDecreaseRespawnDelay");
    } else {
        var_92a674d94df29e77 thread doingRespawn(1, level.teamdata[var_92a674d94df29e77.team]["alivePlayers"]);
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25e9
// Size: 0x87
function function_6f0f4e7b3ff7b57c(trackedTeams) {
    oldestindex = -1;
    var_3071102f98cbed33 = 2147483647;
    foreach (var_109ebf347b2f2ece, var_cf7d42708e58bb98 in trackedTeams) {
        if (var_cf7d42708e58bb98["startTime"] < var_3071102f98cbed33) {
            oldestindex = var_109ebf347b2f2ece;
            var_3071102f98cbed33 = var_cf7d42708e58bb98["startTime"];
        }
    }
    return oldestindex;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2678
// Size: 0x79
function function_85fee305e2d829c1(array, teamname) {
    foundindex = -1;
    foreach (index, team in array) {
        if (team["name"] == teamname) {
            foundindex = index;
            break;
        }
    }
    return foundindex;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f9
// Size: 0x100
function function_611500f4751aaf1(bitfield, teamindex, var_109ebf347b2f2ece) {
    var_5ba62be302f54d98 = int(pow(2, 8));
    /#
        assertex(level.teamdata.size < var_5ba62be302f54d98, "All the " + level.teamdata.size + " teams can't be packed into " + 8 + " bits to fill 32bits");
    #/
    /#
        assertex(teamindex < var_5ba62be302f54d98, "Trying to pass a team index that is higher then " + var_5ba62be302f54d98 - 1 + ", there is " + level.teamdata.size + " teams");
    #/
    /#
        assertex(var_109ebf347b2f2ece >= 0 && var_109ebf347b2f2ece < 4, "Array index can't be packed into 32 bits");
    #/
    var_8501f555ea8dbe78 = 8 * var_109ebf347b2f2ece;
    bitmask = var_5ba62be302f54d98 - 1;
    bitmask = bitmask << var_8501f555ea8dbe78;
    var_f8f977081d3da8b4 = ~bitmask;
    bitfield = bitfield & var_f8f977081d3da8b4;
    var_1cc902f24ef7cc11 = teamindex << var_8501f555ea8dbe78;
    bitfield = bitfield | var_1cc902f24ef7cc11;
    return bitfield;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2801
// Size: 0x9f
function function_d6d795db2cae2c1b(var_29412b34af141c29, var_3e00d2d6fb1bd934, var_8db0c8d0a8da2329) {
    bitfield = -1;
    foreach (player in var_29412b34af141c29) {
        if (isdefined(player)) {
            if (bitfield < 0) {
                bitfield = player getclientomnvar("ui_br_resurgence_tracked_teams");
                bitfield = function_611500f4751aaf1(bitfield, var_3e00d2d6fb1bd934, var_8db0c8d0a8da2329);
            }
            player setclientomnvar("ui_br_resurgence_tracked_teams", bitfield);
        }
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a7
// Size: 0x6a
function function_f6686365221e78cb() {
    var_840b848760f488a4 = getdvarint(@"hash_96c8e4682ff85b5f", 0);
    trackedTeams = [];
    if (istrue(var_840b848760f488a4)) {
        trackedTeams = getteamdata(self.team, "trackedTeams");
    } else {
        if (!isdefined(self.trackedTeams)) {
            self.trackedTeams = [];
        }
        trackedTeams = self.trackedTeams;
    }
    return trackedTeams;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2919
// Size: 0x74
function trackTeam(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98) {
    var_bb58bcc7b0654344 = -1;
    trackedTeams = function_f6686365221e78cb();
    var_bb58bcc7b0654344 = function_85fee305e2d829c1(trackedTeams, var_cf7d42708e58bb98);
    if (var_bb58bcc7b0654344 < 0) {
        if (trackedTeams.size == 4) {
            var_bb58bcc7b0654344 = function_6f0f4e7b3ff7b57c(trackedTeams);
        } else {
            var_bb58bcc7b0654344 = trackedTeams.size;
        }
    }
    if (var_bb58bcc7b0654344 < 0 || var_bb58bcc7b0654344 >= 4) {
        return;
    }
    thread function_7ca4d46dfe174e90(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98, var_bb58bcc7b0654344);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2994
// Size: 0x127
function function_7ca4d46dfe174e90(var_a1b4fab5a3b4fa5e, var_cf7d42708e58bb98, var_bb58bcc7b0654344) {
    if (var_bb58bcc7b0654344 < 0 || var_bb58bcc7b0654344 >= 4) {
        return;
    }
    notifyname = "trackTeam" + var_a1b4fab5a3b4fa5e + var_bb58bcc7b0654344;
    var_29412b34af141c29 = [];
    var_5b1596320df748c = [];
    var_5b1596320df748c["name"] = var_cf7d42708e58bb98;
    var_5b1596320df748c["startTime"] = gettime();
    var_840b848760f488a4 = getdvarint(@"hash_96c8e4682ff85b5f", 0);
    if (istrue(var_840b848760f488a4)) {
        level notify(notifyname);
        level endon(notifyname);
        level.teamdata[var_a1b4fab5a3b4fa5e]["trackedTeams"][var_bb58bcc7b0654344] = var_5b1596320df748c;
        var_29412b34af141c29 = getteamdata(var_a1b4fab5a3b4fa5e, "players");
    } else {
        self notify(notifyname);
        self endon(notifyname);
        self.trackedTeams[var_bb58bcc7b0654344] = var_5b1596320df748c;
        var_29412b34af141c29 = [0:self];
    }
    var_3e00d2d6fb1bd934 = getteamindex(var_cf7d42708e58bb98);
    function_d6d795db2cae2c1b(var_29412b34af141c29, var_3e00d2d6fb1bd934, var_bb58bcc7b0654344);
    var_776df703e8901349 = getdvarfloat(@"hash_dc284649b5343df1", 2.5);
    wait(var_776df703e8901349);
    function_d6d795db2cae2c1b(var_29412b34af141c29, 0, var_bb58bcc7b0654344);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac2
// Size: 0x1e7
function function_e003a419d3914c23() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    level waittill("infils_ready");
    var_10b5c13c81db5079 = function_b398acc9ba21ecb5();
    if (var_10b5c13c81db5079 < 0) {
        return;
    }
    totaltime = 0;
    for (i = 0; i < var_10b5c13c81db5079; i++) {
        totaltime = totaltime + level.br_level.br_circleclosetimes[i] + level.br_level.br_circledelaytimes[i];
    }
    var_f9f04f141ae1e4d4 = int(totaltime * 1000);
    var_7bf1255a3715a632 = gettime();
    var_3112e3de7bf7f005 = var_7bf1255a3715a632 + var_f9f04f141ae1e4d4;
    setomnvarforallclients("ui_br_timed_feature_end_time", var_3112e3de7bf7f005);
    setomnvarforallclients("ui_br_resurgence_will_disable", 0);
    level.var_1fcba68efd8d4bf = totaltime;
    var_a9a4271fa4d4acee = var_f9f04f141ae1e4d4;
    var_eb17c8739491b838 = getdvarint(@"hash_342776b421ce99fa", 90000);
    thread function_c2890d0252b9f16d(var_a9a4271fa4d4acee / 1000);
    while (var_a9a4271fa4d4acee > var_eb17c8739491b838) {
        wait((var_a9a4271fa4d4acee - var_eb17c8739491b838) / 1000);
        var_6cf8e0bf922944ae = gettime() - var_7bf1255a3715a632;
        var_a9a4271fa4d4acee = var_f9f04f141ae1e4d4 - var_6cf8e0bf922944ae;
    }
    setomnvarforallclients("ui_br_resurgence_will_disable", 1);
    setomnvarforallclients("ui_br_timed_feature_end_time", int(gettime() + var_a9a4271fa4d4acee));
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_reinforcement_closing", undefined, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp_mgl");
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb0
// Size: 0x1d
function function_c2890d0252b9f16d(remainingtime) {
    wait(remainingtime - 90);
    namespace_d3d40f75bb4e4c32::brleaderdialog("champion_ending");
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd4
// Size: 0x18a
function function_2573e08a439335f7() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    level.brgametype.respawndelay = [];
    level.brgametype.var_a427c307de983162 = getdvarint(@"hash_8676fe51daaeabe1", 1);
    var_10b5c13c81db5079 = function_b398acc9ba21ecb5();
    if (level.brgametype.var_a427c307de983162 && var_10b5c13c81db5079 >= 0) {
        var_31f53a82b8311132 = [0:@"hash_54321ad57677ee05", 1:@"hash_543219d57677ebd2", 2:@"hash_543218d57677e99f", 3:@"hash_543217d57677e76c", 4:@"hash_543216d57677e539", 5:@"hash_543215d57677e306", 6:@"hash_543214d57677e0d3", 7:@"hash_543213d57677dea0", 8:@"hash_543222d57677ff9d", 9:@"hash_543221d57677fd6a"];
        /#
            assertex(var_10b5c13c81db5079 < var_31f53a82b8311132.size, "Error: disableRespawnCloseIndex is larger than the DVAR table");
        #/
        for (i = 0; i < var_10b5c13c81db5079; i++) {
            level.brgametype.respawndelay[i] = getdvarint(var_31f53a82b8311132[i], 20);
        }
    } else {
        level.brgametype.respawndelay[0] = getdvarint(@"hash_4db324f75255cc28", 20);
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e65
// Size: 0x44
function function_b909abb7a17a92ad() {
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue & ~16384;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
    self setclientomnvar("ui_resurgenceRespawnTimer_solo", newvalue);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb0
// Size: 0x43
function function_6bb3d05538568538() {
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue | 16384;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
    self setclientomnvar("ui_resurgenceRespawnTimer_solo", newvalue);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2efa
// Size: 0x43
function function_9b57a5870079dee1() {
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue | 32768;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
    self setclientomnvar("ui_resurgenceRespawnTimer_solo", newvalue);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f44
// Size: 0x44
function function_80a44396d4052334() {
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue & ~32768;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
    self setclientomnvar("ui_resurgenceRespawnTimer_solo", newvalue);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8f
// Size: 0x6f
function function_6238a0c9226288bc(value) {
    /#
        assert(value <= 16384 - 1);
    #/
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    var_a31ae8d2963fa9d = currentvalue & ~(16384 - 1);
    newvalue = var_a31ae8d2963fa9d | value;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
    self setclientomnvar("ui_resurgenceRespawnTimer_solo", newvalue);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3005
// Size: 0xa4
function function_a4f5eae4925ad484(value) {
    /#
        assert(value <= 16384 - 1);
    #/
    currentvalue = self getclientomnvar("ui_resurgenceRespawnTimer");
    var_a31ae8d2963fa9d = currentvalue & ~(1073741824 - 65536 + 1073741824);
    forceupdate = currentvalue & 1073741824;
    if (forceupdate != 0) {
        forceupdate = 0;
    } else {
        forceupdate = 1073741824;
    }
    newvalue = var_a31ae8d2963fa9d | value << 16 | forceupdate;
    self setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
    self setclientomnvar("ui_resurgenceRespawnTimer_solo", newvalue);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b0
// Size: 0xba
function function_d04daab64ea0d3df(player) {
    teamplayers = getteamdata(player.team, "players");
    foreach (teammate in teamplayers) {
        var_f5aa9c197c4cf398 = teammate namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
        var_73409c2edfa9e4f9 = isalive(teammate) && !istrue(teammate.inlaststand);
        if (teammate != player && var_73409c2edfa9e4f9 && !var_f5aa9c197c4cf398) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3172
// Size: 0x80
function function_de118d63bf624508() {
    player = self;
    if (player namespace_47fd1e79a44628cd::function_4a25d64251fab1b7()) {
        player function_348449f96ff7cef8(level.teamdata[player.team]["alivePlayers"]);
        function_1f8da2719751fc5f();
        player namespace_99ac021a7547cae3::addtoalivecount("champion_gulag");
        namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player);
        var_4911936f026c8e38 = namespace_d20f8ef223912e12::brmayconsiderplayerdead(player);
        if (!var_4911936f026c8e38) {
            namespace_47fd1e79a44628cd::entergulag(player);
        }
        self.waitingtospawn = 0;
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f9
// Size: 0xb2
function function_aac26c7a1cfe6c48() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("doingRespawn");
    if (istrue(level.brgametype.var_55f0d9f2a10553c4)) {
        while (function_d04daab64ea0d3df(self)) {
            waitframe();
        }
        function_b909abb7a17a92ad();
        self notify("squad_wiped");
        waitframe();
        function_de118d63bf624508();
    } else {
        var_849d01afb2fc0f0a = getteamdata(self.team, "aliveCount");
        while (var_849d01afb2fc0f0a > 0) {
            waitframe();
            var_849d01afb2fc0f0a = getteamdata(self.team, "aliveCount");
        }
        function_b909abb7a17a92ad();
        namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("respawnInSeconds", 0);
        self notify("squad_wiped");
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b2
// Size: 0x37f
function function_5dfd73c97bf5d03d(player, evictim, event, points, var_645b1a1d2a1ddfb7) {
    if (!isdefined(player)) {
        return;
    }
    if (!isalive(player)) {
        return;
    }
    if (points <= 0) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done") || !namespace_4b0406965e556711::gameflag("prematch_fade_done")) {
        return;
    }
    if (isdefined(event) && isdefined(var_645b1a1d2a1ddfb7) && event == "br_kioskBuy" && var_645b1a1d2a1ddfb7 == "br_team_revive") {
        var_780d8a24242378d5 = namespace_54d20dd0dd79277f::getteamdata(player.team, "aliveCount");
        var_cd51ab4357f76c8c = namespace_54d20dd0dd79277f::getteamdata(player.team, "teamCount");
        var_de1f625722d92973 = var_cd51ab4357f76c8c - var_780d8a24242378d5;
        if (var_de1f625722d92973 == 1) {
            return;
        }
    }
    var_9a5e708d6675417 = getmatchrulesdata("brData", "resurgencePointsToSecondRatio");
    var_36a08dc900babaf2 = getmatchrulesdata("brData", "resurgencePointsToFirstSecondOffset");
    var_91f726fa8b73ddd5 = int(floor((points + var_36a08dc900babaf2) * var_9a5e708d6675417));
    if (isdefined(event)) {
        if (event == "br_kioskBuy") {
            var_c7c9a35c374fa86f = getmatchrulesdata("brData", "resurgencePointsToSecondKioskBuyRatio");
            var_91f726fa8b73ddd5 = int(ceil(var_91f726fa8b73ddd5 * var_c7c9a35c374fa86f));
        } else if (event == "kill") {
            var_91f726fa8b73ddd5 = int(floor((250 + var_36a08dc900babaf2) * var_9a5e708d6675417));
        } else if (event == "br_cacheOpen") {
            var_91f726fa8b73ddd5 = int(floor((100 + var_36a08dc900babaf2) * var_9a5e708d6675417));
        }
    }
    if (var_91f726fa8b73ddd5 <= 0) {
        return;
    }
    playerteam = level.teamdata[player.team];
    if (!isdefined(playerteam)) {
        return;
    }
    deadplayers = playerteam["deadPlayers"];
    if (!isdefined(deadplayers)) {
        return;
    }
    var_7cd081d8bbc27830 = 0;
    foreach (dead in deadplayers) {
        if (isdefined(dead) && isdefined(dead.player) && dead.player != player) {
            if (dead.player.respawndelay > 0) {
                dead.player.respawndelay = int(max(0, dead.player.respawndelay - var_91f726fa8b73ddd5));
                if (!isdefined(dead.player.var_c54afd6e867e686b)) {
                    dead.player.var_c54afd6e867e686b = 0;
                }
                dead.player.var_c54afd6e867e686b = dead.player.var_c54afd6e867e686b + var_91f726fa8b73ddd5;
                var_7cd081d8bbc27830 = 1;
            }
        }
    }
    if (var_7cd081d8bbc27830) {
        if (istrue(player.var_5c3b157495f480a2)) {
            player.var_5449b5708779ee8e = player.var_5449b5708779ee8e + var_91f726fa8b73ddd5;
        } else {
            player.var_5c3b157495f480a2 = 1;
            player.var_5449b5708779ee8e = var_91f726fa8b73ddd5;
            player thread function_bb5d745ad4aed02c();
        }
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3638
// Size: 0x5e
function function_bb5d745ad4aed02c() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("squad_wiped");
    wait(0.5);
    if (isdefined(self.var_5449b5708779ee8e) && self.var_5449b5708779ee8e > 0) {
        function_a4f5eae4925ad484(self.var_5449b5708779ee8e);
    }
    self.var_5449b5708779ee8e = undefined;
    self.var_5c3b157495f480a2 = 0;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x369d
// Size: 0x50f
function function_3c88ec256b493bd0() {
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player endon("squad_wiped");
    player endon("force_stop_respawn");
    if (!istrue(level.brgametype.var_b43745b85f249e68)) {
        player thread function_aac26c7a1cfe6c48();
    }
    player thread function_c1a20edbed65900b();
    if (isdefined(level.brgametype.var_c655c38108f1827f)) {
        player.respawndelay = level.brgametype.var_c655c38108f1827f;
    } else if (level.br_circle.circleindex < 0) {
        player.respawndelay = level.brgametype.respawndelay[0];
        if (istrue(level.brgametype.var_fc3b5a2e206a85f2)) {
            player.respawndelay = level.brgametype.waverespawntimer;
        }
    } else {
        circleindex = int(min(level.br_circle.circleindex, level.brgametype.respawndelay.size - 1));
        player.respawndelay = level.brgametype.respawndelay[circleindex];
        if (istrue(level.brgametype.var_fc3b5a2e206a85f2)) {
            player.respawndelay = level.brgametype.waverespawntimer;
        }
    }
    if (!isdefined(player.respawndelay)) {
        errormsg = "";
        var_75c7789394667f32 = "
";
        var_79b9159e31664699 = getarraykeys(game["flags"]);
        foreach (name in var_79b9159e31664699) {
            var_75c7789394667f32 = var_75c7789394667f32 + name + " -> " + game["flags"][name] + "
";
        }
        errormsg = errormsg + var_75c7789394667f32;
        namespace_9c840bb9f2ecbf00::demoforcesre(errormsg);
        player.respawndelay = 20;
    }
    if (getdvarint(@"hash_d31b1c01a86089c2", 1) == 1 && isalive(player)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("Alive player added to resurgence countdown. IsAlive: " + isalive(player) + ". Sessionstate: " + player.sessionstate);
        waitframe();
        namespace_9c840bb9f2ecbf00::demoforcesre("Alive player added to resurgence countdown - after waitframe. IsAlive: " + isalive(player) + ". Sessionstate: " + player.sessionstate);
    }
    player function_80a44396d4052334();
    player function_6bb3d05538568538();
    player function_6238a0c9226288bc(player.respawndelay);
    player.var_c54afd6e867e686b = 0;
    while (player.respawndelay > 0) {
        if (player.respawndelay <= 5) {
            player playsoundtoplayer("ui_mp_resurgence_timer_quarter_sec", player);
        } else if (player.respawndelay <= 10) {
            player playsoundtoplayer("ui_mp_resurgence_timer_half_sec", player);
        } else if (player.respawndelay % 4 == 2) {
            player playsoundtoplayer("ui_mp_resurgence_timer", player);
        } else {
            player playsoundtoplayer("ui_mp_resurgence_timer_tick", player);
        }
        if (isalive(player)) {
            player.respawndelay = 0;
        } else {
            player function_6238a0c9226288bc(player.respawndelay);
        }
        player function_a4f5eae4925ad484(player.var_c54afd6e867e686b);
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("respawnInSeconds", player.respawndelay);
        player.var_c54afd6e867e686b = 0;
        wait(1);
        player.respawndelay--;
    }
    player function_b909abb7a17a92ad();
    player function_a4f5eae4925ad484(0);
    player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("respawnInSeconds", 0);
    if (!isalive(player)) {
        if (isdefined(player.team)) {
            displaysquadmessagetoteam(player.team, player, 14, 1);
            foreach (teammate in level.teamdata[player.team]["alivePlayers"]) {
                if (!istrue(teammate.var_24278e2ec4540e)) {
                    teammate thread function_53b4caf82507f423();
                }
            }
        }
        player thread doingRespawn(0, level.teamdata[player.team]["alivePlayers"]);
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb3
// Size: 0x30
function function_53b4caf82507f423() {
    level endon("game_ended");
    self.var_24278e2ec4540e = 1;
    thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("champion_teammate_respawn", self);
    wait(5);
    self.var_24278e2ec4540e = undefined;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bea
// Size: 0x19
function function_c1a20edbed65900b() {
    level endon("game_ended");
    self endon("disconnect");
    waitframe();
    function_81f2b277d31bb707();
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0a
// Size: 0x160
function function_81f2b277d31bb707() {
    if (istrue(level.brgametype.var_ad3c825b1dd7d9a8)) {
        return;
    }
    newentry = self;
    if (!istrue(level.brgametype.var_fbc20f6d398b973e)) {
        newentry = spawnstruct();
        newentry.player = self;
        newentry.killer = self.lastkilledby;
    }
    var_7193e062042f638d = [];
    deadplayers = level.teamdata[self.team]["deadPlayers"];
    foreach (dead in deadplayers) {
        if (isdefined(dead)) {
            var_7193e062042f638d[var_7193e062042f638d.size] = dead.player.name;
        }
    }
    /#
        assertex(!array_contains(var_7193e062042f638d, newentry.player.name), "trying to add a duplicate");
    #/
    level.teamdata[self.team]["deadPlayers"] = array_add(level.teamdata[self.team]["deadPlayers"], newentry);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d71
// Size: 0xee
function function_1f8da2719751fc5f() {
    if (istrue(level.brgametype.var_ad3c825b1dd7d9a8)) {
        return;
    }
    deadplayers = level.teamdata[self.team]["deadPlayers"];
    if (istrue(level.brgametype.var_fbc20f6d398b973e)) {
        deadplayers = array_remove(deadplayers, self);
    } else {
        var_d674d7970eef9653 = [];
        foreach (item in deadplayers) {
            if (isdefined(item) && item.player != self) {
                var_d674d7970eef9653[var_d674d7970eef9653.size] = item;
            }
        }
        deadplayers = var_d674d7970eef9653;
    }
    level.teamdata[self.team]["deadPlayers"] = deadplayers;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e66
// Size: 0x1c8
function doingRespawn(var_cb5ba4c3282c39c1, var_54ebfc906d9a55e7) {
    /#
        assertex(isdefined(self), "Trying to respawn an invalid player");
    #/
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player notify("doingRespawn");
    if (istrue(player.respawningfromtoken)) {
        return;
    }
    player.respawningfromtoken = 1;
    if (istrue(level.brgametype.var_6f3c4d74a8c614ab)) {
        player notify("started_spawnPlayer");
    }
    if (istrue(var_cb5ba4c3282c39c1)) {
        player function_9b57a5870079dee1();
        player thread namespace_391de535501b0143::killeventtextpopup("br_resurgence_vengeance", 0, 0);
        wait(1.5);
    }
    player function_348449f96ff7cef8(var_54ebfc906d9a55e7);
    function_1f8da2719751fc5f();
    player namespace_99ac021a7547cae3::addtoalivecount("champion");
    namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player);
    player namespace_cb965d2f71fefddc::addrespawntoken(1);
    var_1476e0f78320a501 = 0;
    if (istrue(level.brgametype.var_a916b204f027af6b)) {
        var_1476e0f78320a501 = player namespace_8bfdb6eb5a3df67a::playerwaitforprestreaming();
    }
    streamtimeout = namespace_d3d40f75bb4e4c32::getdefaultstreamhinttimeoutms() / 1000;
    spawnpoint = namespace_8bfdb6eb5a3df67a::playerGetRespawnPoint(0, streamtimeout);
    var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
    self.forcespawnorigin = var_11f3b4465c8b637b;
    if (var_1476e0f78320a501) {
        player namespace_58fb4f2e73fd41a0::setlowermessageomnvar(0);
    }
    var_b59f471c2c064e56 = 1;
    player namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
    wait(var_b59f471c2c064e56);
    player function_b909abb7a17a92ad();
    player namespace_44abc05161e2e2cb::clearsplashqueue();
    player namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
    player namespace_f446f6030ca8cff8::_clearexecution();
    player namespace_cb965d2f71fefddc::initplayer();
    player namespace_a9c534dc7832aba4::playerclearspectatekillchainsystem();
    player.respawningfromtoken = undefined;
    player function_80a44396d4052334();
    player thread namespace_8bfdb6eb5a3df67a::triggerrespawnoverlay(20);
    player respawn(spawnpoint, var_11f3b4465c8b637b);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4035
// Size: 0xb
function triggerrespawnoverlay() {
    wait(0.5);
    return 1;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4048
// Size: 0x2cf
function respawn(spawnpoint, var_11f3b4465c8b637b) {
    /#
        println("planeSnapToOOB" + self.name);
    #/
    level notify("update_circle_hide");
    if (isdefined(self.oobimmunity)) {
        namespace_d9c77dc2a6fe29c6::disableoobimmunity(self);
    }
    namespace_d20f8ef223912e12::givelaststandifneeded(self);
    function_c04b5edf3f9ea340();
    if (!isdefined(spawnpoint)) {
        spawnpoint = namespace_8bfdb6eb5a3df67a::playerGetRespawnPoint();
    }
    spawnorigin = spawnpoint.origin;
    spawnangles = spawnpoint.angles;
    startorigin = spawnorigin;
    if (isdefined(var_11f3b4465c8b637b)) {
        startorigin = var_11f3b4465c8b637b;
    }
    namespace_8bfdb6eb5a3df67a::function_961b4afc4c695b94();
    self setorigin(startorigin, 1);
    self setplayerangles(spawnangles);
    linker = spawn("script_model", startorigin);
    linker setmodel("tag_origin");
    linker.angles = spawnangles;
    linker hide();
    linker showtoplayer(self);
    self playerlinktoabsolute(linker, "tag_origin");
    function_a593971d75d82113();
    function_379bb555405c16bb("br_gametype_champion::respawn()");
    thread namespace_8bfdb6eb5a3df67a::playercleanupentondisconnect(linker);
    waitframe();
    playerrespawncleanup();
    if (getdvarint(@"hash_df02345c60008647", 1) == 0) {
        namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    }
    namespace_d3d40f75bb4e4c32::playerclearstreamhintorigin();
    if (isdefined(var_11f3b4465c8b637b)) {
        linker.origin = spawnorigin;
    }
    linker playsoundtoplayer("br_ac130_flyby", self);
    wait(1.5);
    self unlink();
    namespace_4887422e77f3514e::function_a2b4e6088394bade();
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        self clearsoundsubmix("iw8_br_gulag_tutorial", 2);
    } else {
        self clearsoundsubmix("solo_cin_igc_music", 2);
    }
    self clearclienttriggeraudiozone(1);
    function_6fb380927695ee76();
    function_985b0973f29da4f8("br_gametype_champion::respawn()");
    playersetcontrols(1);
    falltime = 0;
    if (isdefined(level.parachutedeploydelay)) {
        falltime = level.parachutedeploydelay;
    }
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        thread namespace_5078ee98abb32db9::startfreefall(falltime, 0, undefined, undefined, 1);
    }
    if (getgametype() == "br") {
        self setclientomnvar("ui_show_spectateHud", -1);
    }
    namespace_8bfdb6eb5a3df67a::resetplayermovespeedscale();
    namespace_f8d3520d3483c1::givestartingarmor();
    namespace_4bc0ead8d2af3d84::onplayerrespawn();
    namespace_c3059e55bc606259::onplayerrespawn();
    namespace_cb965d2f71fefddc::removerespawntoken();
    wait(0.5);
    if (getgametype() == "br") {
        thread namespace_8bfdb6eb5a3df67a::playercinematicfadeout();
    }
    waitframe();
    linker delete();
    if (istrue(level.var_3ff7c73209fcf59d)) {
        namespace_250014dec221561c::function_fa674fb6e8372620();
    }
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        self notify("respawn_from_gulag");
    }
    self notify("can_show_splashes");
    if (!istrue(level.ignoregulagredeploysplash)) {
        thread namespace_44abc05161e2e2cb::showsplash("br_resurgence_redeploy", 20, undefined, undefined, undefined, "splash_list_iw9_br_resurgence_mp_mgl");
    }
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("champion_redeploy", self);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x431e
// Size: 0x3c
function playerrespawncleanup() {
    self notify("resurgenceRespawn");
    self.health = self.maxhealth;
    val::set("resurgenceRespawn", "player_for_spawn_logic", 0);
    namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("isRespawning", 0);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4361
// Size: 0x31
function function_c04b5edf3f9ea340() {
    if (isdefined(level.br_standard_loadout) || getdvarint(@"hash_f97d261e2f377ad9", 1) != 0) {
        self.gulagtableloadout = 1;
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4399
// Size: 0x2f
function playersetcontrols(enable) {
    if (enable) {
        self enableoffhandweapons();
        self enableusability();
    } else {
        self disableoffhandweapons();
        self disableusability();
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43cf
// Size: 0xaa
function getDefaultLoadout() {
    loadout = level.br_standard_loadout;
    if (isdefined(level.var_c04b5edf3f9ea340)) {
        circleindex = 0;
        if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
            circleindex = min(level.br_circle.circleindex, level.var_c04b5edf3f9ea340.size);
            circleindex = int(circleindex);
        }
        if (isdefined(level.var_77c121d31e587ba8[circleindex])) {
            loadout = level.var_c04b5edf3f9ea340[circleindex][level.var_77c121d31e587ba8[circleindex]];
        }
    }
    return loadout;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4481
// Size: 0x6a
function function_b8d1b2b54ad5f08d() {
    var_c179e44bd14d2d12 = 0;
    if (isdefined(level.var_c04b5edf3f9ea340)) {
        if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
            if (level.br_circle.circleindex == level.var_c04b5edf3f9ea340.size - 1) {
                var_c179e44bd14d2d12 = 1;
            }
        }
    }
    return var_c179e44bd14d2d12;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44f3
// Size: 0x142
function playernakeddroploadout() {
    if (istrue(level.brgametype.var_d6dc578c217f88cf) && isdefined(self.var_5fb036c33cddd360)) {
        namespace_d20f8ef223912e12::function_7fbb2e52f100474e();
    } else {
        if (!istrue(self.var_ab5f5270cb22e3c8)) {
            var_dab2d2efde751b62 = "classtable:classtable_br_vanilla";
            level.br_standard_loadout = namespace_d20f8ef223912e12::initstandardloadout(var_dab2d2efde751b62, 0);
            self.var_ab5f5270cb22e3c8 = 1;
        } else {
            level.br_standard_loadout = getDefaultLoadout();
        }
        var_c179e44bd14d2d12 = function_b8d1b2b54ad5f08d();
        namespace_d20f8ef223912e12::givestandardtableloadout(0, 1, var_c179e44bd14d2d12);
    }
    namespace_f8d3520d3483c1::givestartingarmor();
    if (!isdefined(self.var_b2b6316d154f7468)) {
        self.var_b2b6316d154f7468 = 1;
        var_ce214afc7b96a3a7 = getdvarint(@"hash_e67c864263196598", 0);
        if (var_ce214afc7b96a3a7) {
            namespace_cb965d2f71fefddc::addselfrevivetoken(1);
        }
        var_bc5632ffdb336731 = getdvarint(@"hash_5868a46b12b1b4dd", 0);
        if (var_bc5632ffdb336731) {
            namespace_b6a8027f477010e1::addspecialistbonus();
        }
    } else {
        var_ce214afc7b96a3a7 = getdvarint(@"hash_cd33c7ad9a88587f", 0);
        if (var_ce214afc7b96a3a7) {
            namespace_cb965d2f71fefddc::addselfrevivetoken(1);
        }
        var_bc5632ffdb336731 = getdvarint(@"hash_5868a46b12b1b4dd", 0);
        if (var_bc5632ffdb336731) {
            namespace_b6a8027f477010e1::addspecialistbonus();
        }
    }
    return 0;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x463d
// Size: 0x13
function function_b398acc9ba21ecb5() {
    return getdvarint(@"hash_5c872af62541d1d", 3);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4658
// Size: 0x48
function circletimer(circleindex) {
    if (istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        var_10b5c13c81db5079 = function_b398acc9ba21ecb5();
        if (circleindex >= var_10b5c13c81db5079 && var_10b5c13c81db5079 >= 0) {
            function_1a3782804d2407e5();
        }
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46a7
// Size: 0xbd
function function_1a3782804d2407e5() {
    level.brgametype.var_c42e40ec22a1f0d4 = 0;
    level notify("respawn_disabled");
    function_747b066379119d51();
    namespace_71073fa38f11492::runbrgametypefunc("resurgenceDisable");
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        namespace_7015c4c971547a66::dangernotifyplayer(player, "respawn_disabled", 2);
        player setclientomnvar("ui_br_timed_feature_end_time", 0);
        player namespace_71073fa38f11492::runbrgametypefunc("playerResurgenceDisable");
    }
    namespace_d3d40f75bb4e4c32::brleaderdialog("champion_disabled");
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x476b
// Size: 0x12a
function function_97b175cec5b685be(table) {
    if (!isdefined(level.var_c04b5edf3f9ea340)) {
        level.var_c04b5edf3f9ea340 = [];
    }
    var_a78225c464121e51 = level.var_c04b5edf3f9ea340.size;
    var_7d958726e11b327 = tablelookupgetnumcols(table) - 1;
    level.var_c04b5edf3f9ea340[var_a78225c464121e51] = [];
    for (classindex = 0; classindex < var_7d958726e11b327; classindex++) {
        level.var_c04b5edf3f9ea340[var_a78225c464121e51][level.var_c04b5edf3f9ea340[var_a78225c464121e51].size] = function_aa8a954d66bf39b4(classindex, table);
    }
    level.var_77c121d31e587ba8 = [];
    foreach (circleindex, var_1a9e152363126a93 in level.var_c04b5edf3f9ea340) {
        if (isdefined(level.var_c04b5edf3f9ea340[circleindex]) && level.var_c04b5edf3f9ea340[circleindex].size > 0) {
            level.var_77c121d31e587ba8[circleindex] = randomintrange(0, level.var_c04b5edf3f9ea340[circleindex].size);
        }
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x489c
// Size: 0x2c0
function function_aa8a954d66bf39b4(classindex, table) {
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = tablelookup(table, 0, "loadoutPrimary", classindex + 1);
    loadout["loadoutPrimaryAttachment"] = tablelookup(table, 0, "loadoutPrimaryAttachment1", classindex + 1);
    loadout["loadoutPrimaryAttachment2"] = tablelookup(table, 0, "loadoutPrimaryAttachment2", classindex + 1);
    loadout["loadoutPrimaryAttachment3"] = tablelookup(table, 0, "loadoutPrimaryAttachment3", classindex + 1);
    loadout["loadoutPrimaryAttachment4"] = tablelookup(table, 0, "loadoutPrimaryAttachment4", classindex + 1);
    loadout["loadoutPrimaryAttachment5"] = tablelookup(table, 0, "loadoutPrimaryAttachment5", classindex + 1);
    loadout["loadoutPrimaryCamo"] = tablelookup(table, 0, "loadoutPrimaryCamo", classindex + 1);
    loadout["loadoutPrimaryReticle"] = tablelookup(table, 0, "loadoutPrimaryReticle", classindex + 1);
    loadout["loadoutSecondary"] = tablelookup(table, 0, "loadoutSecondary", classindex + 1);
    loadout["loadoutSecondaryAttachment"] = tablelookup(table, 0, "loadoutSecondaryAttachment1", classindex + 1);
    loadout["loadoutSecondaryAttachment2"] = tablelookup(table, 0, "loadoutSecondaryAttachment2", classindex + 1);
    loadout["loadoutSecondaryAttachment3"] = tablelookup(table, 0, "loadoutSecondaryAttachment3", classindex + 1);
    loadout["loadoutSecondaryAttachment4"] = tablelookup(table, 0, "loadoutSecondaryAttachment4", classindex + 1);
    loadout["loadoutSecondaryAttachment5"] = tablelookup(table, 0, "loadoutSecondaryAttachment5", classindex + 1);
    loadout["loadoutSecondaryCamo"] = tablelookup(table, 0, "loadoutSecondaryCamo", classindex + 1);
    loadout["loadoutSecondaryReticle"] = tablelookup(table, 0, "loadoutSecondaryReticle", classindex + 1);
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = tablelookup(table, 0, "loadoutEquipmentPrimary", classindex + 1);
    loadout["loadoutEquipmentSecondary"] = tablelookup(table, 0, "loadoutEquipmentSecondary", classindex + 1);
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:tablelookup(table, 0, "loadoutPerk1", classindex + 1), 1:tablelookup(table, 0, "loadoutPerk2", classindex + 1), 2:tablelookup(table, 0, "loadoutPerk3", classindex + 1), 3:tablelookup(table, 0, "loadoutExtraPerk1", classindex + 1), 4:tablelookup(table, 0, "loadoutExtraPerk2", classindex + 1), 5:tablelookup(table, 0, "loadoutExtraPerk3", classindex + 1)];
    loadout["loadoutGesture"] = "playerData";
    loadout["tableColumn"] = classindex;
    return loadout;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b64
// Size: 0x5b
function function_641eee023180065() {
    if (!istrue(level.brgametype.var_fc3b5a2e206a85f2)) {
        return;
    }
    if (!isdefined(level.brgametype.var_eac0aca57fe86358)) {
        level.brgametype.var_eac0aca57fe86358 = [0:60, 1:30];
    }
    thread function_9ead22d4f0ee52da();
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc6
// Size: 0xfd
function function_9ead22d4f0ee52da() {
    level endon("game_ended");
    var_415a76657415492e = 0;
    level.brgametype.waverespawntimer = level.brgametype.var_eac0aca57fe86358[var_415a76657415492e];
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    level waittill("infils_ready");
    while (level.brgametype.var_c42e40ec22a1f0d4) {
        while (level.brgametype.waverespawntimer > 0) {
            wait(1);
            level.brgametype.waverespawntimer--;
        }
        wait(1);
        var_415a76657415492e = int(min(var_415a76657415492e + 1, level.brgametype.var_eac0aca57fe86358.size - 1));
        level.brgametype.waverespawntimer = level.brgametype.var_eac0aca57fe86358[var_415a76657415492e];
    }
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cca
// Size: 0xbe
function createc130pathstruct() {
    /#
        assertex(isdefined(level.br_level) && isdefined(level.br_level.br_circlecenters) && isdefined(level.br_level.br_circleradii), "createC130PathStruct: Trying to create a C130 path within BR Resurgence, without level.br_level defined!");
    #/
    var_f9cbff5134da960b = (level.br_level.br_circlecenters[1][0], level.br_level.br_circlecenters[1][1], 0);
    var_e5bd279d3767139f = level.br_level.br_circleradii[1];
    c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path(var_f9cbff5134da960b, var_e5bd279d3767139f);
    return c130pathstruct;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d90
// Size: 0xb
function addtoc130infil() {
    thread namespace_d3d40f75bb4e4c32::kickplayersatcircleedge();
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4da2
// Size: 0x5f
function setdropbagdelay() {
    waittillframeend();
    deltatime = -15;
    closetime = namespace_c5622898120e827f::getcircleclosetime(1);
    defaultval = max(0, closetime + deltatime);
    var_7b76b8bb6b541a17 = getdvarfloat(@"hash_b81b25bcd8c7d749", defaultval);
    namespace_71073fa38f11492::registerbrgametypedata("dropBagDelay", var_7b76b8bb6b541a17);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e08
// Size: 0xcc
function onCloseCircleCompleted(var_6b890e6be7982efb) {
    timeremaining = namespace_d576b6dc7cef9c62::gettimeremaining() / 1000;
    timeremaining = timeremaining + getdvarint(@"hash_b1dc99c22b12bd63", 0);
    level.br_circle.safecircleui.origin = level.br_circle.safecircleent.origin;
    level.br_circle.dangercircleui.origin = namespace_c5622898120e827f::getdangercircleorigin() + (0, 0, namespace_c5622898120e827f::getdangercircleradius());
    namespace_c5622898120e827f::setstaticuicircles(timeremaining, level.br_circle.safecircleui, level.br_circle.dangercircleui, var_6b890e6be7982efb);
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4edb
// Size: 0x7a
function playerGetRespawnPoint(var_447913206d1f7916, timeuntilspawn, var_f9a785628f97eec6) {
    var_8108b284f99b128a = getdvarfloat(@"hash_d9e0311bd167f06b", 0);
    var_812bbc84f9c17040 = getdvarfloat(@"hash_d9bc471bd13fa615", 1);
    spawnorigin = namespace_c5622898120e827f::getrandompointinsafecircle(var_8108b284f99b128a, var_812bbc84f9c17040);
    if (isdefined(spawnorigin)) {
        spawnorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(spawnorigin);
    }
    return spawnorigin;
}

// Namespace namespace_304d296a920c310e/namespace_2d0a106261b9b151
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f5d
// Size: 0x44
function function_a2131d000491ae2c(eattacker, victim) {
    if (victim.agent_type == "actor_enemy_mp_jugg_mgl" && isplayer(eattacker)) {
        eattacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_17ab30c9bc1e4c7c");
    }
}

