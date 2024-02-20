// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\dialog.gsc;

#namespace bounty;

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7db
// Size: 0x2b6
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    level.bounty = spawnstruct();
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    level.bounty = spawnstruct();
    updategametypedvars();
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    if (getdvarint(@"hash_cd7a289c3a33ceda", 0) != 0) {
        level.onplayerkilled = &onhotfootplayerkilled;
    }
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "dx_mp_boun_game_uktl_bnt1";
    } else {
        game["dialog"]["gametype"] = "dx_mp_boun_game_uktl_bynm";
    }
    game["dialog"]["offense_obj"] = "dx_mp_boun_game_uktl_bybo";
    game["dialog"]["defense_obj"] = "dx_mp_boun_game_uktl_bybo";
    game["dialog"]["bounty_new_targets_warning"] = "dx_mp_boun_game_uktl_bytw";
    game["dialog"]["bounty_new_target"] = "dx_mp_boun_game_uktl_bynt";
    game["dialog"]["bounty_become_target"] = "dx_mp_boun_game_uktl_bybt";
    if (!isdefined(level.waypointcolors) || !isdefined(level.waypointcolors["bounty_enemy"])) {
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("bounty_enemy", 0, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_hvt_enemy", 0, undefined);
    }
    if (!isdefined(level.waypointcolors) || !isdefined(level.waypointcolors["bounty_friendly"])) {
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("bounty_friendly", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hvt_friendly", 0, 12);
    }
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    /#
        level.var_a1c387e9b8e35312 = &function_a1c387e9b8e35312;
    #/
    level thread function_c422d0209d63d82c();
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa98
// Size: 0xa8
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
    setdynamicdvar(@"hash_5d63372846c76438", getmatchrulesdata("bountyData", "hvtsPerTeam"));
    setdynamicdvar(@"hash_dd0cfb059eb759f1", getmatchrulesdata("bountyData", "pointsPerHVTKill"));
    if (getdvarint(@"hash_708473a41b11b061", 0)) {
        setdynamicdvar(@"hash_5d63372846c76438", 1);
        setdynamicdvar(@"hash_dd0cfb059eb759f1", 5);
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb47
// Size: 0x14e
function onstartgametype() {
    setclientnamemode("auto_change");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/BOUNTY");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/BOUNTY");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/BOUNTY_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/BOUNTY_HINT");
    }
    if (isdefined(level.initspawnsoverridefunc)) {
        [[ level.initspawnsoverridefunc ]]();
    } else {
        initspawns();
    }
    namespace_662734e7fa8a8b94::inittankspawns();
    if (getdvarint(@"hash_cd7a289c3a33ceda", 0) != 0) {
        thread monitorhotfoot();
    }
    /#
        thread function_8469a5927d069db7();
        if (0) {
            function_bf2918399f1800b1();
        }
    #/
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc9c
// Size: 0x130
function private function_c422d0209d63d82c() {
    level waittill("prematch_over");
    level.bounty.hvts = [];
    if (isdefined(level.scoremod) && isdefined(level.scoremod["kill"])) {
        level.bounty.pointsPerHVTKill = level.bounty.pointsPerHVTKill - level.scoremod["kill"];
        if (level.bounty.pointsPerHVTKill < 0) {
            level.bounty.pointsPerHVTKill = 0;
        }
    }
    foreach (teamname in level.teamnamelist) {
        level.bounty.hvts[teamname] = [];
    }
    wait(10);
    level thread function_daa7ba85dff31c58();
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawn);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd3
// Size: 0x110
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.bounty.hvtsPerTeam = dvarintvalue("hvtsPerTeam", 1, 1, 6);
    level.bounty.pointsPerHVTKill = dvarintvalue("pointsPerHVTKill", 5, 1, 25);
    level.bounty.warnTeamHVTChange = dvarintvalue("warnTeamHVTChange", 0, 0, 1);
    level.bounty.hvtRefreshInterval = dvarintvalue("hvtRefreshInterval", 30, 0, 120);
    level.bounty.hvtRefreshWarnTime = dvarintvalue("hvtRefreshWarnTime", 10, 0, 30);
    level.bounty.hvtMarkerPingEnabled = dvarintvalue("hvtMarkerPingEnabled", 0, 0, 1);
    level.bounty.hvtMarkerPingInterval = dvarfloatvalue("hvtMarkerPingInterval", 5, 0, 60);
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeea
// Size: 0x27a
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    } else if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("BigTDM", "Crit_Frontline");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Frontline");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_tdm_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_tdm_spawn_axis_start");
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    if (istrue(level.testtdmanywhere)) {
        x = getdvarfloat(@"hash_b6294c84c04e377b", randomfloatrange(-4096, 4096));
        y = getdvarfloat(@"hash_b6294b84c04e3548", randomfloatrange(-4096, 4096));
        z = getdvarfloat(@"hash_b6294e84c04e3be1", randomfloatrange(0, 512));
        level.mapcenter = (x, y, z);
        tdmanywhere_debugshowlocs();
    } else {
        level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x116b
// Size: 0x64
function function_a1c387e9b8e35312() {
    /#
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("defenders");
        namespace_b2d5aa2baf2b5701::function_8390bf8c3b74466a("hvtRefreshInterval");
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_axis_start");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("jup_bounty_hvt_killed_negative");
        namespace_b2d5aa2baf2b5701::registerspawnset("defenders", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("hvtRefreshInterval", var_3a5288f40c8be099);
    #/
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d6
// Size: 0x1a8
function getspawnpoint() {
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (istrue(level.testtdmanywhere)) {
        var_4a31bbf837fe3389 = level.tdmanywherefrontline.anchorrt * randomfloatrange(level.tdmanywhere_perpenoffset * -1, level.tdmanywhere_perpenoffset);
        var_fc4e89bc101f9a57 = undefined;
        if (spawnteam == "axis") {
            var_fc4e89bc101f9a57 = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset * -1;
        } else {
            var_fc4e89bc101f9a57 = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset;
        }
        spawnpoint = spawnstruct();
        spawnpoint.origin = level.mapcenter + var_4a31bbf837fe3389 + var_fc4e89bc101f9a57 + (0, 0, level.tdmanywhere_dropheight);
        spawnpoint.angles = (0, 0, 0);
        spawnpoint.index = 1;
    } else if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("normal", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "fallback");
        /#
            function_d73615f1fc12f3db(spawnpoint, spawnteam);
        #/
    }
    return spawnpoint;
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1386
// Size: 0x45
function onspawnplayer(var_9156b53bcf7ce573) {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
    if (!istrue(level.testtdmanywhere)) {
        return;
    }
    self setplayerangles(vectortoangles(level.mapcenter - self.origin));
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13d2
// Size: 0x17c
function function_d73615f1fc12f3db(spawnpoint, spawnteam) {
    /#
        if (getdvarint(@"hash_b5ceec3e3cb419be") != 0) {
            spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints(spawnteam);
            fallbackspawnpoints = [];
            var_965ef52941de8769 = namespace_90f75d3fdf89a43e::getspawnpoint_legacy(spawnpoints, fallbackspawnpoints);
            if (!isdefined(level.var_3d292942d52b104a)) {
                level.var_3d292942d52b104a = 0;
                level.var_2dc7108159dc1da3 = 0;
                level.var_a065445ba781ddf6 = 0;
            }
            level.var_3d292942d52b104a++;
            println("mp_sd_bombplanted_30_playlist_classic" + var_965ef52941de8769.index + "<unknown string>" + var_965ef52941de8769.totalscore);
            if (var_965ef52941de8769.index == spawnpoint.index) {
                level.var_2dc7108159dc1da3++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            } else {
                level.var_a065445ba781ddf6++;
                iprintlnbold("<unknown string>" + level.var_2dc7108159dc1da3 / level.var_3d292942d52b104a * 100 + "<unknown string>" + "<unknown string>" + level.var_2dc7108159dc1da3 + "<unknown string>" + level.var_3d292942d52b104a);
            }
            return var_965ef52941de8769;
        }
    #/
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1555
// Size: 0x189
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (isdefined(victim.trackedobject)) {
        namespace_5a22b6f3a56f7e9b::update_objective_state(victim.trackedobject.pingobjidnum, "invisible");
    }
    attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
    if (isdefined(victim) && namespace_3c37cb17ade254d::array_contains(level.bounty.hvts[victim.team], victim)) {
        attacker namespace_3c5a4254f2b957ea::incpersstat("hvtKills", 1);
        attacker namespace_3c5a4254f2b957ea::setextrascore0(attacker.pers["hvtKills"]);
        attacker thread namespace_48a08c5037514e04::function_e3e3e81453fd788b(#"hash_4b89b1d2e95e2012", objweapon, victim);
        attacker playlocalsound("jup_bounty_hvt_killed_positive_player");
        if (level.bounty.pointsPerHVTKill > 0) {
            namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.team, level.bounty.pointsPerHVTKill, 0);
            attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(15, level.bounty.pointsPerHVTKill);
        }
        victim playsoundtoteam("jup_bounty_hvt_killed_negative", victim.team, undefined, victim);
        victim playsoundtoteam("jup_bounty_hvt_killed_positive", getotherteam(victim.team)[0], attacker, victim);
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e5
// Size: 0x53
function ontimelimit() {
    winner = namespace_e8a49b70d0769b66::gethighestscoringteam();
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if ("tie") {
        winner = "overtime";
    }
    thread namespace_d576b6dc7cef9c62::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x173f
// Size: 0xe8
function function_8469a5927d069db7() {
    /#
        self endon("<unknown string>");
        while (1) {
            if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
                points = getdvarint(@"hash_46a6b424af6acbc2");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
                points = getdvarint(@"hash_86e14326e43c0115");
                if (points == -1) {
                    points = getdvarint(@"hash_f20234a548c56c11") - 1;
                }
                namespace_e8a49b70d0769b66::giveteamscoreforobjective("<unknown string>", points, 0);
                break;
            }
            wait(1);
        }
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
        thread function_8469a5927d069db7();
    #/
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x182e
// Size: 0x1f9
function function_bf2918399f1800b1() {
    /#
        wait(5);
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        ents = getentarray("<unknown string>", "<unknown string>");
        foreach (ent in ents) {
            thread namespace_d028276791d9cff6::drawsphere(ent.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
        structs = getstructarray("<unknown string>", "<unknown string>");
        foreach (struct in structs) {
            thread namespace_d028276791d9cff6::drawsphere(struct.origin, 64, 1000, (0, 1, 0));
        }
    #/
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2e
// Size: 0x19b
function tdmanywhere_debugshowlocs() {
    thread namespace_d028276791d9cff6::drawsphere(level.mapcenter, 128, 100, (0, 1, 0));
    if (!isdefined(level.tdmanywherefrontline)) {
        waitframe();
    }
    var_cc015915d647fbdf = level.tdmanywherefrontline.anchordir * level.tdmanywhere_distoffset;
    var_c1d9d45c8845eb82 = level.tdmanywherefrontline.anchorrt * level.tdmanywhere_perpenoffset;
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter + var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter, level.mapcenter - var_cc015915d647fbdf, 1000, (1, 0, 0));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter + var_cc015915d647fbdf, level.mapcenter + var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf + var_c1d9d45c8845eb82, 1000, (0, 0, 1));
    thread namespace_d028276791d9cff6::drawline(level.mapcenter - var_cc015915d647fbdf, level.mapcenter - var_cc015915d647fbdf - var_c1d9d45c8845eb82, 1000, (0, 0, 1));
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd0
// Size: 0x419
function monitorhotfoot() {
    level endon("game_ended");
    level.outlinedplayers = [];
    level.hotfootabsloops = 0;
    timepassed = 0;
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        foreach (player in level.players) {
            if (!isdefined(player.hotfootlastposition)) {
                player.hotfootdisttraveledsq = 0;
                player.hotfootlastposition = player.origin;
                player.abshotfootlastposition = player.origin;
            }
            player.hotfootdisttraveledsq = player.hotfootdisttraveledsq + distancesquared(player.hotfootlastposition, player.origin);
            player.hotfootlastposition = player.origin;
        }
        timepassed = timepassed + level.framedurationseconds;
        if (timepassed > 3) {
            if (level.hotfootabsloops >= 2) {
                level.hotfootabsloops = 0;
                foreach (player in level.players) {
                    if (!isdefined(player.abshotfootlastposition)) {
                        player.abshotfootlastposition = player.origin;
                    }
                    player.forceabshotfoot = distancesquared(player.abshotfootlastposition, player.origin) < 4225;
                    player.abshotfootlastposition = player.origin;
                }
            }
            foreach (player in level.players) {
                entnum = player getentitynumber();
                var_ac6ca28a64718193 = player.pers["team"];
                if (var_ac6ca28a64718193 == "allies") {
                    enemyteam = "axis";
                } else {
                    enemyteam = "allies";
                }
                if (isalive(player) && (istrue(player.forceabshotfoot) || player.hotfootdisttraveledsq < 4225 && !istrue(player.hotfootreset))) {
                    /#
                        if (istrue(player.forceabshotfoot)) {
                            player iprintlnbold("<unknown string>");
                        } else {
                            player iprintlnbold("<unknown string>");
                        }
                    #/
                    player.forceabshotfoot = 0;
                    if (!isdefined(level.outlinedplayers[entnum])) {
                        level.outlinedplayers[entnum] = player;
                        player.outlineidfriend = outlineenableforteam(player, var_ac6ca28a64718193, "outline_nodepth_orange", "level_script");
                        player.outlineidenemy = outlineenableforteam(player, enemyteam, "outline_nodepth_red", "level_script");
                        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodelenable("outlinefill_nodepth_orange", 0);
                    }
                } else {
                    if (isalive(player)) {
                        player.hotfootreset = 0;
                    }
                    player.forceabshotfoot = 0;
                    if (isdefined(level.outlinedplayers[entnum])) {
                        outlinedisable(player.outlineidfriend, player);
                        outlinedisable(player.outlineidenemy, player);
                        player namespace_cbd3754a0c69cc63::_hudoutlineviewmodeldisable();
                        player.outlineidfriend = undefined;
                        player.outlineidenemy = undefined;
                        level.outlinedplayers[entnum] = undefined;
                    }
                }
                player.hotfootdisttraveledsq = 0;
            }
            timepassed = 0;
        }
        level.hotfootabsloops++;
        waitframe();
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff0
// Size: 0xc0
function onhotfootplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    entnum = self getentitynumber();
    if (isdefined(level.outlinedplayers[entnum])) {
        outlinedisable(self.outlineidfriend, self);
        outlinedisable(self.outlineidenemy, self);
        self.outlineidfriend = undefined;
        self.outlineidenemy = undefined;
        level.outlinedplayers[entnum] = undefined;
    }
    self.hotfootreset = 1;
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20b7
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    var_f9c7aae8c6acd600 = axisscore - alliesscore;
    return var_f9c7aae8c6acd600 < 10;
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x210e
// Size: 0x1f4
function private function_daa7ba85dff31c58() {
    self endon("game_ended");
    if (!istrue(level.bounty.var_6cec5f1ba131a4b8)) {
        level.bounty.var_6cec5f1ba131a4b8 = 1;
    } else {
        return;
    }
    while (1) {
        foreach (teamname in level.teamnamelist) {
            function_73f4370f1b27931f(teamname);
        }
        if (istrue(level.bounty.warnTeamHVTChange)) {
            /#
                assertex(level.bounty.hvtRefreshInterval > level.bounty.hvtRefreshWarnTime, "runBountyTargetIntervalRefresh: HVT refresh interval must be larger than HVT refresh warning time.");
            #/
            wait(level.bounty.hvtRefreshInterval - level.bounty.hvtRefreshWarnTime);
            foreach (teamname in level.teamnamelist) {
                namespace_944ddf7b8df1b0e3::statusdialog("bounty_new_targets_warning", teamname);
                foreach (player in getteamdata(teamname, "alivePlayers")) {
                    player namespace_44abc05161e2e2cb::showsplash("bounty_hvt_warn_change");
                    player playlocalsound("jup_bounty_hvt_new_target_splash");
                }
            }
            wait(level.bounty.hvtRefreshWarnTime);
        } else {
            wait(level.bounty.hvtRefreshInterval);
        }
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2309
// Size: 0x1f3
function private function_73f4370f1b27931f(teamname, var_404cf37133ab102d) {
    var_fdca194965cd644a = [];
    players = function_4632da5fc05ba940(teamname);
    foreach (player in players) {
        if (var_fdca194965cd644a.size < level.bounty.hvtsPerTeam) {
            jumpiftrue(namespace_3c37cb17ade254d::array_contains(level.bounty.hvts[teamname], player)) LOC_000000cf;
            var_fdca194965cd644a[var_fdca194965cd644a.size] = player;
        } else {
        LOC_000000cf:
            player playlocalsound("jup_bounty_hvt_new_target_splash");
        }
    }
    namespace_944ddf7b8df1b0e3::statusdialog("bounty_new_target", teamname, undefined, var_fdca194965cd644a);
    foreach (player in level.bounty.hvts[teamname]) {
        if (isdefined(player) && !namespace_3c37cb17ade254d::array_contains(var_fdca194965cd644a, player)) {
            player thread function_ad9beb8e6a905599();
        }
    }
    foreach (player in var_fdca194965cd644a) {
        if (isdefined(player) && !namespace_3c37cb17ade254d::array_contains(level.bounty.hvts[teamname], player)) {
            player thread function_ac2690ab2da6fa();
        }
    }
    level.bounty.hvts[teamname] = var_fdca194965cd644a;
    if (!istrue(var_404cf37133ab102d)) {
        level.bounty.var_b9d8abc30e8b40b8 = gettime();
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2503
// Size: 0xc3
function private function_ac2690ab2da6fa() {
    self endon("disconnect");
    self endon("bounty_unmarked");
    self notify("bounty_marked");
    if (!namespace_7e17181d03156026::isreallyalive(self)) {
        self waittill("spawned_player");
    }
    self.nosuspensemusic = 1;
    if (getdvarint(@"hash_61e9133b2e499a6c")) {
        self setplayermusicstate("mp_sd_bombplanted_30_playlist_classic");
    } else {
        self setplayermusicstate("mp_sd_bombplanted_30_playlist");
    }
    function_2c66ae09a0a7c438();
    namespace_44abc05161e2e2cb::showsplash("bounty_hvt_marked");
    namespace_944ddf7b8df1b0e3::leaderdialogonplayer("bounty_become_target");
    self playlocalsound("jup_bounty_hvt_marked_player");
    self playsoundtoteam("jup_bounty_hvt_marked_enemy", self.team, self, self);
    self playsoundtoteam("jup_bounty_hvt_marked_team", getotherteam(self.team)[0], undefined, self);
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x25cd
// Size: 0x6a
function private function_ad9beb8e6a905599() {
    self endon("disconnect");
    self endon("bounty_marked");
    self notify("bounty_unmarked");
    self.nosuspensemusic = undefined;
    self setplayermusicstate("");
    function_605bbe56b2ce817a();
    waitframe();
    if (isplayer(self)) {
        if (!namespace_7e17181d03156026::isreallyalive(self)) {
            self waittill("spawned_player");
        }
        namespace_44abc05161e2e2cb::showsplash("bounty_hvt_unmarked");
        self playlocalsound("uin_splash_bounty_unmarked");
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x263e
// Size: 0x228
function private function_2c66ae09a0a7c438() {
    if (!isdefined(self.trackedobject)) {
        trackedobject = namespace_19b4203b51d56488::createtrackedobject(self, (0, 0, 100));
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(trackedobject.objidnum, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(trackedobject.objidnum, 0);
        trackedobject.objidpingfriendly = level.bounty.hvtMarkerPingEnabled != 0;
        trackedobject.objidpingenemy = 0;
        trackedobject.objpingdelay = level.bounty.hvtMarkerPingInterval;
        trackedobject namespace_19b4203b51d56488::setobjectivestatusicons("bounty_friendly");
        trackedobject namespace_19b4203b51d56488::setvisibleteam("friendly");
        self.trackedobject = trackedobject;
        trackedobject.pingobjidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        namespace_5a22b6f3a56f7e9b::objective_add_objective(trackedobject.pingobjidnum, "current", self.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(trackedobject.pingobjidnum, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(trackedobject.pingobjidnum, 0);
        namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(trackedobject.pingobjidnum, self.team);
        trackedobject namespace_19b4203b51d56488::updatecompassicon("enemy", trackedobject.pingobjidnum);
        namespace_5a22b6f3a56f7e9b::update_objective_icon(trackedobject.pingobjidnum, level.waypointshader["bounty_enemy"]);
        namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(trackedobject.pingobjidnum, level.waypointstring["bounty_enemy"]);
        namespace_5a22b6f3a56f7e9b::update_objective_state(trackedobject.pingobjidnum, "current");
        namespace_5a22b6f3a56f7e9b::function_79a1a16de6b22b2d(trackedobject.pingobjidnum, 0);
    } else {
        self.trackedobject namespace_19b4203b51d56488::setvisibleteam("friendly");
        namespace_5a22b6f3a56f7e9b::update_objective_state(self.trackedobject.pingobjidnum, "current");
    }
    if (!isdefined(self.var_1ea3d23e8d49bb49)) {
        self.var_1ea3d23e8d49bb49 = "prop_king_game_flag";
        self attach(self.var_1ea3d23e8d49bb49, "tag_stowed_back3", 1);
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x286d
// Size: 0x9a
function private function_605bbe56b2ce817a() {
    if (isdefined(self.trackedobject)) {
        if (isdefined(self.trackedobject.pingobjidnum)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.trackedobject.pingobjidnum);
            self.trackedobject.pingobjidnum = undefined;
        }
        self.trackedobject namespace_19b4203b51d56488::deletetrackedobject();
        self.trackedobject = undefined;
    }
    if (isdefined(self.var_1ea3d23e8d49bb49)) {
        self detach(self.var_1ea3d23e8d49bb49, "tag_stowed_back3");
        self.var_1ea3d23e8d49bb49 = undefined;
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x290e
// Size: 0x5d
function private function_7a2f8a385da422ff() {
    if (isdefined(self.var_1ea3d23e8d49bb49)) {
        attachsize = self getattachsize();
        for (i = 0; i < attachsize; i++) {
            attached = self getattachmodelname(i);
            if (attached == self.var_1ea3d23e8d49bb49) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2973
// Size: 0x5d
function private onplayerspawn() {
    if (isdefined(self.var_1ea3d23e8d49bb49) && !function_7a2f8a385da422ff()) {
        self attach(self.var_1ea3d23e8d49bb49, "tag_stowed_back3", 1);
    }
    if (isdefined(self.trackedobject)) {
        namespace_5a22b6f3a56f7e9b::update_objective_state(self.trackedobject.pingobjidnum, "current");
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x29d7
// Size: 0x11c
function private onplayerdisconnect(player) {
    if (isdefined(level.bounty.var_b9d8abc30e8b40b8) && namespace_3c37cb17ade254d::array_contains(level.bounty.hvts[player.team], player)) {
        var_29ca520a8694cd41 = level.bounty.hvtRefreshInterval * 1000;
        hvtRefreshWarnTime = level.bounty.hvtRefreshWarnTime * 1000 * level.bounty.warnTeamHVTChange;
        var_89e85c0815c992d6 = level.bounty.var_b9d8abc30e8b40b8 + var_29ca520a8694cd41 - hvtRefreshWarnTime - gettime();
        if (var_89e85c0815c992d6 > 5000) {
            function_73f4370f1b27931f(player.team, 1);
        } else {
            player thread function_ad9beb8e6a905599();
            namespace_3c37cb17ade254d::array_remove(level.bounty.hvts[player.team], player);
        }
    }
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2afa
// Size: 0x25
function private getplayerkills(player) {
    if (!isdefined(player)) {
        player = self;
    }
    return player.pers["kills"];
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2b27
// Size: 0x23
function private function_4d84c1274f53342d(var_472d4f042b732e8a, var_cb730d03142c3f30) {
    return getplayerkills(var_472d4f042b732e8a) > getplayerkills(var_cb730d03142c3f30);
}

// Namespace bounty/namespace_5b8bd7b5f1bbdbad
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2b52
// Size: 0x34
function private function_4632da5fc05ba940(teamname) {
    players = level.teamdata[teamname]["players"];
    return array_sort_with_func(players, &function_4d84c1274f53342d);
}

