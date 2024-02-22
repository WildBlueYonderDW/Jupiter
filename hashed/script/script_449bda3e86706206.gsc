// mwiii decomp prototype
#using scripts\common\system.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_135f13d8aa1c1f19;
#using script_728ffcee8cbf30ee;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_14183df6f9af8737;

#namespace namespace_8559d2200e7e7e86;

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x508
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"hash_aac69daa141f3582", undefined, undefined, &post_main);
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x529
// Size: 0x2e
function post_main() {
    if (!isdefined(level.brgametype)) {
        return;
    }
    if (!getdvarint(@"hash_a70128f4b0902d43", 1)) {
        return;
    }
    level thread function_7ae6edf4f40ff33e();
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e
// Size: 0x54
function function_7ae6edf4f40ff33e() {
    level endon("game_ended");
    namespace_3c37cb17ade254d::flag_wait("StartGameTypeCallbackFinished");
    if (!isdefined(level.arrow) || !isdefined(level.arrow.var_9a8c945fe45c8e5)) {
        return;
    }
    function_ccacfdcc7aa6b6d7();
    setupcallbacks();
    level thread inittablets();
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b9
// Size: 0x1ea
function function_ccacfdcc7aa6b6d7() {
    level.arrow.var_9a8c945fe45c8e5.var_29781e8c0705dbdb = -1;
    if (!isdefined(level.arrow.props.elements)) {
        level.arrow.props.elements = [];
    }
    level.elitechain = spawnstruct();
    level.elitechain.var_60c7e4332d6e6faa = getdvarfloat(@"hash_70ef135fc04c3389", 10);
    level.elitechain.var_496b8acd2c121c7b = getdvarfloat(@"hash_ac014bb205a8be1b", 4);
    level.elitechain.var_1af44a4462b37a27 = getdvarint(@"hash_bd9d409f92df1acb", 0);
    level.elitechain.var_857ad197f58d4fe0 = getdvarfloat(@"hash_c925212317237c46", 5);
    level.elitechain.var_fc6add02cc658030 = getdvarint(@"hash_874611dd811f8821", 1);
    level.elitechain.var_260b7b6b4cd0cf49 = getdvarint(@"hash_a5e032420010e148", 1);
    level.elitechain.var_70aafcc7a8564bd9 = getdvarint(@"hash_23744d43aae71c76", 1);
    level.elitechain.var_e64d3f0018062c87 = getdvarint(@"hash_946e55d2825f379c", 0);
    level.arrow.var_9a8c945fe45c8e5.var_85ee4754325bc510 = level.arrow.var_9a8c945fe45c8e5.var_91b307624076699a * (level.elitechain.var_e64d3f0018062c87 + 1);
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7aa
// Size: 0xa8
function setupcallbacks() {
    namespace_3c37cb17ade254d::registersharedfunc("eliteChain", "addEliteQuestChain", &addelitequestchain);
    namespace_71073fa38f11492::registerbrgametypefunc("eliteWatchTeamWipe", &function_7b7833feb6645dee);
    foreach (element in level.arrow.var_d43e1b169e506f3b) {
        scriptablename = element.var_f391bf01090b356c;
        level.var_5635125e56693c8[scriptablename] = &function_789dccede398d698;
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x859
// Size: 0xb6
function inittablets() {
    level endon("game_ended");
    namespace_6c622b52017c6808::function_ef0d52837c9e7954();
    waitframe();
    if (!isdefined(level.arrow.props) || !isdefined(level.arrow.props.var_e0d1e3a2b6f5323a)) {
        return;
    }
    foreach (tablet in level.arrow.props.var_e0d1e3a2b6f5323a) {
        tablet function_742e94df649bd24();
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x916
// Size: 0x14
function addelitequestchain(tablet) {
    tablet function_742e94df649bd24();
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x931
// Size: 0x3a
function function_742e94df649bd24() {
    tablet = self;
    tablet function_8fb6c06939b794d7("elite", &function_3ecdcdbc9f0b5fe0, &function_ce5b38ccbacff64, &function_d6a940bdd49c18ca, &function_cede041f1b6728e0, &function_d75b66b46e0f7273, &function_6091d72afc11f381);
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x972
// Size: 0x59
function function_906171e231788d8c(index) {
    task = self.task;
    if (!isdefined(task) || !isdefined(task.var_e6729ba173f5634a)) {
        logstring("elite_chain::tabletSetQuestChainIndex - invalid task without a quest chain!");
        return;
    }
    task.var_e6729ba173f5634a.index = index;
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d2
// Size: 0x59
function function_84ca8e2e2b054149(count) {
    task = self.task;
    if (!isdefined(task) || !isdefined(task.var_e6729ba173f5634a)) {
        logstring("elite_chain::tabletSetDropCount - invalid task without a quest chain!");
        return;
    }
    task.var_e6729ba173f5634a.dropcount = count;
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa32
// Size: 0x16
function function_3ecdcdbc9f0b5fe0(team) {
    function_b550bb18a012e142(team, 1);
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4f
// Size: 0x68
function function_ce5b38ccbacff64(team) {
    var_e6729ba173f5634a = level.var_81e77c935dfefd11.var_d8daebc51dd41288[team];
    if (isdefined(var_e6729ba173f5634a)) {
        index = var_e6729ba173f5634a.index + 1;
        function_e17d51f3f2435d87(team, index);
        logstring("elite_chain::onChainContinue - moving to index: " + index + " " + team);
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabe
// Size: 0x63
function function_d6a940bdd49c18ca(team, success) {
    if (istrue(success)) {
        function_cafda4ae3a3fef17(team);
        function_e17d51f3f2435d87(team, 0);
        function_b550bb18a012e142(team, 3);
        logstring("elite_chain::onChainEnd - success! " + team);
    } else {
        function_e17d51f3f2435d87(team, 0);
        function_b550bb18a012e142(team, 0);
        logstring("elite_chain::onChainEnd - failure! " + team);
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28
// Size: 0x7b
function function_cede041f1b6728e0(team) {
    level endon("game_ended");
    teaminfo = level.arrow.teaminfo[team];
    if (!isdefined(teaminfo)) {
        return;
    }
    logstring("elite_chain::onChainWait - start!" + team);
    function_b550bb18a012e142(team, 2);
    wait(level.var_81e77c935dfefd11.waittime);
    function_b550bb18a012e142(team, 1);
    logstring("elite_chain::onChainWait - end! " + team);
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbaa
// Size: 0x3a
function function_d75b66b46e0f7273(team, rewardorigin, rewardangles) {
    element = function_f517a8eefb0eb61a(team);
    function_cc25131864fa213c(team, rewardorigin, rewardangles, element, undefined);
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbeb
// Size: 0x33
function function_6091d72afc11f381(team, success) {
    if (istrue(level.arrow.defused)) {
        function_7f492ecaca596834(team);
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc25
// Size: 0x94
function function_789dccede398d698(instance, player) {
    scriptable = instance.instance;
    if (!isdefined(scriptable)) {
        return;
    }
    element = scriptable.var_84b9876dbe3b246c;
    if (!isdefined(element)) {
        return;
    }
    if (!istrue(element.firstpickup)) {
        return;
    }
    var_e6729ba173f5634a = level.var_81e77c935dfefd11.var_d8daebc51dd41288[player.team];
    if (isdefined(var_e6729ba173f5634a)) {
        var_e6729ba173f5634a notify("reward_pickup", instance);
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc0
// Size: 0xa0
function function_7b7833feb6645dee(teaminfo, reason) {
    if (!isdefined(reason) || reason == "arrow_player_removed") {
        return 0;
    }
    bombsite = level.arrow.props.bombsite;
    if (!isdefined(bombsite)) {
        return;
    }
    if (istrue(bombsite.var_27db4eb198cd48b9) && teaminfo.state == 5) {
        level thread function_cdcf6d5075e1b64b(teaminfo);
        return 1;
    } else if (teaminfo.state <= 1) {
        function_2bc410bebeaf0563(teaminfo);
    }
    return 0;
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd68
// Size: 0x7f
function function_cdcf6d5075e1b64b(teaminfo) {
    level endon("game_ended");
    if (isdefined(level.arrow.props.bombsite)) {
        level.arrow.props.bombsite.var_637d1a5641c93a63 = 1;
    }
    teaminfo function_56ee84f1b091647a();
    showsplashtoall("elite_arrow_team_wipe", undefined, undefined, undefined, undefined, undefined);
    teaminfo notify("team_info_watch");
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdee
// Size: 0x5d
function function_cafda4ae3a3fef17(team) {
    if (istrue(level.elitechain.var_260b7b6b4cd0cf49)) {
        function_c4516dcf97c05302();
    }
    if (istrue(level.elitechain.var_70aafcc7a8564bd9)) {
        level thread function_9635bbd80a84f4de();
    }
    level thread function_8d2d39fe82922d67(team);
    level thread function_637768bc790b225a();
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe52
// Size: 0x6a
function function_637768bc790b225a() {
    if (!isdefined(level.arrow.props.bombsite)) {
        return;
    }
    bombsite = level.arrow.props.bombsite;
    bombsite endon("death");
    level endon("game_ended");
    bombsite waittill("arm_complete");
    function_4cdb704e5b9db9a3();
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec3
// Size: 0x43
function function_4cdb704e5b9db9a3() {
    if (istrue(level.elitechain.var_1af44a4462b37a27)) {
        level thread function_3968164f6abf1a5d();
    }
    if (istrue(level.elitechain.var_fc6add02cc658030)) {
        level thread function_8a5ac39dc68fccd1();
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0d
// Size: 0xbb
function function_7f492ecaca596834(team) {
    if (!isdefined(level.arrow.props.bombsite)) {
        return;
    }
    defuser = level.arrow.props.bombsite.var_c6b73e1a1d773f72;
    if (!isdefined(defuser)) {
        return;
    }
    if (isdefined(game["dialog"]["arrow_defused_extract"])) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("arrow_defused_extract", defuser.team, undefined, 2);
    }
    level thread endgame(defuser.team, game["end_reason"]["nuke_end"], undefined, 0, 1);
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfcf
// Size: 0x190
function function_2bc410bebeaf0563(teaminfo) {
    if (!function_73689348205a9057(teaminfo.targetteam)) {
        return;
    }
    var_e6729ba173f5634a = function_c6ec58a3c19cd74d(teaminfo.targetteam);
    dropcount = var_e6729ba173f5634a.dropcount;
    if (dropcount >= level.elitechain.var_e64d3f0018062c87) {
        logstring("elite_chain::handleEliteTabletDrop - drop count limit reached, not dropping a new CQ tablet!");
        return;
    }
    spawnorigin = teaminfo function_50b388aa83aeca2c();
    spawnorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(spawnorigin, 50);
    tablet = namespace_6c622b52017c6808::function_3ff56f0ba058501a(spawnorigin, (0, 0, 0));
    showsplashtoallexceptteam(teaminfo.targetteam, "elite_arrow_dropped_tablet", undefined, undefined, undefined, undefined, undefined);
    tablet function_742e94df649bd24();
    tablet function_906171e231788d8c(var_e6729ba173f5634a.index - 1);
    tablet function_84ca8e2e2b054149(dropcount + 1);
    tablet.task.var_52edd3735575f1cb = 1;
    foreach (player in level.players) {
        tablet.task.var_3f9147d423834fc2 showtoplayer(player);
        tablet enablescriptableplayeruse(player);
    }
    logstring("elite_chain::handleEliteTabletDrop - dropping a new CQ tablet off of a team wipe! " + spawnorigin);
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1166
// Size: 0x36
function function_8a5ac39dc68fccd1() {
    level endon("game_ended");
    if (level.elitechain.var_857ad197f58d4fe0 > 0) {
        wait(level.elitechain.var_857ad197f58d4fe0);
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a3
// Size: 0xdb
function function_3968164f6abf1a5d() {
    level endon("game_ended");
    if (level.elitechain.var_496b8acd2c121c7b > 0) {
        wait(level.elitechain.var_496b8acd2c121c7b);
    }
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("circleTimer");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("mayConsiderPlayerDead");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("triggerRespawnOverlay");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("playerNakedDropLoadout");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("getDefaultLoadout");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("playerDropBonuses");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("playerKilledSpawn");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("markPlayerAsEliminatedOnKilled");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("assignLastStandAttacker");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("kioskRevivePlayer");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("dropOnPlayerDeath");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("vipRespawnPlayer");
    namespace_71073fa38f11492::function_ec416fa15d5fa6af("onPlayerKilled");
    level thread namespace_6176022cc9d5b3f::function_d7a7aa9ee1cc1071();
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1285
// Size: 0x14
function function_9635bbd80a84f4de() {
    level endon("game_ended");
    level.var_db78248e94853165 = undefined;
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a0
// Size: 0xb5
function function_8d2d39fe82922d67(team) {
    level endon("game_ended");
    if (level.elitechain.var_60c7e4332d6e6faa > 0) {
        wait(level.elitechain.var_60c7e4332d6e6faa);
    }
    teaminfo = level.arrow.teaminfo[team];
    if (isdefined(teaminfo) && isdefined(level.arrow.props.bombsite)) {
        level.arrow.props.bombsite function_29bb7de765f0c591(teaminfo.champion);
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135c
// Size: 0x7d
function function_b550bb18a012e142(team, status) {
    teammates = getteamdata(team, "players");
    foreach (player in teammates) {
        player setclientomnvar("ui_br_elite_quest_chain_status", status);
    }
}

// Namespace namespace_8559d2200e7e7e86/namespace_2c0e84fc96f7dc98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e0
// Size: 0x7d
function function_e17d51f3f2435d87(team, var_5e9b1036a4cae82f) {
    teammates = getteamdata(team, "players");
    foreach (player in teammates) {
        player setclientomnvar("ui_br_elite_quest_chain_progress", var_5e9b1036a4cae82f);
    }
}

