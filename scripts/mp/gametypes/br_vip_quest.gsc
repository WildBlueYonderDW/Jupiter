// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using script_261e315c49e5e4ef;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_9f2f697417dcb948;

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5
// Size: 0x3b4
function function_fb7271d5ee18b98d(data) {
    level.var_9462bde338826062 = spawnstruct();
    var_ad60abb5340e959d = getdvarint(@"hash_857923dd420fca71", 0);
    level.var_9462bde338826062.time = var_ad60abb5340e959d != 0 ? var_ad60abb5340e959d : function_ea591c2a379e3424("vip");
    level.var_9462bde338826062.var_c2c8c3079f1aec6d = getdvarint(@"hash_e56f8b72f908d508", 10);
    level.var_9462bde338826062.var_117657c0f68e1bc9 = getdvarint(@"hash_7516dc47cae07042", 5);
    level.var_9462bde338826062.var_89c35eb8c5facced = getdvarint(@"hash_1c2f5c6b8b707647", 5000);
    level.var_9462bde338826062.var_82cdd9a952d2158f = getdvarfloat(@"hash_ae31ab19dc1f419f", 2);
    level.var_9462bde338826062.var_f7dd2c06f9c5e900 = getdvarvector(@"hash_bcf9637617ebff0f", (0, 0, 100));
    level.var_9462bde338826062.var_7f9ddce547423dbb = 21;
    level.var_9462bde338826062.var_5c606368d744097d = 0;
    level.var_20a27cb632a1025 = getdvarint(@"hash_80075250030de146", 1);
    level.var_1ab43167aea344de = [];
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["hvt_accept"] = "mstw_grav_tmrr";
    game["dialog"]["mission_hvt_accept_first_person"] = "mstw_grav_plmr";
    game["dialog"]["mission_hvt_success_third_person"] = "mstw_grav_tmml";
    game["dialog"]["mission_hvt_success_first_person"] = "mstw_grav_plrs";
    game["dialog"]["mission_hvt_success_first_person_crate"] = "mstw_grav_srwr";
    game["dialog"]["mission_hvt_failure"] = "mstw_grav_tmfl";
    game["dialog"]["mission_hvt_eliminated"] = "mstw_grav_tmsr";
    game["dialog"]["mission_hvt_attacker"] = "mstw_grav_plsr";
    data.funcs["onInit"] = &function_56efd5b49cf193c6;
    data.funcs["onTeamAssigned"] = &function_91dd8857cc89dc9d;
    data.funcs["onEnterGulag"] = &function_ca07a6ca5c3c8af5;
    data.funcs["onPlayerRespawn"] = &function_f6755bd234f8e261;
    data.funcs["onPlayerTearDown"] = &function_83d3732a571f142a;
    data.funcs["onPlayerAssimilated"] = &function_75b53ad947495f9c;
    data.funcs["onPlayerKilled"] = &function_a2045d8caf0f792f;
    data.funcs["onPlayerDisconnect"] = &function_319ba124f0ec457c;
    data.funcs["onCancel"] = &function_afd4bf63773cd7ad;
    data.funcs["onTimerExpired"] = &function_ca105fbcfd06afe0;
    data.funcs["onCacheLooted"] = &function_18d88924744a578b;
    data.funcs["onAIKilled"] = &function_21a950b07d1782a1;
    if (getdvarint(@"hash_6507162debbea8b1", 1)) {
        level.var_d26f170f2a84a12d = getdvarint(@"hash_dfb936c58dca50fe", 0) == 1;
        level.var_e0ab98fe607c2c4a = &function_fb2c20ee6af70024;
        level.brgametype.var_18d6d995986ca7be = getdvarint(@"hash_ba328273947a14b9", 3);
        if (!namespace_3c37cb17ade254d::issharedfuncdefined("br_legendary_supply_drop", "legendary_supply_onCrateUse")) {
            namespace_3c37cb17ade254d::registersharedfunc("br_legendary_supply_drop", "legendary_supply_onCrateUse", &namespace_f51c41a139e03299::function_3241afdfec957cb9);
        }
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb80
// Size: 0x5
function function_56efd5b49cf193c6() {
    return 1;
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8d
// Size: 0x26d
function function_91dd8857cc89dc9d() {
    self.category = "vip";
    self.vip = self.var_d154ac2657c5f44;
    self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(1);
    level.var_1ab43167aea344de[level.var_1ab43167aea344de.size] = self.vip;
    createquestobjicon("ui_mp_br_mapmenu_icon_assassin_objective_enemy", "active", self.vip.origin + level.var_9462bde338826062.var_f7dd2c06f9c5e900);
    function_d76cc64b205084a3(self.objectiveiconid, 1);
    viphud_setupvisibility();
    time = level.var_9462bde338826062.time;
    time = function_9b6275085fbcb8f4(time);
    function_5a15174d34f0670c(time);
    thread function_a4907641a754c6a8();
    if (istrue(level.var_20a27cb632a1025)) {
        function_23bade24ba278b75(self.vip);
    }
    teammates = array_remove(getteamdata(self.vip.team, "players"), self.vip);
    displaysplashtoplayers(teammates, "br_vip_quest_start_vip_team");
    displayplayersplash(self.vip, "br_vip_quest_start_tablet_finder");
    var_ac4c51bf033f6323 = [];
    foreach (player in level.players) {
        if (!player namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(player) && player.team != self.vip.team && distance2d(player.origin, self.vip.origin) <= level.var_9462bde338826062.var_89c35eb8c5facced) {
            var_ac4c51bf033f6323[var_ac4c51bf033f6323.size] = player;
        }
    }
    displaysplashtoplayers(var_ac4c51bf033f6323, "br_vip_quest_vip_spawn_alert");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialog("hvt_accept", 1, teammates, undefined, 2, undefined, "dx_br_jpbm_");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_hvt_accept_first_person", self.vip, 1, undefined, 2, undefined, "dx_br_jpbm_");
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe01
// Size: 0x1e
function function_ca07a6ca5c3c8af5(player) {
    if (!function_42a0806457ea8039(player)) {
        hidequestobjiconfromplayer(player);
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe26
// Size: 0x37
function function_f6755bd234f8e261(player) {
    if (!function_42a0806457ea8039(player)) {
        showquestobjicontoplayer(player);
    } else {
        player uiobjectivesetparameter(self.vip getentitynumber());
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe64
// Size: 0xb2
function function_83d3732a571f142a(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        player uiobjectivehide();
        showquestobjicontoplayer(player);
        if (isdefined(self.vip)) {
            if (player == self.vip) {
                if (self.teams[0].size > 0) {
                    displayteamsplash(self.teams[0], "br_vip_quest_failure");
                    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", oldteam, 1, 2);
                }
                self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(0);
                thread function_761664d012e7f359(0, undefined, "Assimilation");
            }
        }
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1d
// Size: 0x6c
function function_75b53ad947495f9c(player, oldteam, newteam) {
    if (newteam == self.teams[0]) {
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
        player uiobjectiveshow("vip");
        player uiobjectivesetparameter(self.vip getentitynumber());
        hidequestobjiconfromplayer(player);
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf90
// Size: 0x22c
function function_a2045d8caf0f792f(attacker, victim) {
    if (isdefined(attacker)) {
        if (function_42a0806457ea8039(attacker)) {
            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_b39bbfef37b546c7");
            thread function_234c4428a084ca58(25);
        }
    }
    if (isdefined(self.vip)) {
        if (victim == self.vip) {
            if (isdefined(attacker)) {
                if (function_42a0806457ea8039(attacker)) {
                    displayteamsplash(self.teams[0], "br_vip_quest_failure");
                    self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(0);
                    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_hvt_failure", self.teams[0], 1, 2);
                    thread function_761664d012e7f359(0, undefined, "Suicide");
                    return;
                }
                rewards = function_6ddd1eecbe562acf("vip" + "_killer", attacker.team, attacker);
                if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                    function_878ebcc241b54505("br_vip_quest_you_killed_the_vip", function_3d262d56274bd22e("vip"), rewards["plunder"], attacker.team);
                }
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("mission_hvt_eliminated", attacker.team, attacker, 1, undefined, 2, undefined, "dx_br_jpbm_");
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_hvt_attacker", attacker, 1, undefined, 2, undefined, "dx_br_jpbm_");
            }
            displayteamsplash(self.teams[0], "br_vip_quest_failure");
            self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(0);
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_hvt_failure", self.teams[0], 1, 2);
            if (getdvarint(@"hash_6925bc8a469c1b7c", 1) == 1) {
                if (!istrue(level.var_d26f170f2a84a12d) || istrue(level.var_d26f170f2a84a12d) && isdefined(attacker) && attacker.team == victim.team) {
                    if (isdefined(level.var_e0ab98fe607c2c4a)) {
                        self thread [[ level.var_e0ab98fe607c2c4a ]](self.vip, 1);
                    }
                }
            }
            thread function_761664d012e7f359(0, undefined, "Killed");
        }
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c3
// Size: 0x7b
function function_319ba124f0ec457c(player) {
    if (isdefined(self.vip)) {
        if (player == self.vip) {
            displayteamsplash(self.teams[0], "br_vip_quest_failure");
            self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(0);
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_hvt_failure", self.teams[0], 1, 2);
            thread function_761664d012e7f359(0, undefined, "Vanished");
        }
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1245
// Size: 0x59
function function_18d88924744a578b(player, type) {
    if (function_42a0806457ea8039(player)) {
        if (type != 2 && type != 6 && !(type >= 7 && type <= 12)) {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_397015fa876e62b2");
            thread function_234c4428a084ca58(10);
        }
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a5
// Size: 0x73
function function_21a950b07d1782a1(player, agent) {
    if (function_42a0806457ea8039(player) && isdefined(agent)) {
        if (agent.basearchetype == "juggernaut") {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_72b19a656fda2ad3");
            thread function_234c4428a084ca58(60);
        } else {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2b7f8b5419ed72e");
            thread function_234c4428a084ca58(10);
        }
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131f
// Size: 0xb5
function function_761664d012e7f359(success, results, var_4048d341197bbe4b) {
    self notify("task_ended");
    level notify("calloutmarkerping_warzoneKillQuestIconGlobal_" + self.objectiveiconid);
    if (istrue(level.var_20a27cb632a1025) && isdefined(self.vip)) {
        self.vip namespace_d20f8ef223912e12::function_96d6b5e51dd4a63b();
    }
    level.var_1ab43167aea344de = array_remove(level.var_1ab43167aea344de, self.vip);
    wait(1);
    self notify("task_ended");
    viphud_deletehud();
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined), results, undefined, var_4048d341197bbe4b);
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13db
// Size: 0x216
function function_ca105fbcfd06afe0() {
    self endon("task_ended");
    level endon("game_ended");
    if (istrue(self.var_bce96a69ec46b30a)) {
        return;
    }
    self.var_bce96a69ec46b30a = 1;
    params = spawnstruct();
    params.intvar = 0;
    rewards = function_d212a5e7a40d7c8d("vip", self.teams[0], self.vip);
    if (isdefined(rewards) && isdefined(rewards["plunder"])) {
        function_878ebcc241b54505("br_vip_quest_complete", function_3d262d56274bd22e("vip"), rewards["plunder"], self.teams[0]);
    }
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "plunder" || istrue(level.maxteamsize == 1)) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("mission_hvt_success_third_person", self.teams[0], self.vip, 1, undefined, 2);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_hvt_success_first_person_crate", self.vip, 1, undefined, 2, undefined, "dx_br_jpbm_");
    } else {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteamexcludeplayer("mission_hvt_success_third_person", self.teams[0], self.vip, 1, undefined, 2);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer("mission_hvt_success_first_person", self.vip, 1, undefined, 2, undefined, "dx_br_jpbm_");
    }
    self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(0);
    foreach (player in getteamdata(self.teams[0], "players")) {
        vip_respawnplayer(player, self.vip, "vip");
    }
    if (isdefined(level.var_e0ab98fe607c2c4a)) {
        self [[ level.var_e0ab98fe607c2c4a ]](self.vip, 1);
    }
    thread function_761664d012e7f359(1, rewards, "Win");
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15f8
// Size: 0x3d
function function_afd4bf63773cd7ad(team) {
    if (istrue(self.teams[0] == team)) {
        self.vip namespace_d3d40f75bb4e4c32::setplayermostwantedextrainfo(0);
        thread function_761664d012e7f359(0, undefined, "Cancel");
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163c
// Size: 0x6a
function function_a4907641a754c6a8() {
    self endon("task_ended");
    self.vip endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        wait(level.var_9462bde338826062.var_82cdd9a952d2158f);
        movequestobjicon(self.vip.origin + level.var_9462bde338826062.var_f7dd2c06f9c5e900);
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ad
// Size: 0xc3
function viphud_setupvisibility() {
    foreach (player in level.players) {
        showquestobjicontoplayer(player);
    }
    foreach (player in getteamdata(self.teams[0], "players")) {
        if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            viphud_showtoplayer(player);
        }
        hidequestobjiconfromplayer(player);
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1777
// Size: 0x37
function viphud_showtoplayer(player) {
    player uiobjectiveshow("vip");
    player uiobjectivesetparameter(self.vip getentitynumber());
    showquestobjicontoplayer(player);
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17b5
// Size: 0x1c
function viphud_hidefromplayer(player) {
    player uiobjectivehide();
    hidequestobjiconfromplayer(player);
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d8
// Size: 0x6c
function viphud_deletehud() {
    foreach (player in getteamdata(self.teams[0], "players")) {
        hidequestobjiconfromplayer(player);
    }
    deletequestobjicon();
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184b
// Size: 0x94
function vip_respawnplayer(player, var_4ac881e2a39322a5, var_df2fbb13c226be75) {
    if (istrue(player.inlaststand)) {
        player namespace_10260b963310d30e::finishreviveplayer("use_hold_revive_success", player);
        return;
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("vipRespawnPlayer")) {
        player thread namespace_71073fa38f11492::runbrgametypefunc("vipRespawnPlayer", var_4ac881e2a39322a5);
        return;
    }
    if (!isalive(player) && !player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        player thread namespace_47fd1e79a44628cd::playergulagautowin("vipRespawn", var_4ac881e2a39322a5);
    } else if (player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        player thread namespace_47fd1e79a44628cd::playerpulloutofgulagwin(var_4ac881e2a39322a5, var_df2fbb13c226be75);
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e6
// Size: 0x22
function function_5f352fb76c54705c() {
    if (isdefined(level.var_1ab43167aea344de)) {
        return array_contains(level.var_1ab43167aea344de, self);
    }
    return undefined;
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1910
// Size: 0x2d5
function function_fb2c20ee6af70024(player, delay) {
    playerorigin = player.origin;
    playerangles = player.angles;
    playerteam = player.team;
    if (isdefined(delay)) {
        wait(delay);
    }
    if (isdefined(player)) {
        playerorigin = player.origin;
        playerangles = player.angles;
        playerteam = player.team;
    }
    forward = anglestoforward(playerangles);
    var_88b83b0d7a43ea72 = randomfloatrange(0, 360);
    offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72) + (0, 200, 0);
    drop_point = getclosestpointonnavmesh(playerorigin + offset);
    crate = namespace_6c578d6ef48f10ef::dropcrate(undefined, playerteam, "legendary_supply_drop", drop_point + (0, 0, 4096), (0, randomfloat(360), 0), drop_point);
    crate.source = "vip_quest";
    crate.skipminimapicon = 1;
    crate.var_8c5ee84d75ab881 = getscriptcachecontents("br_quest_vip_crate", level.var_9462bde338826062.var_5c606368d744097d);
    level.var_9462bde338826062.var_5c606368d744097d = level.var_9462bde338826062.var_5c606368d744097d + 1;
    if (level.var_9462bde338826062.var_5c606368d744097d >= level.var_9462bde338826062.var_7f9ddce547423dbb) {
        level.var_9462bde338826062.var_5c606368d744097d = 0;
    }
    id = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (id > -1) {
        crate setscriptablepartstate("objective_map", "hidden");
        fadestart = getdvarint(@"hash_3f485fe18a08de25", 4921);
        fadeend = getdvarint(@"hash_18160829d60f2e3c", 5906);
        namespace_5a22b6f3a56f7e9b::objective_add_objective(id, "current", crate.origin, "ui_map_icon_supply_drop_yellow");
        objective_addalltomask(id);
        objective_showtoplayersinmask(id);
        objective_setbackground(id, 1);
        objective_onentity(id, crate);
        objective_setzoffset(id, 75);
        objective_setdescription(id, "MP_BR_INGAME/REWARD_ICON_NAME_VIP");
        function_c047d7ffe7a83501(id, fadestart, fadeend);
        function_865f9c5d005f9a08(id, 1);
        crate.var_7b5e5c2bbc8f9f79 = id;
        level.brgametype thread function_a7ae732b33f02a88(crate);
        if (!level.br_circle_disabled) {
            crate thread function_ca2a33089f625649(drop_point);
        }
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bec
// Size: 0x1ee
function function_89dd39b233d0a42d(player) {
    rewards = [];
    var_bcadd51d0cf0c1c3 = randomintrange(0, 10);
    if (var_bcadd51d0cf0c1c3 > 5) {
        rewards[rewards.size] = "brloot_killstreak_supply_sweep";
    } else {
        rewards[rewards.size] = "brloot_killstreak_scramblerdrone";
    }
    if (namespace_36f464722d326bbe::function_beff479639e6508() && getsubgametype() == "plunder") {
        var_2f360e8a02e0a672 = randomintrange(0, 20);
        if (var_2f360e8a02e0a672 > 14) {
            rewards[rewards.size] = "brloot_plunder_cash_uncommon_2";
        } else if (var_2f360e8a02e0a672 > 9) {
            rewards[rewards.size] = "brloot_plunder_cash_uncommon_3";
        } else if (var_2f360e8a02e0a672 > 4) {
            rewards[rewards.size] = "brloot_plunder_cash_rare_1";
        } else {
            rewards[rewards.size] = "brloot_plunder_cash_rare_2";
        }
    }
    rewards[rewards.size] = pickscriptablelootitem("weapon", 4, 4, "mp/loot/br/default/lootset_cache_lege.csv");
    if (namespace_36f464722d326bbe::function_beff479639e6508() && getsubgametype() == "plunder") {
        var_b1f627237929640e = [0:"brloot_self_revive", 1:"brloot_plunder_extract", 2:"brloot_valuable_goldbar"];
    } else if (namespace_36f464722d326bbe::function_beff479639e6508() && getsubgametype() == "zxp") {
        var_b1f627237929640e = [0:"brloot_super_reinforcement_flare", 1:"brloot_self_revive"];
    } else {
        var_b1f627237929640e = [0:"brloot_self_revive", 1:"brloot_equip_gasmask", 2:"brloot_equip_gasmask_durable"];
    }
    rewards[rewards.size] = function_7a2aaa4a09a4d250(var_b1f627237929640e);
    var_28aebe3dd6733ed3 = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(player.primaryweaponobj);
    if (!isdefined(var_28aebe3dd6733ed3)) {
        ammoindex = randomint(5);
        var_28aebe3dd6733ed3 = namespace_3bcd40a3005712ec::function_5a80dba504420037(ammoindex);
    }
    for (i = 0; i < level.brgametype.var_18d6d995986ca7be; i++) {
        rewards[rewards.size] = var_28aebe3dd6733ed3;
    }
    return array_randomize(rewards);
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de2
// Size: 0x3a
function function_a7ae732b33f02a88(crate) {
    level endon("game_ended");
    id = crate.var_7b5e5c2bbc8f9f79;
    while (isdefined(crate)) {
        waitframe();
    }
    crate notify("vip_crate_gas");
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e23
// Size: 0x62
function function_ca2a33089f625649(origin) {
    level endon("game_ended");
    self endon("vip_crate_gas");
    var_b68217195e5cf6d2 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(origin);
    var_6cd08fe827af3392 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_b68217195e5cf6d2);
    wait(var_6cd08fe827af3392);
    if (isdefined(self.var_7b5e5c2bbc8f9f79)) {
        namespace_5a22b6f3a56f7e9b::update_objective_state(self.var_7b5e5c2bbc8f9f79, "active");
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8c
// Size: 0xfd
function function_2410e069c697ba3c(player) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    if (isdefined(self.var_8c5ee84d75ab881)) {
        foreach (item in self.var_8c5ee84d75ab881) {
            if (namespace_1b7e64f50cca9321::canspawnitemname(item)) {
                var_a69fff5222862f26 = level.br_pickups.br_itemrarity[item];
                legendary = 0;
                if (isdefined(var_a69fff5222862f26) && var_a69fff5222862f26 == 4) {
                    legendary = 1;
                }
                namespace_1b7e64f50cca9321::lootspawnitem(item, dropstruct, self.origin, self.angles, 0, legendary);
            }
        }
    }
    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_f396d39fee1a8054");
    player playsoundtoplayer("uin_loot_container_open_epic", player);
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f90
// Size: 0x42
function function_23bade24ba278b75(player) {
    var_67572a1be4aee419 = namespace_f8065cafc523dba5::isinvehicle();
    if (!istrue(var_67572a1be4aee419)) {
        player namespace_d20f8ef223912e12::function_8d739ec62c568c41("prop_zc_game_flag");
    }
    thread function_27a664f8e34cadd7(var_67572a1be4aee419, player);
    thread function_2d8bc1d8c7610a55(player);
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd9
// Size: 0x5e
function function_27a664f8e34cadd7(var_67572a1be4aee419, player) {
    level endon("game_ended");
    self endon("task_ended");
    player endon("death_or_disconnect");
    while (1) {
        if (!istrue(var_67572a1be4aee419)) {
            player waittill("vehicle_enter");
            player namespace_d20f8ef223912e12::function_96d6b5e51dd4a63b();
        }
        player waittill("vehicle_exit");
        var_67572a1be4aee419 = 0;
        player namespace_d20f8ef223912e12::function_8d739ec62c568c41("prop_zc_game_flag");
    }
}

// Namespace namespace_9f2f697417dcb948/namespace_b5b2280a66414fff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203e
// Size: 0x2a
function function_2d8bc1d8c7610a55(player) {
    self endon("task_ended");
    player endon("death_or_disconnect");
    level waittill("game_ended");
    player namespace_d20f8ef223912e12::function_96d6b5e51dd4a63b();
}

