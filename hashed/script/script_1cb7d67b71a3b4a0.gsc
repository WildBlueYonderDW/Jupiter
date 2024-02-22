// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_66200b7bf3fe7a49;

#namespace namespace_67c9b7e43f686e3;

// Namespace namespace_67c9b7e43f686e3/namespace_2405c528d738b81a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173
// Size: 0x1c0
function setupobjective(trigger) {
    var_ed31f55739afcaf2 = undefined;
    label = undefined;
    visual = getent(trigger.target, "targetname");
    var_4511b372ffc686e = getentitylessscriptablearray(visual.target, "targetname");
    visuals = [0:visual];
    if (isdefined(trigger.objectivekey)) {
        objectivekey = trigger.objectivekey;
    } else {
        objectivekey = trigger.script_label;
    }
    var_1bf53dcfcb4755b1 = namespace_19b4203b51d56488::createuseobject(game["defenders"], trigger, visuals, (0, 0, 32), 1, 1);
    var_1bf53dcfcb4755b1 namespace_19b4203b51d56488::requestid(1, 1);
    var_1bf53dcfcb4755b1 namespace_19b4203b51d56488::setownerteam(game["defenders"]);
    var_1bf53dcfcb4755b1.objectivekey = objectivekey;
    var_1bf53dcfcb4755b1.iconname = objectivekey;
    var_1bf53dcfcb4755b1.trigger setusepriority(-1 - 1 - 1 - 1);
    var_1bf53dcfcb4755b1 namespace_19b4203b51d56488::setusetime(3);
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(var_1bf53dcfcb4755b1.objidnum, 0);
    var_1bf53dcfcb4755b1.trigger setuseholdduration("duration_none");
    var_1bf53dcfcb4755b1.trigger setuseprioritymax();
    var_1bf53dcfcb4755b1.trigger setuserange(256);
    var_1bf53dcfcb4755b1.onbeginuse = &function_fa7eadcccfd9f8af;
    var_1bf53dcfcb4755b1.onenduse = &function_8872296c098fd3;
    var_1bf53dcfcb4755b1.onuse = &function_a0406da3cd07c605;
    var_1bf53dcfcb4755b1.var_1b5e22b6716b9387 = 0;
    return var_1bf53dcfcb4755b1;
}

// Namespace namespace_67c9b7e43f686e3/namespace_2405c528d738b81a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b
// Size: 0x84
function function_fa7eadcccfd9f8af(player) {
    if (self.var_1b5e22b6716b9387) {
        self.var_9832d5270deb1889 = 1;
    } else {
        self.var_b7c18e4654e6881a = 1;
    }
    if (isdefined(self.var_5d8933c950c9a154)) {
        namespace_4d0d143cd3171cd5::function_e3cd4f9e858ab6ee(player, self.var_5d8933c950c9a154);
    }
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, player.team);
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.objidnum, 1);
    thread function_8a671a44c8f902ac();
}

// Namespace namespace_67c9b7e43f686e3/namespace_2405c528d738b81a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c6
// Size: 0x6b
function function_8a671a44c8f902ac() {
    self endon("hack_recovered");
    self notify("end_use");
    self endon("end_use");
    if (!isdefined(self.usetime) || self.usetime <= 0) {
        return;
    }
    while (1) {
        progress = self.curprogress / self.usetime;
        if (progress >= 1) {
            break;
        }
        waitframe();
    }
}

// Namespace namespace_67c9b7e43f686e3/namespace_2405c528d738b81a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438
// Size: 0x8c
function function_8872296c098fd3(team, player, result) {
    if (isdefined(self.var_5d8933c950c9a154)) {
        namespace_4d0d143cd3171cd5::function_c470fe81662c7d70(player);
    }
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.objidnum, 0);
    if (istrue(self.var_b7c18e4654e6881a)) {
        self.var_b7c18e4654e6881a = undefined;
    } else if (istrue(self.var_9832d5270deb1889)) {
        self.var_9832d5270deb1889 = undefined;
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    }
    self notify("end_use");
}

// Namespace namespace_67c9b7e43f686e3/namespace_2405c528d738b81a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cb
// Size: 0x15e
function function_a0406da3cd07c605(player) {
    self.curprogress = 0;
    if (!self.var_1b5e22b6716b9387) {
        self.var_1b5e22b6716b9387 = 1;
        namespace_19b4203b51d56488::setownerteam(game["attackers"]);
        namespace_19b4203b51d56488::allowuse("enemy");
        if (isdefined(self.var_29496385a7b64f4c)) {
            self [[ self.var_29496385a7b64f4c ]](player);
        }
        player namespace_48a08c5037514e04::doscoreevent(#"hash_6db5034f05db9ec0");
        thread function_4e824d591dc50cac();
        self notify("contest_robbed");
    } else {
        self.var_1b5e22b6716b9387 = 0;
        namespace_19b4203b51d56488::setownerteam(game["defenders"]);
        namespace_19b4203b51d56488::allowuse("enemy");
        namespace_5a22b6f3a56f7e9b::objective_set_show_progress(self.objidnum, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
        if (isdefined(self.var_229b5586c139bcbf)) {
            self [[ self.var_229b5586c139bcbf ]](player);
        }
        player namespace_48a08c5037514e04::doscoreevent(#"hash_4ae9ad522095ee31");
        self notify("contest_recovered");
    }
    foreach (target_player in level.players) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objidnum, target_player);
    }
}

// Namespace namespace_67c9b7e43f686e3/namespace_2405c528d738b81a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x630
// Size: 0x148
function function_4e824d591dc50cac() {
    level endon("game_ended");
    self endon("contest_recovered");
    progress = 1;
    var_e4910d32ddf4c79e = self.var_520fad4faa064280;
    if (!isdefined(var_e4910d32ddf4c79e)) {
        var_e4910d32ddf4c79e = 15;
    }
    totaltime = 1000 * var_e4910d32ddf4c79e;
    endtime = gettime() + totaltime;
    level.objectives[self.objectivekey].complete = 0;
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(self.objidnum, 1);
    while (progress > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = endtime - currenttime;
        progress = max(0, var_c301d652d9a73075 / totaltime);
        self.var_256648199aa47753 = 1 - progress;
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 1 - progress);
        waitframe();
    }
    namespace_19b4203b51d56488::disableobject();
    namespace_19b4203b51d56488::allowuse("none");
    if (isdefined(self.var_80eb66118fa863c1)) {
        self [[ self.var_80eb66118fa863c1 ]]();
    }
    self notify("obj_contest_zone_robbed");
    level.objectives[self.objectivekey].complete = 1;
}

