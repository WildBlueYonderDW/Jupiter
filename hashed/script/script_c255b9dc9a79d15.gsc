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
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_110fd2130c2ed1fe;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_64acb6ce534155b7;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_challenges.gsc;

#namespace namespace_44c44f8777017fce;

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0
// Size: 0xbf
function function_fc0a70293a565642(var_b0fdc80d7bac5654) {
    players = undefined;
    playerteam = undefined;
    var_96674628376eaba6 = undefined;
    if (var_b0fdc80d7bac5654 == "hunter") {
        players = self.var_579ac64eafb44d97;
        playerteam = self.hunterteam;
        var_96674628376eaba6 = self.var_f2ac96e684ba151b;
    }
    if (var_b0fdc80d7bac5654 == "target") {
        players = self.var_afc29c10d530d13e;
        playerteam = self.targetteam;
        var_96674628376eaba6 = self.var_6cfade342f01731e;
    }
    /#
        assert(isdefined(playerteam));
    #/
    if (isdefined(players)) {
        return players;
    } else if (isdefined(playerteam)) {
        if (isdefined(var_96674628376eaba6)) {
            return getsquadmates(playerteam, var_96674628376eaba6);
        } else {
            return getteamdata(playerteam, "players");
        }
    }
    return [];
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377
// Size: 0xb7
function function_87afe756cb5dfde7(var_b0fdc80d7bac5654, var_1f4e8b926c213a9a) {
    players = function_fc0a70293a565642(var_b0fdc80d7bac5654);
    center = (0, 0, 0);
    validplayers = getvalidplayersinarray(players, var_1f4e8b926c213a9a);
    if (validplayers.size <= 0) {
        return center;
    }
    foreach (player in validplayers) {
        center = center + player.origin;
    }
    center = center / validplayers.size;
    return center;
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x436
// Size: 0x4a
function function_9d1c5280f5963c8c(var_b0fdc80d7bac5654, var_ab0f126b12b30e01, params) {
    /#
        assertex(isdefined(var_ab0f126b12b30e01), "No splash_key defined for message being displayed to '" + var_b0fdc80d7bac5654);
    #/
    players = function_fc0a70293a565642(var_b0fdc80d7bac5654);
    displaysplashtoplayers(players, var_ab0f126b12b30e01, params);
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487
// Size: 0x5c
function function_6f8e4ad4812f9004(dialog, var_b0fdc80d7bac5654, var_a64cad1ecc519617, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d) {
    players = function_fc0a70293a565642(var_b0fdc80d7bac5654);
    level namespace_d3d40f75bb4e4c32::brleaderdialog(dialog, var_a64cad1ecc519617, function_fc0a70293a565642(var_b0fdc80d7bac5654), undefined, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d);
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ea
// Size: 0x7b
function function_448f9af17b797c5a(var_b0fdc80d7bac5654, var_939b8e8818bfd5ae, state, missionid) {
    foreach (player in function_fc0a70293a565642(var_b0fdc80d7bac5654)) {
        player displaysquadmessagetoplayer(var_939b8e8818bfd5ae, state, missionid);
    }
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c
// Size: 0x80
function function_daad346821543e6f(var_b0fdc80d7bac5654, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    foreach (player in function_fc0a70293a565642(var_b0fdc80d7bac5654)) {
        if (_validateplayer(player, filter)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f4
// Size: 0x90
function function_9f8af67e38f19b5d(var_b0fdc80d7bac5654, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    players = [];
    foreach (player in function_fc0a70293a565642(var_b0fdc80d7bac5654)) {
        if (_validateplayer(player, filter)) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68c
// Size: 0xae
function function_902f03d6a23a0a45(team, squad, ref) {
    if (getsubgametype() != "rumble_mgl") {
        return;
    }
    if (isdefined(level.squaddata) && isdefined(level.squaddata[team])) {
        foreach (player in level.squaddata[team][squad].players) {
            player thread namespace_48a08c5037514e04::doscoreevent(ref);
        }
    }
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x741
// Size: 0x9a
function function_4a05a71ec50d0d26(team, squad, var_1f4e8b926c213a9a) {
    filter = _validateplayerfilter(var_1f4e8b926c213a9a);
    players = [];
    foreach (player in getsquadmates(team, squad)) {
        if (_validateplayer(player, filter)) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e3
// Size: 0xae
function function_1143f0b866e4163a(team, squad, filter) {
    center = (0, 0, 0);
    validplayers = function_4a05a71ec50d0d26(team, squad, filter);
    if (validplayers.size <= 0) {
        return center;
    }
    foreach (player in validplayers) {
        center = center + player.origin;
    }
    center = center / validplayers.size;
    return center;
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x899
// Size: 0x3d3
function function_998e39dbcdafdde7(player) {
    hunterteam = player.team;
    var_f2ac96e684ba151b = player.var_ff97225579de16a;
    var_3b8219d206004dfa = undefined;
    var_8d18d9f040e35327 = undefined;
    potentialtargets = level.players;
    var_ea7cd2b67d803bc4 = getquestdata("assassination").alltrackedplayers;
    var_ea7cd5b67d80425d = getteamdata(hunterteam, "players");
    excludedplayers = array_combine_unique(var_ea7cd2b67d803bc4, var_ea7cd5b67d80425d);
    filter = level.questinfo.quests["assassination"].filters[0];
    var_63b9eff90cd38e5d = 5000;
    var_877e83278a9f2eac = 30000;
    var_eb362cd8ae206e57 = 0;
    while (!isdefined(var_8d18d9f040e35327)) {
        var_eb362cd8ae206e57 = var_eb362cd8ae206e57 + 5000;
        playerlist = get_array_of_closest(player.origin, potentialtargets, excludedplayers, undefined, var_63b9eff90cd38e5d + var_eb362cd8ae206e57, var_63b9eff90cd38e5d);
        playerlist = namespace_4bc0ead8d2af3d84::getvalidplayersinarray(playerlist, filter);
        if (!isdefined(playerlist) || playerlist.size == 0) {
            if (var_eb362cd8ae206e57 > var_877e83278a9f2eac) {
                playerlist = get_array_of_closest(player.origin, potentialtargets, excludedplayers, undefined, undefined, undefined);
                playerlist = namespace_4bc0ead8d2af3d84::getvalidplayersinarray(playerlist, filter);
                if (!isdefined(playerlist) || playerlist.size == 0) {
                    return undefined;
                }
            } else {
                continue;
            }
        }
        var_ad2a19c36030d8b7 = [];
        var_3a0d4da4585d5b22 = [];
        foreach (targetplayer in playerlist) {
            var_ad2a19c36030d8b7[targetplayer.var_ff97225579de16a] = function_4a05a71ec50d0d26(targetplayer.team, targetplayer.var_ff97225579de16a, filter).size;
            var_3a0d4da4585d5b22[targetplayer.var_ff97225579de16a] = targetplayer.team;
        }
        var_43f1b6bf70e1f1ae = function_1143f0b866e4163a(hunterteam, var_f2ac96e684ba151b, filter);
        var_dac92862560b89ba = function_4a05a71ec50d0d26(hunterteam, var_f2ac96e684ba151b, filter).size;
        foreach (squad, squadsize in var_ad2a19c36030d8b7) {
            if (!isdefined(var_8d18d9f040e35327)) {
                var_3b8219d206004dfa = var_3a0d4da4585d5b22[squad];
                var_8d18d9f040e35327 = squad;
            } else {
                difference = abs(var_dac92862560b89ba - squadsize);
                if (difference < abs(var_dac92862560b89ba - var_ad2a19c36030d8b7[var_8d18d9f040e35327])) {
                    var_3b8219d206004dfa = var_3a0d4da4585d5b22[squad];
                    var_8d18d9f040e35327 = squad;
                    continue;
                } else if (difference > abs(var_dac92862560b89ba - var_ad2a19c36030d8b7[var_8d18d9f040e35327])) {
                    continue;
                }
                if (squadsize > var_ad2a19c36030d8b7[var_8d18d9f040e35327]) {
                    var_3b8219d206004dfa = var_3a0d4da4585d5b22[squad];
                    var_8d18d9f040e35327 = squad;
                    continue;
                } else if (squadsize < var_ad2a19c36030d8b7[var_8d18d9f040e35327]) {
                    continue;
                }
                var_3483706cf86edb31 = function_1143f0b866e4163a(var_3a0d4da4585d5b22[squad], squad, filter);
                var_2d7861e0bde6a28a = function_1143f0b866e4163a(var_3b8219d206004dfa, var_8d18d9f040e35327, filter);
                if (distance2d(var_43f1b6bf70e1f1ae, var_3483706cf86edb31) < distance2d(var_43f1b6bf70e1f1ae, var_2d7861e0bde6a28a)) {
                    var_3b8219d206004dfa = var_3a0d4da4585d5b22[squad];
                    var_8d18d9f040e35327 = squad;
                    continue;
                }
            }
        }
    }
    if (isdefined(var_8d18d9f040e35327)) {
        getquestdata("assassination").alltrackedplayers = array_combine(getquestdata("assassination").alltrackedplayers, getsquadmates(var_3b8219d206004dfa, var_8d18d9f040e35327));
    }
    return [0:var_3b8219d206004dfa, 1:var_8d18d9f040e35327];
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc74
// Size: 0xe8
function function_cd8a8f4da6b90ea8(squad, var_de16a768392aeea5) {
    if (!isdefined(var_de16a768392aeea5)) {
        var_de16a768392aeea5 = 0;
    }
    var_f6426590c29d7ab0 = 0;
    foreach (player in getsquadmates(self.team, squad)) {
        if (istrue(player.hasbettermissionrewards)) {
            var_f6426590c29d7ab0++;
        }
    }
    if (!var_de16a768392aeea5 && isdefined(level.questinfo.maxperkbonustier) && isdefined(level.questinfo.maxperkbonustier[squad])) {
        var_f6426590c29d7ab0 = int(min(var_f6426590c29d7ab0, level.questinfo.maxperkbonustier[squad]));
    }
    return var_f6426590c29d7ab0;
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd64
// Size: 0xec
function function_80eb0740de24aabf(team, player) {
    namespace_a011fbf6d93f25e5::branalytics_missionstart(self, player);
    level.questinfo.teamsonquests = array_add(level.questinfo.teamsonquests, team);
    level.questinfo.var_5afa170b3886678 = array_add(level.questinfo.var_5afa170b3886678, player.var_ff97225579de16a);
    if (!isdefined(level.questinfo.maxperkbonustier)) {
        level.questinfo.maxperkbonustier = [];
    }
    level.questinfo.maxperkbonustier[player.var_ff97225579de16a] = player function_cd8a8f4da6b90ea8(player.var_ff97225579de16a, 1);
    level notify("quest_started", team);
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe57
// Size: 0x95
function function_202bbf325055d2c2(category, var_a705a5a5884ebf9c) {
    foreach (player in function_fc0a70293a565642("hunter")) {
        if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
            continue;
        }
        contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(category);
        player namespace_aad14af462a74d08::oncontractstart(contractid, var_a705a5a5884ebf9c);
    }
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef3
// Size: 0xb8
function function_1e5b12a2032de6cb() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in function_fc0a70293a565642("hunter")) {
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
    var_935c70547a6790a9 = getquestdata(self.category);
    updatefunc = var_935c70547a6790a9.funcs["onTimerUpdate"];
    if (isdefined(updatefunc)) {
        [[ updatefunc ]]();
    }
    thread _questtimerwait();
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb2
// Size: 0x78
function function_1c69b851009c7518(time, var_9707ff10d99d386) {
    /#
        function_d2caa40694d469ab();
    #/
    if (!isdefined(var_9707ff10d99d386)) {
        var_9707ff10d99d386 = 0;
    }
    totaltime = time + var_9707ff10d99d386;
    var_935c70547a6790a9 = getquestdata(self.category);
    if (!var_935c70547a6790a9.usequesttimer) {
        return;
    }
    self.missiontime = gettime() + totaltime * 1000;
    function_1e5b12a2032de6cb();
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1031
// Size: 0x1a8
function function_a721f329de58f4c3(hunterteam, var_f2ac96e684ba151b, targetteam, var_6cfade342f01731e, id, player, modifier, rewardscriptable) {
    instance = createquestinstance("assassination", var_f2ac96e684ba151b, id, rewardscriptable);
    instance.modifier = modifier;
    if (!isdefined(instance.modifier)) {
        instance.modifier = "";
    }
    instance.hunterteam = hunterteam;
    instance.var_f2ac96e684ba151b = var_f2ac96e684ba151b;
    instance.targetteam = targetteam;
    instance.var_6cfade342f01731e = var_6cfade342f01731e;
    instance.targets_killed_by_hunters = 0;
    instance.hunters_killed_by_targets = 0;
    instance function_6b6b6273f8180522("Assassination_Br");
    instance getnewtargetplayer(player);
    instance.var_afc29c10d530d13e = instance function_fc0a70293a565642("target");
    instance.var_579ac64eafb44d97 = instance function_fc0a70293a565642("hunter");
    if (!isdefined(instance.targetplayer)) {
        return undefined;
    }
    instance function_80eb0740de24aabf(hunterteam, player);
    if (instance.modifier != "_all") {
        instance function_1c69b851009c7518(getquestdata("assassination").questbasetimer, 4);
    }
    instance updateassassinationthreatlevel(instance.var_6cfade342f01731e);
    instance determineobjectivevisibility();
    addquestinstance("assassination", instance);
    instance function_202bbf325055d2c2("assassination", player);
    return instance;
}

// Namespace namespace_44c44f8777017fce/namespace_47576aa14577620d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e1
// Size: 0x52c
function function_93833843135c9a25() {
    team = self.hunterteam;
    squad = self.var_f2ac96e684ba151b;
    /#
        assertex(array_contains(level.questinfo.teamsonquests, team), "releaseSquadOnAQuest called for unregistered team '" + team + "'");
    #/
    /#
        assertex(array_contains(level.questinfo.var_5afa170b3886678, squad), "releaseSquadOnAQuest called for unregistered squqad '" + squad + "'");
    #/
    /#
        function_132b6261e829fa9c();
    #/
    if (isdefined(level.questinfo.maxperkbonustier)) {
        level.questinfo.maxperkbonustier[squad] = undefined;
    }
    level.questinfo.teamsonquests = array_remove(level.questinfo.teamsonquests, team);
    level.questinfo.var_5afa170b3886678 = array_remove(level.questinfo.var_5afa170b3886678, squad);
    getquestdata("assassination").alltrackedplayers = array_remove_array(getquestdata("assassination").alltrackedplayers, function_fc0a70293a565642("target"));
    if (isdefined(self.targetplayer)) {
        self.targetplayer.hasbeentracked = 1;
    }
    var_89eddde3da46bc8d = getquestrewardtier(team);
    results = [];
    if (isdefined(self.result) && self.result == "success") {
        foreach (player in self.contributingplayers) {
            if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
                continue;
            }
            player.brmissionscompleted = namespace_d20f8ef223912e12::get_int_or_0(player.brmissionscompleted) + 1;
            if (level.var_58adce74179ab9ef) {
                player incpersstat("objectivesCompleted", 1);
                player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("missionsCompleted", player getpersstat("objectivesCompleted"));
            } else {
                player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("missionsCompleted", player.brmissionscompleted);
            }
            player namespace_3c5a4254f2b957ea::incpersstat("contracts", 1);
            if (!isdefined(player.brmissiontypescompleted)) {
                player.brmissiontypescompleted = [];
            }
            player.brmissiontypescompleted[self.questcategory] = namespace_d20f8ef223912e12::get_int_or_0(player.brmissiontypescompleted[self.questcategory]) + 1;
            player namespace_a553e80c09b00591::challengeevaluator("br_mastery_fiveContracts");
        }
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            results = givequestrewardsinstance(team, self.rewardorigin, self.rewardangles, self.rewardscriptable, self.contributingplayers);
        }
    }
    if (isdefined(self.result)) {
        var_a4bc9ad7065c48e9 = ter_op(self.result == "success", 1, 2);
        var_1bbeb265ef74bc60 = self.category;
        foreach (player in function_fc0a70293a565642("hunter")) {
            if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
                continue;
            }
            contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(self.category);
            player namespace_aad14af462a74d08::oncontractend(contractid, var_a4bc9ad7065c48e9 == 1, 1);
            player notify("calloutmarkerping_warzoneKillQuestIcon");
        }
        if (isdefined(self.var_6cfade342f01731e)) {
            var_c0cbb1ecd0d11afd = ter_op(self.result == "success", 2, 1);
            foreach (player in function_fc0a70293a565642("target")) {
                if (isbot(player) && namespace_d3d40f75bb4e4c32::istutorial()) {
                    continue;
                }
                contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(self.category);
                player namespace_aad14af462a74d08::oncontractend(contractid, var_c0cbb1ecd0d11afd == 1, 2);
            }
        }
    }
    var_50fbebdd0e036299 = function_fc0a70293a565642("hunter");
    var_5e004b0f1c9abffb = var_50fbebdd0e036299.size;
    namespace_a011fbf6d93f25e5::branalytics_missionend(self, var_89eddde3da46bc8d, results, var_5e004b0f1c9abffb);
    self notify("questEnded");
    if (isdefined(self.rewardscriptable)) {
        self.rewardscriptable notify("questEnded", team);
    }
}

