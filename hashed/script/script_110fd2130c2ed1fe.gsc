// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_c255b9dc9a79d15;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\script.gsc;

#namespace namespace_dad6d813fbbde071;

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667
// Size: 0x254
function init() {
    enabled = registerquestcategory("assassination", 1);
    if (!enabled) {
        return;
    }
    registerquestcategorytablevalues("assassination" + "_all");
    registerquestcategorytablevalues("assassination" + "_all_timed");
    level.br_leaderbystreak = getdvarint(@"hash_22c4c1f9efb1de0a", 0) != 0;
    getquestdata("assassination").questbasetimer = getdvarint(@"hash_2f9cd2b10d05e2b3", 180);
    getquestdata("assassination").questbonustimer = getdvarint(@"hash_23b6f8f2af592fc1", 60);
    getquestdata("assassination").resettimeronkill = getdvarint(@"hash_b18c855819438fde", 1);
    registerquestthink("assassination", &aq_questthink_circleposition, 10);
    registerquestthink("assassination", &aq_questthink_objectivevisibility, 0.2);
    registerremovequestinstance("assassination", &aq_removequestinstance);
    registeronplayerkilled("assassination", &aq_playerdied);
    registeronplayerdisconnect("assassination", &aq_playerdisconnect);
    var_2e06828ec179f5be = array_add(level.questinfo.defaultfilter, &filtercondition_hasbeentracked);
    var_2e06828ec179f5be = array_add(level.questinfo.defaultfilter, &filtercondition_isdowned);
    registerplayerfilter("assassination", var_2e06828ec179f5be, 0);
    questtimerinit("assassination", 1);
    registerontimerupdate("assassination", &aq_ontimerupdate);
    registerontimerexpired("assassination", &aq_ontimerexpired);
    getquestdata("assassination").alltrackedplayers = [];
    allassassin_init();
    /#
        assert(isdefined(game["dialog"]));
    #/
    game["dialog"]["mission_ass_accept"] = "mission_mission_ass_single_accept";
    game["dialog"]["mission_ass_hunted"] = "mission_mission_ass_hunted";
    game["dialog"]["mission_ass_success"] = "mission_mission_ass_single_success";
    game["dialog"]["mission_ass_hunted_success"] = "mission_mission_ass_hunted_success";
    game["dialog"]["mission_ass_hunted_timed_out"] = "mission_mission_ass_hunted_timed_out";
    game["dialog"]["mission_ass_fail"] = "mission_mission_ass_fail";
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c2
// Size: 0x2e
function filtercondition_hasbeentracked(player) {
    if (isdefined(player.hasbeentracked) && player.hasbeentracked) {
        return 0;
    }
    return 1;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f8
// Size: 0x5b
function aq_questthink_circleposition() {
    /#
        function_d2caa40694d469ab();
    #/
    if (self.modifier == "_all_timed") {
        return;
    }
    if (!isdefined(self.targetplayer)) {
        getnewtargetplayer();
    }
    determinetrackingcircleposition(self.targetplayer);
    determinetrackingcirclesize();
    updateassassinationthreatlevel(self.targetteam);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95a
// Size: 0x19
function aq_questthink_objectivevisibility() {
    if (getsubgametype() != "champion") {
        determineobjectivevisibility();
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a
// Size: 0x36
function aq_removequestinstance() {
    if (istrue(level.var_59c0b24ba708e3c)) {
        function_93833843135c9a25();
        removeallaqui();
        return;
    }
    releaseteamonquest(self.hunterteam);
    removeallaqui();
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x246
function takequestitem(pickupent) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    if (istrue(level.var_59c0b24ba708e3c)) {
        function_902f03d6a23a0a45(self.team, self.var_ff97225579de16a, #"hash_67eb4b642067882a");
        hunterteam = self.team;
        var_f2ac96e684ba151b = self.var_ff97225579de16a;
        /#
            assert(isdefined(var_f2ac96e684ba151b));
        #/
        besttarget = function_998e39dbcdafdde7(self);
        instance = undefined;
        if (isdefined(besttarget) && besttarget.size >= 2) {
            targetteam = besttarget[0];
            var_6cfade342f01731e = besttarget[1];
            instance = function_a721f329de58f4c3(hunterteam, var_f2ac96e684ba151b, targetteam, var_6cfade342f01731e, pickupent.index, self, "", pickupent);
        }
    } else {
        giveteampoints(self.team, #"hash_67eb4b642067882a");
        hunterteam = self.team;
        targetteam = determinetargetteam(self);
        instance = givequest(hunterteam, targetteam, pickupent.index, self, "", pickupent);
    }
    if (!isdefined(instance)) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_assassination_notargets", undefined, 5);
        var_e141356311900568 = spawnstruct();
        var_e141356311900568.origin = pickupent.origin;
        var_e141356311900568.angles = pickupent.angles;
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        if (brgametype == "plunder" || brgametype == "risk") {
            var_6b5e1783915835c1 = "mp/loot_set_cache_contents_dmz.csv";
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "health", var_6b5e1783915835c1);
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 1, 1, "plunder", var_6b5e1783915835c1);
        } else {
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "health");
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo");
            var_e141356311900568 namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 1, 1, "plunder");
        }
        return;
    }
    instance givequestsplash(self);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc04
// Size: 0x13f
function givequestsplash(var_6006e8173093c1e4) {
    /#
        function_d2caa40694d469ab();
    #/
    params = spawnstruct();
    params.excludedplayers = [];
    params.excludedplayers[0] = self.targetplayer;
    if (isdefined(var_6006e8173093c1e4)) {
        params.excludedplayers[1] = var_6006e8173093c1e4;
    }
    params.stringvar = self.targetplayer.name;
    function_9d1c5280f5963c8c("target", "br_assassination_quest_start_target_team", params);
    displayplayersplash(self.targetplayer, "br_assassination_quest_start_target_player");
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        thread function_6f8e4ad4812f9004("mission_ass_hunted", "target", 1);
    }
    params.plundervar = getquestplunderrewardinstance(getquestrewardtier(self.hunterteam));
    function_9d1c5280f5963c8c("hunter", "br_assassination_quest_start_hunter_team", params);
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        thread function_6f8e4ad4812f9004("mission_ass_accept", "hunter", 1);
    }
    if (isdefined(var_6006e8173093c1e4)) {
        displayplayersplash(var_6006e8173093c1e4, "br_assassination_quest_start_tablet_finder", params);
        function_448f9af17b797c5a("hunter", var_6006e8173093c1e4, 6, getquestindex("assassination"));
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4a
// Size: 0x1f6
function givequest(hunterteam, targetteam, id, player, modifier, rewardscriptable) {
    instance = createquestinstance("assassination", hunterteam, id, rewardscriptable);
    instance.modifier = modifier;
    if (!isdefined(instance.modifier)) {
        instance.modifier = "";
    }
    instance registerteamonquest(hunterteam, player);
    instance.hunterteam = hunterteam;
    instance.targetteam = targetteam;
    instance.targets_killed_by_hunters = 0;
    instance.hunters_killed_by_targets = 0;
    instance.targetteamremaining = 0;
    if (isdefined(targetteam)) {
        instance.targetteamremaining = instance getvalidplayersinteam(targetteam).size;
    }
    if (!isdefined(instance.targetteam)) {
        cancelgivequest(instance);
        return undefined;
    }
    if (instance.modifier != "_all") {
        instance questtimerset(getquestdata("assassination").questbasetimer, 4);
    }
    instance function_6b6b6273f8180522("Assassination_Br");
    instance getnewtargetplayer(player);
    if (!isdefined(instance.targetplayer)) {
        cancelgivequest(instance);
        return undefined;
    }
    if (instance.modifier == "_all_timed") {
        level.teamdata[hunterteam]["hasFailed"] = 0;
    }
    instance determinetrackingcircleposition(instance.targetplayer);
    instance determinetrackingcirclesize();
    instance updateassassinationthreatlevel(instance.targetteam);
    if (getsubgametype() == "champion") {
        level notify("quest_objective_updated_" + hunterteam, instance);
    } else {
        instance determineobjectivevisibility();
    }
    addquestinstance("assassination", instance);
    startteamcontractchallenge("assassination", player, hunterteam);
    return instance;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf48
// Size: 0x50
function cancelgivequest(instance) {
    instance function_af5604ce591768e1();
    instance.result = "no_locale";
    if (istrue(level.var_59c0b24ba708e3c)) {
        instance function_93833843135c9a25();
    } else {
        instance releaseteamonquest(instance.hunterteam);
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9f
// Size: 0x3e6
function determinetargetteam(player) {
    hunterteam = player.team;
    var_3b8219d206004dfa = undefined;
    potentialtargets = level.players;
    var_ea7cd2b67d803bc4 = getquestdata("assassination").alltrackedplayers;
    var_ea7cd5b67d80425d = getteamdata(hunterteam, "players");
    excludedteams = array_combine_unique(var_ea7cd2b67d803bc4, var_ea7cd5b67d80425d);
    var_eb362cd8ae206e57 = 0;
    filter = level.questinfo.quests["assassination"].filters[0];
    var_63b9eff90cd38e5d = 5000;
    var_877e83278a9f2eac = 30000;
    if (gametypeoverrideassassinsearchparams()) {
        var_63b9eff90cd38e5d = level.quest_assdistmin;
        var_877e83278a9f2eac = level.quest_assdistmax;
    }
    while (!isdefined(var_3b8219d206004dfa)) {
        var_eb362cd8ae206e57 = var_eb362cd8ae206e57 + 5000;
        playerlist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, var_63b9eff90cd38e5d + var_eb362cd8ae206e57, var_63b9eff90cd38e5d);
        playerlist = getvalidplayersinarray(playerlist, filter);
        if (!isdefined(playerlist) || playerlist.size == 0) {
            if (var_eb362cd8ae206e57 > var_877e83278a9f2eac) {
                playerlist = get_array_of_closest(player.origin, potentialtargets, excludedteams, undefined, undefined, undefined);
                playerlist = getvalidplayersinarray(playerlist, filter);
                if (!isdefined(playerlist) || playerlist.size == 0) {
                    return undefined;
                }
            } else {
                continue;
            }
        }
        var_3a0d4da4585d5b22 = [];
        foreach (targetplayer in playerlist) {
            var_3a0d4da4585d5b22[targetplayer.team] = getvalidplayersinteam(targetplayer.team, filter).size;
        }
        var_29f6d200784f77b3 = getteamcenter(hunterteam, filter);
        var_90b91d6205fce07f = getvalidplayersinteam(hunterteam, filter).size;
        foreach (team, teamsize in var_3a0d4da4585d5b22) {
            if (!isdefined(var_3b8219d206004dfa)) {
                var_3b8219d206004dfa = team;
            } else {
                brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
                if (brgametype == "plunder" || brgametype == "risk") {
                    var_e6a3e80614fbd020 = namespace_c6ccccd95254983f::getteamcarriedplunder(var_3b8219d206004dfa);
                    var_c237b8fc2586f74f = namespace_c6ccccd95254983f::getteamcarriedplunder(team);
                    jumpiffalse(var_c237b8fc2586f74f > 100000) LOC_000002fa;
                    jumpiffalse(var_c237b8fc2586f74f > var_e6a3e80614fbd020) LOC_000002fa;
                    var_3b8219d206004dfa = team;
                } else {
                LOC_000002fa:
                    difference = abs(var_90b91d6205fce07f - teamsize);
                    if (difference < abs(var_90b91d6205fce07f - var_3a0d4da4585d5b22[var_3b8219d206004dfa])) {
                        var_3b8219d206004dfa = team;
                        continue;
                    } else if (difference > abs(var_90b91d6205fce07f - var_3a0d4da4585d5b22[var_3b8219d206004dfa])) {
                        continue;
                    }
                    if (teamsize > var_3a0d4da4585d5b22[var_3b8219d206004dfa]) {
                        var_3b8219d206004dfa = team;
                        continue;
                    } else if (teamsize < var_3a0d4da4585d5b22[var_3b8219d206004dfa]) {
                        continue;
                    }
                    var_b78e01e4ca8f50a = getteamcenter(team, filter);
                    var_76e3e3800077282f = getteamcenter(var_3b8219d206004dfa, filter);
                    if (distance2d(var_29f6d200784f77b3, var_b78e01e4ca8f50a) < distance2d(var_29f6d200784f77b3, var_76e3e3800077282f)) {
                        var_3b8219d206004dfa = team;
                        continue;
                    }
                }
            }
        }
    }
    if (isdefined(var_3b8219d206004dfa)) {
        getquestdata("assassination").alltrackedplayers = array_combine(getquestdata("assassination").alltrackedplayers, getteamdata(var_3b8219d206004dfa, "players"));
    }
    return var_3b8219d206004dfa;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138d
// Size: 0x1ca
function determinetargetplayer(targetteam, hunter) {
    var_6864bee22874201b = undefined;
    var_b803ea87ecf23294 = undefined;
    targetplayer = undefined;
    var_29f6d200784f77b3 = function_87afe756cb5dfde7("hunter");
    foreach (player in function_fc0a70293a565642("target")) {
        if (!isplayervalid(player, getfilterformodifier(self.modifier))) {
            continue;
        }
        if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            if (is_equal(player.script_noteworthy, "assassination_target")) {
                targetplayer = player;
                break;
            }
        }
        if (!isdefined(targetplayer)) {
            targetplayer = player;
        }
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        if (brgametype == "plunder" || brgametype == "risk") {
            var_b3d7d06e99efd05e = player.plundercount;
            if (isdefined(var_b3d7d06e99efd05e)) {
                var_2cc640c4cf5d3e6a = distance2dsquared(hunter.origin, player.origin);
                if (!isdefined(var_b803ea87ecf23294) || var_2cc640c4cf5d3e6a <= var_b803ea87ecf23294) {
                    if (!isdefined(var_6864bee22874201b) || var_b3d7d06e99efd05e >= var_6864bee22874201b) {
                        var_6864bee22874201b = var_b3d7d06e99efd05e;
                        var_b803ea87ecf23294 = var_2cc640c4cf5d3e6a;
                        targetplayer = player;
                    }
                }
            }
        } else if (distance2d(var_29f6d200784f77b3, player.origin) < distance2d(var_29f6d200784f77b3, targetplayer.origin)) {
            targetplayer = player;
        }
    }
    /#
        assert(isdefined(targetplayer));
    #/
    targetplayer.hasbeentracked = 0;
    self.targetplayer = targetplayer;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155e
// Size: 0x70
function determinetrackingcircleposition(targetplayer) {
    /#
        function_d2caa40694d469ab();
    #/
    search_location = (targetplayer.origin[0], targetplayer.origin[1], getcirclesize());
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        search_location = search_location + math::random_vector_2d() * randomfloatrange(getcirclerangemin(), getcirclerangemax());
    }
    function_6e148c8da2e4db13(search_location);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d5
// Size: 0x147
function determinetrackingcirclesize() {
    /#
        function_d2caa40694d469ab();
    #/
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        function_4584ad1c0e2c58ec(level.lootleadermarksize);
        self.threat_level = 2;
        return;
    }
    var_579ac64eafb44d97 = function_9f8af67e38f19b5d("hunter");
    if (var_579ac64eafb44d97.size == 0) {
        function_4584ad1c0e2c58ec(3500);
        self.threat_level = 0;
        return;
    }
    closestdist = undefined;
    foreach (player in var_579ac64eafb44d97) {
        dist = distance2d(player.origin, self.targetplayer.origin);
        if (!isdefined(closestdist) || dist < closestdist) {
            closestdist = dist;
        }
    }
    if (closestdist > 5000) {
        function_4584ad1c0e2c58ec(3500);
        self.threat_level = 0;
    } else if (closestdist > 2500) {
        function_4584ad1c0e2c58ec(2000);
        self.threat_level = 1;
    } else {
        function_4584ad1c0e2c58ec(1500);
        self.threat_level = 2;
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1723
// Size: 0x160
function determineobjectivevisibility() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in function_fc0a70293a565642("hunter")) {
        var_1b7f5108008d55b6 = player namespace_d3d40f75bb4e4c32::isplayeringulag();
        var_4d454e0079090d74 = isdefined(player.aq_hudenabled) && player.aq_hudenabled;
        if (var_1b7f5108008d55b6 && var_4d454e0079090d74) {
            player hideassassinationhud(self);
        }
        if (!var_1b7f5108008d55b6 && !var_4d454e0079090d74) {
            player showassassinationhud(self);
        }
    }
    foreach (player in function_fc0a70293a565642("target")) {
        var_1b7f5108008d55b6 = player namespace_d3d40f75bb4e4c32::isplayeringulag();
        var_4d454e0079090d74 = isdefined(player.aq_targethudenabled) && player.aq_targethudenabled;
        if (var_1b7f5108008d55b6 && var_4d454e0079090d74) {
            player hideassassinationtargethud();
        }
        if (!var_1b7f5108008d55b6 && !var_4d454e0079090d74) {
            player showassassinationtargethud(self.targetplayer, self.threat_level);
        }
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188a
// Size: 0x81
function aq_ontimerupdate() {
    foreach (player in function_fc0a70293a565642("target")) {
        player setclientomnvar("ui_br_assassination_target_timer", self.missiontime);
    }
    if (self.modifier == "_all_timed") {
        thread assassinationtimewarning();
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1912
// Size: 0x1b3
function aq_ontimerexpired() {
    /#
        function_d2caa40694d469ab();
    #/
    if (self.modifier == "_all_timed") {
        setteamdata(self.targetteam, "hasFailed", 1);
        allassassin_timeout_end(self.hunterteam);
        removequestinstance();
    } else {
        function_9d1c5280f5963c8c("hunter", "br_assassination_timer_expire_hunters_lose");
        rewardtier = getquestrewardtier(self.targetteam);
        reward = getquestplunderreward("assassination", rewardtier);
        self.rewardmodifier = "_averted";
        params = spawnstruct();
        missionid = getquestindex("assassination");
        var_11d65784f0b6afa2 = getquestrewardgroupindex(getquestrewardbuildgroupref("assassination", self.rewardmodifier, self.modifier));
        params.packedbits = packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2);
        function_9d1c5280f5963c8c("target", "br_assassination_timer_expire_targets_win", params);
        thread function_6f8e4ad4812f9004("mission_ass_fail", "hunter", 1);
        thread function_6f8e4ad4812f9004("mission_ass_hunted_timed_out", "target", 1);
        brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
        if (brgametype != "plunder" && brgametype != "risk") {
            givequestrewardsinstance(self.targetteam, self.targetplayer.origin, self.targetplayer.angles, self.rewardscriptable, function_fc0a70293a565642("target"));
        }
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1acc
// Size: 0x3e
function aq_playerdied(attacker, victim) {
    /#
        function_d2caa40694d469ab();
    #/
    if (victim namespace_d3d40f75bb4e4c32::isplayeringulag() || attacker namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        return;
    }
    thread aq_playerremoved(victim, attacker);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b11
// Size: 0x1f
function aq_playerdisconnect(var_345221032955c106) {
    /#
        function_d2caa40694d469ab();
    #/
    thread aq_playerremoved(var_345221032955c106);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b37
// Size: 0x4c1
function aq_playerremoved(var_a1a07f4bc10bf84c, attacker) {
    /#
        function_d2caa40694d469ab();
    #/
    if (self.modifier == "_all_timed" && getteamdata(self.hunterteam, "hasFailed")) {
        return;
    }
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        if (!isbot(var_a1a07f4bc10bf84c)) {
            return;
        }
    }
    if (var_a1a07f4bc10bf84c.team == self.targetteam) {
        if (var_a1a07f4bc10bf84c == self.targetplayer) {
            var_fb0ece5f482aff3e = var_a1a07f4bc10bf84c.attackers;
            wait(0.75);
            params = spawnstruct();
            rewardtier = getquestrewardtier(self.hunterteam);
            missionid = getquestindex("assassination");
            if (isdefined(attacker) && isdefined(attacker.team) && attacker.team == self.hunterteam) {
                var_1b4ada49a21b51ca = "br_assassination_complete_hunters_win";
                self.rewardmodifier = "_target_killed";
                function_448f9af17b797c5a("hunter", attacker, 8, getquestindex("assassination"));
                if (isdefined(level.var_52781be0b4e8a959)) {
                    level [[ level.var_52781be0b4e8a959 ]](attacker.team);
                }
                if (getsubgametype() == "rumble_mgl") {
                    level notify("assassination_quest_completed", attacker.team);
                }
            } else {
                var_1b4ada49a21b51ca = "br_assassination_complete_target_vanished";
                self.rewardmodifier = "_target_vanished";
            }
            var_11d65784f0b6afa2 = getquestrewardgroupindex(getquestrewardbuildgroupref("assassination", self.rewardmodifier, self.modifier));
            params.packedbits = packsplashparambits(missionid, rewardtier, var_11d65784f0b6afa2);
            function_9d1c5280f5963c8c("hunter", var_1b4ada49a21b51ca, params);
            if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                function_6f8e4ad4812f9004("mission_ass_success", "hunter", 1);
            }
            self.rewardorigin = var_a1a07f4bc10bf84c.origin;
            self.rewardangles = var_a1a07f4bc10bf84c.angles;
            if (isdefined(var_fb0ece5f482aff3e)) {
                foreach (var_1602d6431533bdc in var_fb0ece5f482aff3e) {
                    if (isdefined(var_1602d6431533bdc.team) && var_1602d6431533bdc.team == self.hunterteam) {
                        registercontributingplayers(var_1602d6431533bdc);
                    }
                }
            }
            self.result = "success";
            removequestinstance();
        }
        if (self.modifier == "_all_timed") {
            if (!isdefined(level.gulag) || isdefined(level.gulag) && !istrue(level.gulag.shutdown)) {
                foreach (player in function_fc0a70293a565642("hunter")) {
                    if (istrue(player.inlaststand)) {
                        player namespace_10260b963310d30e::finishreviveplayer("use_hold_revive_success", player);
                    }
                    if (!isalive(player)) {
                        player namespace_cb965d2f71fefddc::addrespawntoken(1);
                        player thread namespace_47fd1e79a44628cd::playergulagautowin("aq");
                    }
                }
            }
        }
    } else if (var_a1a07f4bc10bf84c.team == self.hunterteam) {
        if (!function_daad346821543e6f("hunter", getfilterformodifier(self.modifier))) {
            brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
            if (brgametype == "plunder" || brgametype == "risk") {
                self.result = "fail";
                removequestinstance();
            } else {
                self.rewardmodifier = "_averted";
                rewards = givequestrewardsinstance(self.targetteam, var_a1a07f4bc10bf84c.origin, var_a1a07f4bc10bf84c.angles, self.rewardscriptable, function_fc0a70293a565642("target"));
                params = spawnstruct();
                params.plundervar = get_int_or_0(rewards["plunder"]);
                function_9d1c5280f5963c8c("target", "br_assassination_complete_targets_win", params);
                self.result = "fail";
                removequestinstance();
            }
        }
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fff
// Size: 0x45
function getnewtargetplayer(hunter) {
    /#
        function_d2caa40694d469ab();
    #/
    determinetargetplayer(self.targetteam, hunter);
    determinetrackingcircleposition(self.targetplayer);
    determinetrackingcirclesize();
    updateassassinationhud();
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204b
// Size: 0xba
function removeallaqui() {
    /#
        function_d2caa40694d469ab();
    #/
    foreach (player in function_fc0a70293a565642("hunter")) {
        player hideassassinationhud(self);
    }
    foreach (player in function_fc0a70293a565642("target")) {
        player hideassassinationtargethud();
    }
    function_af5604ce591768e1();
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x210c
// Size: 0x27
function getplayerkills() {
    if (level.br_leaderbystreak) {
        return self.killsthislife.size;
    } else {
        return self.kills;
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213a
// Size: 0x4f
function getfilterformodifier(modifier) {
    switch (modifier) {
    case #"hash_b62fe7e71b905a1":
    case #"hash_ee90b669e8938abd":
        return level.questinfo.defaultfilter;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2190
// Size: 0x42
function showassassinationhud(instance) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    self.aq_hudenabled = 1;
    uiobjectiveshow("assassination" + instance.modifier);
    instance function_cfd53c8f6878014f(self);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21d9
// Size: 0x30
function hideassassinationhud(instance) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    self.aq_hudenabled = 0;
    uiobjectivehide();
    instance function_d7d113d56ef0ef5b(self);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2210
// Size: 0x72
function updateassassinationdataomnvar(targetplayer, threatlevel) {
    if (isdefined(self.aq_targethudenabled) && self.aq_targethudenabled) {
        entitynumber = targetplayer getentitynumber();
    } else {
        entitynumber = -1;
    }
    entitynumber = targetplayer getentitynumber();
    entitynumber = entitynumber + 1;
    value = threatlevel << 8 | entitynumber;
    self setclientomnvar("ui_br_assassination_target", value);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2289
// Size: 0x75
function updateassassinationthreatlevel(targetteam) {
    foreach (player in function_fc0a70293a565642("target")) {
        player updateassassinationdataomnvar(self.targetplayer, self.threat_level);
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2305
// Size: 0x32
function showassassinationtargethud(targetplayer, threatlevel) {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    self.aq_targethudenabled = 1;
    updateassassinationdataomnvar(targetplayer, threatlevel);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x233e
// Size: 0x24
function hideassassinationtargethud() {
    /#
        function_fe3b51cfbf0f97c5();
    #/
    self.aq_targethudenabled = 0;
    self setclientomnvar("ui_br_assassination_target", 0);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2369
// Size: 0xd1
function updateassassinationhud() {
    foreach (player in function_fc0a70293a565642("hunter")) {
        player showassassinationhud(self);
        player uiobjectivesetparameter(self.targetplayer getentitynumber());
    }
    foreach (player in function_fc0a70293a565642("target")) {
        player showassassinationtargethud(self.targetplayer, self.threat_level);
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2441
// Size: 0x1c2
function assassinationtimewarning() {
    self notify("assassinationTimeWarning");
    self endon("assassinationTimeWarning");
    self endon("removed");
    var_c5cb4a18bbd39719 = [0:300, 1:240, 2:180, 3:120, 4:90, 5:60, 6:30, 7:10];
    foreach (time in var_c5cb4a18bbd39719) {
        var_d57a5431d4f9d54e = (self.missiontime - gettime()) / 1000;
        delta = var_d57a5431d4f9d54e - time;
        if (delta < 0) {
            continue;
        }
        wait(delta);
        mins = int(time / 60);
        hunters = namespace_4bc0ead8d2af3d84::getvalidplayersinarray(function_fc0a70293a565642("hunter"), getfilterformodifier(self.modifier));
        foreach (player in hunters) {
            endtime = gettime() + time * 1000;
            showtime = 5;
            if (time <= 20) {
                showtime = time;
            }
            player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_assassin_mission_time_warning", endtime, showtime);
            if (mins >= 2) {
                player iprintlnbold("MP_BR_INGAME/MISSION_ASSASSIN_2_TIME_WARNING_MIN", mins);
            } else {
                player iprintlnbold("MP_BR_INGAME/MISSION_ASSASSIN_2_TIME_WARNING_SEC", time);
            }
        }
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x260a
// Size: 0xc
function allassassin_init() {
    level thread allassassin_givewait();
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261d
// Size: 0x5a
function allassassin_givewait() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    version = getdvarint(@"hash_4d250e4873e1753e", 0);
    if (!version) {
        return;
    }
    waittime = getdvarint(@"hash_35c40b91dcc26b01", 120);
    disableteamkillrewards();
    wait(waittime);
    allassassin_give(version);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267e
// Size: 0xda
function allassassin_give(version) {
    info = spawnstruct();
    info.teamlist = [];
    info.lastmissionendtime = [];
    info.resttimems = int(getdvarfloat(@"hash_e2df198f0e15683c", 10) * 1000);
    if (version == 1) {
        info.modifier = "_all";
    } else if (version == 2) {
        info.modifier = "_all_timed";
    } else {
        /#
            assertmsg("invalid allAssassin version " + version);
        #/
    }
    if (info.modifier == "_all_timed") {
        info allassassin_initteamlist_timed();
    } else {
        info allassassin_initteamlist();
    }
    info thread allassassin_applyquest();
    info thread allassassin_updatewait();
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275f
// Size: 0x1f7
function allassassin_getsortedteams() {
    var_b04ef87f1a902f58 = (0, 0, 0);
    teams = allassassin_teams();
    var_e0d75123860c4962 = [];
    foreach (team in teams) {
        leader = undefined;
        teamplayers = getteamdata(team, "players");
        foreach (player in teamplayers) {
            if (player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                continue;
            }
            if (player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
                leader = player;
                break;
            }
            if (!isdefined(leader)) {
                leader = player;
            }
        }
        if (!isdefined(leader)) {
            continue;
        }
        var_6b06fc1cf05dc054 = spawnstruct();
        var_6b06fc1cf05dc054.team = team;
        var_6b06fc1cf05dc054.pos = leader.origin;
        var_b04ef87f1a902f58 = var_b04ef87f1a902f58 + var_6b06fc1cf05dc054.pos;
        var_e0d75123860c4962[var_e0d75123860c4962.size] = var_6b06fc1cf05dc054;
    }
    if (var_e0d75123860c4962.size < 2) {
        return var_e0d75123860c4962;
    }
    var_b04ef87f1a902f58 = var_b04ef87f1a902f58 / var_e0d75123860c4962.size;
    foreach (var_6b06fc1cf05dc054 in var_e0d75123860c4962) {
        dir = var_6b06fc1cf05dc054.pos - var_b04ef87f1a902f58;
        var_6b06fc1cf05dc054.sortvalue = vectortoangles(dir)[1];
    }
    var_e0d75123860c4962 = namespace_9c840bb9f2ecbf00::quicksort(var_e0d75123860c4962, &allassassin_teamcompare);
    return var_e0d75123860c4962;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x295e
// Size: 0x1c3
function allassassin_initteamlist() {
    var_e0d75123860c4962 = allassassin_getsortedteams();
    var_62efcd976fe84759 = getdvarint(@"hash_285c13782c4ed68f", 150);
    numteams = var_e0d75123860c4962.size;
    if (isdefined(var_62efcd976fe84759)) {
        var_62efcd976fe84759 = int(min(var_62efcd976fe84759, numteams));
    } else {
        var_62efcd976fe84759 = numteams;
    }
    var_3aea174d1da06f4f = int(numteams / var_62efcd976fe84759);
    var_f246834464c55d65 = numteams % var_62efcd976fe84759;
    var_7da84e0b1bd4815e = [];
    for (i = 0; i < var_3aea174d1da06f4f; i++) {
        var_7da84e0b1bd4815e[i] = var_62efcd976fe84759;
    }
    for (i = 0; i < var_f246834464c55d65; i++) {
        var_7da84e0b1bd4815e[i % var_3aea174d1da06f4f]++;
    }
    count = 0;
    for (i = 0; i < var_7da84e0b1bd4815e.size; i++) {
        var_62efcd976fe84759 = var_7da84e0b1bd4815e[i];
        for (j = 0; j < var_62efcd976fe84759; j++) {
            team = var_e0d75123860c4962[count + j].team;
            prev = wrapindex(j - 1, var_62efcd976fe84759);
            next = wrapindex(j + 1, var_62efcd976fe84759);
            targetedby = var_e0d75123860c4962[count + prev].team;
            targeting = var_e0d75123860c4962[count + next].team;
            teaminfo = spawnstruct();
            teaminfo.targetedby = targetedby;
            teaminfo.targeting = targeting;
            self.teamlist[team] = teaminfo;
        }
        count = count + var_62efcd976fe84759;
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b28
// Size: 0x1c8
function allassassin_initteamlist_timed() {
    maxdist = getdvarfloat(@"hash_f4e01d5ab43ecd85", 10000);
    var_e0d75123860c4962 = allassassin_getsortedteams();
    for (i = 0; i < var_e0d75123860c4962.size; i++) {
        hunterteam = var_e0d75123860c4962[i].team;
        if (isdefined(self.teamlist[hunterteam])) {
            continue;
        }
        for (j = 0; j < var_e0d75123860c4962.size - 1; j++) {
            if (j % 2) {
                offset = int(-0.5 * j - 0.5);
            } else {
                offset = int(0.5 * j + 1);
            }
            var_8f632e019ead6a8b = wrapindex(i + offset, var_e0d75123860c4962.size);
            targetteam = var_e0d75123860c4962[var_8f632e019ead6a8b].team;
            if (isdefined(self.teamlist[targetteam])) {
                continue;
            }
            targetpos = var_e0d75123860c4962[var_8f632e019ead6a8b].pos;
            var_1a840fba6c86ae3f = var_e0d75123860c4962[i].pos;
            if (distance(targetpos, var_1a840fba6c86ae3f) > maxdist) {
                continue;
            }
            var_925b356f96c01616 = spawnstruct();
            var_925b356f96c01616.targetedby = targetteam;
            var_925b356f96c01616.targeting = targetteam;
            self.teamlist[hunterteam] = var_925b356f96c01616;
            var_1494fc5165320c85 = spawnstruct();
            var_1494fc5165320c85.targetedby = hunterteam;
            var_1494fc5165320c85.targeting = hunterteam;
            self.teamlist[targetteam] = var_1494fc5165320c85;
            continue;
        }
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf7
// Size: 0xd0
function allassassin_teams() {
    time = gettime();
    teams = [];
    foreach (team, data in level.teamdata) {
        if (isdefined(self.teamlist[team])) {
            continue;
        }
        lastmissionendtime = self.lastmissionendtime[team];
        if (isdefined(lastmissionendtime) && time < lastmissionendtime + self.resttimems) {
            continue;
        }
        if (!isteamvalid(team, getfilterformodifier(self.modifier))) {
            continue;
        }
        teams[teams.size] = team;
    }
    return teams;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dcf
// Size: 0x37
function allassassin_oninstanceremoved(instance) {
    instance waittill("removed");
    self.lastmissionendtime[instance.hunterteam] = gettime();
    self notify("update");
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0d
// Size: 0x56
function allassassin_updatewait() {
    var_e9d45f780d45651f = getdvarint(@"hash_8292c07abd783b9b", 10);
    while (1) {
        waittill_notify_or_timeout("update", var_e9d45f780d45651f);
        if (self.modifier == "_all_timed") {
            allassassin_update_timed();
        } else {
            allassassin_update();
        }
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6a
// Size: 0xe0
function allassassin_update_timed() {
    var_a489651f714e2632 = [];
    foreach (team, var_368ae33cb19f91f8 in self.teamlist) {
        if (!isdefined(level.questinfo.quests["assassination"].instances[team])) {
            var_a489651f714e2632[var_a489651f714e2632.size] = team;
        }
    }
    foreach (team in var_a489651f714e2632) {
        self.teamlist[team] = undefined;
    }
    allassassin_initteamlist_timed();
    allassassin_applyquest();
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f51
// Size: 0x385
function allassassin_update() {
    var_a489651f714e2632 = [];
    foreach (team, var_368ae33cb19f91f8 in self.teamlist) {
        if (!isdefined(level.questinfo.quests["assassination"].instances[team])) {
            if (var_368ae33cb19f91f8.targeting == var_368ae33cb19f91f8.targetedby) {
                var_a489651f714e2632[var_a489651f714e2632.size] = team;
            }
        }
    }
    foreach (team in var_a489651f714e2632) {
        self.teamlist[team] = undefined;
    }
    var_f17a683b71e14ab7 = allassassin_teams();
    var_d94fd49d5e466dae = var_f17a683b71e14ab7.size;
    var_a489651f714e2632 = [];
    foreach (team, var_368ae33cb19f91f8 in self.teamlist) {
        if (!isteamvalid(team, getfilterformodifier(self.modifier))) {
            if (var_d94fd49d5e466dae > 0) {
                var_d94fd49d5e466dae--;
                var_27eced4b9943a2dd = var_f17a683b71e14ab7[var_d94fd49d5e466dae];
                self.teamlist[var_27eced4b9943a2dd] = spawnstruct();
                self.teamlist[var_27eced4b9943a2dd].targeting = var_368ae33cb19f91f8.targeting;
                self.teamlist[var_27eced4b9943a2dd].targetedby = var_368ae33cb19f91f8.targetedby;
                self.teamlist[var_368ae33cb19f91f8.targetedby].targeting = var_27eced4b9943a2dd;
                self.teamlist[var_368ae33cb19f91f8.targeting].targetedby = var_27eced4b9943a2dd;
            } else {
                self.teamlist[var_368ae33cb19f91f8.targetedby].targeting = var_368ae33cb19f91f8.targeting;
                self.teamlist[var_368ae33cb19f91f8.targeting].targetedby = var_368ae33cb19f91f8.targetedby;
            }
            var_a489651f714e2632[var_a489651f714e2632.size] = team;
        }
    }
    foreach (team in var_a489651f714e2632) {
        self.teamlist[team] = undefined;
    }
    if (var_d94fd49d5e466dae >= 2) {
        for (i = 0; i < var_d94fd49d5e466dae; i++) {
            team = var_f17a683b71e14ab7[i];
            prev = wrapindex(i - 1, var_d94fd49d5e466dae);
            next = wrapindex(i + 1, var_d94fd49d5e466dae);
            targetedby = var_f17a683b71e14ab7[prev];
            targeting = var_f17a683b71e14ab7[next];
            teaminfo = spawnstruct();
            teaminfo.targetedby = targetedby;
            teaminfo.targeting = targeting;
            self.teamlist[team] = teaminfo;
        }
    }
    if (self.teamlist.size < 2) {
        return;
    }
    allassassin_applyquest();
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32dd
// Size: 0x109
function allassassin_applyquest() {
    foreach (team, var_368ae33cb19f91f8 in self.teamlist) {
        if (isdefined(level.questinfo.quests["assassination"].instances[team])) {
            continue;
        }
        hunter = team;
        target = var_368ae33cb19f91f8.targeting;
        id = "all_" + hunter + "_" + target;
        instance = givequest(hunter, target, id, undefined, self.modifier);
        if (isdefined(instance)) {
            instance givequestsplash();
            if (self.modifier == "_all_timed") {
                instance thread allassassin_updatecircle();
            }
            thread allassassin_oninstanceremoved(instance);
        }
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ed
// Size: 0x87
function allassassin_updatecircle() {
    self endon("removed");
    var_80d667631e622ea2 = getdvarfloat(@"hash_5052e7021a993bb7", 10);
    var_68c8cdb264cbd6df = getdvarfloat(@"hash_60dd91fcd2553058", 1);
    while (1) {
        aq_questthink_circleposition();
        determinetrackingcircleposition(self.targetplayer);
        frac = getquesttimefrac();
        delta = var_80d667631e622ea2 - var_68c8cdb264cbd6df;
        wait(delta * frac + var_68c8cdb264cbd6df);
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347b
// Size: 0x2b
function allassassin_teamcompare(left, right) {
    return left.sortvalue <= right.sortvalue;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ae
// Size: 0xa8
function allassassin_timeout_end(team) {
    var_ebf3dc022eccfe21 = namespace_4bc0ead8d2af3d84::getvalidplayersinarray(getteamdata(team, "players"));
    foreach (player in var_ebf3dc022eccfe21) {
        if (isalive(player)) {
            player kill(player.origin, player);
        }
    }
    displayteamsplash(team, "br_assassination_timer_expire_hunters_lose");
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("mission_ass_fail", team, 1);
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x355d
// Size: 0x1b
function wrapindex(index, maxindex) {
    return (index % maxindex + maxindex) % maxindex;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3580
// Size: 0x1b
function disableteamkillrewards() {
    getquestdata("assassination").disableteamrewards = 1;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35a2
// Size: 0x1b
function disableplayerkillrewards() {
    getquestdata("assassination").disableplayerrewards = 1;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35c4
// Size: 0x32
function checkifteamrewardsareenabled() {
    return isdefined(getquestdata("assassination").disableteamrewards) && getquestdata("assassination").disableteamrewards;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35fe
// Size: 0x32
function checkifplayerrewardsareenabled() {
    return isdefined(getquestdata("assassination").disableplayerrewards) && getquestdata("assassination").disableplayerrewards;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3638
// Size: 0x69
function getquesttimefrac() {
    /#
        function_d2caa40694d469ab();
    #/
    var_89cad6e3da206570 = getquestdata("assassination").questbasetimer;
    timeremaining = (self.missiontime - gettime()) / 1000;
    frac = clamp(timeremaining / var_89cad6e3da206570, 0, 1);
    return frac;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a9
// Size: 0x87
function getcirclesize() {
    /#
        function_d2caa40694d469ab();
    #/
    if (self.modifier == "_all_timed") {
        var_2d901c509015e202 = getdvarfloat(@"hash_5dfb0eef997d40f", 3000);
        var_9b491929f64dd317 = getdvarfloat(@"hash_1be2f04ad5c56c28", 200);
        frac = getquesttimefrac();
        delta = var_2d901c509015e202 - var_9b491929f64dd317;
        return (delta * frac + var_9b491929f64dd317);
    } else {
        return 2000;
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3737
// Size: 0x27
function getcirclerangemin() {
    /#
        function_d2caa40694d469ab();
    #/
    if (self.modifier == "_all_timed") {
        return 0;
    } else {
        return 100;
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3765
// Size: 0x3f
function getcirclerangemax() {
    /#
        function_d2caa40694d469ab();
    #/
    if (self.modifier == "_all_timed") {
        var_6e831c5902e07b4c = getcirclesize();
        return (var_6e831c5902e07b4c * 0.5);
    } else {
        return 900;
    }
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ab
// Size: 0x6d
function gametypeoverrideassassinsearchparams() {
    var_9254fe14251c6557 = 0;
    gametype = getsubgametype();
    switch (gametype) {
    case #"hash_59b8e9d05b31ff9":
    case #"hash_5e78ea9021845d4a":
    case #"hash_8299694594ab149d":
    case #"hash_83058a20a2b7cb50":
    case #"hash_bfabc434c59611fa":
        var_9254fe14251c6557 = 1;
        break;
    }
    return var_9254fe14251c6557;
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3820
// Size: 0x22a
function function_dd49e0165f8b8c5d() {
    /#
        level notify("hunter");
        level endon("hunter");
        if (istrue(level.var_dd49e0165f8b8c5d)) {
            level.var_dd49e0165f8b8c5d = 0;
            return;
        }
        level.var_dd49e0165f8b8c5d = 1;
        while (1) {
            foreach (instance in level.questinfo.quests["success"].instances) {
                foreach (hunter in getteamdata(instance.hunterteam, "all_")) {
                    target = instance.targetplayer;
                    start = hunter.origin;
                    end = target.origin;
                    fwd = end - start;
                    var_46f432042b3473d8 = length(fwd);
                    fwd = vectornormalize(fwd);
                    leftdir = vectorcross(fwd, (0, 0, 1));
                    line(start, end, (1, 0, 0), 1);
                    size = 30;
                    left = end + (leftdir - fwd) * size;
                    right = left - leftdir * 2 * size;
                    line(left, right, (1, 0, 0), 1);
                    line(left, end, (1, 0, 0), 1);
                    line(right, end, (1, 0, 0), 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_dad6d813fbbde071/namespace_94f9b19ae91ab934
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a51
// Size: 0x8b
function function_5f352fb76c54705c() {
    quests = getquestdata("assassination");
    if (!isdefined(quests)) {
        return 0;
    }
    foreach (instance in quests.instances) {
        if (instance.targetteam == self.team) {
            return 1;
        }
    }
    return 0;
}

