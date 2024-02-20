// mwiii decomp prototype
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
#using scripts\engine\scriptable.gsc;
#using script_58fe895fd0fbe620;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_4603f2940296a095;

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x433
// Size: 0x367
function function_fb7271d5ee18b98d(data) {
    level.var_f330cdb3a4738b38 = spawnstruct();
    level.var_f330cdb3a4738b38.var_70fc6efcae372ede = getdvarint(@"hash_fde84813012bba7d", 300);
    level.var_f330cdb3a4738b38.var_5b4471e9efde87c3 = getdvarint(@"hash_8d4d8d285e849ccb", 45);
    level.var_f330cdb3a4738b38.planttime = getdvarint(@"hash_e64f2457394ee5fb", 5);
    level.var_f330cdb3a4738b38.defusetime = getdvarint(@"hash_6802c4a92950d2e6", 5);
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_dom_accept"] = "mission_mission_dom_accept_secure";
    game["dialog"]["mission_dom_success"] = "mission_mission_dom_success";
    level._effect["samsite_bomb_explosion"] = loadfx("vfx/iw8_mp/gamemode/vfx_search_bombsite_destroy.vfx");
    var_25dd3020969aa0f6 = array_randomize(getstructarray("dmz_supply_site", "script_noteworthy"));
    var_78e1e12738c48fd3 = [];
    foreach (node in var_25dd3020969aa0f6) {
        if (!isdefined(var_78e1e12738c48fd3[node.poi])) {
            var_78e1e12738c48fd3[node.poi] = [];
        }
        var_78e1e12738c48fd3[node.poi][var_78e1e12738c48fd3[node.poi].size] = node;
    }
    level.var_364dc596f40b8927 = [];
    foreach (arr in var_78e1e12738c48fd3) {
        foreach (node in arr) {
            if (istrue(node.inuse)) {
                continue;
            }
            foreach (othernode in arr) {
                if (node == othernode) {
                    continue;
                }
                if (istrue(othernode.inuse)) {
                    continue;
                }
                distance = distancesquared(node.origin, othernode.origin);
                if (distance < 4000000 || distance > 144000000) {
                    continue;
                }
                node.end = othernode;
                node.inuse = 1;
                othernode.inuse = 1;
                level.var_364dc596f40b8927[level.var_364dc596f40b8927.size] = node;
            }
        }
    }
    namespace_17c25f0877bfb620::scriptable_addusedcallback(&function_4cadbb00ef649ee1);
    data.funcs["onInit"] = &function_a5b36afc40a950f8;
    data.funcs["onTeamAssigned"] = &function_914b17f8974317b;
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a1
// Size: 0x9d
function function_1044844917e715c5(node) {
    self.node = node;
    self.end = self.node.end;
    self.node.task = self;
    self.end.task = self;
    level.var_364dc596f40b8927 = array_remove(level.var_364dc596f40b8927, self.node);
    self.node namespace_5ffce5a43b2d1ec2::function_402ebb691260e816();
    self.end namespace_5ffce5a43b2d1ec2::function_402ebb691260e816();
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x845
// Size: 0x42
function function_a5b36afc40a950f8() {
    placement = self.tablet function_bc9367aee36e166b();
    self.bombsplanted = 0;
    self.var_8f0a9767e7a155a1 = 0;
    if (!isdefined(placement)) {
        return 0;
    }
    function_1044844917e715c5(placement);
    return 1;
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88f
// Size: 0x27d
function function_914b17f8974317b() {
    uiobjectiveshowtoteam("br_demo_first", self.teams[0]);
    time = function_9b6275085fbcb8f4(level.var_f330cdb3a4738b38.var_70fc6efcae372ede);
    if (!isdefined(self.node)) {
        placement = self.tablet function_bc9367aee36e166b();
        if (!isdefined(placement)) {
            return;
        }
        function_1044844917e715c5(placement);
    }
    self.curorigin = self.node.origin;
    self.offset3d = (0, 0, 100);
    namespace_19b4203b51d56488::requestid(1, 1, undefined, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(self.objidnum, "ui_map_icon_obj_bomb_collect");
    var_88bc5ca990516a9f = sortbydistance([0:self.node, 1:self.end], self.tablet.origin)[0];
    objective_position(self.objidnum, var_88bc5ca990516a9f.origin + self.offset3d);
    function_bdbeefc9f251434b();
    thread function_b9e2920f98adbe0f(time);
    self.node namespace_f2c68794a1018c9d::function_8cd2ac82037f025c("Hostage_Dmz", self.node.origin, 1000);
    self.end namespace_f2c68794a1018c9d::function_8cd2ac82037f025c("Hostage_Dmz", self.end.origin, 1000);
    var_e2b2bbd9e6539f11 = getteamdata(self.teams[0], "players");
    uiobjectiveshowtoteam("br_demo_first", self.teams[0]);
    foreach (player in var_e2b2bbd9e6539f11) {
        player thread namespace_44abc05161e2e2cb::showsplash("br_demolition_quest_start_team");
        self.node namespace_f2c68794a1018c9d::function_1851e9cfb7687f68(player);
        self.end namespace_f2c68794a1018c9d::function_1851e9cfb7687f68(player);
    }
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_dom_accept", self.teams[0], 1);
    self.node thread function_d78aca20601416cd();
    self.end thread function_d78aca20601416cd();
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb13
// Size: 0x67
function function_2b3bf2d2ce4b86ff(success) {
    self notify("task_ended");
    self.ended = 1;
    namespace_19b4203b51d56488::releaseid();
    self.node namespace_5ffce5a43b2d1ec2::function_274106fc5a44c464();
    self.end namespace_5ffce5a43b2d1ec2::function_274106fc5a44c464();
    wait(1);
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined));
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb81
// Size: 0x7e
function function_b9e2920f98adbe0f(time) {
    self endon("task_ended");
    level endon("game_ended");
    waitframe();
    function_5a15174d34f0670c(time);
    wait(time);
    params = spawnstruct();
    params.intvar = 0;
    displayteamsplash(self.teams[0], "br_demolition_quest_timer_expired", params);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_gen_fail", self.teams[0], 1);
    thread function_2b3bf2d2ce4b86ff(0);
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc06
// Size: 0x1d6
function function_d78aca20601416cd() {
    namespace_5ffce5a43b2d1ec2::function_dda2d720bbb26623();
    self waittill("bomb_planted");
    self.task.bombsplanted++;
    var_e2b2bbd9e6539f11 = getteamdata(self.task.teams[0], "players");
    if (self.task.bombsplanted == 2) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_second_plant", self.var_6036cd81fe22627.team);
        objective_position(self.task.objidnum, self.plantedbomb.origin + (0, 0, 50));
        self.task function_473ab9452660e60f("br_demo_defend");
    } else if (self.task.bombsplanted == 1) {
        namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_first_plant", self.var_6036cd81fe22627.team);
        node = ter_op(self == self.task.node, self.task.end, self.task.node);
        objective_position(self.task.objidnum, node.origin + self.task.offset3d);
        self.task function_473ab9452660e60f("br_demo_second");
    }
    namespace_5ffce5a43b2d1ec2::function_ebaa4417a40158f5();
    thread function_adb1b940d140cde0();
    thread function_5666e11b17254d43(level.var_f330cdb3a4738b38.var_5b4471e9efde87c3);
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde3
// Size: 0x233
function function_adb1b940d140cde0() {
    level endon("game_ended");
    self.task endon("task_ended");
    self endon("bomb_exploded");
    self waittill("bomb_defused");
    self.scriptable freescriptable();
    var_3060d27ffb03ad2 = self.var_285292a6695a1fca.team;
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_defused_others", var_3060d27ffb03ad2, 1.5);
    thread namespace_3bde6869e44a2770::dmz_activity_win(getteamdata(var_3060d27ffb03ad2, "players"));
    var_379d6bad84e53438 = self.task.teams[0];
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_defused", var_379d6bad84e53438, 1.5);
    thread namespace_3bde6869e44a2770::dmz_activity_lose(getteamdata(var_379d6bad84e53438, "players"));
    params = spawnstruct();
    missionid = getquestindex("br_demo_first");
    var_501265b5fe210821 = function_d282041688c032b5("br_demo_first");
    params.intvar = var_501265b5fe210821;
    foreach (player in getteamdata(var_3060d27ffb03ad2, "players")) {
        player namespace_c6ccccd95254983f::playerplunderpickup(var_501265b5fe210821);
        player namespace_c6ccccd95254983f::function_5a2284274d70f7d(1, var_501265b5fe210821);
    }
    rewards = function_d212a5e7a40d7c8d("demo", var_3060d27ffb03ad2);
    if (isdefined(rewards) && isdefined(rewards[0])) {
        function_878ebcc241b54505("br_demolition_quest_complete", function_3d262d56274bd22e("demo"), rewards[0], var_3060d27ffb03ad2);
    }
    function_878ebcc241b54505("br_demolition_quest_failure", function_3d262d56274bd22e("demo"), 0, var_379d6bad84e53438);
    displaysquadmessagetoteam(self.task.teams[0], self.var_285292a6695a1fca, 8, missionid);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_dom_success", var_3060d27ffb03ad2, 1, 1);
    self.task thread function_2b3bf2d2ce4b86ff(0);
    wait(10);
    self.plantedbomb delete();
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x101d
// Size: 0x1d4
function private function_5666e11b17254d43(time) {
    level endon("game_ended");
    self.task endon("task_ended");
    self endon("bomb_defused");
    namespace_5ffce5a43b2d1ec2::function_b73c05a413966ab2(time);
    namespace_5ffce5a43b2d1ec2::function_accead05b2c47cb7();
    wait(0.1);
    self.task.var_8f0a9767e7a155a1++;
    namespace_5ffce5a43b2d1ec2::function_274106fc5a44c464();
    team = self.task.teams[0];
    if (self.task.var_8f0a9767e7a155a1 == 2) {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_second_exploded", team, 1.5);
        thread namespace_3bde6869e44a2770::dmz_activity_win(getteamdata(team, "players"));
        missionid = getquestindex("br_demo_first");
        rewards = function_d212a5e7a40d7c8d("demo", self.task.teams[0]);
        if (isdefined(rewards) && isdefined(rewards[0])) {
            function_878ebcc241b54505("dmz_demo_win", function_3d262d56274bd22e("demo"), rewards[0], self.task.teams[0]);
        }
        displaysquadmessagetoteam(self.task.teams[0], self.var_6036cd81fe22627, 8, missionid);
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_dom_success", self.task.teams[0], 1, 1);
        self.task thread function_2b3bf2d2ce4b86ff(1);
    } else if (self.task.var_8f0a9767e7a155a1 == 1) {
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("demolition_first_exploded", team, 1.5);
        displayteamsplash(team, "dmz_demo_first_explosion");
    }
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f8
// Size: 0x3df
function function_4cadbb00ef649ee1(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (part != "dmz_supply_site") {
        return;
    }
    if (state == "usable") {
        instance setscriptablepartstate("dmz_supply_site", "unusable");
        node = instance.node;
        if (isdefined(node.planting) && istrue(node.planting)) {
            return;
        }
        node.planting = 1;
        bomb = namespace_5ffce5a43b2d1ec2::function_cadc5181c3b67e3f(player);
        thread namespace_f2c68794a1018c9d::function_d86771edadba8b4a(node, node, player);
        buttontime = 0;
        while (buttontime < level.var_f330cdb3a4738b38.planttime) {
            if (node.cancel || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
                node.planting = 0;
                namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
                instance setscriptablepartstate("dmz_supply_site", "usable");
                return;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
        var_eeb138fae3842a92 = spawn("script_model", player.origin);
        var_eeb138fae3842a92 setmodel("offhand_2h_wm_briefcase_bomb_v0");
        var_eeb138fae3842a92.visuals = [];
        var_eeb138fae3842a92.visuals[0] = spawn("script_model", player.origin);
        var_eeb138fae3842a92.visuals[0] setmodel("tag_origin");
        var_eeb138fae3842a92.curorigin = var_eeb138fae3842a92.origin;
        var_eeb138fae3842a92.offset3d = (0, 0, 15);
        var_eeb138fae3842a92.safeorigin = var_eeb138fae3842a92.origin;
        var_eeb138fae3842a92.trigger = spawnstruct();
        var_eeb138fae3842a92.objidnum = -1;
        var_eeb138fae3842a92 namespace_19b4203b51d56488::setdropped(undefined, undefined);
        node.plantedbomb = var_eeb138fae3842a92;
        node.plantedbomb.node = node;
        node.bombplanted = 1;
        node.var_6036cd81fe22627 = player;
        node notify("bomb_planted");
    } else if (state == "defusable") {
        instance setscriptablepartstate("dmz_supply_site", "unusable");
        node = instance.node;
        if (isdefined(node.defusing) && istrue(node.defusing)) {
            return;
        }
        node.defusing = 1;
        node.plantedbomb hide();
        bomb = namespace_5ffce5a43b2d1ec2::function_cadc5181c3b67e3f(player);
        thread namespace_f2c68794a1018c9d::function_d86771edadba8b4a(node, node, player);
        buttontime = 0;
        while (buttontime < level.var_f330cdb3a4738b38.defusetime) {
            if (node.cancel || !isalive(player) || isdefined(player.var_2ca0dac193d83c1) && player.var_2ca0dac193d83c1) {
                node.defusing = 0;
                namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
                node.plantedbomb show();
                instance setscriptablepartstate("dmz_supply_site", "defusable");
                return;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        node notify("bomb_defused");
        node.var_285292a6695a1fca = player;
        namespace_5ffce5a43b2d1ec2::function_db896f4486ca187(player, bomb);
        node.plantedbomb show();
    }
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15de
// Size: 0x157
function function_bc9367aee36e166b() {
    var_fdc6ee1b91ebb7bf = namespace_c5622898120e827f::getmintimetillpointindangercircle(self.origin);
    placement = undefined;
    var_2ed718e1da0b965 = undefined;
    var_be0f4d48fa40793f = 24000;
    foreach (i, node in level.var_364dc596f40b8927) {
        dist = distance2d(node.origin, self.origin);
        if (dist > var_be0f4d48fa40793f) {
            continue;
        }
        if (!level.br_circle_disabled) {
            var_28deb7ff62e281d3 = namespace_c5622898120e827f::getmintimetillpointindangercircle(node.origin);
            if (var_28deb7ff62e281d3 < var_fdc6ee1b91ebb7bf) {
                continue;
            }
            traveltime = dist / 190;
            var_28deb7ff62e281d3 = var_28deb7ff62e281d3 - traveltime;
            if (var_28deb7ff62e281d3 < 30) {
                continue;
            }
            var_5435995e95681b89 = 0;
            if (dist < 8000) {
                if (dist < 6000) {
                    var_5435995e95681b89 = 6000 - dist;
                }
            } else {
                var_5435995e95681b89 = dist - 8000;
            }
            if (var_5435995e95681b89 < var_be0f4d48fa40793f) {
                var_be0f4d48fa40793f = var_5435995e95681b89;
                var_2ed718e1da0b965 = i;
                placement = node;
                if (var_5435995e95681b89 <= 0) {
                    break;
                }
            }
        }
    }
    return placement;
}

// Namespace namespace_4603f2940296a095/namespace_78324ffeb3033698
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173d
// Size: 0x95
function function_bdbeefc9f251434b() {
    objective_showtoplayersinmask(self.objidnum);
    objective_removeallfrommask(self.objidnum);
    foreach (player in getteamdata(self.teams[0], "players")) {
        if (!player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            objective_addclienttomask(self.objidnum, player);
        }
    }
}

