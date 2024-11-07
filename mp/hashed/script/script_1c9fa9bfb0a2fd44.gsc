#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using script_c00335a7aeb2728;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gameobjects.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_a2ca09079a35239f;

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x64c
// Size: 0x4b7
function getcontractdata(data) {
    if (getdvarint(@"hash_2285359fe82b0c32", 0)) {
        data.enabled = 0;
        return;
    }
    level.var_d6ae5cc7b162c730 = spawnstruct();
    var_ad60abb5340e959d = getdvarint(@"hash_acdc5ce16ecc02d0", 0);
    level.var_d6ae5cc7b162c730.questmaxtime = var_ad60abb5340e959d != 0 ? var_ad60abb5340e959d : function_ea591c2a379e3424("intel");
    level.var_d6ae5cc7b162c730.var_7f9f1e2eaa06d964 = 0;
    level.var_d6ae5cc7b162c730.var_8f47b7e23761e59b = 21;
    level.var_d6ae5cc7b162c730.domcapturetime = getdvarint(@"hash_d10426d97130e8c6", 20);
    level.var_d6ae5cc7b162c730.var_5f4a68d8fb9f45dd = getdvarint(@"hash_45924eaa4893905", 256);
    level.var_d6ae5cc7b162c730.var_f7c654680776ad51 = getdvarfloat(@"hash_243ca292ce24d785", 3);
    level.var_d6ae5cc7b162c730.uploadmaxdist = getdvarint(@"hash_7dd5a957f5239d17", 9843);
    level.var_d6ae5cc7b162c730.var_39974c65a006a4bf = getdvarint(@"hash_94ddfbb79f6a4b9d", 4724);
    level.var_d6ae5cc7b162c730.var_336b7f22eccd99a5 = getdvarint(@"hash_f9f88743e5fac753", 7874);
    level.var_d6ae5cc7b162c730.var_983590df9b7304d1 = getdvarfloat(@"hash_8702bc70726b6d6e", 30);
    level.var_d6ae5cc7b162c730.var_4ada32e3d3f08a0d = getdvarint(@"hash_ae75e0c5bcbd4650", 1000);
    level.var_d6ae5cc7b162c730.var_30326e6a2f443451 = level.var_d6ae5cc7b162c730.var_4ada32e3d3f08a0d * level.var_d6ae5cc7b162c730.var_4ada32e3d3f08a0d;
    level.var_d6ae5cc7b162c730.var_c7fabbf8ba74055d = getdvarfloat(@"hash_b8256b398cfe55de", 30);
    level.var_d6ae5cc7b162c730.var_1949b6e747ca100 = function_581d908c1d397d4d();
    namespace_e1bfa87a2a692d3c::function_7828c1afe3365dd2();
    level thread function_1d91a7e7cd5c459();
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("dmz_upload_station", &function_c75bd0f88a8e39be);
    function_d6b99ccf87941a5a(&function_c1a7a6a8e7fd451b);
    data.funcs["onInit"] = &function_8c64a4f648288a95;
    data.funcs["onShowAgain"] = &function_86cfd4337fedf826;
    data.funcs["onTeamAssigned"] = &function_921a0be9ec330c6a;
    data.funcs["onEnterGulag"] = &function_ca07a6ca5c3c8af5;
    data.funcs["onPlayerRespawn"] = &function_f6755bd234f8e261;
    data.funcs["onPlayerKilled"] = &quest_onplayerkilled;
    data.funcs["onMarkPlayerAsEliminated"] = &function_4f702ea532a7ca6e;
    data.funcs["onPlayerDisconnect"] = &quest_onplayerdisconnect;
    data.funcs["onCancel"] = &quest_oncancel;
    data.funcs["onPlayerTearDown"] = &function_83d3732a571f142a;
    data.funcs["onPlayerAssimilated"] = &function_75b53ad947495f9c;
    data.funcs["circleTick"] = &function_bcdfe083cc8168d7;
    data.funcs["onTimerExpired"] = &function_a80693d6d6f626dc;
    data.funcs["onFinishContract"] = &function_68046efe0486e9b;
    data.basetime = level.var_d6ae5cc7b162c730.questmaxtime;
    assert(isdefined(game["<dev string:x1c>"]));
    game["dialog"]["mission_intel_success"] = "xtrc_grav_msug";
    game["dialog"]["mission_intel_success_generic"] = "xtrc_grav_msnc";
    game["dialog"]["mission_intel_start_first_person"] = "xtrc_grav_msgs";
    game["dialog"]["mission_intel_start"] = "xtrc_grav_tmng";
    game["dialog"]["mission_intel_start_first_person_generic"] = "xtrc_grav_msnl";
    game["dialog"]["mission_intel_start_generic"] = "xtrc_grav_tnsc";
    game["dialog"]["mission_intel_time_expired"] = "xtrc_grav_tmlr";
    game["dialog"]["mission_intel_upload"] = "xtrc_grav_tmpl";
    game["dialog"]["mission_intel_upload_first_person"] = "xtrc_grav_plyp";
    /#
        if (getdvarint(@"hash_2ef1a3a06d9aa416", 0)) {
            level thread function_26254729370d8e3e();
        }
    #/
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb0b
// Size: 0x6e
function function_8c64a4f648288a95() {
    if (!getdvarint(@"hash_40174ae61f584d73", 1)) {
        return false;
    }
    self.var_265cf6f9f157ad08 = self.tablet function_5827342a45eaf2aa();
    if (!isdefined(self.var_265cf6f9f157ad08)) {
        return false;
    }
    self.var_265cf6f9f157ad08.tasks = array_add_safe(self.var_265cf6f9f157ad08.tasks, self);
    return true;
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb82
// Size: 0x3
function function_86cfd4337fedf826() {
    return false;
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8e
// Size: 0x220
function function_921a0be9ec330c6a() {
    self.category = "intel";
    time = level.var_d6ae5cc7b162c730.questmaxtime;
    uiobjectiveshowtoteam("intel_upload", self.teams[0]);
    time = function_9b6275085fbcb8f4(time);
    function_5a15174d34f0670c(time);
    self.domflag = self.var_265cf6f9f157ad08.domflag;
    self.questcircles = [];
    self.var_bf7f7683ea10da26 = &function_aa30a0b07502a038;
    intel_start();
    if (istrue(self.var_265cf6f9f157ad08.setup)) {
        self.domflag = self.var_265cf6f9f157ad08.flag;
        self.domflag.tasks[self.domflag.tasks.size] = self;
    } else {
        thread namespace_e1bfa87a2a692d3c::function_443a192943945265(self.var_265cf6f9f157ad08, level.var_d6ae5cc7b162c730.var_f7c654680776ad51);
        self.var_265cf6f9f157ad08.domflag function_57257d1ed9ce2f48(&function_da92a1fef510a088);
    }
    self.unlocked = 0;
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "plunder") {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteamexcludeplayer("mission_intel_start_generic", self.teams[0], self.var_d154ac2657c5f44, 1, undefined, 2, undefined, "dx_br_jpbm_");
        level thread scripts\mp\gametypes\br_public::brleaderdialogplayer("mission_intel_start_first_person_generic", self.var_d154ac2657c5f44, 1, undefined, 2, undefined, "dx_br_jpbm_");
    } else {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteamexcludeplayer("mission_intel_start", self.teams[0], self.var_d154ac2657c5f44, 1, undefined, 2, undefined, "dx_br_jpbm_");
        level thread scripts\mp\gametypes\br_public::brleaderdialogplayer("mission_intel_start_first_person", self.var_d154ac2657c5f44, 1, undefined, 2, undefined, "dx_br_jpbm_");
    }
    /#
        if (getdvarint(@"hash_4792ebf055d09082", 0)) {
            thread function_709f4a6846f9f8e6(self.domflag, self.teams[0]);
        }
    #/
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdb6
// Size: 0x4b
function function_ca07a6ca5c3c8af5(player) {
    if (function_42a0806457ea8039(player)) {
        if (isdefined(self.objidnum) && self.objidnum != -1) {
            scripts\mp\objidpoolmanager::objective_playermask_hidefrom(self.objidnum, player);
        }
        self notify("foreceUpdateTeamDistance");
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe09
// Size: 0x4b
function function_f6755bd234f8e261(player) {
    if (function_42a0806457ea8039(player)) {
        if (isdefined(self.objidnum) && self.objidnum != -1) {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.objidnum, player);
        }
        self notify("foreceUpdateTeamDistance");
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe5c
// Size: 0x1b
function quest_onplayerkilled(attacker, victim) {
    function_1274e747e767a78f(victim);
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe7f
// Size: 0x13
function function_4f702ea532a7ca6e(victim) {
    function_1274e747e767a78f(victim);
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe9a
// Size: 0x13
function quest_onplayerdisconnect(player) {
    function_1274e747e767a78f(player);
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeb5
// Size: 0x2b
function quest_oncancel(team) {
    if (istrue(self.teams[0] == team)) {
        function_cd0f560fad2e9cb6(0, undefined, undefined, "Cancel");
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee8
// Size: 0x6f
function function_1274e747e767a78f(player) {
    if (player.team == self.teams[0]) {
        filter = namespace_1eb3c4e0e28fac71::function_94a8dc26f5353759(player, level.contractmanager.defaultfilter);
        if (!scripts\mp\gametypes\br_quest_util::isteamvalid(self.teams[0], filter)) {
            function_cd0f560fad2e9cb6(0, undefined, undefined, "Killed");
        }
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf5f
// Size: 0x127
function function_83d3732a571f142a(player, oldteam, newteam) {
    if (oldteam == self.teams[0]) {
        if (isdefined(self.domflag)) {
            self.domflag disablescriptableplayeruse(player);
        }
        if (isdefined(self.objidnum) && self.objidnum != -1) {
            objective_removeclientfrommask(self.objidnum, player);
        }
        player uiobjectivehide();
        if (!scripts\mp\gametypes\br_quest_util::isteamvalid(self.teams[0], level.contractmanager.defaultfilter)) {
            playersonteam = getteamdata(self.teams[0], "players");
            namespace_e1bfa87a2a692d3c::function_1ca101629b43a466(playersonteam);
            foreach (player in playersonteam) {
                self.domflag disablescriptableplayeruse(player);
            }
            thread quest_complete(0, undefined, "Assimilation");
        }
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x108e
// Size: 0xa5
function function_75b53ad947495f9c(player, oldteam, newteam) {
    if (newteam == self.teams[0]) {
        player uiobjectiveshow("intel_upload");
        if (isdefined(self.domflag) && !istrue(self.uploading)) {
            self.domflag enablescriptableplayeruse(player);
        }
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
        if (isdefined(self.objidnum) && self.objidnum != -1) {
            objective_addclienttomask(self.objidnum, player);
        }
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x113b
// Size: 0xa0
function function_bcdfe083cc8168d7(var_819edacdacb810e4, var_52d59c928eb97c81) {
    if (istrue(self.var_df2a5e89c3bba966)) {
        return;
    }
    if (isdefined(self.var_265cf6f9f157ad08)) {
        if (!istrue(self.uploading) || !istrue(self.var_265cf6f9f157ad08.domflag.playersintrigger.size > 0)) {
            if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(self.var_265cf6f9f157ad08.origin)) {
                self.var_df2a5e89c3bba966 = 1;
                function_cd0f560fad2e9cb6(1, "br_intel_quest_obj_circle", "mission_obj_circle_fail", "Circle");
            }
        }
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x11e3
// Size: 0xfe
function function_cd0f560fad2e9cb6(var_bef2d73950379fa0, splashref, voiceref, endstate, prefixoverride) {
    teamname = self.teams[0];
    playersonteam = getteamdata(teamname, "players");
    namespace_e1bfa87a2a692d3c::function_1ca101629b43a466(playersonteam);
    foreach (player in playersonteam) {
        self.domflag disablescriptableplayeruse(player);
    }
    if (istrue(var_bef2d73950379fa0)) {
        params = spawnstruct();
        params.intvar = 0;
        displayteamsplash(teamname, splashref, params);
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam(voiceref, teamname, 1, 2, undefined, prefixoverride);
    }
    thread quest_complete(0, undefined, endstate);
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12e9
// Size: 0x1cb
function function_aa30a0b07502a038(teamname) {
    missionid = getquestindex("intel_upload");
    displaysquadmessagetoteam(teamname, self.capturingplayer, 8, missionid);
    if (scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5() == "plunder") {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_intel_success_generic", teamname, 1, 2, undefined);
    } else {
        level thread scripts\mp\gametypes\br_public::brleaderdialogteam("mission_intel_success", teamname, 1, 2, undefined, "dx_br_jpbm_");
    }
    forwardvector = anglestoforward(self.var_265cf6f9f157ad08.angles);
    self.rewardorigin = self.var_265cf6f9f157ad08.origin + forwardvector * 20 + (0, 0, 10);
    self.rewardangles = self.var_265cf6f9f157ad08.angles + (0, -100, 0);
    self.result = "success";
    if (getdvarint(@"hash_8c8552d204629dda", 1)) {
        items = getscriptcachecontents("br_intel_drop", level.var_d6ae5cc7b162c730.var_7f9f1e2eaa06d964);
        level.var_d6ae5cc7b162c730.var_7f9f1e2eaa06d964 += 1;
        if (level.var_d6ae5cc7b162c730.var_7f9f1e2eaa06d964 >= level.var_d6ae5cc7b162c730.var_8f47b7e23761e59b) {
            level.var_d6ae5cc7b162c730.var_7f9f1e2eaa06d964 = 0;
        }
        scripts\mp\gametypes\br_quest_util::questrewarddropitems(teamname, items, self.rewardorigin, self.rewardangles, 1, 3, 0);
    }
    function_68046efe0486e9b(self, undefined, teamname);
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14bc
// Size: 0x10b
function function_68046efe0486e9b(contract, instance, team) {
    playersonteam = getteamdata(team, "players");
    contract namespace_e1bfa87a2a692d3c::function_1ca101629b43a466(playersonteam);
    foreach (player in playersonteam) {
        contract.domflag disablescriptableplayeruse(player);
    }
    rewards = function_d212a5e7a40d7c8d("intel", team, contract.var_265cf6f9f157ad08, contract);
    if (isdefined(rewards) && isdefined(rewards["plunder"])) {
        splashref = function_4bcd7c36b22b9bec("br_intel_quest_complete");
        function_878ebcc241b54505(splashref, function_3d262d56274bd22e("intel"), rewards["plunder"], team);
    }
    waitframe();
    contract thread quest_complete(1, rewards, "Win");
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15cf
// Size: 0x6b
function quest_complete(b_success, results, endstate) {
    self notify("task_ended");
    self.ended = 1;
    wait 1;
    self.objectiveiconid = self.objidnum;
    deletequestobjicon();
    endcontract(ter_op(istrue(b_success), self.teams[0], undefined), results, undefined, endstate);
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1642
// Size: 0x5c
function function_a80693d6d6f626dc() {
    if (istrue(self.uploading) && istrue(self.var_265cf6f9f157ad08.domflag.playersintrigger.size > 0)) {
        wait 5;
        function_51d3a2b4cde79545();
        return;
    }
    function_cd0f560fad2e9cb6(1, "br_intel_quest_timer_expired", "mission_intel_time_expired", "Time", "dx_br_jpbm_");
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a6
// Size: 0x1ed
function intel_start() {
    uploadstruct = self.var_265cf6f9f157ad08;
    teamname = self.teams[0];
    self.curorigin = uploadstruct.domflag.origin;
    self.offset3d = (0, 0, 50);
    scripts\mp\gameobjects::requestid(1, 1, undefined, 1);
    uploadstruct.curorigin = uploadstruct.domflag.origin;
    uploadstruct.offset3d = (0, 0, 50);
    uploadstruct scripts\mp\gameobjects::requestid(1, 1, undefined, 1);
    self.icon = uploadstruct.objidnum;
    iconposition = self.var_265cf6f9f157ad08.domflag.origin + (0, 0, 70);
    function_c4abd8bfac50b27d(teamname, iconposition);
    uploadstruct function_c4abd8bfac50b27d(teamname, iconposition);
    objective_removeallfrommask(self.objidnum);
    thread function_425f0abdafad5a76(self.objidnum, teamname);
    scripts\mp\objidpoolmanager::function_9cad42ac02eff950(self.icon);
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("secure_intel_assigned", teamname);
    splashref = function_4bcd7c36b22b9bec("br_intel_quest_start_team");
    level thread scripts\mp\gametypes\br::teamsplashbr(splashref, self.var_d154ac2657c5f44, teamname);
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        uploadstruct.domflag enablescriptableplayeruse(player);
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x189b
// Size: 0x43
function function_7ffa6d379ea1165d(f_delay) {
    level endon("game_ended");
    if (isdefined(f_delay) && f_delay > 0) {
        wait f_delay;
    }
    if (isdefined(self.harddrive)) {
        self.harddrive freescriptable();
    }
    self freescriptable();
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18e6
// Size: 0x96
function function_c4abd8bfac50b27d(teamname, pos) {
    if (isdefined(self.objidnum) && self.objidnum != -1) {
        objective_icon(self.objidnum, "ui_map_icon_obj_intel");
        objective_position(self.objidnum, pos);
        function_da291c5bfe4a2469(teamname, self.objidnum);
        objective_showtoplayersinmask(self.objidnum);
        function_9427cb5974c925d9(self.objidnum, 1);
        objective_setbackground(self.objidnum, 4);
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1984
// Size: 0x133
function function_c1a7a6a8e7fd451b(swapname, swapstate, hintduration) {
    var_6f52ec16d42ecdad = [];
    foreach (domnode in level.var_d6ae5cc7b162c730.var_1949b6e747ca100) {
        if (function_2fa9202bce90f090(domnode.origin, swapname, swapstate)) {
            if (isdefined(domnode.tasks)) {
                foreach (task in domnode.tasks) {
                    if (isdefined(task.tablet)) {
                        task.tablet thread namespace_1eb3c4e0e28fac71::tablethide(1);
                    }
                }
            }
            continue;
        }
        var_6f52ec16d42ecdad[var_6f52ec16d42ecdad.size] = domnode;
    }
    level.var_d6ae5cc7b162c730.var_1949b6e747ca100 = var_6f52ec16d42ecdad;
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1abf
// Size: 0x85
function function_da92a1fef510a088() {
    domflag = self;
    if (isdefined(domflag.tasks)) {
        foreach (task in domflag.tasks) {
            if (isdefined(task)) {
                task function_cd0f560fad2e9cb6(0, undefined, "mission_gen_fail", "AreaSwap");
            }
        }
    }
    return true;
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4d
// Size: 0x9d
function function_da291c5bfe4a2469(team, objidnum) {
    players = getteamdata(team, "players");
    foreach (player in players) {
        if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
            continue;
        }
        if (player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag()) {
            continue;
        }
        if (isdefined(objidnum) && objidnum != -1) {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(objidnum, player);
        }
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf2
// Size: 0x17c
function function_581d908c1d397d4d() {
    var_7626533fb4b71334 = [];
    if (getdvarint(@"hash_1e2961625b57e559", 1)) {
        var_7626533fb4b71334 = getstructarray("intel_upload_station", "targetname");
    }
    if (level.mapname == "mp_br_mechanics" || level.mapname == "mp_jup_br_mechanics") {
        var_7626533fb4b71334 = [];
        var_7626533fb4b71334 = array_add(var_7626533fb4b71334, function_54e178c1343a8cbf((-471, -1886, 58), (0, 180, 0)));
        var_7626533fb4b71334 = array_add(var_7626533fb4b71334, function_54e178c1343a8cbf((-367, -811, 58), (0, 180, 0)));
        var_7626533fb4b71334 = array_add(var_7626533fb4b71334, function_54e178c1343a8cbf((704, -2767, 58), (0, 270, 0)));
        var_7626533fb4b71334 = array_add(var_7626533fb4b71334, function_54e178c1343a8cbf((1970, -4096, 58), (0, 270, 0)));
        var_7626533fb4b71334 = array_add(var_7626533fb4b71334, function_54e178c1343a8cbf((3077, -2300, 58), (0, 180, 0)));
        var_7626533fb4b71334 = array_add(var_7626533fb4b71334, function_54e178c1343a8cbf((2935, 59, 58), (0, 0, 0)));
        var_7626533fb4b71334 = array_add(var_7626533fb4b71334, function_54e178c1343a8cbf((5015, -674, 58), (0, 0, 0)));
    }
    return var_7626533fb4b71334;
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d77
// Size: 0x3f
function function_54e178c1343a8cbf(origin, angles) {
    var_48a52c8d018d3159 = spawnstruct();
    var_48a52c8d018d3159.origin = origin;
    var_48a52c8d018d3159.angles = angles;
    return var_48a52c8d018d3159;
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dbf
// Size: 0x14f
function function_1d91a7e7cd5c459() {
    scripts\mp\flags::gameflagwait("prematch_fade_done");
    foreach (domnode in level.var_d6ae5cc7b162c730.var_1949b6e747ca100) {
        v_origin = getgroundposition(domnode.origin, 1);
        var_724c2e48c804b73e = default_to(domnode.angles, (0, 0, 0));
        domnode.angles = var_724c2e48c804b73e;
        if (!isdefined(domnode.domflag)) {
            domnode.domflag = spawnscriptable("dmz_upload_station", v_origin, var_724c2e48c804b73e);
        }
        foreach (player in level.players) {
            domnode.domflag disablescriptableplayeruse(player);
        }
        domnode.domflag function_57257d1ed9ce2f48(&function_da92a1fef510a088);
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f16
// Size: 0x221
function function_5827342a45eaf2aa() {
    level.var_d6ae5cc7b162c730.var_1949b6e747ca100 = array_randomize(level.var_d6ae5cc7b162c730.var_1949b6e747ca100);
    bestnode = undefined;
    bestdist = level.var_d6ae5cc7b162c730.uploadmaxdist;
    foreach (node in level.var_d6ae5cc7b162c730.var_1949b6e747ca100) {
        dist = distance2d(node.origin, self.origin);
        if (dist > level.var_d6ae5cc7b162c730.uploadmaxdist) {
            continue;
        }
        if (!level.br_circle_disabled) {
            var_24588c4e37e62333 = 0;
            var_527a7b84d978e792 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(self.origin);
            var_fdc6ee1b91ebb7bf = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_527a7b84d978e792);
            if (!isdefined(node.circletimeline)) {
                var_220e66163356b51e = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(node.origin);
                var_24588c4e37e62333 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_220e66163356b51e);
            }
            if (var_24588c4e37e62333 < var_fdc6ee1b91ebb7bf) {
                continue;
            }
            traveltime = dist / 190;
            var_24588c4e37e62333 -= traveltime;
            if (var_24588c4e37e62333 < level.var_d6ae5cc7b162c730.var_c7fabbf8ba74055d) {
                continue;
            }
        }
        var_5435995e95681b89 = 0;
        if (dist < level.var_d6ae5cc7b162c730.var_336b7f22eccd99a5) {
            if (dist < level.var_d6ae5cc7b162c730.var_39974c65a006a4bf) {
                var_5435995e95681b89 = level.var_d6ae5cc7b162c730.var_39974c65a006a4bf - dist;
            }
        } else {
            var_5435995e95681b89 = dist - level.var_d6ae5cc7b162c730.var_336b7f22eccd99a5;
        }
        if (var_5435995e95681b89 < bestdist) {
            bestdist = var_5435995e95681b89;
            bestnode = node;
            if (var_5435995e95681b89 <= 0) {
                break;
            }
        }
    }
    return bestnode;
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2140
// Size: 0x41
function function_c75bd0f88a8e39be(instance, part, state, useplayer, var_a5b2c541413aa895, usestring) {
    thread namespace_e1bfa87a2a692d3c::function_a22ac2645c342456(instance, part, state, useplayer, var_a5b2c541413aa895, usestring);
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2189
// Size: 0x137
function intel_resetusability(instance, interactingteam) {
    foreach (player in level.players) {
        instance disablescriptableplayeruse(player);
    }
    foreach (task in instance.tasks) {
        if (isdefined(interactingteam)) {
            if (task.teams[0] == interactingteam) {
                continue;
            }
        }
        var_729f88304cd1d6f8 = getteamdata(task.teams[0], "players");
        foreach (player in var_729f88304cd1d6f8) {
            instance enablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x22c8
// Size: 0x131
function function_9e9a76453cf89412(team, domflag, objidnum) {
    self endon("task_ended");
    level endon("game_ended");
    scripts\mp\objidpoolmanager::objective_set_play_intro(objidnum, 0);
    while (true) {
        playersonteam = getteamdata(team, "players");
        foreach (player in playersonteam) {
            if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
                continue;
            }
            if (player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag()) {
                continue;
            }
            if (isdefined(objidnum) && objidnum != -1) {
                scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(objidnum, player);
            }
        }
        foreach (player in domflag.playersintrigger) {
            if (!isdefined(player)) {
                continue;
            }
            if (player.team == team) {
                scripts\mp\objidpoolmanager::objective_playermask_hidefrom(objidnum, player);
            }
        }
        waitframe();
    }
}

/#

    // Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x2401
    // Size: 0xa4
    function function_709f4a6846f9f8e6(instance, testteam) {
        playersonteam = getteamdata(testteam, "<dev string:x26>");
        useplayer = undefined;
        foreach (player in playersonteam) {
            if (isbot(player)) {
                useplayer = player;
            }
        }
        wait 2;
        namespace_e1bfa87a2a692d3c::function_a22ac2645c342456(instance, "<dev string:x31>", "<dev string:x47>", useplayer, 1, undefined);
    }

    // Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x24ad
    // Size: 0x65
    function function_26254729370d8e3e() {
        waitframe();
        foreach (domnode in level.var_d6ae5cc7b162c730.var_1949b6e747ca100) {
            domnode thread function_db0e41781abde2e8();
        }
    }

    // Namespace namespace_a2ca09079a35239f / namespace_a12ab42942591824
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x251a
    // Size: 0x63
    function function_db0e41781abde2e8() {
        level endon("<dev string:x51>");
        scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522("<dev string:x5f>", self.origin, 1000);
        scripts\cp_mp\utility\game_utility::function_6988310081de7b45();
        while (true) {
            print3d(self.origin, "<dev string:x6d>", (1, 1, 1), 1, 1, 1, 1);
            waitframe();
        }
    }

#/
