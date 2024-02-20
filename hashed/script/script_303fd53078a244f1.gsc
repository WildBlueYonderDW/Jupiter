// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_19633385c373011d;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_4982e25cac00f32a;

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1
// Size: 0xb8
function init() {
    level.var_55e0b414e3671f70 = spawnstruct();
    level.var_55e0b414e3671f70.overtimeScore = getdvarint(@"hash_18cbdeaaf429cff", 10000);
    level.var_55e0b414e3671f70.var_bcc631242a5514cb = getdvarint(@"hash_f1341f4aa15134f6", 100000);
    level.var_55e0b414e3671f70.var_c2ac96535e5213ea = getdvarint(@"hash_547eea684b2142d7", 2);
    level.var_55e0b414e3671f70.var_a5b0c4131fba9805 = getdvarint(@"hash_edc7e18f90773acc", 0);
    level.var_51b3a6e65caff0b8 = [];
    level.var_a2b5c48f1d7712ff = [];
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360
// Size: 0x9b
function gethighestscoringteam() {
    highestscore = 0;
    var_1ff67ba127220e2 = undefined;
    foreach (entry in level.teamnamelist) {
        teamscore = _getteamscore(entry);
        if (!isdefined(var_1ff67ba127220e2) || teamscore > highestscore) {
            highestscore = teamscore;
            var_1ff67ba127220e2 = entry;
            var_ca17acb9ea3fa61d = 0;
        }
    }
    return var_1ff67ba127220e2;
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x403
// Size: 0x3a
function _getteamscore(team) {
    level.var_51b3a6e65caff0b8[team] = function_53c4c53197386572(level.var_51b3a6e65caff0b8[team], 0);
    return int(level.var_51b3a6e65caff0b8[team]);
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x445
// Size: 0x38
function function_c3e907f56b24dbd8(player) {
    if (!isdefined(player.var_9356898b6a19a4ac)) {
        player.var_9356898b6a19a4ac = 0;
    }
    return int(player.var_9356898b6a19a4ac);
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x485
// Size: 0x1a2
function updateteamscoreplacements() {
    var_2e2dd5105ce091dc = tablesort(level.var_51b3a6e65caff0b8, "down");
    currentscore = undefined;
    var_87ab742859974d26 = 0;
    var_8acbb0d8ac1fc9fa = 0;
    placement = 0;
    var_f441d2dee6f33b34 = 1;
    foreach (team in var_2e2dd5105ce091dc) {
        score = level.var_51b3a6e65caff0b8[team];
        if (!isdefined(currentscore) || score < currentscore) {
            currentscore = score;
            placement = var_f441d2dee6f33b34;
        }
        level.var_a2b5c48f1d7712ff[team] = placement;
        if (score <= currentscore) {
            var_f441d2dee6f33b34++;
        }
        if (placement == 1) {
            var_87ab742859974d26 = _getteamscore(team);
        } else if (placement == 2) {
            var_8acbb0d8ac1fc9fa = _getteamscore(team);
        }
        foreach (teammate in getteamdata(team, "players")) {
            teammate setclientomnvar("ui_champion_br_team_placement", placement);
            teammate setclientomnvar("ui_br_player_position", placement);
        }
    }
    setomnvar("ui_champion_br_team_score_second", int(var_8acbb0d8ac1fc9fa));
    setomnvar("ui_champion_br_team_score_leader", int(var_87ab742859974d26));
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0x2e
function function_a5ba0c4d432f1524(player, score) {
    player setclientomnvar("ui_champion_br_player_score", score);
    player.var_9356898b6a19a4ac = score;
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663
// Size: 0x101
function _setteamscore(team, score) {
    level.var_51b3a6e65caff0b8[team] = score;
    updateteamscoreplacements();
    foreach (teammate in getteamdata(team, "players")) {
        teammate setclientomnvar("ui_champion_br_team_score", score);
    }
    if (!istrue(level.var_9db23a91b81905c3) && level.var_51b3a6e65caff0b8[team] >= level.var_55e0b414e3671f70.overtimeScore) {
        namespace_2d0a106261b9b151::function_9a61575de4f3d1ec();
    }
    if (level.var_51b3a6e65caff0b8[team] >= level.var_55e0b414e3671f70.var_bcc631242a5514cb && !istrue(self.var_964721ca906c5421)) {
        namespace_2d0a106261b9b151::function_ec09c585da4071ed(game["end_reason"]["score_limit_reached"]);
    }
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76b
// Size: 0x1a6
function function_8f3c16bf2d2412cb(eventref) {
    self endon("death_or_disconnect");
    if (!isdefined(self.var_2a44575989728111)) {
        self.var_2a44575989728111 = [];
    }
    foreach (event in self.var_2a44575989728111) {
        if (event.eventref == eventref) {
            return;
        }
    }
    taskid = namespace_62c556437da28f50::function_b2425a8c88e4a460(eventref);
    if (!isdefined(taskid)) {
        if (istrue(self.var_cb773bb1ead7836)) {
            return;
        } else {
            self.var_cb773bb1ead7836 = 1;
        }
    }
    eventdata = spawnstruct();
    eventdata.eventref = eventref;
    eventdata.processedscoreevent = 0;
    eventdata.score = namespace_62c556437da28f50::getscoreinfovalue(eventref);
    self.var_2a44575989728111[self.var_2a44575989728111.size] = eventdata;
    self notify("championEventPreProcess");
    self endon("championEventPreProcess");
    waitframe();
    if (!isdefined(self.var_488ed33e4875a0c1)) {
        self.var_488ed33e4875a0c1 = [];
    }
    foreach (event in self.var_2a44575989728111) {
        self.var_488ed33e4875a0c1[self.var_488ed33e4875a0c1.size] = event;
    }
    self.var_2a44575989728111 = undefined;
    thread function_3ced6a64b51063f9();
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x918
// Size: 0xb9
function function_3ced6a64b51063f9() {
    self notify("processChampionScoreQueue");
    self endon("processChampionScoreQueue");
    foreach (event in self.var_488ed33e4875a0c1) {
        if (event.processedscoreevent) {
            continue;
        }
        function_adb2f998089074a2(event.eventref, event.score);
        event.processedscoreevent = 1;
        wait(getdvarfloat(@"hash_1eb32d180bc7cff8", 0.3));
    }
    self.var_488ed33e4875a0c1 = undefined;
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d8
// Size: 0x28
function function_c9a0784e88fcf18d(channel, val) {
    if (channel == "regular_champion_score_complete") {
        self.var_cb773bb1ead7836 = 0;
    }
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa07
// Size: 0x1c6
function function_adb2f998089074a2(event, score) {
    taskid = namespace_62c556437da28f50::function_b2425a8c88e4a460(event);
    if (isdefined(taskid)) {
        stars = score / 600;
        foreach (teammate in getteamdata(self.team, "players")) {
            if (!isdefined(teammate.var_569912475ded8c1c)) {
                teammate.var_569912475ded8c1c = 0;
            }
            if (!isdefined(teammate.var_6879bb88396f7ab7)) {
                teammate.var_6879bb88396f7ab7 = 0;
            }
            teammate setclientomnvar("ui_champion_score_event_list_" + teammate.var_569912475ded8c1c, int(stars));
            teammate setclientomnvar("ui_champion_score_event_control", teammate.var_6879bb88396f7ab7 % 5 * 2);
            teammate.var_569912475ded8c1c++;
            teammate.var_569912475ded8c1c = teammate.var_569912475ded8c1c % 5;
            teammate.var_6879bb88396f7ab7++;
        }
    } else {
        if (!isdefined(self.var_569912475ded8c1c)) {
            self.var_569912475ded8c1c = 0;
        }
        if (!isdefined(self.var_6879bb88396f7ab7)) {
            self.var_6879bb88396f7ab7 = 0;
        }
        self setclientomnvar("ui_champion_score_event_list_" + self.var_569912475ded8c1c, 99);
        self setclientomnvar("ui_champion_score_event_control", self.var_6879bb88396f7ab7 % 5 * 2);
        self.var_569912475ded8c1c++;
        self.var_569912475ded8c1c = self.var_569912475ded8c1c % 5;
        self.var_6879bb88396f7ab7++;
    }
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd4
// Size: 0x1ec
function doScoreEvent(event) {
    var_e7a7e20ec68138e3 = namespace_36f464722d326bbe::isBRStyleGameType() && !namespace_4b0406965e556711::gameflag("prematch_done");
    if (istrue(level.gameended) || !isdefined(event) || var_e7a7e20ec68138e3) {
        return;
    }
    score = namespace_62c556437da28f50::getscoreinfovalue(event);
    if (!isdefined(score)) {
        logstring("brChampion_doScoreEvent() with event "" + function_f28fd66285fa2c9(event) + "", but that event doesn't exist in the gametype's scoreeventlist asset");
        score = 0;
        return;
    }
    /#
        if (istrue(level.var_55e0b414e3671f70.var_a5b0c4131fba9805)) {
            logstring("<unknown string>" + score + "<unknown string>" + function_3c8848a3a11b2553(event));
        }
    #/
    if (istrue(level.var_9db23a91b81905c3)) {
        score = score * level.var_55e0b414e3671f70.var_c2ac96535e5213ea;
    }
    if (!isgameplayteam(self.team)) {
        return;
    }
    function_a5ba0c4d432f1524(self, function_c3e907f56b24dbd8(self) + score);
    taskid = namespace_62c556437da28f50::function_b2425a8c88e4a460(event);
    if (isdefined(taskid)) {
        foreach (task in level.teamdata[self.team]["taskInfo"].tasklist) {
            if (istrue(task.var_b35bd02b951ab0a6)) {
                _setteamscore(self.team, _getteamscore(self.team) + score);
                thread function_8f3c16bf2d2412cb(event);
                task.var_b35bd02b951ab0a6 = 0;
            }
        }
    } else {
        _setteamscore(self.team, _getteamscore(self.team) + score);
        thread function_8f3c16bf2d2412cb(event);
    }
}

// Namespace namespace_4982e25cac00f32a/namespace_a5b4009d7c2e0b3d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdc7
// Size: 0x28
function function_84cb89cc5c3af95a() {
    /#
        team = "<unknown string>";
        _setteamscore(team, _getteamscore(team) + 100);
    #/
}

