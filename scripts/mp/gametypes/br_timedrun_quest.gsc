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
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_d58085eccda9a0c7;

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0x15b
function function_fb7271d5ee18b98d(data) {
    level.var_8f97a050f8203dab = spawnstruct();
    level.var_8f97a050f8203dab.time = getdvarint(@"hash_71ede8ba370404c2", 120);
    level.var_8f97a050f8203dab.maxrange = getdvarint(@"hash_b572422cdea70219", 23000);
    level.var_8f97a050f8203dab.minrange = getdvarint(@"hash_1f550799f4e3bd93", 5000);
    level.var_8f97a050f8203dab.var_8f7c18f3dcce9dff = getdvarint(@"hash_e1260eee3fc09c9f", 20000);
    level.var_8f97a050f8203dab.var_908d1b90e147e411 = getdvarint(@"hash_8b3ecaca4442e5cd", 17000);
    level.var_8f97a050f8203dab.radius = getdvarint(@"hash_e74f977d917a9849", 150);
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_timedrun_accept"] = "mission_mission_time_accept";
    game["dialog"]["mission_timedrun_fail"] = "mission_mission_time_failed";
    data.funcs["onInit"] = &function_f95df4809dfa1d7f;
    data.funcs["onTeamAssigned"] = &function_fbc4e1bc931264a8;
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a6
// Size: 0x30
function function_f95df4809dfa1d7f() {
    kiosk = self.tablet function_3948b71d8c04b5b8();
    if (!isdefined(kiosk)) {
        return 0;
    }
    self.kiosk = kiosk;
    return 1;
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3de
// Size: 0x19d
function function_fbc4e1bc931264a8() {
    if (!isdefined(self.kiosk)) {
        kiosk = self.tablet function_3948b71d8c04b5b8();
        if (!isdefined(kiosk)) {
            return;
        }
        self.kiosk = kiosk;
    }
    uiobjectiveshowtoteam("timedrun", self.teams[0]);
    time = level.var_8f97a050f8203dab.time;
    time = function_9b6275085fbcb8f4(time);
    function_5a15174d34f0670c(time);
    thread function_fe13e6dc6fe958b8(time);
    displayteamsplash(self.teams[0], "br_timedrun_quest_start_team_notify");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_timedrun_accept", self.teams[0], 1, 1);
    self.curorigin = self.kiosk.origin;
    createquestobjicon("ui_mp_br_mapmenu_icon_timedrun_objective", "current", self.curorigin + (0, 0, 65));
    thread timedrun_finishlinevfx(self.kiosk.origin, self.teams[0]);
    players = getteamdata(self.teams[0], "players");
    foreach (player in players) {
        showquestobjicontoplayer(player);
    }
    thread tr_detectwinners();
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x582
// Size: 0x3c
function function_701b9420ca853766(success) {
    self notify("task_ended");
    deletequestobjicon();
    wait(1);
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined));
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c5
// Size: 0x77
function function_fe13e6dc6fe958b8(time) {
    self endon("task_ended");
    level endon("game_ended");
    wait(time);
    params = spawnstruct();
    params.intvar = 0;
    displayteamsplash(self.teams[0], "br_timedrun_quest_timer_expired", params);
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_timedrun_fail", self.teams[0], 1, 1);
    thread function_701b9420ca853766(0);
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x643
// Size: 0x25f
function function_3948b71d8c04b5b8() {
    var_86eede4334852d70 = namespace_a4b43c1cf86c6fe5::getallspawninstances();
    var_ced8a1f62ae2956b = [];
    foreach (kiosk in level.br_armory_kiosk.scriptables) {
        if (!istrue(kiosk.disabled)) {
            var_ced8a1f62ae2956b[var_ced8a1f62ae2956b.size] = kiosk;
        }
    }
    locations = array_randomize(var_ced8a1f62ae2956b);
    var_fdc6ee1b91ebb7bf = namespace_c5622898120e827f::getmintimetillpointindangercircle(self.origin);
    kiosk = undefined;
    var_2ed718e1da0b965 = undefined;
    var_be0f4d48fa40793f = level.var_8f97a050f8203dab.maxrange;
    foreach (i, node in locations) {
        dist = distance2d(node.origin, self.origin);
        if (dist > level.var_8f97a050f8203dab.maxrange || dist < level.var_8f97a050f8203dab.minrange) {
            continue;
        }
        if (!level.br_circle_disabled) {
            var_28deb7ff62e281d3 = namespace_c5622898120e827f::getmintimetillpointindangercircle(node.origin);
            if (var_28deb7ff62e281d3 < var_fdc6ee1b91ebb7bf) {
                continue;
            }
            traveltime = dist / 190;
            var_28deb7ff62e281d3 = var_28deb7ff62e281d3 - traveltime;
            if (var_28deb7ff62e281d3 < 45) {
                continue;
            }
            var_5435995e95681b89 = 0;
            if (dist < level.var_8f97a050f8203dab.var_8f7c18f3dcce9dff) {
                if (dist < level.var_8f97a050f8203dab.var_908d1b90e147e411) {
                    var_5435995e95681b89 = level.var_8f97a050f8203dab.var_908d1b90e147e411 - dist;
                }
            } else {
                var_5435995e95681b89 = dist - level.var_8f97a050f8203dab.var_8f7c18f3dcce9dff;
            }
            if (var_5435995e95681b89 < var_be0f4d48fa40793f) {
                var_be0f4d48fa40793f = var_5435995e95681b89;
                var_2ed718e1da0b965 = i;
                kiosk = node;
                if (var_5435995e95681b89 <= 0) {
                    break;
                }
            }
        }
    }
    return kiosk;
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8aa
// Size: 0xd6
function timedrun_finishlinevfx(spawn_origin, team) {
    finishlinevfx = spawnfx(level._effect["vfx_marker_base_orange_pulse"], spawn_origin + (0, 0, 10));
    finishlinevfx.angles = vectortoangles((0, 0, 1));
    finishlinevfx hide();
    wait(0.5);
    triggerfx(finishlinevfx);
    foreach (player in getteamdata(team, "players")) {
        finishlinevfx showtoplayer(player);
    }
    self.finishlinevfx = finishlinevfx;
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x987
// Size: 0x1c6
function tr_detectwinners() {
    self endon("task_ended");
    level endon("game_ended");
    while (1) {
        foreach (player in getteamdata(self.teams[0], "players")) {
            if (distance(player.origin, self.kiosk.origin) < level.var_8f97a050f8203dab.radius) {
                rewards = function_d212a5e7a40d7c8d("timedrun", self.teams[0]);
                if (isdefined(rewards) && isdefined(rewards[0])) {
                    function_878ebcc241b54505("br_timedrun_quest_complete", function_3d262d56274bd22e("timedrun"), rewards[0], self.teams[0]);
                }
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_misc_success", self.teams[0], 1, 1);
                squadmembers = getteamdata(self.teams[0], "players");
                foreach (player in squadmembers) {
                    if (isdefined(player) && !istrue(player.br_iseliminated)) {
                        namespace_a4b43c1cf86c6fe5::kiosksetupfiresaleforplayer(self.kiosk, player);
                    }
                }
                self.rewardmodifier = undefined;
                self.result = "success";
                thread function_701b9420ca853766(1);
                return;
            }
        }
        waitframe();
    }
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb54
// Size: 0x1c
function hidetimedrunhudfromplayer(player) {
    hidequestobjiconfromplayer(player);
    player uiobjectivehide();
}

// Namespace namespace_d58085eccda9a0c7/namespace_52c3511331e3262
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb77
// Size: 0x5f
function deletetimedrunhud() {
    foreach (player in self.playerlist) {
        hidetimedrunhudfromplayer(player);
    }
    deletequestobjicon();
}

