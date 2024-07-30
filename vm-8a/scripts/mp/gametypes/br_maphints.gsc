#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;

#namespace br_maphints;

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0xb1
function init() {
    if (getdvarint(@"hash_5420f6cdc8c693d3", 1) == 0) {
        return;
    }
    level.maphints = [];
    level.maphints["keypads"] = [];
    level.maphints["phones"] = [];
    level.maphints["computers"] = [];
    level thread onplayerconnect();
    level thread init_season3_intel_challenges();
    if (scripts\cp_mp\utility\game_utility::getmapname() == "mp_br_mechanics") {
        initlocs_test();
    } else {
        initlocs_computer();
    }
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("maphint_computer", &maphint_computerscriptableused);
    if (false) {
        level thread maphint_debugthink();
    }
    /#
        level thread function_49a09152c5d422b();
    #/
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x313
// Size: 0x36b
function initlocs_keypads() {
    level.maphints["keypads"] = [];
    level.maphints["keypads"][0] = spawnstruct();
    level.maphints["keypads"][0].origin = (-17261, -44265, 40);
    level.maphints["keypads"][1] = spawnstruct();
    level.maphints["keypads"][1].origin = (-37520, -19013, 237);
    level.maphints["keypads"][2] = spawnstruct();
    level.maphints["keypads"][2].origin = (-39523, -2395, 30);
    level.maphints["keypads"][3] = spawnstruct();
    level.maphints["keypads"][3].origin = (-38640, -1902, -103);
    level.maphints["keypads"][4] = spawnstruct();
    level.maphints["keypads"][4].origin = (-15513, 43307, 105);
    level.maphints["keypads"][5] = spawnstruct();
    level.maphints["keypads"][5].origin = (2495, 41096, 1670);
    level.maphints["keypads"][6] = spawnstruct();
    level.maphints["keypads"][6].origin = (47600, 34582, 500);
    level.maphints["keypads"][7] = spawnstruct();
    level.maphints["keypads"][7].origin = (18622, -34634, -478);
    level.maphints["keypads"][8] = spawnstruct();
    level.maphints["keypads"][8].origin = (54279, -33994, 173);
    level.maphints["keypads"][9] = spawnstruct();
    level.maphints["keypads"][9].origin = (36350, 13586, 26);
    level.maphints["keypads"][10] = spawnstruct();
    level.maphints["keypads"][10].origin = (37390, 13383, -117);
    foreach (index, hint in level.maphints["keypads"]) {
        level.maphints["keypads"][index].scriptable = spawnscriptable("maphint_keypad", hint.origin);
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x686
// Size: 0x97
function initlocs_phones() {
    level.maphints["phones"] = [];
    foreach (index, hint in level.maphints["phones"]) {
        level.maphints["phones"][index].scriptable = spawnscriptable("maphint_phone", hint.origin);
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x725
// Size: 0x263
function initlocs_computer() {
    level.maphints["computers"] = [];
    level.maphints["computers"][0] = spawnstruct();
    level.maphints["computers"][0].origin = (8490, -11874, -239);
    level.maphints["computers"][1] = spawnstruct();
    level.maphints["computers"][1].origin = (-14585, 7982, -175);
    level.maphints["computers"][2] = spawnstruct();
    level.maphints["computers"][2].origin = (-34140, 3815, -55);
    level.maphints["computers"][3] = spawnstruct();
    level.maphints["computers"][3].origin = (5358, 51419, 1080);
    level.maphints["computers"][4] = spawnstruct();
    level.maphints["computers"][4].origin = (51078, -39445, 1125);
    level.maphints["computers"][5] = spawnstruct();
    level.maphints["computers"][5].origin = (17796, -8300, 1349);
    level.maphints["computers"][6] = spawnstruct();
    level.maphints["computers"][6].origin = (37275, -26745, -472);
    foreach (index, hint in level.maphints["computers"]) {
        level.maphints["computers"][index].scriptable = spawnscriptable("maphint_computer", hint.origin);
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x990
// Size: 0x119
function initlocs_radio() {
    level.maphints["radios"] = [];
    level.maphints["radios"][0] = spawnstruct();
    level.maphints["radios"][0].origin = (-21440, 19434, -252);
    level.maphints["radios"][1] = spawnstruct();
    level.maphints["radios"][1].origin = (2896, 45445, 1630);
    foreach (index, hint in level.maphints["radios"]) {
        level.maphints["radios"][index].scriptable = spawnscriptable("maphint_radio", hint.origin);
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xab1
// Size: 0x49
function maphint_keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    assert(part == "maphint_keypad");
    level thread _maphint_keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb02
// Size: 0x70
function _maphint_keypadscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    if (state == "on") {
        playsoundatpos(player.origin, "br_keypad_deny");
        instance setscriptablepartstate("maphint_keypad", "off");
        wait 3;
        instance setscriptablepartstate("maphint_keypad", "on");
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb7a
// Size: 0x49
function maphint_phonescriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    assert(part == "maphint_phone");
    level thread _maphint_phonescriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcb
// Size: 0x70
function _maphint_phonescriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    if (state == "on") {
        playsoundatpos(player.origin, "br_phone_deny");
        instance setscriptablepartstate("maphint_phone", "off");
        wait 3;
        instance setscriptablepartstate("maphint_phone", "on");
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc43
// Size: 0x51
function maphint_computerscriptableused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    assert(part == "maphint_computer");
    level thread _maphint_computerscriptableused(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9c
// Size: 0x70
function _maphint_computerscriptableused(instance, part, state, player, var_a5b2c541413aa895) {
    if (state == "on") {
        playsoundatpos(player.origin, "br_computer_deny");
        instance setscriptablepartstate("maphint_computer", "off");
        wait 3;
        instance setscriptablepartstate("maphint_computer", "on");
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd14
// Size: 0x2f3
function initlocs_test() {
    wait 5;
    level.maphints["keypads"] = [];
    level.maphints["keypads"][0] = spawnstruct();
    level.maphints["keypads"][0].origin = (-237, -2721, 60);
    level.maphints["keypads"][1] = spawnstruct();
    level.maphints["keypads"][1].origin = (-237, -2721, 260);
    foreach (hint in level.maphints["keypads"]) {
        item = spawnscriptable("maphint_keypad", hint.origin);
    }
    level.maphints["phones"] = [];
    level.maphints["phones"][0] = spawnstruct();
    level.maphints["phones"][0].origin = (-21, -2721, 60);
    level.maphints["phones"][1] = spawnstruct();
    level.maphints["phones"][1].origin = (-21, -2721, 260);
    foreach (hint in level.maphints["phones"]) {
        item = spawnscriptable("maphint_phone", hint.origin);
    }
    level.maphints["computers"] = [];
    level.maphints["computers"][0] = spawnstruct();
    level.maphints["computers"][0].origin = (100, -2721, 60);
    level.maphints["computers"][1] = spawnstruct();
    level.maphints["computers"][1].origin = (100, -2721, 260);
    foreach (hint in level.maphints["computers"]) {
        item = spawnscriptable("maphint_computer", hint.origin);
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100f
// Size: 0x1db
function maphint_debugthink() {
    var_ba3bef4f8e6e3086 = 1;
    while (true) {
        if (var_ba3bef4f8e6e3086) {
            foreach (hint in level.maphints["phones"]) {
                thread scripts\mp\utility\debug::drawsphere(hint.scriptable.origin, 64, 1, (0, 1, 0));
            }
        }
        if (getdvarint(@"hash_87c1bbd83c66bfc9", 0) == 1) {
            foreach (hint in level.maphints["keypads"]) {
                hint.scriptable freescriptable();
            }
            foreach (hint in level.maphints["phones"]) {
                hint.scriptable freescriptable();
            }
            foreach (hint in level.maphints["computers"]) {
                hint.scriptable freescriptable();
            }
            initlocs_keypads();
            initlocs_phones();
            initlocs_computer();
        }
        wait 1;
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f2
// Size: 0x558
function init_season3_intel_challenges() {
    level.intelchallengesdata = [];
    gameflaginit("intel_challenges_setup_complete", 0);
    currentweek = getdvarint(@"hash_67078a9b140dd8a0", 0);
    for (row = 0; true; row++) {
        ref = tablelookupbyrow("mp/intel_challenges.csv", row, 0);
        if (!isdefined(ref) || ref == "") {
            break;
        }
        ingame = int(tablelookupbyrow("mp/intel_challenges.csv", row, 2));
        week = int(tablelookupbyrow("mp/intel_challenges.csv", row, 1));
        if (week > currentweek && getdvarint(@"hash_253f01d86ed6f6e4", 0) == 0) {
            row++;
            continue;
        }
        backendevent = tablelookupbyrow("mp/intel_challenges.csv", row, 3);
        modelpart = tablelookupbyrow("mp/intel_challenges.csv", row, 4);
        originx = float(tablelookupbyrow("mp/intel_challenges.csv", row, 5));
        originy = float(tablelookupbyrow("mp/intel_challenges.csv", row, 6));
        originz = float(tablelookupbyrow("mp/intel_challenges.csv", row, 7));
        origin = (originx, originy, originz);
        anglesx = float(tablelookupbyrow("mp/intel_challenges.csv", row, 8));
        anglesy = float(tablelookupbyrow("mp/intel_challenges.csv", row, 9));
        anglesz = float(tablelookupbyrow("mp/intel_challenges.csv", row, 10));
        angles = (anglesx, anglesy, anglesz);
        data = spawnstruct();
        data.ref = ref;
        data.ingame = ingame;
        data.week = week;
        data.backendevent = backendevent;
        data.modelpart = modelpart;
        data.origin = origin;
        data.scriptables = [];
        var_3d25a0d4510e22c2 = 0;
        if (ingame && !var_3d25a0d4510e22c2) {
            instance = spawnscriptable("intel", origin, angles);
            instance.datakey = ref;
            data.scriptables[0] = instance;
        }
        level.intelchallengesdata[ref] = data;
    }
    ref = "ch_intel_season3_2_7";
    if (isdefined(level.intelchallengesdata[ref])) {
        origin = (-14280, -15350, -199);
        angles = (0, 0, 0);
        instance = spawnscriptable("intel", origin, angles);
        instance.datakey = ref;
        level.intelchallengesdata[ref].scriptables[level.intelchallengesdata[ref].scriptables.size] = instance;
    }
    ref = "ch_intel_season3_5_5";
    if (isdefined(level.intelchallengesdata[ref])) {
        origin = (-25767, -31548, 1595);
        angles = (0, 0, 0);
        instance = spawnscriptable("intel", origin, angles);
        instance.datakey = ref;
        level.intelchallengesdata[ref].scriptables[level.intelchallengesdata[ref].scriptables.size] = instance;
        origin = (14607, 15419, 1914);
        angles = (0, 0, 0);
        instance = spawnscriptable("intel", origin, angles);
        instance.datakey = ref;
        level.intelchallengesdata[ref].scriptables[level.intelchallengesdata[ref].scriptables.size] = instance;
        level.intelchallengesdata[ref].collectall = 1;
    }
    ref = "ch_intel_7_6";
    if (isdefined(level.intelchallengesdata[ref])) {
        origin = (31519, -444, 38);
        angles = (0, 0, 0);
        instance = spawnscriptable("intel", origin, angles);
        instance.datakey = ref;
        level.intelchallengesdata[ref].scriptables[level.intelchallengesdata[ref].scriptables.size] = instance;
        origin = (31514, -333, 38);
        angles = (0, 0, 0);
        instance = spawnscriptable("intel", origin, angles);
        instance.datakey = ref;
        level.intelchallengesdata[ref].scriptables[level.intelchallengesdata[ref].scriptables.size] = instance;
        level.intelchallengesdata[ref].collectall = 1;
    }
    level thread assignscriptablemodels();
    scripts\engine\scriptable::scriptable_addusedcallback(&intelused);
    gameflagset("intel_challenges_setup_complete");
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1752
// Size: 0xd6
function assignscriptablemodels() {
    wait 1;
    foreach (key, entry in level.intelchallengesdata) {
        if (!entry.ingame) {
            continue;
        }
        foreach (instance in level.intelchallengesdata[key].scriptables) {
            instance setscriptablepartstate("model", entry.modelpart);
        }
    }
}

/#

    // Namespace br_maphints / scripts\mp\gametypes\br_maphints
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1830
    // Size: 0x1c3
    function function_49a09152c5d422b() {
        gameflagwait("<dev string:x1c>");
        while (true) {
            if (getdvarint(@"hash_253f01d86ed6f6e4", 0) == 1) {
                foreach (key, entry in level.intelchallengesdata) {
                    if (!entry.ingame) {
                        continue;
                    }
                    foreach (instance in level.intelchallengesdata[key].scriptables) {
                        thread scripts\cp_mp\utility\debug_utility::drawsphere(instance.origin, 16, level.framedurationseconds, (1, 0, 0));
                        print3d(instance.origin, key, (1, 1, 1), 1, 1, level.frameduration);
                    }
                    if (level.intelchallengesdata[key].scriptables.size == 0) {
                        origin = entry.origin + (0, 0, 36);
                        thread scripts\cp_mp\utility\debug_utility::drawsphere(origin, 16, level.framedurationseconds, (1, 0, 0));
                        print3d(origin, key, (1, 1, 1), 1, 1, level.frameduration);
                    }
                }
            }
            waitframe();
        }
    }

#/

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19fb
// Size: 0x74
function showintelscriptablestoplayer(player, key) {
    foreach (instance in level.intelchallengesdata[key].scriptables) {
        instance enablescriptableplayeruse(player);
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a77
// Size: 0x74
function hideintelscriptablesfromplayer(player, key) {
    foreach (instance in level.intelchallengesdata[key].scriptables) {
        instance disablescriptableplayeruse(player);
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1af3
// Size: 0x26
function onplayerconnect() {
    while (true) {
        player = level waittill("connected");
        player thread assignintelchallenges();
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b21
// Size: 0x265
function assignintelchallenges() {
    self endon("disconnect");
    foreach (key, entry in level.intelchallengesdata) {
        if (!entry.ingame) {
            continue;
        }
        hideintelscriptablesfromplayer(self, key);
    }
    self.activeintelchallengekeys = [];
    if (getdvarint(@"hash_253f01d86ed6f6e4", 0) == 1) {
        allsteps = [];
        foreach (key, entry in level.intelchallengesdata) {
            if (!entry.ingame) {
                continue;
            }
            allsteps[allsteps.size] = key;
        }
        self.activeintelchallengekeys = allsteps;
    } else {
        currentweek = 3001;
        firstfound = undefined;
        foreach (key, entry in level.intelchallengesdata) {
            if (entry.week < currentweek) {
                continue;
            }
            if (currentweek < entry.week) {
                currentweek = entry.week;
            }
            if (isdefined(firstfound) && firstfound < entry.week) {
                firstfound = undefined;
            }
            completed = self getplayerdata(level.var_5d69837cf4db0407, "missionComplete", key);
            if (!isdefined(firstfound) && !completed) {
                firstfound = entry.week;
                currentweek++;
                self.activeintelchallengekeys[self.activeintelchallengekeys.size] = key;
            }
        }
    }
    gameflagwait("prematch_done");
    foreach (key, entry in level.intelchallengesdata) {
        if (!entry.ingame) {
            continue;
        }
        if (array_contains(self.activeintelchallengekeys, key)) {
            showintelscriptablestoplayer(self, key);
        }
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8e
// Size: 0x1e9
function intelused(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (isdefined(instance) && isdefined(instance.type) && instance.type == "intel") {
        cancollect = 1;
        if (!array_contains(player.activeintelchallengekeys, instance.datakey)) {
            cancollect = 0;
        }
        if (instance.datakey == "ch_intel_season3_2_5") {
            if (!player scripts\mp\utility\perk::_hasperk("specialty_hack")) {
                cancollect = 0;
                playsoundatpos(player.origin, "br_computer_deny");
            }
        }
        if (cancollect) {
            if (istrue(level.intelchallengesdata[instance.datakey].collectall)) {
                if (!isdefined(player.pers[instance.datakey])) {
                    player.pers[instance.datakey] = 1;
                } else {
                    player.pers[instance.datakey]++;
                }
                count = level.intelchallengesdata[instance.datakey].scriptables.size;
                if (player.pers[instance.datakey] < count) {
                    instance disablescriptableplayeruse(player);
                    player playsoundtoplayer("ui_intel_interact", player);
                    return;
                }
            }
            hideintelscriptablesfromplayer(player, instance.datakey);
            player reportchallengeuserevent("collect_item", level.intelchallengesdata[instance.datakey].backendevent);
            player playsoundtoplayer("ui_intel_interact", player);
        }
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f7f
// Size: 0x35
function isplayeronintelchallenge(player, ref) {
    return isdefined(player.activeintelchallengekeys) && array_contains(player.activeintelchallengekeys, ref);
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fbd
// Size: 0x9f
function markintelwithrecondrone(droneowner, ent) {
    teammates = scripts\mp\utility\teams::getfriendlyplayers(droneowner.team, 0);
    foreach (player in teammates) {
        if (isplayeronintelchallenge(player, ent.datakey)) {
            intelused(ent.scriptable, undefined, undefined, player);
        }
    }
}

// Namespace br_maphints / scripts\mp\gametypes\br_maphints
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2064
// Size: 0xac
function function_511e2c2a5399f0d9() {
    level endon("game_ended");
    while (true) {
        data = self waittill("emp_applied");
        teammates = scripts\mp\utility\teams::getfriendlyplayers(data.attacker, 0);
        foreach (player in teammates) {
            if (isplayeronintelchallenge(player, self.datakey)) {
                intelused(self.scriptable, undefined, undefined, player);
            }
        }
    }
}

