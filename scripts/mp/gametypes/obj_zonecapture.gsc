// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gametypes\koth.gsc;
#using scripts\mp\gametypes\hq.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\cranked.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_10eb9162061dea8d;

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67c
// Size: 0x264
function setupobjective(trigger, visuals, var_5ddbc1faed2c56e6, var_8b9949739f4e0f6) {
    zone = trigger;
    if (!isdefined(visuals)) {
        visuals = [];
        visuals[0] = zone;
    }
    if (istrue(var_5ddbc1faed2c56e6)) {
        var_3c2389ba69e5822b = 0;
    } else {
        var_3c2389ba69e5822b = undefined;
    }
    zone = namespace_19b4203b51d56488::createuseobject("neutral", zone, visuals, (0, 0, 0), var_3c2389ba69e5822b, var_8b9949739f4e0f6);
    zone namespace_19b4203b51d56488::disableobject();
    var_c8f4c582625f492d = function_1823ff50bb28148d(function_60bf8d82001fc22c());
    if (var_c8f4c582625f492d == #"gwai" || var_c8f4c582625f492d == #"wm") {
        goto LOC_0000011f;
    }
    if (var_c8f4c582625f492d == #"koth" || var_c8f4c582625f492d == #"hash_6a87626330d9d40e") {
        for (index = 0; index < zone.visuals.size; index++) {
            zone.visuals[index] hide();
        }
    } else {
        zone.visuals[0] scriptmodelplayanim("iw8_mp_military_hq_crate_close");
    LOC_0000011f:
    }
LOC_0000011f:
    zone namespace_19b4203b51d56488::cancontestclaim(1);
    zone.claimgracetime = level.zonecapturetime * 1000;
    zone namespace_19b4203b51d56488::pinobjiconontriggertouch();
    if (isdefined(trigger.objectivekey)) {
        zone.objectivekey = trigger.objectivekey;
    } else {
        zone.objectivekey = zone namespace_19b4203b51d56488::getlabel();
    }
    if (var_c8f4c582625f492d == #"hq" || var_c8f4c582625f492d == #"gwai" || var_c8f4c582625f492d == #"hash_6a87626330d9d40e") {
        zone namespace_19b4203b51d56488::mustmaintainclaim(0);
    } else {
        zone namespace_19b4203b51d56488::mustmaintainclaim(1);
    }
    zone.id = "hardpoint";
    if (isdefined(zone.trigger.target) && (var_c8f4c582625f492d == #"koth" || var_c8f4c582625f492d == #"wm" || var_c8f4c582625f492d == #"hash_6a87626330d9d40e" || var_c8f4c582625f492d == #"hq")) {
        zone thread assignchevrons(zone.trigger.target, zone.trigger.script_label);
    }
    return zone;
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e8
// Size: 0x26
function function_e4c3058ef8c3819e(zone) {
    if (isdefined(level.var_e4c3058ef8c3819e)) {
        zone [[ level.var_e4c3058ef8c3819e ]]();
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x915
// Size: 0x154
function assignchevrons(target, label) {
    zone = self;
    wait(1);
    othervisuals = getentitylessscriptablearray(target, "targetname");
    othervisuals = removechevronsfromarray(othervisuals, label);
    othervisuals = postshipmodifychevrons(othervisuals, label);
    chevrons = [];
    foreach (visual in othervisuals) {
        index = chevrons.size;
        chevrons[index] = visual;
        chevrons[index].numchevrons = 1;
        if (isdefined(visual.script_noteworthy)) {
            if (visual.script_noteworthy == "2") {
                chevrons[index].numchevrons = 2;
            } else if (visual.script_noteworthy == "3") {
                chevrons[index].numchevrons = 3;
            } else if (visual.script_noteworthy == "4") {
                chevrons[index].numchevrons = 4;
            }
        }
    }
    zone.chevrons = chevrons;
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa70
// Size: 0x115
function updatechevrons(state) {
    var_c8f4c582625f492d = function_1823ff50bb28148d(function_60bf8d82001fc22c());
    if (!(var_c8f4c582625f492d == #"koth" || var_c8f4c582625f492d == #"hash_6a87626330d9d40e" || var_c8f4c582625f492d == #"wm" || var_c8f4c582625f492d == #"hq")) {
        return;
    }
    zone = self;
    zone notify("updateChevrons");
    zone endon("updateChevrons");
    while (!isdefined(zone.chevrons)) {
        waitframe();
    }
    foreach (var_eae85273686f4f4 in zone.chevrons) {
        for (i = 0; i < var_eae85273686f4f4.numchevrons; i++) {
            var_eae85273686f4f4 setscriptablepartstate("chevron_" + i, state);
        }
    }
    function_e4c3058ef8c3819e(zone);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8c
// Size: 0xb7
function function_684d05448781a1f4() {
    zone = self;
    if (!istrue(zone.active)) {
        zone thread updatechevrons("off");
    }
    if (zone.stalemate) {
        zone thread updatechevrons("contested");
    } else if (zone.ownerteam != "neutral") {
        zone thread updatechevrons(zone.ownerteam);
    } else if (zone.isunoccupied || istrue(level.zoneislocked)) {
        zone thread updatechevrons("idle");
    } else {
        zone thread updatechevrons(zone.mostnumtouchingteam);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4a
// Size: 0x2a9
function activatezone(objid, var_8b9949739f4e0f6) {
    zone = self;
    zone.onuse = &zone_onuse;
    zone.onbeginuse = &zone_onusebegin;
    zone.onuseupdate = &zone_onuseupdate;
    zone.onenduse = &zone_onuseend;
    zone.onunoccupied = &zone_onunoccupied;
    zone.oncontested = &zone_oncontested;
    zone.onuncontested = &zone_onuncontested;
    zone.stompprogressreward = &zone_stompprogressreward;
    zone.onpinnedstate = &zone_onpinnedstate;
    zone.onunpinnedstate = &zone_onunpinnedstate;
    zone.didstatusnotify = 0;
    if (!istrue(var_8b9949739f4e0f6)) {
        if (isdefined(objid)) {
            zone namespace_19b4203b51d56488::requestid(1, 1, objid, 1, 0);
        } else {
            zone namespace_19b4203b51d56488::requestid(1, 1, 0, 1, 0);
        }
    }
    var_40db97c5db5e1e3e = zone.curorigin;
    if (isdefined(level.gethillspawnshutofforigin)) {
        var_40db97c5db5e1e3e = [[ level.gethillspawnshutofforigin ]]();
    }
    dangerzoneradius = 1024;
    if (isdefined(level.gethillspawnshutoffradius)) {
        dangerzoneradius = [[ level.gethillspawnshutoffradius ]]();
    }
    dangerzoneids = [];
    dangerzoneids[dangerzoneids.size] = namespace_b2d5aa2baf2b5701::addspawndangerzone(var_40db97c5db5e1e3e - (0, 0, 2048), dangerzoneradius, 4096, "allies", undefined, undefined, undefined, undefined, undefined, 1);
    dangerzoneids[dangerzoneids.size] = namespace_b2d5aa2baf2b5701::addspawndangerzone(var_40db97c5db5e1e3e - (0, 0, 2048), dangerzoneradius, 4096, "axis", undefined, undefined, undefined, undefined, undefined, 1);
    zone.dangerzoneids = dangerzoneids;
    var_c8f4c582625f492d = function_1823ff50bb28148d(function_60bf8d82001fc22c());
    if (var_c8f4c582625f492d == #"koth" || var_c8f4c582625f492d == #"grnd") {
        zone.ignorestomp = 1;
        zone.alwaysstalemate = 1;
        if (istrue(level.zonemajoritycapture)) {
            zone.alwaysstalemate = 0;
            zone.var_88806e65c3197677 = 1;
        }
    } else {
        zone.stompeenemyprogressupdate = &zone_stompeenemyprogressupdate;
        namespace_5a22b6f3a56f7e9b::update_objective_position(zone.objidnum, zone.visuals[0].origin + (0, 0, 70));
    }
    if (var_c8f4c582625f492d == #"wm") {
        zone.alwaysstalemate = 1;
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefa
// Size: 0x1f6
function deactivatezone() {
    zone = self;
    zone.onuse = undefined;
    zone.onbeginuse = undefined;
    zone.onuseupdate = undefined;
    zone.onunoccupied = undefined;
    zone.oncontested = undefined;
    zone.onuncontested = undefined;
    zone.stalemate = 0;
    zone.wasstalemate = 0;
    zone.didstatusnotify = 0;
    zone thread updatechevrons("off");
    foreach (var_dd73eb1591960567 in zone.dangerzoneids) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(var_dd73eb1591960567);
    }
    zone.dangerzoneids = undefined;
    foreach (player in level.players) {
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(zone.objidnum, player);
    }
    zone.trigger namespace_3c37cb17ade254d::trigger_off();
    zone thread waitthensetvisibleteam();
    zone namespace_19b4203b51d56488::releaseid(1, 0);
    var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
    if (var_c8f4c582625f492d == #"hq") {
        zone.visuals[0] playsound("mp_hq_deactivate_sfx");
        thread namespace_3bde6869e44a2770::headquarters_deactivate_music(zone.lastclaimteam);
        zone.visuals[0] scriptmodelplayanim("iw8_mp_military_hq_crate_close");
        zone.visuals[0] stoploopsound();
    }
    level.scoreleadchanged = 0;
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f7
// Size: 0x7d
function zonetimerwait() {
    level endon("game_ended");
    level endon("dev_force_zone");
    var_ff049ff4093f7a4e = int(level.zonemovetime * 1000 + gettime());
    if (!isdefined(level.zoneselectiondelay) || level.zoneselectiondelay < 10) {
        thread hp_move_soon(level.zonemovetime);
    }
    level thread handlehostmigration(var_ff049ff4093f7a4e);
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(level.zonemovetime);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117b
// Size: 0x1be
function hp_move_soon(timer) {
    level endon("game_ended");
    /#
        level endon("zone_moved");
    #/
    var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
    if (var_c8f4c582625f492d == #"hq") {
        level endon("zone_destroyed");
    }
    if (isdefined(level.nextzonerevealtime)) {
        timer = max(timer - level.nextzonerevealtime, 0);
    }
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(timer);
    if (isdefined(level.var_fbb04ff4ffa6d364)) {
        objid = namespace_5a22b6f3a56f7e9b::function_92a696fa5918eca5(1);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
        namespace_5a22b6f3a56f7e9b::update_objective_state(objid, "current");
        namespace_5a22b6f3a56f7e9b::update_objective_position(objid, level.var_fbb04ff4ffa6d364.visuals[0].origin + level.var_fbb04ff4ffa6d364.offset3d);
        level.var_fbb04ff4ffa6d364 namespace_19b4203b51d56488::setvisibleteam("any", objid);
        level.var_fbb04ff4ffa6d364 namespace_19b4203b51d56488::setobjectivestatusicons(level.var_7520a0fc17909b95, level.var_7520a0fc17909b95, objid);
    } else if (isdefined(level.var_e7e94c1feca60900) && isdefined(level.var_7f2484c1d7066d39)) {
        level thread [[ level.var_7f2484c1d7066d39 ]]();
    }
    if (timer < 3) {
        wait(3);
    }
    foreach (entry in level.teamnamelist) {
        level statusdialog("hp_move_soon", entry);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1340
// Size: 0x8d
function handlehostmigration(var_ff049ff4093f7a4e) {
    level endon("game_ended");
    level endon("bomb_defused");
    level endon("disconnect");
    level endon("zone_captured");
    level waittill("host_migration_begin");
    setomnvar("ui_objective_timer_stopped", 1);
    timepassed = namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    setomnvar("ui_objective_timer_stopped", 0);
    if (timepassed > 0) {
        setomnvar("ui_hardpoint_timer", level.zoneendtime + timepassed);
    } else {
        setomnvar("ui_hardpoint_timer", level.zoneendtime);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d4
// Size: 0x39
function hardpoint_setneutral() {
    zone = self;
    zone notify("flag_neutral");
    zone namespace_19b4203b51d56488::setownerteam("neutral");
    playhardpointneutralfx();
    zone thread updatechevrons("idle");
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1414
// Size: 0xa8
function trackgametypevips() {
    thread cleanupgametypevips();
    level endon("game_ended");
    level endon("zone_moved");
    zone = self;
    while (1) {
        foreach (player in level.players) {
            if (player istouching(zone.trigger)) {
                player setgametypevip(1);
            } else {
                player setgametypevip(0);
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c3
// Size: 0x6a
function cleanupgametypevips() {
    level waittill_any_2("game_ended", "zone_moved");
    foreach (player in level.players) {
        player setgametypevip(0);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1534
// Size: 0x677
function zone_onuse(var_22282e7d48ca3400) {
    if (!isdefined(var_22282e7d48ca3400) || !isdefined(var_22282e7d48ca3400.team)) {
        return;
    }
    zone = self;
    namespace_5a22b6f3a56f7e9b::objective_set_progress(zone.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(zone.objidnum, 0);
    capture_team = var_22282e7d48ca3400.team;
    capturetime = gettime();
    touchlist = [];
    var_bccfaf72141ae300 = getarraykeys(zone.touchlist[capture_team]);
    for (i = 0; i < var_bccfaf72141ae300.size; i++) {
        touchlist[var_bccfaf72141ae300[i]] = zone.touchlist[capture_team][var_bccfaf72141ae300[i]];
    }
    var_c8f4c582625f492d = function_1823ff50bb28148d(function_60bf8d82001fc22c());
    if (var_c8f4c582625f492d == #"koth") {
        level notify("Objective_SetShowProgress", zone.objidnum);
    }
    if (var_c8f4c582625f492d == #"hq" && zone.ownerteam != "neutral") {
        setomnvar("ui_hq_ownerteam", 0);
        level notify("zone_destroyed");
        foreach (player in level.players) {
            namespace_5a22b6f3a56f7e9b::objective_unpin_player(zone.objidnum, player);
        }
        zone thread waitthensetvisibleteam();
        level namespace_f1b0a92156c7301c::updateservericons("zone_shift", 0);
        if (isdefined(touchlist)) {
            var_59db5d0f4e3000a7 = getarraykeys(touchlist);
            foreach (playerid in var_59db5d0f4e3000a7) {
                player = zone.assisttouchlist[capture_team][playerid].player;
            }
        }
        level thread namespace_d1f589f22374fa09::give_capture_credit(touchlist, capturetime, capture_team, undefined, var_22282e7d48ca3400, zone);
        level statusdialog("hp_timeout", var_22282e7d48ca3400.team);
        level statusdialog("hp_owned_lost", zone.ownerteam);
    } else {
        if (var_c8f4c582625f492d == #"hq") {
            var_3b8dbae5ddc5d624 = namespace_54d20dd0dd79277f::getteamdata(capture_team, "players");
            foreach (player in var_3b8dbae5ddc5d624) {
                player.skipspawncamera = 1;
            }
        }
        otherteam = getotherteam(capture_team)[0];
        zone namespace_19b4203b51d56488::setownerteam(capture_team);
        if (var_c8f4c582625f492d == #"hq") {
            setomnvar("ui_hq_ownerteam", namespace_d1f589f22374fa09::gethqownerteamvalue(zone.ownerteam));
            setomnvar("ui_hq_num_alive", namespace_54d20dd0dd79277f::getteamdata(zone.ownerteam, "aliveCount"));
            level thread namespace_d1f589f22374fa09::awardcapturepoints();
            var_e3f1a73a39054069 = namespace_e8a49b70d0769b66::_getteamscore(capture_team);
            otherteamscore = namespace_e8a49b70d0769b66::_getteamscore(otherteam);
            if (var_e3f1a73a39054069 > otherteamscore) {
                level.scoreleadchanged = 1;
            }
            adjustmatchtimerpausedstatefromscore(capture_team);
        } else if (isdefined(level.var_a9bdef06142064a3)) {
            level thread [[ level.var_a9bdef06142064a3 ]](zone, var_22282e7d48ca3400);
        } else {
            level thread namespace_f1b0a92156c7301c::awardcapturepoints();
            if (level.pausemodetimer) {
                level namespace_d576b6dc7cef9c62::pausetimer();
            }
        }
        level.usestartspawns = 0;
        var_65fbb1944e8b5d4d = 0;
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefending, level.iconcapture);
        level namespace_f1b0a92156c7301c::updateservericons(capture_team, 0);
        if (var_c8f4c582625f492d == #"hq") {
            thread printandsoundoneveryone(capture_team, otherteam, undefined, undefined, "mp_dom_flag_captured", undefined, var_22282e7d48ca3400);
            thread namespace_3bde6869e44a2770::headquarters_captured_music();
        }
        if (!isdefined(level.lastcaptureteam) || level.lastcaptureteam != capture_team) {
            if (var_c8f4c582625f492d == #"hq") {
                if (isdefined(level.kothhillrotation && level.kothhillrotation == 0)) {
                    level.delayleadtakendialog = 4;
                } else {
                    level.delayleadtakendialog = undefined;
                }
                level thread delaydialogstatustoavoidcaptureoverlap(capture_team, otherteam);
            }
            /#
                assert(capture_team != "neutral");
            #/
            if (var_c8f4c582625f492d == #"hash_6a87626330d9d40e") {
                goto LOC_00000579;
            }
            if (var_c8f4c582625f492d == #"koth" || var_c8f4c582625f492d == #"grnd") {
                level thread namespace_f1b0a92156c7301c::give_capture_credit(touchlist, capturetime, capture_team, level.lastcaptureteam, var_22282e7d48ca3400, zone);
            } else {
                level thread namespace_d1f589f22374fa09::give_capture_credit(touchlist, capturetime, capture_team, level.lastcaptureteam, var_22282e7d48ca3400, zone);
            LOC_00000579:
            }
        LOC_00000579:
        }
    LOC_00000579:
        foreach (var_80ce5b9516cca684 in level.players) {
            zone showcapturedhardpointeffecttoplayer(capture_team, var_80ce5b9516cca684);
        }
        zone thread updatechevrons(capture_team);
        if (var_c8f4c582625f492d == #"hq") {
            zone.visuals[0] stoploopsound();
            zone.visuals[0] scriptmodelplayanim("iw8_mp_military_hq_crate_open_idle");
            players = namespace_54d20dd0dd79277f::getteamdata(capture_team, "players");
            foreach (player in players) {
                player thread namespace_d1f589f22374fa09::showrespawnwarningmessage();
            }
        }
        level.hpcapteam = capture_team;
        zone.capturecount++;
        level.lastcaptureteam = capture_team;
        level notify("zone_captured");
        level notify("zone_captured" + capture_team);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb2
// Size: 0x1d
function waitthensetvisibleteam() {
    zone = self;
    waitframe();
    zone namespace_19b4203b51d56488::setvisibleteam("none");
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd6
// Size: 0x1a4
function zone_onusebegin(player) {
    player.isonobjective = 1;
    zone = self;
    var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    if (var_c8f4c582625f492d == #"hq") {
        if (ownerteam != "neutral" && zone.claimteam != ownerteam) {
            adjustmatchtimerpausedstatefromscore(ownerteam, 1);
        }
        if (!istrue(zone.stalemate) && isplayer(player)) {
            if (ownerteam == "neutral") {
                player setclientomnvar("ui_objective_pinned_text_param", 1);
            } else {
                player setclientomnvar("ui_objective_pinned_text_param", 2);
            }
        }
        zone function_684d05448781a1f4();
    } else if (var_c8f4c582625f492d == #"hash_6a87626330d9d40e" && ownerteam == "neutral") {
        zone function_684d05448781a1f4();
    }
    if (!isdefined(zone.statusnotifytime)) {
        zone.statusnotifytime = gettime();
    }
    if (zone.statusnotifytime > zone.statusnotifytime + 10000) {
        zone.didstatusnotify = 0;
        zone.statusnotifytime = gettime();
    }
    zone namespace_19b4203b51d56488::setusetime(level.zonecapturetime);
    if (level.zonecapturetime > 0) {
        zone.prevownerteam = getotherteam(player.team)[0];
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconlosing, level.icontaking);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d81
// Size: 0x235
function zone_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    zone = self;
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, team);
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
    if (var_c8f4c582625f492d == #"hq" || var_c8f4c582625f492d == #"wm") {
        if (!istrue(level.mapname == "mp_jup_skydiving" && (zone.objectivekey == "_e" || zone.objectivekey == "_f"))) {
            if (progress < 1 && !level.gameended) {
                playcapturesound(progress, team);
            }
        }
    }
    if (var_c8f4c582625f492d == #"hq") {
        if (ownerteam == "neutral" && zone.claimteam != ownerteam) {
            adjustmatchtimerpausedstatefromscore(zone.claimteam);
        } else if (ownerteam != "neutral" && zone.claimteam != ownerteam) {
            adjustmatchtimerpausedstatefromscore(ownerteam, 1);
        } else if (level.pausemodetimer) {
            level namespace_d576b6dc7cef9c62::pausetimer();
        }
    } else if (level.pausemodetimer) {
        level namespace_d576b6dc7cef9c62::pausetimer();
    }
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    if (progress > 0.05 && change && !zone.didstatusnotify) {
        if (ownerteam == "neutral") {
            statusdialog("hp_capturing_friendly", team);
            statusdialog("hp_capturing_enemy", otherteam);
        } else if (var_c8f4c582625f492d == #"hq") {
            statusdialog("hp_disabling_friendly", ownerteam);
            statusdialog("hp_disabling_enemy", team);
        } else {
            statusdialog("hp_capturing_enemy", ownerteam);
            statusdialog("hp_capturing_friendly", team);
        }
        zone.didstatusnotify = 1;
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fbd
// Size: 0x36
function delaydialogstatustoavoidcaptureoverlap(capture_team, otherteam) {
    wait(0.5);
    level statusdialog("hp_secured_friendly", capture_team);
    level statusdialog("hp_captured_enemy", otherteam);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ffa
// Size: 0xa7
function playcapturesound(progress, team) {
    zone = self;
    if (!isdefined(zone.lastsfxplayedtime)) {
        zone.lastsfxplayedtime = gettime();
    }
    if (zone.lastsfxplayedtime + 995 < gettime()) {
        zone.lastsfxplayedtime = gettime();
        var_c3ddfb0eaa8f761c = "";
        progress = int(floor(progress * 10));
        var_c3ddfb0eaa8f761c = "mp_dom_capturing_tick_0" + progress;
        zone.visuals[0] playsoundtoteam(var_c3ddfb0eaa8f761c, team);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a8
// Size: 0x1a6
function zone_onuseend(team, player, success) {
    if (isdefined(player)) {
        player.isonobjective = 0;
    }
    zone = self;
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    level notify("stop_contested_stats_thread");
    if (!success) {
        var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
        if (var_c8f4c582625f492d == #"hq") {
            if (ownerteam != "neutral") {
                adjustmatchtimerpausedstatefromscore(ownerteam);
            }
        } else if (level.pausemodetimer) {
            level namespace_d576b6dc7cef9c62::resumetimer();
        }
    }
    if (isplayer(player)) {
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    if (ownerteam == "neutral") {
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        if (istrue(level.usehpzonebrushes)) {
            foreach (player in level.players) {
                zone showzoneneutralbrush(player);
            }
        }
    } else {
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        foreach (player in level.players) {
            zone showcapturedhardpointeffecttoplayer(ownerteam, player);
        }
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2255
// Size: 0x19c
function zone_onunoccupied() {
    zone = self;
    var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
    if (var_c8f4c582625f492d == #"hq" && zone.ownerteam != "neutral") {
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        adjustmatchtimerpausedstatefromscore(zone.ownerteam);
        zone function_684d05448781a1f4();
    } else if (var_c8f4c582625f492d == #"hash_6a87626330d9d40e" && zone.ownerteam != "neutral") {
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        zone function_684d05448781a1f4();
    } else if (var_c8f4c582625f492d == #"wm" && zone.ownerteam != "neutral") {
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        zone function_684d05448781a1f4();
    } else {
        level notify("zone_destroyed");
        level.hpcapteam = "neutral";
        if (level.pausemodetimer) {
            level namespace_d576b6dc7cef9c62::resumetimer();
        }
        level namespace_f1b0a92156c7301c::updateservericons("neutral", 0);
        zone.wasleftunoccupied = 1;
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        zone playhardpointneutralfx();
        zone thread updatechevrons("idle");
    }
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, "neutral");
    zone notify("zone_unoccupied");
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f8
// Size: 0x2f7
function zone_oncontested() {
    zone = self;
    zone thread namespace_f1b0a92156c7301c::function_69c581621849df52();
    if (level.pausemodetimer) {
        level namespace_d576b6dc7cef9c62::resumetimer();
    }
    zone.contestedtime = gettime();
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontested);
    level namespace_f1b0a92156c7301c::updateservericons(ownerteam, 1);
    zone thread updatechevrons("contested");
    foreach (team in level.teamnamelist) {
        if (zone.touchlist[team].size) {
            touchlist = zone.touchlist[team];
            var_59db5d0f4e3000a7 = getarraykeys(touchlist);
            for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
                player = touchlist[var_59db5d0f4e3000a7[index]].player;
                if (isplayer(player)) {
                    player setclientomnvar("ui_objective_pinned_text_param", 3);
                }
            }
        }
    }
    foreach (player in level.players) {
        zone showcapturedhardpointeffecttoplayer(ownerteam, player);
    }
    if (ownerteam == "neutral") {
        notifyteam = zone.claimteam;
    } else {
        notifyteam = ownerteam;
    }
    var_c8f4c582625f492d = function_1823ff50bb28148d(getgametype());
    if (var_c8f4c582625f492d != #"hash_6a87626330d9d40e") {
        foreach (entry in level.teamnamelist) {
            statusdialog("hp_contested", entry);
        }
    } else {
        zone function_684d05448781a1f4();
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = zone;
    var_7e2c53b0bcf117d9.eventname = "hill_contested";
    var_7e2c53b0bcf117d9.position = zone.trigger.origin;
    zone thread function_da1f3979f22bb288(zone.trigger.origin, "jup_shared_zone_contested", 3);
    zone.didstatusnotify = 1;
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, "neutral");
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f6
// Size: 0x33a
function zone_onuncontested(lastclaimteam) {
    zone = self;
    level notify("stop_contested_stats_thread");
    zone thread function_82b6a3e1bcda539b(zone.trigger.origin, "jup_shared_zone_uncontested", 3);
    if (level.pausemodetimer) {
        level namespace_d576b6dc7cef9c62::pausetimer();
    }
    ownerteam = zone namespace_19b4203b51d56488::getownerteam();
    if (lastclaimteam == "none" || ownerteam == "neutral") {
        zone namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        if (istrue(level.usehpzonebrushes)) {
            foreach (player in level.players) {
                zone showzoneneutralbrush(player);
            }
        }
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = zone;
        var_7e2c53b0bcf117d9.eventname = "hill_empty";
        var_7e2c53b0bcf117d9.position = zone.trigger.origin;
        if (ownerteam == "neutral") {
            playsoundatpos(zone.trigger.origin, "jup_shared_zone_neutral_ping");
        }
    } else {
        var_c8f4c582625f492d = function_1823ff50bb28148d(function_60bf8d82001fc22c());
        if (var_c8f4c582625f492d == #"koth") {
            namespace_a34451ae3d453e::playsoundonplayers("mp_hardpoint_captured_positive", ownerteam);
            namespace_a34451ae3d453e::playsoundonplayers("mp_hardpoint_captured_negative", getotherteam(ownerteam)[0]);
        } else if (var_c8f4c582625f492d == #"grnd") {
            namespace_a34451ae3d453e::playsoundonplayers("mp_dropzone_captured_positive", ownerteam);
            namespace_a34451ae3d453e::playsoundonplayers("mp_dropzone_captured_negative", getotherteam(ownerteam)[0]);
        }
        zone function_dcbc745e92f98a9f(level.icondefend, level.iconcapture);
        foreach (player in level.players) {
            zone showcapturedhardpointeffecttoplayer(ownerteam, player);
        }
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = zone;
        var_7e2c53b0bcf117d9.eventname = "hill_uncontested";
        var_7e2c53b0bcf117d9.position = zone.trigger.origin;
    }
    contestedtime = (gettime() - zone.contestedtime) * 0.001;
    logannouncement(undefined, undefined, "Zone Contested", zone.trigger.origin, contestedtime + " seconds");
    zone.contestedtime = undefined;
    zone function_684d05448781a1f4();
    level namespace_f1b0a92156c7301c::updateservericons(ownerteam, 0);
    zone.didstatusnotify = 0;
    zone namespace_5a22b6f3a56f7e9b::function_9b1a086f348520b0(zone.objidnum, "neutral");
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a37
// Size: 0x14
function zone_stompeenemyprogressupdate(team) {
    adjustmatchtimerpausedstatefromscore(team);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a52
// Size: 0x56
function zone_stompprogressreward(player) {
    zone = self;
    player thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
    player thread namespace_48a08c5037514e04::doscoreevent(#"hash_2d96ced878338cd2");
    zone namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefending, level.iconcapture);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aaf
// Size: 0x97
function function_dcbc745e92f98a9f(friendlyicon, var_30f120a1efc1dcbe) {
    if (function_1823ff50bb28148d(getgametype()) == #"wm" && !self.stalemate) {
        if (self.numtouching[self.ownerteam]) {
            friendlyicon = level.icondefending;
        }
        if (self.numtouching[getotherteam(self.ownerteam)[0]]) {
            var_30f120a1efc1dcbe = level.icontaking;
            friendlyicon = level.iconlosing;
        }
    }
    namespace_19b4203b51d56488::setobjectivestatusicons(friendlyicon, var_30f120a1efc1dcbe);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4d
// Size: 0xbb
function zone_onpinnedstate(player) {
    zone = self;
    if (!zone.stalemate) {
        if (zone.ownerteam != "neutral" && zone.numtouching[zone.ownerteam] || function_1823ff50bb28148d(getgametype()) == #"wm" && isdefined(player.team) && zone.numtouching[player.team]) {
            zone function_dcbc745e92f98a9f(level.icondefending, level.iconcapture);
        }
    }
    function_e4c3058ef8c3819e(zone);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c0f
// Size: 0xa2
function zone_onunpinnedstate(player) {
    zone = self;
    if (!zone.stalemate) {
        if (zone.ownerteam != "neutral" && !zone.numtouching[zone.ownerteam] || isdefined(player.team) && !zone.numtouching[player.team]) {
            zone function_dcbc745e92f98a9f(level.icondefend, level.iconcapture);
        }
    }
    function_e4c3058ef8c3819e(zone);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb8
// Size: 0x87
function adjustmatchtimerpausedstatefromscore(team, var_ac8cfc833c6f6e23) {
    if (!level.pausemodetimer) {
        return;
    }
    var_e3f1a73a39054069 = namespace_e8a49b70d0769b66::_getteamscore(team);
    otherteamscore = namespace_e8a49b70d0769b66::_getteamscore(getotherteam(team)[0]);
    if (istrue(var_ac8cfc833c6f6e23)) {
        if (otherteamscore > var_e3f1a73a39054069) {
            level namespace_d576b6dc7cef9c62::resumetimer();
        } else {
            level namespace_d576b6dc7cef9c62::pausetimer();
        }
    } else if (var_e3f1a73a39054069 > otherteamscore) {
        level namespace_d576b6dc7cef9c62::resumetimer();
    } else {
        level namespace_d576b6dc7cef9c62::pausetimer();
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d46
// Size: 0x4c
function setcrankedtimerzonecap(player) {
    if ((function_f698bfd3efa33302() || function_e9f3a160bbefe208(player)) && isdefined(player.cranked) && player.cranked) {
        player namespace_58012cf453ba1014::setcrankedplayerbombtimer("assist");
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d99
// Size: 0x65
function playhardpointneutralfx() {
    if (istrue(level.usehpzonebrushes)) {
        foreach (player in level.players) {
            showzoneneutralbrush(player);
        }
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e05
// Size: 0xaf
function showcapturedhardpointeffecttoplayer(capture_team, player) {
    zone = self;
    var_8e879faf3052e0d2 = player.team;
    iscodcaster = player iscodcaster();
    if (iscodcaster) {
        if (player ismlgfreecamenabled() || player ismlgaerialcamenabled()) {
            var_8e879faf3052e0d2 = "allies";
        } else {
            var_8e879faf3052e0d2 = player function_638eebeff841e16a();
        }
    }
    if (istrue(level.usehpzonebrushes)) {
        if (zone.stalemate) {
            showzonecontestedbrush(player);
        } else if (var_8e879faf3052e0d2 == capture_team) {
            showzonefriendlybrush(player);
        } else {
            showzoneenemybrush(player);
        }
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebb
// Size: 0x60
function showzoneneutralbrush(player) {
    zone = self;
    zone.friendlybrush hidefromplayer(player);
    zone.enemybrush hidefromplayer(player);
    zone.contestedbrush hidefromplayer(player);
    zone.neutralbrush showtoplayer(player);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f22
// Size: 0x60
function showzonefriendlybrush(player) {
    zone = self;
    zone.friendlybrush showtoplayer(player);
    zone.enemybrush hidefromplayer(player);
    zone.contestedbrush hidefromplayer(player);
    zone.neutralbrush hidefromplayer(player);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f89
// Size: 0x60
function showzoneenemybrush(player) {
    zone = self;
    zone.friendlybrush hidefromplayer(player);
    zone.enemybrush showtoplayer(player);
    zone.contestedbrush hidefromplayer(player);
    zone.neutralbrush hidefromplayer(player);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff0
// Size: 0x60
function showzonecontestedbrush(player) {
    zone = self;
    zone.friendlybrush hidefromplayer(player);
    zone.enemybrush hidefromplayer(player);
    zone.contestedbrush showtoplayer(player);
    zone.neutralbrush hidefromplayer(player);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3057
// Size: 0x60
function hideplayerspecificbrushes(player) {
    zone = self;
    zone.friendlybrush hidefromplayer(player);
    zone.enemybrush hidefromplayer(player);
    zone.neutralbrush hidefromplayer(player);
    zone.contestedbrush hidefromplayer(player);
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30be
// Size: 0x55
function onplayerjoinedteam(player) {
    zone = self;
    if (player.team != "spectator" && zone.ownerteam != "neutral") {
        zone showcapturedhardpointeffecttoplayer(zone.ownerteam, player);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311a
// Size: 0x262
function removechevronsfromarray(othervisuals, label) {
    var_c081a38873b1d5e3 = [];
    var_d23f6234846f86a6 = [];
    switch (level.mapname) {
    case #"hash_9de262a7132ec180":
        var_d23f6234846f86a6["1"] = [0:(-564, 1848, 24)];
        var_d23f6234846f86a6["2"] = [0:(-1314, 440, 24), 1:(-1362, 816, 24)];
        break;
    case #"hash_66ce5cdcd3b547f3":
    case #"hash_ff009e5fab42b778":
        var_d23f6234846f86a6["3"] = [0:(-692, 1828, 42), 1:(-300, 1548, 76)];
        break;
    case #"hash_f09747c9feb47eb1":
        var_d23f6234846f86a6["8"] = [0:(688, 256, 280)];
        var_d23f6234846f86a6["20"] = [0:(212, 1436, 338)];
        break;
    case #"hash_81b84d832a53ee33":
        var_d23f6234846f86a6["5"] = [0:(778, -1458, 136), 1:(860, -1226, 158)];
        break;
    case #"hash_dfa04d97b4cc9b44":
        var_d23f6234846f86a6["5"] = [0:(-6792, 42420, 221), 1:(-6680, 42778, 213)];
        break;
    default:
        break;
    }
    if (isdefined(var_d23f6234846f86a6[label])) {
        foreach (visual in othervisuals) {
            foreach (entry in var_d23f6234846f86a6[label]) {
                if (distance(visual.origin, entry) < 10) {
                    var_c081a38873b1d5e3[var_c081a38873b1d5e3.size] = visual;
                    break;
                }
            }
        }
    }
    othervisuals = array_remove_array(othervisuals, var_c081a38873b1d5e3);
    return othervisuals;
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3384
// Size: 0xc5
function postshipmodifychevrons(othervisuals, label) {
    var_34dce00df63cff91 = [];
    var_c081a38873b1d5e3 = [];
    if (isdefined(var_34dce00df63cff91[label])) {
        foreach (entry in var_34dce00df63cff91[label]) {
            origin = entry[0];
            angles = entry[1];
            scriptable = spawnscriptable("hardpoint_chevron", origin, angles);
            var_c081a38873b1d5e3[var_c081a38873b1d5e3.size] = scriptable;
        }
    }
    othervisuals = array_combine(othervisuals, var_c081a38873b1d5e3);
    return othervisuals;
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3451
// Size: 0x37
function createvisualsinfo(scriptable, origin, angles) {
    scriptable.origin = origin;
    scriptable.angles = angles;
    return scriptable;
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3490
// Size: 0x4c
function function_da1f3979f22bb288(var_ae88ea07db0620cf, alias, timer) {
    if (!isdefined(self.var_4efd1a215d3e63d6)) {
        playsoundatpos(var_ae88ea07db0620cf, alias);
        self.var_4efd1a215d3e63d6 = 1;
        wait(timer);
        self.var_4efd1a215d3e63d6 = undefined;
    } else {
        return;
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e3
// Size: 0x4c
function function_82b6a3e1bcda539b(var_ae88ea07db0620cf, alias, timer) {
    if (!isdefined(self.var_e264252f7f1f6def)) {
        playsoundatpos(var_ae88ea07db0620cf, alias);
        self.var_e264252f7f1f6def = 1;
        wait(timer);
        self.var_e264252f7f1f6def = undefined;
    } else {
        return;
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3536
// Size: 0x111
function calculatespawndisttozones(spawnpoint, maxdistance) {
    if (!isdefined(maxdistance)) {
        maxdistance = 5000;
    }
    spawnpoint.scriptdata.var_c7e3d9e2f0dd4e7 = [];
    foreach (zone in level.objectives) {
        dist = getpathdist(spawnpoint.origin, zone.origin, maxdistance);
        if (dist < 0) {
            dist = utility::distance_2d_squared(spawnpoint.origin, zone.origin);
        } else {
            dist = dist * dist;
        }
        spawnpoint.scriptdata.var_c7e3d9e2f0dd4e7[zone getentitynumber()] = dist;
        if (dist > zone.furthestspawndistsq) {
            zone.furthestspawndistsq = dist;
        }
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x364e
// Size: 0x12f
function function_492958e372181db0(spawnpoint, zones, maxdistance) {
    if (!isdefined(maxdistance)) {
        maxdistance = 5000;
    }
    spawnpoint.scriptdata.var_c7e3d9e2f0dd4e7 = [];
    foreach (zone in zones) {
        dist = getpathdist(spawnpoint.origin, zone.trigger.origin, maxdistance);
        if (dist < 0) {
            dist = utility::distance_2d_squared(spawnpoint.origin, zone.trigger.origin);
        } else {
            dist = dist * dist;
        }
        spawnpoint.scriptdata.var_c7e3d9e2f0dd4e7[zone.trigger getentitynumber()] = dist;
        if (dist > zone.furthestspawndistsq) {
            zone.furthestspawndistsq = dist;
        }
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3784
// Size: 0x1ed
function function_abdea33c2ac7149b(spawntype, spawnset) {
    var_6e51138d961d7ddd = namespace_36f464722d326bbe::function_a0148d3a4a97bbb1();
    foreach (spawnpoint in level.spawnglobals.spawnsetlists[spawnset]) {
        var_7ba87fdf5e9815e0 = [];
        if (isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy != "") {
            var_aa5c00f4cc732317 = [];
            if (var_6e51138d961d7ddd) {
                var_aa5c00f4cc732317 = strtok(spawnpoint.target, " ");
            } else {
                var_aa5c00f4cc732317 = strtok(spawnpoint.script_noteworthy, " ");
            }
            foreach (zoneindex in var_aa5c00f4cc732317) {
                zone = level.objectives[zoneindex];
                /#
                    assertex(isdefined(zone), "Zone Index "" + zoneindex + "" does not exist, ensure a hardpoint_zone trigger is created for this index.");
                #/
                if (isdefined(zone)) {
                    var_7ba87fdf5e9815e0[var_7ba87fdf5e9815e0.size] = zone;
                }
            }
        }
        if (var_7ba87fdf5e9815e0.size == 0) {
            var_7ba87fdf5e9815e0 = level.objectives;
        }
        foreach (zone in var_7ba87fdf5e9815e0) {
            zone.spawnpoints[spawntype][zone.spawnpoints[spawntype].size] = spawnpoint;
        }
        function_492958e372181db0(spawnpoint, var_7ba87fdf5e9815e0);
    }
}

// Namespace namespace_10eb9162061dea8d/namespace_8276d48525f0f398
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3978
// Size: 0x277
function function_4265173fd3869f34(spawntype, spawnset, var_6170ec00c4bc9b5b) {
    if (!spawnlogic::function_b17bf43316b9fb08()) {
        return function_abdea33c2ac7149b(spawntype, spawnset);
    }
    var_5bb7552749b30524 = [0:"zone1", 1:"zone2", 2:"zone3", 3:"zone4", 4:"zone5", 5:"zone6", 6:"zone7", 7:"zone8", 8:"zone9", 9:"zone10"];
    /#
        assertex(var_5bb7552749b30524.size >= level.objectives, "Script needs to be updated to handle more than " + var_5bb7552749b30524.size + " zones.");
    #/
    foreach (spawnpoint in level.spawnglobals.spawnsetlists[spawnset]) {
        var_7ba87fdf5e9815e0 = [];
        foreach (zone in level.objectives) {
            zoneindex = int(zone.objectivekey) - 1;
            /#
                assert(zoneindex >= 0 && zoneindex < var_5bb7552749b30524.size);
            #/
            var_9e9bd2d16bf2b7e5 = var_5bb7552749b30524[int(zone.objectivekey) - 1];
            /#
                assertex(isdefined(var_9e9bd2d16bf2b7e5), "Zone spawn value is not valid for zone " + zone.objectivekey);
            #/
            if (function_7dd257e3ae572dc0(spawnpoint.index, var_6170ec00c4bc9b5b, var_9e9bd2d16bf2b7e5)) {
                var_7ba87fdf5e9815e0[var_7ba87fdf5e9815e0.size] = zone;
            }
        }
        if (var_7ba87fdf5e9815e0.size == 0) {
            var_7ba87fdf5e9815e0 = level.objectives;
        }
        foreach (zone in var_7ba87fdf5e9815e0) {
            zone.spawnpoints[spawntype][zone.spawnpoints[spawntype].size] = spawnpoint;
        }
        function_492958e372181db0(spawnpoint, var_7ba87fdf5e9815e0);
    }
}

