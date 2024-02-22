// mwiii decomp prototype
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\class.gsc;

#namespace namespace_9d0f8a9d932ed5e3;

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x8fc
// Size: 0x26e
function infil_add(type, subtype, var_f30fd2e505c341c8, var_aa0773494f0d374d, var_8ee2ef1b890c0c7b, spawn_func, var_1fc48c4b6e73e047, player_func) {
    if (!issharedfuncdefined("infil", "get_all_infils")) {
        namespace_3c37cb17ade254d::registersharedfunc("infil", "get_all_infils", &get_all_infils);
    }
    while (!isdefined(level.teamnamelist)) {
        waitframe();
    }
    if (!isdefined(game["infil"])) {
        foreach (team in level.teamnamelist) {
            game["infil"][team] = [];
        }
        game["infil"][0] = [];
    }
    if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        var_95ddbb3c67af3dde = get_all_infils(type);
        foreach (infil in var_95ddbb3c67af3dde) {
            if (infil.name == subtype) {
                if (isdefined(infil.script_label) && infil.script_label == level.localeid) {
                    break;
                }
            }
        }
    }
    if (isdefined(game["infil"][0][type]) && isdefined(game["infil"][0][type][subtype])) {
        if (isdefined(game["infil"][0][type][subtype][6])) {
            self [[ game["infil"][0][type][subtype][6] ]](type, subtype);
        }
        return;
    }
    game["infil"][0][type][subtype] = [];
    game["infil"][0][type][subtype][0] = spawn_func;
    game["infil"][0][type][subtype][1] = player_func;
    game["infil"][0][type][subtype][2] = var_1fc48c4b6e73e047;
    game["infil"][0][type][subtype][3] = var_f30fd2e505c341c8;
    game["infil"][0][type][subtype][4] = var_aa0773494f0d374d;
    game["infil"][0][type][subtype][5] = var_8ee2ef1b890c0c7b;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb71
// Size: 0x34
function infil_is_interactive() {
    if (!isdefined(level.interactiveinfil)) {
        level.interactiveinfil = getdvarint(@"hash_bafe5b24255dff94", 0) == 1;
    }
    return level.interactiveinfil;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbad
// Size: 0x6e3
function infil_init() {
    /#
        level thread function_8bce6c2b9dfce133();
        level thread function_dea41b0700c91408();
        level thread function_5761b0a20863c59e();
    #/
    level.var_cac1c5779002911a = getdvarint(@"hash_1b3b51b6f9a78f94", 3);
    level.var_333fbccf73785411 = getdvarint(@"hash_c33a1ba677b4aee9", 3);
    level.var_c96464f39952b78a = &function_c96464f39952b78a;
    if (level.rankedmatch && !isdedicatedserver()) {
        game["infil"] = undefined;
        gameflagset("infil_setup_complete");
        return;
    }
    if (game["roundsPlayed"] > 0 && !namespace_36f464722d326bbe::function_8b6131109e66d962() || getdvarint(@"hash_7194076ab4888f2b", 0) == 1 || namespace_36f464722d326bbe::isbrstylegametype() || getdvarint(@"hash_704afe6f6c582ee0") < 15 || getgametype() == "war" && namespace_36f464722d326bbe::isdonetskmap()) {
        game["infil"] = undefined;
        level.requiredplayercount["allies"] = 0;
        level.requiredplayercount["axis"] = 0;
        gameflagset("infil_setup_complete");
        return;
    } else if (namespace_36f464722d326bbe::function_8b6131109e66d962()) {
        game["infil"] = undefined;
        level.var_d0074a54d755766b = 1;
        setdvar(@"hash_c653d32c30815d2b", 5);
    }
    if (!isdefined(level.prematchperiodend) || level.prematchperiodend == 0) {
        game["infil"] = undefined;
        gameflagset("infil_setup_complete");
        return;
    }
    while (!isdefined(level.teamnamelist)) {
        waitframe();
    }
    if (namespace_d576b6dc7cef9c62::shouldmodelognotify()) {
        logstring("IWH-315293: ALBACORE: level.teamNameList while finished");
    }
    waitframe();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    /#
        setdevdvarifuninitialized(@"hash_e6526b9ef05103ad", -1);
        setdevdvarifuninitialized(@"hash_9d06e62e59d8f04a", 0);
        setdevdvarifuninitialized(@"hash_f711f210f6ffd355", 0);
        setdevdvarifuninitialized(@"hash_911d1dbce0b52bb1", 0);
        setdevdvarifuninitialized(@"hash_4c2539684478a68e", "sd");
        setdevdvarifuninitialized(@"hash_1f7e93431ff79c39", "sd");
    #/
    level.prematchallowfunc = &infil_player_allow;
    var_ba9a385288d1a919 = undefined;
    level.infilsactive = 0;
    var_8fd71ce382f455a2 = [];
    foreach (var_d78ffd67f2183062 in get_all_infils()) {
        type = var_d78ffd67f2183062.script_noteworthy;
        subtype = var_d78ffd67f2183062.name;
        if (!var_d78ffd67f2183062 infil_is_gamemode()) {
            continue;
        }
        if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
            jumpiffalse(var_d78ffd67f2183062.name == subtype) LOC_0000034f;
            jumpiffalse(!isdefined(var_d78ffd67f2183062.script_label) || var_d78ffd67f2183062.script_label != level.localeid) LOC_0000034f;
        } else {
        LOC_0000034f:
            if (level.mapname == "mp_wartorn" && getgametype() == "rescue") {
                var_d78ffd67f2183062.script_team = getotherteam(var_d78ffd67f2183062.script_team)[0];
            }
            team = var_d78ffd67f2183062.script_team;
            if (!array_contains(var_8fd71ce382f455a2, team)) {
                var_8fd71ce382f455a2[var_8fd71ce382f455a2.size] = team;
            }
        }
    }
    if (var_8fd71ce382f455a2.size == level.teamnamelist.size) {
        foreach (var_d78ffd67f2183062 in get_all_infils()) {
            type = var_d78ffd67f2183062.script_noteworthy;
            subtype = var_d78ffd67f2183062.name;
            if (!var_d78ffd67f2183062 infil_is_gamemode()) {
                continue;
            }
            if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
                jumpiffalse(var_d78ffd67f2183062.name == subtype) LOC_00000461;
                jumpiffalse(!isdefined(var_d78ffd67f2183062.script_label) || var_d78ffd67f2183062.script_label != level.localeid) LOC_00000461;
            } else {
            LOC_00000461:
                if (var_d78ffd67f2183062 infil_has_map_config()) {
                    infil_init_spawn_selection();
                }
                if (var_d78ffd67f2183062 infil_is_type(type) && var_d78ffd67f2183062 infil_is_subtype(subtype) && isgameplayteam(var_d78ffd67f2183062.script_team)) {
                    level.infilsactive++;
                    var_643bcfec059b4ae2 = game["infil"][0][type][subtype];
                    originalsubtype = subtype;
                    var_6b997733c80961c4 = subtype;
                    if (issubstr(var_6b997733c80961c4, "alpha")) {
                        var_6b997733c80961c4 = "alpha";
                    }
                    if (issubstr(var_6b997733c80961c4, "bravo")) {
                        var_6b997733c80961c4 = "bravo";
                    }
                    if (!isdefined(var_643bcfec059b4ae2)) {
                        var_643bcfec059b4ae2 = game["infil"][0][type][var_6b997733c80961c4];
                    }
                    infil_ent = var_d78ffd67f2183062 [[ var_643bcfec059b4ae2[0] ]](var_d78ffd67f2183062.script_team, var_d78ffd67f2183062.target, var_6b997733c80961c4, originalsubtype);
                    infil_ent.players = [];
                    infil_ent.type = type;
                    infil_ent.originalsubtype = originalsubtype;
                    infil_ent.subtype = var_6b997733c80961c4;
                    infil_ent.infillength = infil_ent [[ var_643bcfec059b4ae2[2] ]](originalsubtype);
                    if (!isdefined(var_ba9a385288d1a919) || var_ba9a385288d1a919 < infil_ent.infillength) {
                        var_ba9a385288d1a919 = infil_ent.infillength;
                    }
                    team = var_d78ffd67f2183062.script_team;
                    if (getdvarint(@"hash_ac31997b109b6bc5", 0) == 1) {
                        team = getenemyteams(team)[0];
                    }
                    game["infil"][team][1][type][subtype] = infil_ent;
                    register_infil_spots(team, infil_ent, var_643bcfec059b4ae2[3], var_643bcfec059b4ae2[4], var_643bcfec059b4ae2[5], var_643bcfec059b4ae2[1]);
                }
            }
        }
    }
    if (gamehasinfil() && isdefined(var_ba9a385288d1a919)) {
        level thread onplayerspawned();
        level thread function_3c075bf6eade7262();
        level.prematchperiod = getdvarint(@"hash_c653d32c30815d2b", 15);
        level.matchcountdowntime = level.prematchperiod + level.var_cac1c5779002911a + level.var_333fbccf73785411;
        level.prematchperiodend = var_ba9a385288d1a919 + level.var_cac1c5779002911a + level.var_333fbccf73785411;
        level.var_2a15d29e8890b785 = 0;
        thread namespace_d576b6dc7cef9c62::matchstarttimer("match_starting_in", level.prematchperiod + level.prematchperiodend);
        level thread infil_setup_ui();
        level thread infil_wait_for_players();
        level thread waitandunloadinfils();
        gameflagset("infil_will_run");
    }
    gameflagset("infil_setup_complete");
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1297
// Size: 0x2e
function onplayerspawned() {
    level endon("infil_started");
    while (1) {
        player = level waittill("player_spawned");
        player thread waitforstreamsynccomplete();
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12cc
// Size: 0x1d5
function waitforstreamsynccomplete() {
    level endon("infil_started");
    self endon("death_or_disconnect");
    gameflagwait("infil_setup_complete");
    if (istrue(level.var_2a15d29e8890b785)) {
        return;
    }
    if (isdefined(self.team)) {
        if (gameflag("infil_will_run") && !gameflag("prematch_done")) {
            var_ba487744c1313b1f = (0, 0, 0);
            count = 0;
            if (isdefined(game["infil"]) && isdefined(game["infil"][self.team]) && isdefined(game["infil"][self.team][1])) {
                foreach (array in game["infil"][self.team][1]) {
                    foreach (ent in array) {
                        var_ba487744c1313b1f = var_ba487744c1313b1f + ent.origin;
                        count++;
                    }
                }
            }
            if (count > 0) {
                var_ba487744c1313b1f = var_ba487744c1313b1f / count;
            }
            self function_b88c89bb7cd1ab8e(var_ba487744c1313b1f);
        }
    }
    while (!istrue(namespace_3c5a4254f2b957ea::getpersstat("streamSyncComplete"))) {
        waitframe();
    }
    var_be4fbabeafb491a7 = get_spot_from_player(self, getotherteam(self.team)[0]);
    if (isdefined(var_be4fbabeafb491a7)) {
        player_free_spot(self, getotherteam(self.team)[0]);
    }
    player_join_infil();
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a8
// Size: 0x3e
function onplayerdisconnect(player) {
    if (!isdefined(player.infil)) {
        return;
    }
    if (gameflag("prematch_done")) {
        return;
    }
    player_free_spot(player, player.team);
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ed
// Size: 0x3f
function onplayerchangeteams() {
    level endon("prematch_over");
    self endon("player_free_spot");
    team = self.team;
    waittill_any_2("joined_team", "joined_spectators");
    player_free_spot(self, team);
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1533
// Size: 0x32
function get_all_infils(var_643bcfec059b4ae2) {
    if (isdefined(var_643bcfec059b4ae2)) {
        return getstructarray(var_643bcfec059b4ae2, "script_noteworthy");
    } else {
        return getstructarray("mp_infil", "targetname");
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156c
// Size: 0x17
function infil_is_type(var_643bcfec059b4ae2) {
    return self.script_noteworthy == var_643bcfec059b4ae2;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158b
// Size: 0x17
function infil_is_subtype(var_d099b99a4515f378) {
    return self.name == var_d099b99a4515f378;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15aa
// Size: 0x4d1
function infil_is_gamemode() {
    /#
        if (getdvarint(@"hash_2bc5d2ec9043a3f5", 0) == 1) {
            return 1;
        }
        type = self.script_noteworthy;
        team = self.script_team;
        allies = getdvar(@"hash_4c2539684478a68e", "sd");
        axis = getdvar(@"hash_1f7e93431ff79c39", "sd");
        if (team == "crouch" && allies != "sd") {
            return (allies == type);
        }
        if (team == "slide" && axis != "sd") {
            return (axis == type);
        }
    #/
    if (!isdefined(self.spawnflags) || self.spawnflags == 0) {
        return 0;
    }
    if (!level.teambased) {
        return 0;
    }
    if (getdvarint(@"hash_78fc5b05aefc64a", 1) == 1 && level.mapname == "mp_jup_grandprix_pm_2") {
        return 0;
    }
    if (self.spawnflags & 1) {
        switch (level.mapname) {
        case #"hash_1ab428ea9c0ee9e5":
            if (level.gametype == "sd") {
                return 0;
            }
            break;
        case #"hash_d8bbcfc499e70e6f":
            if (level.gametype == "sd") {
                return 0;
            }
            break;
        case #"hash_9c2fdccb75b37f7e":
            if (level.gametype == "dd") {
                return 0;
            }
            break;
        case #"hash_ae56d5b65ad78351":
            if (level.gametype == "sd" || level.gametype == "rescue") {
                return 0;
            }
            break;
        }
        return 1;
    }
    if (self.spawnflags & 2) {
        switch (level.gametype) {
        case #"hash_7485fa6c474ec865":
        case #"hash_8c758b84936e8d42":
        case #"hash_c3668076a0827ce0":
        case #"hash_ea061d29bbd1f237":
        case #"hash_ec24570718a340f5":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 4) {
        switch (level.gametype) {
        case #"hash_fa0ed2f6bd4f4395":
        case #"hash_fa50b0f6bd82e972":
        case #"hash_fa50baf6bd82f930":
            if (level.mapname == "mp_petrograd" || level.mapname == "mp_piccadilly") {
                return 0;
                goto LOC_00000275;
            }
            return 1;
        case #"hash_ec086b911c1011ec":
        LOC_00000275:
            return 1;
            break;
        }
    }
    if (self.spawnflags & 8) {
        switch (level.gametype) {
        case #"hash_53825b446469ac4c":
        case #"hash_f4a9126c03d3385b":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 16) {
        switch (level.gametype) {
        case #"hash_6efb0f59a62300fb":
        case #"hash_dd5b900f435d3f36":
        case #"hash_ec72fd25bbbac99e":
        case #"hash_fa34c5f6bd6d4432":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 32) {
        switch (level.gametype) {
        case #"hash_1a5d186c17c00d3c":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 64) {
        switch (level.gametype) {
        case #"hash_eb5e5f470e0c1dc2":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 128) {
        switch (level.gametype) {
        case #"hash_1e4846dca3ccf38":
        case #"hash_ca6516c10db2c95":
        case #"hash_1aac086c17fe5ccb":
        case #"hash_5e78ea9021845d4a":
        case #"hash_7f9c384a34cc392f":
        case #"hash_9a6f07d0214a87db":
        case #"hash_c065cef60f38490a":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 256) {
        switch (level.gametype) {
        case #"hash_973d1db8b6644466":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 512) {
        switch (level.gametype) {
        case #"hash_a1313b745c17c07e":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 1024) {
        switch (level.gametype) {
        case #"hash_e6d4de8be88215fc":
            return 1;
            break;
        }
    }
    if (self.spawnflags & 2048) {
        switch (level.gametype) {
        case #"hash_4d60179017f5a28a":
            return 1;
            break;
        }
    }
    return 0;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a83
// Size: 0x4
function infil_has_map_config() {
    return 0;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8f
// Size: 0x3
function infil_init_spawn_selection() {
    
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a99
// Size: 0x191
function infil_player_allow(allow, bypass) {
    if (self ishost() && getdvarint(@"hash_f711f210f6ffd355") == 1) {
        if (!allow) {
            val::set("infil_player", "weapon", 0);
        } else {
            val::function_c9d0b43701bdba00("infil_player");
        }
        return;
    }
    if (!teamhasinfil(self.team) && !istrue(bypass)) {
        namespace_99ac021a7547cae3::playerprematchallow(allow);
        return;
    }
    if (!allow) {
        val::set("infil_player", "allow_movement", 0);
        val::set("infil_player", "prone", 0);
        val::set("infil_player", "crouch", 0);
        val::set("infil_player", "allow_jump", 0);
        val::set("infil_player", "fire", 0);
        val::set("infil_player", "ads", 0);
        val::set("infil_player", "sprint", 0);
        val::set("infil_player", "melee", 0);
        val::set("infil_player", "lean", 0);
        val::set("infil_player", "slide", 0);
        val::set("infil_player", "offhand_weapons", 0);
        val::set("infil_player", "weapon_switch", 0);
        val::set("infil_player", "usability", 0);
    } else {
        val::function_c9d0b43701bdba00("infil_player");
    }
    /#
        println(self.name + "Trying to take a spot that is outside of the range of spots we can offer!" + allow);
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c31
// Size: 0x216
function register_infil_spots(team, infil, amount, required, var_30ec18a4c33af064, var_f3f5ef500adac836) {
    if (!isdefined(game["infil"][team][0])) {
        game["infil"][team][0] = [];
    }
    startindex = game["infil"][team][0].size;
    for (i = 0; i < amount; i++) {
        index = game["infil"][team][0].size;
        if (isdefined(var_30ec18a4c33af064)) {
            var_b8eb6872ce4193f8 = 0;
            foreach (priority, seats in var_30ec18a4c33af064) {
                foreach (seat in seats) {
                    if (seat == index - startindex) {
                        game["infil"][team][0][index][3] = priority;
                        var_b8eb6872ce4193f8 = 1;
                        break;
                    }
                }
                if (var_b8eb6872ce4193f8) {
                    break;
                }
            }
        } else {
            game["infil"][team][0][index][3] = -1;
        }
        game["infil"][team][0][index][0] = i;
        game["infil"][team][0][index][1] = infil;
        game["infil"][team][0][index][2] = var_f3f5ef500adac836;
    }
    if (!istrue(level.requiredplayercountoveride)) {
        level.requiredplayercount[team] = level.requiredplayercount[team] + required;
    }
    /#
        if (getdvarint(@"hash_911d1dbce0b52bb1") > 0) {
            level.requiredplayercount[team] = getdvarint(@"hash_911d1dbce0b52bb1");
        }
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4e
// Size: 0xc3
function player_on_spot(player, var_e4b9cd561c7c0de6) {
    if (!isdefined(game["infil"][player.team][0])) {
        /#
            assertmsg("Trying to take a spot when there are no spots in existence!");
        #/
    }
    if (!isdefined(game["infil"][player.team][0][var_e4b9cd561c7c0de6])) {
        /#
            assertmsg("Trying to take a spot that is outside of the range of spots we can offer!");
        #/
    }
    if (isdefined(game["infil"][player.team][0][var_e4b9cd561c7c0de6][4])) {
        /#
            assertmsg("You are placing a SECOND player in the same spot! BAD!");
        #/
    }
    game["infil"][player.team][0][var_e4b9cd561c7c0de6][4] = player;
    return game["infil"][player.team][0][var_e4b9cd561c7c0de6];
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f19
// Size: 0xdb
function player_free_spot(player, team) {
    player setclientomnvar("ui_player_in_infil", 0);
    if (!isdefined(team)) {
        team = player.team;
    }
    if (!isdefined(game["infil"][team][0])) {
        /#
            assertmsg("Trying to free a spot when there are no spots in existence!");
        #/
    }
    foreach (key, spot in game["infil"][team][0]) {
        if (is_spot_taken(team, key) && spot[4] == player) {
            game["infil"][team][0][key][4] = undefined;
            player notify("player_free_spot");
            return;
        }
    }
    /#
        assertmsg("Tried to remove a player who was NOT added to any infils on this team!");
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ffb
// Size: 0x24
function get_player_at_spot(team, var_e4b9cd561c7c0de6) {
    return game["infil"][team][0][var_e4b9cd561c7c0de6][4];
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2027
// Size: 0x9b
function get_spot_from_player(player, team) {
    if (!isdefined(team)) {
        team = player.team;
    }
    if (!isdefined(game["infil"][team][0])) {
        return undefined;
    }
    foreach (i, spot in game["infil"][team][0]) {
        if (isdefined(spot[4]) && spot[4] == player) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ca
// Size: 0x61
function is_spot_taken(team, var_e4b9cd561c7c0de6) {
    if (!isdefined(game["infil"][team][0])) {
        /#
            assertmsg("Trying to take a spot when there are no spots in existence!");
        #/
    }
    if (!isdefined(game["infil"][team][0][var_e4b9cd561c7c0de6])) {
        /#
            assertmsg("Trying to take a spot that is outside of the range of spots we can offer!");
        #/
    }
    return isdefined(game["infil"][team][0][var_e4b9cd561c7c0de6][4]);
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2133
// Size: 0x93
function get_spot_taken_count(team) {
    if (!isdefined(game["infil"][team][0])) {
        /#
            assertmsg("Trying to count spots when there are no spots in existence!");
        #/
    }
    count = 0;
    foreach (key, spot in game["infil"][team][0]) {
        if (is_spot_taken(team, key)) {
            count++;
        }
    }
    return count;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ce
// Size: 0x157
function get_spot_by_priority(team) {
    var_f9b2403b4571d886 = [];
    foreach (key, spot in game["infil"][team][0]) {
        if (!is_spot_taken(team, key)) {
            var_f9b2403b4571d886[var_f9b2403b4571d886.size] = key;
        }
    }
    if (var_f9b2403b4571d886.size == 0) {
        return undefined;
    }
    var_2849f873df400420 = getdvarint(@"hash_e6526b9ef05103ad", -1);
    if (array_contains(var_f9b2403b4571d886, var_2849f873df400420)) {
        return var_2849f873df400420;
    }
    spots = [];
    var_5c49327452ef41bb = -1;
    foreach (spot in var_f9b2403b4571d886) {
        priority = game["infil"][team][0][spot][3];
        if (spots.size == 0 || priority < var_5c49327452ef41bb) {
            spots = [];
            spots[spots.size] = spot;
            var_5c49327452ef41bb = priority;
        } else if (priority == var_5c49327452ef41bb) {
            spots[spots.size] = spot;
        }
    }
    return spots[randomint(spots.size)];
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x232d
// Size: 0x18e
function get_spot_in_lane(team) {
    while (!isdefined(self.forcedavailablespawnlocation)) {
        waitframe();
    }
    prefix = ter_op(team == "allies", "a", "b") + getsubstr(self.forcedavailablespawnlocation, 5, 6);
    var_f9b2403b4571d886 = [];
    foreach (key, spot in game["infil"][team][0]) {
        if (issubstr(spot[1].lane, prefix) && !is_spot_taken(team, key)) {
            var_f9b2403b4571d886[var_f9b2403b4571d886.size] = key;
        }
    }
    if (var_f9b2403b4571d886.size == 0) {
        return undefined;
    }
    spots = [];
    var_5c49327452ef41bb = -1;
    foreach (spot in var_f9b2403b4571d886) {
        priority = game["infil"][team][0][spot][3];
        if (spots.size == 0 || priority < var_5c49327452ef41bb) {
            spots = [];
            spots[spots.size] = spot;
            var_5c49327452ef41bb = priority;
        } else if (priority == var_5c49327452ef41bb) {
            spots[spots.size] = spot;
        }
    }
    return spots[randomint(spots.size)];
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24c3
// Size: 0xe5
function get_random_spot(team) {
    var_f9b2403b4571d886 = [];
    foreach (key, spot in game["infil"][team][0]) {
        if (!is_spot_taken(team, key)) {
            var_f9b2403b4571d886[var_f9b2403b4571d886.size] = key;
        }
    }
    if (var_f9b2403b4571d886.size == 0) {
        return undefined;
    }
    spot = random(var_f9b2403b4571d886);
    /#
        var_2849f873df400420 = getdvarint(@"hash_e6526b9ef05103ad", -1);
        if (var_2849f873df400420 == -2) {
            if (array_contains(var_f9b2403b4571d886, 0)) {
                return 0;
            } else if (array_contains(var_f9b2403b4571d886, 2)) {
                return 2;
            } else {
                return spot;
            }
        } else if (array_contains(var_f9b2403b4571d886, var_2849f873df400420)) {
            spot = var_2849f873df400420;
        }
    #/
    return spot;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25b0
// Size: 0x87
function get_taken_spot_count(team) {
    if (!isdefined(game["infil"][team][0])) {
        return 0;
    }
    count = 0;
    foreach (key, spot in game["infil"][team][0]) {
        if (is_spot_taken(team, key)) {
            count++;
        }
    }
    return count;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x263f
// Size: 0x98
function get_taken_spot_percent(team) {
    if (!isdefined(game["infil"][team][0])) {
        return 0;
    }
    total = 0;
    count = 0;
    foreach (key, spot in game["infil"][team][0]) {
        total++;
        if (is_spot_taken(team, key)) {
            count++;
        }
    }
    return count / total;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26df
// Size: 0xa2
function get_random_spot_in_infil(team, infil) {
    var_f9b2403b4571d886 = [];
    foreach (key, spot in game["infil"][team][0]) {
        if (key["infil"] != infil) {
            continue;
        }
        if (!is_spot_taken(team, key)) {
            var_f9b2403b4571d886[var_f9b2403b4571d886.size] = key;
        }
    }
    if (var_f9b2403b4571d886.size == 0) {
        return undefined;
    }
    spot = random(var_f9b2403b4571d886);
    return spot;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2789
// Size: 0x4d
function infil_player_array_handler(player) {
    self endon("death");
    self.players = array_add(self.players, player);
    player waittill("death_or_disconnect");
    self.players = array_remove(self.players, player);
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27dd
// Size: 0x13c
function player_join_infil() {
    if (gameflag("infil_started")) {
        return;
    }
    if (game["infil"][self.team].size == 0) {
        return;
    }
    if (self ishost() && getdvarint(@"hash_f711f210f6ffd355") == 1) {
        player_ai_fill();
        return;
    }
    var_ad497b2f2391dfe1 = 0;
    var_47691436552ac69 = game["infil"][self.team][0][0][3] != -1;
    if (var_ad497b2f2391dfe1) {
        var_e4b9cd561c7c0de6 = get_spot_taken_count(self.team);
    } else if (var_47691436552ac69) {
        var_e4b9cd561c7c0de6 = get_spot_by_priority(self.team);
    } else {
        var_e4b9cd561c7c0de6 = get_random_spot(self.team);
    }
    if (!isdefined(var_e4b9cd561c7c0de6)) {
        return;
    }
    spot = player_on_spot(self, var_e4b9cd561c7c0de6);
    spot[1] thread infil_player_array_handler(self);
    self notify("player_added_to_infil");
    self.infil = spot[1];
    self thread [[ spot[2] ]](spot[1], spot[0]);
    self setclientomnvar("ui_player_in_infil", 1);
    thread onplayerchangeteams();
    thread clearinfilstateatinfilend();
    player_ai_fill();
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2920
// Size: 0x3f
function clearinfilstateatinfilend() {
    self endon("death_or_disconnect");
    level waittill("prematch_done");
    self setcinematicmotionoverride("iw9_playermotion");
    result = 0;
    while (!result) {
        result = self setdemeanorviewmodel("normal");
        waitframe();
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2966
// Size: 0x27
function blockswaploadouts() {
    self endon("disconnect");
    self.delayswaploadout = 1;
    level waittill("prematch_over");
    self.delayswaploadout = 0;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2994
// Size: 0xde
function player_ai_fill() {
    /#
        if (self ishost() && getdvarint(@"hash_9d06e62e59d8f04a") == 1) {
            var_734654199c0e8131 = level.requiredplayercount[self.team] - 1;
            if (getdvarint(@"hash_f711f210f6ffd355") == 1) {
                var_734654199c0e8131 = level.requiredplayercount[self.team];
            }
            if (var_734654199c0e8131 > 0) {
                level thread [[ level.bot_funcs["unloaded"] ]](var_734654199c0e8131, self.team);
            }
            var_686c4d2d362a5d2b = getotherteam(self.team)[0];
            if (level.requiredplayercount[var_686c4d2d362a5d2b] > 0) {
                level thread [[ level.bot_funcs["unloaded"] ]](level.requiredplayercount[var_686c4d2d362a5d2b], var_686c4d2d362a5d2b);
            }
        }
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a79
// Size: 0x1fc
function infil_setup_ui() {
    setomnvar("ui_in_infil", 3);
    level waittill("infil_started");
    ui_always_show_nameplates = getomnvar("ui_always_show_nameplates");
    setomnvar("ui_always_show_nameplates", 1);
    /#
        setdevdvar(@"hash_d45a3508858994dc", 0);
    #/
    if (!isdefined(level.bypassclasschoicefunc)) {
        setomnvarforallclients("ui_skip_loadout", 0);
        level.bypassclasschoicefunc = undefined;
    }
    level thread infil_show_countdown();
    cg_drawcrosshair = getdvarint(@"hash_5d474d39e096f8f1");
    cg_drawcrosshairnames = getdvarint(@"hash_f17e1982c2ef27b");
    var_c3f949f19ad560e2 = getdvarint(@"hash_721a6fa1822b17d9");
    setdvar(@"hash_5d474d39e096f8f1", 0);
    setdvar(@"hash_f17e1982c2ef27b", 1);
    setdvar(@"hash_721a6fa1822b17d9", 1);
    level waittill("prematch_done");
    var_ae38d1b160669269 = namespace_7e17181d03156026::alwaysshowminimap();
    foreach (player in level.players) {
        if (var_ae38d1b160669269) {
            if (issharedfuncdefined("player", "showMiniMap")) {
                player [[ getsharedfunc("player", "showMiniMap") ]]();
            }
        } else if (issharedfuncdefined("player", "hideMiniMap")) {
            player [[ getsharedfunc("player", "hideMiniMap") ]]();
        }
    }
    setomnvar("ui_in_infil", -1);
    setomnvar("ui_always_show_nameplates", ui_always_show_nameplates);
    setdvar(@"hash_5d474d39e096f8f1", cg_drawcrosshair);
    setdvar(@"hash_f17e1982c2ef27b", cg_drawcrosshairnames);
    setdvar(@"hash_721a6fa1822b17d9", var_c3f949f19ad560e2);
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7c
// Size: 0x3b
function infil_show_countdown() {
    waittime = level.prematchperiodend - level.var_333fbccf73785411 - 5;
    wait(waittime);
    setomnvar("ui_in_infil", 2);
    level notify("infil_countdown_show");
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cbe
// Size: 0xe2
function alwaysgamemodeclass() {
    clantag = self getclantag();
    if (clantag == "AR") {
        class = "default1";
    } else if (clantag == "SMG") {
        class = "default2";
    } else if (clantag == "LMG") {
        class = "default3";
    } else {
        var_5570cb3187dba152 = [];
        var_5570cb3187dba152[0] = "default1";
        var_5570cb3187dba152[1] = "default2";
        var_5570cb3187dba152[2] = "default3";
        class = random(var_5570cb3187dba152);
    }
    self.pers["class"] = class;
    self.pers["lastClass"] = "";
    self.class = self.pers["class"];
    self.lastclass = self.pers["lastClass"];
    return class;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2da8
// Size: 0x1ce
function infil_player_rig(animname, var_486db5fa512a3b6b, var_40a4287d8d2e7ef9) {
    self.animname = animname;
    player_rig = spawn("script_model", (0, 0, 0));
    player_rig.player = self;
    self.player_rig = player_rig;
    self.player_rig setmodel(var_486db5fa512a3b6b);
    self.player_rig hide();
    self.player_rig.animname = animname;
    self.player_rig useanimtree(%script_model);
    self.player_rig.weapon_state_func = &handleweaponstatenotetrack;
    self.player_rig.cinematic_motion_override = &handlecinematicmotionnotetrack;
    self.player_rig.dof_func = &handledofnotetrack;
    self playerlinktodelta(self.player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
    /#
        println("," + self.name + "<unknown string>" + animname + "<unknown string>" + isdefined(self.player_rig));
    #/
    if (isdefined(var_40a4287d8d2e7ef9) && var_40a4287d8d2e7ef9) {
        self playersetgroundreferenceent(self.player_rig);
    }
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (isdefined(self)) {
        /#
            println("<unknown string>" + self.name + "<unknown string>" + animname + "<unknown string>" + isdefined(self.player_rig));
        #/
        if (isdefined(var_40a4287d8d2e7ef9) && var_40a4287d8d2e7ef9) {
            self playersetgroundreferenceent(undefined);
        }
        self unlink();
    }
    if (isdefined(player_rig)) {
        player_rig delete();
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7d
// Size: 0x72
function infil_play_sound_func(alias, notification, var_9a0afe8ff3d2508f) {
    foreach (player in self.players) {
        player playsoundtoplayer(alias, player);
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff6
// Size: 0xd2
function infil_wait_for_players() {
    level endon("game_ended");
    level endon("force_end");
    level waittill("match_start_real_countdown");
    setomnvar("ui_in_infil", 1);
    level.var_2a15d29e8890b785 = 1;
    wait(level.var_cac1c5779002911a);
    gameflagset("infil_started");
    if (getdvarint(@"hash_837a5e61131f5464", 0) == 1) {
        level thread manageinteractiveslowmo();
    }
    if (getdvarint(@"hash_f84371d2f3a2a3ac", 0) == 1) {
        foreach (player in level.players) {
            iprintlnbold("!-!-!-!-!-INFIL BEGIN-!-!-!-!-!");
        }
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30cf
// Size: 0x7f
function heli_path(vehicle) {
    if (!isdefined(vehicle)) {
        vehicle = self;
        /#
            assertex(self.code_classname == "script_vehicle", "Tried to do goPath on a non-vehicle");
        #/
    }
    vehicle endon("death");
    if (isdefined(vehicle.hasstarted)) {
        /#
            println("<unknown string>");
        #/
        return;
    } else {
        vehicle.hasstarted = 1;
    }
    vehicle script_delay();
    vehicle notify("start_vehiclepath");
    vehicle notify("start_dynamicpath");
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3155
// Size: 0x30f
function vehicle_paths_helicopter(node, var_269fb0ec10b51524, var_cfa3aafb71b08d36) {
    /#
        assertex(isdefined(node) || isdefined(self.attachedpath), "vehicle_path() called without a path");
    #/
    self notify("newpath");
    self endon("newpath");
    self endon("death");
    if (!isdefined(var_269fb0ec10b51524)) {
        var_269fb0ec10b51524 = 0;
    }
    if (isdefined(node)) {
        self.attachedpath = node;
    }
    pathstart = self.attachedpath;
    self.currentnode = self.attachedpath;
    if (!isdefined(pathstart)) {
        return;
    }
    pathpoint = pathstart;
    if (var_269fb0ec10b51524) {
        self waittill("start_dynamicpath");
    }
    if (isdefined(var_cfa3aafb71b08d36)) {
        var_4ea3a41043b7adbc = spawnstruct();
        var_4ea3a41043b7adbc.origin = (self.origin[0], self.origin[1], self.origin[2] + var_cfa3aafb71b08d36);
        heli_wait_node(var_4ea3a41043b7adbc, undefined);
    }
    lastpoint = undefined;
    nextpoint = pathstart;
    get_func = get_path_getfunc(pathstart);
    while (isdefined(nextpoint)) {
        if (isdefined(nextpoint.script_parameters)) {
            readnodeevents(nextpoint);
        }
        if (isdefined(nextpoint.script_linkto)) {
            set_lookat_from_dest(nextpoint);
        }
        heli_wait_node(nextpoint, lastpoint, var_cfa3aafb71b08d36);
        if (!isdefined(self)) {
            return;
        }
        self.currentnode = nextpoint;
        nextpoint notify("trigger", self);
        if (isdefined(nextpoint.script_helimove)) {
            self setyawspeedbyname(nextpoint.script_helimove);
            if (nextpoint.script_helimove == "faster") {
                self setmaxpitchroll(25, 50);
            }
        }
        if (!isdefined(self)) {
            return;
        }
        if (isdefined(nextpoint.script_team)) {
            self.script_team = nextpoint.script_team;
        }
        if (isdefined(nextpoint.script_unload)) {
            self notify("unload");
            waittill_notify_or_timeout("unloaded", self.unload_time);
        }
        if (self vehicle_isphysveh()) {
            if (isdefined(nextpoint.script_pathtype)) {
                self.veh_pathtype = nextpoint.script_pathtype;
            }
        }
        if (isdefined(nextpoint.script_flag_wait)) {
            flag_wait(nextpoint.script_flag_wait);
            if (isdefined(nextpoint.script_delay_post)) {
                wait(nextpoint.script_delay_post);
            }
            self notify("delay_passed");
        }
        if (isdefined(self.set_lookat_point)) {
            self.set_lookat_point = undefined;
            self clearlookatent();
        }
        lastpoint = nextpoint;
        if (!isdefined(nextpoint.target)) {
            break;
        }
        nextpoint = [[ get_func ]](nextpoint.target);
        if (!isdefined(nextpoint)) {
            nextpoint = lastpoint;
            /#
                assertmsg("can't find nextpoint for node at origin (node targets nothing or different type?): " + lastpoint.origin);
            #/
            break;
        }
    }
    self notify("reached_dynamic_path_end");
    if (isdefined(self.script_vehicle_selfremove)) {
        self delete();
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x346b
// Size: 0x49c
function heli_wait_node(nextpoint, lastpoint, var_cfa3aafb71b08d36) {
    self endon("newpath");
    if (isdefined(nextpoint.script_unload) || isdefined(nextpoint.script_land)) {
        var_8dbf20b18391bda1 = 0;
        if (isdefined(nextpoint.script_land)) {
            ent_flag_set("landed");
            if (isdefined(self.unload_land_offset)) {
                var_8dbf20b18391bda1 = self.unload_land_offset;
            }
        } else if (isdefined(nextpoint.script_unload) && isdefined(self.unload_hover_offset)) {
            var_8dbf20b18391bda1 = self.unload_hover_offset;
        } else if (isdefined(nextpoint.script_unload) && isdefined(self.unload_hover_offset_max)) {
            var_1230ea36a300368 = utility::groundpos(nextpoint.origin);
            var_8dbf20b18391bda1 = nextpoint.origin[2] - var_1230ea36a300368[2];
            if (var_8dbf20b18391bda1 >= self.unload_hover_offset_max) {
                var_8dbf20b18391bda1 = self.unload_hover_offset_max;
            } else if (isdefined(self.unload_hover_land_height) && var_8dbf20b18391bda1 < self.unload_hover_land_height) {
                var_8dbf20b18391bda1 = self.unload_hover_land_height;
            }
        }
        nextpoint.radius = 2;
        if (isdefined(nextpoint.ground_pos)) {
            nextpoint.origin = nextpoint.ground_pos + (0, 0, var_8dbf20b18391bda1);
        } else {
            var_b48c995a0a557ff1 = utility::groundpos(nextpoint.origin) + (0, 0, var_8dbf20b18391bda1);
            if (var_b48c995a0a557ff1[2] > nextpoint.origin[2] - 2000) {
                nextpoint.origin = utility::groundpos(nextpoint.origin) + (0, 0, var_8dbf20b18391bda1);
            }
        }
        self sethoverparams(0, 0, 0);
    }
    if (isdefined(lastpoint)) {
        var_b1da74ce505dd34a = lastpoint.script_airresistance;
        speed = lastpoint.speed;
        accel = lastpoint.script_accel;
        decel = lastpoint.script_decel;
    } else {
        var_b1da74ce505dd34a = undefined;
        speed = undefined;
        accel = undefined;
        decel = undefined;
    }
    var_3e6e337291ca2a19 = isdefined(nextpoint.script_stopnode) && nextpoint.script_stopnode;
    unload = isdefined(nextpoint.script_unload);
    flag_wait = isdefined(nextpoint.script_flag_wait) && !flag(nextpoint.script_flag_wait);
    var_ccf44cff39a902f0 = !isdefined(nextpoint.target);
    var_38d31613ee1a416 = isdefined(nextpoint.script_delay);
    if (isdefined(nextpoint.angles)) {
        yaw = nextpoint.angles[1];
    } else {
        yaw = 0;
    }
    if (self.health <= 0) {
        return;
    }
    origin = nextpoint.origin;
    if (isdefined(var_cfa3aafb71b08d36)) {
        origin = (origin[0], origin[1], origin[2] + var_cfa3aafb71b08d36);
    }
    if (isdefined(self.heliheightoverride)) {
        origin = (origin[0], origin[1], self.heliheightoverride);
    }
    self vehicle_helisetai(origin, speed, accel, decel, nextpoint.script_goalyaw, nextpoint.script_anglevehicle, yaw, var_b1da74ce505dd34a, var_38d31613ee1a416, var_3e6e337291ca2a19, unload, flag_wait, var_ccf44cff39a902f0);
    if (isdefined(nextpoint.radius)) {
        self setneargoalnotifydist(nextpoint.radius);
        /#
            assertex(nextpoint.radius > 0, "radius: " + nextpoint.radius);
        #/
        waittill_any_2("near_goal", "goal");
    } else {
        self waittill("goal");
    }
    /#
        if (isdefined(nextpoint.script_flag_set)) {
            self notify("<unknown string>", nextpoint);
        } else {
            self notify("<unknown string>", nextpoint);
        }
    #/
    if (isdefined(nextpoint.script_firelink)) {
        if (!isdefined(level.helicopter_firelinkfunk)) {
            /#
                assertmsg("no Fire Link funk.. need scriptssphelicopter_globals::init_helicopters();");
            #/
        }
        thread [[ level.helicopter_firelinkfunk ]](nextpoint);
    }
    nextpoint script_delay();
    if (isdefined(self.path_gobbler)) {
        deletestruct_ref(nextpoint);
    }
    self notify("continuepath");
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x390e
// Size: 0x64
function get_path_getfunc(pathpoint) {
    get_func = &get_from_vehicle_node;
    if (isdefined(pathpoint.target)) {
        if (isdefined(get_from_entity(pathpoint.target))) {
            get_func = &get_from_entity;
        }
        if (isdefined(get_from_spawnstruct(pathpoint.target))) {
            get_func = &get_from_spawnstruct;
        }
    }
    return get_func;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x397a
// Size: 0x17
function get_from_vehicle_node(target) {
    return getvehiclenode(target, "targetname");
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3999
// Size: 0xaf
function get_from_spawnstruct(target) {
    array = getstructarray(target, "targetname");
    if (array.size == 1) {
        return array[0];
    } else {
        foreach (element in array) {
            if (isdefined(element.poi) && isdefined(self.poi) && element.poi == self.poi) {
                return element;
            }
        }
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a4f
// Size: 0x3a
function get_from_entity(target) {
    ent = getentarray(target, "targetname");
    if (isdefined(ent) && ent.size > 0) {
        return ent[randomint(ent.size)];
    }
    return undefined;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a91
// Size: 0x45
function set_lookat_from_dest(dest) {
    var_9ae5b7230af98af5 = getent(dest.script_linkto, "script_linkname");
    if (!isdefined(var_9ae5b7230af98af5)) {
        return;
    }
    self setlookatent(var_9ae5b7230af98af5);
    self.set_lookat_point = 1;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3add
// Size: 0x142
function parsehelipathlength() {
    if (!isdefined(self.path)) {
        return 0;
    }
    if (isdefined(self.pathduration)) {
        return self.pathduration;
    }
    self.pathduration = 0;
    node = self.path;
    speed = node.speed;
    while (1) {
        if (isdefined(node.script_unload)) {
            break;
        }
        if (!isdefined(node.target)) {
            break;
        }
        next = getstruct(node.target, "targetname");
        if (!isdefined(next)) {
            break;
        }
        var_9eb9e52b1dcd019d = distance(node.origin, next.origin);
        if (isdefined(node.speed)) {
            speed = node.speed;
        }
        var_965bc0eec4f74bb1 = 17.6;
        var_5df47f4f5b20f4ce = 1.1;
        self.pathduration = self.pathduration + var_9eb9e52b1dcd019d * var_5df47f4f5b20f4ce / speed * var_965bc0eec4f74bb1;
        node = next;
    }
    return self.pathduration;
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c27
// Size: 0xaa
function readnodeevents(node) {
    events = strtok(node.script_parameters, ",");
    foreach (event in events) {
        var_cbf22c9edb76e72d = strtok(event, ":");
        if (!isdefined(var_cbf22c9edb76e72d)) {
            return;
        }
        if (var_cbf22c9edb76e72d.size != 2) {
            return;
        }
        thread processtimelineevent(var_cbf22c9edb76e72d[0], float(var_cbf22c9edb76e72d[1]));
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd8
// Size: 0x197
function processtimelineevent(event, delay) {
    if (!isdefined(self.timelineevents)) {
        self.timelineevents = [];
    }
    if (delay > 0) {
        wait(delay);
    }
    switch (event) {
    case #"hash_87e3c1c2828708e4":
        self.timelineevents["shake"] = "low";
        foreach (player in self.infil.players) {
            cam_shake_low(player);
        }
        break;
    case #"hash_807169c27e9de95b":
        self.timelineevents["shake"] = "off";
        foreach (player in self.infil.players) {
            cam_shake_off(player);
        }
        break;
    case #"hash_6530846d1804e962":
        self.infil notify("event_intro");
        break;
    case #"hash_75fef6e5f328c5ba":
        self.infil notify("event_shootingWindow_open");
        break;
    case #"hash_a92b19adca4b2fbe":
        self.infil notify("event_shootingWindow_closed");
        break;
    }
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e76
// Size: 0x55
function manageinteractiveslowmo() {
    if (!isdefined(level.interactiveinfilstart) || !isdefined(level.interactiveinfilwindow)) {
        return;
    }
    wait(level.interactiveinfilstart);
    setslowmotion(1, 0.5, 1);
    wait(level.interactiveinfilwindow);
    setslowmotion(0.5, 1, 0.5);
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ed2
// Size: 0x2f
function waitandunloadinfils() {
    gameflagwait("prematch_done");
    while (level.infilsactive != 0) {
        waitframe();
    }
    unloadallinfilintrotransients();
    level notify("unload_audio_soundbank");
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f08
// Size: 0xb
function function_3c075bf6eade7262() {
    level waittill("unload_audio_soundbank");
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3f1a
// Size: 0x7b
function private function_8bce6c2b9dfce133() {
    /#
        while (1) {
            if (getdvar(@"hash_c022d48104ba5fe6", "<unknown string>") != "<unknown string>") {
                setdvar(@"hash_c022d48104ba5fe6", "<unknown string>");
                var_a43b2bb1cdc181b2 = getdvar(@"hash_c022d48104ba5fe6", "<unknown string>");
                setdvar(@"hash_1f7e93431ff79c39", var_a43b2bb1cdc181b2);
                function_2445244fc2466b13("slide");
            }
            wait(2);
        }
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3f9c
// Size: 0x7b
function private function_dea41b0700c91408() {
    /#
        while (1) {
            if (getdvar(@"hash_f6c08131f5dddab9", "<unknown string>") != "<unknown string>") {
                setdvar(@"hash_f6c08131f5dddab9", "<unknown string>");
                var_a43b2bb1cdc181b2 = getdvar(@"hash_f6c08131f5dddab9", "<unknown string>");
                setdvar(@"hash_4c2539684478a68e", var_a43b2bb1cdc181b2);
                function_2445244fc2466b13("crouch");
            }
            wait(2);
        }
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x401e
// Size: 0x6d
function private function_2445244fc2466b13(team) {
    /#
        setdvar(@"hash_aea3ac32a07685ba", team);
        setdvar(@"hash_7194076ab4888f2b", 0);
        setdvar(@"hash_c653d32c30815d2b", 15);
        setdvar(@"hash_704afe6f6c582ee0", 15);
        setdvar(@"hash_9d06e62e59d8f04a", 1);
        wait(1);
        map_restart(1);
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4092
// Size: 0x69
function private function_5761b0a20863c59e() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        level.var_61d21e3699d0f0bc = 0;
        while (level.var_61d21e3699d0f0bc == 0) {
            if (getdvarint(@"hash_d8f31feda870cbf8", 0) == 1 && level.var_61d21e3699d0f0bc == 0) {
                level.var_61d21e3699d0f0bc = 1;
                level thread function_5221e837bcffc1b7();
                return;
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4102
// Size: 0x1bf
function private function_5221e837bcffc1b7() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        iprintlnbold("<unknown string>");
        level.var_e6fbdd8917189dfb = 0;
        level.var_114dd6baa6068929 = 0;
        setdvar(@"hash_7194076ab4888f2b", 0);
        setdvar(@"hash_c653d32c30815d2b", 15);
        setdvar(@"hash_704afe6f6c582ee0", 15);
        hostplayer = namespace_d576b6dc7cef9c62::gethostplayer();
        if (!isdefined(hostplayer)) {
            return;
        }
        while (1) {
            if (getdvarint(@"hash_8f57a5a96fe91b32", 1) == 0) {
                function_dc2f945aa7bdd07a();
            } else if (hostplayer buttonpressed("<unknown string>")) {
                setdvar(@"hash_7194076ab4888f2b", 0);
                setdvar(@"hash_c653d32c30815d2b", 15);
                setdvar(@"hash_704afe6f6c582ee0", 15);
                iprintlnbold("<unknown string>");
                wait(1);
                map_restart();
            } else if (hostplayer buttonpressed("<unknown string>")) {
                level.var_e6fbdd8917189dfb = !level.var_e6fbdd8917189dfb;
                if (level.var_e6fbdd8917189dfb == 1) {
                    iprintlnbold("<unknown string>");
                } else {
                    iprintlnbold("<unknown string>");
                }
                wait(1);
            } else if (hostplayer buttonpressed("<unknown string>")) {
                level.var_114dd6baa6068929 = !level.var_114dd6baa6068929;
                if (level.var_114dd6baa6068929 == 1) {
                    setdvar(@"hash_f711f210f6ffd355", 1);
                    iprintlnbold("<unknown string>");
                } else {
                    setdvar(@"hash_f711f210f6ffd355", 0);
                    iprintlnbold("<unknown string>");
                }
                hostplayer noclip();
                wait(1);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x42c8
// Size: 0x19
function private function_dc2f945aa7bdd07a() {
    /#
        level notify("<unknown string>");
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42e8
// Size: 0x1c
function function_d41cba513a03d958(waittime) {
    self endon("death_or_disconnect");
    wait(waittime);
    namespace_d19129e4fa5d176::blockclasschange();
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x430b
// Size: 0xf6
function function_4dca5340dfd36c76(scene_node, vehicle, waittime, animname, var_643bcfec059b4ae2) {
    if (!isdefined(scene_node) || !isdefined(scene_node.target)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    var_19b99157406b12a1 = getentarray(scene_node.target, "targetname");
    var_54b174a893636475 = scene_node.origin;
    tempangle = scene_node.angles;
    if (!isdefined(var_19b99157406b12a1[0])) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    var_19b99157406b12a1[0].canmove = 1;
    var_19b99157406b12a1[0] setscriptablepartstate("visibility", "hide", 1);
    wait(waittime);
    vehicle delete();
    var_19b99157406b12a1[0] setscriptablepartstate("visibility", "show");
}

// Namespace namespace_9d0f8a9d932ed5e3/namespace_75b74605b6915713
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x4408
// Size: 0xc6
function function_51293c8505f2ea4e(scene_node, var_2002c8640b4cc278, var_682a8f64400da11e, waittime, animname, var_643bcfec059b4ae2) {
    if (!isdefined(scene_node) || !isdefined(scene_node.target)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    var_e76285126d6054f9 = getentarray(scene_node.target, "targetname");
    if (!isdefined(var_e76285126d6054f9[0])) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    var_e76285126d6054f9[0] hide();
    var_e76285126d6054f9[1] hide();
    wait(waittime);
    var_2002c8640b4cc278 delete();
    var_682a8f64400da11e delete();
    var_e76285126d6054f9[0] show();
    var_e76285126d6054f9[1] show();
}

